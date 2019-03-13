/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package carrier;

/**
 *
 * @author mac
 */
public class Carrier 

{
    private long carrierID;
    private String accountStatus;
    private double onboardingStep;
    private String carrierEmail;
    private String carrierPassword;
    private String carrierLegalName;
    private String carrierFirstName;
    private String carrierMiddleName;
    private String carrierLastName;
    private String carrierSIN;
    private String carrierLicenseNumber;
    private String carrierRegistrationNumber;
    private String carrierPhoneNumber;
    private String carrierMobilePlatform;
    private String carrierOEM;
    private String carrierProvider;
    private String carrierModel;
    private String carrierDOB;
    
    public Carrier(long carrierID)
            
    {
        this.carrierID = carrierID;
        this.accountStatus = null;
        this.onboardingStep = 1.1;
        this.carrierEmail = null;
        this.carrierPassword = null;
        this.carrierLegalName = null;
        this.carrierFirstName = null;
        this.carrierMiddleName = null;
        this.carrierLastName = null;
        this.carrierSIN = null;
        this.carrierLicenseNumber = null;
        this.carrierRegistrationNumber = null;
        this.carrierPhoneNumber = null;
        this.carrierMobilePlatform = null;
        this.carrierOEM = null;
        this.carrierProvider = null;
        this.carrierModel = null;
        this.carrierDOB = null;
    }

    public long getCarrierID() 
    
    {
        return carrierID;
    }

    public void setCarrierID(long carrierID) 
    
    {
        this.carrierID = carrierID;
    }

    public String getAccountStatus() 
    
    {
        return accountStatus;
    }

    public void setAccountStatus(String accountStatus) 
    
    {
        this.accountStatus = accountStatus;
    }

    public double getOnboardingStep() 
    
    {
        return onboardingStep;
    }

    public void setOnboardingStep(double onboardingStep) 
    
    {
        this.onboardingStep = onboardingStep;
    }

    public String getCarrierEmail() 
    
    {
        return carrierEmail;
    }

    public void setCarrierEmail(String carrierEmail) 
    
    {
        this.carrierEmail = carrierEmail;
    }

    public String getCarrierPassword() 
    
    {
        return carrierPassword;
    }

    public void setCarrierPassword(String carrierPassword) 
    
    {
        this.carrierPassword = carrierPassword;
    }

    public String getCarrierLegalName() 
    
    {
        return carrierLegalName;
    }

    public void setCarrierLegalName(String carrierLegalName) 
    
    {
        this.carrierLegalName = carrierLegalName;
    }

    public String getCarrierFirstName() 
    
    {
        return carrierFirstName;
    }

    public void setCarrierFirstName(String carrierFirstName) 
    
    {
        this.carrierFirstName = carrierFirstName;
    }

    public String getCarrierMiddleName() 
    
    {
        return carrierMiddleName;
    }

    public void setCarrierMiddleName(String carrierMiddleName) 
    
    {
        this.carrierMiddleName = carrierMiddleName;
    }

    public String getCarrierLastName() 
    
    {
        return carrierLastName;
    }

    public void setCarrierLastName(String carrierLastName) 
    
    {
        this.carrierLastName = carrierLastName;
    }

    public String getCarrierSIN() 
    
    {
        return carrierSIN;
    }

    public void setCarrierSIN(String carrierSIN) 
    
    {
        this.carrierSIN = carrierSIN;
    }

    public String getCarrierLicenseNumber() 
    
    {
        return carrierLicenseNumber;
    }

    public void setCarrierLicenseNumber(String carrierLicenseNumber) 
    
    {
        this.carrierLicenseNumber = carrierLicenseNumber;
    }

    public String getCarrierRegistrationNumber() 
    
    {
        return carrierRegistrationNumber;
    }

    public void setCarrierRegistrationNumber(String carrierRegistrationNumber) 
    
    {
        this.carrierRegistrationNumber = carrierRegistrationNumber;
    }

    public String getCarrierPhoneNumber() 
    
    {
        return carrierPhoneNumber;
    }

    public void setCarrierPhoneNumber(String carrierPhoneNumber) 
    
    {
        this.carrierPhoneNumber = carrierPhoneNumber;
    }

    public String getCarrierMobilePlatform() 
    
    {
        return carrierMobilePlatform;
    }

    public void setCarrierMobilePlatform(String carrierMobilePlatform) 
    
    {
        this.carrierMobilePlatform = carrierMobilePlatform;
    }

    public String getCarrierOEM() 
    
    {
        return carrierOEM;
    }

    public void setCarrierOEM(String carrierOEM) 
    
    {
        this.carrierOEM = carrierOEM;
    }

    public String getCarrierProvider() 
    
    {
        return carrierProvider;
    }

    public void setCarrierProvider(String carrierProvider) 
    
    {
        this.carrierProvider = carrierProvider;
    }

    public String getCarrierModel() 
    
    {
        return carrierModel;
    }

    public void setCarrierModel(String carrierModel) 
    
    {
        this.carrierModel = carrierModel;
    }

    public String getCarrierDOB() 
    
    {
        return carrierDOB;
    }

    public void setCarrierDOB(String carrierDOB) 
    
    {
        this.carrierDOB = carrierDOB;
    }
    
}
