/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import stock.Stock;
import outlet.OutletReceiver;

/**
 *
 * @author mac
 */
@WebServlet(name = "OrderSessionServlet", urlPatterns = {"/OrderSessionServlet"})
public class OrderSessionServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderSessionServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderSessionServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    
    {
        Order order;
        Stock stock;
        int outletNumber;
        int branchNumber;
        int shelfNumber;
        int stockNumber;
        String stockName;
        String stockPrice;
        String stockImage;
        String sessionOrderList;
        String orderScript;
        
        //
        long customerID = -1;
        long orderNumber = -1;
        String orderSubtotal = "0.00";
        
        ArrayList<Stock> orderList = null;
        String paidAmount;
        String orderTotal;
        String orderGST;
        String orderPST;
        String orderNetworkFee;
        String orderTransitFee;
        String orderTip;
        String orderVoucher;
        String groceryCut;
        String overlimitCut;
        
        
        order = null;
        stock = null;
        outletNumber = -1;
        branchNumber = -1;
        shelfNumber = -1;
        stockNumber = -1;
        stockName = null;
        stockPrice = null;
        stockImage = null;
        sessionOrderList = "";
        orderScript = "";
        HttpSession session = request.getSession(true);
        
        //receive stock attributes from request
        if (request.getParameter("session-outlet-number") != null)
            
        {
            
            if (!request.getParameter("session-outlet-number").equals(""))
                
            {
                outletNumber = Integer.parseInt(request.getParameter("session-outlet-number"));
            }
            
        }
        
        if (request.getParameter("session-branch-number") != null)
            
        {
            
            if (!request.getParameter("session-branch-number").equals(""))
                
            {
                branchNumber = Integer.parseInt(request.getParameter("session-branch-number"));
            }
            
        }
        
        if (request.getParameter("session-shelf-number") != null)
            
        {
            
            if (!request.getParameter("session-shelf-number").equals(""))
                
            {
                shelfNumber = Integer.parseInt(request.getParameter("session-shelf-number"));
            }
            
        }
        
        if (request.getParameter("session-stock-number") != null)
            
        {
            
            if (!request.getParameter("session-stock-number").equals(""))
                
            {
                stockNumber = Integer.parseInt(request.getParameter("session-stock-number"));
            }
            
        }
        
        if (request.getParameter("session-stock-name") != null)
            
        {
            
            if (!request.getParameter("session-stock-name").equals(""))
                
            {
                stockName = request.getParameter("session-stock-name");
            }
            
        }
        
        if (request.getParameter("session-stock-price") != null)
            
        {
            
            if (!request.getParameter("session-stock-price").equals(""))
                
            {
                stockPrice = request.getParameter("session-stock-price");
            }
            
        }
        
        if (request.getParameter("session-stock-image") != null)
            
        {
            
            if (!request.getParameter("session-stock-image").equals(""))
                
            {
                stockImage = request.getParameter("session-stock-image");
            }
            
        }
        
        
        OutletReceiver receiver = new OutletReceiver(outletNumber, branchNumber);
        
        String outletName = receiver.getOutlet().getOutletName();
        String branchAddress = receiver.getOutlet().getBranchAddress();
        String city = receiver.getOutlet().getCity();
        String region = receiver.getOutlet().getRegion();
        String country = receiver.getOutlet().getCountry();
        String latitude = receiver.getOutlet().getLatitude();
        String longitude = receiver.getOutlet().getLongitude();
        
        
        
        
        if (session.getAttribute("order-list") == null)
            
        {
            
            //build a JSON array
            String ticketInput = null;
            Gson gson = new Gson();
            
            stock = new Stock(outletNumber, branchNumber, shelfNumber, stockNumber, stockName, stockImage, stockPrice, "in");
            
            stock.setOutletName(outletName);
            stock.setAddress(branchAddress);
            stock.setCity(city);
            stock.setRegion(region);
            stock.setCountry(country);
            stock.setLatitude(latitude);
            stock.setLongitude(longitude);
            
            String list = "<?xml version='1.0'?>\n<Order>\n";
            response.setContentType("text/xml");
            
            list += "<customerID>" + customerID + "</customerID>\n";
            list += "<orderNumber>" + orderNumber + "</orderNumber>\n";
            
            list += "<Stock>\n";
            list += "<outletNumber>" + outletNumber + "</outletNumber>\n";
            list += "<branchNumber>" + branchNumber + "</branchNumber>\n";
            list += "<shelfNumber>" + shelfNumber + "</shelfNumber>\n";
            list += "<stockNumber>" + stockNumber + "</stockNumber>\n";
            list += "<stockName>" + stockName + "</stockName>\n";
            list += "<stockImage>" + stockImage + "</stockImage>\n";
            list += "<price>" + stockPrice + "</price>\n";
            list += "<quantity>" + 1 + "</quantity>\n";
            list += "<entryState>" + "in" + "</entryState>\n";
            list += "</Stock>\n";
            
            order = new Order(customerID, orderNumber);
            order.addStock(stock);
            orderSubtotal = order.getOrderSubtotal();
            
            list += "<orderSubtotal>" + orderSubtotal + "</orderSubtotal>\n";
            list += "</Order>";
            
            //create a session order
            session.setAttribute("order", order);
            
            //stringify the array
            sessionOrderList = gson.toJson(order);
            
            //Stock restock = gson.fromJson(sessionOrderList, Stock.class);
            
            //put array string in session
            session.setAttribute("order-list", sessionOrderList);
            
            response.getWriter().write(list);
            response.setStatus(HttpServletResponse.SC_OK);
        }
        
        else
            
        {
            if (session.getAttribute("order-list").toString().equals(""))
                
            {
                
                //build a JSON array
                String ticketInput = null;
                Gson gson = new Gson();
                
                stock = new Stock(outletNumber, branchNumber, shelfNumber, stockNumber, stockName, stockImage, stockPrice, "in");
                
                stock.setOutletName(outletName);
                stock.setAddress(branchAddress);
                stock.setCity(city);
                stock.setRegion(region);
                stock.setCountry(country);
                stock.setLatitude(latitude);
                stock.setLongitude(longitude);
                
                String list = "<?xml version='1.0'?>\n<Order>\n";
                response.setContentType("text/xml");
                
                list += "<customerID>" + customerID + "</customerID>\n";
                list += "<orderNumber>" + orderNumber + "</orderNumber>\n";
                
                list += "<Stock>\n";
                list += "<outletNumber>" + outletNumber + "</outletNumber>\n";
                list += "<branchNumber>" + branchNumber + "</branchNumber>\n";
                list += "<shelfNumber>" + shelfNumber + "</shelfNumber>\n";
                list += "<stockNumber>" + stockNumber + "</stockNumber>\n";
                list += "<stockName>" + stockName + "</stockName>\n";
                list += "<stockImage>" + stockImage + "</stockImage>\n";
                list += "<price>" + stockPrice + "</price>\n";
                list += "<quantity>" + 1 + "</quantity>\n";
                list += "<entryState>" + "in" + "</entryState>\n";
                list += "</Stock>\n";
                
                order = new Order(customerID, orderNumber);
                order.addStock(stock);
                orderSubtotal = order.getOrderSubtotal();
                
                list += "<orderSubtotal>" + orderSubtotal + "</orderSubtotal>\n";
                list += "</Order>";
                
                //create a session order
                session.setAttribute("order", order);
                
                //stringify the array
                sessionOrderList = gson.toJson(order);
                
                //put the array string in session
                session.setAttribute("order-list", sessionOrderList);

                response.getWriter().write(list);
                response.setStatus(HttpServletResponse.SC_OK);
            }
            
            else
                
            {
                //rebuild the JSON array from session string
                sessionOrderList = session.getAttribute("order-list").toString();
                
                Gson gson = new Gson();
                
                stock = new Stock(outletNumber, branchNumber, shelfNumber, stockNumber, stockName, stockImage, stockPrice, "in");
                
                stock.setOutletName(outletName);
                stock.setAddress(branchAddress);
                stock.setCity(city);
                stock.setRegion(region);
                stock.setCountry(country);
                stock.setLatitude(latitude);
                stock.setLongitude(longitude);
                
                String list = "<?xml version='1.0'?>\n<Order>\n";
                response.setContentType("text/xml");
                
                //parse out json values
                JsonArray stockArray = null;
                JsonObject orderJSONObject;
                JsonParser parser = new JsonParser();
                JsonElement orderElement = parser.parse(sessionOrderList);
                //stockArray = tradeElement.getAsJsonArray();
                
                orderJSONObject = orderElement.getAsJsonObject();
                
                if (orderJSONObject != null)
                    
                {
                    customerID = Integer.parseInt(orderJSONObject.get("customerID").getAsString());
                    orderNumber = Integer.parseInt(orderJSONObject.get("orderNumber").getAsString());
                    orderSubtotal = orderJSONObject.get("orderSubtotal").getAsString();
                    paidAmount = orderJSONObject.get("paidAmount").getAsString();
                    orderGST = orderJSONObject.get("orderGST").getAsString();
                    orderPST = orderJSONObject.get("orderPST").getAsString();
                    orderTotal = orderJSONObject.get("orderTotal").getAsString();
                    orderNetworkFee = orderJSONObject.get("orderNetworkFee").getAsString();
                    orderTransitFee = orderJSONObject.get("orderTransitFee").getAsString();
                    orderTip = orderJSONObject.get("orderTip").getAsString();
                    orderVoucher = orderJSONObject.get("orderVoucher").getAsString();
                    groceryCut = orderJSONObject.get("groceryCut").getAsString();
                    overlimitCut = orderJSONObject.get("overlimitCut").getAsString();
                    
                    list += "<customerID>" + customerID + "</customerID>\n";
                    list += "<orderNumber>" + orderNumber + "</orderNumber>\n";
                    
                    stockArray = orderJSONObject.getAsJsonArray("orderList").getAsJsonArray();
                    
                    orderList = new ArrayList<Stock>();
                    
                    if (stockArray != null)
                        
                    {
                        
                        for (int count = 0; count < stockArray.size(); count++)
                            
                        {
                            JsonObject stockObject = stockArray.get(count).getAsJsonObject();
                            
                            if (stockObject != null)
                                
                            {
                                int currentOutletNumber = Integer.parseInt(stockObject.get("outletNumber").getAsString());
                                int currentBranchNumber = Integer.parseInt(stockObject.get("branchNumber").getAsString());
                                int currentStockNumber = Integer.parseInt(stockObject.get("stockNumber").getAsString());
                                int currentShelfNumber = Integer.parseInt(stockObject.get("shelfNumber").getAsString());
                                String currentStockName = stockObject.get("stockName").getAsString();
                                String currentStockImage = stockObject.get("stockImage").getAsString();
                                String currentPrice = stockObject.get("price").getAsString();
                                int currentQuantity = Integer.parseInt(stockObject.get("quantity").getAsString());
                                String currentEntryState = stockObject.get("entryState").getAsString();
                                
                                list += "<Stock>\n";
                                list += "<outletNumber>" + currentOutletNumber + "</outletNumber>\n";
                                list += "<branchNumber>" + currentBranchNumber + "</branchNumber>\n";
                                list += "<shelfNumber>" + currentShelfNumber + "</shelfNumber>\n";
                                list += "<stockNumber>" + currentStockNumber + "</stockNumber>\n";
                                list += "<stockName>" + currentStockName + "</stockName>\n";
                                list += "<stockImage>" + currentStockImage + "</stockImage>\n";
                                list += "<price>" + currentPrice + "</price>\n";
                                list += "<quantity>" + currentQuantity + "</quantity>\n";
                                list += "<entryState>" + currentEntryState + "</entryState>\n";
                                list += "</Stock>\n";
                                
                                //make stock and add to arraylist
                                Stock currentStock = new Stock(currentOutletNumber, currentBranchNumber, currentShelfNumber, currentStockNumber, currentStockName, currentStockImage, currentPrice, currentEntryState);
                                currentStock.setQuantity(currentQuantity);
                                currentStock.setOutletName(outletName);
                                currentStock.setAddress(branchAddress);
                                currentStock.setCity(city);
                                currentStock.setRegion(region);
                                currentStock.setCountry(country);
                                currentStock.setLatitude(latitude);
                                currentStock.setLongitude(longitude);
                                
                                orderList.add(currentStock);
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
                
                
                order = new Order(customerID, orderNumber);
                
                if (orderList != null)
                    
                {
                    order.setOrderList(orderList);
                }
                
                order.addStock(stock);
                orderSubtotal = order.getOrderSubtotal();
                
                list += "<orderSubtotal>" + orderSubtotal + "</orderSubtotal>\n";
                list += "</Order>";
                
                //create a session order
                session.setAttribute("order", order);
                
                //stringify the array
                sessionOrderList = gson.toJson(order);
                
                //add array string to session
                session.setAttribute("order-list", sessionOrderList);

                response.getWriter().write(list);
                response.setStatus(HttpServletResponse.SC_OK);
            }
            
        }
        
        
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
