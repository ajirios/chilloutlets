/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package maps.distance;

import com.google.maps.DirectionsApi.RouteRestriction;
import com.google.maps.DistanceMatrixApi;
import com.google.maps.DistanceMatrixApiRequest;
import com.google.maps.GeoApiContext;
import com.google.maps.errors.ApiException;
import com.google.maps.model.DistanceMatrix;
import com.google.maps.model.LatLng;
import com.google.maps.model.TravelMode;
import java.io.IOException;
import okhttp3.OkHttpClient;


/**
 *
 * @author mac
 */
public class CitySearch 

{
    private static final String API_KEY1 = "AIzaSyDgh6-uYI5m95sBlU4oC5UB0pzh2o0FTsI";
    private static final String API_KEY2 = "AIzaSyDnOuNL_P1zkEfYK-q3N7JQFInYlW_JLJE";
    private static final String API_KEY3 = "AIzaSyDgh6-uYI5m95sBlU4oC5UB0pzh2o0FTsI";
    private static final String API_KEY = API_KEY2;
    
    private String customerAddress;
    private String customerCoordinates;
    private String outletAddress;
    private String outletCoordinates;
    
    private long distance;
    private long duration;
    private String durationInTraffic;
    
    public CitySearch()
            
    {
        this.customerAddress = null;
    }
    
    public CitySearch(String customerAddress, String OutletAddress) throws InterruptedException, IOException, Exception
            
    {
        this.customerAddress = customerAddress;
        this.outletAddress = OutletAddress;
        this.duration = 0;
        distance = this.getDrivingDistance(this.customerAddress, this.outletAddress);
        this.durationInTraffic = null;
    }

    public long getDrivingDistance(String addrOne, String addrTwo) throws ApiException, InterruptedException, IOException, Exception{
			
	//set up key
   	/* GeoApiContext distCalcer = new GeoApiContext.Builder()
		    .apiKey(API_KEY)
		    .build(); */
        //OkHttpClient ok;
        
        GeoApiContext distCalcer = new GeoApiContext.Builder().apiKey(API_KEY).build();
        
        //distCalcer.setApiKey(API_KEY);
   	
   	DistanceMatrixApiRequest req = DistanceMatrixApi.newRequest(distCalcer); 
       DistanceMatrix result = req.origins(addrOne).destinations(addrTwo).mode(TravelMode.DRIVING).avoid(RouteRestriction.TOLLS).language("en-US").await();
               
       
        long distApart = result.rows[0].elements[0].distance.inMeters;
        this.duration = result.rows[0].elements[0].duration.inSeconds;
        //this.durationInTraffic = result.rows[0].elements[0].durationInTraffic.toString();
	
	return distApart;
        
    }
    
    public long[] getDistanceMatrix(String[] origins, String[] destinations) throws ApiException, InterruptedException, IOException
    
    {
	GeoApiContext context = new GeoApiContext.Builder().apiKey(API_KEY).build();
		
		DistanceMatrixApiRequest req=DistanceMatrixApi.newRequest(context);
		DistanceMatrix t=req.origins(origins).destinations(destinations).mode(TravelMode.DRIVING).await();
                
		long[][] array = new long[origins.length][destinations.length];
                
                /*
		File file=new File("Matrix.txt");
		FileOutputStream out=new FileOutputStream(file);
		DataOutputStream outFile=new DataOutputStream(out);
                */
                
		for(int i = 0; i < origins.length; i++)
                
                {
			for(int j = 0; j < destinations.length; j++)
                        
                        {
				array[i][j] = t.rows[i].elements[j].distance.inMeters;
				//outFile.writeLong(t.rows[i].elements[j].distance.inMeters);
			}
                        
		}
                
		//outFile.close();
                
                return array[0];
                
    }
    
    public long[] getDurationMatrix(String[] origins, String[] destinations) throws ApiException, InterruptedException, IOException
    
    {
	GeoApiContext context = new GeoApiContext.Builder().apiKey(API_KEY).build();
		
		DistanceMatrixApiRequest req=DistanceMatrixApi.newRequest(context);
		DistanceMatrix t=req.origins(origins).destinations(destinations).mode(TravelMode.DRIVING).await();
                
		long[][] array = new long[origins.length][destinations.length];
                
                /*
		File file=new File("Matrix.txt");
		FileOutputStream out=new FileOutputStream(file);
		DataOutputStream outFile=new DataOutputStream(out);
                */
                
		for(int i = 0; i < origins.length; i++)
                
                {
			for(int j = 0; j < destinations.length; j++)
                        
                        {
				array[i][j] = t.rows[i].elements[j].duration.inSeconds;
				//outFile.writeLong(t.rows[i].elements[j].distance.inMeters);
			}
                        
		}
                
		//outFile.close();
                
                return array[0];
                
    }

    public String getCustomerAddress() 
    
    {
        return customerAddress;
    }

    public String getCustomerCoordinates() 
    
    {
        return customerCoordinates;
    }

    public String getOutletAddress() 
    
    {
        return outletAddress;
    }

    public String getOutletCoordinates() 
    
    {
        return outletCoordinates;
    }

    public long getDistance() 
    
    {
        return distance;
    }

    public long getDuration() 
    
    {
        return duration;
    }

    public String getDurationInTraffic() 
    
    {
        return durationInTraffic;
    }
    
}
