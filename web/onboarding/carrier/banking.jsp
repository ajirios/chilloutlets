<%-- 
    Document   : banking
    Created on : 28-Nov-2018, 1:42:21 AM
    Author     : ajirios
    Description: To get banking information for Stripe and make Stripe Connect account for carrier.
--%>

<%@page import="carrier.CarrierRetrieve"%>
<%@page import='com.mysql.jdbc.Driver' %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>5. Banking</title>
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
                    height: 900px;
                    margin-top: 0px;
                    background-color: #aaa;
                    background-image: url("/outlets/drive.jpg");
                    background-size: cover;
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
                    width: 1050px;
                    height: 40px;
                    margin-top: 30px;
                    padding-top: 0px;
                    margin-left: auto;
                    margin-right: auto;
                }
                
                .step
                {
                    width: 150px;
                    height: 40px;
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
                    color: #ddd;
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
                    background-color: #e00b00;
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
            
            .banking-debit
            {
                display: block;
                width: 400px;
                height: 600px;
                padding: 0 40px;
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
                
                .card-percent-left
                {
                    width: 100%;
                    height: 3px;
                    background-color: #e00b00;
                    float: left;
                }
                
                .card-percent-right
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
                
                
                
                
                
                
                </style>
                <script type="text/javascript">
                    
                    
                    function traffic()
                    {
                        alert("works!");
                    }
                    
                    
                </script>
    </head>
    <body onload="traffic()">
    
        
        
        <%
            
            
            double step;
            String accountName = "LOGOUT";
            
            long carrierID = 0;
            
            if (session.getAttribute("carrier-id") != null)
            
            {
                carrierID = Long.parseLong(session.getAttribute("carrier-id").toString());
            }
            
            else
                
            {
                response.sendRedirect("../carrier.jsp");
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
            
            
            if (step == 1.1)
                
            {
                response.sendRedirect("vehicle.jsp");
            }
            
            else if (step == 1.2)
                
            {
                response.sendRedirect("vehicle.jsp");
            }
            
            else if (step == 1.3)
                
            {
                response.sendRedirect("vehicle.jsp");
            }
            
            else if (step == 1.4)
                
            {
                response.sendRedirect("vehicle.jsp");
            }
            
            else if (step == 1.5)
                
            {
                response.sendRedirect("vehicle.jsp");
            }
            
            else if (step == 1.6)
                
            {
                response.sendRedirect("vehicle.jsp");
            }
            
            else if (step == 2)
                
            {
                response.sendRedirect("mobility.jsp");
            }
            
            else if (step == 3)
                
            {
                response.sendRedirect("app.jsp");
            }
            
            else if (step == 4)
                
            {
                response.sendRedirect("schedule.jsp");
            }
            
            else if (step == 7)
                
            {
                response.sendRedirect("call.jsp");
            }
            
            else if (step == 6)
                
            {
                response.sendRedirect("screening.jsp");
            }
            
            else if (step >= 8)
                
            {
                response.sendRedirect("dashboard.jsp");
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
            Banking
        </div>
            
        <div class="step-body">
            <div class="step">
                <div class="step-round current-back">1</div>
                <div class="step-section current">Vehicle</div>
                <div class="step-line completed"></div>
            </div>
            
            <div class="step">
                <div class="step-round current-back">2</div>
                <div class="step-section current">Mobility</div>
                <div class="step-line completed"></div>
            </div>
            
            <div class="step">
                <div class="step-round current-back">3</div>
                <div class="step-section current">App</div>
                <div class="step-line completed"></div>
            </div>
            
            <div class="step">
                <div class="step-round current-back">4</div>
                <div class="step-section current">Schedule</div>
                <div class="step-line completed"></div>
            </div>
            
            <div class="step">
                <div class="step-round current-back">5</div>
                <div class="step-section current">Banking</div>
                <div class="step-line"></div>
            </div>
            
            <div class="step">
                <div class="step-round">6</div>
                <div class="step-section">Screening</div>
                <div class="step-line"></div>
            </div>
            
            <div class="step">
                <div class="step-round">7</div>
                <div class="step-section">Call</div>
            </div>
                
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
        
        
        
    </div>
    
    <div class="paper">
        
        
        
        
        <%
            
            if (step == 5.1)
                
            {
                
            %>
            
            
        
        <div id="work-permit" class="work-permit">
            
            <div class="document-identifier">Carrier Banking | Deposit Account</div>
            
            <div class="license-percent">
                <div class="permit-percent-left"></div>
                <div class="permit-percent-right"></div>
            </div>
            
        
        <form id="bank-account-form" method="post" enctype="multipart/form-data" action="../../BankAccountServlet">
            
        
            
            <div class="">
            Payouts are automatically accumulated through the week and are deposited by the end of the week. Bank account information are needed to receive funds.
            </div>
            
            <div class="document-identifier">Please select the bank you would like to use.</div>
            
            <div class="">
                <select required="required" style="width:100%;">
                    <option value='rbc'>RBC</option>
                    <option value='td'>TD</option>
                    <option value='cibc'>CIBC</option>
                    <option value='scotiabank'>Scotiabank</option>
                    <option value='bmo'>BMO</option>
                    <option value='tangerine'>Tangerine</option>
                    <option value='hsbc'>HSBC</option>
                </select>
            </div>
            
            <div class="document-identifier">Please enter the 3-digit bank institution number.</div>
            
            <div class="">
                <input type="text" style="width:100%;" placeholder="Institution number" />
            </div>
            
            <div class="document-identifier">Please enter your 5-digit bank transit number.</div>
            
            <div class="">
                <input type="text" style="width:100%;" placeholder="Transit number" />
            </div>
            
            <div class="document-identifier">Please enter your account number.</div>
            
            <div class="">
                <input type="text" style="width:100%;" placeholder="Account number" />
            </div>
            
            <div class="document-identifier">Please enter your date of birth (D.O.B.).</div>
            
            <div class="">
                <input type="date" style="width:100%;" placeholder="MM/DD/YYYY" />
            </div>
            
            <div class="instructions">
            Make sure that the photo is clear and the expiration date is visible. 
            Photos that are difficult to read may delay your application.
            </div>
            
            <div class="document-identifier">Please upload a copy of your direct deposit form.</div>
            
                    <div hidden><input id="direct-deposit-upload-button" type="file" name="direct-deposit-scan" /></div>
                    
                    <a href="javascript:clickDirectDepositUpload()">
                        <div id="license-uploader" class="license-uploader"></div>
                    </a>
            
            
        </form>
            
        
            <div class="redclickarea">
                <button class="redclicker" onclick="submitForm()">SUBMIT DOCUMENT</button>
            </div>
            
        </div>
        
        
        
        
        <%
            }
            
            else if (step == 5.2)
                
            {
                
            %>
        
    
        
        <div id="banking-debit" class="banking-debit">
            
            <div class="document-identifier">Carrier Banking | Debit or Credit Card</div>
            
            <div class="license-percent">
                <div class="card-percent-left"></div>
                <div class="card-percent-right"></div>
            </div>
            
        
        <form id="credit-card-form" method="post" action="../../CarrierCreditCardServlet">
            
        
            
            <div class="">
            To complete deliveries, carriers often need to pay for merchandise beforehand. 
            The money is refunded back to the carrier's account after the order has been completed. You will need a debit or credit card for this purpose.
            </div>
            
            <div class="document-identifier">Please select the type of card you would like to use.</div>
            
            <div class="">
                <select style="width:100%;">
                    <option value='visa'>VISA</option>
                    <option value='mastercard'>Mastercard</option>
                </select>
            </div>
            
            <div class="document-identifier">Please enter your credit card number.</div>
            
            <div class="">
                <input type="text" style="width:100%;" placeholder="Credit card number" />
            </div>
            
            <div class="document-identifier">Please enter your expiry month and year.</div>
            
            <div class="">
                <input type="month" style="width:100%;" />
            </div>
            
            <div class="document-identifier">Please enter your credit card verification number.</div>
            
            <div class="">
                <input type="text" style="width:100%;" placeholder="CCV" />
            </div>
            
            <h3>Billing Address</h3>
            
            <div class="document-identifier">Please enter the street address for your billing address.</div>
            
            <div class="">
                <input type="text" style="width:100%;" placeholder="Street address line" />
            </div>
            
            <div class="document-identifier">Please enter the province for your billing address.</div>
            
            <div class="">
                <select style="width:100%;">
                    <option value='manitoba'>Manitoba</option>
                    <option value='ontario'>Ontario</option>
                </select>
            </div>
            
            <div class="document-identifier">Please enter the city for your billing address.</div>
            
            <div class="">
                <select style="width:100%;">
                    <option value='winnipeg'>Winnipeg</option>
                    <option value='brandon'>Brandon</option>
                </select>
            </div>
            
            <div class="document-identifier">Please enter the postal code for your billing address.</div>
            
            <div class="">
                <input type="text" style="width:100%;" placeholder="Postal code" />
            </div>
            
            
        </form>
        
            <div class="redclickarea">
                <button class="redclicker" onclick="submitCard()">SUBMIT</button>
            </div>
            
        </div>
        
        
        
        
        <%
            
            }
                
            %>
            
        
    </div>
        
    
<script type="text/javascript">
        
        
        var debitbanking = document.getElementsByClassName('banking-debit')[0];
        var creditbanking = document.getElementsByClassName('work-permit')[0];
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
            
            
        
        
        $("#direct-deposit-upload-button").on('change', function () {
                
                if (typeof (FileReader) !== "undefined")
                    
                {
                    var imageHolder = $("#license-uploader");
                    imageHolder.empty();
                    
                    var reader = new FileReader();
                    
                    reader.onload = function (e) {
                    
                        document.getElementById('license-uploader').style.backgroundImage = "url('" + e.target.result + "')";
                        
                    };
                    
                    imageHolder.show();
                    reader.readAsDataURL($(this)[0].files[0]);
                    
                }
                
                else
                    
                {
                    alert("This browser does not support preview.");
                }
                
            });
            
        
        
        function submitForm()
        
        {
            document.getElementById('bank-account-form').submit();
        }
        
        function submitCard()
        
        {
            document.getElementById('credit-card-form').submit();
        }
        
        function clickDirectDepositUpload()
        
        {
            document.getElementById('direct-deposit-upload-button').click();
        }
        
        


</script>
        
    </body>
</html>
