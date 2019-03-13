/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package log;

import customer.CustomerRetrieve;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mac
 */
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        CustomerRetrieve customer;
        String customerID = null;
        String email = request.getParameter("customer-email");
        String password = request.getParameter("customer-password");
        
        if ((email != null) && (password != null))
            
        {
            
            if ((!email.equalsIgnoreCase("")) && (!password.equalsIgnoreCase("")))

            {
                customer = new CustomerRetrieve(email, password);
                
                if (customer.getCustomerID() != -1)
                    
                {
                    customerID = String.valueOf(customer.getCustomerID());
                }
                
            }
            
        }
        
        
        if (customerID != null)
            
        {
            customer = new CustomerRetrieve(email, password);
            String list = "<?xml version='1.0'?>\n<Customers>\n";
            response.setContentType("text/xml");
            
            for (int count = 0; count < 1; count++)
                
            {
                
                list += "<Customer>\n";
                list += "<customerID>" + customer.getCustomerID() + "</customerID>\n";
                list += "<customerFullName>" + customer.getCustomerFullName() + "</customerFullName>\n";
                list += "<customerCredit>" + customer.getCustomerCredit() + "</customerCredit>\n";
                list += "</Customer>\n";
                
            }
            
            
            list += "</Customers>";
            
            response.getWriter().write(list);
            response.setStatus(HttpServletResponse.SC_OK);
            
        }
        
        else
            
        {
            //response.sendRedirect("index.jsp");
            response.setContentType("text/xml");
            response.getWriter().write("<Customers><Customer>"
                    + "<customerID></customerID>"
                    + "<customerFullName></customerFullName>"
                    + "<customerCredit></customerCredit>"
                    + "</Customer></Customers>");
            
            response.setStatus(HttpServletResponse.SC_OK);
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
