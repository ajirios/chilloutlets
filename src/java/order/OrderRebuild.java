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
import java.util.ArrayList;
import stock.Stock;

/**
 *
 * @author mac
 */
public class OrderRebuild 

{
    private String json;
    private Order order;
    
    public OrderRebuild(String json)
            
    {
        this.json = json;
        
        if (json == null)
            
        {
            this.order = new Order(-1, -1);
        }
        
        else
            
        {
            if (json.equals(""))
                
            {
                this.order = new Order(-1, -1);
            }
            
            else
                
            {
                this.order = constructOrderRebuild();
            }
            
        }
        
    }
    
    private Order constructOrderRebuild()
            
    {
        Order requestedOrder = null;
        Gson gson = new Gson();
        Stock stock;
        
        int outletNumber = -1;
        int branchNumber = -1;
        int shelfNumber = -1;
        int stockNumber = -1;
        String stockName = null;
        String stockPrice = "0.00";
        String stockImage = null;
        
        long customerID = -1;
        long orderNumber = -1;
        String orderSubtotal = "0.00";
        
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
        
        stock = new Stock(outletNumber, branchNumber, shelfNumber, stockNumber, stockName, stockImage, stockPrice, "in");


        //parse out json values
        JsonArray stockArray;
        JsonObject orderJSONObject;
        JsonParser parser = new JsonParser();
        JsonElement orderElement = parser.parse(this.json);
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

            stockArray = orderJSONObject.getAsJsonArray("orderList").getAsJsonArray();
            
            ArrayList<Stock> orderList = new ArrayList<Stock>();
            
            if (stockArray != null)

            {
                
                requestedOrder = new Order(customerID, orderNumber);

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

                        //make stock and add to arraylist
                        Stock currentStock = new Stock(currentOutletNumber, currentBranchNumber, currentShelfNumber, currentStockNumber, currentStockName, currentStockImage, currentPrice, currentEntryState);
                        currentStock.setQuantity(currentQuantity);
                        
                        orderList.add(currentStock);

                    }

                }
                
                requestedOrder.setOrderList(orderList);
                requestedOrder.setCustomerID(customerID);
                requestedOrder.setOrderNumber(orderNumber);
                requestedOrder.setOrderSubtotal(orderSubtotal);
                requestedOrder.setOrderGST(orderGST);
                requestedOrder.setOrderPST(orderPST);
                requestedOrder.setOrderTotal(orderTotal);
                requestedOrder.setPaidAmount(paidAmount);
                requestedOrder.setOrderNetworkFee(orderNetworkFee);
                requestedOrder.setOrderTransitFee(orderTransitFee);
                requestedOrder.setOrderTip(orderTip);
                requestedOrder.setOrderVoucher(orderVoucher);
                requestedOrder.setGroceryCut(groceryCut);
                requestedOrder.setOverlimitCut(overlimitCut);
                
            }

        }
        
        return requestedOrder;
    }

    public String getJson() 
    
    {
        return json;
    }

    public void setJson(String json) 
    
    {
        this.json = json;
    }

    public Order getOrder() 
    
    {
        return order;
    }

    public void setOrder(Order order) 
    
    {
        this.order = order;
    }
    
    public Stock getStock(int count)
            
    {
        return null;
    }
    
}
