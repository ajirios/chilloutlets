/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cities;

/**
 *
 * @author mac
 */
public class City 

{
    private int cityNumber;
    private String cityName;
    private int cityLaunched;
    
    public City(int cityNumber, String cityName)
            
    {
        this.cityNumber = cityNumber;
        this.cityName = cityName;
        this.cityLaunched = 0;
    }

    public int getCityNumber() 
    
    {
        return cityNumber;
    }

    public void setCityNumber(int cityNumber) 
    
    {
        this.cityNumber = cityNumber;
    }

    public String getCityName() 
    
    {
        return cityName;
    }

    public void setCityName(String cityName) 
    
    {
        this.cityName = cityName;
    }

    public int getCityLaunched() 
    
    {
        return cityLaunched;
    }

    public void setCityLaunched(int cityLaunched) 
    
    {
        this.cityLaunched = cityLaunched;
    }
    
}
