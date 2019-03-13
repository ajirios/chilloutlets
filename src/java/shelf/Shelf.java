/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shelf;

/**
 *
 * @author mac
 */
public class Shelf 

{
    private int outletNumber;
    private int branchNumber;
    private int shelfNumber;
    private String shelfName;
    
    public Shelf(int outletNumber, int branchNumber, int shelfNumber, String shelfName)
            
    {
        this.outletNumber = outletNumber;
        this.branchNumber = branchNumber;
        this.shelfNumber = shelfNumber;
        this.shelfName = shelfName;
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

    public String getShelfName() 
    
    {
        return shelfName;
    }

    public void setShelfName(String shelfName) 
    
    {
        this.shelfName = shelfName;
    }
    
}
