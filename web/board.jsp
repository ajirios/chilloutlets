<%-- 
    Document   : board
    Created on : 25-Feb-2019, 6:39:03 PM
    Author     : mac
--%>

<%@page import="maps.Coordinator"%>
<%@page import="customer.CustomerRetrieve"%>
<%@page import="maps.distance.CitySearch"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="outlets.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/png" href="images/chilliredup.png"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
            <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFj2N3AJH2KQcjFL00WxtGSZJsfI7wxoA"></script>
            
		<link rel="stylesheet" href="assets/css/main.css" />
        <meta name="viewport" content="initial-scale=1.0">
            <meta charset="utf-8">
            
            <%
                    

                    String inputAddress = null;
                    String inputLatitude = null;
                    String inputLongitude = null;
                    
                    
                    if (request.getParameter("pac-input") != null)
                    
                    {
                        inputAddress = request.getParameter("pac-input");
                    }
                    
                    else
                        
                    {
                        inputAddress = "136 Market Ave, Winnipeg, MB R3T 2K1";
                    }
                    
                    if (request.getParameter("latitude") != null)
                    
                    {
                        inputLatitude = request.getParameter("latitude");
                    }
                    
                    else
                        
                    {
                        inputLatitude = "49.898319";
                    }
                    
                    if (request.getParameter("longitude") != null)
                    
                    {
                        inputLongitude = request.getParameter("longitude");
                    }
                    
                    else
                        
                    {
                        inputLongitude = "-97.135780";
                    }


                    double latitude = Double.parseDouble(inputLatitude);
                    double longitude = Double.parseDouble(inputLongitude);
                    
                    session.setAttribute("latitude", inputLatitude);
                    session.setAttribute("longitude", inputLongitude);
                    
                    
                    OutletsReceiver outlets = new OutletsReceiver(inputAddress, latitude, longitude, "Winnipeg");
                    
                    
        
        //out.println("Distance is " + distance + ", duration: " + search.getDuration());
            
                    
                    %>
            
                    
                    
        <title>Board @ Chilloutlets</title>
        
            
                <style>
                
                    
                body, html
                {
                    width: 100%;
                    margin: 0;
                    //font-family: sans-serif;
                }
                
                header
                {
                    background: #e00b00;
                    color: #fff;
                    box-shadow: 0px 4px 8px #444;
                    elevation: above;
                    cursor: default;
                    height: 6.25em;
                    left: 0;
                    line-height: 3.25em;
                    position: fixed;
                    top: 0;
                    width: 100%;
                    z-index: 11;
                }
                
                .panel-area
                {
                    width: 100%;
                    height: 100vh;
                    overflow: visible;
                    background-color: white;
                }
                
                .explore-panel
                {
                    height: 100%;
                    width: calc(100% - 350px);
                    float: left;
                    background-color: #fff;
                }
                
                .filter-panel
                {
                    display: none;
                    height: 100%;
                    width: 20px;
                    left: 0px;
                    background-color: #eee;
                    box-shadow: 0px 10px 30px #888;
                    float: left;
                    overflow: scroll;
                }
                
                .filter-panel::-webkit-scrollbar 
                { 
                    display: none; 
                }
                
                .sliding-scene
                {
                    height: calc(100% - 90px);
                    width: 100%;
                    margin-top: 90px;
                    margin-left: 0px;
                    overflow: scroll;
                    //background-color: bisque;
                }
                
                .navigator
                {
                    height: 35px;
                    width: 96%;
                    margin-top: 5px;
                    margin-left: auto;
                    margin-right: auto;
                }
                
                .inlet
                {
                    height: calc(100% - 200px);
                    width: calc(92% - 400px);
                    margin-top: 10px;
                    margin-left: 2%;
                    margin-right: 2%;
                    //float: left;
                    background-color: #fff;
                    overflow: scroll;
                    position: absolute;
                }
                
                .order-panel
                {
                    display: block;
                    height: 100%;
                    width: 350px;
                    right: 0px;
                    background-color: #eee;
                    box-shadow: 0px 4px 15px #888;
                    float: right;
                }
                
                .product-search
                {
                    width: 100%;
                    height: 380px;
                    margin-top: 100px;
                    margin-left: auto;
                    margin-right: auto;
                }
                
                .product-search > input
                {
                    width: 100%;
                    height: 35px;
                }
                
                .bag
                {
                    display: none;
                    height: 150px;
                    margin-top: 0px;
                    margin-left: 40px;
                }
                
                .start-building-msg
                {
                    display: none;
                    color: #777;
                    font-size: 15px;
                    text-align: center;
                    width: 90%;
                    margin-top: 20px;
                    margin-left: auto;
                    margin-right: auto;
                    height: 50px;
                }
                
                .checkout-area
                {
                    width: 300px;
                    margin-top: 0px;
                    margin-left: auto;
                    margin-right: auto;
                    height: 50px;
                }
                
                .checkout-button
                {
                    background-color: #e00800;
                    color: #fff;
                    font-size: 15px;
                    text-align: center;
                    width: 300px;
                    margin-left: auto;
                    margin-right: auto;
                    height: 50px;
                }
                
                .subtotal-checker
                {
                    display: block;
                    color: #000;
                    font-size: 25px;
                    font-weight: bold;
                    width: 300px;
                    margin-top: 10px;
                    margin-left: auto;
                    margin-right: auto;
                    height: 50px;
                }
                
                .checker
                {
                    width: 200px;
                    margin-left: auto;
                    margin-right: auto;
                    height: 50px;
                    float: left;
                }
                
                .subtotal
                {
                    width: 100px;
                    margin-left: auto;
                    margin-right: auto;
                    height: 50px;
                    float: left;
                    text-align: right;
                }
                
                .order-list
                {
                    width: 100%;
                    height: 374px;
                    background-color: #fff;
                    padding-top: 5px;
                    padding-left: 5px;
                    padding-right: 5px;
                    margin-top: 20px;
                    margin-left: 0%;
                    margin-right: 0%;
                    overflow: scroll;
                }
                
                .order-list-header
                {
                    width: 100%;
                    height: 20px;
                    color: #000;
                    font-size: 15px;
                    font-weight: bold;
                    text-align: center;
                }
                
                .order-item
                {
                    width: 100%;
                    height: 30px;
                    font-size: 14px;
                }
                
                .toolholder
                {
                    float: right;
                    width: 1000px;
                    height: 75px;
                }
                
                .nav-tools
                {
                    width: 180px;
                    height: 70px;
                    margin-top: 2px;
                    float: right;
                }
                
                .tool-label
                {
                    width: 180px;
                    height: 30px;
                    color: #f78b88;
                    font-size: 15px;
                }
                
                .selected-tool
                {
                    width: 180px;
                    height: 40px;
                    font-size: 15px;
                    color: #fff;
                }
                
                .when-tools
                {
                    width: 160px;
                    height: 70px;
                    margin-top: 2px;
                    float: right;
                }
                
                .when-label
                {
                    width: 160px;
                    height: 30px;
                    color: #f78b88;
                    font-size: 15px;
                }
                
                .when-tool
                {
                    width: 160px;
                    height: 40px;
                    font-size: 15px;
                    color: #fff;
                }
                
                .address-tools
                {
                    width: 300px;
                    height: 70px;
                    margin-top: 2px;
                    float: right;
                }
                
                .address-label
                {
                    width: 300px;
                    height: 30px;
                    color: #f78b88;
                    font-size: 15px;
                }
                
                .address-tool
                {
                    width: 300px;
                    height: 40px;
                    font-size: 15px;
                    color: #fff;
                }
                
                .transit-tools
                {
                    width: 80px;
                    height: 70px;
                    margin-top: 2px;
                    float: right;
                }
                
                .transit-label
                {
                    width: 80px;
                    height: 30px;
                    color: #f78b88;
                    font-size: 15px;
                }
                
                .transit-tool
                {
                    width: 80px;
                    height: 40px;
                    font-size: 15px;
                    color: #fff;
                }
                
                .city-tools
                {
                    width: 120px;
                    height: 70px;
                    margin-top: 2px;
                    float: right;
                }
                
                .city-label
                {
                    width: 120px;
                    height: 30px;
                    color: #f78b88;
                    font-size: 15px;
                }
                
                .city-tool
                {
                    width: 120px;
                    height: 40px;
                    font-size: 15px;
                    color: #fff;
                }
                
                .toolholder
                {
                    float: right;
                    width: 1000px;
                    height: 75px;
                }
            
            .body
            {
                width: 100%;
                height: 100vh;
                margin: 0;
            }
            
            .outlets-back
            {
                width: 100%;
                min-height: 2000px;
                margin-top: 20px;
                margin-left: auto;
                margin-right: auto;
                margin-bottom: 100px;
            }
            
            .outlets
            {
                width: 90%;
                //min-height: 2000px;
                //margin-top: 120px;
                //margin-left: auto;
                //margin-right: auto;
                //margin-bottom: 100px;
                //padding-left: 5%;
                //padding-right: 5%;
                padding-top: 270px;
                padding-bottom: 20px;
                //border: 0.5px solid #aaa;
                //box-shadow: 0 2px 5px #ccc;
                background-color: #fff;
                font-family: Roboto;
                float: left;
            }
            
            .outlets-left
            {
                width: 5%;
                padding-top: 50px;
                padding-bottom: 20px;
                float: left;
            }
            
            .outlets-right
            {
                width: 5%;
                padding-top: 50px;
                padding-bottom: 20px;
                float: left;
            }
            
            .outlet-store
            {
                width: 660px;
                min-height: 90px;
                margin-top: 10px;
                margin-left: auto;
                margin-right: auto;
                //border: 1px solid #fff;
                //box-shadow: 0 2px 5px #777;
            }
            
            .outlet-store:hover
            {
                background-color: #f4f4f4;
                border: 1px solid #c00c00;
            }
            
            .outlet-store > a
            {
                color: #000;
            }
            
            .outlet-store > a:hover
            {
                background-color: #fafafa;
            }
            
            .outlet-logo
            {
                width: 88px;
                height: 88px;
                background-size: cover;
                float: left;
            }
            
            .distance
            {
                width: 200px;
                min-height: 90px;
                padding-top: 10px;
                padding-left: 30px;
                font-size: 12px;
                float: left;
            }
            
            .accessibilty
            {
                width: 200px;
                height: 90px;
                padding-top: 10px;
                padding-left: 30px;
                float: left;
            }
            
            .delivery
            {
                width: 150px;
                height: 90px;
                padding-top: 10px;
                padding-left: 20px;
                float: left;
            }
            
            .delivery-time
            {
                width: 150px;
                height: 90px;
                padding-top: 10px;
                padding-left: 20px;
                float: left;
            }
            
            .toptext
            {
                font-size: 13px;
                font-weight: bold;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }
            
            .bottomtext
            {
                font-size: 13px;
                color: #444;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }
            
            .selector
            {
                //position: absolute;
                width: 100%;
                height: 70px;
                margin-left: auto;
                margin-right: auto;
                background-color: white;
                font-family: Roboto;
                color: #aaa;
                text-align: left;
                border-bottom: 0.5px solid #aaa;
                box-shadow: 0px 2px 15px #aaa;
                margin-bottom: 0px;
            }
            
            .selector > h2
            {
                float: left;
            }
            
            .selector > input:focus
            {
                border: none;
            }
            
            .page-search:focus
            {
                //border: none;
            }
            
            .expedition-ticket
            {
                display: block;
                width: 350px;
                height: 450px;
                //padding: 20px;
                position: fixed;
                background-color: white;
                margin-top: 100px;
                margin-left: calc(100% - 260px);
                z-index: 20;
                box-shadow: 0 4px 4px #aaa;
            }
            
            .ticket-header
            {
                width: 310px;
                height: 50px;
                margin-top: 20px;
                margin-left: 20px;
                margin-right: 20px;
                text-align: center;
            }
            
            .ticket-body
            {
                width: 310px;
                height: 330px;
                margin-left: 20px;
                margin-right: 20px;
                margin-bottom: 0px;
                overflow: scroll;
            }
            
            .ticket-footer
            {
                width: 310px;
                height: 100px;
                margin-left: 20px;
                margin-right: 20px;
            }
                
                .checkout-button
                {
                    background-color: #e00800;
                    color: #fff;
                    font-size: 15px;
                    text-align: center;
                    width: 100%;
                    margin-left: auto;
                    margin-right: auto;
                    height: 50px;
                }
            
            .ticketlet
            {
                width: 100%;
                height: 90px;
                margin-top: 1px;
                margin-bottom: 9px;
                font-family: arial;
                color: #444;
            }
            
            .ticketlet-poster
            {
                width: 70px;
                height: 70px;
                float: left;
            }
            
            .ticketlet-info
            {
                width: calc(100% - 70px);
                height: 70px;
                font-size: 11px;
                float: left;
            }
            
            .ticket-outlet-name
            {
                width: 75%;
                height: 20px;
                margin-left: 5%;
                font-family: arial;
                font-weight: bold;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                float: left;
            }
            
            .ticket-outlet-close
            {
                width: 20%;
                height: 20px;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                font-size: 14px;
                text-align: right;
                float: left;
            }
            
            .ticket-branch
            {
                width: 95%;
                height: 20px;
                margin-left: 5%;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }
            
            .caret-holder
            {
                width: 20px;
                height: 100%;
                margin-left: 5px;
                float: left;
            }
            
            .text-holder
            {
                width: calc(100% - 25px);
                height: 100%;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                float: left;
            }
    
            .spin-overlay
            {
                display: none;
                position: absolute; /* Stay in place */
                z-index: 0; /* Sit on top */
                padding-top: 300px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(255,255,255); /* Fallback color */
                background-color: rgba(255,255,255,0.4); /* Black w/ opacity */
            }
            
            .spin
            {
                width: 40px;
                height: 40px;
                top: 50%;
                left: 50%;
                position: absolute;
                border: 2px solid #f3f3f3;
                border-top: 3px solid #e00b00;
                border-radius: 100%;
                top: 45vh;
                left: 0;
                right: 0;
                margin: auto;
                -webkit-animation: spin 1s infinite linear;
                animation: spin 0.3s infinite linear;
            }
            
            .spinner-overlay
            {
                width: 40px;
                height: 40px;
                display: none;
                z-index: 15;
            }
            
            .spinner
            {
                width: 40px;
                height: 40px;
                z-index: 15;
                position: absolute;
                border: 2px solid #f3f3f3;
                border-top: 3px solid #e00b00;
                border-radius: 100%;
                top: 45vh;
                left: 0;
                right: 0;
                margin: auto;
                -webkit-animation: spin 1s infinite linear;
                animation: spin 0.3s infinite linear;
            }
            
            @-webkit-keyframes spin
            {
                from 
                {
                    transform: rotate(0deg);
                }
                to 
                {
                    transform: rotate(360deg);
                }
            }
            
            @keyframes spin
            {
                from 
                {
                    transform: rotate(0deg);
                }
                to 
                {
                    transform: rotate(360deg);
                }
            }
            
            .credentials
            {
                width: 100%;
                height: 120px;
                margin-top: 5px;
                margin-left: auto;
                margin-right: auto;
                color: #555;
                z-index: 32;
            }
            
            .credentials-long
            {
                width: 100%;
                height: 350px;
                margin-top: 5px;
                margin-left: auto;
                margin-right: auto;
                color: #555;
                z-index: 32;
            }
            
            .redclickarea
            {
                width: 100%;
                height: 50px;
                margin-left: auto;
                margin-right: auto;
                margin-top: 20px;
            }
            
            .redclicker
            {
                width: 100%;
                height: 50px;
                background-color: #e00b00;
                color: #fff;
                text-align: center;
                font-size: 14px;
            }
            
            .drop-nav
            {
                display: block;
                height: 50px;
                width: 90%;
                margin-top: 10px;
                margin-left: auto;
                margin-right: auto;
            }
            
            .drop-nav-login
            {
                height: 50px;
                width: 50%;
                font-size: 14px;
                color: #e00b00;
                text-align: center;
                float: left;
                border-bottom: 2px solid #e00b00;
            }
            
            .drop-nav-register
            {
                height: 50px;
                width: 50%;
                font-size: 14px;
                color: #e00b00;
                text-align: center;
                float: left;
                border-bottom: none;
            }
            
            .drop-body
            {
                display: block;
                height: 440px;
                width: 90%;
                margin-left: auto;
                margin-right: auto;
            }
            
            .drop-body-login
            {
                display: block;
            }
            
            .drop-body-register
            {
                display: none;
            }
            
            .drop-logout
            {
                display: block;
                height: 350px;
                width: 90%;
                margin-top: 10px;
                margin-left: auto;
                margin-right: auto;
            }
            
            .triangle
            {
                width: 0; 
                height: 0; 
                border-left: 10px solid transparent;
                border-right: 10px solid transparent;
                border-bottom: 10px solid white;
                margin-top: -8px;
                margin-left: 230px;
            }
            
            .chillcredits
            {
                width: 100%;
                height: 170px;
                margin-top: 40px;
                margin-left: auto;
                margin-right: auto;
                margin-bottom: 90px;
            }
            
            .cardarea
            {
                width: 100%;
                height: 170px;
                margin-left: auto;
                margin-right: auto;
                background-color: #e00b00;
                color: #fff;
                border-radius: 30px;
                //box-shadow: 0px 0px 4px #000;
            }
            
            .cardcredit
            {
                font-size: 30px;
                font-weight: bolder;
                text-align: center;
                margin-top: 10px;
                width: 100%;
                height: 40px;
            }
            
            .cardtop
            {
                width: 100%;
                height: 60px;
            }
            
            .cardowner
            {
                width: 100%;
                height: 20px;
                margin-top: 30px;
                text-align: center;
                font-size: 16px;
            }
            
            .login-modal
            {
                display: none;
                position: absolute; /* Stay in place */
                z-index: 0;
                padding-top: 300px; /* Location of the box */
                left: 0;
                top: 90px;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.6); /* Black w/ opacity */
                /* background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
            
            .logindrop
            {
                display: none;
                z-index: 0;
                width: 300px;
                height: 500px;
                top: 80px;
                background-color: white;
                border: 0.2px solid #aaa;
                margin-left: calc(100% - 320px);
                position: fixed;
                padding: 0;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.8),0 6px 20px 0 rgba(0,0,0,0.19);
                -webkit-animation-name: none;
                -webkit-animation-duration: 0.6s;
                animation-name: none;
                animation-duration: 0.6s
            }
            
            .zone-modal
            {
                display: none;
                position: absolute; /* Stay in place */
                z-index: 0;
                padding-top: 300px; /* Location of the box */
                left: 0;
                top: 90px;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.6); /* Black w/ opacity */
                /* background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
            
            .zonedrop
            {
                display: none;
                z-index: 0;
                width: 500px;
                height: 300px;
                top: 80px;
                background-color: white;
                margin-left: calc(100% - 1050px);
                position: fixed;
                padding: 0;
                border: 0.2px solid #aaa;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.8),0 6px 20px 0 rgba(0,0,0,0.19);
                -webkit-animation-name: none;
                -webkit-animation-duration: 0.6s;
                animation-name: none;
                animation-duration: 0.6s
            }
            
            .zone-triangle
            {
                width: 0; 
                height: 0; 
                border-left: 10px solid transparent;
                border-right: 10px solid transparent;
                border-bottom: 10px solid white;
                margin-top: -8px;
                margin-left: 230px;
            }
            
            .location-modal
            {
                display: none;
                position: absolute; /* Stay in place */
                z-index: 0;
                padding-top: 300px; /* Location of the box */
                left: 0;
                top: 90px;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.0); /* Black w/ opacity */
                /* background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
            
            .locationdrop
            {
                display: none;
                z-index: 0;
                width: 500px;
                height: 400px;
                top: 80px;
                background-color: white;
                border: 0.2px solid #aaa;
                margin-left: calc(100% - 850px);
                position: fixed;
                padding: 0;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.8),0 6px 20px 0 rgba(0,0,0,0.19);
                -webkit-animation-name: none;
                -webkit-animation-duration: 0.6s;
                animation-name: none;
                animation-duration: 0.6s
            }
            
            .location-triangle
            {
                width: 0; 
                height: 0; 
                border-left: 10px solid transparent;
                border-right: 10px solid transparent;
                border-bottom: 10px solid white;
                margin-top: -8px;
                margin-left: 230px;
            }
            
            .carrier-modal
            {
                display: none;
                position: absolute; /* Stay in place */
                z-index: 0;
                padding-top: 300px; /* Location of the box */
                left: 0;
                top: 90px;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.0); /* Black w/ opacity */
                /* background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
            
            .carrierdrop
            {
                display: none;
                z-index: 0;
                width: 300px;
                height: 450px;
                top: 80px;
                background-color: white;
                border: 0.2px solid #aaa;
                margin-left: calc(100% - 540px);
                position: fixed;
                padding: 0;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.8),0 6px 20px 0 rgba(0,0,0,0.19);
                -webkit-animation-name: none;
                -webkit-animation-duration: 0.6s;
                animation-name: none;
                animation-duration: 0.6s
            }
            
            .carrier-triangle
            {
                width: 0; 
                height: 0; 
                border-left: 10px solid transparent;
                border-right: 10px solid transparent;
                border-bottom: 10px solid white;
                margin-top: -8px;
                margin-left: 140px;
            }
            
            .time-modal
            {
                display: none;
                position: absolute; /* Stay in place */
                z-index: 0;
                padding-top: 300px; /* Location of the box */
                left: 0;
                top: 90px;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.0); /* Black w/ opacity */
                /* background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
            
            .timedrop
            {
                display: none;
                z-index: 0;
                width: 300px;
                height: 450px;
                top: 80px;
                background-color: white;
                border: 0.2px solid #aaa;
                margin-left: calc(100% - 450px);
                position: fixed;
                padding: 0;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.8),0 6px 20px 0 rgba(0,0,0,0.19);
                -webkit-animation-name: none;
                -webkit-animation-duration: 0.6s;
                animation-name: none;
                animation-duration: 0.6s
            }
            
            .time-triangle
            {
                width: 0; 
                height: 0; 
                border-left: 10px solid transparent;
                border-right: 10px solid transparent;
                border-bottom: 10px solid white;
                margin-top: -8px;
                margin-left: 140px;
            }
            
            .shopping-list
            {
                width: 90%;
                height: 400px;
                margin-top: 150px;
                margin-left: auto;
                margin-right: auto;
                padding: 10px;
                overflow: scroll;
                background-color: white;
            }
            
            .board-heading
            {
                width: calc(100% - 400px);
                height: 282px;
                position: fixed;
                z-index: 3;
                top: 99px;
                left: 25px;
                background-color: white;
            }
            
            .board-image
            {
                width: 100%;
                height: 200px;
                background-image: url("/outlets/grocerie.jpg");
                background-size: cover;
                background-repeat: no-repeat;
            }
            
            .board-search
            {
                width: 100%;
                height: 82px;
                background-color: white;
            }
            
            .promotional
            {
                width: 90%;
                height: 200px;
                padding-top: 130px;
                margin-left: auto;
                margin-right: auto;
                font-size: 20px;
                color: white;
            }
        
        .flex-button
        {
            width: 100%;
            height: 100%;
            padding: 0;
            margin: 0;
            list-style: none;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            background-color: #e00e00;
        }
        
        .flex-button:hover
        {
            background-color: #c00c00;
        }
            
            
                
                
                </style>
                </head>
        <body onload="showTicket()">
    
    
    
    <%
        
        
        session.setAttribute("current-page", "board.jsp");
        
        long sessionCustomerID = -1;
        CustomerRetrieve sessionCustomer = null;
        
        if (session.getAttribute("customer-id") == null)
        
        {
            //response.sendRedirect("index.jsp");
        }
        
        else
            
        {
            sessionCustomerID = Long.parseLong((String) session.getAttribute("customer-id"));
            
            
            if (sessionCustomerID != -1)
                
            {
                sessionCustomer = new CustomerRetrieve(sessionCustomerID);
                session.setAttribute("account-state", sessionCustomer.getCustomerFullName());
            }
        }
        
        
        
        %>
        
        
    
        
        <header>
                                    <a href="index.jsp" style="text-decoration:none;color:inherit;"><div style="text-decoration:none;color:inherit;float:left;">
            <img src="images/chilloutlets.png" style="margin-left:15px;height:30px;margin-top:28px;" />
            <!-- <img src='images/transparent-white.png' style="margin-left:2px;height:15px;" /> -->
                                        </div></a>
            
            <div class="toolholder">
            <a href="javascript:setActive()" style="text-decoration:none;color:inherit;">
            <div class="nav-tools">
                <div class="tool-label">Account</div>
                <div class="selected-tool">
                    <div class="text-holder"><%= session.getAttribute("account-state").toString().toUpperCase() %></div>
                    <div id="nav-caret" class="caret-holder"><i class="fa fa-caret-down" style="font-size:15px"></i></div>
                </div>
            </div>
            </a>
            <a href="javascript:openTimeDrop()" style="text-decoration:none;color:inherit;">
            <div class="when-tools">
                <div class="when-label">In</div>
                <div class="when-tool">
                    <div class="text-holder"><%= session.getAttribute("time").toString().toUpperCase() %></div>
                    <div id="when-caret" class="caret-holder"><i class="fa fa-caret-down" style="font-size:15px"></i></div>
                </div>
            </div>
            </a>
            <a href="javascript:openCarrierDrop()" style="text-decoration:none;color:inherit;">
            <div class="transit-tools">
                <div class="transit-label">Via</div>
                <div class="transit-tool">
                    <div class="text-holder"><%= session.getAttribute("carrier").toString().toUpperCase() %></div>
                    <div id="transit-caret" class="caret-holder"><i class="fa fa-caret-down" style="font-size:15px"></i></div>
                </div>
            </div>
            </a>
            <a href="javascript:openLocationDrop()" style="text-decoration:none;color:inherit;">
            <div class="address-tools">
                <div class="address-label">Delivering to</div>
                <div class="address-tool">
                    <div class="text-holder"><%= inputAddress.toUpperCase() %></div>
                    <div id="address-caret" class="caret-holder"><i class="fa fa-caret-down" style="font-size:15px"></i></div>
                </div>
            </div>
            </a>
            <a href="javascript:openZoneDrop()" style="text-decoration:none;color:inherit;">
            <div class="city-tools">
                <div class="city-label">Shopping in</div>
                <div class="city-tool">
                    <div class="text-holder"><%= session.getAttribute("service-area").toString().toUpperCase() %></div>
                    <div id="zone-caret" class="caret-holder"><i class="fa fa-caret-down" style="font-size:15px"></i></div>
                </div>
            </div>
            </a>
                </div>
        </header>
                    
                                            
                                        
                                        <div class='spin-overlay'>
                                            
                                            <div class="spin"></div>
                                            
                                        </div>
                                        
                                        
                                        
                                        <div class="login-modal" id="login-modal">
                                            
                                            <div id='logindrop' class="logindrop">
                                            
                                                
                                                <div class="triangle"></div>
                                                
                                            
                                            <%
            
            session.setAttribute("door-state", "closed");
            
            
            //String destinationLatitude = request.getParameter("latitude");
            //String destinationLongitude = request.getParameter("longitude");
            
            
            session.setAttribute("address", inputAddress);
            //session.setAttribute("latitude", destinationLatitude);
            //session.setAttribute("longitude", destinationLongitude);
            
            
            
            if (sessionCustomer == null)
                
            {
            
            
            
            
            %>
                                                
                                                <div class='drop-nav'>
                                                    
                                                    <a href="javascript:login()">
                                                    <div class='drop-nav-login'>
                                                    
                                                        <span>LOG IN</span>
                                                    
                                                    </div>
                                                    </a>
                                                    <a href="javascript:register()">
                                                    <div class='drop-nav-register'>
                                                    
                                                        <span>SIGN UP</span>
                                                    
                                                    </div>
                                                    </a>
                                                    
                                                </div>
                                                <div class='drop-body'>
                                                    
                                                    <div class='drop-body-login'>
                                                        
                                                        <div id='login-message'></div>
                                                        
                                                        <form hidden id="login-submit-form" method='post' action="Login">
                                                    
                                                                    <input height="30px" id="customer-email-submit" name="customer-email" type="email" placeholder="Email address" />
                                                                
                                                                <input height="30px" id="customer-password-submit" name="customer-password" type="password" placeholder="Password" />
                                                                
                                                        </form>
                                                        
                                                        <form  action="javascript:submitCustomerLogin()">
                                                            
                                                                <div class="credentials">   
                                                                    <input height="30px" id="customer-email" name="customer-email" type="email" placeholder="Email address" />
                                                                
                                                                <br>
                                                                <input height="30px" id="customer-password" name="customer-password" type="password" placeholder="Password" />
                                                                </div>
                                                                <div class="redclickarea">
                                                                    <div hidden><button class="redclicker">LOG IN</button></div>
                                                                    <a href='javascript:submitCustomerLogin()' style='text-decoration:none;color:inherit;'>
                                                                        <div class='flex-button'>LOG IN</div>
                                                                    </a>
                                                                </div>
                                                                
                                                        </form>
                                                        
                                                    </div>
                                                    <div class='drop-body-register'>
                                                        
                                                        <form method='post' action="LogRegister">
                                                    
                                                        <div class="credentials-long">
                                                                    
                                                                
                                                                    <input height="30px" name="customer-full-name" type="text" value='' placeholder="Name" />
                                                                <br>
                                                                    <input height="30px" name="customer-email-address" type="email" value='' placeholder="Email address" />
                                                                <br>
                                                                    <input height="30px" name="customer-phone-number" type="text" value='' placeholder="Phone Number" />
                                                                <br>
                                                                
                                                                    <input height="30px" name="customer-password" type="password" value='' placeholder="Password" />
                                                                    <br>
                                                                    <input height="30px" name="confirm-password" type="password" value='' placeholder="Try Password Again" />
                                                                </div>
                                                                <div class="redclickarea">
                                                                    <div hidden><button id="signup-button" class="redclicker">SIGN UP</button></div>
                                                                    <a href='javascript:submitSignUp()' style='text-decoration:none;color:inherit;'>
                                                                        <div class='flex-button'>SIGN UP</div>
                                                                    </a>
                                                                </div>
                                                    
                                                            </form>
                                                             
                                                            
                                                    </div>
                                                    

                                                    
                                                </div>
                                            
                                            
                                            <%
            
            
            
            }
            
            else
                
            {
            
            
            
            %>
            
            
            <div class='drop-logout'>

                                    
                                    <form method="post" action="Logout">

                                            <div class="credentials-long">   
                                                <div>
                                                            <div class="chillcredits">
                                                                
                                                                <div class="cardarea">
                                                                    <div class="cardtop"><img src="images/chilloutlets.png" style="margin-left:16px;height:23px;margin-top:12px;float:left;" /></div>
                                                                    <div class="cardcredit">$900.00</div>
                                                                    <div class="cardowner">Prepaid Card</div>
                                                                </div>
                                                            
                                                            </div>
                                                </div><hr>
                                                <div>My Prepaid Card<hr></div>
                                            </div>
                                            <div class="redclickarea">
                                                <div hidden><button id="logout-button" class="redclicker">LOG OUT</button></div>
                                                <a href='javascript:submitLogout()' style='text-decoration:none;color:inherit;'>
                                                    <div class='flex-button'>LOG OUT</div>
                                                </a>
                                            </div>
                                        
                                    </form>

                                </div>
                                            
                                            
                                            <%
            
            
            }
            
            
            %>
                                                
                                        </div>
                                        </div>
            
            
                                        
                                        <div class="carrier-modal" id="carrier-modal">
                                            <div id='carrierdrop' class="carrierdrop">
                                            
                                                <div class="carrier-triangle"></div>
                                                <div class="" style="width:100%;height:60px;box-shadow:0 9px 8px #aaa;font-size:20px;color:#000;font-family:arial;padding:20px;">Change transport mode</div>
                                                <div class="" style="width:100%;height:330px;font-size:13px;color:black;font-family:arial;padding:20px;"></div>
                                                <div class="" style="width:100%;height:60px;">
                                                    <a href='javascript:submitCarrierType()' style='text-decoration:none;color:inherit;'>
                                                        <div class='flex-button'>SAVE</div>
                                                    </a>
                                                </div>
                                                
                                            </div>
                                        </div>
            
            
                                        
                                        <div class="time-modal" id="time-modal">
                                            <div id='timedrop' class="timedrop">
                                            
                                                <div class="time-triangle"></div>
                                                <div class="" style="width:100%;height:60px;box-shadow:0 9px 8px #aaa;font-size:20px;color:#000;font-family:arial;padding:20px;">Change delivery time</div>
                                                <div class="" style="width:100%;height:330px;font-size:13px;color:black;font-family:arial;padding:20px;"></div>
                                                <div class="" style="width:100%;height:60px;">
                                                    <a href='javascript:submitCarrierType()' style='text-decoration:none;color:inherit;'>
                                                        <div class='flex-button'>SAVE</div>
                                                    </a>
                                                </div>
                                                
                                                
                                            </div>
                                        </div>
            
            
                                        
                                        <div class="location-modal" id="location-modal">
                                            <div id='locationdrop' class="locationdrop">
                                            
                                                <div class="location-triangle"></div>
                                                <div class="" style="width:100%;height:60px;box-shadow:0 9px 8px #aaa;font-size:20px;color:#000;font-family:arial;padding:20px;">Change delivery address</div>
                                                <div class="" style="width:100%;height:280px;font-size:13px;color:black;font-family:arial;padding:20px;"></div>
                                                <div class="" style="width:100%;height:60px;">
                                                    <a href='javascript:submitCarrierType()' style='text-decoration:none;color:inherit;'>
                                                        <div class='flex-button'>SAVE</div>
                                                    </a>
                                                </div>
                                                
                                                
                                            </div>
                                        </div>
            
            
                                        
                                        <div class="zone-modal" id="zone-modal">
                                            <div id='zonedrop' class="zonedrop">
                                            
                                                <div class="zone-triangle"></div>
                                                <div class="" style="width:100%;height:60px;box-shadow:0 9px 8px #aaa;font-size:20px;color:#000;font-family:arial;padding:20px;">Change shopping area</div>
                                                <div class="" style="width:100%;height:180px;font-size:13px;color:black;font-family:arial;padding:20px;"></div>
                                                <div class="" style="width:100%;height:60px;">
                                                    <a href='javascript:submitCarrierType()' style='text-decoration:none;color:inherit;'>
                                                        <div class='flex-button'>SAVE</div>
                                                    </a>
                                                </div>
                                                
                                                
                                            </div>
                                        </div>
                    
            
        
        
        <div class="body">
            
            
            <div class="panel-area">
                
              <div class="explore-panel">
                
                <div class="sliding-scene">

                    <!--
                        <div class="selector">

                          <input type="text" class="page-search" name="page-search" style="font-weight:normal;border-radius:0px;background-color:#fff;padding-left:50px;height:80px;width:100%;background:url('images/search-symbol.png');background-position:2% 28px;background-size:20px;background-repeat:no-repeat;" onfocus="this.style.border='none'" placeholder="Search for Store name or Product" />
                          
                        </div> -->
                    
                    <div class="outlets-back">
                    <div class="outlets-left"></div>
                    <div class="outlets">
                        

                                <%
                                    int count = 0;

                                    for (count = 0; (count < outlets.length()) && (outlets.getOutlet(count) != null); count++) 

                                    {


                                    %>



                        <div class="outlet-store">
                            <a href="javascript:selectOutlet('<%= outlets.getOutlet(count).getOutletNumber() %>', '<%= outlets.getOutlet(count).getBranchNumber() %>', '<%= outlets.getOutlet(count).getOutletName().replace("'", "\\'") %>', '<%= outlets.getOutlet(count).getBranchAddress().replace("'", "\\'") %>', '<%= outlets.getOutlet(count).getOutletPoster() %>')">
                                <div class="outlet-logo"><img class="outlet-logo" src="<%= "/outlets/" + outlets.getOutlet(count).getOutletPoster() %>" alt="store"/></div>
                                <div class="distance"><span class="toptext"><%= outlets.getOutlet(count).getOutletName() %></span><br><span class="bottomtext"><%= outlets.getOutlet(count).getBranchAddress() %>
                                            
                                        <br><%= outlets.getOutlet(count).getDisplayDistance() %> away</span>
                                    
                                </div>
                                
                                <div class="delivery-time">
                                    
                                    <span class="bottomtext"><%= outlets.getOutlet(count).getDeliveryTime() %></span><br>
                                    <span class="toptext">Delivery Time</span>
                                
                                </div>
                                
                                    <div class="delivery">
                                        <span class="bottomtext"><%= outlets.getOutlet(count).getTransitFee() %></span><br>
                                        <span class="toptext">Delivery Fee</span>
                                    </div>

                            
                            </a>
                        </div>




                                    <%
                                        }
                                        %>



                    </div>
                    <div class="outlets-right"></div>          
                    </div>
                    
                </div>
                
              </div>
                
                <div class="order-panel">
                    

                    <div class="product-search">
                        
                    <div class="order-list">
                        <div class="order-list-header"></div>
                        
                            <div class="ticket-body"></div>
                        
                    </div>
                    
                    </div>
                    <img class="bag" src="/outlets/red-lambo.png" alt='carrier' />
                    <div class="start-building-msg">Start building your order by collecting items to this counter.</div>
                    <div class="subtotal-checker"><div class="checker">Boarding ticket</div><div class="subtotal"><span id="subtotal-double">5</span></div></div>
                    <div class='checkout-area'>
                        
                        <div hidden><button onclick="shop()" class="checkout-button">VISIT STORES</button></div>
                        <a href='javascript:shop()' style='text-decoration:none;color:inherit;'>
                            <div class='flex-button'>VISIT STORES</div>
                        </a>
                        
                    </div>

                    
                </div>
                
            </div>
            
        
                            
                            <div class="expedition-ticket">
                                            
                                <form id="ticket-form" method="post" action="shop.jsp">
                                    
                                    <input hidden id="ticket-input" name="ticket-input" />
                                    
                                    <div class="ticket-header"><h4><b>Book your shopping expedition ticket</b></h4></div>
                                    <div class="ticket-body"></div>
                                    <div class="ticket-footer"><button onclick="shop()" class="checkout-button">SHOP OUTLETS</button></div>
                                    
                                </form>
                                
                            </div>
                                        
                                        <div class="board-heading">
                                            <div class="board-image"><div class='promotional'>Get $5 on orders up to $80 of items.</div></div>
                                            <div class="board-search">
                                                
                                                <input type="text" class="page-search" name="page-search" style="font-weight:normal;border-radius:0px;background-color:#fff;padding-left:50px;height:80px;width:100%;background:url('images/search-symbol.png');background-position:2% 28px;background-size:20px;background-repeat:no-repeat;" onfocus="" placeholder="Search for Store or Product" />
                                                
                                            </div>
                                        </div>         
        
                                        
                                        
        </div>
            
        
        <script type="text/javascript">
            
            var ticketArray = [];
            var myJSON = null;
            
            var customerID = null;
            var customerFullName = null;
            var customerCredit = null;

            var spinner = document.getElementsByClassName('spinner-overlay')[0];
            var span = document.getElementsByClassName("close")[0];
            var loginModal = document.getElementById("login-modal");
            var loginDrop = document.getElementById("logindrop");
            var carrierModal = document.getElementById("carrier-modal");
            var carrierDrop = document.getElementById("carrierdrop");
            var timeModal = document.getElementById("time-modal");
            var timeDrop = document.getElementById("timedrop");
            var locationModal = document.getElementById("location-modal");
            var locationDrop = document.getElementById("locationdrop");
            var zoneModal = document.getElementById("zone-modal");
            var zoneDrop = document.getElementById("zonedrop");
                    
                    function setActive()
                    
                    {
                        carrierModal.style.zIndex = "0";
                        carrierModal.style.position = "absolute";
                        carrierModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        carrierModal.style.paddingTop = "50px";
                        carrierDrop.style.display = "none";
                        carrierModal.style.display = "none";
                        document.getElementById('transit-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";

                        timeModal.style.zIndex = "0";
                        timeModal.style.position = "absolute";
                        timeModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        timeModal.style.paddingTop = "50px";
                        timeDrop.style.display = "none";
                        timeModal.style.display = "none";
                        document.getElementById('when-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";

                        locationModal.style.zIndex = "0";
                        locationModal.style.position = "absolute";
                        locationModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        locationModal.style.paddingTop = "50px";
                        locationDrop.style.display = "none";
                        locationModal.style.display = "none";
                        document.getElementById('address-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";

                        zoneModal.style.zIndex = "0";
                        zoneModal.style.position = "absolute";
                        zoneModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        zoneModal.style.paddingTop = "50px";
                        zoneDrop.style.display = "none";
                        zoneModal.style.display = "none";
                        document.getElementById('zone-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";

                        
                        //header.style.zIndex = '202';
                        loginDrop.style.zIndex = '204';
                        loginModal.style.zIndex = "200";
                        loginModal.style.position = "fixed";
                        loginModal.style.backgroundColor = "rgba(0,0,0,0.6)";
                        loginModal.style.paddingTop = "90px";
                        loginModal.style.display = "block";
                        loginDrop.style.display = "block";
                        document.getElementById('nav-caret').innerHTML = "<i class=\"fa fa-caret-up\" style=\"font-size:15px\">";
                    }
                    
                    function openCarrierDrop()
                    
                    {
                        loginModal.style.zIndex = "0";
                        loginModal.style.position = "absolute";
                        loginModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        loginModal.style.paddingTop = "50px";
                        loginDrop.style.display = "none";
                        loginModal.style.display = "none";
                        document.getElementById('nav-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";
                        
                        timeModal.style.zIndex = "0";
                        timeModal.style.position = "absolute";
                        timeModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        timeModal.style.paddingTop = "50px";
                        timeDrop.style.display = "none";
                        timeModal.style.display = "none";
                        document.getElementById('when-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";

                        locationModal.style.zIndex = "0";
                        locationModal.style.position = "absolute";
                        locationModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        locationModal.style.paddingTop = "50px";
                        locationDrop.style.display = "none";
                        locationModal.style.display = "none";
                        document.getElementById('address-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";

                        zoneModal.style.zIndex = "0";
                        zoneModal.style.position = "absolute";
                        zoneModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        zoneModal.style.paddingTop = "50px";
                        zoneDrop.style.display = "none";
                        zoneModal.style.display = "none";
                        document.getElementById('zone-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";

                        
                        //header.style.zIndex = '202';
                        carrierDrop.style.zIndex = '204';
                        carrierModal.style.zIndex = "200";
                        carrierModal.style.position = "fixed";
                        carrierModal.style.backgroundColor = "rgba(0,0,0,0.6)";
                        carrierModal.style.paddingTop = "90px";
                        carrierModal.style.display = "block";
                        carrierDrop.style.display = "block";
                        document.getElementById('transit-caret').innerHTML = "<i class=\"fa fa-caret-up\" style=\"font-size:15px\">";
                    }
                    
                    function openTimeDrop()
                    
                    {
                        loginModal.style.zIndex = "0";
                        loginModal.style.position = "absolute";
                        loginModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        loginModal.style.paddingTop = "50px";
                        loginDrop.style.display = "none";
                        loginModal.style.display = "none";
                        document.getElementById('nav-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";

                        carrierModal.style.zIndex = "0";
                        carrierModal.style.position = "absolute";
                        carrierModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        carrierModal.style.paddingTop = "50px";
                        carrierDrop.style.display = "none";
                        carrierModal.style.display = "none";
                        document.getElementById('transit-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";
                        
                        locationModal.style.zIndex = "0";
                        locationModal.style.position = "absolute";
                        locationModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        locationModal.style.paddingTop = "50px";
                        locationDrop.style.display = "none";
                        locationModal.style.display = "none";
                        document.getElementById('address-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";

                        zoneModal.style.zIndex = "0";
                        zoneModal.style.position = "absolute";
                        zoneModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        zoneModal.style.paddingTop = "50px";
                        zoneDrop.style.display = "none";
                        zoneModal.style.display = "none";
                        document.getElementById('zone-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";

                        
                        //header.style.zIndex = '202';
                        timeDrop.style.zIndex = '204';
                        timeModal.style.zIndex = "200";
                        timeModal.style.position = "fixed";
                        timeModal.style.backgroundColor = "rgba(0,0,0,0.6)";
                        timeModal.style.paddingTop = "90px";
                        timeModal.style.display = "block";
                        timeDrop.style.display = "block";
                        document.getElementById('when-caret').innerHTML = "<i class=\"fa fa-caret-up\" style=\"font-size:15px\">";
                    }
                    
                    function openZoneDrop()
                    
                    {
                        loginModal.style.zIndex = "0";
                        loginModal.style.position = "absolute";
                        loginModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        loginModal.style.paddingTop = "50px";
                        loginDrop.style.display = "none";
                        loginModal.style.display = "none";
                        document.getElementById('nav-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";

                        carrierModal.style.zIndex = "0";
                        carrierModal.style.position = "absolute";
                        carrierModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        carrierModal.style.paddingTop = "50px";
                        carrierDrop.style.display = "none";
                        carrierModal.style.display = "none";
                        document.getElementById('transit-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";

                        timeModal.style.zIndex = "0";
                        timeModal.style.position = "absolute";
                        timeModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        timeModal.style.paddingTop = "50px";
                        timeDrop.style.display = "none";
                        timeModal.style.display = "none";
                        document.getElementById('when-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";

                        locationModal.style.zIndex = "0";
                        locationModal.style.position = "absolute";
                        locationModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        locationModal.style.paddingTop = "50px";
                        locationDrop.style.display = "none";
                        locationModal.style.display = "none";
                        document.getElementById('address-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";
                        
                        
                        //header.style.zIndex = '202';
                        zoneDrop.style.zIndex = '204';
                        zoneModal.style.zIndex = "200";
                        zoneModal.style.position = "fixed";
                        zoneModal.style.backgroundColor = "rgba(0,0,0,0.6)";
                        zoneModal.style.paddingTop = "90px";
                        zoneModal.style.display = "block";
                        zoneDrop.style.display = "block";
                        document.getElementById('zone-caret').innerHTML = "<i class=\"fa fa-caret-up\" style=\"font-size:15px\">";
                    }
                    
                    function openLocationDrop()
                    
                    {
                        loginModal.style.zIndex = "0";
                        loginModal.style.position = "absolute";
                        loginModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        loginModal.style.paddingTop = "50px";
                        loginDrop.style.display = "none";
                        loginModal.style.display = "none";
                        document.getElementById('nav-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";

                        carrierModal.style.zIndex = "0";
                        carrierModal.style.position = "absolute";
                        carrierModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        carrierModal.style.paddingTop = "50px";
                        carrierDrop.style.display = "none";
                        carrierModal.style.display = "none";
                        document.getElementById('transit-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";

                        timeModal.style.zIndex = "0";
                        timeModal.style.position = "absolute";
                        timeModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        timeModal.style.paddingTop = "50px";
                        timeDrop.style.display = "none";
                        timeModal.style.display = "none";
                        document.getElementById('when-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";
                        
                        zoneModal.style.zIndex = "0";
                        zoneModal.style.position = "absolute";
                        zoneModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        zoneModal.style.paddingTop = "50px";
                        zoneDrop.style.display = "none";
                        zoneModal.style.display = "none";
                        document.getElementById('zone-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";

                        
                        locationModal.style.zIndex = "200";
                        locationModal.style.position = "fixed";
                        locationModal.style.backgroundColor = "rgba(0,0,0,0.6)";
                        locationModal.style.paddingTop = "90px";
                        locationModal.style.display = "block";
                        locationDrop.style.display = "block";
                        document.getElementById('address-caret').innerHTML = "<i class=\"fa fa-caret-up\" style=\"font-size:15px\">";
                    }
                    
                    function login()
                    
                    {
                        document.getElementsByClassName('drop-body-register')[0].style.display = "none";
                        document.getElementsByClassName('drop-body-login')[0].style.display = "block";
                    }
                    
                    function register()
                    
                    {
                        document.getElementsByClassName('drop-body-login')[0].style.display = "none";
                        document.getElementsByClassName('drop-body-register')[0].style.display = "block";
                    }
            
            window.onclick = function(event)
            
            {
                if (event.target === loginModal)
                    
                {
                    
                    loginModal.style.zIndex = "0";
                    loginModal.style.position = "absolute";
                    loginModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                    loginModal.style.paddingTop = "50px";
                    loginDrop.style.display = "none";
                    loginModal.style.display = "none";
                    document.getElementById('nav-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";
                }
                
                else if (event.target === carrierModal)
                    
                {
                    
                    carrierModal.style.zIndex = "0";
                    carrierModal.style.position = "absolute";
                    carrierModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                    carrierModal.style.paddingTop = "50px";
                    carrierDrop.style.display = "none";
                    carrierModal.style.display = "none";
                    document.getElementById('transit-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";
                }
                
                else if (event.target === timeModal)
                    
                {
                    
                    timeModal.style.zIndex = "0";
                    timeModal.style.position = "absolute";
                    timeModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                    timeModal.style.paddingTop = "50px";
                    timeDrop.style.display = "none";
                    timeModal.style.display = "none";
                    document.getElementById('when-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";
                }
                
                else if (event.target === locationModal)
                    
                {
                    
                    locationModal.style.zIndex = "0";
                    locationModal.style.position = "absolute";
                    locationModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                    locationModal.style.paddingTop = "50px";
                    locationDrop.style.display = "none";
                    locationModal.style.display = "none";
                    document.getElementById('address-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";
                }
                
                else if (event.target === zoneModal)
                    
                {
                    
                    zoneModal.style.zIndex = "0";
                    zoneModal.style.position = "absolute";
                    zoneModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                    zoneModal.style.paddingTop = "50px";
                    zoneDrop.style.display = "none";
                    zoneModal.style.display = "none";
                    document.getElementById('zone-caret').innerHTML = "<i class=\"fa fa-caret-down\" style=\"font-size:15px\">";
                }
                
            };
            
            
            
            function shop()
            
            {
                document.getElementById('ticket-input').value = document.cookie;
                
                var spin = document.getElementsByClassName('spin-overlay')[0];
                spin.style.display = "block";
                spin.style.zIndex = "300";
                
                setTimeout(function(){
                    document.getElementById('ticket-form').submit();
                }, 3000);
                
            }
            
            function selectOutlet(outletNumber, branchNumber, outletName, branchLocation, outletPoster)
            
            {
                var ticketBody = document.getElementsByClassName('ticket-body')[0];
                
                
                if (ticketArray.length === 0)
                    
                {
                    document.cookie = "";
                }

                else

                {
                    document.cookie = JSON.stringify(ticketArray);
                }
                
                //build json ticketArray from passed parameters
                var outletObject = {
                    'outletNum':outletNumber, 'branchNum':branchNumber, 'name':outletName, 'location':branchLocation, 'poster':outletPoster
                };
                
                
                
                if (document.cookie === "")
                    
                {
                    
                    ticketArray.push(outletObject);
                    
                }

                else

                {
                    //unstringify document.cookie and push to ticketArray
                    //ticketArray.push(JSON.parse(document.cookie));
                    var created = JSON.parse(document.cookie);
                    created.push(outletObject);
                    ticketArray = created;
                }
                
                //stringify the new ticketArray and push back to cookie
                document.cookie = JSON.stringify(ticketArray);
                
                ticketBody.innerHTML = "";
                
                //read resultant array and print on ticket
                for (var count = 0; count < ticketArray.length; count++)
                    
                {
                    //get outletnumber, branchnumber, outletname, outletposter, and branchlocation and put them into ticket-body
                    var outletDiv = "<div class=\'ticketlet\'>\n\
                                        <div class=\'ticketlet-poster\'><img class=\'ticketlet-poster\' src=\'/outlets/" + ticketArray[count]['poster'] + "\' /></div>\n\
                                        <div class=\'ticketlet-info\'>\n\
                                            <div class=\'ticket-outlet-name\'>" + ticketArray[count]['name'] + "</div>\n\
                                            <div class=\'ticket-outlet-close\'><a href=\'javascript:deleteTicketEntry(" + count + ")\'>&Cross;</a></div>\n\
                                            <div class=\'ticket-branch\'>" + ticketArray[count]['location'] + "</div>\n\
                                        </div>\n\
                                    </div>";
            
                    ticketBody.innerHTML += outletDiv;
                    
                }
                
                document.getElementById('subtotal-double').innerHTML = ticketArray.length;
                
            }
            
            function deleteTicketEntry(entry)
            
            {
                var proxyArray = [];
                var outletObject = null;
                
                for (var count = 0; count < ticketArray.length; count++)
                    
                {
                    
                    if ((ticketArray[count] !== null) && (count !== entry))
                    
                    {
                        outletObject = ticketArray[count];
                        proxyArray.push(outletObject);
                        
                    }
                    
                }
                
                var incoming = JSON.stringify(proxyArray);
                document.cookie = incoming;
                ticketArray = proxyArray;
                
                showTicket();
            }
            
            function showTicket()
            
            {
                var ticketBody = document.getElementsByClassName('ticket-body')[0];
                
                if (document.cookie !== "")
                    
                {
                    
                    //unstringify document.cookie and push to ticketArray
                    var created = JSON.parse(document.cookie);
                    ticketArray = created;
                    
                }
                
                ticketBody.innerHTML = "";
                
                //read resultant array and print on ticket
                for (var count = 0; count < ticketArray.length; count++)
                    
                {
                    //get outletnumber, branchnumber, outletname, outletposter, and branchlocation and put them into ticket-body
                    var outletDiv = "<div class=\'ticketlet\'>\n\
                                        <div class=\'ticketlet-poster\'><img class=\'ticketlet-poster\' src=\'/outlets/" + ticketArray[count]['poster'] + "\' /></div>\n\
                                        <div class=\'ticketlet-info\'>\n\
                                            <div class=\'ticket-outlet-name\'>" + ticketArray[count]['name'] + "</div>\n\
                                            <div class=\'ticket-outlet-close\'><a href=\'javascript:deleteTicketEntry(" + count + ")\'>&Cross;</a></div>\n\
                                            <div class=\'ticket-branch\'>" + ticketArray[count]['location'] + "</div>\n\
                                        </div>\n\
                                    </div>";
            
                    ticketBody.innerHTML += outletDiv;
                    
                }
                
                document.getElementById('subtotal-double').innerHTML = ticketArray.length;
                
            }
    
    function submitCustomerLogin()
    
    {
        var customerEmail = document.getElementById("customer-email").value;
        var customerPassword = document.getElementById("customer-password").value;
        
        /*
        var senderClientID = window.parent.document.getElementById("sender-client-id").value;
        
        var msgContentDiv = window.parent.document.getElementById("msg_body_content");
        var clearDiv = window.parent.document.createElement("div");
        clearDiv.setAttribute("id", "msg_body_content");
        msgContentDiv.parentNode.replaceChild(clearDiv, msgContentDiv);
        */
        
        var xml = new XMLHttpRequest();

          xml.onreadystatechange = function() {

              if (xml.readyState == 4)

              {
                  
                  if (xml.status == 200)

                  {
                      var count = 0;
                      
                      
                      //call message content div again
                      //msgContentDiv = window.parent.document.getElementById("msg_body_content");
                      
                      var customers = xml.responseXML.getElementsByTagName("Customers")[0];
                      customers = customers.getElementsByTagName("Customer");
                      alert("customer id " + xml.responseText);
                      
                      for (count = 0; count < 1; count++)
                          
                        {
                            var customer = customers[count];
                            customerID = customer.getElementsByTagName("customerID")[0].firstChild.nodeValue;
                            customerFullName = customer.getElementsByTagName("customerFullName")[0].firstChild.nodeValue;
                            customerCredit = customer.getElementsByTagName("customerCredit")[0].firstChild.nodeValue;
                            
                            //document.getElementById("account-signifier").innerHTML = customerFullName;
                            alert("customer id " + customerID);
                            /*
                            var msgDiv = window.parent.document.createElement("div");
                            msgDiv.setAttribute("class", "msg_b");
                            var msgbText = window.parent.document.createTextNode(text);
                            msgDiv.appendChild(msgbText);
                            
                            msgContentDiv.appendChild(msgDiv);
                            */
                        }
                        
                        if (customerID === null)
                            
                        {
                              alert("customerid null");
                        }
                        
                        else
                            
                        {
                            if (customerID !== "null")
                                
                            {
                                document.getElementById("customer-email-submit").value = customerEmail;
                                document.getElementById("customer-password-submit").value = customerPassword;
                                document.getElementById("login-submit-form").submit();
                            }

                            else

                            {
                                alert("customer id space");
                            }
                        }
                        
                        //msgContentDiv.parentNode.replaceChild(msgContentDiv, msgContentDiv);
                      
                  }

              }

          };

          var post = "customer-email=" + customerEmail + "&customer-password=" + customerPassword;

          xml.open("GET", "Login?" + post, true);
          xml.send();
          
    }
    
    function openClientMessageBox(recipientClientID, recipientClientName)
    
    {
        window.parent.document.getElementById("recipient-client-id").value = recipientClientID;
        window.parent.document.getElementById("recipient-client-name").innerHTML = recipientClientName;
        window.parent.document.getElementById("msg_box").style.display = "block";
        
        var senderClientID = window.parent.document.getElementById("sender-client-id").value;
        
        var msgContentDiv = window.parent.document.getElementById("msg_body_content");
        var clearDiv = window.parent.document.createElement("div");
        clearDiv.setAttribute("id", "msg_body_content");
        msgContentDiv.parentNode.replaceChild(clearDiv, msgContentDiv);
        
        
        var xml = new XMLHttpRequest();

          xml.onreadystatechange = function() {

              if (xml.readyState == 4)

              {

                  if (xml.status == 200)

                  {
                      var count = 0;
                      
                      //call message content div again
                      msgContentDiv = window.parent.document.getElementById("msg_body_content");
                      
                      var messages = xml.responseXML.getElementsByTagName("Messages")[0];
                      messages = messages.getElementsByTagName("Message");
                      
                      
                      for (count = 0; count < messages.length; count++)
                          
                        {
                            var message = messages[count];
                            var text = message.getElementsByTagName("Text")[0].firstChild.nodeValue;
                            var senderID = message.getElementsByTagName("Sender")[0].firstChild.nodeValue;
                            var timestamp = message.getElementsByTagName("Timestamp")[0].firstChild.nodeValue;
                            
                            var msgDiv = window.parent.document.createElement("div");
                            
                            if (senderClientID === senderID)
                            
                            {
                                msgDiv.setAttribute("class", "msg_b");
                                var msgbText = window.parent.document.createTextNode(text);
                                msgDiv.appendChild(msgbText);
                            }
                            
                            else if (recipientClientID === senderID)
                            
                            {
                                msgDiv.setAttribute("class", "msg_a");
                                var msgaText = window.parent.document.createTextNode(text);
                                msgDiv.appendChild(msgaText);
                            }
                            
                            else
                            
                            {
                                msgDiv.setAttribute("class", "msg_b");
                                var msgbText = window.parent.document.createTextNode(text);
                                msgDiv.appendChild(msgbText);
                            }
                            
                            
                            
                            msgContentDiv.appendChild(msgDiv);
                            
                        }
                        
                        msgContentDiv.parentNode.replaceChild(msgContentDiv, msgContentDiv);
                      
                  }

              }

          };

          var post = "sender-client-id=" + senderClientID + "&recipient-client-id=" + recipientClientID;

          xml.open("GET", "../MessageListServlet?" + post, true);
          xml.send();
          
          
    }
    
    function submitSignUp()
    
    {
        document.getElementById("signup-button").click();
    }
    
    function submitLogout()
    
    {
        document.getElementById("logout-button").click();
    }
    
            
            
            
        </script>
        
    </body>
</html>

