/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stock;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author mac
 */
public class StockInsert 

{
    private int outletNumber;
    private int branchNumber;
    private int shelfNumber;
    private int stockNumber;
    private String stockName;
    private String stockImage;
    private String price;
    private int quantity;
    private String entryState;
    private String stockDescription;
    private String stockArticle;
    
    private static final String URL = "jdbc:mysql://206.45.199.211:3306/chilloutlets";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire";
    
    public StockInsert(int outletNumber, int branchNumber, int shelfNumber, String stockName, String price, String entryState)
            
    {
        this.outletNumber = outletNumber;
        this.branchNumber = branchNumber;
        this.shelfNumber = shelfNumber;
        this.stockNumber = getMaximumStockNumber() + 1;
        this.stockName = stockName;
        this.stockImage = null;
        this.price = price;
        this.quantity = 1;
        this.entryState = entryState;
        this.stockDescription = null;
        this.stockArticle = null;
        
        if (this.stockNumber >= 1)
            
        {
            insertStock();
        }
        
    }
    
    public StockInsert(int outletNumber, int branchNumber, int shelfNumber, String stockName, String price, String stockImage, String description, String entryState)
            
    {
        this.outletNumber = outletNumber;
        this.branchNumber = branchNumber;
        this.shelfNumber = shelfNumber;
        this.stockNumber = getMaximumStockNumber() + 1;
        this.stockName = stockName;
        this.stockImage = stockImage;
        this.price = price;
        this.quantity = 1;
        this.entryState = entryState;
        this.stockDescription = description;
        this.stockArticle = null;
        
        if (this.stockNumber >= 1)
            
        {
            insertFullStock();
        }
        
    }
    
    public void insertFullStock()
            
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
            statement = connection.prepareStatement("INSERT INTO `stock`(outletNumber, branchNumber, shelfNumber, stockNumber, stockName, price, stockImage, stockDescription, entryState) "
                    + "VALUES(" + this.outletNumber 
                    + ", " + this.branchNumber 
                    + ", " + this.shelfNumber
                    + ", " + this.stockNumber
                    + ", '" + this.stockName
                    + "', '" + this.price 
                    + "', '" + this.stockImage 
                    + "', '" + this.stockDescription 
                    + "', '" + this.entryState 
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
    
    public void insertStock()
            
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
            statement = connection.prepareStatement("INSERT INTO `stock`(outletNumber, branchNumber, shelfNumber, stockNumber, stockName, price, entryState) "
                    + "VALUES(" + this.outletNumber 
                    + ", " + this.branchNumber 
                    + ", " + this.shelfNumber
                    + ", " + this.stockNumber
                    + ", '" + this.stockName
                    + "', '" + this.price 
                    + "', '" + this.entryState 
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
    
    private int getMaximumStockNumber()
            
    {
        int maxStockNumber = 1;
        
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
            statement = connection.prepareStatement("SELECT max(stockNumber) FROM stock WHERE outletNumber=" + this.outletNumber + " AND branchNumber=" + this.branchNumber + " AND shelfNumber=" + this.shelfNumber);
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
                    
                    if (resultSet.getString("max(stockNumber)") == null)
                        
                    {
                        maxStockNumber = 0;
                    }
                    
                    else
                        
                    {
                        maxStockNumber = Integer.parseInt(resultSet.getString("max(stockNumber)"));
                    }
                    
                }
                
                else
                    
                {
                    
                    maxStockNumber = -1;
                    
                }
                
            }
            
            else
                
            {
                
                maxStockNumber = -1;
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        
        return maxStockNumber;
        
    }
    
}
