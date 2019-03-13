/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package maps;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import outlet.Outlet;
import outlet.OutletUpdater;

/**
 *
 * @author mac
 */
public class CoordinateInsert 

{
    private static final String URL = "jdbc:mysql://206.45.199.211:3306/chilloutlets";
    private static final String baseUsername = "ajirios";
    private static final String basePassword = "Empire";
    
    Connection connection;
    PreparedStatement statement;
    ResultSet resultSet;
    
    private int start;
    private int end;
    private double latitude;
    private double longitude;
    private final int numberOfCityOutlets;
    private Outlet[] unorganizedOutlets;
    private Coordinator coordinator;
    
    public CoordinateInsert(int start, int end) throws ClassNotFoundException, Exception
            
    {
        this.start = start;
        this.end = end;
        coordinator = null;
        this.numberOfCityOutlets = makeNumberOfCityOutlets();
        this.unorganizedOutlets = new Outlet[this.numberOfCityOutlets];
        initializeOutletsByGeolog();
    }
    
    private int makeNumberOfCityOutlets() throws ClassNotFoundException, InstantiationException, IllegalAccessException
            
    {
        int count = 0;

        //make connection and database statement
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(URL, baseUsername, basePassword);
            statement = connection.prepareStatement("SELECT COUNT(*) from branches");
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
            System.err.println("database connection " + e.getMessage() + " SQLState: " + e.getSQLState());
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
    
    private void initializeOutletsByGeolog() throws Exception
            
    {
        connection = null;
        statement = null;
        resultSet = null;
        
        int count;
        OutletUpdater updater = null;
        
        //make connection and database statement
        try
            
        {
            connection = DriverManager.getConnection(URL, baseUsername, basePassword); 
            statement = connection.prepareStatement("SELECT * from branches");
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
                
                    for (count = 0; (count < this.numberOfCityOutlets) && (resultSet.next() == true); count++) 
                        
                    {
                        
                        this.unorganizedOutlets[count] = new Outlet(Integer.parseInt(resultSet.getString("outletNumber")), Integer.parseInt(resultSet.getString("branchNumber")));
                        this.unorganizedOutlets[count].setBranchAddress(resultSet.getString("branchAddress") + ", Winnipeg, Manitoba, Canada");
                        
                    }
                    
            }
            
            else
                
            {
                
                 
            
            }
            
                    for (count = this.start; (count < this.end) && (this.unorganizedOutlets[count] != null); count++) 
                        
                    {
                        
                        coordinator = new Coordinator(this.unorganizedOutlets[count].getBranchAddress());
                        updater = new OutletUpdater(this.unorganizedOutlets[count].getOutletNumber(), this.unorganizedOutlets[count].getBranchNumber());
                        updater.setCoordinates(this.coordinator.getLatitude(), this.coordinator.getLongitude());
                        
                    }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public Outlet getOutlet(int count)
            
    {
        return this.unorganizedOutlets[count];
    }
    
    public int length()
            
    {
        return this.numberOfCityOutlets;
    }
    
}
