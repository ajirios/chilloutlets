/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package outlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author mac
 */
public class OutletUpdater 

{
    private int outletNumber;
    private String outletName;
    private String outletPoster;
    private int branchNumber;
    private String branchAddress;
    private String branchLocation;
    private String longitude;
    private String latitude;
    private String phoneNumber;
    private String releaseStatus;
    private double demandRate;
    private String city;
    private String region;
    private String country;
    private String mondayOpening;
    private String mondayClosing;
    private String tuesdayOpening;
    private String tuesdayClosing;
    private String wednesdayOpening;
    private String wednesdayClosing;
    private String thursdayOpening;
    private String thursdayClosing;
    private String fridayOpening;
    private String fridayClosing;
    private String saturdayOpening;
    private String saturdayClosing;
    private String sundayOpening;
    private String sundayClosing;
    
    private long distance;
    private long duration;
    private String displayDistance;
    private String transitFee;
    private String deliveryTime;
    
    private static final String URL = "jdbc:mysql://206.45.199.211:3306/chilloutlets";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire";
    
    public OutletUpdater(int outletNumber, int branchNumber)
            
    {
        this.outletNumber = outletNumber;
        this.outletName = null;
        this.outletPoster = null;
        this.branchNumber = branchNumber;
        this.branchAddress = null;
        this.branchLocation = null;
        this.longitude = null;
        this.latitude = null;
        this.phoneNumber = null;
        this.releaseStatus = null;
        this.demandRate = 0.0;
        this.city = null;
        this.region = null;
        this.country = null;
        this.mondayOpening = null;
        this.mondayClosing = null;
        this.tuesdayOpening = null;
        this.tuesdayClosing = null;
        this.wednesdayOpening = null;
        this.wednesdayClosing = null;
        this.thursdayOpening = null;
        this.thursdayClosing = null;
        this.fridayOpening = null;
        this.fridayClosing = null;
        this.saturdayOpening = null;
        this.saturdayClosing = null;
        this.sundayOpening = null;
        this.sundayClosing = null;
        
        this.distance = 0;
        this.duration = 0;
        this.displayDistance = null;
        this.transitFee = null;
        this.deliveryTime = null;
    }

    public void setOutletNumber(int outletNumber) 
    
    {
        this.outletNumber = outletNumber;
    }

    public void setOutletName(String outletName) 
    
    {
        this.outletName = outletName;
    }

    public void setOutletPoster(String outletPoster) 
    
    {
        this.outletPoster = outletPoster;
    }

    public void setBranchNumber(int branchNumber) 
    
    {
        this.branchNumber = branchNumber;
    }

    public void setBranchAddress(String branchAddress) 
    
    {
        this.branchAddress = branchAddress;
    }

    public void setBranchLocation(String branchLocation) 
    
    {
        this.branchLocation = branchLocation;
    }

    public void setLongitude(String longitude) 
    
    {
        this.longitude = longitude;
    }

    public void setLatitude(String latitude) 
    
    {
        this.latitude = latitude;
    }

    public void setCoordinates(String latitude, String longitude) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE branches set latitude='" + latitude + "', longitude='" + longitude + "' WHERE outletNumber=" + this.outletNumber + " AND branchNumber=" + this.branchNumber);
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
            
                result = statement.executeUpdate();
                this.latitude = latitude;
                this.longitude = longitude;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setPhoneNumber(String phoneNumber) 
    
    {
        this.phoneNumber = phoneNumber;
    }

    public void setReleaseStatus(String releaseStatus) 
    
    {
        this.releaseStatus = releaseStatus;
    }

    public void setDemandRate(double demandRate) 
    
    {
        this.demandRate = demandRate;
    }

    public void setCity(String city) 
    
    {
        this.city = city;
    }

    public void setRegion(String region) 
    
    {
        this.region = region;
    }

    public void setCountry(String country) 
    
    {
        this.country = country;
    }

    public void setMondayOpening(String mondayOpening) 
    
    {
        this.mondayOpening = mondayOpening;
    }

    public void setMondayClosing(String mondayClosing) 
    
    {
        this.mondayClosing = mondayClosing;
    }

    public void setTuesdayOpening(String tuesdayOpening) 
    
    {
        this.tuesdayOpening = tuesdayOpening;
    }

    public void setTuesdayClosing(String tuesdayClosing) 
    
    {
        this.tuesdayClosing = tuesdayClosing;
    }

    public void setWednesdayOpening(String wednesdayOpening) 
    
    {
        this.wednesdayOpening = wednesdayOpening;
    }

    public void setWednesdayClosing(String wednesdayClosing) 
    
    {
        this.wednesdayClosing = wednesdayClosing;
    }

    public void setThursdayOpening(String thursdayOpening) 
    
    {
        this.thursdayOpening = thursdayOpening;
    }

    public void setThursdayClosing(String thursdayClosing) 
    
    {
        this.thursdayClosing = thursdayClosing;
    }

    public void setFridayOpening(String fridayOpening) 
    
    {
        this.fridayOpening = fridayOpening;
    }

    public void setFridayClosing(String fridayClosing) 
    
    {
        this.fridayClosing = fridayClosing;
    }

    public void setSaturdayOpening(String saturdayOpening) 
    
    {
        this.saturdayOpening = saturdayOpening;
    }

    public void setSaturdayClosing(String saturdayClosing) 
    
    {
        this.saturdayClosing = saturdayClosing;
    }

    public void setSundayOpening(String sundayOpening) 
    
    {
        this.sundayOpening = sundayOpening;
    }

    public void setSundayClosing(String sundayClosing) 
    
    {
        this.sundayClosing = sundayClosing;
    }

    public void setDistance(long distance) 
    
    {
        this.distance = distance;
    }

    public void setDuration(long duration) 
    
    {
        this.duration = duration;
    }

    public void setDisplayDistance(String displayDistance) 
    
    {
        this.displayDistance = displayDistance;
    }

    public void setTransitFee(String transitFee) 
    
    {
        this.transitFee = transitFee;
    }

    public void setDeliveryTime(String deliveryTime) 
    
    {
        this.deliveryTime = deliveryTime;
    }
    
}
