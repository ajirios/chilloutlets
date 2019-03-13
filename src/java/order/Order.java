/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import java.text.DecimalFormat;
import java.util.ArrayList;
import stock.Stock;

/**
 *
 * @author mac
 */
public class Order 

{
    private long customerID;
    private long orderNumber;
    private ArrayList<Stock> orderList;
    private String paidAmount;
    private String orderTotal;
    private String orderSubtotal;
    private String orderGST;
    private String orderPST;
    private String orderNetworkFee;
    private String orderTransitFee;
    private String orderTip;
    private String orderVoucher;
    private String groceryCut;
    private String overlimitCut;
    
    private double subtotal;
    private double gst;
    private double pst;
    private double networkFee;
    private double transitFee;
    private double tip;
    private double voucher;
    private double subsidyCut;
    private double incentiveCut;
    private double total;
    
    public Order(long customerID, long orderNumber)
            
    {
        this.customerID = customerID;
        this.orderNumber = orderNumber;
        this.orderList = new ArrayList();
        this.paidAmount = "0.00";
        this.orderTotal = "0.00";
        this.orderSubtotal = "0.00";
        this.orderGST = "0.00";
        this.orderPST = "0.00";
        this.orderNetworkFee = "0.00";
        this.orderTransitFee = "0.00";
        this.orderTip = "0.00";
        this.orderVoucher = "0.00";
        this.groceryCut = "0.00";
        this.overlimitCut = "0.00";
        
        this.subtotal = 0.00;
        this.gst = 0.00;
        this.pst = 0.00;
        this.networkFee = 0.00;
        this.transitFee = 0.00;
        this.tip = 0.00;
        this.voucher = 0.00;
        this.subsidyCut = 0.00;
        this.incentiveCut = 0.00;
        this.total = 0.00;
    }
    
    public Order(long customerID, long orderNumber, String paidAmount)
            
    {
        this.customerID = customerID;
        this.orderNumber = orderNumber;
        this.orderList = new ArrayList();
        this.paidAmount = paidAmount;
        this.orderTotal = null;
        this.orderSubtotal = null;
        this.orderGST = null;
        this.orderPST = null;
        this.orderNetworkFee = null;
        this.orderTransitFee = null;
        this.orderTip = null;
        this.orderVoucher = null;
        this.groceryCut = null;
        this.overlimitCut = null;
    }
    
    public long getCustomerID() 
    
    {
        return customerID;
    }

    public void setCustomerID(long customerID) 
    
    {
        this.customerID = customerID;
    }

    public long getOrderNumber() 
    
    {
        return orderNumber;
    }

    public void setOrderNumber(long orderNumber) 
    
    {
        this.orderNumber = orderNumber;
    }

    public String getPaidAmount() 
    
    {
        return paidAmount;
    }

    public void setPaidAmount(String paidAmount) 
    
    {
        this.paidAmount = paidAmount;
    }

    public String getOrderTotal() 
    
    {
        return orderTotal;
    }

    public void setOrderTotal(String orderTotal) 
    
    {
        this.orderTotal = orderTotal;
    }

    public String getOrderSubtotal() 
    
    {
        return orderSubtotal;
    }

    public void setOrderSubtotal(String orderSubtotal) 
    
    {
        this.orderSubtotal = orderSubtotal;
    }

    public String getOrderGST() 
    
    {
        return orderGST;
    }

    public void setOrderGST(String orderGST) 
    
    {
        this.orderGST = orderGST;
    }

    public String getOrderPST() 
    
    {
        return orderPST;
    }

    public void setOrderPST(String orderPST) 
    
    {
        this.orderPST = orderPST;
    }

    public String getOrderNetworkFee() 
    
    {
        return orderNetworkFee;
    }

    public void setOrderNetworkFee(String orderNetworkFee) 
    
    {
        this.orderNetworkFee = orderNetworkFee;
    }

    public String getOrderTransitFee() 
    
    {
        return orderTransitFee;
    }

    public void setOrderTransitFee(String orderTransitFee) 
    
    {
        this.orderTransitFee = orderTransitFee;
    }

    public String getOrderTip() 
    
    {
        return orderTip;
    }

    public void setOrderTip(String orderTip) 
    
    {
        this.orderTip = orderTip;
    }

    public String getOrderVoucher() 
    
    {
        return orderVoucher;
    }

    public void setOrderVoucher(String orderVoucher) 
    
    {
        this.orderVoucher = orderVoucher;
    }

    public String getGroceryCut() 
    
    {
        return groceryCut;
    }

    public void setGroceryCut(String groceryCut) 
    
    {
        this.groceryCut = groceryCut;
    }

    public String getOverlimitCut() 
    
    {
        return overlimitCut;
    }

    public void setOverlimitCut(String overlimitCut) 
    
    {
        this.overlimitCut = overlimitCut;
    }

    public ArrayList<Stock> getOrderList() 
    
    {
        return orderList;
    }

    public void setOrderList(ArrayList<Stock> orderList) 
    
    {
        this.orderList = orderList;
    }
    
    public void addStock(Stock stock)
            
    {
        
        
        DecimalFormat format = new DecimalFormat("#0.00");
        
        //if arraylist is empty, make subtotal the stock price
        if (this.orderList.size() == 0)
            
        {
            this.orderSubtotal = stock.getPrice();
            
            if (this.orderSubtotal.charAt(0) == '$')
                
            {
                this.orderSubtotal = this.orderSubtotal.substring(1);
            }
            
            this.subtotal = Double.parseDouble(this.orderSubtotal);
            
            gst = 0.08 * subtotal;
            this.orderGST = format.format(gst);
            
            pst = 0.05 * subtotal;
            this.orderPST = format.format(pst);
            
            networkFee = 3.90 + 0.25 * subtotal;
            this.orderNetworkFee = format.format(networkFee);
            
            total = subtotal + gst + pst + networkFee + transitFee + tip - subsidyCut - incentiveCut;
            this.orderTotal = format.format(total);
            
            this.orderList.add(stock);
            
        }
        
        else //convert all stock prices to double and add them to subtotal.
            
        {
            
            for (int count = 0; count < this.orderList.size(); count++)
                
            {
                
                Stock currentStock = this.orderList.get(count);
                
                String currentPrice = currentStock.getPrice();
                
                if (currentPrice.charAt(0) == '$')
                    
                {
                    currentPrice = currentPrice.substring(1);
                }
                
                this.subtotal += Double.parseDouble(currentPrice);
                
            }
            
            String stockPrice = stock.getPrice();
            
            if (stockPrice.charAt(0) == '$')
                
            {
                stockPrice = stockPrice.substring(1);
            }
            
            this.subtotal += Double.parseDouble(stockPrice);
            this.orderSubtotal = format.format(subtotal);
            
            gst = 0.08 * subtotal;
            this.orderGST = format.format(gst);
            
            pst = 0.05 * subtotal;
            this.orderPST = format.format(pst);
            
            networkFee = 3.90 + 0.25 * subtotal;
            this.orderNetworkFee = format.format(networkFee);
            
            total = subtotal + gst + pst + networkFee + transitFee + tip - subsidyCut - incentiveCut;
            this.orderTotal = format.format(total);
            
            this.orderList.add(stock);
            
        }
        
    }
    
    public Stock getStock(int count)
            
    {
        return this.orderList.get(count);
    }
    
    public void removeStock(int count)
            
    {
        this.orderList.remove(count);
    }
    
}
