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
    protected long customerID;
    protected String customerFirstName;
    protected String customerMiddleName;
    protected String customerLastName;
    protected String customerFullName;
    
    public Customer(long customerID)
            
    {
        this.customerID = customerID;
        this.customerFirstName = null;
        this.customerMiddleName = null;
        this.customerLastName = null;
        this.customerFullName = null;
    }
    
    public Customer(long customerID, String customerFirstName, String customerMiddleName, String customerLastName, String customerFullName)
            
    {
        this.customerID = customerID;
        this.customerFirstName = customerFirstName;
        this.customerMiddleName = customerMiddleName;
        this.customerLastName = customerLastName;
        this.customerFullName = customerFullName;
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

    public String getCustomerFullName() 
    
    {
        return customerFullName;
    }

    public void setCustomerFullName(String customerFullName) 
    
    {
        this.customerFullName = customerFullName;
    }
    
}
