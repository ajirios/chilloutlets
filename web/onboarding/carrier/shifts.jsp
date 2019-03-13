<%-- 
    Document   : shifts
    Created on : 19-Dec-2018, 3:48:35 AM
    Author     : mac
--%>

<%@page import='com.mysql.jdbc.Driver' %>
<%@page import="carrier.CarrierRetrieve"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shifts</title>
        <link rel="shortcut icon" type="image/png" href="../../images/chilliredup.png"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
		<link rel="stylesheet" href="assets/css/main.css" />
        <meta name="viewport" content="initial-scale=1.0">
            <meta charset="utf-8">
                <style>
                
                    
                body, html
                {
                    width: 100%;
                    margin: 0;
                }
                
                header
                {
                    background: #e00b00;
                    color: #fff;
                    font-family: Roboto;
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
            
            .caret-holder
            {
                width: 20px;
                height: 100%;
                font-size: 12px;
                margin-left: 5px;
                float: left;
            }
            
            .text-holder
            {
                width: calc(100% - 25px);
                height: 100%;
                font-size: 13px;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                float: left;
            }
                
                .ground
                {
                    width: 100%;
                    min-height: 900px;
                    margin-top: 0px;
                    //background-color: #f5f5f5;
                    //background-image: url("/outlets/drive.jpg");
                    //background-size: cover;
                }
                
                .step-holder
                {
                    width: 100%;
                    height: 250px;
                    margin-top: 90px;
                    padding-top: 50px;
                    padding-left: auto;
                    padding-right: auto;
                    background-color: #fbfbfb;
                    border-bottom: 2px solid #e00b00;
                }
                
                .step-header
                {
                    width: 100%;
                    height: 40px;
                    margin-top: 0px;
                    padding-top: 0px;
                    padding-left: auto;
                    padding-right: auto;
                    text-align: center;
                    font-size: 27px;
                }
                
                .step-body
                {
                    width: 1000px;
                    height: 40px;
                    margin-top: 30px;
                    padding-top: 0px;
                    margin-left: auto;
                    margin-right: auto;
                }
                
                .step
                {
                    width: 200px;
                    height: 40px;
                    padding-left: 65px;
                    padding-right: 65px;
                    float: left;
                }
                
                .step-round
                {
                    width: 20px;
                    height: 20px;
                    border-radius: 10px;
                    background-color: #ddd;
                    text-align: center;
                    padding-top: 1px;
                    color: white;
                    float: left;
                }
                
                .step-section
                {
                    width: 70px;
                    height: 20px;
                    color: #ccc;
                    text-align: center;
                    padding-top: 1px;
                    float: left;
                }
                
                .step-line
                {
                    width: 60px;
                    height: 20px;
                    border-top: 8px solid white;
                    border-bottom: 8px solid white;
                    background-color: #ddd;
                    color: white;
                    float: left;
                }
                
                .current
                {
                    color: #000;
                }
                
                .current-back
                {
                    background-color: #e00b00;
                }
                
                .completed
                {
                    color: #e00b00;
                }
                
                .paper
                {
                    width: 500px;
                    height: 900px;
                    top: 270px;
                    margin-left: calc(50% - 250px);
                    //margin-right: auto;
                    background-color: white;
                    z-index: 2;
                    position: absolute;
                    box-shadow: 0 3px 12px #444;
                    padding: 50px;
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
            
            .work-permit
            {
                display: block;
                width: 400px;
                height: 600px;
                padding: 0 40px;
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

                .welcome-header
                {
                    width: 100%;
                    height: 75px;
                    border-bottom:15px solid #e00b00;
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
                
                .license-percent-left
                {
                    width: 20%;
                    height: 3px;
                    background-color: #e00b00;
                    float: left;
                }
                
                .license-percent-right
                {
                    width: 80%;
                    height: 3px;
                    background-color: #eee;
                    float: left;
                }
                
                .license-uploader
                {
                    width: 100%;
                    height: 180px;
                    background-color: #eee;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    background-image: url('');
                    background-size: cover;
                }
                
                .license-uploader > img
                {
                    max-width:100%;
                    max-height:100%;
                }
                
                .instructions
                {
                    min-height: 50px;
                }
                
                .permit-percent-left
                {
                    width: 100%;
                    height: 3px;
                    background-color: #e00b00;
                    float: left;
                }
                
                .permit-percent-right
                {
                    width: 0%;
                    height: 3px;
                    background-color: #eee;
                    float: left;
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
                height: 120px;
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
            
            .drop-logout
            {
                display: block;
                height: 120px;
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
            
            .shift-week
            {
                display: block;
                height: 30px;
                width: 1100px;
                margin-top: 40px;
                margin-left: auto;
                margin-right: auto;
                margin-bottom: 20px;
                font-size: 25px;
                text-align: center;
                //background-color: #fafafa;
            }
            
            .shift
            {
                display: block;
                height: 900px;
                width: 1100px;
                margin-top: 50px;
                margin-left: auto;
                margin-right: auto;
                //background-color: #fafafa;
            }
            
            .dayschedule
            {
                display: block;
                height: 90px;
                width: 1100px;
                margin-top: 20px;
                margin-left: 0;
                margin-right: 0;
            }
            
            .dayschedule-setting
            {
                height: 90px;
                width: 160px;
                //margin-top: 20px;
                margin-left: 0;
                margin-right: 0;
                float: left;
            }
            
            .dayschedule-slider
            {
                height: 45px;
                width: 780px;
                margin-left: 20px;
                margin-right: 20px;
                float: left;
            }
            
            .slider-pan
            {
                height: 25px;
                width: 780px;
                background-color: #eee;
            }
            
            .slider-label
            {
                height: 20px;
                width: 780px;
                color: #aaa;
                font-size: 10px;
            }
            
            .slider-label-time
            {
                width: 32.5px;
                height: 20px;
                text-align: left;
                float: left;
            }
            
            .turn-off-day
            {
                height: 25px;
                width: 50px;
                //margin-top: 20px;
                margin-left: 0;
                margin-right: 0;
                float: left;
            }
            
            .turn-off-title
            {
                height: 25px;
                width: 70px;
                //margin-top: 20px;
                margin-left: 0;
                margin-right: 0;
                float: left;
            }
            
            .day-setting-day
            {
                
            }
            
            .day-setting-init
            {
                
            }
            
            .day-setting-end
            {
                
            }
                
                
                
                
                
                
                </style>
    </head>
    <body>
        
        
        <%
            
            
            double step;
            String accountName = "LOGOUT";
            
            long carrierID = 0;
            
            if (session.getAttribute("carrier-id") != null)
            
            {
                carrierID = Long.parseLong(session.getAttribute("carrier-id").toString());
            }
            
            
            CarrierRetrieve carrier = new CarrierRetrieve(carrierID);
            
            //String accountStatus = session.getAttribute("account-status").toString();
            //String onboardingStep = null;
            
            
            if (carrier != null)
                
            {
                if (carrier.getOnboardingStep() != 0.0)
                    
                {
                    
                    step = carrier.getOnboardingStep();
                    accountName = carrier.getCarrierFirstName() + " " + carrier.getCarrierLastName() + " " + carrier.getCarrierMiddleName();
                    
                }
                
                else
                    
                {
                    step = 1.1;
                }
                
            }
            
            else
                
            {
                step = 1.1;
            }
            
            
            
            %>
    
    
    
    <script>
        
        $('body').on('contextmenu', 'img', function(e) {return false;});
        $('body').on('contextmenu', 'video', function(e) {return false;});
        
    </script>
    
        
        <header>
                                    <a href="#" style="text-decoration:none;color:inherit;"><div style="text-decoration:none;color:inherit;float:left;">
            <img src="../../images/chilloutlets.png" style="margin-left:15px;height:30px;margin-top:28px;" />
            <!-- <img src='images/transparent-white.png' style="margin-left:2px;height:15px;" /> -->
                                        </div></a>
            
            <div class="toolholder">
            <a href="javascript:setActive()" style="text-decoration:none;color:inherit;">
            <div class="nav-tools">
                <div class="tool-label">Carrier Portal</div>
                <div class="selected-tool">
                    <div class="text-holder"><%= accountName.toUpperCase() %></div>
                    <div id="nav-caret" class="caret-holder"><i class="fa fa-caret-down" style="font-size:15px"></i></div>
                </div>
            </div>
            </a>
                </div>
        </header>
        
    <div class="step-holder">
        
        <div class="step-header">
            Shifts
        </div>
            
        <div class="step-body">
            
            <a href="dashboard.jsp">
            <div class="step">
                <div class=""><img src="../../images/dashboard.png" width="70px" alt="dashboard" ></div>
                <div class="step-section">Dashboard</div>
            </div>
            </a>
            
            <a href="shifts.jsp">
            <div class="step">
                <div class=""><img src="../../images/calendar.png" width="70px" alt="calendar" ></div>
                <div class="step-section completed">Shifts</div>
            </div>
            </a>
            
            <a href="earnings.jsp">
            <div class="step">
                <div class=""><img src="../../images/earnings.png" width="70px" alt="earnings" ></div>
                <div class="step-section">Earnings</div>
            </div>
            </a>
            
            <a href="settings.jsp">
            <div class="step">
                <div class=""><img src="../../images/customer-support.png" width="70px" alt="settings" ></div>
                <div class="step-section">Settings</div>
            </div>
            </a>
            
            <a href="documents.jsp">
            <div class="step">
                <div class=""><img src="../../images/agreement.png" width="70px" alt="documents" ></div>
                <div class="step-section">Documents</div>
            </div>
            </a>
                
        </div>
            
        </div>
                    
                                        
                                        
                                        
                                        <div class="login-modal" id="login-modal">
                                            
                                            <div id='logindrop' class="logindrop">
                                            
                                                
                                                <div class="triangle"></div>
                              
            
            
            <div class='drop-logout'>

                                    
                                    <form method="post" action="../../CarrierLogoutServlet">
                                        
                                            <div class="redclickarea">
                                                <button class="redclicker">LOG OUT</button>
                                            </div>

                                    </form>

                                </div>
                                            
                      
                                                
                                        </div>
                                        </div>
                    
                    
        
        
    <div class="ground">
        
        
        <div class="shift-week">Monday, December 24, 2018 - Sunday, December 30, 2018</div>
        
        
        <div class="shift">
        
            <div class="dayschedule">
                    <div class="dayschedule-setting">
                        <div class="day-setting-day">Monday</div>
                        <div class="day-setting-day">December 24</div>
                        <div class="day-setting-init">12:00AM - 2:00AM</div>
                        <div class="day-setting-end">4:00PM - 12:00AM</div>
                    </div>
                <div class="dayschedule-slider">
                    <div class="slider-pan"></div>
                    <div class="slider-label">
                        <div class="slider-label-time">12AM</div>
                        <div class="slider-label-time">1AM</div>
                        <div class="slider-label-time">2AM</div>
                        <div class="slider-label-time">3AM</div>
                        <div class="slider-label-time">4AM</div>
                        <div class="slider-label-time">5AM</div>
                        <div class="slider-label-time">6AM</div>
                        <div class="slider-label-time">7AM</div>
                        <div class="slider-label-time">8AM</div>
                        <div class="slider-label-time">9AM</div>
                        <div class="slider-label-time">10AM</div>
                        <div class="slider-label-time">11AM</div>
                        <div class="slider-label-time">12PM</div>
                        <div class="slider-label-time">1PM</div>
                        <div class="slider-label-time">2PM</div>
                        <div class="slider-label-time">3PM</div>
                        <div class="slider-label-time">4PM</div>
                        <div class="slider-label-time">5PM</div>
                        <div class="slider-label-time">6PM</div>
                        <div class="slider-label-time">7PM</div>
                        <div class="slider-label-time">8PM</div>
                        <div class="slider-label-time">9PM</div>
                        <div class="slider-label-time">10PM</div>
                        <div class="slider-label-time">11PM</div>
                    </div>
                </div>
                    <div class="turn-off-day"><i class="fa fa-toggle-on" style="font-size:30px;color:#c00c00;margin-top:-2.5px;"></i></div>
                    <div class="turn-off-title">Turn off</div>
            </div>
            
            <div class="dayschedule">
                    <div class="dayschedule-setting">
                        <div class="day-setting-day">Tuesday</div>
                        <div class="day-setting-day">December 25</div>
                        <div class="day-setting-init">12:00AM - 2:00AM</div>
                        <div class="day-setting-end">4:00PM - 12:00AM</div>
                    </div>
                <div class="dayschedule-slider">
                    <div class="slider-pan"></div>
                    <div class="slider-label">
                        <div class="slider-label-time">12AM</div>
                        <div class="slider-label-time">1AM</div>
                        <div class="slider-label-time">2AM</div>
                        <div class="slider-label-time">3AM</div>
                        <div class="slider-label-time">4AM</div>
                        <div class="slider-label-time">5AM</div>
                        <div class="slider-label-time">6AM</div>
                        <div class="slider-label-time">7AM</div>
                        <div class="slider-label-time">8AM</div>
                        <div class="slider-label-time">9AM</div>
                        <div class="slider-label-time">10AM</div>
                        <div class="slider-label-time">11AM</div>
                        <div class="slider-label-time">12PM</div>
                        <div class="slider-label-time">1PM</div>
                        <div class="slider-label-time">2PM</div>
                        <div class="slider-label-time">3PM</div>
                        <div class="slider-label-time">4PM</div>
                        <div class="slider-label-time">5PM</div>
                        <div class="slider-label-time">6PM</div>
                        <div class="slider-label-time">7PM</div>
                        <div class="slider-label-time">8PM</div>
                        <div class="slider-label-time">9PM</div>
                        <div class="slider-label-time">10PM</div>
                        <div class="slider-label-time">11PM</div>
                    </div>
                </div>
                    <div class="turn-off-day"><i class="fa fa-toggle-on" style="font-size:30px;color:#c00c00;margin-top:-2.5px;"></i></div>
                    <div class="turn-off-title">Turn off</div>
            </div>
            
            <div class="dayschedule">
                    <div class="dayschedule-setting">
                        <div class="day-setting-day">Wednesday</div>
                        <div class="day-setting-day">December 26</div>
                        <div class="day-setting-init">12:00AM - 2:00AM</div>
                        <div class="day-setting-end">4:00PM - 12:00AM</div>
                    </div>
                <div class="dayschedule-slider">
                    <div class="slider-pan"></div>
                    <div class="slider-label">
                        <div class="slider-label-time">12AM</div>
                        <div class="slider-label-time">1AM</div>
                        <div class="slider-label-time">2AM</div>
                        <div class="slider-label-time">3AM</div>
                        <div class="slider-label-time">4AM</div>
                        <div class="slider-label-time">5AM</div>
                        <div class="slider-label-time">6AM</div>
                        <div class="slider-label-time">7AM</div>
                        <div class="slider-label-time">8AM</div>
                        <div class="slider-label-time">9AM</div>
                        <div class="slider-label-time">10AM</div>
                        <div class="slider-label-time">11AM</div>
                        <div class="slider-label-time">12PM</div>
                        <div class="slider-label-time">1PM</div>
                        <div class="slider-label-time">2PM</div>
                        <div class="slider-label-time">3PM</div>
                        <div class="slider-label-time">4PM</div>
                        <div class="slider-label-time">5PM</div>
                        <div class="slider-label-time">6PM</div>
                        <div class="slider-label-time">7PM</div>
                        <div class="slider-label-time">8PM</div>
                        <div class="slider-label-time">9PM</div>
                        <div class="slider-label-time">10PM</div>
                        <div class="slider-label-time">11PM</div>
                    </div>
                </div>
                    <div class="turn-off-day"><i class="fa fa-toggle-on" style="font-size:30px;color:#c00c00;margin-top:-2.5px;"></i></div>
                    <div class="turn-off-title">Turn off</div>
            </div>
            
            <div class="dayschedule">
                    <div class="dayschedule-setting">
                        <div class="day-setting-day">Thursday</div>
                        <div class="day-setting-day">December 27</div>
                        <div class="day-setting-init">12:00AM - 2:00AM</div>
                        <div class="day-setting-end">4:00PM - 12:00AM</div>
                    </div>
                <div class="dayschedule-slider">
                    <div class="slider-pan"></div>
                    <div class="slider-label">
                        <div class="slider-label-time">12AM</div>
                        <div class="slider-label-time">1AM</div>
                        <div class="slider-label-time">2AM</div>
                        <div class="slider-label-time">3AM</div>
                        <div class="slider-label-time">4AM</div>
                        <div class="slider-label-time">5AM</div>
                        <div class="slider-label-time">6AM</div>
                        <div class="slider-label-time">7AM</div>
                        <div class="slider-label-time">8AM</div>
                        <div class="slider-label-time">9AM</div>
                        <div class="slider-label-time">10AM</div>
                        <div class="slider-label-time">11AM</div>
                        <div class="slider-label-time">12PM</div>
                        <div class="slider-label-time">1PM</div>
                        <div class="slider-label-time">2PM</div>
                        <div class="slider-label-time">3PM</div>
                        <div class="slider-label-time">4PM</div>
                        <div class="slider-label-time">5PM</div>
                        <div class="slider-label-time">6PM</div>
                        <div class="slider-label-time">7PM</div>
                        <div class="slider-label-time">8PM</div>
                        <div class="slider-label-time">9PM</div>
                        <div class="slider-label-time">10PM</div>
                        <div class="slider-label-time">11PM</div>
                    </div>
                </div>
                    <div class="turn-off-day"><i class="fa fa-toggle-on" style="font-size:30px;color:#c00c00;margin-top:-2.5px;"></i></div>
                    <div class="turn-off-title">Turn off</div>
            </div>
            
            <div class="dayschedule">
                    <div class="dayschedule-setting">
                        <div class="day-setting-day">Friday</div>
                        <div class="day-setting-day">December 28</div>
                        <div class="day-setting-init">12:00AM - 2:00AM</div>
                        <div class="day-setting-end">4:00PM - 12:00AM</div>
                    </div>
                <div class="dayschedule-slider">
                    <div class="slider-pan"></div>
                    <div class="slider-label">
                        <div class="slider-label-time">12AM</div>
                        <div class="slider-label-time">1AM</div>
                        <div class="slider-label-time">2AM</div>
                        <div class="slider-label-time">3AM</div>
                        <div class="slider-label-time">4AM</div>
                        <div class="slider-label-time">5AM</div>
                        <div class="slider-label-time">6AM</div>
                        <div class="slider-label-time">7AM</div>
                        <div class="slider-label-time">8AM</div>
                        <div class="slider-label-time">9AM</div>
                        <div class="slider-label-time">10AM</div>
                        <div class="slider-label-time">11AM</div>
                        <div class="slider-label-time">12PM</div>
                        <div class="slider-label-time">1PM</div>
                        <div class="slider-label-time">2PM</div>
                        <div class="slider-label-time">3PM</div>
                        <div class="slider-label-time">4PM</div>
                        <div class="slider-label-time">5PM</div>
                        <div class="slider-label-time">6PM</div>
                        <div class="slider-label-time">7PM</div>
                        <div class="slider-label-time">8PM</div>
                        <div class="slider-label-time">9PM</div>
                        <div class="slider-label-time">10PM</div>
                        <div class="slider-label-time">11PM</div>
                    </div>
                </div>
                    <div class="turn-off-day"><i class="fa fa-toggle-on" style="font-size:30px;color:#c00c00;margin-top:-2.5px;"></i></div>
                    <div class="turn-off-title">Turn off</div>
            </div>

            <div class="dayschedule">
                    <div class="dayschedule-setting">
                        <div class="day-setting-day">Saturday</div>
                        <div class="day-setting-day">December 29</div>
                        <div class="day-setting-init">12:00AM - 2:00AM</div>
                        <div class="day-setting-end">4:00PM - 12:00AM</div>
                    </div>
                <div class="dayschedule-slider">
                    <div class="slider-pan"></div>
                    <div class="slider-label">
                        <div class="slider-label-time">12AM</div>
                        <div class="slider-label-time">1AM</div>
                        <div class="slider-label-time">2AM</div>
                        <div class="slider-label-time">3AM</div>
                        <div class="slider-label-time">4AM</div>
                        <div class="slider-label-time">5AM</div>
                        <div class="slider-label-time">6AM</div>
                        <div class="slider-label-time">7AM</div>
                        <div class="slider-label-time">8AM</div>
                        <div class="slider-label-time">9AM</div>
                        <div class="slider-label-time">10AM</div>
                        <div class="slider-label-time">11AM</div>
                        <div class="slider-label-time">12PM</div>
                        <div class="slider-label-time">1PM</div>
                        <div class="slider-label-time">2PM</div>
                        <div class="slider-label-time">3PM</div>
                        <div class="slider-label-time">4PM</div>
                        <div class="slider-label-time">5PM</div>
                        <div class="slider-label-time">6PM</div>
                        <div class="slider-label-time">7PM</div>
                        <div class="slider-label-time">8PM</div>
                        <div class="slider-label-time">9PM</div>
                        <div class="slider-label-time">10PM</div>
                        <div class="slider-label-time">11PM</div>
                    </div>
                </div>
                    <div class="turn-off-day"><i class="fa fa-toggle-on" style="font-size:30px;color:#c00c00;margin-top:-2.5px;"></i></div>
                    <div class="turn-off-title">Turn off</div>
            </div>
            
            <div class="dayschedule">
                    <div class="dayschedule-setting">
                        <div class="day-setting-day">Sunday</div>
                        <div class="day-setting-day">December 30</div>
                        <div class="day-setting-init">12:00AM - 2:00AM</div>
                        <div class="day-setting-end">4:00PM - 12:00AM</div>
                    </div>
                <div class="dayschedule-slider">
                    <div class="slider-pan"></div>
                    <div class="slider-label">
                        <div class="slider-label-time">12AM</div>
                        <div class="slider-label-time">1AM</div>
                        <div class="slider-label-time">2AM</div>
                        <div class="slider-label-time">3AM</div>
                        <div class="slider-label-time">4AM</div>
                        <div class="slider-label-time">5AM</div>
                        <div class="slider-label-time">6AM</div>
                        <div class="slider-label-time">7AM</div>
                        <div class="slider-label-time">8AM</div>
                        <div class="slider-label-time">9AM</div>
                        <div class="slider-label-time">10AM</div>
                        <div class="slider-label-time">11AM</div>
                        <div class="slider-label-time">12PM</div>
                        <div class="slider-label-time">1PM</div>
                        <div class="slider-label-time">2PM</div>
                        <div class="slider-label-time">3PM</div>
                        <div class="slider-label-time">4PM</div>
                        <div class="slider-label-time">5PM</div>
                        <div class="slider-label-time">6PM</div>
                        <div class="slider-label-time">7PM</div>
                        <div class="slider-label-time">8PM</div>
                        <div class="slider-label-time">9PM</div>
                        <div class="slider-label-time">10PM</div>
                        <div class="slider-label-time">11PM</div>
                    </div>
                </div>
                    <div class="turn-off-day"><i class="fa fa-toggle-on" style="font-size:30px;color:#c00c00;margin-top:-2.5px;"></i></div>
                    <div class="turn-off-title">Turn off</div>
            </div>

        
        </div>
        
        
    </div>
    
    
    
    
        
    
<script type="text/javascript">
        
        
        var spinner = document.getElementsByClassName('spinner-overlay')[0];
            var span = document.getElementsByClassName("close")[0];
            var loginModal = document.getElementById("login-modal");
            var loginDrop = document.getElementById("logindrop");
                    
                    function setActive()
                    
                    {
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
                
            };
            
            
        


</script>    
    </body>
</html>


