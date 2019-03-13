/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package carrier.onboarding;

import carrier.CarrierInsert;
import com.stripe.exception.StripeException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import stripe.CustomAccount;

/**
 *
 * @author mac
 */
@WebServlet(name = "CarrierRegisterServlet", urlPatterns = {"/CarrierRegisterServlet"})
public class CarrierRegisterServlet extends HttpServlet 

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CarrierRegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CarrierRegisterServlet at " + request.getContextPath() + "</h1>");
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
        CarrierInsert insert = null;
        CustomAccount customAccount = null;
        long carrierID = generateAccountNumber();
        String firstName = null;
        String middleName = null;
        String lastName = null;
        String email = null;
        String password = null;
        String country = null;
        String province = null;
        String city = null;
        String station = null;
        String referrer = null;
        String month = null;
        int day = 1;
        String year = null;
        String reference = null;
        String agreed = "true";
        
        
        if (request.getParameter("first-name") != null)
        
        {
            if (!request.getParameter("first-name").equals(""))
                
            {
                firstName = request.getParameter("first-name");
            }
        }
        
        if (request.getParameter("middle-name") != null)
        
        {
            if (!request.getParameter("middle-name").equals(""))
                
            {
                middleName = request.getParameter("middle-name");
            }
        }
        
        if (request.getParameter("last-name") != null)
        
        {
            if (!request.getParameter("last-name").equals(""))
                
            {
                lastName = request.getParameter("last-name");
            }
        }
        
        if (request.getParameter("email") != null)
        
        {
            if (!request.getParameter("email").equals(""))
                
            {
                email = request.getParameter("email");
            }
        }
        
        if (request.getParameter("password") != null)
        
        {
            if (!request.getParameter("password").equals(""))
                
            {
                password = request.getParameter("password");
            }
        }
        
        if (request.getParameter("city") != null)
        
        {
            if (!request.getParameter("city").equals(""))
                
            {
                city = request.getParameter("city");
            }
        }
        
        if (request.getParameter("station") != null)
        
        {
            if (!request.getParameter("station").equals(""))
                
            {
                station = request.getParameter("station");
            }
        }
        
        if (request.getParameter("referrer") != null)
        
        {
            if (!request.getParameter("referrer").equals(""))
                
            {
                referrer = request.getParameter("referrer");
            }
        }
        
        if (request.getParameter("month") != null)
        
        {
            if (!request.getParameter("month").equals(""))
                
            {
                month = request.getParameter("month");
            }
        }
        
        if (request.getParameter("day") != null)
        
        {
            if (!request.getParameter("day").equals(""))
                
            {
                day = Integer.parseInt(request.getParameter("day"));
            }
        }
        
        if (request.getParameter("year") != null)
        
        {
            if (!request.getParameter("year").equals(""))
                
            {
                year = request.getParameter("year");
            }
        }
        
        if (request.getParameter("agreed") != null)
        
        {
            if (!request.getParameter("agreed").equals(""))
                
            {
                agreed = request.getParameter("agreed");
            }
        }
        
        
        
        
        if ((email != null) && (password != null))
            
        {
            try 
            
            {
                insert = new CarrierInsert(carrierID, firstName, middleName, lastName, station, email, password);
            } 
            
            catch (ClassNotFoundException ex) 
            
            {
                Logger.getLogger(CarrierRegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            
            String ip = null;
            
            ip = getClientIpAddress(request);
            
            
            try 
                
            {
                customAccount = new CustomAccount(ip);
            } 
            
            catch (StripeException ex) 
                
            {
                Logger.getLogger(CarrierRegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            HttpSession session = request.getSession();
            session.setAttribute("carrier-id", carrierID);
            session.setMaxInactiveInterval(7*60*60);
            
            response.sendRedirect("onboarding/carrier/vehicle.jsp");
            
        }
        
        else
            
        {
            response.sendRedirect("onboarding/carrier.jsp");
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
    
    public static String getClientIpAddress(HttpServletRequest request) 
    
    {
        String xForwardedForHeader = request.getHeader("X-Forwarded-For");
        
        if (xForwardedForHeader == null) 
        
        {
            return request.getRemoteAddr();
        } 
        
        else 
        
        {
            // As of https://en.wikipedia.org/wiki/X-Forwarded-For
            // The general format of the field is: X-Forwarded-For: client, proxy1, proxy2 ...
            // we only want the client
            return new StringTokenizer(xForwardedForHeader, ",").nextToken().trim();
        }
        
    }
    
    private long generateAccountNumber()
            
    {
        //generate two random integer numbers and multiply to create a long number to return
        long newAccountNumber;
        int leftInteger, rightInteger;
        String leftString, rightString, wholeString;
        
        newAccountNumber = 0;
        leftInteger = 0;
        rightInteger = 0;
        leftString = null;
        rightString = null;
        wholeString = null;
        
        leftInteger = (int) Math.ceil(Math.random() * 99); 
        rightInteger = (int) Math.ceil(Math.random() * 99); 
        leftString = String.valueOf(leftInteger);
        rightString = String.valueOf(rightInteger);
        wholeString = leftString + rightString;
        
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String creationTime  = dateFormat.format(calendar.getTime());
        
        newAccountNumber = Long.parseLong(wholeString + creationTime);
        
        return newAccountNumber;
        
    }

}
