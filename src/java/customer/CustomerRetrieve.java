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
public class CustomerRetrieve 

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
    
    private static final String URL = "jdbc:mysql://206.45.199.211:3306/chilloutlets";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire";
    
    public CustomerRetrieve(long customerID)
            
    {
        this.customerID = customerID;
        this.customerFullName = null;
        this.customerEmail = null;
        this.customerPhoneNumber = null;
        this.customerPassword = null;
        this.customerFirstName = null;
        this.customerMiddleName = null;
        this.customerLastName = null;
        this.customerStreetAddress = null;
        this.city = null;
        this.region = null;
        this.country = null;
        this.customerCredit = null;
        
        constructCustomerRetrieve();
        
    }
    
    public CustomerRetrieve(String customerEmail, String customerPassword)
            
    {
        this.customerID = -1;
        this.customerFullName = null;
        this.customerEmail = customerEmail;
        this.customerPhoneNumber = null;
        this.customerPassword = customerPassword;
        this.customerFirstName = null;
        this.customerMiddleName = null;
        this.customerLastName = null;
        this.customerStreetAddress = null;
        this.city = null;
        this.region = null;
        this.country = null;
        this.customerCredit = null;
        
        constructCustomerRetrieve();
        
    }
    
    private void constructCustomerRetrieve()
            
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
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            
            if ((this.customerEmail != null) && (this.customerPassword != null))
                
            {
                statement = connection.prepareStatement("SELECT customerID, customerFullName, customerEmail, customerPassword, customerPhoneNumber, customerFirstName, customerMiddleName, customerLastName, "
                    + "customerStreetAddress, city, region, country, customerCredit FROM customers WHERE customerEmail='" + this.customerEmail + "' AND customerPassword='" + this.customerPassword + "'");
            }
            
            else
                
            {
                statement = connection.prepareStatement("SELECT customerID, customerFullName, customerEmail, customerPassword, customerPhoneNumber, customerFirstName, customerMiddleName, customerLastName, "
                    + "customerStreetAddress, city, region, country, customerCredit FROM customers WHERE customerID=" + this.customerID);
            }
            
            
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
                    
                    this.customerID = Long.parseLong(resultSet.getString("customerID"));
                    this.customerFullName = resultSet.getString("customerFullName");
                    this.customerEmail = resultSet.getString("customerEmail");
                    this.customerPhoneNumber = resultSet.getString("customerPhoneNumber");
                    this.customerPassword = resultSet.getString("customerPassword");
                    this.customerFirstName = resultSet.getString("customerFirstName");
                    this.customerMiddleName = resultSet.getString("customerMiddleName");
                    this.customerLastName = resultSet.getString("customerLastName");
                    this.customerStreetAddress = resultSet.getString("customerStreetAddress");
                    this.city = resultSet.getString("city");
                    this.region = resultSet.getString("region");
                    this.country = resultSet.getString("country");
                    this.customerCredit = resultSet.getString("customerCredit");
                    
                }
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public long getCustomerID() 
    
    {
        return customerID;
    }

    public String getCustomerFullName() 
    
    {
        return customerFullName;
    }

    public String getCustomerEmail() 
    
    {
        return customerEmail;
    }

    public String getCustomerPassword() 
    
    {
        return customerPassword;
    }

    public String getCustomerStreetAddress() 
    
    {
        return customerStreetAddress;
    }

    public String getCity() 
    
    {
        return city;
    }

    public String getRegion() 
    
    {
        return region;
    }

    public String getCountry() 
    
    {
        return country;
    }

    public String getCustomerPhoneNumber() 
    
    {
        return customerPhoneNumber;
    }

    public String getCustomerFirstName() 
    
    {
        return customerFirstName;
    }

    public String getCustomerMiddleName() 
    
    {
        return customerMiddleName;
    }

    public String getCustomerLastName() 
    
    {
        return customerLastName;
    }

    public String getCustomerCredit() 
    
    {
        return customerCredit;
    }
    
}
