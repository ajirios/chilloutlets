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
    private String cardNumber;
    private String cardType;
    private String cardExpiryMonth;
    private String cardExpiryYear;
    private String cardName;
    private String cardVerification;
    
    public CreditCard(String cardNumber)
            
    {
        this.cardNumber = cardNumber;
        this.cardType = null;
        this.cardExpiryMonth = null;
        this.cardExpiryYear = null;
        this.cardName = null;
        this.cardVerification = null;
    }
    
    public CreditCard(String cardNumber, String cardType, String cardExpiryMonth, String cardExpiryYear, String cardName, String cardVerification)
            
    {
        this.cardNumber = cardNumber;
        this.cardType = cardType;
        this.cardExpiryMonth = cardExpiryMonth;
        this.cardExpiryYear = cardExpiryYear;
        this.cardName = cardName;
        this.cardVerification = cardVerification;
    }

    public String getCardType() 
    
    {
        return cardType;
    }

    public void setCardType(String cardType) 
    
    {
        this.cardType = cardType;
    }

    public String getCardExpiryMonth() 
    
    {
        return cardExpiryMonth;
    }

    public void setCardExpiryMonth(String cardExpiryMonth) 
    
    {
        this.cardExpiryMonth = cardExpiryMonth;
    }

    public String getCardExpiryYear() 
    
    {
        return cardExpiryYear;
    }

    public void setCardExpiryYear(String cardExpiryYear) 
    
    {
        this.cardExpiryYear = cardExpiryYear;
    }

    public String getCardName() 
    
    {
        return cardName;
    }

    public void setCardName(String cardName) 
    
    {
        this.cardName = cardName;
    }

    public String getCardVerification() 
    
    {
        return cardVerification;
    }

    public void setCardVerification(String cardVerification) 
    
    {
        this.cardVerification = cardVerification;
    }
    
}
