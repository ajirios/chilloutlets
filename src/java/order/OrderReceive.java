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
public class OrderReceive 

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
    
    public OrderReceive(long customerID, long orderNumber)
            
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
        
        constructOrderReceive();
        
    }
    
    private void constructOrderReceive()
            
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
            statement = connection.prepareStatement("SELECT * "
                    + "FROM orders WHERE customerID=" + this.customerID + " AND orderNumber=" + this.orderNumber);
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
                    
                    this.orderNumber = Long.parseLong(resultSet.getString("orderNumber"));
                    this.orderSubtotal = resultSet.getString("orderSubtotal");
                    this.orderGST = resultSet.getString("orderGST");
                    this.orderPST = resultSet.getString("orderPST");
                    this.orderTotal = resultSet.getString("orderTotal");
                    this.orderNetworkFee = resultSet.getString("orderNetworkFee");
                    this.orderTransitFee = resultSet.getString("orderTransitFee");
                    this.orderTip = resultSet.getString("orderTip");
                    this.orderVoucher = resultSet.getString("orderVoucher");
                    this.groceryCut = resultSet.getString("groceryCut");
                    this.overlimitCut = resultSet.getString("overlimitCut");
                    this.paidAmount = resultSet.getString("paidAmount");
                    
                }
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getPaidAmount() 
    
    {
        return paidAmount;
    }

    public String getOrderTotal() 
    
    {
        return orderTotal;
    }

    public String getOrderSubtotal() 
    
    {
        return orderSubtotal;
    }

    public String getOrderGST() 
    
    {
        return orderGST;
    }

    public String getOrderPST() 
    
    {
        return orderPST;
    }

    public String getOrderNetworkFee() 
    
    {
        return orderNetworkFee;
    }

    public String getOrderTransitFee() 
    
    {
        return orderTransitFee;
    }

    public String getOrderTip() 
    
    {
        return orderTip;
    }

    public String getOrderVoucher() 
    
    {
        return orderVoucher;
    }

    public String getGroceryCut() 
    
    {
        return groceryCut;
    }

    public String getOverlimitCut() 
    
    {
        return overlimitCut;
    }
    
}
