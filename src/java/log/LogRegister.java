/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package log;

import customer.CustomerInsert;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mac
 */
@WebServlet(name = "LogRegister", urlPatterns = {"/LogRegister"})
public class LogRegister extends HttpServlet {

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
            out.println("<title>Servlet LogRegister</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LogRegister at " + request.getContextPath() + "</h1>");
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
            throws ServletException, IOException {
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
        CustomerInsert customerInsert;
        long customerID;
        String customerName;
        String phoneNumber;
        String email;
        String password;
        String passwordConfirmation;
        int count;
        
        customerInsert = null;
        customerID = -1;
        customerName = null;
        phoneNumber = null;
        email = null;
        password = null;
        passwordConfirmation = null;
        

        if (request.getParameter("customer-full-name") != null)
        {
            customerName = request.getParameter("customer-full-name");
        }

        if (request.getParameter("customer-phone-number") != null)
        {
            phoneNumber = request.getParameter("customer-phone-number");
        }

        if (request.getParameter("customer-email-address") != null)
        {
            email = request.getParameter("customer-email-address");
        }

        if (request.getParameter("customer-password") != null)
        {
            password = request.getParameter("customer-password");
        }

        if (request.getParameter("confirm-password") != null)
        {
            passwordConfirmation = request.getParameter("confirm-password");
        }

        
        
        
        
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateString  = dateFormat.format(calendar.getTime());
        int creationMonth = Integer.parseInt(dateString.substring(4, 6));
        int creationDay = Integer.parseInt(dateString.substring(6, 8));
        int creationHour = Integer.parseInt(dateString.substring(8, 10));
        int creationMinute = Integer.parseInt(dateString.substring(10, 12));
        HttpSession session = request.getSession();
        
        
        
        if ((email != null)  && (phoneNumber != null)  && (customerName != null)  && (password != null))
            
        {
            
            if (password.equals(passwordConfirmation))
                
            {
                customerID = Long.parseLong(dateString);
                
                customerInsert = new CustomerInsert(customerID, customerName, email, phoneNumber, password);
                
                if (customerInsert.isCreated())
                    
                {
                    session.setAttribute("customer-id", dateString);
                    session.setMaxInactiveInterval(6*60*60);
                }
                
            }
            
        }
        
        String requestSender = session.getAttribute("current-page").toString();
        
        if (requestSender.equalsIgnoreCase("shop.jsp"))
            
        {
            String outletNumber = request.getParameter("outlet-number");
            String branchNumber = request.getParameter("branch-number");
            String shelfNumber = request.getParameter("shelf-number");
            
            requestSender += "?outlet-number=" + outletNumber + "&branch-number=" + branchNumber + "&shelf-number=" + shelfNumber;
        }
        
        response.sendRedirect(requestSender);
        
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
