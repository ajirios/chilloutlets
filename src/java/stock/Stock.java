/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stock;

/**
 *
 * @author ajirios
 */
public class Stock 

{
    private int outletNumber;
    private int branchNumber;
    private int shelfNumber;
    private String outletName;
    private String address;
    private String city;
    private String region;
    private String country;
    private String latitude;
    private String longitude;
    private int stockNumber;
    private String stockName;
    private String stockImage;
    private String price;
    private int quantity;
    private String entryState;
    private String stockDescription;
    private String stockArticle;
    
    public Stock(int outletNumber, int branchNumber, int shelfNumber, int stockNumber, String stockName, String stockImage, String price, String entryState)
            
    {
        this.outletNumber = outletNumber;
        this.branchNumber = branchNumber;
        this.shelfNumber = shelfNumber;
        this.stockNumber = stockNumber;
        this.stockName = stockName;
        this.stockImage = stockImage;
        this.price = price;
        this.quantity = 1;
        this.entryState = entryState;
        this.stockDescription = null;
        this.stockArticle = null;
        this.outletName = null;
        this.address = null;
        this.city = null;
        this.region = null;
        this.country = null;
        this.latitude = null;
        this.longitude = null;
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

    public int getStockNumber() 
    
    {
        return stockNumber;
    }

    public void setStockNumber(int stockNumber) 
    
    {
        this.stockNumber = stockNumber;
    }

    public String getStockName() 
    
    {
        return stockName;
    }

    public void setStockName(String stockName) 
    
    {
        this.stockName = stockName;
    }

    public String getStockImage() 
    
    {
        return stockImage;
    }

    public void setStockImage(String stockImage) 
    
    {
        this.stockImage = stockImage;
    }

    public String getPrice() 
    
    {
        return price;
    }

    public void setPrice(String price) 
    
    {
        this.price = price;
    }

    public String getEntryState() 
    
    {
        return entryState;
    }

    public void setEntryState(String entryState) 
    
    {
        this.entryState = entryState;
    }

    public String getStockArticle() 
    
    {
        return stockArticle;
    }

    public void setStockArticle(String stockArticle) 
    
    {
        this.stockArticle = stockArticle;
    }

    public String getStockDescription() 
    
    {
        return stockDescription;
    }

    public void setStockDescription(String stockDescription) 
    
    {
        this.stockDescription = stockDescription;
    }

    public int getQuantity() 
    
    {
        return quantity;
    }

    public void setQuantity(int quantity) 
    
    {
        this.quantity = quantity;
    }

    public String getAddress() 
    
    {
        return address;
    }

    public void setAddress(String address) 
    
    {
        this.address = address;
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

    public String getLatitude() 
    
    {
        return latitude;
    }

    public void setLatitude(String latitude) 
    
    {
        this.latitude = latitude;
    }

    public String getLongitude() 
    
    {
        return longitude;
    }

    public void setLongitude(String longitude) 
    
    {
        this.longitude = longitude;
    }
    
    public String getOutletName() 
    
    {
        return outletName;
    }

    public void setOutletName(String outletName) 
    
    {
        this.outletName = outletName;
    }
    
}
