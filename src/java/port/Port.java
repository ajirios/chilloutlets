/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package port;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import outlets.OutletsReceiver;
import stock.Stock;

/**
 *
 * @author mac
 */
public class Port 

{
    private static final String URL = "jdbc:mysql://206.45.199.211:3306/chilloutlets";
    private static final String baseUsername = "ajirios";
    private static final String basePassword = "Empire";
    
    Connection connection;
    PreparedStatement statement;
    ResultSet resultSet;
    
    private int outletNumber;
    private int branchNumber;
    private int shelfNumber;
    private String shelfName;
    private String banner;
    private Stock[][] shelves;
    private int size;
    private int columnSize;
    private int rowSize;
    
    public Port(int outletNumber, int branchNumber, int shelfNumber) throws ClassNotFoundException
            
    {
        this.outletNumber = outletNumber;
        this.branchNumber = branchNumber;
        this.shelfNumber = shelfNumber;
        this.shelfName = null;
        this.banner = null;
        size = getStockCount();
        rowSize = 6;
        columnSize = (int) Math.ceil(((double) this.size) / ((double) rowSize)); 
        this.shelves = new Stock[this.columnSize][this.rowSize];
        fillStocksInShelves();
        fillShelfName();
    }
    
    private void fillStocksInShelves()
            
    {
        connection = null;
        statement = null;
        resultSet = null;
        
        int count = 0;
        int columnCount = 0;
        int rowCount = 0;
        
        //make connection and database statement
        try
            
        {
            connection = DriverManager.getConnection(URL, baseUsername, basePassword); 
            statement = connection.prepareStatement("SELECT * from chilloutlets.stock WHERE outletNumber=" + this.outletNumber + " AND branchNumber=" + this.branchNumber + " AND shelfNumber=" + this.shelfNumber);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //get resultset from statement
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
        
        //continually get object parts from result set if still exists
        try
            
        {
            if (resultSet != null)
                
            {
                
                    for (columnCount = 0; columnCount < this.columnSize; columnCount++) 
                        
                    {
                        
                        
                        for (rowCount = 0; (rowCount < this.rowSize) && (resultSet.next() == true); rowCount++)
                            
                        {
                            int stockNumber = Integer.parseInt(resultSet.getString("stockNumber"));
                            String stockName = resultSet.getString("stockName");
                            String stockImage = resultSet.getString("stockImage");
                            String price = markup(resultSet.getString("price"));
                            String entryState = resultSet.getString("entryState");
                            this.shelves[columnCount][rowCount] = new Stock(outletNumber, branchNumber, shelfNumber, stockNumber, stockName, stockImage, price, entryState);
                            count++;
                        }
                        
                        
                    }
                    
            }
            
            else
                
            {
                
                 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private int getStockCount() throws ClassNotFoundException
            
    {
        int count = 0;

        //make connection and database statement
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(URL, baseUsername, basePassword);
            statement = connection.prepareStatement("SELECT COUNT(*) from chilloutlets.stock WHERE outletNumber=" + this.outletNumber + " AND branchNumber=" + this.branchNumber + " AND shelfNumber=" + this.shelfNumber);
            
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
            System.err.println("database connection " + e.getMessage() + " SQLState: " + e.getSQLState());
        } 
        
        catch (InstantiationException ex) 
        
        {
            Logger.getLogger(OutletsReceiver.class.getName()).log(Level.SEVERE, null, ex);
        } 
        
        catch (IllegalAccessException ex) 
        
        {
            Logger.getLogger(OutletsReceiver.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        //get resultset from statement
        try
        {
            resultSet = statement.executeQuery();
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        //extract object from resultset
        try
            
        {

            if (resultSet.next() == true) 

            {
                
                count = Integer.parseInt(resultSet.getString("COUNT(*)")); 
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    public int getShopCount() throws ClassNotFoundException
            
    {
        int count = 0;

        //make connection and database statement
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(URL, baseUsername, basePassword);
            statement = connection.prepareStatement("SELECT COUNT(*) from chilloutlets.shelves WHERE outletNumber=" + this.outletNumber + " AND branchNumber=" + this.branchNumber);
            
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
            System.err.println("database connection " + e.getMessage() + " SQLState: " + e.getSQLState());
        } 
        
        catch (InstantiationException ex) 
        
        {
            Logger.getLogger(OutletsReceiver.class.getName()).log(Level.SEVERE, null, ex);
        } 
        
        catch (IllegalAccessException ex) 
        
        {
            Logger.getLogger(OutletsReceiver.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        //get resultset from statement
        try
        {
            resultSet = statement.executeQuery();
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        //extract object from resultset
        try
            
        {

            if (resultSet.next() == true) 

            {
                
                count = Integer.parseInt(resultSet.getString("COUNT(*)")); 
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    private void fillShelfName()
            
    {
        connection = null;
        statement = null;
        resultSet = null;
        
        int count = 0;
        int columnCount = 0;
        int rowCount = 0;
        
        //make connection and database statement
        try
            
        {
            connection = DriverManager.getConnection(URL, baseUsername, basePassword); 
            statement = connection.prepareStatement("SELECT shelfName from chilloutlets.shelves WHERE outletNumber=" + this.outletNumber + " AND branchNumber=" + this.branchNumber + " AND shelfNumber=" + this.shelfNumber);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //get resultset from statement
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
        
        //continually get object parts from result set if still exists
        try
            
        {
            if (resultSet != null)
                
            {
                
                    if (resultSet.next() == true)
                            
                    {
                        this.shelfName = resultSet.getString("shelfName");
                    }
                    
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private String markup(String price)
            
    {
        double distance = 10.0;         //store's distance in km
        double quantifier = 0.5;        //fixed constant
        double listingPrice;
        double companyMarkup;
        double carrierMarkup;
        
        if (price.charAt(0) == '$')
            
        {
            price = price.substring(1);
        }
        
        DecimalFormat format = new DecimalFormat("#0.00");
        
        listingPrice = Double.parseDouble(price);
        carrierMarkup = listingPrice + (quantifier * distance / listingPrice);
        companyMarkup = listingPrice * 0.25;
        
        carrierMarkup = 0.00;
        
        double markedUpPrice = listingPrice + carrierMarkup + companyMarkup;
        
        price = format.format(markedUpPrice);
        
        return price;
    }

    public int getOutletNumber() 
    
    {
        return outletNumber;
    }

    public void setOutletNumber(int outletNumber) 
    
    {
        this.outletNumber = outletNumber;
    }

    public int getBranchNumber() 
    
    {
        return branchNumber;
    }

    public void setBranchNumber(int branchNumber) 
    
    {
        this.branchNumber = branchNumber;
    }

    public int getShelfNumber() 
    
    {
        return shelfNumber;
    }

    public void setShelfNumber(int shelfNumber) 
    
    {
        this.shelfNumber = shelfNumber;
    }

    public String getBanner() 
    
    {
        return banner;
    }

    public void setBanner(String banner) 
    
    {
        this.banner = banner;
    }

    public String getShelfName() 
    
    {
        return shelfName;
    }

    public int getColumnSize() 
    
    {
        return columnSize;
    }

    public int getRowSize() 
    
    {
        return rowSize;
    }
    
    public Stock getShelves(int column, int row)
            
    {
        return this.shelves[column][row];
    }
    
}
