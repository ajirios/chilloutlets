/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package creditcard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author mac
 */
public class CreditCardRetrieve 

{
    private long customerID;
    private String creditCardNumber;
    private String creditCardType;
    private int expiryMonth;
    private int expiryYear;
    private String creditCardName;
    private String ccv;
    
    private static final String URL = "jdbc:mysql://206.45.199.211:3306/chilloutlets";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire";
    
    public CreditCardRetrieve(long customerID)
            
    {
        this.customerID = customerID;
        this.creditCardNumber = null;
        this.creditCardType = null;
        this.expiryMonth = 0;
        this.expiryYear = 0;
        this.creditCardName = null;
        this.ccv = null;
        
        constructRetrieve();
    }
    
    private void constructRetrieve()
            
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
            statement = connection.prepareStatement("SELECT creditcardNumber, expiryMonth, expiryYear, creditcardName, ccv, creditcardType "
                    + "FROM creditcards WHERE customerID=" + this.customerID);
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
                    
                    this.creditCardNumber = resultSet.getString("creditcardNumber");
                    this.expiryMonth = Integer.parseInt(resultSet.getString("expiryMonth"));
                    this.expiryYear = Integer.parseInt(resultSet.getString("expiryYear"));
                    this.ccv = resultSet.getString("ccv");
                    this.creditCardType = resultSet.getString("creditcardType");
                    this.creditCardName = resultSet.getString("creditcardName");
                    
                }
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getCreditCardNumber() 
    
    {
        return creditCardNumber;
    }

    public String getCreditCardType() 
    
    {
        return creditCardType;
    }

    public int getExpiryMonth() 
    
    {
        return expiryMonth;
    }

    public int getExpiryYear() 
    
    {
        return expiryYear;
    }

    public String getCreditCardName() 
    
    {
        return creditCardName;
    }

    public String getCcv() 
    
    {
        return ccv;
    }
    
}
