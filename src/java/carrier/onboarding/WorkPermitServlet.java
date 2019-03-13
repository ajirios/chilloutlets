/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package carrier.onboarding;

import base.Base;
import carrier.CarrierUpdate;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author mac
 */
@WebServlet(name = "WorkPermitServlet", urlPatterns = {"/WorkPermitServlet"})
public class WorkPermitServlet extends HttpServlet 

{
    private static final long serialVersionUID = 1L;
     
    // location to store file uploaded
    private static final String UPLOAD_DIRECTORY = "upload";
 
    // upload settings
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 400; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 500; // 50MB

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
            out.println("<title>Servlet WorkPermitServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WorkPermitServlet at " + request.getContextPath() + "</h1>");
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
        String accountStatus = "onboarding";
        double onboardingStep = 2;
        
        HttpSession session = request.getSession();
        
        // checks if the request actually contains upload file
        if (!ServletFileUpload.isMultipartContent(request)) 
        
        {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must has enctype=multipart/form-data.");
            writer.flush();
            return;
        }
        
        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // sets memory threshold - beyond which files are stored in disk
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // sets temporary location to store files
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
 
        ServletFileUpload upload = new ServletFileUpload(factory);
         
        // sets maximum size of upload file
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        // sets maximum size of request (include file + form data)
        upload.setSizeMax(MAX_REQUEST_SIZE);
 
        // constructs the directory path to store upload file
        // this path is relative to application's directory
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        String outletsPath = new Base().getBase();
         
        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        
        
        
        if (!uploadDir.exists()) 
        
        {
            uploadDir.mkdir();
        }
        
 
        try 
        
        {
            // parses the request's content to extract file data
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
            
 
            if (formItems != null && formItems.size() > 0) 
            
            {
                // iterates over form's fields
                for (FileItem item : formItems) 
                
                {
                    // processes only fields that are not form fields
                    if (!item.isFormField()) 
                    
                    {
                        String fileName = new File(item.getName()).getName();
                        //String filePath = uploadPath + File.separator + fileName;
                        File contextFile = new File(outletsPath + File.separator + "permits/" + fileName);
                        //File storeFile = new File(filePath);
                        
                        // saves the file on disk
                        item.write(contextFile);
                        //item.write(storeFile);
                        request.setAttribute("message",
                            "Upload has been done successfully to " + outletsPath + File.separator + fileName);
                        
                    }
                    
                }
                
            }
            
        } 
        
        catch (Exception ex) 
        
        {
            request.setAttribute("message", "There was an error: " + ex.getMessage());
        }
        
        
        long carrierID = Long.parseLong(session.getAttribute("carrier-id").toString());
        CarrierUpdate update = new CarrierUpdate(carrierID);
        
        try 
        
        {
            update.setOnboardingStep(onboardingStep);
        } 
        
        catch (ClassNotFoundException ex) 
        
        {
            Logger.getLogger(WelcomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("onboarding/carrier/mobility.jsp");
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
