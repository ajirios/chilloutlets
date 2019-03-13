<%-- 
    Document   : mobility
    Created on : 28-Nov-2018, 1:43:37 AM
    Author     : ajirios
    Description: Upload documents and information about mobility network and carrier data plan like carrier name.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>2. Mobility</title>
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
                
                .ground
                {
                    width: 100%;
                    height: 600px;
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
                    height: 600px;
                    top: 270px;
                    margin-left: calc(50% - 250px);
                    //margin-right: auto;
                    background-color: white;
                    z-index: 2;
                    position: absolute;
                    box-shadow: 0 3px 12px #444;
                    padding: 50px;
                }
                
                
                
                
                
                
                </style>
    </head>
    <body>
    
    
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
                <div class="tool-label">Account</div>
                <div class="selected-tool">
                    <div class="text-holder">LOGIN</div>
                    <div id="nav-caret" class="caret-holder"><i class="fa fa-caret-down" style="font-size:15px"></i></div>
                </div>
            </div>
            </a>
            <a href="javascript:openZoneDrop()" style="text-decoration:none;color:inherit;">
            <div class="city-tools">
                <div class="city-label">Service area</div>
                <div class="city-tool">
                    <div class="text-holder">WINNIPEG</div>
                    <div id="zone-caret" class="caret-holder"><i class="fa fa-caret-down" style="font-size:15px"></i></div>
                </div>
            </div>
            </a>
                </div>
        </header>
        
    <div class="step-holder">
        
        <div class="step-header">
            Mobility
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
                <div class="step-line"></div>
            </div>
            
            <div class="step">
                <div class="step-round">3</div>
                <div class="step-section">App</div>
                <div class="step-line"></div>
            </div>
            
            <div class="step">
                <div class="step-round">4</div>
                <div class="step-section">Schedule</div>
                <div class="step-line"></div>
            </div>
            
            <div class="step">
                <div class="step-round">5</div>
                <div class="step-section">Banking</div>
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
        
    <div class="ground">
        
        
        
    </div>
    
    <div class="paper">
        
        <span>Please make sure that the photo is clear 
            and the expiration date is visible. Photos that are difficult to read may delay your application.</span>
        
    </div>
        
    </body>
</html>
