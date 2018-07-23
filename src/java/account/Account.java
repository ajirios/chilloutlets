/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account;

/**
 *
 * @author ajirios
 */
public class Account 

{
    protected long accountID;
    protected String accountEmail;
    protected String accountPassword;
    
    public Account(long accountID)
            
    {
        this.accountID = accountID;
        this.accountEmail = null;
        this.accountPassword = null;
    }
    
    public Account(long accountID, String accountEmail, String accountPassword)
            
    {
        this.accountID = accountID;
        this.accountEmail = accountEmail;
        this.accountPassword = accountPassword;
    }

    public String getAccountEmail() 
    
    {
        return accountEmail;
    }

    public void setAccountEmail(String accountEmail) 
    
    {
        this.accountEmail = accountEmail;
    }

    public String getAccountPassword() 
    
    {
        return accountPassword;
    }

    public void setAccountPassword(String accountPassword) 
    
    {
        this.accountPassword = accountPassword;
    }
    
}
