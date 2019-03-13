/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shelves;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import outlets.OutletsReceiver;
import shelf.Shelf;

/**
 *
 * @author mac
 */
public class Shelves 

{
    private static final String URL = "jdbc:mysql://206.45.199.211:3306/chilloutlets";
    private static final String baseUsername = "ajirios";
    private static final String basePassword = "Empire";
    
    Connection connection;
    PreparedStatement statement;
    ResultSet resultSet;
    
    private int outletNumber;
    private int branchNumber;
    private Shelf[] shelves;
    private int size;
    
    public Shelves(int outletNumber, int branchNumber) throws ClassNotFoundException
            
    {
        this.outletNumber = outletNumber;
        this.branchNumber = branchNumber;
        size = getShelfCount();
        this.shelves = new Shelf[this.size];
        fillShelves();
    }
    
    private void fillShelves()
            
    {
        connection = null;
        statement = null;
        resultSet = null;
        
        int count;
        
        //make connection and database statement
        try
            
        {
            connection = DriverManager.getConnection(URL, baseUsername, basePassword); 
            statement = connection.prepareStatement("SELECT * from chilloutlets.shelves WHERE outletNumber=" + this.outletNumber + " AND branchNumber=" + this.branchNumber);
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
                
                        
                        for (count = 0; (count < this.size) && (resultSet.next() == true); count++)
                            
                        {
                            int shelfNumber = Integer.parseInt(resultSet.getString("shelfNumber"));
                            String shelfName = resultSet.getString("shelfName");
                            
                            this.shelves[count] = new Shelf(outletNumber, branchNumber, shelfNumber, shelfName);
                            
                        }
                        
                        
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private int getShelfCount() throws ClassNotFoundException
            
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
    
    public Shelf getShelf(int count)
            
    {
        return this.shelves[count];
    }
    
    public int getSize() 
    
    {
        return size;
    }
    
}
