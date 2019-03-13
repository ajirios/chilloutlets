<%-- 
    Document   : expeditor
    Created on : 17-Oct-2018, 10:13:05 PM
    Author     : mac
--%>

<%@page import="cities.CitiesRetrieve"%>
<%@page import='com.mysql.jdbc.Driver' %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Become a Retail Carrier</title>
                <link rel="shortcut icon" type="image/png" href="../images/chilliredup.png"/>
		<link rel="stylesheet" href="../assets/css/main.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
                <meta charset="utf-8" /> 
                <meta name="keywords" content="Chillonline, chill online, courses, course management system, online courses, job boards, job postings, videos, movies, music, TV shows, TV series, TV channels, radio channels, games" />
                <meta name="description" content="Shop from local retailers in any country."/>
                <meta name="viewport" content="width=device-width, initial-scale=1">
                
<style type="text/css">

    
    .wrapper
    {
        width: 100%;
        height: 100%;
        z-index: 2;
    }
    
    .entry
    {
        width: 300px;
        height: 200px;
        z-index: 4;
        top: 120px;
        left: 700px;
        font-size: 40px;
        color: white;
        elevation: above;
        position: absolute;
    }
    
    .sign-up-now
    {
        width: 500px;
        height: 750px;
        padding: 50px;
        border-radius: 4px;
        background-color: white;
        z-index: 14;
        top: 60px;
        left: 140px;
        font-family: sans-serif;
        color: white;
        elevation: above;
        position: absolute;
        box-shadow: 0 2px 20px #777;
    }
    
    .back-picture
    {
        width: 100%;
        height: 100%;
        z-index: 2;
        position: relative;
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
                color: #c00c00;
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
                width: 300px;
                height: 500px;
                top: 80px;
                background-color: white;
                border: 0.2px solid #aaa;
                margin-left: calc(100% - 1050px);
                position: fixed;
                padding: 0;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.8),0 6px 20px 0 rgba(0,0,0,0.19);
                -webkit-animation-name: none;
                -webkit-animation-duration: 0.6s;
                animation-name: none;
                animation-duration: 0.6s
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
                width: 300px;
                height: 500px;
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
                height: 500px;
                top: 80px;
                background-color: white;
                border: 0.2px solid #aaa;
                margin-left: calc(100% - 620px);
                position: fixed;
                padding: 0;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.8),0 6px 20px 0 rgba(0,0,0,0.19);
                -webkit-animation-name: none;
                -webkit-animation-duration: 0.6s;
                animation-name: none;
                animation-duration: 0.6s
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
                height: 500px;
                top: 80px;
                background-color: white;
                border: 0.2px solid #aaa;
                margin-left: calc(100% - 530px);
                position: fixed;
                padding: 0;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.8),0 6px 20px 0 rgba(0,0,0,0.19);
                -webkit-animation-name: none;
                -webkit-animation-duration: 0.6s;
                animation-name: none;
                animation-duration: 0.6s
            }
            
            .redclickarea
            {
                width: 100%;
                height: 50px;
                margin-left: auto;
                margin-right: auto;
                margin-top: 20px;
            }
            
            .redclicker:hover
            {
                background-color: #c00c00;
            }
            
            .redclicker
            {
                width: 100%;
                height: 50px;
                display: flex;
                justify-content: center;
                flex-direction: column;
                text-align: center;
                background-color: #f00f00;
                color: #fff;
                font-size: 14px;
            }
            
            .work-permit
            {
                display: block;
                width: 400px;
                height: 600px;
                padding: 0 10px;
                font-family: Roboto;
            }
            
            
/* The container */
.container {
    display: block;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    cursor: pointer;
    //font-size: 22px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

/* Hide the browser's default radio button */
.container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
    position: absolute;
    top: 0;
    left: 0;
    height: 20px;
    width: 20px;
    background-color: #f78b88;
    border-radius: 50%;
    border: 2px solid #e00b00;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
    background-color: #f78b88;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
    background-color: #fff;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
    display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
 	top: 3px;
	left: 3px;
	width: 10px;
	height: 10px;
	border-radius: 50%;
	background: #e00b00;
}
                
                .document-identifier
                {
                    width: 100%;
                    height: 20px;
                    font-size: 13px;
                    color: #aaa;
                    margin-top: 10px;
                    margin-bottom: 10px;
                }
                
                .license-percent
                {
                    width: 100%;
                    height: 3px;
                    padding-top: 10px;
                    padding-bottom: 25px;
                }
                
                .instructions
                {
                    min-height: 50px;
                }
                
                .percent-left
                {
                    width: 100%;
                    height: 3px;
                    background-color: #c00c00;
                    float: left;
                }
                
                .percent-right
                {
                    width: 0%;
                    height: 3px;
                    background-color: #eee;
                    float: left;
                }
                
                .permit-percent-left
                {
                    width: 50%;
                    height: 3px;
                    background-color: #e00b00;
                    float: left;
                }
                
                .permit-percent-right
                {
                    width: 50%;
                    height: 3px;
                    background-color: #eee;
                    float: left;
                }
                
                .step-header
                {
                    width: 100%;
                    height: 40px;
                    margin-top: 20px;
                    margin-bottom: 20px;
                    font-size: 30px;
                    font-weight: normal;
                    color: black;
                }
                
                .textfield
                {
                    border: none;
                    width: 100%;
                }
                
                .underline
                {
                    width: 100%;
                    height: 1px;
                    margin-left: auto;
                    margin-right: auto;
                    margin-top: 1px;
                    margin-bottom: 0px;
                    border-bottom: 1px solid #aaa;
                }
                
                .splash
                {
                    width: 100%;
                    height: 20px;
                    margin-left: auto;
                    margin-right: auto;
                    margin-top: 10px;
                    margin-bottom: 0px;
                    font-size: 12px;
                    color: #c00c00;
                }
                
                #splash-first-name
                {
                    display: none;
                }
                
                #splash-middle-name
                {
                    display: none;
                }
                
                #splash-last-name
                {
                    display: none;
                }
                
                #splash-email
                {
                    display: none;
                }
                
                #splash-password
                {
                    display: none;
                }
                
                #step1of2
                {
                    display: block;
                }
                
                #step2of2
                {
                    display: none;
                }
                
                .triple
                {
                    width: 100%;
                    border-bottom: 30px solid white;
                }
                
                .triple-one
                {
                    width: 33.3%;
                    float: left;
                }
                
                .triple-two
                {
                    width: 33.3%;
                    float: left;
                }
                
                .triple-three
                {
                    width: 33.3%;
                    float: left;
                }
                
        #station-title
        {
            width: 100%;
            height: 20px;
            margin-top: 10px;
            font-size: 13px;
            color: #aaa;
        }
        
        #station-overlay
        {
            width: 100%;
            height: 40px;
        }
        
        #station-underline
        {
            width: 100%;
            height: 2px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 1px;
            margin-bottom: 10px;
            border-bottom: 1px solid #bbb;
        }
                
        #platform-title
        {
            width: 100%;
            height: 20px;
            margin-top: 10px;
            font-size: 13px;
            color: #aaa;
        }
        
        #platform-overlay
        {
            width: 100%;
            height: 40px;
        }
        
        #platform-select
        {
            width: 100%;
            height: 40px;
        }
        
        #platform-underline
        {
            width: 100%;
            height: 2px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 1px;
            margin-bottom: 10px;
            border-bottom: 1px solid #bbb;
        }
                
        /*the container must be positioned relative:*/
        #city-title
        {
            width: 100%;
            height: 20px;
            margin-top: 10px;
            font-size: 13px;
            color: #aaa;
        }
        
        #city-overlay
        {
            width: 100%;
            height: 40px;
        }
        
        #city-select
        {
            width: 70%;
            height: 40px;
            float: left;
        }
        
        #city-input
        {
            width: 30%;
            height: 40px;
            float: left;
        }
        
        #city-input > input
        {
            width: 100%;
            height: 40px;
            border: none;
        }
        
        #city-underline
        {
            width: 100%;
            height: 2px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 1px;
            margin-bottom: 10px;
            border-bottom: 1px solid #bbb;
        }
        
        .custom-select-year 
        {
            width: 100%;
            height: 40px;
          position: relative;
          font-family: Arial;
          border-bottom: 2px solid #ccc;
        }
        
        .custom-select-year select 
        {
          display: none; /*hide original SELECT element:*/
        }
        
        .custom-select-month 
        {
            width: 100%;
            height: 40px;
          position: relative;
          font-family: Arial;
          border-bottom: 2px solid #ccc;
        }
        
        .custom-select-month select 
        {
          display: none; /*hide original SELECT element:*/
        }
        
        .custom-select-day 
        {
            width: 100%;
            height: 40px;
          position: relative;
          font-family: Arial;
          border-bottom: 2px solid #ccc;
        }
        
        .custom-select-day select 
        {
          display: none; /*hide original SELECT element:*/
        }
        
        .custom-select-city 
        {
            width: 100%;
            height: 40px;
          position: relative;
          font-family: Arial;
          border-bottom: 2px solid #ccc;
        }
        
        .custom-select-city select 
        {
          display: none; /*hide original SELECT element:*/
        }
        
        .custom-select 
        {
            width: 100%;
            height: 40px;
          position: relative;
          font-family: Arial;
          border-bottom: 2px solid #ccc;
        }

        .custom-select select 
        {
          display: none; /*hide original SELECT element:*/
        }

        .select-selected 
        {
          background-color: #fff;
        }

        /*style the arrow inside the select element:*/
        .select-selected:after 
        {
          position: absolute;
          content: "";
          top: 14px;
          right: 10px;
          width: 0;
          height: 0;
          border: 6px solid transparent;
          border-color: #333 transparent transparent transparent;
        }

        /*point the arrow upwards when the select box is open (active):*/
        .select-selected.select-arrow-active:after 
        {
          border-color: transparent transparent #333 transparent;
          top: 7px;
        }

        /*style the items (options), including the selected item:*/
        .select-items div
        {
          color: #333;
          padding: 8px 16px;
          border: 1px solid transparent;
          border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
          cursor: pointer;
          user-select: none;
          display: none;
        }

        /*style the items (options), including the selected item:*/
        .select-selected 
        {
          color: #333;
          padding: 8px 16px;
          border: 1px solid transparent;
          border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
          cursor: pointer;
          user-select: none;
        }

        /*style items (options):*/
        .select-items 
        {
          position: absolute;
          background-color: #eee;
          top: 100%;
          left: 0;
          right: 0;
          z-index: 99;
        }

        /*hide the items when the select box is closed:*/
        .select-hide 
        {
          display: none;
        }
        
        .select-items div:hover, .same-as-selected 
        {
          background-color: rgba(0, 0, 0, 0.1);
        }
        
        .selectpanel
        {
            display: none;
            font-family: Arial;
            font-size: 17px;
            background-color: white;
            padding-top: 10px;
            padding-bottom: 10px;
            border-radius: 4px;
            box-shadow: 0 2px 10px #ccc;
        }
        
        #year-panel
        {
            top: 20px;
            height: 550px;
            width: 133.33px;
            margin-left: 0px;
            //margin-right: 0px;
            position: absolute;
            overflow: scroll;
            z-index: 21;
        }
        
        #month-panel
        {
            top: 20px;
            height: 550px;
            width: 133.33px;
            margin-left: 0px;
            position: absolute;
            overflow: scroll;
            z-index: 21;
        }
        
        #day-panel
        {
            top: 20px;
            height: 550px;
            width: 133.33px;
            margin-left: 0px;
            position: absolute;
            overflow: scroll;
            z-index: 21;
        }
        
        #day-select option
        {
            display: none;
        }
        
        #city-panel
        {
            height: 270px;
            width: 400px;
            margin-left: 0px;
            margin-right: 0px;
            position: absolute;
            overflow: scroll;
            z-index: 21;
        }
        
        #platform-panel
        {
            top: 1px;
            padding-top: 10px;
            padding-bottom: 10px;
            width: 400px;
            height: 550px;
            position: absolute;
            font-family: Arial;
            font-size: 17px;
            background-color: white;
            border-radius: 4px;
            box-shadow: 0 2px 10px #ccc;
            overflow: scroll;
            margin-left: 0px;
            margin-right: 0px;
            z-index: 21;
            display: none;
        }
        
        .panel-item
        {
            width: 100%;
            height: 50px;
            color: #777;
            padding-top: 13px;
            padding-bottom: 10px;
            padding-left: 30px;
            padding-right: 30px;
        }
        
        .panel-item:hover
        {
            background-color: #eee;
        }
        
        .focused
        {
            background-color: #ddd;
        }





</style>

    </head>
    <body>
    
    
    
    <%
        
        
        
        
        %>
        
        
        
				<header id="header" class="alt">
                                    <a href="../index.jsp" style="text-decoration:none;color:inherit;"><div style="text-decoration:none;color:inherit;">
                                    <img src="../images/chilloutlets.png" style="margin-left:15px;height:30px;margin-top:8px;float:left;" />
            <!-- <img src='images/transparent-white.png' style="margin-left:2px;height:15px;" /> -->
            <!-- <span style="margin-top:2px;margin-left:6px;color:white;font-size:20px;float:left;"><b>| Canada</b></span> -->
                                        </div>
                                    </a>
					<nav id="nav">
						<ul>
                                                        
							<li><a href="../onboarding/carrier.jsp" class="button">BECOME A CARRIER, EARN WITH US</a></li>
							<li><a href="../onboarding/outlet.jsp" class="button">CONNECT YOUR OUTLET</a></li>
							<!-- <li><a href="#" class="button">BROADCAST OUR PLATFORM, GET $300</a></li> -->
							<li>
        
                                                            
                                                            
                                                            <a  href="javascript:setActive()" id="account-signifier" class="icon fa-angle-down">Carrier Connect Account</a>
                                                            
                       
                                                        </li>
                                                        
						</ul>
					</nav>
				</header>
        
        <div class="wrapper">
        
        <div class="back-picture"><img style='' src="/outlets/gps.jpg" width="100%" /></div>
        
        <div class="entry"><span>Get driving with us<br><br>and earn weekly in<br><br>your free time.<br><br></span></div>
        
        <div class="sign-up-now">
        
            <div id="work-permit" class="work-permit">
                
                <form id="sign-up-form" method="post" action="../CarrierRegisterServlet" onsubmit="return performChecks()">

                <div id="step1of2">

                <div class="document-identifier">Step 1 of 2</div>

                <div class="license-percent">
                    <div class="permit-percent-left"></div>
                    <div class="permit-percent-right"></div>
                </div>
                
                <div class="step-header">Sign Up Now.</div>
                
                <div class="splash"><span id="splash-first-name">First Name *</span></div>
                <div id="first-name-field">
                    <input required style="border:none;color:#555;background-color:white;padding-left:0px;height:25px;font-size:16px;" type="text" id="first-name" name="first-name" class="textfield" placeholder="First Name *" />
                
                    <div id="dash-first-name" class="underline"></div>
                </div>
                
                <div class="splash"><span id="splash-last-name">Last Name *</span></div>
                <div id="last-name-field">
                    <input required style="border:none;color:#555;background-color:white;padding-left:0px;height:25px;font-size:16px;" type="text" id="last-name" name="last-name" class="textfield" placeholder="Last Name *" />
                </div>
                <div id="dash-last-name" class="underline"></div>

                <div class="splash"><span id="splash-middle-name">Middle Name (optional)</span></div>
                <div id="middle-name-field">
                    <input required style="border:none;color:#555;background-color:white;padding-left:0px;height:25px;font-size:16px;" type="text" id="middle-name" name="middle-name" class="textfield" placeholder="Middle Name (optional)" />
                </div>
                <div id="dash-middle-name" class="underline"></div>
                

                <div class="splash"><span id="splash-email">Email *</span></div>
                <div id="email-field">
                    <input required style="border:none;color:#555;background-color:white;padding-left:0px;height:25px;font-size:16px;" type="email" id="email" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" class="textfield" placeholder="Email *" />
                </div>
                <div id="dash-email" class="underline"></div>
                
                <div class="splash"><span id="splash-password">Password *</span></div>
                <div id="password-field">
                    <input required style="border:none;color:#555;background-color:white;padding-left:0px;height:25px;font-size:16px;" type="password" id="password" name="password" class="textfield" placeholder="Password *" />
                </div>
                <div id="dash-password" class="underline"></div>

                
                


                </div>

                <div id="step2of2">

                <div class="document-identifier">Step 2 of 2</div>

                <div class="license-percent">
                    <div class="percent-left"></div>
                    <div class="percent-right"></div>
                </div>

                <div class="step-header">Sign Up Now.</div>
                
                
                
                
                <div id="city-title">City</div>
                <div id="city-overlay">
                    <div id="city-input">
                        <input required style="border:none;color:#555;background-color:white;height:40px;width:100%;font-size:16px;" type="text" id="city" name="city" class="textfield" placeholder="Select..." />
                    </div>
                    <div id="city-select">
                          <div id="select-city" class="custom-select-city">
                              <select id="cselect" name="city">
                              <option selected value="0">&nbsp;</option>
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="7">7</option>
                              <option value="8">8</option>
                              <option value="9">9</option>
                              <option value="10">10</option>
                              <option value="11">11</option>
                              <option value="12">12</option>
                              <option value="13">13</option>
                              <option value="14">14</option>
                              <option value="15">15</option>
                              <option value="16">16</option>
                              <option value="17">17</option>
                              <option value="18">18</option>
                              <option value="19">19</option>
                              <option value="20">20</option>
                              <option value="21">21</option>
                              <option value="22">22</option>
                              <option value="23">23</option>
                              <option value="24">24</option>
                              <option value="25">25</option>
                              <option value="26">26</option>
                              <option value="27">27</option>
                              <option value="28">28</option>
                              <option value="29">29</option>
                              <option value="30">30</option>
                              <option value="31">31</option>
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="7">7</option>
                              <option value="8">8</option>
                              <option value="9">9</option>
                              <option value="10">10</option>
                              <option value="11">11</option>
                              <option value="12">12</option>
                              <option value="13">13</option>
                              <option value="14">14</option>
                              <option value="15">15</option>
                              <option value="16">16</option>
                              <option value="17">17</option>
                              <option value="18">18</option>
                              <option value="19">19</option>
                              <option value="20">20</option>
                              <option value="21">21</option>
                              <option value="22">22</option>
                              <option value="23">23</option>
                              <option value="24">24</option>
                              <option value="25">25</option>
                              <option value="26">26</option>
                              <option value="27">27</option>
                              <option value="28">28</option>
                              <option value="29">29</option>
                              <option value="30">30</option>
                              <option value="31">31</option>
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="7">7</option>
                              <option value="8">8</option>
                              <option value="9">9</option>
                              <option value="10">10</option>
                              <option value="11">11</option>
                              <option value="12">12</option>
                              <option value="13">13</option>
                              <option value="14">14</option>
                              <option value="15">15</option>
                              <option value="16">16</option>
                              <option value="17">17</option>
                              <option value="18">18</option>
                              <option value="19">19</option>
                              <option value="20">20</option>
                              <option value="21">21</option>
                              <option value="22">22</option>
                              <option value="23">23</option>
                              <option value="24">24</option>
                              <option value="25">25</option>
                              <option value="26">26</option>
                              <option value="27">27</option>
                              <option value="28">28</option>
                              <option value="29">29</option>
                              <option value="30">30</option>
                              <option value="31">31</option>
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="7">7</option>
                              <option value="8">8</option>
                              <option value="9">9</option>
                              <option value="10">10</option>
                              <option value="11">11</option>
                              <option value="12">12</option>
                              <option value="13">13</option>
                              <option value="14">14</option>
                              <option value="15">15</option>
                              <option value="16">16</option>
                              <option value="17">17</option>
                              <option value="18">18</option>
                              <option value="19">19</option>
                              <option value="20">20</option>
                              <option value="21">21</option>
                              <option value="22">22</option>
                              <option value="23">23</option>
                              <option value="24">24</option>
                              <option value="25">25</option>
                              <option value="26">26</option>
                              <option value="27">27</option>
                              <option value="28">28</option>
                              <option value="29">29</option>
                              <option value="30">30</option>
                              <option value="31">31</option>
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="7">7</option>
                              <option value="8">8</option>
                              <option value="9">9</option>
                              <option value="10">10</option>
                              <option value="11">11</option>
                              <option value="12">12</option>
                              <option value="13">13</option>
                              <option value="14">14</option>
                              <option value="15">15</option>
                              <option value="16">16</option>
                              <option value="17">17</option>
                              <option value="18">18</option>
                              <option value="19">19</option>
                              <option value="20">20</option>
                              <option value="21">21</option>
                              <option value="22">22</option>
                              <option value="23">23</option>
                              <option value="24">24</option>
                              <option value="25">25</option>
                              <option value="26">26</option>
                              <option value="27">27</option>
                              <option value="28">28</option>
                              <option value="29">29</option>
                              <option value="30">30</option>
                              <option value="31">31</option>
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="7">7</option>
                              <option value="8">8</option>
                              <option value="9">9</option>
                              <option value="10">10</option>
                              <option value="11">11</option>
                              <option value="12">12</option>
                              <option value="13">13</option>
                              <option value="14">14</option>
                              <option value="15">15</option>
                              <option value="16">16</option>
                              <option value="17">17</option>
                              <option value="18">18</option>
                              <option value="19">19</option>
                              <option value="20">20</option>
                              <option value="21">21</option>
                              <option value="22">22</option>
                              <option value="23">23</option>
                              <option value="24">24</option>
                              <option value="25">25</option>
                              <option value="26">26</option>
                              <option value="27">27</option>
                              <option value="28">28</option>
                              <option value="29">29</option>
                              <option value="30">30</option>
                              <option value="31">31</option>
                            </select>
                          </div>
                    </div>
                </div>
                <div id="city-underline"></div>
                
                <div id="city-panel" class="selectpanel"></div>
                      
                
                
                        
                
                
                
                <div id="station-title">What address would you like to begin shifts at?</div>
                <div id="station-overlay">
                    <input required style="border:none;color:#555;background-color:white;height:40px;width:100%;font-size:16px;" type="text" id="address" name="station" class="textfield" placeholder="Street address..." />
                </div>
                <div id="station-underline"></div>
                
                
                
                
                
                
                        
                        
                        
                
                <div id="platform-title">How did you hear about us?</div>
                <div id="platform-overlay">
                        <div id="select-platform" class="custom-select">
                            <select id="platform-select" name="referrer">
                                <option selected id="platform-option" value="0">Chilloutlets Platform</option>
                                <option selected id="platform-option" value="Chilloutlets Platform">Chilloutlets Platform</option>
                                <option selected id="platform-option" value="Kijiji">Kijiji</option>
                                <option selected id="platform-option" value="Indeed">Indeed</option>
                                <option selected id="platform-option" value="Monster">Monster</option>
                                <option selected id="platform-option" value="Craigslist">Craigslist</option>
                                <option selected id="platform-option" value="ZipRecruiter">ZipRecruiter</option>
                                <option selected id="platform-option" value="Workopolis">Workopolis</option>
                                <option selected id="platform-option" value="Glassdoor">Glassdoor</option>
                                <option selected id="platform-option" value="YouTube">YouTube</option>
                                <option selected id="platform-option" value="Facebook">Facebook</option>
                                <option selected id="platform-option" value="Another Retail Carrier">Another Retail Carrier</option>
                                <option selected id="platform-option" value="Word of Mouth">Word of Mouth</option>
                                <option selected id="platform-option" value="Google Search">Google Search</option>
                                <option selected id="platform-option" value="TV">TV</option>
                                <option selected id="platform-option" value="Radio">Radio</option>
                                <option selected id="platform-option" value="Newspaper">Newspaper</option>
                                <option selected id="platform-option" value="Brochure">Brochure</option>
                                <option selected id="platform-option" value="Flyer">Flyer</option>
                                <option selected id="platform-option" value="Poster">Poster</option>
                                <option selected id="platform-option" value="Spotify">Spotify</option>
                                <option selected id="platform-option" value="Coffee News">Coffee News</option>
                                <option selected id="platform-option" value="Metro News">Metro News</option>
                                <option selected id="platform-option" value="Applify">Applify</option>
                                <option selected id="platform-option" value="On Campus">On Campus</option>
                            </select>
                          </div>
                </div>
                  
                <div id="platform-underline"></div>
                
                <div id="platform-panel" class="selectpanel">
                    <a href="javascript:selectPlatform('Chilloutlets Platform, 0')"><div class="panel-item focused">Chilloutlets Platform</div></a>
                    <a href="javascript:selectPlatform('Kijiji', 1)"><div class="panel-item">Kijiji</div></a>
                    <a href="javascript:selectPlatform('Indeed', 2)"><div class="panel-item">Indeed</div></a>
                    <a href="javascript:selectPlatform('Monster', 3)"><div class="panel-item">Monster</div></a>
                    <a href="javascript:selectPlatform('Craigslist', 4)"><div class="panel-item">Craigslist</div></a>
                    <a href="javascript:selectPlatform('ZipRecruiter', 5)"><div class="panel-item">ZipRecruiter</div></a>
                    <a href="javascript:selectPlatform('Workopolis', 6)"><div class="panel-item">Workopolis</div></a>
                    <a href="javascript:selectPlatform('Glassdoor', 7)"><div class="panel-item">Glassdoor</div></a>
                    <a href="javascript:selectPlatform('YouTube', 8)"><div class="panel-item">YouTube</div></a>
                    <a href="javascript:selectPlatform('Facebook', 9)"><div class="panel-item">Facebook</div></a>
                    <a href="javascript:selectPlatform('Another Retail Carrier', 10)"><div class="panel-item">Another Retail Carrier</div></a>
                    <a href="javascript:selectPlatform('Word of Mouth', 11)"><div class="panel-item">Word of Mouth</div></a>
                    <a href="javascript:selectPlatform('Google Search', 12)"><div class="panel-item">Google Search</div></a>
                    <a href="javascript:selectPlatform('TV', 13)"><div class="panel-item">TV</div></a>
                    <a href="javascript:selectPlatform('Radio', 14)"><div class="panel-item">Radio</div></a>
                    <a href="javascript:selectPlatform('Newspaper', 15)"><div class="panel-item">Newspaper</div></a>
                    <a href="javascript:selectPlatform('Brochure', 16)"><div class="panel-item">Brochure</div></a>
                    <a href="javascript:selectPlatform('Flyer', 17)"><div class="panel-item">Flyer</div></a>
                    <a href="javascript:selectPlatform('Poster', 18)"><div class="panel-item">Poster</div></a>
                    <a href="javascript:selectPlatform('Spotify', 19)"><div class="panel-item">Spotify</div></a>
                    <a href="javascript:selectPlatform('Coffee News', 20)"><div class="panel-item">Coffee News</div></a>
                    <a href="javascript:selectPlatform('Metro News', 21)"><div class="panel-item">Metro News</div></a>
                    <a href="javascript:selectPlatform('Applify', 22)"><div class="panel-item">Applify</div></a>
                    <a href="javascript:selectPlatform('On Campus', 23)"><div class="panel-item">On Campus</div></a>
                </div>
                      
                
                

                
                
                
                
                
                <div id="platform-title">Choose your date of birth to confirm you are old enough to drive.</div>
                <div class="triple">
                    <div class="triple-one">
                        

                        
                        <div class="custom-select-month">
                            <select id="month-select" name="month">
                              <option value="0">Month</option>
                              <option value="January">January</option>
                              <option value="February">February</option>
                              <option value="March">March</option>
                              <option value="April">April</option>
                              <option value="May">May</option>
                              <option value="June">June</option>
                              <option value="July">July</option>
                              <option value="August">August</option>
                              <option value="September">September</option>
                              <option value="October">October</option>
                              <option value="November">November</option>
                              <option value="December">December</option>
                            </select>
                          </div>
                
                <div id="month-panel" class="selectpanel">
                    <a href="javascript:selectMonthOption('January', 0)"><div class="panel-item focused">January</div></a>
                    <a href="javascript:selectMonthOption('February', 1)"><div class="panel-item">February</div></a>
                    <a href="javascript:selectMonthOption('March', 2)"><div class="panel-item">March</div></a>
                    <a href="javascript:selectMonthOption('April', 3)"><div class="panel-item">April</div></a>
                    <a href="javascript:selectMonthOption('May', 4)"><div class="panel-item">May</div></a>
                    <a href="javascript:selectMonthOption('June', 5)"><div class="panel-item">June</div></a>
                    <a href="javascript:selectMonthOption('July', 6)"><div class="panel-item">July</div></a>
                    <a href="javascript:selectMonthOption('August', 7)"><div class="panel-item">August</div></a>
                    <a href="javascript:selectMonthOption('September', 8)"><div class="panel-item">September</div></a>
                    <a href="javascript:selectMonthOption('October', 9)"><div class="panel-item">October</div></a>
                    <a href="javascript:selectMonthOption('November', 10)"><div class="panel-item">November</div></a>
                    <a href="javascript:selectMonthOption('December', 11)"><div class="panel-item">December</div></a>
                </div>
                      
                


                    </div>
                    <div class="triple-two">

                        
                        
                        <div class="custom-select-day">
                            <select id="day-select" name="day">
                              <option value="0">Day</option>
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="7">7</option>
                              <option value="8">8</option>
                              <option value="9">9</option>
                              <option value="10">10</option>
                              <option value="11">11</option>
                              <option value="12">12</option>
                              <option value="13">13</option>
                              <option value="14">14</option>
                              <option value="15">15</option>
                              <option value="16">16</option>
                              <option value="17">17</option>
                              <option value="18">18</option>
                              <option value="19">19</option>
                              <option value="20">20</option>
                              <option value="21">21</option>
                              <option value="22">22</option>
                              <option value="23">23</option>
                              <option value="24">24</option>
                              <option value="25">25</option>
                              <option value="26">26</option>
                              <option value="27">27</option>
                              <option value="28">28</option>
                              <option value="29">29</option>
                              <option value="30">30</option>
                              <option value="31">31</option>
                            </select>
                          </div>
                
                <div id="day-panel" class="selectpanel">
                    <a href="javascript:selectDayOption('1')"><div class="panel-item focused">1</div></a>
                    <a href="javascript:selectDayOption('2')"><div class="panel-item">2</div></a>
                    <a href="javascript:selectDayOption('3')"><div class="panel-item">3</div></a>
                    <a href="javascript:selectDayOption('4')"><div class="panel-item">4</div></a>
                    <a href="javascript:selectDayOption('5')"><div class="panel-item">5</div></a>
                    <a href="javascript:selectDayOption('6')"><div class="panel-item">6</div></a>
                    <a href="javascript:selectDayOption('7')"><div class="panel-item">7</div></a>
                    <a href="javascript:selectDayOption('8')"><div class="panel-item">8</div></a>
                    <a href="javascript:selectDayOption('9')"><div class="panel-item">9</div></a>
                    <a href="javascript:selectDayOption('10')"><div class="panel-item">10</div></a>
                    <a href="javascript:selectDayOption('11')"><div class="panel-item">11</div></a>
                    <a href="javascript:selectDayOption('12')"><div class="panel-item">12</div></a>
                    <a href="javascript:selectDayOption('13')"><div class="panel-item">13</div></a>
                    <a href="javascript:selectDayOption('14')"><div class="panel-item">14</div></a>
                    <a href="javascript:selectDayOption('15')"><div class="panel-item">15</div></a>
                    <a href="javascript:selectDayOption('16')"><div class="panel-item">16</div></a>
                    <a href="javascript:selectDayOption('17')"><div class="panel-item">17</div></a>
                    <a href="javascript:selectDayOption('18')"><div class="panel-item">18</div></a>
                    <a href="javascript:selectDayOption('19')"><div class="panel-item">19</div></a>
                    <a href="javascript:selectDayOption('20')"><div class="panel-item">20</div></a>
                    <a href="javascript:selectDayOption('21')"><div class="panel-item">21</div></a>
                    <a href="javascript:selectDayOption('22')"><div class="panel-item">22</div></a>
                    <a href="javascript:selectDayOption('23')"><div class="panel-item">23</div></a>
                    <a href="javascript:selectDayOption('24')"><div class="panel-item">24</div></a>
                    <a href="javascript:selectDayOption('25')"><div class="panel-item">25</div></a>
                    <a href="javascript:selectDayOption('26')"><div class="panel-item">26</div></a>
                    <a href="javascript:selectDayOption('27')"><div class="panel-item">27</div></a>
                    <a href="javascript:selectDayOption('28')"><div class="panel-item">28</div></a>
                    <a href="javascript:selectDayOption('29')"><div class="panel-item">29</div></a>
                    <a href="javascript:selectDayOption('30')"><div class="panel-item">30</div></a>
                    <a href="javascript:selectDayOption('31')"><div class="panel-item">31</div></a>
                </div>
                      
                

                    </div>
                    <div class="triple-three">
                        
                        
                        
                        <div class="custom-select-year">
                            <select id="year-select" name="year">
                              <option value="0">Year</option>
                              <option value="1950">1950</option>
                              <option value="1951">1951</option>
                              <option value="1952">1952</option>
                              <option value="1953">1953</option>
                              <option value="1954">1954</option>
                              <option value="1955">1955</option>
                              <option value="1956">1956</option>
                              <option value="1957">1957</option>
                              <option value="1958">1958</option>
                              <option value="1959">1959</option>
                              <option value="1960">1960</option>
                              <option value="1961">1961</option>
                              <option value="1962">1962</option>
                              <option value="1963">1963</option>
                              <option value="1964">1964</option>
                              <option value="1965">1965</option>
                              <option value="1966">1966</option>
                              <option value="1967">1967</option>
                              <option value="1968">1968</option>
                              <option value="1969">1969</option>
                              <option value="1970">1970</option>
                              <option value="1971">1971</option>
                              <option value="1972">1972</option>
                              <option value="1973">1973</option>
                              <option value="1974">1974</option>
                              <option value="1975">1975</option>
                              <option value="1976">1976</option>
                              <option value="1977">1977</option>
                              <option value="1978">1978</option>
                              <option value="1979">1979</option>
                              <option value="1980">1980</option>
                              <option value="1981">1981</option>
                              <option value="1982">1982</option>
                              <option value="1983">1983</option>
                              <option value="1984">1984</option>
                              <option value="1985">1985</option>
                              <option value="1986">1986</option>
                              <option value="1987">1987</option>
                              <option value="1988">1988</option>
                              <option value="1989">1989</option>
                              <option value="1990">1990</option>
                              <option value="1991">1991</option>
                              <option value="1992">1992</option>
                              <option value="1993">1993</option>
                              <option value="1994">1994</option>
                              <option value="1995">1995</option>
                              <option value="1996">1996</option>
                              <option value="1997">1997</option>
                              <option value="1998">1998</option>
                              <option value="1999">1999</option>
                              <option value="2000">2000</option>
                              <option value="2001">2001</option>
                              <option value="2002">2002</option>
                              <option value="2003">2003</option>
                              <option value="2004">2004</option>
                              <option value="2005">2005</option>
                              <option value="2000">2006</option>
                              <option value="2000">2007</option>
                              <option value="2000">2008</option>
                              <option value="2000">2009</option>
                            </select>
                          </div>
                
                <div id="year-panel" class="selectpanel">
                    <a href="javascript:selectYearOption('1950')"><div class="panel-item focused">1950</div></a>
                    <a href="javascript:selectYearOption('1951')"><div class="panel-item">1951</div></a>
                    <a href="javascript:selectYearOption('1952')"><div class="panel-item">1952</div></a>
                    <a href="javascript:selectYearOption('1953')"><div class="panel-item">1953</div></a>
                    <a href="javascript:selectYearOption('1954')"><div class="panel-item">1954</div></a>
                    <a href="javascript:selectYearOption('1955')"><div class="panel-item">1955</div></a>
                    <a href="javascript:selectYearOption('1956')"><div class="panel-item">1956</div></a>
                    <a href="javascript:selectYearOption('1957')"><div class="panel-item">1957</div></a>
                    <a href="javascript:selectYearOption('1958')"><div class="panel-item">1958</div></a>
                    <a href="javascript:selectYearOption('1959')"><div class="panel-item">1959</div></a>
                    <a href="javascript:selectYearOption('1960')"><div class="panel-item">1960</div></a>
                    <a href="javascript:selectYearOption('1961')"><div class="panel-item">1961</div></a>
                    <a href="javascript:selectYearOption('1962')"><div class="panel-item">1962</div></a>
                    <a href="javascript:selectYearOption('1963')"><div class="panel-item">1963</div></a>
                    <a href="javascript:selectYearOption('1964')"><div class="panel-item">1964</div></a>
                    <a href="javascript:selectYearOption('1965')"><div class="panel-item">1965</div></a>
                    <a href="javascript:selectYearOption('1966')"><div class="panel-item">1966</div></a>
                    <a href="javascript:selectYearOption('1967')"><div class="panel-item">1967</div></a>
                    <a href="javascript:selectYearOption('1968')"><div class="panel-item">1968</div></a>
                    <a href="javascript:selectYearOption('1969')"><div class="panel-item">1969</div></a>
                    <a href="javascript:selectYearOption('1970')"><div class="panel-item">1970</div></a>
                    <a href="javascript:selectYearOption('1971')"><div class="panel-item">1971</div></a>
                    <a href="javascript:selectYearOption('1972')"><div class="panel-item">1972</div></a>
                    <a href="javascript:selectYearOption('1973')"><div class="panel-item">1973</div></a>
                    <a href="javascript:selectYearOption('1974')"><div class="panel-item">1974</div></a>
                    <a href="javascript:selectYearOption('1975')"><div class="panel-item">1975</div></a>
                    <a href="javascript:selectYearOption('1976')"><div class="panel-item">1976</div></a>
                    <a href="javascript:selectYearOption('1977')"><div class="panel-item">1977</div></a>
                    <a href="javascript:selectYearOption('1978')"><div class="panel-item">1978</div></a>
                    <a href="javascript:selectYearOption('1979')"><div class="panel-item">1979</div></a>
                    <a href="javascript:selectYearOption('1980')"><div class="panel-item">1980</div></a>
                    <a href="javascript:selectYearOption('1981')"><div class="panel-item">1981</div></a>
                    <a href="javascript:selectYearOption('1982')"><div class="panel-item">1982</div></a>
                    <a href="javascript:selectYearOption('1983')"><div class="panel-item">1983</div></a>
                    <a href="javascript:selectYearOption('1984')"><div class="panel-item">1984</div></a>
                    <a href="javascript:selectYearOption('1985')"><div class="panel-item">1985</div></a>
                    <a href="javascript:selectYearOption('1986')"><div class="panel-item">1986</div></a>
                    <a href="javascript:selectYearOption('1987')"><div class="panel-item">1987</div></a>
                    <a href="javascript:selectYearOption('1988')"><div class="panel-item">1988</div></a>
                    <a href="javascript:selectYearOption('1989')"><div class="panel-item">1989</div></a>
                    <a href="javascript:selectYearOption('1990')"><div class="panel-item">1990</div></a>
                    <a href="javascript:selectYearOption('1991')"><div class="panel-item">1991</div></a>
                    <a href="javascript:selectYearOption('1992')"><div class="panel-item">1992</div></a>
                    <a href="javascript:selectYearOption('1993')"><div class="panel-item">1993</div></a>
                    <a href="javascript:selectYearOption('1994')"><div class="panel-item">1994</div></a>
                    <a href="javascript:selectYearOption('1995')"><div class="panel-item">1995</div></a>
                    <a href="javascript:selectYearOption('1996')"><div class="panel-item">1996</div></a>
                    <a href="javascript:selectYearOption('1997')"><div class="panel-item">1997</div></a>
                    <a href="javascript:selectYearOption('1998')"><div class="panel-item">1998</div></a>
                    <a href="javascript:selectYearOption('1999')"><div class="panel-item">1999</div></a>
                    <a href="javascript:selectYearOption('2000')"><div class="panel-item">2000</div></a>
                    <a href="javascript:selectYearOption('2001')"><div class="panel-item">2001</div></a>
                    <a href="javascript:selectYearOption('2002')"><div class="panel-item">2002</div></a>
                    <a href="javascript:selectYearOption('2003')"><div class="panel-item">2003</div></a>
                    <a href="javascript:selectYearOption('2004')"><div class="panel-item">2004</div></a>
                    <a href="javascript:selectYearOption('2005')"><div class="panel-item">2005</div></a>
                    <a href="javascript:selectYearOption('2006')"><div class="panel-item">2006</div></a>
                    <a href="javascript:selectYearOption('2007')"><div class="panel-item">2007</div></a>
                    <a href="javascript:selectYearOption('2008')"><div class="panel-item">2008</div></a>
                    <a href="javascript:selectYearOption('2009')"><div class="panel-item">2009</div></a>
                </div>
                      
                
                        
                    </div>
                </div>
                <div id="dob-underline"></div>
                
                
                
                
                
                <br>
                
                
                
        <p>
            <label class="container">I have read, understand, and agree to the Carrier Agreement,<br>Privacy Policy, 
                and Terms of Service. By proceeding, I agree <br> that 
                Chilloutlets or its representatives may contact me by <br> email, phone, or
                SMS at the email address or phone number <br> I provide, including for marketing purposes.
                <input type="radio" name="agreed">
                <span class="checkmark"></span>
              </label>
        </p>
                


                </div>

            </form>


                <a id="redbutton" href="javascript:submitForm()">
                <div class="redclickarea">
                    <div class="redclicker">CONTINUE</div>
                </div>
                </a>
                
            </div>
            
            
        </div>
        
        </div>
                                        
                                        
                                        
                                        <div class="login-modal" id="login-modal">
                                            
                                            <div id='logindrop' class="logindrop">
                                            
                                                
                                                <div class="triangle"></div>
                                                
                                   
                                                
                                                <div class='drop-nav'>
                                                    
                                                    <a href="javascript:login()">
                                                    <div class='drop-nav-login'>
                                                    
                                                        <span>LOG IN</span>
                                                    
                                                    </div>
                                                    </a>
                                                    <a href="#">
                                                    <div class='drop-nav-register'>
                                                    
                                                      
                                                    
                                                    </div>
                                                    </a>
                                                    
                                                </div>
                                                <div class='drop-body'>
                                                    
                                                    <div class='drop-body-login'>
                                                        
                                                        <div id='login-message'></div>
                                                        
                                                        <form hidden id="login-submit-form" method='post' action="../CarrierLoginServlet">
                                                    
                                                                    <input height="30px" id="carrier-email" name="carrier-email" type="email" placeholder="Email address" />
                                                                
                                                                <input height="30px" id="carrier-password" name="carrier-password" type="password" placeholder="Password" />
                                                                
                                                        </form>
                                                        
                                                        <form  action="javascript:validateCarrierLogin()">
                                                            
                                                                <div class="credentials">   
                                                                    <input height="30px" id="carrier-email-validate" name="carrier-email-validate" type="email" placeholder="Email address" />
                                                                
                                                                <br>
                                                                <input height="30px" id="carrier-password-validate" name="carrier-password-validate" type="password" placeholder="Password" />
                                                                </div>
                                                                <div class="redclickarea">
                                                                    <button class="redclicker">LOG IN</button>
                                                                </div>
                                                    
                                                        </form>
                                                        
                                                    </div>
                                                    

                                                    
                                                </div>
                                            
                                     
            
            
                                            
                             
                                                
                                        </div>
                                        </div>
        
         
        
<script src="https://www.gstatic.com/firebasejs/5.7.0/firebase.js"></script>
<script>
  
  
  
  // Initialize Firebase
  var config = {
    
        apiKey: "AIzaSyBj875J0Q7SXR1a5Eg4e2SiycuIUexQuig",
    authDomain: "chilloutlets-carrier.firebaseapp.com",
    databaseURL: "https://chilloutlets-carrier.firebaseio.com",
    projectId: "chilloutlets-carrier",
    storageBucket: "chilloutlets-carrier.appspot.com",
    messagingSenderId: "789603527218"
  };
  
  firebase.initializeApp(config);
  
  
  
</script>
        
        
<script type="text/javascript">

        
            
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
            
            //var dash = document.getElementById('dash-first-name');
            //var splash = document.getElementById('splash-first-name');
                    
                    
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
                    }
                    
                    function validateCarrierLogin()
                    
                    {
                        document.getElementById("carrier-email").value = document.getElementById("carrier-email-validate").value;
                        document.getElementById("carrier-password").value = document.getElementById("carrier-password-validate").value;
                        document.getElementById("login-submit-form").submit();
                    }
            
            window.onclick = function(event)
            
            {
                if (event.target === loginModal)
                    
                {
                    loginModal.style.zIndex = "10";
                    loginModal.style.position = "absolute";
                    loginModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                    loginModal.style.paddingTop = "50px";
                    loginDrop.style.display = "none";
                }
                
            };
            
            
            
            
            function submitForm()
            
            {
                var allConditionsMet = true;
                
                var firstName = document.getElementById("first-name").value;
                var lastName = document.getElementById("last-name").value;
                var email = document.getElementById("email").value;
                var password = document.getElementById("password").value;
                
                
                if (firstName !== "" && lastName !== "" && email !== "" && password !== "")
                    
                {
                    //run all keyup tests hereafter
                    //first name
                    
                        var nameRe = /([a-zA-Z0-9\-])(?=.{1,})/;
                        var specials = /^[^*|\":<>^[\]{}`\\();@%#!&$]+$/;
                            
                            if (!nameRe.test(document.getElementById("first-name").value))
                            
                            {
                                document.getElementById("splash-first-name").innerHTML = "Please enter more than one character.";
                                document.getElementById("splash-first-name").style.display = "block";
                                allConditionsMet = false;
                            }
                            
                            else
                                
                            {
                                if (!specials.test(document.getElementById("first-name").value))
                                    
                                {
                                    document.getElementById("splash-first-name").innerHTML = "First name should not include any special characters.";
                                    document.getElementById("splash-first-name").style.display = "block";
                                    allConditionsMet = false;
                                }
                                
                                else
                                
                                {
                                    document.getElementById("splash-first-name").innerHTML = "";
                                    document.getElementById("splash-first-name").style.display = "block";
                                    allConditionsMet = true;
                                }
                                
                            }
                            
                            
                            //last name
                            if (!nameRe.test(document.getElementById("last-name").value))
                            
                            {
                                document.getElementById("splash-last-name").innerHTML = "Please enter more than one character.";
                                document.getElementById("splash-last-name").style.display = "block";
                                allConditionsMet = false;
                            }
                            
                            else
                                
                            {
                                if (!specials.test(document.getElementById("last-name").value))
                                    
                                {
                                    document.getElementById("splash-last-name").innerHTML = "Last name should not include any special characters.";
                                    document.getElementById("splash-last-name").style.display = "block";
                                    allConditionsMet = false;
                                }
                                
                                else
                                
                                {
                                    document.getElementById("splash-last-name").innerHTML = "";
                                    document.getElementById("splash-last-name").style.display = "block";
                                    allConditionsMet = true;
                                }
                                
                            }
                        
            
            
                
                
                        var emailRe = /([a-zA-Z0-9_])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})/;
                            
                            if (!emailRe.test(document.getElementById("email").value))
                            
                            {
                                document.getElementById("splash-email").innerHTML = "Please enter a valid email address.";
                                document.getElementById("splash-email").style.display = "block";
                                allConditionsMet = false;
                            }
                            
                            else
                                
                            {
                                document.getElementById("splash-email").innerHTML = "";
                                document.getElementById("splash-email").style.display = "block";
                                allConditionsMet = true;
                            }
                        
                
            
            
                
                        var mediumRegex = /^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})/;
                        var strongRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/;
                            
                            if (!strongRegex.test(document.getElementById("password").value))
                            
                            {
                                document.getElementById("splash-password").innerHTML = "At least 8 characters, 1 upper, 1 lower, 1 number, 1 special character.";
                                document.getElementById("splash-password").style.display = "block";
                                allConditionsMet = false;
                            }
                            
                            else
                                
                            {
                                document.getElementById("splash-password").innerHTML = "";
                                document.getElementById("splash-password").style.display = "block";
                                allConditionsMet = true;
                            }
                        
                
            
                            
                            
                        
                    
                    if (allConditionsMet)
                        
                    {
                        document.getElementById('step1of2').style.display = "none";
                        document.getElementById('step2of2').style.display = "block";
                        document.getElementById('redbutton').href = "javascript:signUp()";
                        document.getElementsByClassName('redclicker')[0].innerHTML = "REGISTER";
                    }
                    
                }
                
                else
                    
                {
                    if (firstName === "")
                        
                    {
                        document.getElementById("splash-first-name").innerHTML = "Please fill in your first name.";
                        document.getElementById("splash-first-name").style.display = "block";
                    }
                    
                    if (lastName === "")
                        
                    {
                        document.getElementById("splash-last-name").innerHTML = "Please fill in your last name.";
                        document.getElementById("splash-last-name").style.display = "block";
                    }
                    
                    if (email === "")
                        
                    {
                        document.getElementById("splash-email").innerHTML = "Please fill in your preferred contact email address.";
                        document.getElementById("splash-email").style.display = "block";
                        
                        var re = /([a-zA-Z0-9_])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})/;
                            
                            if (!re.test(email))
                            
                            {
                                document.getElementById("splash-email").innerHTML = "Please enter a valid email address.";
                                document.getElementById("splash-email").style.display = "block";
                            }
                        
                    }
                    
                    if (password === "")
                        
                    {
                        document.getElementById("splash-password").innerHTML = "Please fill in your preferred password.";
                        document.getElementById("splash-password").style.display = "block";
                    }
                    
                }
                
            }
            
            function signUp()
            
            {
                    
                    document.getElementById('sign-up-form').submit();
                    
            }
            
            function selectPlatform(passed, position)
            
            {
                    var platformPanel = document.getElementById("platform-panel");
                    
                    var count = position;
                    
                    var c = document.getElementsByClassName("selected-option-platform")[count];
                    c.click();
                    
                    platformPanel.style.display = "none";
            }
            
            function selectCityOption(passed, position)
            
            {
                alert("ready");
                    var platformPanel = document.getElementById("city-panel");
                    alert("in city panel!");
                    var count = position;
                    alert("ready to c click!");
                    var c = document.getElementsByClassName("selected-option-city")[count];
                    c.click();
                    alert("c clicked!");
                    platformPanel.style.display = "none";
            }
            
            function selectMonthOption(passed, position)
            
            {
                    var platformPanel = document.getElementById("month-panel");
                    
                    var count = position;
                    
                    var c = document.getElementsByClassName("selected-option-month")[count];
                    c.click();
                    
                    platformPanel.style.display = "none";
            }
            
            function selectDayOption(passed)
            
            {
                    var platformPanel = document.getElementById("day-panel");
                    
                    var count = parseInt(passed) - 1;
                    
                    var c = document.getElementsByClassName("selected-option-day")[count];
                    c.click();
                    
                    platformPanel.style.display = "none";
            }
            
            function selectYearOption(passed)
            
            {
                    var platformPanel = document.getElementById("year-panel");
                    
                    var count = parseInt(passed) - 1950;
                    
                    var c = document.getElementsByClassName("selected-option-year")[count];
                    c.click();
                    
                    platformPanel.style.display = "none";
            }
    
            
            function validateEmail(email) 
            
            {
                var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return re.test(email);
            }
            
            function validate() 

            {
                var $result = $("#result");
                var email = $("#email").val();
                $result.text("");

                if (validateEmail(email)) {
                  $result.text(email + " is valid :)");
                  $result.css("color", "green");
                } else {
                  $result.text(email + " is not valid :(");
                  $result.css("color", "red");
                }
                return false;
              }
      
      $("#validate").bind("click", validate);
            
            
            checkbt = document.getElementById("check");
passtxt = document.getElementById("password");
respuesta = document.getElementById("respuesta");

check = function(){
    texto = passtxt.value.trim();
    uppercase = false;
    lowercase = false;
    number = false;
    lenght = false;
    //uppercase letter    
    for (i=0; i< texto.length; i++){
        if (texto[i] == texto[i].toUpperCase()){
            uppercase = true;
            break;
        } else {
            uppercase = false;
        }
    }
//lowercase
        for (i=0; i< texto.length; i++){
            if (texto[i] == texto[i].toLowerCase()){
                lowercase = true;
                break;
            } else {
                lowercase = false;
            }
        }

    //number
        for (i=0; i< texto.length; i++){
            if (!isNaN(texto[i])){
                number = true;
                break;
            } else {
                number = false;
            }
        }    


    if (texto.length < 6){
        lenght = false;
    } else {
        lenght = true;
    }

    if (lowercase && uppercase && number && lenght){
        respuesta.innerHTML = "Password is good";    
    } else {
        respuesta.innerHTML = "Password is bad <br />" +
        "lowercase: " + boolstr(lowercase) + "<br />"+
        "uppercase: " + boolstr(uppercase) + "<br />"+
        "number: " + boolstr(number) + "<br />"+
        "lenght: " + boolstr(lenght) + "<br />";
    }

}





//Platform Panel Selector...
            
            var x, i, j, selElmnt, a, b, c;
            
            
            /*look for any elements with the class "custom-select":*/
            x = document.getElementsByClassName("custom-select");
            
            
            for (i = 0; i < x.length; i++) 
            
            {
              selElmnt = x[i].getElementsByTagName("select")[0];
              var counter = i;
              
              /*for each element, create a new DIV that will act as the selected item:*/
              a = document.createElement("DIV");
              a.setAttribute("class", "select-selected");
              a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
              x[i].appendChild(a);
              
              
              /*for each element, create a new DIV that will contain the option list:*/
              b = document.createElement("DIV");
              b.setAttribute("class", "select-items select-hide");
              
              
              for (j = 1; j < selElmnt.length; j++) 
              
              {
                /*for each option in the original select element,
                create a new DIV that will act as an option item:*/
                c = document.createElement("DIV");
                c.setAttribute("class", "selected-option-platform");
                c.innerHTML = selElmnt.options[j].innerHTML;
                
                
                c.addEventListener("click", function(e) 
                
                {
                    /*when an item is clicked, update the original select box,
                    and the selected item:*/
        
                    
                    var y, i, k, s, h;
                    
                    s = this.parentNode.parentNode.getElementsByTagName("select")[0];
                    h = this.parentNode.previousSibling;
                    
                    
                    for (i = 0; i < s.length; i++) 
                    
                    {
                        
                      if (s.options[i].innerHTML == this.innerHTML) 
                      
                        {
                        s.selectedIndex = i;
                        h.innerHTML = this.innerHTML;
                        
                        /*
                        y = this.parentNode.getElementsByClassName("same-as-selected");
                        
                        
                        for (k = 0; k < y.length; k++) 
                        
                        {
                          y[k].removeAttribute("class");
                        }
                        this.setAttribute("class", "same-as-selected");
                        */
                        
                        break;
                      }
                    }
                    h.click();
                });
                
                b.appendChild(c);
                
              }
              
              
              
              x[i].appendChild(b);
              a.addEventListener("click", function(e) {
                  /*when the select box is clicked, close any other select boxes,
                  and open/close the current select box:*/
                  document.getElementById("platform-panel").style.display = "block";
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
            
            
            
            





//City Panel Selector...
            
            var x, i, j, selElmnt, a, b, c;
            
            
            /*look for any elements with the class "custom-select":*/
            x = document.getElementsByClassName("custom-select-city");
            
            
            for (i = 0; i < x.length; i++) 
            
            {
              selElmnt = x[i].getElementsByTagName("select")[0];
              var counter = i;
              
              /*for each element, create a new DIV that will act as the selected item:*/
              a = document.createElement("DIV");
              a.setAttribute("class", "select-selected");
              a.setAttribute("id", "select-selected-city");
              a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
              x[i].appendChild(a);
              
              
              /*for each element, create a new DIV that will contain the option list:*/
              b = document.createElement("DIV");
              b.setAttribute("class", "select-items select-hide");
              
              
              for (j = 1; j < selElmnt.length; j++) 
              
              {
                /*for each option in the original select element,
                create a new DIV that will act as an option item:*/
                c = document.createElement("DIV");
                c.setAttribute("class", "selected-option-city");
                c.innerHTML = selElmnt.options[j].innerHTML;
                
                
                c.addEventListener("click", function(e) 
                
                {
                    /*when an item is clicked, update the original select box,
                    and the selected item:*/
                    alert("city has been clicked!");
                    
                    var y, i, k, s, h;
                    
                    s = this.parentNode.parentNode.getElementsByTagName("select")[0];
                    h = this.parentNode.previousSibling;
                    
                    
                    for (i = 0; i < s.length; i++) 
                    
                    {
                        
                      if (s.options[i].innerHTML == this.innerHTML) 
                      
                        {
                        s.selectedIndex = i;
                        h.innerHTML = this.innerHTML;
                        s.options[i].value = this.innerHTML;
                        
                        /*
                        y = this.parentNode.getElementsByClassName("same-as-selected");
                        
                        
                        for (k = 0; k < y.length; k++) 
                        
                        {
                          y[k].removeAttribute("class");
                        }
                        this.setAttribute("class", "same-as-selected");
                        */
                        
                        break;
                      }
                    }
                    h.click();
                    alert("h clicked!");
                });
                
                b.appendChild(c);
                
              }
              
              
              
              x[i].appendChild(b);
              a.addEventListener("click", function(e) {
                  /*when the select box is clicked, close any other select boxes,
                  and open/close the current select box:*/
                  document.getElementById("city-panel").style.display = "block";
                  //alert("city panel opened");
                  retrieveServiceAreas();
                  //alert("service areas retrieved");
                  e.stopPropagation();
                  //alert("propagation stopped");
                  closeAllSelect(this);
                  //alert("all select closed");
                  this.nextSibling.classList.toggle("select-hide");
                  alert("sibling toggled");
                  this.classList.toggle("select-arrow-active");
                  alert("class toggled");
                        
                });
                
                
                
                var cityInput = document.getElementById("city");
                
                
                cityInput.addEventListener("keyup", function(e) {
                  /*when the select box is clicked, close any other select boxes,
                  and open/close the current select box:*/
                  //alert("keyup");
                  e.stopImmediatePropagation();
                  e.target.removeEventListener("keyup");
                  a = document.getElementById("select-selected-city");
                  //alert("got a");
                  a.click();
                  //alert("a clicked");
                }); 
                
                cityInput.addEventListener("focusout", function(e) {
                  /*when the select box is clicked, close any other select boxes,
                  and open/close the current select box:*/
                  document.getElementById("city-panel").style.display = "none";
                });
                
                let hasCompleted = false;
                
                cityInput.addEventListener("focus", function(e) {
                  /*when the select box is clicked, close any other select boxes,
                  and open/close the current select box:*/
                  
                  a = document.getElementById("select-selected-city");
                  
                  //alert("got a");
                  a.click();
                  e.preventDefault();
                  e.target.removeEventListener("focus");
                  //alert("class toggled");
                  /*
                  if (hasCompleted === false)
                      
                {
                    
                    hasCompleted = true;
                } */
                  
                });
                
            }
            
            
            
            
            
            
            





//Month Panel Selector...
            
            var x, i, j, selElmnt, a, b, c;
            
            
            /*look for any elements with the class "custom-select":*/
            x = document.getElementsByClassName("custom-select-month");
            
            
            for (i = 0; i < x.length; i++) 
            
            {
              selElmnt = x[i].getElementsByTagName("select")[0];
              var counter = i;
              
              /*for each element, create a new DIV that will act as the selected item:*/
              a = document.createElement("DIV");
              a.setAttribute("class", "select-selected");
              a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
              x[i].appendChild(a);
              
              
              /*for each element, create a new DIV that will contain the option list:*/
              b = document.createElement("DIV");
              b.setAttribute("class", "select-items select-hide");
              
              
              for (j = 1; j < selElmnt.length; j++) 
              
              {
                /*for each option in the original select element,
                create a new DIV that will act as an option item:*/
                c = document.createElement("DIV");
                c.setAttribute("class", "selected-option-month");
                c.innerHTML = selElmnt.options[j].innerHTML;
                
                
                c.addEventListener("click", function(e) 
                
                {
                    /*when an item is clicked, update the original select box,
                    and the selected item:*/
        
                    
                    var y, i, k, s, h;
                    
                    s = this.parentNode.parentNode.getElementsByTagName("select")[0];
                    h = this.parentNode.previousSibling;
                    
                    
                    for (i = 0; i < s.length; i++) 
                    
                    {
                        
                      if (s.options[i].innerHTML == this.innerHTML) 
                      
                        {
                        s.selectedIndex = i;
                        h.innerHTML = this.innerHTML;
                        
                        /*
                        y = this.parentNode.getElementsByClassName("same-as-selected");
                        
                        
                        for (k = 0; k < y.length; k++) 
                        
                        {
                          y[k].removeAttribute("class");
                        }
                        this.setAttribute("class", "same-as-selected");
                        */
                        
                        break;
                      }
                    }
                    h.click();
                });
                
                b.appendChild(c);
                
              }
              
              
              
              x[i].appendChild(b);
              a.addEventListener("click", function(e) {
                  /*when the select box is clicked, close any other select boxes,
                  and open/close the current select box:*/
                  document.getElementById("month-panel").style.display = "block";
                  e.stopPropagation();
                  closeAllSelect(this);
                  this.nextSibling.classList.toggle("select-hide");
                  this.classList.toggle("select-arrow-active");
                });
            }
            
            
            
            
            
            
            
            





//Day Panel Selector...
            
            var x, i, j, selElmnt, a, b, c;
            
            
            /*look for any elements with the class "custom-select":*/
            x = document.getElementsByClassName("custom-select-day");
            
            
            for (i = 0; i < x.length; i++) 
            
            {
              selElmnt = x[i].getElementsByTagName("select")[0];
              var counter = i;
              
              /*for each element, create a new DIV that will act as the selected item:*/
              a = document.createElement("DIV");
              a.setAttribute("class", "select-selected");
              a.setAttribute("id", "select-selected-day");
              a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
              x[i].appendChild(a);
              
              
              /*for each element, create a new DIV that will contain the option list:*/
              b = document.createElement("DIV");
              b.setAttribute("class", "select-items select-hide");
              
              
              for (j = 1; j < selElmnt.length; j++) 
              
              {
                /*for each option in the original select element,
                create a new DIV that will act as an option item:*/
                c = document.createElement("DIV");
                c.setAttribute("class", "selected-option-day");
                c.innerHTML = selElmnt.options[j].innerHTML;
                
                
                
                c.addEventListener("click", function(e) 
                
                {
                    /*when an item is clicked, update the original select box,
                    and the selected item:*/
        
                    
                    var y, i, k, s, h;
                    
                    s = this.parentNode.parentNode.getElementsByTagName("select")[0];
                    h = this.parentNode.previousSibling;
                    
                    
                    for (i = 0; i < s.length; i++) 
                    
                    {
                        
                      if (s.options[i].innerHTML == this.innerHTML) 
                      
                        {
                        s.selectedIndex = i;
                        h.innerHTML = this.innerHTML;
                        
                        /*
                        y = this.parentNode.getElementsByClassName("same-as-selected");
                        
                        
                        for (k = 0; k < y.length; k++) 
                        
                        {
                          y[k].removeAttribute("class");
                        }
                        this.setAttribute("class", "same-as-selected");
                        */
                        
                        break;
                      }
                    }
                    h.click();
                });
                
                b.appendChild(c);
                
              }
              
              
              
              
              x[i].appendChild(b);
              a.addEventListener("click", function(e) {
                  /*when the select box is clicked, close any other select boxes,
                  and open/close the current select box:*/
                  document.getElementById("day-panel").style.display = "block";
                  e.stopPropagation();
                  closeAllSelect(this);
                  this.nextSibling.classList.toggle("select-hide");
                  this.classList.toggle("select-arrow-active");
                });
            }
            
            
            
            
            
            
            
            





//Year Panel Selector...
            
            var x, i, j, selElmnt, a, b, c;
            
            
            /*look for any elements with the class "custom-select":*/
            x = document.getElementsByClassName("custom-select-year");
            
            
            for (i = 0; i < x.length; i++) 
            
            {
              selElmnt = x[i].getElementsByTagName("select")[0];
              var counter = i;
              
              /*for each element, create a new DIV that will act as the selected item:*/
              a = document.createElement("DIV");
              a.setAttribute("class", "select-selected");
              a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
              x[i].appendChild(a);
              
              
              /*for each element, create a new DIV that will contain the option list:*/
              b = document.createElement("DIV");
              b.setAttribute("class", "select-items select-hide");
              
              
              for (j = 1; j < selElmnt.length; j++) 
              
              {
                /*for each option in the original select element,
                create a new DIV that will act as an option item:*/
                c = document.createElement("DIV");
                c.setAttribute("class", "selected-option-year");
                c.innerHTML = selElmnt.options[j].innerHTML;
                
                
                c.addEventListener("click", function(e) 
                
                {
                    /*when an item is clicked, update the original select box,
                    and the selected item:*/
        
                    
                    var y, i, k, s, h;
                    
                    s = this.parentNode.parentNode.getElementsByTagName("select")[0];
                    h = this.parentNode.previousSibling;
                    
                    
                    for (i = 0; i < s.length; i++) 
                    
                    {
                        
                      if (s.options[i].innerHTML == this.innerHTML) 
                      
                        {
                        s.selectedIndex = i;
                        h.innerHTML = this.innerHTML;
                        
                        /*
                        y = this.parentNode.getElementsByClassName("same-as-selected");
                        
                        
                        for (k = 0; k < y.length; k++) 
                        
                        {
                          y[k].removeAttribute("class");
                        }
                        this.setAttribute("class", "same-as-selected");
                        */
                        
                        break;
                      }
                    }
                    h.click();
                });
                
                b.appendChild(c);
                
              }
              
              
              
              x[i].appendChild(b);
              a.addEventListener("click", function(e) {
                  /*when the select box is clicked, close any other select boxes,
                  and open/close the current select box:*/
                  document.getElementById("year-panel").style.display = "block";
                  e.stopPropagation();
                  closeAllSelect(this);
                  this.nextSibling.classList.toggle("select-hide");
                  this.classList.toggle("select-arrow-active");
                });
            }
            
            
            
            
            
            
            
            
            
            
            
            
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
            
    
    
    function retrieveServiceAreas()
    
    {
        var searchCriteria = document.getElementById("city").value;
        
        var xml = new XMLHttpRequest();
        
        
          xml.onreadystatechange = function() {
              
              if (xml.readyState === 4)
              
              {
                  
                  if (xml.status === 200)

                  {
                      var counter = 0;
                      
                      
                      //call message content div again
                      //msgContentDiv = window.parent.document.getElementById("msg_body_content");
                      
                      var cities = xml.responseXML.getElementsByTagName("Cities")[0];
                      cities = cities.getElementsByTagName("City");
                      //alert("city response " + xml.responseText);
                      
                      document.getElementById("city-panel").innerHTML = "";
                      //document.getElementById("cselect").innerHTML = "<option selected value=\"0\">&nbsp;</option>";
                      
                      var panel = document.getElementById("city-panel");
                      var dropdown = document.getElementById("cselect");
                      
                      
                      for (counter = 0; counter < cities.length; counter++)
                          
                        {
                            var city = cities[counter];
                            var cityNumber = city.getElementsByTagName("cityNumber")[0].firstChild.nodeValue;
                            var cityName = city.getElementsByTagName("cityName")[0].firstChild.nodeValue;
                            
                            //var panelin = "<a href=\"javascript:selectCityOption('" + cityName + "', " + counter + ")\"><div class=\"panel-item\">Winnipeg</div></a>";
                            //var dropdownin = "<option selected value=\"" + cityName + "\">" + cityName + "</option>";
                            
                            var a2 = document.createElement("DIV");
                            a2.setAttribute("class", "panel-item");
                            a2.innerHTML = cityName;
                            
                            var newlink = document.createElement('a');
                            newlink.setAttribute("href", 'javascript:selectCityOption(\'' + cityName + '\', ' + counter +')');
                            
                            newlink.appendChild(a2);
                            panel.appendChild(newlink);
                            
                            /*
                            var opt = document.createElement("option");
                            opt.text = cityName;
                            opt.value = cityName;
                            dropdown.add(opt);
                            */
                           
                           var serviceArea = document.getElementsByClassName("selected-option-city")[counter];
                           serviceArea.innerHTML = cityName;
                            
                            dropdown.options[counter].innerHTML = cityName;
                            dropdown.options[counter].value = cityName;
                            
                           // alert("option inserted!");
                            //panel += panelin;
                            //dropdown += dropdownin;
                            
                        } 
                        
                        
                        
                      
                  }
                  
                  //alert(xml.readyState + " " + xml.status);
                  
              }
              
          }; 
          
          var post = "searchCriteria=" + searchCriteria;

          xml.open("GET", "../ServiceAreaServlet?" + post, true);
          xml.send();
          
    }
            



</script>
        
    </body>
</html>
