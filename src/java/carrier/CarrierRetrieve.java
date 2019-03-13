/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package carrier;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author mac
 */
public class CarrierRetrieve 

{
    private long carrierID;
    private String accountStatus;
    private double onboardingStep;
    private String carrierEmail;
    private String carrierPassword;
    private String carrierLegalName;
    private String carrierFirstName;
    private String carrierMiddleName;
    private String carrierLastName;
    private String carrierSIN;
    private String carrierLicenseNumber;
    private String carrierRegistrationNumber;
    private String carrierPhoneNumber;
    private String carrierMobilePlatform;
    private String carrierOEM;
    private String carrierProvider;
    private String carrierModel;
    private String carrierDOB;
    
    private static final String URL = "jdbc:mysql://206.45.199.211:3306/chilloutlets";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire";
    
    
    public CarrierRetrieve(long carrierID) throws ClassNotFoundException
            
    {
        this.carrierID = carrierID;
        this.accountStatus = null;
        this.onboardingStep = 0.0;
        this.carrierEmail = null;
        this.carrierPassword = null;
        this.carrierLegalName = null;
        this.carrierFirstName = null;
        this.carrierMiddleName = null;
        this.carrierLastName = null;
        this.carrierSIN = null;
        this.carrierLicenseNumber = null;
        this.carrierRegistrationNumber = null;
        this.carrierPhoneNumber = null;
        this.carrierMobilePlatform = null;
        this.carrierOEM = null;
        this.carrierProvider = null;
        this.carrierModel = null;
        this.carrierDOB = null;
        
        constructRetrieve();
    }
    
    public CarrierRetrieve(String email, String password) throws ClassNotFoundException
            
    {
        this.carrierID = -1;
        this.accountStatus = null;
        this.onboardingStep = 0.0;
        this.carrierEmail = email.replace("'", "\'");
        this.carrierPassword = password.replace("'", "\'");
        this.carrierLegalName = null;
        this.carrierFirstName = null;
        this.carrierMiddleName = null;
        this.carrierLastName = null;
        this.carrierSIN = null;
        this.carrierLicenseNumber = null;
        this.carrierRegistrationNumber = null;
        this.carrierPhoneNumber = null;
        this.carrierMobilePlatform = null;
        this.carrierOEM = null;
        this.carrierProvider = null;
        this.carrierModel = null;
        this.carrierDOB = null;
        
        constructLoginRetrieve();
    }
    
    private void constructRetrieve() throws ClassNotFoundException
            
    {
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        resultSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT * FROM carriers WHERE carrierID=" + this.carrierID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
            
                resultSet = statement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            
            if (resultSet != null)
                
                {
                    
                if (resultSet.next() == true)
                    
                {
                    
                    this.accountStatus = resultSet.getString("accountStatus");
                    this.onboardingStep = Double.parseDouble(resultSet.getString("onboardingStep"));
                    this.carrierEmail = resultSet.getString("carrierEmail");
                    this.carrierPassword = resultSet.getString("carrierPassword");
                    this.carrierLegalName = resultSet.getString("carrierLegalName");
                    this.carrierFirstName = resultSet.getString("carrierFirstName");
                    this.carrierMiddleName = resultSet.getString("carrierMiddleName");
                    this.carrierLastName = resultSet.getString("carrierLastName");
                    
                    if (this.carrierSIN != null)
                        
                    {
                        this.carrierSIN = resultSet.getString("carrierSIN");
                    }
                    
                    
                    this.carrierLicenseNumber = resultSet.getString("carrierLicenseNumber");
                    this.carrierRegistrationNumber = resultSet.getString("carrierRegistrationNumber");
                    this.carrierPhoneNumber = resultSet.getString("carrierPhoneNumber");
                    this.carrierMobilePlatform = resultSet.getString("carrierMobilePlatform");
                    this.carrierOEM = resultSet.getString("carrierOEM");
                    this.carrierProvider = resultSet.getString("carrierProvider");
                    this.carrierModel = resultSet.getString("carrierModel");
                    this.carrierDOB = resultSet.getString("carrierDOB");
                    
                }
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private void constructLoginRetrieve() throws ClassNotFoundException
            
    {
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        resultSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT * FROM carriers WHERE carrierEmail='" + this.carrierEmail + "' AND carrierPassword='" + this.carrierPassword + "'");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
            
                resultSet = statement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            
            if (resultSet != null)
                
                {
                    
                if (resultSet.next() == true)
                    
                {
                    this.carrierID = Long.parseLong(resultSet.getString("carrierID"));
                    this.accountStatus = resultSet.getString("accountStatus");
                    this.onboardingStep = Double.parseDouble(resultSet.getString("onboardingStep"));
                    this.carrierLegalName = resultSet.getString("carrierLegalName");
                    this.carrierFirstName = resultSet.getString("carrierFirstName");
                    this.carrierMiddleName = resultSet.getString("carrierMiddleName");
                    this.carrierLastName = resultSet.getString("carrierLastName");
                    
                    if (this.carrierSIN != null)
                        
                    {
                        this.carrierSIN = resultSet.getString("carrierSIN");
                    }
                    
                    
                    this.carrierLicenseNumber = resultSet.getString("carrierLicenseNumber");
                    this.carrierRegistrationNumber = resultSet.getString("carrierRegistrationNumber");
                    this.carrierPhoneNumber = resultSet.getString("carrierPhoneNumber");
                    this.carrierMobilePlatform = resultSet.getString("carrierMobilePlatform");
                    this.carrierOEM = resultSet.getString("carrierOEM");
                    this.carrierProvider = resultSet.getString("carrierProvider");
                    this.carrierModel = resultSet.getString("carrierModel");
                    this.carrierDOB = resultSet.getString("carrierDOB");
                    
                }
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public long getCarrierID() 
    
    {
        return carrierID;
    }

    public String getAccountStatus() 
    
    {
        return accountStatus;
    }

    public double getOnboardingStep() 
    
    {
        return onboardingStep;
    }

    public String getCarrierEmail() 
    
    {
        return carrierEmail;
    }

    public String getCarrierPassword() 
    
    {
        return carrierPassword;
    }

    public String getCarrierLegalName() 
    
    {
        return carrierLegalName;
    }

    public String getCarrierFirstName() 
    
    {
        return carrierFirstName;
    }

    public String getCarrierMiddleName() 
    
    {
        return carrierMiddleName;
    }

    public String getCarrierLastName() 
    
    {
        return carrierLastName;
    }

    public String getCarrierSIN() 
    
    {
        return carrierSIN;
    }

    public String getCarrierLicenseNumber() 
    
    {
        return carrierLicenseNumber;
    }

    public String getCarrierRegistrationNumber() 
    
    {
        return carrierRegistrationNumber;
    }

    public String getCarrierPhoneNumber() 
    
    {
        return carrierPhoneNumber;
    }

    public String getCarrierMobilePlatform() 
    
    {
        return carrierMobilePlatform;
    }

    public String getCarrierOEM() 
    
    {
        return carrierOEM;
    }

    public String getCarrierProvider() 
    
    {
        return carrierProvider;
    }

    public String getCarrierModel() 
    
    {
        return carrierModel;
    }

    public String getCarrierDOB() 
    
    {
        return carrierDOB;
    }
    
}
