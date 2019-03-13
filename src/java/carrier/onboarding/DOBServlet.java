/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package carrier.onboarding;

import customer.CustomerRetrieve;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mac
 */
@WebServlet(name = "DOBServlet", urlPatterns = {"/DOBServlet"})
public class DOBServlet extends HttpServlet {

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
            out.println("<title>Servlet DOBServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DOBServlet at " + request.getContextPath() + "</h1>");
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
        int month = 0;
        int numberOfDays = 0;
        
        
        if (request.getParameter("dob-month") != null)
            
        {
            if (!request.getParameter("dob-month").equals(""))
                
            {
                month = Integer.parseInt(request.getParameter("dob-month"));
                numberOfDays = getNumberOfDays(month);
            }
        }
        
        
        if (numberOfDays != 0)
            
        {
            String list = "<?xml version='1.0'?>\n<Days>\n";
            response.setContentType("text/xml");
            
            list += String.valueOf(numberOfDays) + "</Days>";
            
            response.getWriter().write(list);
            response.setStatus(HttpServletResponse.SC_OK);
            
        }
        
        else
            
        {
            //response.sendRedirect("index.jsp");
            response.setContentType("text/xml");
            response.getWriter().write("<Days>"
                    + "</Days>");
            
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
    public String getServletInfo() 
    
    {
        return "Short description";
    }// </editor-fold>
    
    private int getNumberOfDays(int month)
            
    {
        int count = 0;
        
        if (month == 1)
            
        {
            count = 31;
        }
        
        else if (month == 2)
            
        {
            count = 29;
        }
        
        else if (month == 3)
            
        {
            count = 31;
        }
        
        else if (month == 4)
            
        {
            count = 30;
        }
        
        else if (month == 5)
            
        {
            count = 31;
        }
        
        else if (month == 6)
            
        {
            count = 30;
        }
        
        else if (month == 7)
            
        {
            count = 31;
        }
        
        else if (month == 8)
            
        {
            count = 31;
        }
        
        else if (month == 9)
            
        {
            count = 30;
        }
        
        else if (month == 10)
            
        {
            count = 31;
        }
        
        else if (month == 11)
            
        {
            count = 30;
        }
        
        else if (month == 12)
            
        {
            count = 31;
        }
        
        return count;
    }

}
