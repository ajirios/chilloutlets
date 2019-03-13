/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package outlet;

/**
 *
 * @author ajirios
 */
public class Outlet 

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
    
    public Outlet(int outletNumber)
            
    {
        this.outletNumber = outletNumber;
        this.outletName = null;
        this.outletPoster = null;
        this.branchNumber = -1;
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
    
    public Outlet(int outletNumber, int branchNumber)
            
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

    public int getOutletNumber() 
    
    {
        return outletNumber;
    }

    public void setOutletNumber(int outletNumber) 
    
    {
        this.outletNumber = outletNumber;
    }

    public String getOutletName() 
    
    {
        return outletName;
    }

    public void setOutletName(String outletName) 
    
    {
        this.outletName = outletName;
    }

    public String getOutletPoster() 
    
    {
        return outletPoster;
    }

    public void setOutletPoster(String outletPoster) 
    
    {
        this.outletPoster = outletPoster;
    }

    public int getBranchNumber() 
    
    {
        return branchNumber;
    }

    public void setBranchNumber(int branchNumber) 
    
    {
        this.branchNumber = branchNumber;
    }

    public String getBranchAddress() 
    
    {
        return branchAddress;
    }

    public void setBranchAddress(String branchAddress) 
    
    {
        this.branchAddress = branchAddress;
    }

    public String getBranchLocation() 
    
    {
        return branchLocation;
    }

    public void setBranchLocation(String branchLocation) 
    
    {
        this.branchLocation = branchLocation;
    }

    public String getLongitude() 
    
    {
        return longitude;
    }

    public void setLongitude(String longitude) 
    
    {
        this.longitude = longitude;
    }

    public String getLatitude() 
    
    {
        return latitude;
    }

    public void setLatitude(String latitude) 
    
    {
        this.latitude = latitude;
    }

    public String getPhoneNumber() 
    
    {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) 
    
    {
        this.phoneNumber = phoneNumber;
    }

    public String getReleaseStatus() 
    
    {
        return releaseStatus;
    }

    public void setReleaseStatus(String releaseStatus) 
    
    {
        this.releaseStatus = releaseStatus;
    }

    public double getDemandRate() 
    
    {
        return demandRate;
    }

    public void setDemandRate(double demandRate) 
    
    {
        this.demandRate = demandRate;
    }

    public String getCity() 
    
    {
        return city;
    }

    public void setCity(String city) 
    
    {
        this.city = city;
    }

    public String getRegion() 
    
    {
        return region;
    }

    public void setRegion(String region) 
    
    {
        this.region = region;
    }

    public String getCountry() 
    
    {
        return country;
    }

    public void setCountry(String country) 
    
    {
        this.country = country;
    }

    public String getMondayOpening() 
    
    {
        return mondayOpening;
    }

    public void setMondayOpening(String mondayOpening) 
    
    {
        this.mondayOpening = mondayOpening;
    }

    public String getMondayClosing() 
    
    {
        return mondayClosing;
    }

    public void setMondayClosing(String mondayClosing) 
    
    {
        this.mondayClosing = mondayClosing;
    }

    public String getTuesdayOpening() 
    
    {
        return tuesdayOpening;
    }

    public void setTuesdayOpening(String tuesdayOpening) 
    
    {
        this.tuesdayOpening = tuesdayOpening;
    }

    public String getTuesdayClosing() 
    
    {
        return tuesdayClosing;
    }

    public void setTuesdayClosing(String tuesdayClosing) 
    
    {
        this.tuesdayClosing = tuesdayClosing;
    }

    public String getWednesdayOpening() 
    
    {
        return wednesdayOpening;
    }

    public void setWednesdayOpening(String wednesdayOpening) 
    
    {
        this.wednesdayOpening = wednesdayOpening;
    }

    public String getWednesdayClosing() 
    
    {
        return wednesdayClosing;
    }

    public void setWednesdayClosing(String wednesdayClosing) 
    
    {
        this.wednesdayClosing = wednesdayClosing;
    }

    public String getThursdayOpening() 
    
    {
        return thursdayOpening;
    }

    public void setThursdayOpening(String thursdayOpening) 
    
    {
        this.thursdayOpening = thursdayOpening;
    }

    public String getThursdayClosing() 
    
    {
        return thursdayClosing;
    }

    public void setThursdayClosing(String thursdayClosing) 
    
    {
        this.thursdayClosing = thursdayClosing;
    }

    public String getFridayOpening() 
    
    {
        return fridayOpening;
    }

    public void setFridayOpening(String fridayOpening) 
    
    {
        this.fridayOpening = fridayOpening;
    }

    public String getFridayClosing() 
    
    {
        return fridayClosing;
    }

    public void setFridayClosing(String fridayClosing) 
    
    {
        this.fridayClosing = fridayClosing;
    }

    public String getSaturdayOpening() 
    
    {
        return saturdayOpening;
    }

    public void setSaturdayOpening(String saturdayOpening) 
    
    {
        this.saturdayOpening = saturdayOpening;
    }

    public String getSaturdayClosing() 
    
    {
        return saturdayClosing;
    }

    public void setSaturdayClosing(String saturdayClosing) 
    
    {
        this.saturdayClosing = saturdayClosing;
    }

    public String getSundayOpening() 
    
    {
        return sundayOpening;
    }

    public void setSundayOpening(String sundayOpening) 
    
    {
        this.sundayOpening = sundayOpening;
    }

    public String getSundayClosing() 
    
    {
        return sundayClosing;
    }

    public void setSundayClosing(String sundayClosing) 
    
    {
        this.sundayClosing = sundayClosing;
    }

    public String getDisplayDistance() 
    
    {
        return displayDistance;
    }

    public void setDisplayDistance(String displayDistance) 
    
    {
        this.displayDistance = displayDistance;
    }

    public long getDistance() 
    
    {
        return distance;
    }

    public void setDistance(long distance) 
    
    {
        this.distance = distance;
    }

    public long getDuration() 
    
    {
        return duration;
    }

    public void setDuration(long duration) 
    
    {
        this.duration = duration;
    }

    public String getTransitFee() 
    
    {
        return transitFee;
    }

    public void setTransitFee(String transitFee) 
    
    {
        this.transitFee = transitFee;
    }

    public String getDeliveryTime() 
    
    {
        return deliveryTime;
    }

    public void setDeliveryTime(String deliveryTime) 
    
    {
        this.deliveryTime = deliveryTime;
    }
    
}
