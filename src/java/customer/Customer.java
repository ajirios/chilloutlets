/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package customer;

/**
 *
 * @author ajirios
 */
public class Customer 

{
    private long customerID;
    private String customerFullName;
    private String customerEmail;
    private String customerPassword;
    private String customerStreetAddress;
    private String city;
    private String region;
    private String country;
    private String customerPhoneNumber;
    private String customerFirstName;
    private String customerMiddleName;
    private String customerLastName;
    private String customerCredit;
    
    public Customer(long customerID)
            
    {
        this.customerID = customerID;
        this.customerFullName = null;
        this.customerEmail = null;
        this.customerPhoneNumber = null;
        this.customerPassword = null;
        this.customerFirstName = null;
        this.customerMiddleName = null;
        this.customerLastName = null;
        this.customerStreetAddress = null;
        this.city = null;
        this.region = null;
        this.country = null;
        this.customerCredit = null;
    }

    public long getCustomerID() 
    
    {
        return customerID;
    }

    public void setCustomerID(long customerID) 
    
    {
        this.customerID = customerID;
    }

    public String getCustomerFullName() 
    
    {
        return customerFullName;
    }

    public void setCustomerFullName(String customerFullName) 
    
    {
        this.customerFullName = customerFullName;
    }

    public String getCustomerEmail() 
    
    {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) 
    
    {
        this.customerEmail = customerEmail;
    }

    public String getCustomerPassword() 
    
    {
        return customerPassword;
    }

    public void setCustomerPassword(String customerPassword) 
    
    {
        this.customerPassword = customerPassword;
    }

    public String getCustomerStreetAddress() 
    
    {
        return customerStreetAddress;
    }

    public void setCustomerStreetAddress(String customerStreetAddress) 
    
    {
        this.customerStreetAddress = customerStreetAddress;
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

    public String getCustomerPhoneNumber() 
    
    {
        return customerPhoneNumber;
    }

    public void setCustomerPhoneNumber(String customerPhoneNumber) 
    
    {
        this.customerPhoneNumber = customerPhoneNumber;
    }

    public String getCustomerFirstName() 
    
    {
        return customerFirstName;
    }

    public void setCustomerFirstName(String customerFirstName) 
    
    {
        this.customerFirstName = customerFirstName;
    }

    public String getCustomerMiddleName() 
    
    {
        return customerMiddleName;
    }

    public void setCustomerMiddleName(String customerMiddleName) 
    
    {
        this.customerMiddleName = customerMiddleName;
    }

    public String getCustomerLastName() 
    
    {
        return customerLastName;
    }

    public void setCustomerLastName(String customerLastName) 
    
    {
        this.customerLastName = customerLastName;
    }

    public String getCustomerCredit() 
    
    {
        return customerCredit;
    }

    public void setCustomerCredit(String customerCredit) 
    
    {
        this.customerCredit = customerCredit;
    }
    
}
