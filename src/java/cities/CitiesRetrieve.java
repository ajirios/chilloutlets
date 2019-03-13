/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author mac
 */
public class CitiesRetrieve 

{
    private static final String URL = "jdbc:mysql://206.45.199.211:3306/chilloutlets";
    private static final String baseUsername = "ajirios";
    private static final String basePassword = "Empire";
    
    Connection connection;
    PreparedStatement statement;
    ResultSet resultSet;
    
    private String searchCriteria;
    private City[] cities;
    private int size;
    
    public CitiesRetrieve(String searchCriteria) throws ClassNotFoundException, InstantiationException, IllegalAccessException
            
    {
        this.searchCriteria = searchCriteria;
        this.size = getCitiesCount();
        this.cities = new City[this.size];
        retrieveCities();
    }
    
    private void retrieveCities()
            
    {
        connection = null;
        statement = null;
        resultSet = null;
        
        int count;
        
        //make connection and database statement
        try
            
        {
            connection = DriverManager.getConnection(URL, baseUsername, basePassword); 
            statement = connection.prepareStatement("SELECT * from chilloutlets.cities WHERE cityName like \"%" + this.searchCriteria + "%\"");
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
                        this.cities[count] = new City(Integer.parseInt(resultSet.getString("cityNumber")), resultSet.getString("cityName"));
                    }
                    
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public int getCitiesCount() throws ClassNotFoundException, InstantiationException, IllegalAccessException
            
    {
        int count = -1;

        //make connection and database statement
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(URL, baseUsername, basePassword);
            statement = connection.prepareStatement("SELECT COUNT(*) from cities WHERE cityName like \"%" + this.searchCriteria + "%\"");
            
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
            //resultSet.first();
            
            if (resultSet != null) 
                
            {
                while (resultSet.next() == true) 
                    
                {
                    count = Integer.parseInt(resultSet.getString("COUNT(*)")); 
                }
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return count;
        
    }

    public String getSearchCriteria() 
    
    {
        return searchCriteria;
    }
    
    public City getCity(int count)
            
    {
        return this.cities[count];
    }

    public int getSize() 
    
    {
        return size;
    }
    
}
