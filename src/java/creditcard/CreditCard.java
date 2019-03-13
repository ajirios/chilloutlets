/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package creditcard;

/**
 *
 * @author ajirios
 */
public class CreditCard 

{
    private long customerID;
    private String creditCardNumber;
    private String creditCardType;
    private int expiryMonth;
    private int expiryYear;
    private String creditCardName;
    private String ccv;
    
    public CreditCard(long customerID)
            
    {
        this.customerID = customerID;
        this.creditCardNumber = null;
        this.creditCardType = null;
        this.expiryMonth = 0;
        this.expiryYear = 0;
        this.creditCardName = null;
        this.ccv = null;
    }
    
    public CreditCard(long customerID, String creditCardNumber, String creditCardType, int expiryMonth, int expiryYear, String creditCardName, String ccv)
            
    {
        this.customerID = customerID;
        this.creditCardNumber = creditCardNumber;
        this.creditCardType = creditCardType;
        this.expiryMonth = expiryMonth;
        this.expiryYear = expiryYear;
        this.creditCardName = creditCardName;
        this.ccv = ccv;
    }

    public long getCustomerID() 
    
    {
        return customerID;
    }

    public void setCustomerID(long customerID) 
    
    {
        this.customerID = customerID;
    }

    public String getCreditCardNumber() 
    
    {
        return creditCardNumber;
    }

    public void setCreditCardNumber(String creditCardNumber) 
    
    {
        this.creditCardNumber = creditCardNumber;
    }

    public String getCreditCardType() 
    
    {
        return creditCardType;
    }

    public void setCreditCardType(String creditCardType) 
    
    {
        this.creditCardType = creditCardType;
    }

    public int getExpiryMonth() 
    
    {
        return expiryMonth;
    }

    public void setExpiryMonth(int expiryMonth) 
    
    {
        this.expiryMonth = expiryMonth;
    }

    public int getExpiryYear() 
    
    {
        return expiryYear;
    }

    public void setExpiryYear(int expiryYear) 
    
    {
        this.expiryYear = expiryYear;
    }

    public String getCreditCardName() 
    
    {
        return creditCardName;
    }

    public void setCreditCardName(String creditCardName) 
    
    {
        this.creditCardName = creditCardName;
    }

    public String getCcv() 
    
    {
        return ccv;
    }

    public void setCcv(String ccv) 
    
    {
        this.ccv = ccv;
    }
    
}
