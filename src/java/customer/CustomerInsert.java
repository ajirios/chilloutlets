/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author mac
 */
public class CustomerInsert 

{
    private long customerID;
    private String customerFullName;
    private String customerEmail;
    private String customerPassword;
    private String customerStreetAddress;
    private String city;
    private String region;
    private String country;
    private String customerPhoneNumber;
    private String customerFirstName;
    private String customerMiddleName;
    private String customerLastName;
    private String customerCredit;
    
    private boolean created;
    
    private static final String URL = "jdbc:mysql://206.45.199.211:3306/chilloutlets";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire";
    
    public CustomerInsert(long customerID, String customerFullName, String customerEmail, String customerPhoneNumber, String customerPassword)
            
    {
        this.customerID = customerID;
        this.customerFullName = customerFullName;
        this.customerEmail = customerEmail;
        this.customerPhoneNumber = customerPhoneNumber;
        this.customerPassword = customerPassword;
        this.customerFirstName = null;
        this.customerMiddleName = null;
        this.customerLastName = null;
        this.customerStreetAddress = null;
        this.city = null;
        this.region = null;
        this.country = null;
        this.customerCredit = "0.00";
        
        created = false;
        
        if (exists() == false)
            
        {
            constructCustomerInsert();
            created = true;
        }
        
    }
    
    private void constructCustomerInsert()
            
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
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("INSERT INTO `customers`(customerID, customerFullName, customerEmail, customerPhoneNumber, customerPassword, customerCredit) "
                    + "VALUES(" + this.customerID 
                    + ", '" + this.customerFullName 
                    + "', '" + this.customerEmail
                    + "', '" + this.customerPhoneNumber
                    + "', '" + this.customerPassword
                    + "', '" + this.customerCredit 
                    + "')");
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
    
    private boolean exists()
            
    {
        boolean programExistsInAccount = false;
        
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
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT * FROM customers WHERE customerEmail='" + this.customerEmail + "'");
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

                    programExistsInAccount = true; 

                }
                
                else
                    
                {
                    
                    programExistsInAccount = false;
                    
                }
                
            }
            
            else
                
            {
                
                programExistsInAccount = false;
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        
        return programExistsInAccount;
        
    }

    public boolean isCreated() 
    
    {
        return created;
    }
    
}
