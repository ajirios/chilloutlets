/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stripe;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Account;
import com.stripe.model.Charge;
import com.stripe.model.FileUpload;
import com.stripe.model.Payout;
import com.stripe.net.RequestOptions;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author mac
 */
public class StripeConnect 

{
    private String publishableTestApiKey = "pk_test_IIVMomwx9pdYLw1SmiE2BTex";
    private String testApiKey = "sk_test_ZE6R4ONZkIVTqzOF9hnghZnC";
    private String publishableLiveApiKey = "pk_live_Fe7QNSZ4Eq7tsS4u0yFfUAiD";
    private String liveApiKey = "sk_live_Dh8WkuUnvHyLAKQeaJGVGVxK";
    
    Account acct;
    String connectAccountID;
    
    public StripeConnect(String firstName, String lastName, int month, int day, int year, String ip) throws StripeException
            
    {
        // Set your secret key: remember to change this to your live secret key in production
        // See your keys here: https://dashboard.stripe.com/account/apikeys
        Stripe.apiKey = testApiKey;
        
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("country", "CA");
        params.put("type", "custom");
        
        
        acct = Account.create(params);
        connectAccountID = acct.getId();
        updateAccount();
        acceptServiceAgreement(ip);
        updateDOBParams(firstName, lastName, month, day, year);
    }
    
    public StripeConnect(String connectAccountID) throws StripeException
            
    {
        this.connectAccountID = connectAccountID;
        RequestOptions requestOptions = RequestOptions.builder().setStripeAccount(this.connectAccountID).build();
        this.acct = Account.retrieve(this.connectAccountID, requestOptions);
    }
    
    private void updateAccount() throws StripeException
            
    {
        Map<String, String> metadata = new HashMap<String, String>();
        metadata.put("internal_id", String.valueOf(42));

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("metadata", metadata);
        acct.update(params);
    }
    
    private void updateBankAccount(String routingNumber, String accountNumber) throws StripeException
            
    {
        Map<String, Object> params = new HashMap<String, Object>();
        
        //banking params
        Map<String, Object> externalAccountParams = new HashMap<String, Object>();
        externalAccountParams.put("object", "bank_account");
        externalAccountParams.put("country", "CA");
        externalAccountParams.put("currency", "cad");
        externalAccountParams.put("routing_number", routingNumber);
        externalAccountParams.put("account_number", accountNumber);
        params.put("external_account", externalAccountParams);
        acct.update(params);
    }
    
    private void acceptServiceAgreement(String ipAddress) throws StripeException
            
    {
        Map<String, Object> tosAcceptanceParams = new HashMap<String, Object>();
        tosAcceptanceParams.put("date", (long) System.currentTimeMillis() / 1000L);
        tosAcceptanceParams.put("ip", ipAddress); // Assumes you're not using a proxy
        
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("tos_acceptance", tosAcceptanceParams);
        
        acct.update(params);
    }
    
    public void createCharge(int amount, String creditCardNumber, int month, int year) throws StripeException
            
    {
        
        //credit card params
        Map<String, Object> chargeParams = new HashMap<String, Object>();
        chargeParams.put("amount", amount);
        chargeParams.put("currency", "cad");
        chargeParams.put("destination", connectAccountID);
        
        Map<String, Object> sourceParams = new HashMap<String, Object>();
        sourceParams.put("object", "card");
        sourceParams.put("number", creditCardNumber);
        sourceParams.put("exp_month", month);
        sourceParams.put("exp_year", year);
        chargeParams.put("source", sourceParams); // obtained with Stripe.js

        Charge.create(chargeParams);
    }
    
    public void updateDOBParams(String firstName, String lastName, int month, int day, int year) throws StripeException
            
    {
        Account account = Account.retrieve(this.connectAccountID, null);
        Map<String, Object> params = new HashMap<String, Object>();
        Map<String, Object> legalEntityParams = new HashMap<String, Object>();
        Map<String, Object> dobParams = new HashMap<String, Object>();
        dobParams.put("day", day);
        dobParams.put("month", month);
        dobParams.put("year", year);
        legalEntityParams.put("dob", dobParams);
        legalEntityParams.put("first_name", firstName);
        legalEntityParams.put("last_name", lastName);
        legalEntityParams.put("type", "individual");
        params.put("legal_entity", legalEntityParams);
        account.update(params);
    }
    
    public void updateBillingAddress(String lineAddress, String city, String state, String postalCode, int sin) throws StripeException
            
    {
        Map<String, Object> params = new HashMap<String, Object>();
        Map<String, Object> legalEntityParams = new HashMap<String, Object>();
        Map<String, Object> addressParams = new HashMap<String, Object>();
        addressParams.put("line1", lineAddress);
        addressParams.put("postal_code", postalCode);
        addressParams.put("city", city);
        addressParams.put("state", state);
        legalEntityParams.put("address", addressParams);
        legalEntityParams.put("ssn_last_4", sin);
        params.put("legal_entity", legalEntityParams);
        acct.update(params);
    }
    
    public void uploadIdentityDocument() throws StripeException
            
    {
        String file;
        Map<String, Object> fileUploadParams = new HashMap<String, Object>();
        fileUploadParams.put("purpose", "identity_document");
        fileUploadParams.put("file", new File("success.png"));
        
        FileUpload fileObj = FileUpload.create(fileUploadParams);
        file = fileObj.getId();
        
        Account account = Account.retrieve(this.connectAccountID, null);
        Map<String, Object> params = new HashMap<String, Object>();
        Map<String, Object> legalEntityParams = new HashMap<String, Object>();
        Map<String, Object> verificationParams = new HashMap<String, Object>();
        verificationParams.put("document", file);
        legalEntityParams.put("verification", verificationParams);
        legalEntityParams.put("personal_id_number", 123456789);
        params.put("legal_entity", legalEntityParams);
        account.update(params);

    }
    
    public void createPayout(int amount) throws StripeException
            
    {
        RequestOptions requestOptions = RequestOptions.builder().setStripeAccount(this.connectAccountID).build();
        
        Map<String, Object> payoutParams = new HashMap<String, Object>();
        payoutParams.put("amount", amount);
        payoutParams.put("currency", "cad");
        
        Payout.create(payoutParams, requestOptions);
    }

    public String getConnectAccountID() 
    
    {
        return connectAccountID;
    }
    
}
