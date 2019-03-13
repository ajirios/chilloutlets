<%-- 
    Document   : index
    Created on : 18-Jul-2018, 10:16:04 AM
    Author     : ajirios
--%>

<%@page import="maps.CoordinateInsert"%>
<%@page import="customer.CustomerRetrieve"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
		<title>Do Your Shopping the Chill Way</title>
                <link rel="shortcut icon" type="image/png" href="images/chilliredup.png"/>
                <meta charset="utf-8" /> 
                <meta name="keywords" content="Chilloutlets, shop, shopping, store, buy, deliver, delivery, carrier" />
                <meta name="description" content="Find shops in any service area. Match and transport over 2.5 million logged goods. Delivers in 29 - 59 minutes. There is more than one way to do your delivery shopping now."/>
                <meta name="viewport" content="width=device-width, initial-scale=1">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
            <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnOuNL_P1zkEfYK-q3N7JQFInYlW_JLJE"></script>
            
                
                
                
        <style type="text/css">
            
            
            body
            {
                font-family: Roboto;
                font-weight: normal;
            }
            
            footer
            {
                font-size: 20px;
                //background-color: white;
            }
            
            .modal
            {
                position: absolute; /* Stay in place */
                z-index: 12;
                padding-top: 300px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.0); /* Black w/ opacity */
                /* background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
            
            .modal-content 
            {
            position: relative;
            background-color: #fefefe;
            margin: auto;
            padding: 0;
            border: 1px solid #888;
            border-top-left-radius: 12px;
            width: 70%;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
            -webkit-animation-name: none;
            -webkit-animation-duration: 0.6s;
            animation-name: none;
            animation-duration: 0.6s
            }

            /* Add Animation */
            @-webkit-keyframes animatetop 
            {
            from {top:0px; opacity:0} 
            to {top:-20px; opacity:1}
            }

            @keyframes animatetop 
            {
            from {top:0px; opacity:0}
            to {top:-20px; opacity:1}
            }
            
            .galleon 
            {
            -webkit-animation-name: animateleft;
            -webkit-animation-duration: 0.6s;
            animation-name: animateleft;
            animation-duration: 5s;
            animation-iteration-count: 1;
            }

            /* Add Animation */
            @-webkit-keyframes animateleft 
            {
            from 
            {
                margin-left: calc(100% - 40px); 
                opacity:0.3
            } 
            to 
            {
                margin-left: calc(50% - 40px); 
                opacity:1
            }
            }

            @keyframes animateleft 
            {
            from 
            {
                margin-left: calc(100% - 40px); 
                opacity:0.3
            } 
            to 
            {
                margin-left: calc(50% - 40px); 
                opacity:1
            }
            }
            
            .close
            {
                color: #aaaaaa;
                float: right;
                font-size: 18px;
                font-weight: bold;
            }
            
            .close:hover, .close:focus
            {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
            
            .modal-header 
            {
                padding: 7px 2px;
                height: 70px;
                background-color: #eeeeee;
                /* box-shadow: 0px 10px 2px #888888;  */
                color: white;
                z-index: 12;
            }

            .modal-body 
            {
                display: none;
                padding: 2px 10px;
                height: 350px;
                //background-image: url('images/adorama.jpg');
            }

            .modal-footer 
            {
                display: none;
                padding: 12px 10px;
                height: 50px;
                background-color: #e00b00;
                color: #ffffff;
            }
            
            #geomap
            {
                height: 100%;
                width: 100%;
                margin: 0;
                padding: 0;
            }
            
            #map
            {
                height: 100%;
                width: 100%;
                margin: 0;
                padding: 0;
            }
            
            #line
            {
                display: none;
                font-size: 17px;
            }
            
            #countries
            {
                display: block;
                font-size: 17px;
                float: left;
            }
            
            .sample-modal
            {
                position: absolute; /* Stay in place */
                z-index: 12;
                padding-top: 200px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 709px; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.1); /* Black w/ opacity */
                /* background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
            
            .login-modal
            {
                position: absolute; /* Stay in place */
                z-index: 12;
                padding-top: 300px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.0); /* Black w/ opacity */
                /* background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
            
            .logindrop
            {
                display: none;
                z-index: 30;
                width: 300px;
                height: 500px;
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
            
            .prefooter
            {
                display: none;
                width: 100%;
                height: 500px;
                padding-top: 50px;
                padding-bottom: 50px;
                padding-left: 100px;
                padding-right: 100px;
                background-color: #444;
            }
            
            .advantages
            {
                width: 100%;
                height: 300px;
                background-color: #fff;
                text-align: center;
            }
            
            .support-creators
            {
                width: 33%;
                height: 300px;
                padding: 2% 4%;
                float: left;
                border-right: 0.5px solid #ccc;
            }
            
            .support-creators > p
            {
                font-size: 17px;
            }
            
            .cool-delivery-technology
            {
                width: 33%;
                height: 300px;
                padding: 2% 4%;
                float: left;
                border-left: 0.5px solid #ccc;
            }
            
            .cool-delivery-technology > p
            {
                font-size: 17px;
            }
            
            .business-transparency
            {
                width: 33%;
                height: 300px;
                padding: 2% 4%;
                float: left;
            }
            
            .business-transparency > p
            {
                font-size: 17px;
            }
            
            .icon
            {
               color: #fff; 
            }
            
            .promos
            {
                width: 100%;
                height: 600px;
                padding-top: 25px;
                padding-bottom: 25px;
                padding-left: 5%;
                padding-right: 5%;
                background-color: #e00b00;
                color: #fff;
            }
            
            .extras
            {
                width: 100%;
                height: 600px;
                padding-top: 25px;
                padding-bottom: 25px;
                padding-left: 5%;
                padding-right: 5%;
                background-color: #555;
                color: #fff;
            }
            
            .payment-methods
            {
                width: 100%;
                height: 200px;
                padding-top: 25px;
                padding-bottom: 25px;
                padding-left: 5%;
                padding-right: 5%;
                background-color: #fff;
                color: #333;
            }
            
            .payment-cash
            {
                width: 100%;
                height: 400px;
                padding-left: 5%;
                padding-right: 5%;
                background-color: #fff;
                color: #333;
            }
            
            .payment-online
            {
                width: 100%;
                height: 400px;
                padding-left: 5%;
                padding-right: 5%;
                background-color: #fff;
                color: #333;
            }
            
            .cash-picture, .cash-picture > img
            {
                height: 400px;
                float: right;
            }
            
            .card-picture, .card-picture > img
            {
                height: 400px;
                float: left;
            }
            
            .cash-text
            {
                width: 200px;
                height: 350px;
                float: left;
            }
            
            .card-text
            {
                width: 200px;
                height: 350px;
                float: right;
            }
            
            .promo-header
            {
                width: 90%;
                height: 100px;
                font-size: 40px;
                text-align: center;
            }
            
            .promo-body
            {
                width: 90%;
                height: 430px;
                font-size: 60px;
            }
            
            .promo-left
            {
                width: 50%;
                height: 430px;
                float: left;
                text-align: center;
            }
            
            .promo-right
            {
                width: 50%;
                height: 430px;
                float: left;
                text-align: center;
            }
            
            .promo-footer
            {
                width: 90%;
                height: 20px;
                font-size: 13px;
                text-align: center;
            }
            
      #description 
      {
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
      }

      #infowindow-content .title 
      {
          font-family: Roboto;
        font-weight: bold;
      }

      #infowindow-content 
      {
        display: none;
        font-size: 20px;
        font-family: Roboto;
        color: #888;
      }

      #map #infowindow-content {
        display: inline;
      }

      .pac-card {
        margin: 10px 10px 0 0;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        background-color: #fff;
        font-family: Roboto;
      }

      #pac-container {
        
        padding-bottom: 12px;
        margin-right: 12px;
      }

      .pac-controls {
        display: inline-block;
        padding: 5px 11px;
      }

      .pac-controls label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }

      #pac-input {
        background-color: #fff;
        font-weight: 300;
        text-overflow: ellipsis;
        margin-top: 6px;
        //padding-right: 90px;
        display: block;
      }
            
            .address-entry
            {
                width: 470px;
                height: 56px;
                //background: url(images/loc.jpg) no-repeat scroll 7px 7px;
                padding-left: 0px;
                font-size: 20px;
                color: #888;
                display: block;
            }

      #title {
        color: #fff;
        background-color: #4d90fe;
        font-family: Roboto;
        font-size: 25px;
        font-weight: 500;
        padding: 6px 12px;
      }
      
      #type-selector
      {
          display: none;
      }
      
      #strict-bounds-selector
      {
          display: none;
      }
      
      #place-address
      {
          
        font-family: Roboto;
      }
      
      .bowl
      {
          width: 50px;
          height: 50px;
          border-radius: 25px;
          background-color: #e00b00;
          float: left;
      }
      
                #cart-amount
                {
                    font-size: 14px;
                    color: #fff;
                    elevation: above;
                    margin-top: 5px;
                    margin-left: -3px;
                    float: left;
                }
                
                .red-button
                {
                    background-color: #e00800;
                    color: #fff;
                    font-size: 13px;
                    text-align: center;
                    width: 250px;
                    margin-left: 25px;
                    margin-right: 25px;
                    height: 40px;
                    float: left;
                }
            
            .stakes-field
            {
                width: 100%;
                height: 500px;
                padding-top: 25px;
                padding-bottom: 25px;
                padding-left: 5%;
                padding-right: 5%;
                background-color: #eee;
                color: #fff;
            }
            
            .stake
            {
                width: 300px;
                height: 450px;
                margin: 0px 35px;
                color: #444;
                background-color: #fff;
                float: left;
            }
            
            .stake-header
            {
                width: 300px;
                height: 200px;
                background-size: cover;
            }
            
            .stake-body
            {
                width: 300px;
                height: 180px;
                padding: 30px 30px;
            }
            
            .stake-footer
            {
                width: 300px;
                height: 70px;
                padding-left: auto;
                padding-right: auto;
            }
            
            .stake-header > img
            {
                width: 300px;
            }
            
            .pac-container
            {
                background-color: #eee;
            }
            
            .pac-item
            {
                height: 45px;
                background-color: #fff;
            }
            
            .pac-item:hover
            {
                background-color: #ddd;
            }
            
            .pac-icon
            {
                display: none;
            }
            
            .pac-item-query
            {
                margin-left: 20px;
            }
            
            .header > span
            {
                float: left;
                color: white;
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
            
            .demand-input
            
            {
                width: 360px;
                height: 50px;
                padding-left: 25px;
                border: none;
                border-radius: 25px;
                background-color: #e00800;
                font-family: sans-serif;
                color: white;
            }
            
            .demand-input:focus
            
            {
                outline-color: transparent;
                outline-style: none;
            }
            
            .demand-input::-webkit-input-placeholder
            
            {
                color: #f78b88 !important;
            }

.demand-input:-ms-input-placeholder { /* Internet Explorer 10-11 */
   color: white;
}

.demand-input::-ms-input-placeholder { /* Microsoft Edge */
   color: white;
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
            
            .food-groceries
            {
                width: 16.66%;
                height: 100%;
                float: left;
            }
            
            .clothing
            {
                width: 16.66%;
                height: 100%;
                float: left;
            }
            
            .tools
            {
                width: 16.66%;
                height: 100%;
                float: left;
            }
            
            .electronics-gadgets
            {
                width: 16.66%;
                height: 100%;
                float: left;
            }
            
            .movies-dvd
            {
                width: 16.66%;
                height: 100%;
                float: left;
            }
            
            .books
            {
                width: 16.66%;
                height: 100%;
                float: left;
            }
            
            .carate
            {
                width: 50px;
                height: 50px;
                z-index: 300;
                //background:url(images/shop.png) no-repeat 20px 8px;
                //background-size:25px;
                margin-top: -44px;
                margin-left: 400px;
                position: absolute;
                float: left;
            }
            
            #carat
            {
                z-index: 301;
                margin-top: 11px;
                margin-left: -7px;
                position: absolute;
                float: left;
            }
            
            .shopping-to
            {
                width: 160px;
                height: 44px;
                margin-top: 0px;
                padding: 3px 30px;
                border-radius: 4px;
                background-color: #f40;
                color: white;
            }
            
            .shopping-in
            {
                width: 160px;
                height: 44px;
                margin-top: 0px;
                padding: 3px 30px;
                border-radius: 4px;
                background-color: #e00e00;
                color: white;
            }
            
            .shopping-in:hover
            {
                background-color: #c00c00;
            }
            
            .shopping-area
            {
                width: 80%;
                height: 44px;
                float: left;
            }
            
            .shopping-box
            {
                width: 20%;
                height: 38px;
                float: left;
                margin-top: 6px;
                padding-left: 2px;
            }
            
            .shopping-in-text
            {
                width: 100%;
                height: 9px;
                font-size: 10px;
                text-align: left;
                margin-bottom: 8px;
            }
            
            .shopping-in-value
            {
                width: 100%;
                height: 20px;
                font-size: 15px;
                text-align: left;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            
            /*the container must be positioned relative:*/
.custom-select {
  position: relative;
  font-family: Roboto;
  width: 180px;
    height: 50px;
        margin-top: 6px;
    border: none;
    color: white;
}

.custom-select select {
  display: none; /*hide original SELECT element:*/
}

.select-selected {
  width: 100%;
  height: 44px;
  //border-bottom: 5px solid #e00e00;
  border-radius: 3px;
  background:url(images/university.png) no-repeat 20px 8px;
  background-size:25px;
  background-color: #e00e00;
  display: block;
}

/*style the arrow inside the select element:*/
.select-selected:after {
  position: absolute;
  content: "";
  top: 14px;
  right: 10px;
  width: 0;
  height: 0;
  border: 6px solid transparent;
  border-color: #fff transparent transparent transparent;
}

/*point the arrow upwards when the select box is open (active):*/
.select-selected.select-arrow-active:after {
  border-color: transparent transparent #fff transparent;
  top: 7px;
}

/*style the items (options), including the selected item:*/
.select-items div,.select-selected {
  color: #fff;
  padding: 8px 16px;
  border: 1px solid transparent;
  border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
  cursor: pointer;
  user-select: none;
}

/*style items (options):*/
.select-items {
  position: absolute;
  background-color: #e00e00;
  top: 100%;
  left: 0;
  right: 0;
  z-index: 399;
}

/*hide the items when the select box is closed:*/
.select-hide {
  display: none;
}

.select-items div:hover, .same-as-selected {
  background-color: rgba(0, 0, 0, 0.1);
}

.circle {
  height:20px;
  width:20px;
  border-radius:50%;
  background-color:#c00c00;
  //display: none;
  position:relative;
  top:10px;
  left:0px;
  
  -webkit-transition:height .25s ease, width .25s ease;
  transition:height .25s ease, width .25s ease;
  
  -webkit-transform:translate(-50%,-50%);
  transform:translate(-50%,-50%);
}

.circle:hover{
  //height:150px;
  //width:150px;
}

.circle:before,
.circle:after {
  content:'';
  display:block;
  position:absolute;
  top:0; right:0; bottom:0; left:0;
  border-radius:50%;
  border:1px solid #e00e00;
}

.circle:before {
  -webkit-animation: ripple 2s linear infinite;
  animation: ripple 2s linear infinite;
}
.circle:after {
  -webkit-animation: ripple 2s linear 1s infinite;
  animation: ripple 2s linear 1s infinite;
}

.circle:hover:before,
.circle:hover:after {
  //-webkit-animation: none;
  //animation: none;
}

@-webkit-keyframes ripple{
  0% {-webkit-transform:scale(1); }
  75% {-webkit-transform:scale(1.75); opacity:1;}
  100% {-webkit-transform:scale(2); opacity:0;}
}

@keyframes ripple{
  0% {transform:scale(1); }
  75% {transform:scale(1.75); opacity:1;}
  100% {transform:scale(2); opacity:0;}
}
            
#banner:hover
{
    //padding-top: 180px;
}
            
#stock-input
{
    display: none;
    background-color: #fff;
    font-weight: 300;
    text-overflow: ellipsis;
    margin-top: 6px;
}

            .wants
            {
                width: 60px;
                height: 44px;
                margin-top: 0px;
                padding: 8px 2px;
                border-radius: 4px;
                background-color: #fff;
                color: #e00e00;
                text-align: center;
            }
            
            #carrier-count
            {
                width: 100%;
                height: 34px;
            }
            
            .carrier-typer
            {
                width: 100%;
                height: 10px;
                margin-top: -20px;
                font-size: 9px;
            }
            
            .wants:hover
            {
                background-color: #fafafa;
            }
            
            .phone
            {
                width: 500px;
                height: 400px;
                float: left;
            }
            
            .app
            {
                width: calc(100% - 500px);
                height: 400px;
                float: left;
            }
            
            .app-header
            {
                width: 500px;
                height: 100px;
                font-size: 40px;
                color: #fff;
                text-align: center;
            }
            
            .app-body
            {
                width: 500px;
                height: 100px;
                margin-top: 100px;
                font-size: 30px;
                color: #fff;
                text-align: center;
            }
            
            .app-footer
            {
                width: 500px;
                height: 100px;
                font-size: 40px;
                color: #c00c00;
                text-align: center;
            }
        
        #list-panel
        {
            display: none;
            margin-top: 2px;
            height: 250px;
            width: 405px;
            margin-left: 0px;
            background-color: #fff;
            position: absolute;
            overflow: scroll;
            z-index: 21;
        }
        
        .list-matches
        {
            width: 100%;
            height: 190px;
            margin-top: 0px;
            overflow: scroll;
        }
        
        .list-buttons
        {
            width: 100%;
            height: 60px;
            margin-top: 0px;
        }
        
        .list-add-button-back
        {
            width: 50%;
            height: 60px;
            float: left;
        }
        
        .list-done-button-back
        {
            width: 50%;
            height: 60px;
            float: left;
        }
        
        .list-add-button
        {
            width: 90%;
            height: 40px;
            margin-left: auto;
            margin-right: auto;
            background-color: #e00e00;
            color: #fff;
            text-align: center;
            padding-top: 10px;
            border-radius: 3px;
            font-size: 14px;
        }
        
        .list-done-button
        {
            width: 90%;
            height: 40px;
            margin-left: auto;
            margin-right: auto;
            background-color: #e00e00;
            color: #fff;
            text-align: center;
            padding-top: 10px;
            border-radius: 3px;
            font-size: 14px;
        }
        
        .list-add-button:hover
        {
            background-color: #c00c00;
        }
        
        .list-done-button:hover
        {
            background-color: #c00c00;
        }
        
        .list-match
        {
            width: 100%;
            height: 35px;
            padding: 8px 3%;
            text-align: left;
            font-size: 12px;
        }
        
        .list-match:hover
        {
            background-color: #fafafa;
        }
        
        #region-panel
        {
            display: none;
            margin-top: 1px;
            height: 250px;
            width: 100%;
            margin-left: 0px;
            background-color: #fff;
            position: absolute;
            overflow: scroll;
            z-index: 21;
            color: #888;
            //box-shadow: 0 3px 15px #eee;
        }
        
        .country-panel
        {
            width: 30%;
            height: 100%;
            float: left;
            //background-color: #fafafa;
            overflow: scroll;
            //border-right: 0.5px solid #888;
            //padding: 20px;
        }
        
        .area-panel
        {
            width: 70%;
            height: 100%;
            float: left;
            overflow: scroll;
            //padding: 20px;
        }
        
        .shopping-country
        {
            background-color: #fafafa;
            text-align: left;
            font-size: 16px;
            height: 50px;
            padding-top: 17px;
            padding-left: 20px;
            padding-right: 20px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        
        .shopping-country:hover
        {
            background-color: #f2f2f2;
        }
        
        .shopping-zone
        {
            background-color: #eee;
            text-align: left;
            font-size: 15px;
            height: 46px;
            padding-top: 12px;
            padding-left: 30px;
            padding-right: 20px;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        
        .shopping-zone:hover
        {
            background-color: #fff;
        }
        
        .preshopfooter
        {
            width: 100%;
            height: 145px;
            padding-top: 0px;
            padding-left: 50px;
            //background-color: #eee;
            margin-top: -30px;
        }
        
        .appfooter
        {
            width: 100%;
            height: 500px;
            padding: 50px;
            background-color: #eee;
        }
        
        .extrafooter
        {
            width: 100%;
            height: 400px;
            padding: 50px;
            background-color: #fafafa;
        }
        
        .extrant
        {
            width: 100%;
            height: 700px;
            padding: 50px;
            background-color: #fafafa;
        }
        
        .midder
        {
            width: 100%;
            height: 0px;
            background-color: white;
        }
        
        .experience
        {
            width: 100%;
            height: 800px;
            //padding: 50px;
            //background-color: white;
        }
        
        
        .shopfooter
        {
            width: 100%;
            height: 1500px;
            //padding: 50px;
            //background-color: white;
        }
        
        .preheader
        {
            width: 100%;
            height: 2px;
            background-color: #e00e00;
        }
        
        .obanner
        {
            height: 650px;
            margin-top: 0px;
            background-color: #c00c00;
            background-image: url("images/shutterstock.jpg");
            //background-position: top left, center center;
            background-position-y: 0px;
            background-repeat: no-repeat;
            background-size: cover;
            
            //border-radius: 100%;
            //border-bottom-left-radius:750px;
            //border-bottom-right-radius:750px;
        }
        
        .cfgs
        {
            width: 100%;
            height: 80px;
            //border-bottom: 0px solid #eee;
            background-color: #eee;
            transform: rotate(0deg);
            opacity: 0.9;
            border-bottom-left-radius: 50%;
            border-bottom-right-radius: 50%;
            margin-left: 0px;
            //margin-top: 0px;
        }
        
        .plx
        {
            width: 50px;
            height: 500px;
            background-color: #e00e00;
            transform: rotate(45deg);
            border-bottom-left-radius: 50%;
            border-bottom-right-radius: 50%;
            //margin-top: -300px;
            margin-left: 0px;
        }
        
        .mule-heading
        {
            width: 100%;
            height: 50px;
            text-align: center;
            font-size: 30px;
            color: black;
        }
        
        .mule
        {
            width: 100%;
            height: 350px;
        }
        
        .fry
        {
            width: 100%;
            height: 350px;
            background-color: white;
        }
        
        .shopcheck-heading
        {
            width: 100%;
            height: 80px;
            text-align: center;
            font-size: 30px;
            color: black;
        }
        
        .shopcheck
        {
            width: 100%;
            height: 400px;
        }
        
        .shopcheck-left
        {
            width: 20px;
            height: 400px;
            background-color: #c00c00;
            float: left;
        }
        
        .shopcheck-mid
        {
            width: 600px;
            height: 400px;
            float: left;
        }
        
        .shopcheck-right
        {
            width: calc(100% - 620px);
            height: 400px;
            background-color: #e00e00;
            color: white;
            padding: 40px;
            float: left;
        }
        
        .automa-heading
        {
            width: 100%;
            height: 80px;
            font-size: 30px;
            text-align: center;
        }
        
        .automa-body
        {
            width: 100%;
            height: 260px;
            font-size: 14px;
        }
        
        .unpack
        {
            width: 100%;
            height: 4000px;
            background-color: #fff;
        }
        
        .unpack-body
        {
            width: 100%;
            margin-top: 30px;
        }
        
        .unpack-half
        {
            width: 50%;
            float: left;
            padding: 50px;
        }
        
        .unpack-half > div
        {
            width: 400px;
            margin-left: calc(50% - 200px);
            margin-right: calc(50% - 200px);
        }
        
        .shop-now-button
        {
            height: 200px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .order-apps
        {
            width: 100%;
            height: 700px;
            margin-top: 50px;
            //background-color: #fafafa;
        }
        
        .order-apps-heading
        {
            width: 100%;
            height: 100px;
            padding-top: 40px;
            text-align: center;
            font-size: 30px;
            color: black;
        }
        
        .order-apps-body
        {
            width: 100%;
            height: 400px;
            background-color: #e00e00;
            color: white;
        }
        
        .order-apps-footer
        {
            width: 100%;
            height: 100px;
            //background-color: #fafafa;
        }
        
        .apps-heading
        {
            width: 40%;
            height: 100px;
            padding-top: 70px;
            margin-left: 50px;
            font-size: 30px;
        }
        
        .apps-body
        {
            width: 40%;
            height: 200px;
            margin-top: 20px;
            margin-left: 50px;
            font-size: 17px;
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
            background-color: #e00e00;
        }
        
        .flex-button:hover
        {
            background-color: #c00c00;
        }
        
        .splash
        {
            width: 100%;
            height: 24px;
            font-size: 11px;
            text-align: left;
            color: #888;
            //margin-bottom: 5px;
        }
        
        .splash-input
        {
            width: 100%;
            height: 46px;
        }
        
        .splash > span
        {
            display: none;
            //margin-bottom: 5px;
        }
        
        .splash-input > span
        {
            display: none;
        }
        
        .zone-pointer
        {
            float: left;
            width: 5%;
            height: 100%;
        }
        
        .zone-code
        {
            float: left;
            width: 65%;
            height: 100%;
        }
        
        .zone-weight
        {
            float: left;
            width: 30%;
            height: 100%;
            text-align: right;
            padding-right: 20px;
        }
        
        .steps
        {
            width: 100%;
            height: 90px;
            text-align: left;
            padding-top: 2px;
            padding-left: 40px;
        }
        
        .steps-heading
        {
            font-size: 70px;
            color: #aaa;
        }
        
        .hospitality
        {
            width: 100%;
            height: 120px;
            background-color: #c00c00;
        }
        
        .hospitality-type
        {
            width: 12.5%;
            height: 120px;
            padding: 5px;
            background-color: #c00c00;
            text-align: center;
            color: white;
            font-size: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-left: 2px solid #a00a00;
            float: left;
        }
        
        .servicing
        {
            width: 12.5%;
            height: 130px;
            padding: 5px;
            background-color: #e00e00;
            text-align: center;
            color: white;
            font-size: 20px;
            border-left: 2px solid #a00a00;
            margin-top: -10px;
            float: left;
        }
        
        .servicing-text
        {
            width: 100%;
            height: 120px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
            
            .servicing-triangle
            {
                width: 0; 
                height: 0; 
                border-left: 15px solid transparent;
                border-right: 15px solid transparent;
                border-top: 15px solid #e00e00;
                margin-top: 5px;
                margin-left: calc(50% - 15px);
            }
        
        .service
        {
            width: 100%;
            height: 500px;
            padding-top: 50px;
            font-family: arial;
            background-color: #fff;
        }
        
        .service-step
        
        {
            width: 33.3%;
            height: 450px;
            padding: 10px;
            background-color: #fff;
            text-align: center;
            font-size: 14px;
            float: left;
        }
        
        .service-step-number
        
        {
            width: 100%;
            height: 90px;
            padding: 10px;
            color: #000;
            text-align: center;
            font-size: 70px;
        }
        
        .service-step-heading
        
        {
            width: 100%;
            height: 60px;
            padding: 20px;
            color: #000;
            text-align: center;
            font-size: 20px;
        }
        
        .choosing-carrier
        {
            width: 100%;
            height: 1700px;
        }
        
        .choosing-carrier-img
        {
            width: 100%;
            height: 400px;
        }
        
        .choosing-products
        {
            width: 100%;
            height: 1700px;
        }
        
        .choosing-products-red
        {
            width: 100%;
            height: 400px;
        }
        
        .choosing-products-red-left
        {
            width: 50%;
            height: 400px;
            background-image: url('images/arco.png');
            background-size: cover;
            float: left;
            z-index: 4 !important;
        }
        
        .choosing-products-red-right
        {
            width: 50%;
            height: 400px;
            background-color: #c00c00;
            float: left;
            z-index: 4 !important;
        }
        
        .choosing-one-red
        {
            width: 80px;
            height: 80px;
            margin-top: -200px;
            margin-left: calc(50% - 40px);
            border-radius: 100%;
            background-color: #c00c00;
            color: white;
            elevation: above;
            position: absolute;
            z-index: 5 !important;
        }
        
        
             
            
            
        </style>
	</head>
        
	<body class="landing">
    
            <div class="preheader"></div>
    
    
    <%
        
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
            }
        }
        
        
        
        %>
            
            
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header" class="alt">
                                    <a href="index.jsp" style="text-decoration:none;color:inherit;"><div style="text-decoration:none;color:inherit;">
                                    <img src="images/chilloutlets.png" style="margin-left:15px;height:30px;margin-top:8px;float:left;" />
            <!-- <img src='images/transparent-white.png' style="margin-left:2px;height:15px;" /> -->
            <!-- <span style="margin-top:2px;margin-left:6px;color:white;font-size:20px;float:left;"><b>| Canada</b></span> -->
                                        </div>
                                    </a>
					<nav id="nav">
						<ul>
                                                        <li><a  href="javascript:setActive()" id="account-signifier" class="icon fa-angle-down">Shop</a></li>
                                                        <li><a  href="javascript:setActive()" id="account-signifier" class="icon fa-angle-down">Eat</a></li>
                                                        <li><a  href="javascript:setActive()" id="account-signifier" class="icon fa-angle-down">Hotel</a></li>
                                                        <li><a  href="javascript:setActive()" id="account-signifier" class="icon fa-angle-down">Work</a></li>
                                                        <li><a  href="javascript:setActive()" id="account-signifier" class="icon fa-angle-down">School</a></li>
							<li><a href="onboarding/carrier.jsp" class="button">BECOME A CARRIER, EARN WITH US</a></li>
							<li><a href="onboarding/outlet.jsp" class="button">CONNECT YOUR OUTLET</a></li>
							<!-- <li><a href="#" class="button">BROADCAST OUR PLATFORM, GET $300</a></li> -->
							<li>
        
        
        
        <%
            
        session.setAttribute("service-area", "Winnipeg");
        session.setAttribute("carrier", "road");
        session.setAttribute("time", "29 - 59 mins");
        
        
        session.setAttribute("current-page", "index.jsp");
        
        
            
            if (sessionCustomer == null)
                
            {
            
            
        session.setAttribute("account-state", "Login");
            

        
        %>
                                                            
                                                            
                                                            <a  href="javascript:setActive()" id="account-signifier" class="icon fa-angle-down">Custom Account</a>
                                                            
        
        
        
        <%
            
            
            }
            
            else
                
            {
            
            
            
        session.setAttribute("account-state", sessionCustomer.getCustomerFullName());

        
        %>
                                                         
        
        
                                                            <a  href="javascript:setActive()" id="account-signifier" class="icon fa-angle-down"><%= sessionCustomer.getCustomerFullName().toUpperCase() %></a>
        
        
        
        <%
            
            
            
            }
            
            

        
        %>
                                                            
                                                        </li>
                                                        
						</ul>
					</nav>
				</header>

        
                                        
                                        <div class="sample-modal" hidden>
                                            
                                        <div id="nimation" class='galleon' style="z-index:15;width:80px;height:80px;background-image:url('images/shipwreck.png');background-size:contain;margin-top:-140px;margin-left:calc(50% - 40px);background-repeat:no-repeat;"></div>
                                            <!--
                                        <div id="nimation" style="width:140px;height:140px;background-image:url('/outlets/eggo-strawberry.png');background-size:contain;margin-top:200px;margin-left:200px;background-repeat:no-repeat;"></div>
                                        <div id="nimation" style="z-index:13;width:140px;height:140px;background-image:url('/outlets/life-pumpkin-spice.png');background-size:contain;margin-top:-240px;margin-left:30px;background-repeat:no-repeat;"></div>
                                        <div id="nimation" style="z-index:14;width:140px;height:140px;background-image:url('/outlets/lays-classic.png');background-size:contain;margin-top:0px;margin-left:350px;background-repeat:no-repeat;"></div>
                                        <div id="nimation" style="z-index:15;width:140px;height:140px;background-image:url('/outlets/simply-orange.png');background-size:contain;margin-top:-120px;margin-left:520px;background-repeat:no-repeat;"></div>
                                        <div id="nimation" style="z-index:16;width:140px;height:140px;background-image:url('/outlets/coke.png');background-size:contain;margin-top:-180px;margin-left:700px;background-repeat:no-repeat;"></div>
                                        <div id="nimation" style="z-index:17;width:140px;height:140px;background-image:url('/outlets/mars.png');background-size:contain;margin-top:-180px;margin-left:900px;background-repeat:no-repeat;"></div>
                                        <div id="nimation" style="z-index:17;width:140px;height:140px;background-image:url('/outlets/20181222235610-regular-fries-straight-cut.png');background-size:contain;margin-top:-250px;margin-left:1100px;background-repeat:no-repeat;"></div>
                                        
                                        <div id="nimation" style="width:140px;height:140px;background-image:url('/outlets/nutri-oeuf-eggs.png');background-size:contain;margin-top:200px;margin-left:200px;background-repeat:no-repeat;"></div>
                                        <div id="nimation" style="z-index:13;width:140px;height:140px;background-image:url('/outlets/peppers.png');background-size:contain;margin-top:-240px;margin-left:30px;background-repeat:no-repeat;"></div>
                                        <div id="nimation" style="z-index:14;width:140px;height:140px;background-image:url('/outlets/bananas.png');background-size:contain;margin-top:0px;margin-left:350px;background-repeat:no-repeat;"></div>
                                        <div id="nimation" style="z-index:15;width:140px;height:140px;background-image:url('/outlets/unico-diced-tomatoes.jpg');background-size:contain;margin-top:-120px;margin-left:520px;background-repeat:no-repeat;"></div>
                                        <div id="nimation" style="z-index:16;width:140px;height:140px;background-image:url('/outlets/bell-peppers.png');background-size:contain;margin-top:-180px;margin-left:700px;background-repeat:no-repeat;"></div>
                                        <div id="nimation" style="z-index:17;width:140px;height:140px;background-image:url('/outlets/onions.png');background-size:contain;margin-top:-180px;margin-left:900px;background-repeat:no-repeat;"></div>
                                        <div id="nimation" style="z-index:17;width:140px;height:140px;background-image:url('/outlets/heinz-ketchup.png');background-size:contain;margin-top:-250px;margin-left:1100px;background-repeat:no-repeat;"></div>
                                        -->
                                        
                                        </div>
        
        
        
        
				<section class="obanner" id="banner">
					
                                    <h2 style="z-index:12;">A Better Way to Shop Around.</h2> 
					<p style="z-index:12;">Find shops in any service area. Match and transport over 2.5 million logged goods. Delivers in 29 - 59 minutes.</p>
                                        
                                        
                                        <br><br><br><br><br><br><br>
                                        <p>There is more than one way to do your delivery shopping now.</p>
                                        
                                        
                                        <div class='spin-overlay'>
                                            
                                            <div class="spin"></div>
                                            
                                        </div>
                                            
                                        
                                        <div class='spinner-overlay'>
                                            
                                            <div class="spinner"></div>
                                            
                                        </div>
                                        
                                        
                                        
                                        <div class="login-modal" id="login-modal">
                                            
                                            <div id='logindrop' class="logindrop">
                                            
                                                
                                                <div class="triangle"></div>
                                                
                                            
                                            <%
            
            
            
            
            if (sessionCustomer == null)
                
            {
            
            
            
            
            %>
                                                
                                                <div class='drop-nav'>
                                                    
                                                    <a href="javascript:login()">
                                                    <div id="drop-nav-login" class='drop-nav-login'>
                                                    
                                                        <span>LOG IN</span>
                                                    
                                                    </div>
                                                    </a>
                                                    <a href="javascript:register()">
                                                    <div id="drop-nav-register" class='drop-nav-register'>
                                                    
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
                                                                    
                                                                    <div id="customer-email-field" class="splash-input" style="">
                                                                        <input height="30px" id="customer-email" name="customer-email" type="email" placeholder="Email address" />
                                                                    </div>
                                                                    
                                                                <div id="customer-email-splash" class="splash"><span id="splash-login-email">Email</span></div>
                                                                
                                                                <div id="customer-password-field" class="splash-input" style="">
                                                                    <input height="30px" id="customer-password" name="customer-password" type="password" placeholder="Password" />
                                                                </div>
                                                                
                                                                <div id="customer-password-splash" class="splash"><span id="splash-login-password">Password</span></div>
                                                                
                                                                
                                                                </div>
                                                                <div class="redclickarea">
                                                                    <div hidden><button class="redclicker">LOG IN</button></div>
                                                                    <a href='javascript:submitCustomerLogin()'>
                                                                        <div class='flex-button'>LOG IN</div>
                                                                    </a>
                                                                </div>
                                                    
                                                        </form>
                                                        
                                                    </div>
                                                    <div class='drop-body-register'>
                                                        
                                                        <form method='post' action="LogRegister">
                                                    
                                                        <div class="credentials-long">
                                                                    
                                                                <div class="splash-input" style="">
                                                                    <input height="30px" name="customer-full-name" type="text" value='' placeholder="Name *" />
                                                                </div>
                                                                <div class="splash"><span id="splash-middle-name">Name</span></div>
                                                                
                                                                <div class="splash-input" style="">
                                                                    <input height="30px" name="customer-phone-number" type="text" value='' placeholder="Mobile Phone Number *" />
                                                                </div>
                                                                <div class="splash"><span id="splash-middle-name">Phone Number</span></div>
                                                                
                                                                <div class="splash-input" style="">
                                                                    <input height="30px" name="customer-email-address" type="email" value='' placeholder="Email Address *" />
                                                                </div>
                                                                <div class="splash"><span id="splash-middle-name">Email Address</span></div>
                                                                
                                                                <div class="splash-input" style="">
                                                                    <input height="30px" name="customer-password" type="password" value='' placeholder="Password *" />
                                                                </div>
                                                                    <div class="splash"><span id="splash-middle-name">Password</span></div>
                                                                    
                                                                    <div class="splash-input" style="">
                                                                        <input height="30px" name="confirm-password" type="password" value='' placeholder="Try Password Again *" />
                                                                    </div>
                                                                    <div class="splash"><span id="splash-middle-name">Re-enter Password</span></div>
                                                                    
                                                                    
                                                                    </div>
                                                                
                                                                
                                                                <div class="redclickarea">
                                                                    <div hidden><button id="signup-button" class="redclicker">SIGN UP</button></div>
                                                                    <a href='javascript:submitSignUp()'>
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
                                                                    <div class="cardowner">Credits</div>
                                                                </div>
                                                            
                                                            </div>
                                                </div><hr>
                                                <div>My Prepaid Card<hr></div>
                                            </div>
                                            <div class="redclickarea">
                                                <div hidden><button id="logout-button" class="redclicker">LOG OUT</button></div>
                                                <a href='javascript:submitLogout()'>
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
                                        
                                
                                <div id="myModal" class="modal">

                                    <div id='modal-content' class="modal-content">

                                        <div class="modal-header">
                                            
                                            <form id="address-form" method="post" action="board.jsp">
                                            
                                            <ul class="actions">
                                            <li>
                                                
                                               <!-- <input type="email" name="email" id="email" style="color: #000;width: 400px" placeholder="Get started with a category" /> -->
                                               <div class="row uniform 100%">
                                               <div class="12u">
                                                       
                                                   <div class="select-wrapper">
                                                       
                                                       <select name="category" id="line" style="color:#000;width:400px;">
                                                           <option value=""></option>
                                                       </select>
                                                       
                                                       
                                                   </div>
                                               </div>
                                               </div>
                                                
                                            </li>
                                            <li>
                                                
                                                <div id="select-platform" class="custom-select">
                                                    <select id="platform-select" name="referrer">
                                                        <option selected id="platform-option" value="On Campus">Get Goods</option>
                                                    </select>
                                                  </div>
                                            </li>
                                           <li class="apt-entry" style='width:90px;color:#888;'>
                                               
                                               
                                               <input id="apt-input" name="apt-input" type="text" style="padding-left:10px;padding-right:5px;font-size:15px;font-family:sans-serif;background-color:white;" type="text" placeholder="Apt. #"/>
                                               
                                               
                                           </li> 
                                           <li class="address-entry">
                                               
                                               
                                               <input id="pac-input" name="pac-input" type="text" style="background:url(images/lpin.png) no-repeat 20px 10px;background-size:15px;padding-left:50px;padding-right:90px;font-size:15px;font-family:sans-serif;background-color:white;" type="text" placeholder="Enter a delivery address to start dispatching your order"/>
                                               
                                               <input id="stock-input" name="pac-input" type="text" style="background:url(images/lpin.png) no-repeat 20px 10px;background-size:15px;padding-left:50px;padding-right:90px;font-size:15px;font-family:sans-serif;background-color:white;" type="text" placeholder="What are you shopping for?"/>
                                               
                                               <div id="list-panel">
                                                   
                                                   <div class="list-matches">
                                                       <div class="list-match">Coffee</div>
                                                       <div class="list-match">Coffee mug</div>
                                                       <div class="list-match">Coffee filter</div>
                                                       <div class="list-match">Coffee cream</div>
                                                       <div class="list-match">Coffee cup</div>
                                                       <div class="list-match">Coffee stir</div>
                                                   </div>
                                                   
                                                   <div class="list-buttons">
                                                       <div class="list-add-button-back">
                                                           <a href="javascript:addToShoppingList()"><div class="list-add-button">ADD</div></a>
                                                       </div>
                                                       <div class="list-done-button-back">
                                                           <a href="javascript:wrapUpShoppingList()"><div class="list-done-button">DONE</div></a>
                                                       </div>
                                                   </div>
                                                   
                                               </div>
                                               
                                               <div class="carate">
                                                   
                                                   <i class="fa fa-taxi" style="font-size:20px;margin-top:10px;color:#c00c00;"></i>
                                                   <div id="carat" class="circle">
                                                        <!-- <span style="font-size:14px;margin-top:-30px;margin-left:-70px;color:#c00c00;">16</span> -->
                                                   </div>
                                                   
                                                </div>
                                               
                                               
                                           </li> 
                                           <li>
                                               <a href="javascript:viewShoppingList()">
                                                   
                                                   <div class='wants'>
                                                            
                                                       <div id="carrier-count">702,395</div>
                                                       <div class="carrier-typer">goods</div>
                                                       
                                                   </div>
                                                   
                                               </a>
                                           </li>
                                           
					</ul>
                                                
                                                <input hidden id="latitude" name="latitude" value="" />
                                                <input hidden id="longitude" name="longitude" value="" />
                                                
                                        </form>
                                            
                                        <span hidden class="close">&times;</span>
                                        
                                      </div>
                                        
                                        <div id="region-panel">
                                            
                                            <div class="country-panel">
                                                
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Afghanistan</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Åland Islands</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Albania</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Algeria</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">American Samoa</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Andorra</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Angola</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Anguilla</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Antarctica</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Antigua and Barbuda</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Argentina</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Armenia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Aruba</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Australia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Austria</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Azerbaijan</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Bahamas</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Bahrain</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Bangladesh</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Barbados</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Belarus</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Belgium</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Belize</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Benin</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Bermuda</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Bhutan</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Bolivia, Plurinational State of</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Bonaire, Sint Eustatius and Saba</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Bosnia and Herzegovina</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Botswana</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Bouvet Island</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Brazil</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">British Indian Ocean Territory</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Brunei Darussalam</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Bulgaria</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Burkina Faso</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Burundi</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Cambodia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Cameroon</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Canada</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Cape Verde</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Cayman Islands</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Central African Republic</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Chad</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Chile</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">China</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Christmas Island</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Cocos (Keeling) Islands</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Colombia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Comoros</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Congo</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Congo, the Democratic Republic of the</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Cook Islands</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Costa Rica</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Côte d'Ivoire</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Croatia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Cuba</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Curaçao</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Cyprus</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Czech Republic</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Denmark</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Djibouti</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Dominica</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Dominican Republic</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Ecuador</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Egypt</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">El Salvador</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Equatorial Guinea</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Eritrea</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Estonia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Ethiopia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Falkland Islands (Malvinas)</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Faroe Islands</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Fiji</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Finland</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">France</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">French Guiana</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">French Polynesia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">French Southern Territories</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Gabon</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Gambia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Georgia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Germany</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Ghana</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Gibraltar</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Greece</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Greenland</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Grenada</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Guadeloupe</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Guam</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Guatemala</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Guernsey</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Guinea</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Guinea-Bissau</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Guyana</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Haiti</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Heard Island and McDonald Islands</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Holy See (Vatican City State)</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Honduras</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Hong Kong</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Hungary</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Iceland</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">India</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Indonesia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Iran, Islamic Republic of</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Iraq</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Ireland</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Isle of Man</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Israel</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Italy</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Jamaica</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Japan</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Jersey</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Jordan</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Kazakhstan</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Kenya</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Kiribati</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Korea, Democratic People's Republic of</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Korea, Republic of</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Kuwait</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Kyrgyzstan</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Lao People's Democratic Republic</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Latvia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Lebanon</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Lesotho</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Liberia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Libya</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Liechtenstein</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Lithuania</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Luxembourg</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Macao</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Macedonia, the former Yugoslav Republic of</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Madagascar</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Malawi</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Malaysia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Maldives</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Mali</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Malta</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Marshall Islands</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Martinique</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Mauritania</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Mauritius</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Mayotte</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Mexico</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Micronesia, Federated States of</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Moldova, Republic of</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Monaco</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Mongolia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Montenegro</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Montserrat</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Morocco</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Mozambique</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Myanmar</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Namibia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Nauru</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Nepal</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Netherlands</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">New Caledonia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">New Zealand</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Nicaragua</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Niger</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Nigeria</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Niue</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Norfolk Island</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Northern Mariana Islands</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Norway</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Oman</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Pakistan</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Palau</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Palestinian Territory, Occupied</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Panama</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Papua New Guinea</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Paraguay</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Peru</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Philippines</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Pitcairn</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Poland</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Portugal</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Puerto Rico</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Qatar</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Réunion</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Romania</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Russian Federation</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Rwanda</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Saint Barthélemy</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Saint Helena, Ascension and Tristan da Cunha</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Saint Kitts and Nevis</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Saint Lucia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Saint Martin (French part)</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Saint Pierre and Miquelon</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Saint Vincent and the Grenadines</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Samoa</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">San Marino</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Sao Tome and Principe</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Saudi Arabia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Senegal</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Serbia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Seychelles</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Sierra Leone</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Singapore</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Sint Maarten (Dutch part)</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Slovakia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Slovenia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Solomon Islands</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Somalia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">South Africa</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">South Georgia and the South Sandwich Islands</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">South Sudan</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Spain</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Sri Lanka</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Sudan</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Suriname</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Svalbard and Jan Mayen</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Swaziland</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Sweden</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Switzerland</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Syrian Arab Republic</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Taiwan, Province of China</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Tajikistan</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Tanzania, United Republic of</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Thailand</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Timor-Leste</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Togo</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Tokelau</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Tonga</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Trinidad and Tobago</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Tunisia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Turkey</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Turkmenistan</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Turks and Caicos Islands</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Tuvalu</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Uganda</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Ukraine</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">United Arab Emirates</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">United Kingdom</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">United States</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">United States Minor Outlying Islands</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Uruguay</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Uzbekistan</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Vanuatu</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Venezuela, Bolivarian Republic of</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Viet Nam</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Virgin Islands, British</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Virgin Islands, U.S.</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Wallis and Futuna</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Western Sahara</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Yemen</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Zambia</div></a>
                                                <a href="javascript:listZones('Afghanistan')" style="text-decoration:none;color:inherit;"><div class="shopping-country">Zimbabwe</div></a>
                                                
                                            </div>
                                            
                                            <div class="area-panel">
                                                
                                                
                                                <a href="javascript:selectZone('Toronto')" style="text-decoration:none;color:inherit;"><div class="shopping-zone"><div class='zone-pointer'>&gt;</div><div class='zone-code'>Toronto (TNT)</div><div class='zone-weight'>5,037 shops</div></div></a>
                                                <a href="javascript:selectZone('Toronto')" style="text-decoration:none;color:inherit;"><div class="shopping-zone"><div class='zone-pointer'>&gt;</div><div class='zone-code'>Ottawa (OTW)</div><div class='zone-weight'>3,883 shops</div></div></a>
                                                <a href="javascript:selectZone('Toronto')" style="text-decoration:none;color:inherit;"><div class="shopping-zone"><div class='zone-pointer'>&gt;</div><div class='zone-code'>Edmonton (EDM)</div><div class='zone-weight'>3,129 shops</div></div></a>
                                                <a href="javascript:selectZone('Toronto')" style="text-decoration:none;color:inherit;"><div class="shopping-zone"><div class='zone-pointer'>&gt;</div><div class='zone-code'>Mississauga (MSG)</div><div class='zone-weight'>2,818 shops</div></div></a>
                                                <a href="javascript:selectZone('Toronto')" style="text-decoration:none;color:inherit;"><div class="shopping-zone"><div class='zone-pointer'>&gt;</div><div class='zone-code'>Vancouver (VNC)</div><div class='zone-weight'>2,901 shops</div></div></a>
                                                <a href="javascript:selectZone('Toronto')" style="text-decoration:none;color:inherit;"><div class="shopping-zone"><div class='zone-pointer'>&gt;</div><div class='zone-code'>Brampton (BPT)</div><div class='zone-weight'>1,771 shops</div></div></a>
                                                <a href="javascript:selectZone('Toronto')" style="text-decoration:none;color:inherit;"><div class="shopping-zone"><div class='zone-pointer'>&gt;</div><div class='zone-code'>Winnipeg (WPG)</div><div class='zone-weight'>697 shops</div></div></a>
                                                <a href="javascript:selectZone('Toronto')" style="text-decoration:none;color:inherit;"><div class="shopping-zone"><div class='zone-pointer'>&gt;</div><div class='zone-code'>Hamilton (HMT)</div><div class='zone-weight'>866 shops</div></div></a>
                                                <a href="javascript:selectZone('Toronto')" style="text-decoration:none;color:inherit;"><div class="shopping-zone"><div class='zone-pointer'>&gt;</div><div class='zone-code'>Surrey (SRY)</div><div class='zone-weight'>777 shops</div></div></a>
                                                <a href="javascript:selectZone('Toronto')" style="text-decoration:none;color:inherit;"><div class="shopping-zone"><div class='zone-pointer'>&gt;</div><div class='zone-code'>Halifax (HFX)</div><div class='zone-weight'>660 shops</div></div></a>
                                                <a href="javascript:selectZone('Toronto')" style="text-decoration:none;color:inherit;"><div class="shopping-zone"><div class='zone-pointer'>&gt;</div><div class='zone-code'>London (LDN)</div><div class='zone-weight'>594 shops</div></div></a>
                                                <a href="javascript:selectZone('Toronto')" style="text-decoration:none;color:inherit;"><div class="shopping-zone"><div class='zone-pointer'>&gt;</div><div class='zone-code'>Markham (MKM)</div><div class='zone-weight'>813 shops</div></div></a>
                                                
                                                
                                            </div>
                                            
                                        </div>
                                        
                                        <div id="modal-body" class="modal-body">
                                            
                                            <div class="pac-card" id="pac-card">
                                                <div>



                                                  <div id="type-selector" class="pac-controls">
                                                    <input type="radio" name="type" id="changetype-all" checked="checked">
                                                    <label for="changetype-all">All</label>

                                                    <input type="radio" name="type" id="changetype-establishment">
                                                    <label for="changetype-establishment">Establishments</label>

                                                    <input type="radio" name="type" id="changetype-address">
                                                    <label for="changetype-address">Addresses</label>

                                                    <input type="radio" name="type" id="changetype-geocode">
                                                    <label for="changetype-geocode">Geocodes</label>
                                                  </div>



                                                  <div id="strict-bounds-selector" class="pac-controls">
                                                    <input type="checkbox" id="use-strict-bounds" value="">
                                                    <label for="use-strict-bounds">Strict Bounds</label>
                                                  </div>


                                                </div>


                                                <div id="pac-container">
                                                  
                                                </div>

                                                
                                              </div>



                                              <div id="map"></div>


                                              <div id="infowindow-content">
                                                <img src="" width="16" height="16" id="place-icon">
                                                <span id="place-name"  class="title" style="font-family:Roboto;font-size:14px;color:#000;"></span><br>
                                                <span id="place-address" style="font-family:Roboto;font-size:14px;color:#000;"></span>
                                              </div>
                                        
                                        
                                              
                                            
                                      </div>
                                        <a href="javascript:findOutlets()">
                                            <div id="modal-footer" class="modal-footer">
                                                <h4 style="text-align:center;color:#fff;">FIND OUTLETS<span id="country"></span></h4>
                                            </div>
                                        </a>

                                    </div>

                                </div>
                                        
				</section>
                        

			<!-- Eliminates $15 off orders over $100. -->
				<section id="main" class="container">

                                    <section style="background-color:#667;display:none;" class="box special">
						<header class="major">
                                                    <h2>
                                                        <div class="circle-ripple"></div>
                                                        <div style='width:100%;height:900px;background-color:#fff;'>
                                                            
                                                            <div class="food-groceries"></div>
                                                            <div class="clothing"></div>
                                                            <div class="tools"></div>
                                                            <div class="electronics-gadgets"></div>
                                                            <div class="movies-dvd"></div>
                                                            <div class="books"></div>
                                                            
                                                        </div>
                                                        </h2>
                                                    
                                                    <!--
                                                    <hr>
                                                        <h2>
                                                            Experience the store experience online.
                                                        </h2>
						</header>
						<span class="image featured"><img src="/outlets/drive.jpg" alt="" /></span> -->
					</section>
                                    

                                    <div hidden>
                                    <!-- display selected location information -->
                                    <h4>Location Details</h4>
                                    <p>Address: <input type="text" class="search_addr" size="45"></p>
                                        <p>Latitude: <input type="text" class="search_latitude" size="30"></p>
                                            <p>Longitude: <input type="text" class="search_longitude" size="30"></p>
                                    </div>

                                    
                                    
				</section>
                        
                        
                        <div class="cfgs"></div>
                        
                        <div class="midder" hidden>
                            <div class=""></div>
                        </div>
                        
                        
                        <div class="preshopfooter">
                            <div class="">
                                
                            </div>
                            <div class="">
                                
                            </div>
                        </div>
                        
                        
                        <div class="experience" hidden>
                            <div class="mule-heading">An unrivaled shopping service you will love</div>
                            <div class="mule">
                                <div class=""><img style="width:100%;margin-left:0px;margin-top:40px;" src="/outlets/0.jpeg" alt="mule" /></div>
                                <div class="">Chilloutlets brings the goods you want directly to your door, fast. Carriers from different 
                                countries in the world connect to bring you the things that make you smile everyday.</div>
                            </div>
                            
                            <div class="plx"></div>
                        </div>
                        
                        
                        
                        <div class="experience" hidden>
                            <div class="mule-heading">Find your store</div>
                            <div class="mule">
                                <div class=""></div>
                            </div>
                        </div>
                        
                        
                        
                        <div class="experience" hidden>
                            <div class="mule-heading">Tour your personalized mall</div>
                            <div class="mule">
                                <div class=""></div>
                            </div>
                        </div>
                        
                        
                        
                        <div class="experience" hidden>
                            <div class="mule-heading">Fastest multi-store routing</div>
                            <div class="mule">
                                <div class=""></div>
                            </div>
                        </div>
                        
                        
                        
                        <div class="experience" hidden>
                            <div class="mule-heading">Get subsidies &amp; voucher codes</div>
                            <div class="mule">
                                <div class=""></div>
                            </div>
                        </div>
                        
                        
                        
                        <div class="experience" hidden>
                            <div class="mule-heading">Hand off to your shopping carrier</div>
                            <div class="mule">
                                <div class=""></div>
                            </div>
                        </div>
                        
                        
                        
                        <div class="steps">
                            <div class="steps-heading">Shopping Bags</div>
                        </div>
                        
                        
                        
                        <div class="hospitality">
                            <a href="javascript:changeService()" style='text-decoration:none;color:inherit;'>
                            <div class="servicing">
                                <div class="servicing-text">Groceries</div>
                                <div class="servicing-triangle"></div>
                            </div>
                            </a>
                            <a href="javascript:changeService()" style='text-decoration:none;color:inherit;'>
                            <div class="hospitality-type">
                                <div class="">Fashion</div>
                            </div>
                            </a>
                            <a href="javascript:changeService()" style='text-decoration:none;color:inherit;'>
                            <div class="hospitality-type">
                                <div class="">Pharmacy</div>
                            </div>
                            </a>
                            <a href="javascript:changeService()" style='text-decoration:none;color:inherit;'>
                            <div class="hospitality-type">
                                <div class="">Gadgets</div>
                            </div>
                            </a>
                            <a href="javascript:changeService()" style='text-decoration:none;color:inherit;'>
                            <div class="hospitality-type">
                                <div class="">Stationery</div>
                            </div>
                            </a>
                            <a href="javascript:changeService()" style='text-decoration:none;color:inherit;'>
                            <div class="hospitality-type">
                                <div class="">Kitchenware</div>
                            </div>
                            </a>
                            <a href="javascript:changeService()" style='text-decoration:none;color:inherit;'>
                            <div class="hospitality-type">
                                <div class="">Music</div>
                            </div>
                            </a>
                            <a href="javascript:changeService()" style='text-decoration:none;color:inherit;'>
                            <div class="hospitality-type">
                                <div class="">15+</div>
                            </div>
                            </a>
                        </div>
                        
                        
                        
                        
                        <div class="service">
                            <div class="service-step">
                                <div class="service-step-number">1</div>
                                <div class="service-step-icon"><img style="height:70px;" src="images/groceries-bag.png" alt="icon" /></div>
                                <div class="service-step-heading">Choose the right products</div>
                                <div class="service-step-description">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor 
                                        incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud 
                                        exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure 
                                        dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                                        Excepteur sint occaecat cupidatat.
                                </div>
                            </div>
                            <div class="service-step">
                                <div class="service-step-number">2</div>
                                <div class="service-step-icon"><img style="height:70px;" src="images/taxis.png" alt="icon" /></div>
                                <div class="service-step-heading">Choose the right carrier</div>
                                <div class="service-step-description">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor 
                                        incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud 
                                        exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure 
                                        dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                                        Excepteur sint occaecat cupidatat.
                                </div>
                            </div>
                            <div class="service-step">
                                <div class="service-step-number">3</div>
                                <div class="service-step-icon"><img style="height:70px;" src="images/housefence.png" alt="icon" /></div>
                                <div class="service-step-heading">Collect carrier bags at your door</div>
                                <div class="service-step-description">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor 
                                        incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud 
                                        exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure 
                                        dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                                        Excepteur sint occaecat cupidatat.
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        <div class="steps">
                            <div class="steps-heading">Addresses</div>
                        </div>
                        
                        
                        <div class="choosing-products">
                            <div class="choosing-products-red">
                                <div class="choosing-products-red-left"></div>
                                <div class="choosing-products-red-right"></div>
                            </div>
                                <div class="choosing-one-red">^</div>
                            <div class="">
                                
                            </div>
                        </div>
                        
                        
                        
                        <div class="steps">
                            <div class="steps-heading">2. Choosing The Right Carrier</div>
                        </div>
                        
                        
                        <div class="choosing-carrier">
                            <div class="choosing-carrier-img"><img style="width:100%;margin-left:0px;" src="/outlets/carrier-steering.jpg" alt="carrier" /></div>
                        </div>
                        
                        
                        
                        <div class="steps">
                            <div class="steps-heading">3. Collecting Carrier Bags</div>
                        </div>
                        
                        
                        <div class="service">
                            
                        </div>
                        
                        
                        
                        
                        <div class="experience" hidden>
                            <div class="shopcheck-heading">Monitor carrier check-offs on the go</div>
                            <div class="shopcheck">
                                <div class="shopcheck-left"></div>
                                <div class="shopcheck-mid"><img style="width:100%;margin-left:0px;" src="/outlets/carrier-pickup.jpg" alt="carrier" /></div>
                                <div class="shopcheck-right">
                                    <div class='automa-heading'>Shopping automation</div>
                                    <div class='automa-body'>
                                        <p>Our Carrier app has been seamlessly integrated into shops' stock in a way that retail 
                                            carriers check items off the shelf and off the list.
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor 
                                        incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud 
                                        exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure 
                                        dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
                                        Excepteur sint occaecat cupidatat 
                                        non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        <div class="experience" hidden>
                            <div class="mule-heading">Track your order as it drives</div>
                            <div class="mule">
                                <div class=""><img style="height:100%;margin-left:30px;" src="/outlets/mobileshop.png" alt="carrier" /></div>
                            </div>
                        </div>
                        
                        
                        <div class="experience" hidden>
                            <div class="mule-heading">Receive your purchase at the door</div>
                            <div class="mule">
                                <div class=""><img style="width:70%;margin-left:30px;margin-top:10px;" src="/outlets/duez.jpg" alt="mule" /></div>
                                <div class=""></div>
                            </div>
                            
                        </div>
                        
                        
                        
                        
                        
                        <div class="order-apps" hidden>
                            <div class="order-apps-heading">Order from our mobile app</div>
                            <div class="order-apps-body">
                                <div class="apps-heading">Have the delivery experience</div>
                                <div class="apps-body">Download the Chilloutlets Shop Around app on Google Play to get deliveries on goods - It's a touch of class!</div>
                                <div class="apps-body">
                                    <button class="red-button">Google Play</button>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        <div class="unpack" hidden>
                            <div class="mule-heading" style="padding-top:50px;">Sample products we carry</div>
                            <div class="unpack-body">
                            <div class="unpack-half">
                                <div class=""><img style="width: 400px;" src="/outlets/kitchen-pepper.jpg" alt="goods" /></div>
                                <div class=""><img style="width: 400px;margin-top:350px;" src="/outlets/bought-clothes.jpg" alt="goods" /></div>
                                <div class=""><img style="width: 400px;margin-top:350px;" src="/outlets/stationery.jpg" alt="goods" /></div>
                                <div class=""><img style="width: 400px;margin-top:350px;" src="/outlets/makeup.jpg" alt="goods" /></div>
                                <div class=""><img style="width: 400px;margin-top:350px;" src="/outlets/medicine.jpg" alt="goods" /></div>
                                <div class=""><img style="width: 400px;margin-top:350px;" src="/outlets/tools.jpg" alt="goods" /></div>
                            </div>
                            <div class="unpack-half">
                                <div class=""><img style="width: 400px;margin-top:350px;" src="/outlets/drumset.jpg" alt="goods" /></div>
                                <div class=""><img style="width: 400px;margin-top:350px;" src="/outlets/sneakers.jpg" alt="goods" /></div>
                                <div class=""><img style="width: 400px;margin-top:350px;" src="/outlets/toys1.jpg" alt="goods" /></div>
                                <div class=""><img style="width: 400px;margin-top:350px;" src="/outlets/camera-equipment.jpg" alt="goods" /></div>
                                <div class=""><img style="width: 400px;margin-top:350px;" src="/outlets/quadcopters.jpg" alt="goods" /></div>
                                <div class=""><img style="width: 400px;margin-top:350px;" src="/outlets/gaming.jpg" alt="goods" /></div>
                            </div>
                            </div>
                        </div>
                        
                        
                        <div class="extrafooter">
                            <div class="mule-heading">Experience shopping like never before</div>
                            <div class="shop-now-button">
                                <button class="red-button">SHOP NOW</button>
                            </div>
                            <div class=""></div>
                        </div>
                        
                        
                        <div class="prefooter">
                            <div class="phone">
                                <img style="height:500px;margin-left:100px;margin-top:-30px;" src="/outlets/nexus.png" alt='phone' />
                            </div>
                            <div class="app">
                                <div class='app-header'>Chill out, let's shop for you.</div>
                                <div class='app-body'>Download our app</div>
                                <div class='app-footer'>
                                    <img style="height:80px;margin-left:0px;" src="/outlets/google-play-badge.png" alt='badge' />
                                </div>
                            </div>
                        </div>
                        
                        <footer id="footer">
					
                                        <div style="width:100%;height:100px;display: flex;align-items: center;justify-content: center;"><button class="red-button">SHOP NOW</button></div>
					
                                        
					<ul class="copyright">
						<li>&copy; 2019. Chill Technologies Inc. All Rights Reserved.</li>
						<li>Service-Level Agreement</li>
                                                <li>Winnipeg, MB, CA</li>
                                                <li>+1 (204) 818-3095</li>
					</ul>
                                        
                                        
                                        
				</footer>
                                            
                                            
                                            <%
            
            
            
            %>

   
   
		</div>

		<!-- Scripts -->
                <script type="text/javascript">
                    
            var loginModal = document.getElementById("login-modal");
            var loginDrop = document.getElementById("logindrop");
                    
                    function setActive()
                    
                    {
                        loginModal.style.zIndex = "20";
                        loginModal.style.position = "fixed";
                        loginModal.style.backgroundColor = "rgba(0,0,0,0.6)";
                        loginModal.style.paddingTop = "50px";
                        loginDrop.style.display = "block";
                    }
                    
                    function login()
                    
                    {
                        document.getElementsByClassName('drop-body-register')[0].style.display = "none";
                        document.getElementsByClassName('drop-body-login')[0].style.display = "block";
                        document.getElementsByClassName('drop-nav-register')[0].style.borderBottom = "none";
                        document.getElementsByClassName('drop-nav-login')[0].style.borderBottom = "2px solid #e00b00";
                    }
                    
                    function register()
                    
                    {
                        document.getElementsByClassName('drop-body-login')[0].style.display = "none";
                        document.getElementsByClassName('drop-body-register')[0].style.display = "block";
                        document.getElementsByClassName('drop-nav-login')[0].style.borderBottom = "none";
                        document.getElementsByClassName('drop-nav-register')[0].style.borderBottom = "2px solid #e00b00";
                    }
                    
                    
                </script>
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrollgress.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<!--<script src="assets/js/main.js"></script> -->
        
        <script type="text/javascript">
            
            
            var customerID = null;
            var customerFullName = null;
            var customerCredit = null;

                var spinner = document.getElementsByClassName('spinner-overlay')[0];
            var modal = document.getElementById("myModal");
            var modalContent = document.getElementById("modal-content");
            var modalBody = document.getElementById("modal-body");
            var modalFooter = document.getElementById("modal-footer");
            var btn = document.getElementById("myBtn");
            var span = document.getElementsByClassName("close")[0];
            var select = document.getElementById("line");
            //var countries = document.getElementById("countries");
            //var country = document.getElementById("country");
            var local = document.getElementById('local');
            var global = document.getElementById('global');
            var facheck = document.getElementsByClassName('icon fa-check')[0];
            var addressEntry = document.getElementsByClassName('address-entry')[0];
            
            
            var stockInput = document.getElementById('stock-input');
            var listPanel = document.getElementById('list-panel');
            
            
            stockInput.addEventListener("mousedown", function (){
                
                listPanel.style.display = "block";
                
            });
            
            
            select.onchange = function()
            
            {
                //document.getElementById("specialty").innerHTML = select.value;
                //country.innerHTML = countries.value;
                modal.style.position = "fixed";
                modalContent.style.animationName = "animatetop";
                modalContent.style.WebkitAnimationName = "animatetop";
                modal.style.backgroundColor = "rgba(0,0,0,0.6)";
                modal.style.paddingTop = "100px";
                modalBody.style.display = "block";
                modalFooter.style.display = "block";
            };
            
            span.onclick = function()
            
            {
                modal.style.position = "absolute";
                modalContent.style.animationName = "none";
                modalContent.style.WebkitAnimationName = "none";
                modal.style.backgroundColor = "rgba(0,0,0,0.0)";
                modal.style.paddingTop = "300px";
                modalBody.style.display = "none";
                modalFooter.style.display = "none";
            };
            
            window.onclick = function(event)
            
            {
                if (event.target === modal)
                    
                {
                    modal.style.position = "absolute";
                    modalContent.style.animationName = "none";
                    modalContent.style.WebkitAnimationName = "none";
                    modal.style.backgroundColor = "rgba(0,0,0,0.0)";
                    modal.style.paddingTop = "300px";
                    modalBody.style.display = "none";
                    modalFooter.style.display = "none";
                }
                
                else if (event.target === loginModal)
                    
                {
                    loginModal.style.zIndex = "10";
                    loginModal.style.position = "absolute";
                    loginModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                    loginModal.style.paddingTop = "50px";
                    loginDrop.style.display = "none";
                }
                
            };
            
            
            function addToShoppingList()
            
            {
                var listPanel = document.getElementById('list-panel');
                //listPanel.style.display = "none";
                stockInput.value = "";
            }
            
            function wrapUpShoppingList()
            
            {
                var listPanel = document.getElementById('list-panel');
                var stockInput = document.getElementById('stock-input');
                var pacInput = document.getElementById('pac-input');
                
                listPanel.style.display = "none";
                stockInput.style.display = "none";
                pacInput.style.display = "block";
            }
            
            function findOutlets()
            
            {
                
                var spin = document.getElementsByClassName('spin-overlay')[0];
                var addressForm = document.getElementById('address-form');
                spin.style.display = "block";
                spin.style.zIndex = "300";

                setTimeout(function(){
                    addressForm.submit();
                }, 50);
                
            }
            
            function openModal()
            {
                //document.getElementById("specialty").innerHTML = select.value;
                //country.innerHTML = countries.value;
                
                modal.style.position = "fixed";
                modalContent.style.animationName = "animatetop";
                modalContent.style.WebkitAnimationName = "animatetop";
                modal.style.backgroundColor = "rgba(0,0,0,0.6)";
                modal.style.paddingTop = "100px";
                modalBody.style.display = "block";
                modalFooter.style.display = "block";
            }
            
            
            
            
var x, i, j, selElmnt, a, b, c;
/*look for any elements with the class "custom-select":*/
x = document.getElementsByClassName("custom-select");
for (i = 0; i < x.length; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  /*for each element, create a new DIV that will act as the selected item:*/
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  /*for each element, create a new DIV that will contain the option list:*/
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 1; j < selElmnt.length; j++) {
    /*for each option in the original select element,
    create a new DIV that will act as an option item:*/
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /*when an item is clicked, update the original select box,
        and the selected item:*/
        var y, i, k, s, h;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        h = this.parentNode.previousSibling;
        for (i = 0; i < s.length; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            for (k = 0; k < y.length; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  
  var regionPanel = false;
  
  a.addEventListener("click", function(e) {
      /*when the select box is clicked, close any other select boxes,
      and open/close the current select box:*/
      document.getElementById("region-panel").style.display = "block";
      
      if (regionPanel)
          
        {
            document.getElementById("region-panel").style.display = "none";
            regionPanel = false;
        }
        
        else
            
        {
            document.getElementById("region-panel").style.display = "block";
            regionPanel = true;
        }
      
      e.stopPropagation();
      closeAllSelect(this);
      this.nextSibling.classList.toggle("select-hide");
      this.classList.toggle("select-arrow-active");
    });
}
function closeAllSelect(elmnt) {
  /*a function that will close all select boxes in the document,
  except the current select box:*/
  var x, y, i, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  for (i = 0; i < y.length; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < x.length; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}
/*if the user clicks anywhere outside the select box,
then close all select boxes:*/
document.addEventListener("click", closeAllSelect);
    
            
            
            
            
            global.addEventListener("mouseover", function(event) {
                
                event.target.style.backgroundColor = '#e00800';
                event.target.style.color = '#fff';
                local.style.backgroundColor = 'inherit';
                facheck.style.color = '#fff';
                
            }, false);
            
            local.addEventListener("mouseover", function(event) {
                
                event.target.style.backgroundColor = '#e00800';
                event.target.style.color = '#fff';
                global.style.backgroundColor = 'inherit';
                facheck.style.color = '#fff';
                
            }, false);
            
            global.addEventListener("click", function(event) {
                
                event.target.style.backgroundColor = '#e00800';
                event.target.style.color = '#fff';
                local.style.backgroundColor = 'inherit';
                facheck.style.color = '#fff';
                local.removeEventListener("mouseover", function(event){});
                
            }, false);
            
            local.addEventListener("click", function(event) {
                
                event.target.style.backgroundColor = '#e00800';
                event.target.style.color = '#fff';
                global.style.backgroundColor = 'inherit';
                facheck.style.color = '#fff';
                global.removeEventListener("mouseover", function(event){});
                
            }, false);
            
            function enterAddress(e)
            {
                
                
                if(e.keyCode === 13)
                
                {
                    e.preventDefault(); // Ensure it is only this code that rusn
                    
                    openModal();
                }
                
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
                      //alert("customer id " + xml.responseText);
                      
                      for (count = 0; count < 1; count++)
                          
                        {
                            var customer = customers[count];
                            customerID = customer.getElementsByTagName("customerID")[0].firstChild.nodeValue;
                            customerFullName = customer.getElementsByTagName("customerFullName")[0].firstChild.nodeValue;
                            customerCredit = customer.getElementsByTagName("customerCredit")[0].firstChild.nodeValue;
                            
                            //document.getElementById("account-signifier").innerHTML = customerFullName;
                            //alert("customer id " + customerID);
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
                              //alert("customerid null");
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
                                //alert("customer id space");
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
    
    function submitSignUp()
    
    {
        document.getElementById("signup-button").click();
    }
    
    function submitLogout()
    
    {
        document.getElementById("logout-button").click();
    }
            
            
            
            
            
            document.getElementById("customer-email-splash").addEventListener("mouseover", function () {
                
                document.getElementById("splash-login-email").style.display = "block";
                
            });
            
            document.getElementById("customer-password-splash").addEventListener("mouseover", function () {
                
                document.getElementById("splash-login-password").style.display = "block";
                
            });
            
            document.getElementById("first-name-field").addEventListener("mouseover", function () {
                
                document.getElementById("dash-first-name").style.borderBottom = "2px solid black";
                
            });
            
            document.getElementById("middle-name-field").addEventListener("mouseover", function () {
                
                document.getElementById("dash-middle-name").style.borderBottom = "2px solid black";
                
            });
            
            document.getElementById("last-name-field").addEventListener("mouseover", function () {
                
                document.getElementById("dash-last-name").style.borderBottom = "2px solid black";
                
            });
            
            document.getElementById("email-field").addEventListener("mouseover", function () {
                
                document.getElementById("dash-email").style.borderBottom = "2px solid black";
                
            });
            
            document.getElementById("password-field").addEventListener("mouseover", function () {
                
                document.getElementById("dash-password").style.borderBottom = "2px solid black";
                
            });
            
            document.getElementById("first-name-field").addEventListener("mouseout", function () {
                
                document.getElementById("dash-first-name").style.borderBottom = "1px solid #aaa";
                /*
                $(document).mouseleave(function () 
                {
                    document.getElementById("dash-first-name").style.borderBottom = "1px solid #aaa";
                });
                */
                
                if (document.getElementById("first-name").hasFocus())
                
                {
                    document.getElementById("dash-first-name").style.borderBottom = "2px solid #c00c00";
                    //return 0;
                }
                
                
                
            });
            
            document.getElementById("middle-name-field").addEventListener("mouseout", function () {
                
                document.getElementById("dash-middle-name").style.borderBottom = "1px solid #aaa";
                
                if (document.getElementById("middle-name").hasFocus())
                
                {
                    document.getElementById("dash-middle-name").style.borderBottom = "2px solid #c00c00";
                }
                
                else
                
                {
                    document.getElementById("dash-middle-name").style.borderBottom = "1px solid #aaa";
                }
                
            });
            
            document.getElementById("last-name-field").addEventListener("mouseout", function () {
                
                document.getElementById("dash-last-name").style.borderBottom = "1px solid #aaa";
                
                if (document.getElementById("last-name").hasFocus())
                
                {
                    document.getElementById("dash-last-name").style.borderBottom = "2px solid #c00c00";
                }
                
                else
                
                {
                    document.getElementById("dash-last-name").style.borderBottom = "1px solid #aaa";
                }
                
            });
            
            document.getElementById("email-field").addEventListener("mouseout", function () {
                
                document.getElementById("dash-email").style.borderBottom = "1px solid #aaa";
                
                if (document.getElementById("email").hasFocus())
                
                {
                    document.getElementById("dash-email").style.borderBottom = "2px solid #c00c00";
                }
                
                else
                
                {
                    document.getElementById("dash-email").style.borderBottom = "1px solid #aaa";
                }
                
            });
            
            document.getElementById("password-field").addEventListener("mouseout", function () {
                
                document.getElementById("dash-password").style.borderBottom = "1px solid #aaa";
                
                if (document.getElementById("password").hasFocus())
                
                {
                    document.getElementById("dash-password").style.borderBottom = "2px solid #c00c00";
                }
                
                else
                
                {
                    document.getElementById("dash-password").style.borderBottom = "1px solid #aaa";
                }
                
            });
            
            document.getElementById("first-name").addEventListener("focus", function () {
                
                document.getElementById("dash-first-name").style.borderBottom = "2px solid #c00c00";
                document.getElementById("splash-first-name").style.display = "block";
                document.getElementById("first-name").placeholder = "";
                
            });
            
            document.getElementById("middle-name").addEventListener("focus", function () {
                
                document.getElementById("dash-middle-name").style.borderBottom = "2px solid #c00c00";
                document.getElementById("splash-middle-name").style.display = "block";
                document.getElementById("middle-name").placeholder = "";
                
            });
            
            document.getElementById("last-name").addEventListener("focus", function () {
                
                document.getElementById("dash-last-name").style.borderBottom = "2px solid #c00c00";
                document.getElementById("splash-last-name").style.display = "block";
                document.getElementById("last-name").placeholder = "";
                
            });
            
            document.getElementById("email").addEventListener("focus", function () {
                
                document.getElementById("dash-email").style.borderBottom = "2px solid #c00c00";
                document.getElementById("splash-email").style.display = "block";
                document.getElementById("email").placeholder = "";
                
            });
            
            document.getElementById("password").addEventListener("focus", function () {
                
                document.getElementById("dash-password").style.borderBottom = "2px solid #c00c00";
                document.getElementById("splash-password").style.display = "block";
                document.getElementById("password").placeholder = "";
                
            });
            
            document.getElementById("first-name-field").addEventListener("focusout", function () {
                
                document.getElementById("splash-first-name").style.display = "none";
                document.getElementById("first-name").placeholder = "First Name *";
                document.getElementById("dash-first-name").style.borderBottom = "1px solid #aaa";
                
            });
            
            document.getElementById("middle-name-field").addEventListener("focusout", function () {
                
                document.getElementById("splash-middle-name").style.display = "none";
                document.getElementById("middle-name").placeholder = "Middle Name";
                document.getElementById("dash-middle-name").style.borderBottom = "1px solid #aaa";
                
            });
            
            document.getElementById("last-name-field").addEventListener("focusout", function () {
                
                document.getElementById("splash-last-name").style.display = "none";
                document.getElementById("last-name").placeholder = "Last Name *";
                document.getElementById("dash-last-name").style.borderBottom = "1px solid #aaa";
                
            });
            
            document.getElementById("email-field").addEventListener("focusout", function () {
                
                document.getElementById("splash-email").style.display = "none";
                document.getElementById("email").placeholder = "Email *";
                document.getElementById("dash-email").style.borderBottom = "1px solid #aaa";
                
                if (validateEmail(document.getElementById("email").value)) 
                    
                {
                    document.getElementById("splash-email").innerHTML = "Email correct.";
                }
                
                else

                {
                    document.getElementById("splash-email").innerHTML = "Email incorrect.";
                }
                
            });
            
            document.getElementById("password-field").addEventListener("focusout", function () {
                
                document.getElementById("splash-password").style.display = "none";
                document.getElementById("password").placeholder = "Password *";
                document.getElementById("dash-password").style.borderBottom = "1px solid #aaa";
                
                if (validateEmail(document.getElementById("password").value)) 
                    
                {
                    document.getElementById("splash-password").innerHTML = "Password correct.";
                }
                
                else

                {
                    document.getElementById("splash-password").innerHTML = "Password incorrect.";
                }
                
            });
            
            
            document.getElementById("first-name").addEventListener("keyup", function () {
                
                
                        var re = /([a-zA-Z0-9\-])(?=.{1,})/;
                        var specials = /^[^*|\":<>^[\]{}`\\();@%#!&$]+$/;
                            
                            if (!re.test(document.getElementById("first-name").value))
                            
                            {
                                document.getElementById("splash-first-name").innerHTML = "Please enter more than one character.";
                                document.getElementById("splash-first-name").style.display = "block";
                            }
                            
                            else
                                
                            {
                                if (!specials.test(document.getElementById("first-name").value))
                                    
                                {
                                    document.getElementById("splash-first-name").innerHTML = "First name should not include any special characters.";
                                    document.getElementById("splash-first-name").style.display = "block";
                                }
                                
                                else
                                
                                {
                                    document.getElementById("splash-first-name").innerHTML = "First name is valid.";
                                    document.getElementById("splash-first-name").style.display = "block";
                                }
                                
                            }
                        
                
            });
            
            
            document.getElementById("last-name").addEventListener("keyup", function () {
                
                
                        var re = /([a-zA-Z0-9\-\'])(?=.{1,})/;
                        var specials = /^[^*|\":<>^[\]{}`\\();@%#!&$]+$/;
                            
                            if (!re.test(document.getElementById("last-name").value))
                            
                            {
                                document.getElementById("splash-last-name").innerHTML = "Please enter more than one character.";
                                document.getElementById("splash-last-name").style.display = "block";
                            }
                            
                            else
                                
                            {
                                if (!specials.test(document.getElementById("last-name").value))
                                    
                                {
                                    document.getElementById("splash-last-name").innerHTML = "Last name should not include any special characters.";
                                    document.getElementById("splash-last-name").style.display = "block";
                                }
                                
                                else
                                
                                {
                                    document.getElementById("splash-last-name").innerHTML = "Last name is valid.";
                                    document.getElementById("splash-last-name").style.display = "block";
                                }
                                
                            }
                        
                
            });
            
            
            document.getElementById("email").addEventListener("keyup", function () {
                
                
                        var re = /([a-zA-Z0-9_])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})/;
                            
                            if (!re.test(document.getElementById("email").value))
                            
                            {
                                document.getElementById("splash-email").innerHTML = "Please enter a valid email address.";
                                document.getElementById("splash-email").style.display = "block";
                            }
                            
                            else
                                
                            {
                                document.getElementById("splash-email").innerHTML = "Email address is valid.";
                                document.getElementById("splash-email").style.display = "block";
                            }
                        
                
            });
            
            
            document.getElementById("password").addEventListener("keyup", function () {
                
                        var mediumRegex = /^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})/;
                        var strongRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/;
                            
                            if (!strongRegex.test(document.getElementById("password").value))
                            
                            {
                                document.getElementById("splash-password").innerHTML = "At least 8 characters, 1 upper, 1 lower, 1 number, 1 special character.";
                                document.getElementById("splash-password").style.display = "block";
                            }
                            
                            else
                                
                            {
                                document.getElementById("splash-password").innerHTML = "Password is valid.";
                                document.getElementById("splash-password").style.display = "block";
                            }
                        
                
            });
            
    
    
    
    
    
            
            
        </script>
        
        

    <script>
      // This example requires the Places library. Include the libraries=places
      // parameter when you first load the API. For example:
      // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

var x = document.getElementById("demo");

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else { 
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition(position) 

    {
  x.innerHTML = "Latitude: " + position.coords.latitude + 
  "<br>Longitude: " + position.coords.longitude;
}

      function initMap() {
        var map = new google.maps.Map(document.getElementById('modal-body'), {
          center: {lat: -33.8688, lng: 151.2195},
          zoom: 19
        });
        
        
        var card = document.getElementById('pac-card');
        var input = document.getElementById('pac-input');
        var types = document.getElementById('type-selector');
        var strictBounds = document.getElementById('strict-bounds-selector');
        
        var destination = "place";

        map.controls[google.maps.ControlPosition.TOP_RIGHT].push(card);

        var autocomplete = new google.maps.places.Autocomplete(input);

        // Bind the map's bounds (viewport) property to the autocomplete object,
        // so that the autocomplete requests use the current map bounds for the
        // bounds option in the request.
        autocomplete.bindTo('bounds', map);

        // Set the data fields to return when the user selects a place.
        autocomplete.setFields(
            ['address_components', 'geometry', 'icon', 'name']);

        var infowindow = new google.maps.InfoWindow();
        var infowindowContent = document.getElementById('infowindow-content');
        infowindow.setContent(infowindowContent);
        var marker = new google.maps.Marker({
          map: map,
          anchorPoint: new google.maps.Point(0, -29)
        });
        
        
        

        autocomplete.addListener('place_changed', function() {
            
            spinner.style.display = "block";
                
                google.maps.event.addListenerOnce(map, 'idle', function(){
                    //
                    
        
                setTimeout(openModal, 200);
                
                setTimeout(function(){
                    spinner.style.display = "none";
          document.getElementById('destination').innerHTML = destination;
                }, 500);
                });
                
                
                
                
            //openModal();
          infowindow.close();
          marker.setVisible(false);
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
            window.alert("No details available for input: '" + place.name + "'");
            return;
          }

          // If the place has a geometry, then present it on a map.
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(19);  // Why 17? Because it looks good.
          }
          
          marker.setPosition(place.geometry.location);
          marker.setVisible(true);
          map.setCenter(place.geometry.location);
          map.setZoom(15); 
          
          var latitude = document.getElementById('latitude');
          var longitude = document.getElementById('longitude');
          
          latitude.value = place.geometry.location.lat();
          longitude.value = place.geometry.location.lng();
          destination = place.name;

          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
          }

          infowindowContent.children['place-icon'].src = place.icon;
          infowindowContent.children['place-name'].textContent = place.name;
          infowindowContent.children['place-address'].textContent = address;
          infowindow.open(map, marker);
          
          
        });

        // Sets a listener on a radio button to change the filter type on Places
        // Autocomplete.
        function setupClickListener(id, types) {
          var radioButton = document.getElementById(id);
          radioButton.addEventListener('click', function() {
            autocomplete.setTypes(types);
          });
        }

        setupClickListener('changetype-all', []);
        setupClickListener('changetype-address', ['address']);
        setupClickListener('changetype-establishment', ['establishment']);
        setupClickListener('changetype-geocode', ['geocode']);

        document.getElementById('use-strict-bounds')
            .addEventListener('click', function() {
              console.log('Checkbox clicked! New state=' + this.checked);
              autocomplete.setOptions({strictBounds: this.checked});
            });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnOuNL_P1zkEfYK-q3N7JQFInYlW_JLJE&libraries=places&callback=initMap"
        async defer></script>

	</body>
</html>
