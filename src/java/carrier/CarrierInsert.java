/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package carrier;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author mac
 */
public class CarrierInsert 

{
    private long carrierID;
    private String accountStatus;
    private double onboardingStep;
    private String carrierEmail;
    private String carrierPassword;
    private String carrierFirstName;
    private String carrierMiddleName;
    private String carrierLastName;
    private String carrierStation;
    
    private static final String URL = "jdbc:mysql://206.45.199.211:3306/chilloutlets";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire";
    
    
    public CarrierInsert(long carrierID, String carrierFirstName, String carrierMiddleName, String carrierLastName, String carrierStation, String carrierEmail, String carrierPassword) throws ClassNotFoundException
            
    {
        this.carrierID = carrierID;
        this.accountStatus = "onboarding";
        this.onboardingStep = 1.1;
        this.carrierEmail = carrierEmail;
        this.carrierPassword = carrierPassword;
        this.carrierFirstName = carrierFirstName.replace("'", "\'");
        this.carrierLastName = carrierLastName.replace("'", "\'");
        
        if (carrierMiddleName != null)
            
        {
            this.carrierMiddleName = carrierMiddleName.replace("'", "\'");
        }
        
        else
            
        {
            this.carrierMiddleName = "";
        }
        
        if (carrierStation != null)
            
        {
            this.carrierStation = carrierStation.replace("'", "\'");
        }
        
        else
            
        {
            this.carrierStation = "";
        }
        
        insertCarrier();
    }
    
    public void insertCarrier() throws ClassNotFoundException
            
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            Class.forName("com.mysql.jdbc.Driver");
            
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("INSERT INTO `carriers`(carrierID, carrierFirstName, carrierMiddleName, carrierLastName, carrierEmail, carrierPassword, carrierStation, accountStatus, onboardingStep) "
                    + "VALUES(" + this.carrierID 
                    + ", '" + this.carrierFirstName
                    + "', '" + this.carrierMiddleName 
                    + "', '" + this.carrierLastName
                    + "', '" + this.carrierEmail 
                    + "', '" + this.carrierPassword 
                    + "', '" + this.carrierStation 
                    + "', '" + this.accountStatus 
                    + "', " + this.onboardingStep  
                    + ")");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the result
        try
            
        {
            if (statement != null)
                
            {
            
                result = statement.executeUpdate(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
}
