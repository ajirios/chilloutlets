/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package carrier.onboarding;

import cities.CitiesRetrieve;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mac
 */
@WebServlet(name = "ServiceAreaServlet", urlPatterns = {"/ServiceAreaServlet"})
public class ServiceAreaServlet extends HttpServlet {

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
            out.println("<title>Servlet ServiceAreaServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServiceAreaServlet at " + request.getContextPath() + "</h1>");
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
        CitiesRetrieve cities = null;
        String searchCriteria = "";
        int length = 0;
        
        
        if (request.getParameter("searchCriteria") != null)
            
        {
            searchCriteria = request.getParameter("searchCriteria");
        }
        
        
        try 
        
        {
            cities = new CitiesRetrieve(searchCriteria);
        } 
        
        catch (ClassNotFoundException ex) 
        
        {
            Logger.getLogger(ServiceAreaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } 
        
        catch (InstantiationException ex) 
        
        {
            Logger.getLogger(ServiceAreaServlet.class.getName()).log(Level.SEVERE, null, ex);
        } 
        
        catch (IllegalAccessException ex) 
        
        {
            Logger.getLogger(ServiceAreaServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        length = cities.getSize();
        
        
        
        
        if (length > 0)
            
        {
            String list = "<?xml version='1.0'?>\n<Cities>\n";
            response.setContentType("text/xml");
            
            for (int count = 0; count < length; count++)
                
            {
                
                list += "<City>\n";
                list += "<cityNumber>" + cities.getCity(count).getCityNumber() + "</cityNumber>\n";
                list += "<cityName>" + cities.getCity(count).getCityName() + "</cityName>\n";
                list += "</City>\n";
                
            }
            
            
            list += "</Cities>";
            
            response.getWriter().write(list);
            response.setStatus(HttpServletResponse.SC_OK);
            
        }
        
        else
            
        {
            //response.sendRedirect("index.jsp");
            response.setContentType("text/xml");
            response.getWriter().write("<Cities><City>"
                    + "<cityNumber>null</cityNumber>"
                    + "<cityName>null</cityName>"
                    + "</City></Cities>");
            
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
            throws ServletException, IOException 
    
    {
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
