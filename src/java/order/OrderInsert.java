/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author mac
 */
public class OrderInsert 

{
    private long customerID;
    private long orderNumber;
    private String paidAmount;
    private String orderTotal;
    private String orderSubtotal;
    private String orderGST;
    private String orderPST;
    private String orderNetworkFee;
    private String orderTransitFee;
    private String orderTip;
    private String orderVoucher;
    private String groceryCut;
    private String overlimitCut;
    
    private static final String URL = "jdbc:mysql://206.45.199.211:3306/chilloutlets";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire";
    
    public OrderInsert(long customerID, long orderNumber)
            
    {
        this.customerID = customerID;
        this.orderNumber = orderNumber;
        this.paidAmount = null;
        this.orderTotal = null;
        this.orderSubtotal = null;
        this.orderGST = null;
        this.orderPST = null;
        this.orderNetworkFee = null;
        this.orderTransitFee = null;
        this.orderTip = null;
        this.orderVoucher = null;
        this.groceryCut = null;
        this.overlimitCut = null;
    }
    
    public OrderInsert(long customerID, long orderNumber, String paidAmount, String orderTotal, String orderSubtotal, String orderGST, String orderPST, String orderTransitFee, String orderNetworkFee, String orderTip, String orderVoucher, String groceryCut, String overlimitCut)
            
    {
        this.customerID = customerID;
        this.orderNumber = orderNumber;
        this.paidAmount = paidAmount;
        this.orderTotal = orderTotal;
        this.orderSubtotal = orderSubtotal;
        this.orderGST = orderGST;
        this.orderPST = orderPST;
        this.orderNetworkFee = orderNetworkFee;
        this.orderTransitFee = orderTransitFee;
        this.orderTip = orderTip;
        this.orderVoucher = orderVoucher;
        this.groceryCut = groceryCut;
        this.overlimitCut = overlimitCut;
        
        if (exists() == false)
            
        {
            insertOrder();
        }
        
    }
    
    public void insertOrder()
            
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
            statement = connection.prepareStatement("INSERT INTO `orders`(customerID, paidAmount, orderNumber, orderTotal, orderSubtotal, orderGST, orderPST, orderTransitFee, orderNetworkFee, orderTip, orderVoucher, groceryCut, overlimitCut) "
                    + "VALUES(" + this.customerID 
                    + ", '" + this.paidAmount
                    + "', " + this.orderNumber
                    + ", '" + this.orderTotal
                    + "', '" + this.orderSubtotal
                    + "', '" + this.orderGST
                    + "', '" + this.orderPST 
                    + "', '" + this.orderTransitFee
                    + "', '" + this.orderNetworkFee
                    + "', '" + this.orderTip
                    + "', '" + this.orderVoucher
                    + "', '" + this.groceryCut
                    + "', '" + this.overlimitCut
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
            statement = connection.prepareStatement("SELECT customerID FROM orders WHERE orderNumber='" + this.orderNumber + "'");
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
