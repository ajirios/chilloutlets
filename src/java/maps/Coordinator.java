/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package maps;

import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.errors.ApiException;
import com.google.maps.model.GeocodingResult;
import com.google.maps.model.LatLng;
import java.io.IOException;
import java.net.URLConnection;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;
import javax.xml.xpath.XPathConstants;
import org.w3c.dom.Document;

/**
 *
 * @author mac
 */
public class Coordinator 

{
    private String latitude;
    private String longitude;
    
    public Coordinator(String address) throws Exception
            
    {
        //String postcode = address;
        //String latLongs[] = getLatLongPositions(postcode);
        DecimalFormat decimalFormat = new DecimalFormat("#0.000000");
        this.latitude = decimalFormat.format(lookupCoord(address).lat);
        this.longitude = decimalFormat.format(lookupCoord(address).lng);
    }
    
    
  
  public static String[] getLatLongPositions(String address) throws Exception
          
  {
    int responseCode = 0;
    String api = "http://maps.googleapis.com/maps/api/geocode/xml?key=AIzaSyDnOuNL_P1zkEfYK-q3N7JQFInYlW_JLJE&address=" + URLEncoder.encode(address, "UTF-8") + "&sensor=true";
    URL url = new URL(api);
    HttpURLConnection httpConnection = (HttpURLConnection)url.openConnection();
    httpConnection.connect();
    responseCode = httpConnection.getResponseCode();
    
    if(responseCode == 200)
        
    {
      DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();;
      Document document = builder.parse(httpConnection.getInputStream());
      XPathFactory xPathfactory = XPathFactory.newInstance();
      XPath xpath = xPathfactory.newXPath();
      XPathExpression expr = xpath.compile("/GeocodeResponse/status");
      String status = (String)expr.evaluate(document, XPathConstants.STRING);
      
      if(status.equals("OK"))
      {
         expr = xpath.compile("//geometry/location/lat");
         String latitude = (String)expr.evaluate(document, XPathConstants.STRING);
         expr = xpath.compile("//geometry/location/lng");
         String longitude = (String)expr.evaluate(document, XPathConstants.STRING);
         return new String[] {latitude, longitude};
      }
      else
      {
         throw new Exception("Error from the API - response status: "+status);
      }
    }
    
    return null;
    
  }
  
  public static LatLng lookupCoord(String establishment) throws ApiException, InterruptedException, IOException {
		
	//set up key
	GeoApiContext lookupDoodad = new GeoApiContext.Builder()
		    .apiKey("AIzaSyDnOuNL_P1zkEfYK-q3N7JQFInYlW_JLJE")
		    .build();
	GeocodingResult[] results =  GeocodingApi.geocode(lookupDoodad,
	  establishment).await();
			
		//converts results into usable Coordinates
	
		LatLng coords = (results[0].geometry.location);
			//System.out.println(results[0].geometry.location);
	return coords;
}

    public String getLatitude() 
    
    {
        return latitude;
    }

    public String getLongitude() 
    
    {
        return longitude;
    }
    
}
