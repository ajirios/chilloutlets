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
public class CreditCardInsert 

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
    
    public CreditCardInsert(long customerID, String creditCardNumber, String creditCardType, int expiryMonth, int expiryYear, String creditCardName, String ccv)
            
    {
        this.customerID = customerID;
        this.creditCardNumber = creditCardNumber;
        this.creditCardType = creditCardType;
        this.expiryMonth = expiryMonth;
        this.expiryYear = expiryYear;
        this.creditCardName = creditCardName;
        this.ccv = ccv;
        
        if (exists() == false)
            
        {
            insertCreditCard();
        }
        
    }
    
    public void insertCreditCard()
            
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
            statement = connection.prepareStatement("INSERT INTO `creditcards`(customerID, creditcardNumber, creditcardName, ccv, creditcardType, expiryMonth, expiryYear) "
                    + "VALUES(" + this.customerID 
                    + ", '" + this.creditCardNumber 
                    + "', '" + this.creditCardName 
                    + "', '" + this.ccv 
                    + "', '" + this.creditCardType
                    + "', " + this.expiryMonth 
                    + ", " + this.expiryYear 
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
            statement = connection.prepareStatement("SELECT customerID FROM creditcards WHERE creditcardNumber='" + this.creditCardNumber + "' AND ccv='" + this.ccv + "'");
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
    
}
