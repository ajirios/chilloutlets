/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package outlets;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import maps.distance.CitySearch;
import outlet.Outlet;

/**
 *
 * @author ajirios
 */
public class OutletsReceiver 

{
    private static final String URL = "jdbc:mysql://206.45.199.211:3306/chilloutlets";
    private static final String baseUsername = "ajirios";
    private static final String basePassword = "Empire";
    
    private static final String geologSampleStatement = "select branchAddress, branchLocation, "
            + "power(power(latitude - '49.898320',2)+power(longitude - '-97.135780',2),0.5) as geolog "
            + "from chilloutlets.branches where latitude is not null and longitude is not null order by geolog asc;";
    
    private static final String geologStatement = "SELECT * from chilloutlets.outlets JOIN "
            + "(select *, power(power(latitude - '49.898320',2)+power(longitude - '-97.135780',2),0.5) as geolog "
            + "from chilloutlets.branches where latitude is not null and longitude is not null) as gtable "
            + "ON chilloutlets.outlets.outletNumber=chilloutlets.gtable.outletNumber WHERE city=\"Winnipeg\" order by geolog asc;";
    
    Connection connection;
    PreparedStatement statement;
    ResultSet resultSet;
    
    private final String customerAddress;
    private double latitude;
    private double longitude;
    private final String city;
    private final int numberOfCityOutlets;
    private Outlet[] unorganizedOutlets;
    private Outlet[] organizedOutlets;
    
    public OutletsReceiver(String customerAddress, String city) throws ClassNotFoundException, Exception
            
    {
        this.customerAddress = customerAddress;
        this.city = city;
        this.latitude = 49.898320;
        this.longitude = -97.135780;
        this.numberOfCityOutlets = 100;
        //this.numberOfCityOutlets = makeNumberOfCityOutlets();
        this.unorganizedOutlets = new Outlet[this.numberOfCityOutlets];
        initializeUnorganizedOutletsByCity();
        calculateOutletOrders();
        //sortOutletOrders();
    }
    
    public OutletsReceiver(String customerAddress, double latitude, double longitude, String city) throws ClassNotFoundException, Exception
            
    {
        this.customerAddress = customerAddress;
        this.city = city;
        this.latitude = latitude;
        this.longitude = longitude;
        this.numberOfCityOutlets = 100;
        //this.numberOfCityOutlets = makeNumberOfCityOutlets();
        this.unorganizedOutlets = new Outlet[this.numberOfCityOutlets];
        initializeOutletsByGeolog();
        calculateOutletOrders();
        //sortOutletOrders();
    }
    
    private int makeNumberOfCityOutlets() throws ClassNotFoundException
            
    {
        int count = 0;

        //make connection and database statement
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(URL, baseUsername, basePassword);
            statement = connection.prepareStatement("SELECT COUNT(*) from chilloutlets.outlets JOIN chilloutlets.branches" +
                                " ON chilloutlets.outlets.outletNumber=chilloutlets.branches.outletNumber WHERE city='" + this.city + "'");
            
            //statement = this.connection.prepareStatement("select * from `chilloutlets`.`outlets`");
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
    
    private void initializeOutletsByGeolog()
            
    {
        connection = null;
        statement = null;
        resultSet = null;
        
        int count;
        
        //make connection and database statement
        try
            
        {
            connection = DriverManager.getConnection(URL, baseUsername, basePassword); 
            statement = connection.prepareStatement("SELECT * from chilloutlets.outlets JOIN "
            + "(select *, power(power(latitude - '" + this.latitude + "',2)+power(longitude - '" + this.longitude + "',2),0.5) as geolog "
            + "from chilloutlets.branches where latitude is not null and longitude is not null) as gtable "
            + "ON chilloutlets.outlets.outletNumber=chilloutlets.gtable.outletNumber WHERE city='" + this.city + "' order by geolog asc");
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
                        this.unorganizedOutlets[count].setBranchAddress(resultSet.getString("branchAddress"));
                        this.unorganizedOutlets[count].setBranchLocation(resultSet.getString("branchLocation"));
                        this.unorganizedOutlets[count].setOutletName(resultSet.getString("outletName"));
                        this.unorganizedOutlets[count].setOutletPoster(resultSet.getString("poster"));
                        this.unorganizedOutlets[count].setPhoneNumber(resultSet.getString("phoneNumber"));
                        this.unorganizedOutlets[count].setCity(resultSet.getString("city"));
                        this.unorganizedOutlets[count].setCountry(resultSet.getString("country"));
                        this.unorganizedOutlets[count].setRegion(resultSet.getString("region"));
                        this.unorganizedOutlets[count].setLongitude(resultSet.getString("longitude"));
                        this.unorganizedOutlets[count].setLatitude(resultSet.getString("latitude"));
                        this.unorganizedOutlets[count].setReleaseStatus(resultSet.getString("releaseStatus"));
                        
                        if (resultSet.getString("demandRate") != null)
                            
                        {
                            
                            this.unorganizedOutlets[count].setDemandRate(Double.parseDouble(resultSet.getString("demandRate")));
                            
                        }
                        
                        this.unorganizedOutlets[count].setMondayOpening(resultSet.getString("MondayOpening"));
                        this.unorganizedOutlets[count].setMondayClosing(resultSet.getString("MondayClosing"));
                        this.unorganizedOutlets[count].setTuesdayOpening(resultSet.getString("TuesdayOpening"));
                        this.unorganizedOutlets[count].setTuesdayClosing(resultSet.getString("TuesdayClosing"));
                        this.unorganizedOutlets[count].setWednesdayOpening(resultSet.getString("WednesdayOpening"));
                        this.unorganizedOutlets[count].setWednesdayClosing(resultSet.getString("WednesdayClosing"));
                        this.unorganizedOutlets[count].setThursdayOpening(resultSet.getString("ThursdayOpening"));
                        this.unorganizedOutlets[count].setThursdayClosing(resultSet.getString("ThursdayClosing"));
                        this.unorganizedOutlets[count].setFridayOpening(resultSet.getString("FridayOpening"));
                        this.unorganizedOutlets[count].setFridayClosing(resultSet.getString("FridayClosing"));
                        this.unorganizedOutlets[count].setSaturdayOpening(resultSet.getString("SaturdayOpening"));
                        this.unorganizedOutlets[count].setSaturdayClosing(resultSet.getString("SaturdayClosing"));
                        this.unorganizedOutlets[count].setSundayOpening(resultSet.getString("SundayOpening"));
                        this.unorganizedOutlets[count].setSundayClosing(resultSet.getString("SundayClosing"));
                        
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
    
    private void initializeUnorganizedOutletsByCity()
            
    {
        connection = null;
        statement = null;
        resultSet = null;
        
        int count;
        
        //make connection and database statement
        try
            
        {
            connection = DriverManager.getConnection(URL, baseUsername, basePassword); 
            statement = connection.prepareStatement("SELECT * from chilloutlets.outlets JOIN chilloutlets.branches" +
                                                    " ON chilloutlets.outlets.outletNumber=chilloutlets.branches.outletNumber WHERE city='" + this.city + "'");
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
                    
                    for (count = 0; (count < this.numberOfCityOutlets) && (resultSet.next() == true); count++) 
                        
                    {
                        
                        this.unorganizedOutlets[count] = new Outlet(Integer.parseInt(resultSet.getString("outletNumber")), Integer.parseInt(resultSet.getString("branchNumber")));
                        this.unorganizedOutlets[count].setBranchAddress(resultSet.getString("branchAddress"));
                        this.unorganizedOutlets[count].setBranchLocation(resultSet.getString("branchLocation"));
                        this.unorganizedOutlets[count].setOutletName(resultSet.getString("outletName"));
                        this.unorganizedOutlets[count].setOutletPoster(resultSet.getString("poster"));
                        this.unorganizedOutlets[count].setPhoneNumber(resultSet.getString("phoneNumber"));
                        this.unorganizedOutlets[count].setCity(resultSet.getString("city"));
                        this.unorganizedOutlets[count].setCountry(resultSet.getString("country"));
                        this.unorganizedOutlets[count].setRegion(resultSet.getString("region"));
                        this.unorganizedOutlets[count].setLongitude(resultSet.getString("longitude"));
                        this.unorganizedOutlets[count].setLatitude(resultSet.getString("latitude"));
                        this.unorganizedOutlets[count].setReleaseStatus(resultSet.getString("releaseStatus"));
                        
                        if (resultSet.getString("demandRate") != null)
                            
                        {
                            
                            this.unorganizedOutlets[count].setDemandRate(Double.parseDouble(resultSet.getString("demandRate")));
                            
                        }
                        
                        this.unorganizedOutlets[count].setMondayOpening(resultSet.getString("MondayOpening"));
                        this.unorganizedOutlets[count].setMondayClosing(resultSet.getString("MondayClosing"));
                        this.unorganizedOutlets[count].setTuesdayOpening(resultSet.getString("TuesdayOpening"));
                        this.unorganizedOutlets[count].setTuesdayClosing(resultSet.getString("TuesdayClosing"));
                        this.unorganizedOutlets[count].setWednesdayOpening(resultSet.getString("WednesdayOpening"));
                        this.unorganizedOutlets[count].setWednesdayClosing(resultSet.getString("WednesdayClosing"));
                        this.unorganizedOutlets[count].setThursdayOpening(resultSet.getString("ThursdayOpening"));
                        this.unorganizedOutlets[count].setThursdayClosing(resultSet.getString("ThursdayClosing"));
                        this.unorganizedOutlets[count].setFridayOpening(resultSet.getString("FridayOpening"));
                        this.unorganizedOutlets[count].setFridayClosing(resultSet.getString("FridayClosing"));
                        this.unorganizedOutlets[count].setSaturdayOpening(resultSet.getString("SaturdayOpening"));
                        this.unorganizedOutlets[count].setSaturdayClosing(resultSet.getString("SaturdayClosing"));
                        this.unorganizedOutlets[count].setSundayOpening(resultSet.getString("SundayOpening"));
                        this.unorganizedOutlets[count].setSundayClosing(resultSet.getString("SundayClosing"));
                        
                    }
                    
                }
                
                else
                    
                {
                    
                     
                    
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
    
    public Outlet getOutlet(int count)
            
    {
        return this.unorganizedOutlets[count];
    }
    
    public int length()
            
    {
        return this.numberOfCityOutlets;
    }
    
    private void calculateOutletOrders() throws IOException, Exception
            
    {
        int count;
        String fullOutletAddress;
        CitySearch search;
        String[] origins = new String[1];
        String[] destinations = new String[this.numberOfCityOutlets];
        long[] distances;
        long[] durations;
        
        origins[0] = this.customerAddress;
        
        
        for (count = 0; (count < this.numberOfCityOutlets); count++)
            
        {
            fullOutletAddress = this.unorganizedOutlets[count].getBranchAddress() + ", " + this.unorganizedOutlets[count].getCity() + ", " + 
                    this.unorganizedOutlets[count].getRegion() + ", " + this.unorganizedOutlets[count].getCountry();
            
            destinations[count] = fullOutletAddress;
            
        }
        
        
        search = new CitySearch();
        
        distances = search.getDistanceMatrix(origins, destinations);
        durations = search.getDurationMatrix(origins, destinations);
        
        //now you can copy distances and durations from their arrays into outlets object arrays.
        for (count = 0; (count < this.numberOfCityOutlets); count++)
            
        {
            
            this.unorganizedOutlets[count].setDistance(distances[count]);
            this.unorganizedOutlets[count].setDuration(durations[count]);
            
            
            //fill display distance km
            DecimalFormat decimalFormat = new DecimalFormat("#0.00");
            double calculatedDistance = (double) this.unorganizedOutlets[count].getDistance() / 1000.0;
            String displayDistance = decimalFormat.format(calculatedDistance) + " km";
            this.unorganizedOutlets[count].setDisplayDistance(displayDistance);
            
            //fill outlet transit fees
            //fee variables are start fee of $6 or $7 + distance x 0.00130.
            double transitFee = 0.0 * (double) this.unorganizedOutlets[count].getDistance() + (double) this.unorganizedOutlets[count].getDistance() * 0.0008;
            transitFee = 3.95;
            
            String displayedTransitFee = "$" + decimalFormat.format(transitFee);
            this.unorganizedOutlets[count].setTransitFee(displayedTransitFee);
            
            //fill outlet delivery times
            double transitTime = 20.0 + 2.0 * (double) this.unorganizedOutlets[count].getDuration() / 60.0;
            double transitEnd = transitTime + 30.0;
            String displayedTransitTime = String.valueOf((int) transitTime) + " - " + String.valueOf((int) transitEnd) + " mins.";
            this.unorganizedOutlets[count].setDeliveryTime(displayedTransitTime);
            
        }
        
    }
    
    public Connection getConnection()
            
    {
        return this.connection;
    }
    
    public PreparedStatement getStatement()
            
    {
        return this.statement;
    }
    
}
