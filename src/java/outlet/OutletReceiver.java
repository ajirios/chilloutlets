/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package outlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ajirios
 */
public class OutletReceiver 

{
    private static final String URL = "jdbc:mysql://206.45.199.211:3306/chilloutlets";
    private static final String baseUsername = "ajirios";
    private static final String basePassword = "Empire";
    
    Connection connection;
    PreparedStatement statement;
    ResultSet resultSet;
    
    private int outletNumber;
    private int branchNumber;
    private Outlet outlet;
    
    public OutletReceiver(int outletNumber)
            
    {
        this.outletNumber = outletNumber;
        this.outlet = new Outlet(outletNumber);
    }
    
    public OutletReceiver(int outletNumber, int branchNumber)
            
    {
        this.outletNumber = outletNumber;
        this.branchNumber = branchNumber;
        this.outlet = new Outlet(outletNumber, branchNumber);
        
        constructOutletBranch();
    }
    
    private void constructOutletBranch()
            
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
            connection = DriverManager.getConnection(URL, baseUsername, basePassword); 
            statement = connection.prepareStatement("SELECT * FROM chilloutlets.branches join chilloutlets.outlets ON chilloutlets.outlets.outletNumber=chilloutlets.branches.outletNumber" +
                                " WHERE chilloutlets.branches.outletNumber=" + this.outletNumber + " AND chilloutlets.branches.branchNumber=" + this.branchNumber);
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
                    
                    this.outlet.setOutletName(resultSet.getString("outletName"));
                    this.outlet.setBranchAddress(resultSet.getString("branchAddress"));
                    this.outlet.setLatitude(resultSet.getString("latitude"));
                    this.outlet.setLongitude(resultSet.getString("longitude"));
                    this.outlet.setCity(resultSet.getString("city"));
                    this.outlet.setRegion(resultSet.getString("region"));
                    this.outlet.setCountry(resultSet.getString("country"));
                    
                }
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public Outlet getOutlet() 
    
    {
        return outlet;
    }
    
}
