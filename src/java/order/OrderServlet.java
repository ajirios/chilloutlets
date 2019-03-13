/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import creditcard.CreditCardRetrieve;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import stripe.StripeCharge;

/**
 *
 * @author ajirios
 */
@WebServlet(name = "OrderServlet", urlPatterns = {"/OrderServlet"})
public class OrderServlet extends HttpServlet 

{

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
            throws ServletException, IOException 
    
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
            throws ServletException, IOException 
    
    {
        //customer variables
        long customerID = 0;
        
        //stripe variables
        CreditCardRetrieve card = null;
        OrderInsert orderInsert = null;
        StripeCharge charge = null;
        int amount = 0;
        String creditCardNumber = "4242424242424240";
        int expiryMonth = 8;
        int expiryYear = 2023;
        String ccv = "902";
        
        //order construction variables
        String subtotal = null;
        String total = null;
        String gst = null;
        String pst = null;
        String techFee = null;
        String transitFee = null;
        String tip = null;
        String voucher = "0.00";
        String groceryCut = null;
        String overlimitCut = null;
        
        
        //instantiating order construction variables
        if (request.getParameter("customer-id") != null)
            
        {
            
            if (!request.getParameter("customer-id").equalsIgnoreCase(""))
                
            {
                customerID = Long.parseLong(request.getParameter("customer-id"));
            }
            
        }
        
        if (request.getParameter("total") != null)
            
        {
            
            if (!request.getParameter("total").equalsIgnoreCase(""))
                
            {
                total = request.getParameter("total");
                amount = (int) (100.00 * Double.parseDouble(total));
            }
            
        }
        
        if (request.getParameter("subtotal") != null)
            
        {
            
            if (!request.getParameter("subtotal").equalsIgnoreCase(""))
                
            {
                subtotal = request.getParameter("subtotal");
            }
            
        }
        
        if (request.getParameter("gst") != null)
            
        {
            
            if (!request.getParameter("gst").equalsIgnoreCase(""))
                
            {
                gst = request.getParameter("gst");
            }
            
        }
        
        if (request.getParameter("pst") != null)
            
        {
            
            if (!request.getParameter("pst").equalsIgnoreCase(""))
                
            {
                pst = request.getParameter("pst");
            }
            
        }
        
        if (request.getParameter("tech-fee") != null)
            
        {
            
            if (!request.getParameter("tech-fee").equalsIgnoreCase(""))
                
            {
                techFee = request.getParameter("tech-fee");
            }
            
        }
        
        if (request.getParameter("transit-fee") != null)
            
        {
            
            if (!request.getParameter("transit-fee").equalsIgnoreCase(""))
                
            {
                transitFee = request.getParameter("transit-fee");
            }
            
        }
        
        if (request.getParameter("tip") != null)
            
        {
            
            if (!request.getParameter("tip").equalsIgnoreCase(""))
                
            {
                tip = request.getParameter("tip");
            }
            
        }
        
        if (request.getParameter("grocery-cut") != null)
            
        {
            
            if (!request.getParameter("grocery-cut").equalsIgnoreCase(""))
                
            {
                groceryCut = request.getParameter("grocery-cut");
            }
            
        }
        
        if (request.getParameter("overlimit-cut") != null)
            
        {
            
            if (!request.getParameter("overlimit-cut").equalsIgnoreCase(""))
                
            {
                overlimitCut = request.getParameter("overlimit-cut");
            }
            
        }
        
        
        
        //charge card
        card = new CreditCardRetrieve(customerID);
        creditCardNumber = card.getCreditCardNumber();
        expiryMonth = card.getExpiryMonth();
        expiryYear = card.getExpiryYear();
        ccv = card.getCcv();
        charge = new StripeCharge(amount, creditCardNumber, expiryMonth, expiryYear, ccv);
        
        if (charge.isCompleted())
            
        {
            orderInsert = new OrderInsert(customerID, 0, total, total, subtotal, gst, pst, transitFee, techFee, tip, voucher, groceryCut, overlimitCut);
            response.sendRedirect("index.jsp");
        }
        
        else
            
        {
            response.sendRedirect("shop.jsp");
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() 
    
    {
        return "Short description";
    }// </editor-fold>

}
