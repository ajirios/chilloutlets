<%-- 
    Document   : order
    Created on : 10-Sep-2018, 9:21:59 AM
    Author     : ajirios
--%>

<%@page import="customer.CustomerRetrieve"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Order @ Chilloutlets</title>
            <link rel="shortcut icon" type="image/png" href="images/chilliredup.png"/>
            <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        
        
            <script src="https://www.gstatic.com/firebasejs/5.7.0/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/5.8.1/firebase-database.js"></script>
             
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
            
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
            <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnOuNL_P1zkEfYK-q3N7JQFInYlW_JLJE"></script>
            
		<link rel="stylesheet" href="assets/css/main.css" />
                
                
                <style>
                    
                    
                    
                
                
                    
                #geomap 
                {
                    height: 100%;
                    width: calc(100% - 350px);
                    float: left;
                }
                
                .panel-area
                {
                    width: 100%;
                    height: 100vh;
                    overflow: visible;
                }
                
                .order-panel
                {
                    height: 100%;
                    width: 350px;
                    right: 0px;
                    background-color: #eee;
                    box-shadow: 0px 10px 30px #888;
                    float: right;
                }
                
                .form
                {
                    padding-top: 48px;
                    width: 60%;
                    margin-left: auto;
                    margin-right: auto;
                }
                
                html, body 
                {
                    height: 100%;
                    margin: 0;
                    padding: 0;
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

                ol, ul 
                {
                        list-style: none;
                }
                
                body, input, select, textarea 
                {
                        color: #777;
                        font-family: "Source Sans Pro", sans-serif;
                        font-size: 10pt;
                        font-weight: 300;
                        line-height: 1.65em;
                        letter-spacing: -0.015em;
                }

	a {
		-moz-transition: color 0.2s ease-in-out, border-bottom-color 0.2s ease-in-out;
		-webkit-transition: color 0.2s ease-in-out, border-bottom-color 0.2s ease-in-out;
		-ms-transition: color 0.2s ease-in-out, border-bottom-color 0.2s ease-in-out;
		transition: color 0.2s ease-in-out, border-bottom-color 0.2s ease-in-out;
		border-bottom: dotted 1px;
		color: #e89980;
		text-decoration: none;
	}

		a:hover 
                {
			border-bottom-color: transparent;
		}

	strong, b {
		color: #646464;
		font-weight: 400;
	}

	em, i {
		font-style: italic;
	}

	p {
		margin: 0 0 2em 0;
	}

	h1, h2, h3, h4, h5, h6 {
		color: #646464;
		font-weight: 300;
		line-height: 1em;
		margin: 0 0 0.5em 0;
	}

		h1 a, h2 a, h3 a, h4 a, h5 a, h6 a {
			color: inherit;
			text-decoration: none;
		}

	h2 {
		font-size: 2.25em;
		line-height: 1.5em;
		letter-spacing: -0.035em;
	}

	h3 {
		font-size: 1.75em;
		line-height: 1.5em;
		letter-spacing: -0.025em;
	}

	h4 {
		font-size: 1.1em;
		line-height: 1.5em;
		letter-spacing: 0;
	}

	h5 {
		font-size: 0.9em;
		line-height: 1.5em;
		letter-spacing: 0;
	}

	h6 {
		font-size: 0.7em;
		line-height: 1.5em;
		letter-spacing: 0;
	}

	sub {
		font-size: 0.8em;
		position: relative;
		top: 0.5em;
	}

	sup {
		font-size: 0.8em;
		position: relative;
		top: -0.5em;
	}

	hr {
		border: 0;
		border-bottom: solid 2px #e5e5e5;
		margin: 2em 0;
	}

		hr.major {
			margin: 3em 0;
		}

	blockquote {
		border-left: solid 4px #e5e5e5;
		font-style: italic;
		margin: 0 0 2em 0;
		padding: 0.5em 0 0.5em 2em;
	}

	header p {
		color: #f04000;
		position: relative;
		margin: 0 0 1.5em 0;
		font-style: italic;
	}

	header h2 + p {
		font-size: 1.25em;
		margin-top: -1em;
		line-height: 1.5em;
	}

	header h3 + p {
		font-size: 1.1em;
		margin-top: -0.85em;
		line-height: 1.5em;
	}

	header h4 + p,
	header h5 + p,
	header h6 + p {
		font-size: 0.8em;
		margin-top: -0.5em;
		line-height: 1.5em;
	}

	header.major {
		padding: 1em 0;
		text-align: center;
	}

		header.major h2 {
			margin: 0;
		}

		header.major p {
			display: inline-block;
			border-top: solid 2px #e5e5e5;
			color: #777;
			margin: 1.5em 0 0 0;
			padding: 1.5em 0 0 0;
			font-style: normal;
		}
                
                #innerheader {
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
		z-index: 10000;
	}

		#innerheader h1 {
			color: inherit;
			height: inherit;
			left: 1.25em;
			line-height: inherit;
			margin: 0;
			padding: 0;
			position: absolute;
			top: 0;
		}

			#innerheader h1 a {
				color: #fff;
				font-weight: 400;
				border: 0;
			}

		#innerheader nav {
			height: inherit;
			line-height: inherit;
			position: absolute;
			right: 0.75em;
			top: 0;
			vertical-align: middle;
		}

			#innerheader nav > ul {
				list-style: none;
				margin: 0;
				padding-left: 0;
			}

				#innerheader nav > ul > li {
					display: inline-block;
					padding-left: 0;
				}

					#innerheader nav > ul > li > ul {
						display: none;
					}

					#innerheader nav > ul > li a {
						display: inline-block;
						height: 2em;
						line-height: 1.95em;
						padding: 0 1em;
						border-radius: 6px;
					}

					#innerheader nav > ul > li a:not(.button) {
						color: #fff;
						display: inline-block;
						text-decoration: none;
						border: 0;
					}

						#innerheader nav > ul > li a:not(.button).icon:before {
							color: #999;
							margin-right: 0.5em;
						}

					#innerheader nav > ul > li:first-child {
						margin-left: 0;
					}

					#innerheader nav > ul > li.active a:not(.button) {
						background-color: rgba(153, 153, 153, 0.25);
					}

					#innerheader nav > ul > li .button {
						margin: 0 0 0 0.5em;
						position: relative;
					}

		#innerheader input[type="submit"],
		#innerheader input[type="reset"],
		#innerheader input[type="button"],
		#innerheader .button {
			background-color: transparent;
			box-shadow: inset 0 0 0 2px #999;
			color: #fff;
		}

			#innerheader input[type="submit"]:hover,
			#innerheader input[type="reset"]:hover,
			#innerheader input[type="button"]:hover,
			#innerheader .button:hover {
				background-color: rgba(153, 153, 153, 0.25);
			}

			#innerheader input[type="submit"]:active,
			#innerheader input[type="reset"]:active,
			#innerheader input[type="button"]:active,
			#innerheader .button:active {
				background-color: rgba(153, 153, 153, 0.5);
			}

		#innerheader .container {
			position: relative;
		}

			#innerheader .container h1 {
				left: 0;
			}

			#innerheader .container nav {
				right: 0;
			}

		#innerheader.reveal {
			-moz-animation: reveal-header 0.5s;
			-webkit-animation: reveal-header 0.5s;
			-ms-animation: reveal-header 0.5s;
			animation: reveal-header 0.5s;
		}

		#innerheader.alt {
			-moz-animation: none;
			-webkit-animation: none;
			-ms-animation: none;
			animation: none;
			background: none;
			color: rgba(255, 255, 255, 0.75);
			position: absolute;
		}

			#innerheader.alt nav > ul > li a:not(.button).icon:before {
				color: rgba(255, 255, 255, 0.75);
			}

			#innerheader.alt nav > ul > li.active a:not(.button) {
				background-color: rgba(255, 255, 255, 0.2);
			}

			#innerheader.alt input[type="submit"],
			#innerheader.alt input[type="reset"],
			#innerheader.alt input[type="button"],
			#innerheader.alt .button {
				box-shadow: inset 0 0 0 2px rgba(255, 255, 255, 0.5);
			}

				#innerheader.alt input[type="submit"]:hover,
				#innerheader.alt input[type="reset"]:hover,
				#innerheader.alt input[type="button"]:hover,
				#innerheader.alt .button:hover {
					background-color: rgba(255, 255, 255, 0.1);
				}

				#innerheader.alt input[type="submit"]:active,
				#innerheader.alt input[type="reset"]:active,
				#innerheader.alt input[type="button"]:active,
				#innerheader.alt .button:active {
					background-color: rgba(255, 255, 255, 0.2);
				}

/* Icon */

	.icon {
		text-decoration: none;
		border-bottom: none;
		position: relative;
	}

		.icon:before {
			-moz-osx-font-smoothing: grayscale;
			-webkit-font-smoothing: antialiased;
			font-family: FontAwesome;
			font-style: normal;
			font-weight: normal;
			text-transform: none !important;
		}

		.icon > .label {
			display: none;
		}

		.icon.major {
			background: #666;
			border-radius: 100%;
			color: #ffffff;
			cursor: default;
			display: inline-block;
			height: 5.5em;
			line-height: 5.5em;
			margin: 0 0 2em 0;
			width: 5.5em;
		}

			.icon.major:before {
				font-size: 2.5em;
			}

			.icon.major.accent1 {
				background: #666;
				color: #ffffff;
			}

			.icon.major.accent2 {
				background: #e89980;
				color: #ffffff;
			}

			.icon.major.accent3 {
				background: #7fcdb8;
				color: #ffffff;
			}

			.icon.major.accent4 {
				background: #90b0ba;
				color: #ffffff;
			}

			.icon.major.accent5 {
				background: #e5cb95;
				color: #ffffff;
			}

/* List */

	ol {
		list-style: decimal;
		margin: 0 0 2em 0;
		padding-left: 1.25em;
	}

		ol li {
			padding-left: 0.25em;
		}

	ul {
		list-style: disc;
		margin: 0 0 2em 0;
		padding-left: 1em;
	}

		ul li {
			padding-left: 0.5em;
		}

		ul.alt {
			list-style: none;
			padding-left: 0;
		}

			ul.alt li {
				border-top: solid 1px #e5e5e5;
				padding: 0.5em 0;
			}

				ul.alt li:first-child {
					border-top: 0;
					padding-top: 0;
				}

		ul.icons {
			cursor: default;
			list-style: none;
			padding-left: 0;
		}

			ul.icons li {
				display: inline-block;
				padding: 0 1.25em 0 0;
			}

				ul.icons li:last-child {
					padding-right: 0;
				}

				ul.icons li .icon {
					color: inherit;
				}

					ul.icons li .icon:before {
						font-size: 1.75em;
					}

		ul.actions {
			cursor: default;
			list-style: none;
			padding-left: 0;
		}

			ul.actions li {
				display: inline-block;
				padding: 0 1em 0 0;
				vertical-align: middle;
			}

				ul.actions li:last-child {
					padding-right: 0;
				}

			ul.actions.small li {
				padding: 0 0.5em 0 0;
			}

			ul.actions.vertical li {
				display: block;
				padding: 1em 0 0 0;
			}

				ul.actions.vertical li:first-child {
					padding-top: 0;
				}

				ul.actions.vertical li > * {
					margin-bottom: 0;
				}

			ul.actions.vertical.small li {
				padding: 0.5em 0 0 0;
			}

				ul.actions.vertical.small li:first-child {
					padding-top: 0;
				}

			ul.actions.fit {
				display: table;
				margin-left: -1em;
				padding: 0;
				table-layout: fixed;
				width: calc(100% + 1em);
			}

				ul.actions.fit li {
					display: table-cell;
					padding: 0 0 0 1em;
				}

					ul.actions.fit li > * {
						margin-bottom: 0;
					}

				ul.actions.fit.small {
					margin-left: -0.5em;
					width: calc(100% + 0.5em);
				}

					ul.actions.fit.small li {
						padding: 0 0 0 0.5em;
					}

	dl {
		margin: 0 0 2em 0;
	}
                
                .checkout-area
                {
                    width: 300px;
                    margin-top: 20px;
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
                
                .receipt-sender
                {
                    color: #000;
                    width: 100%;
                    height: 50px;
                    padding-left: 5%;
                    padding-right: 5%;
                    background-color: #fff;
                    font-weight: bolder;
                    margin-top: 80px;
                    padding-top: 20px;
                }
                
                .calculations-holder
                {
                    font-size: 13px;
                    width: 100%;
                    height: 190px;
                    padding-top: 10px;
                    padding-left: 5%;
                    padding-right: 5%;
                    background-color: #fff;
                    color: #bbb;
                    top: 0px;
                }
                
                .subtotal-calculator
                {
                    width: 100%;
                    height: 17px;
                }
                
                .tip-text
                {
                    width: 82%;
                    height: 17px;
                    float: left;
                }
                
                .tip-fee
                {
                    width: 18%;
                    height: 17px;
                    float: left;
                    text-align: right;
                }
                
                .calc-text
                {
                    width: 70%;
                    height: 17px;
                    float: left;
                }
                
                .calc-fee
                {
                    width: 30%;
                    height: 17px;
                    float: left;
                    text-align: right;
                }
                
                .expedition-calc
                {
                    width: 100%;
                    height: 17px;
                }
                
                .referral-calc
                {
                    width: 100%;
                    height: 17px;
                }
                
                .gst-calc
                {
                    width: 100%;
                    height: 17px;
                }
                
                .pst-calc
                {
                    width: 100%;
                    height: 17px;
                }
                
                .tip-jar
                {
                    width: 100%;
                    height: 17px;
                }
                
                .total-calculator
                {
                    width: 100%;
                    height: 60px;
                    padding-top: 17px;
                    padding-left: 5%;
                    padding-right: 5%;
                    background-color: #fff;
                    color: #000;
                    top: 0px;
                }
                
                .total-text
                {
                    width: 30%;
                    height: 60px;
                    font-size: 30px;
                    font-weight: bolder;
                    float: left;
                }
                
                .total-fee
                {
                    width: 70%;
                    height: 60px;
                    font-size: 35px;
                    font-weight: bolder;
                    float: left;
                    text-align: right;
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
            
            .voucher-modal
            {
                display: none;
                position: absolute; /* Stay in place */
                z-index: 0;
                padding-top: 300px; /* Location of the box */
                left: 0;
                top: 85px;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                /* background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
            
            .payment-modal
            {
                display: none;
                position: absolute; /* Stay in place */
                z-index: 0;
                padding-top: 300px; /* Location of the box */
                left: 0;
                top: 85px;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                /* background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
            
            .voucher-modal-content 
            {
            position: relative;
            background-color: #fefefe;
            margin-top: 140px;
            margin-left: calc(55% - 175px);
            //margin-right: auto;
            padding: 0;
            border: 0.2px solid #aaa;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.8),0 6px 20px 0 rgba(0,0,0,0.19);
            border-radius: 2px;
            width: 350px;
            height: 250px;
            -webkit-animation-name: none;
            -webkit-animation-duration: 0.3s;
            animation-name: none;
            animation-duration: 0.3s
            }
            
            .voucher-modal-header
            {
                width: 350px;
                height: 40px;
                padding: 15px 20px;
                font-size: 19px;
                color: #555;
            }
            
            .voucher-modal-body
            {
                width: 350px;
                height: 160px;
                padding: 50px 20px;
            }
            
            .voucher-line
            {
                width: 100%;
                height: 2px;
                background-color: #e00e00;
                padding-top: 2px;
            }
            
            .voucher-modal-footer
            {
                width: 350px;
                height: 50px;
                background-color: #e00e00;
                padding-top: 15px;
                color: white;
                text-align: center;
            }
            
            .voucher-modal-footer:hover
            {
                background-color: #c00c00;
            }
            
            .payment-modal-content 
            {
            position: relative;
            background-color: #fefefe;
            margin-top: 140px;
            margin-left: calc(55% - 175px);
            //margin-right: auto;
            padding: 0;
            border: 0.2px solid #aaa;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.8),0 6px 20px 0 rgba(0,0,0,0.19);
            border-radius: 2px;
            width: 350px;
            height: 250px;
            -webkit-animation-name: none;
            -webkit-animation-duration: 0.3s;
            animation-name: none;
            animation-duration: 0.3s
            }
            
            .payment-modal-header
            {
                width: 350px;
                height: 40px;
                padding: 15px 20px;
                font-size: 19px;
                color: #555;
            }
            
            .payment-modal-body
            {
                width: 350px;
                height: 160px;
                padding: 50px 20px;
            }
            
            .payment-modal-footer
            {
                width: 350px;
                height: 50px;
                background-color: #e00e00;
                padding-top: 15px;
                color: white;
                text-align: center;
            }
            
            .payment-modal-footer:hover
            {
                background-color: #c00c00;
            }

            /* Add Animation */
            @-webkit-keyframes animatetop 
            {
            from {top:0px; opacity:0} 
            to {top:60px; opacity:1}
            }

            @keyframes animatetop 
            {
            from {top:0px; opacity:0}
            to {top:60px; opacity:1}
            }
            
            .map-expedition
            {
                position: fixed;
                width: 380px;
                height: 200px;
                margin-left: 30px;
                margin-top: 110px;
                padding: 15px 20px;
                background-color: white;
                z-index: 20;
                box-shadow: 0 3px 15px #aaa;
            }
            
            .expedition-holder
            {
                width: 100%;
                height: 45px;
            }
            
            .expedition-time
            {
                width: 100%;
                height: 30px;
                font-weight: bold;
                font-size: 15px;
                color: black;
            }
            
            .expedition-time > .icon
            {
                width: 10%;
                height: 30px;
                float: left;
            }
            
            .expedition-time > .text
            {
                width: 90%;
                height: 30px;
                float: left;
            }
            
            .expedition-destination
            {
                width: 100%;
                height: 30px;
                font-weight: bold;
                font-size: 15px;
                color: black;
            }
            
            .expedition-destination > .icon
            {
                width: 10%;
                height: 30px;
                float: left;
            }
            
            .expedition-destination > .text
            {
                width: 90%;
                height: 30px;
                float: left;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }
            
            .expedition-head
            {
                width: 100%;
                height: 30px;
                font-size: 12px;
            }
            
            .expedition-instructions
            {
                width: 100%;
                height: 30px;
            }
            
            .expedition-line
            {
                width: 100%;
                height: 20px;
            }
            
            .en
            {
                background-color: #f7f7f7;
                width: 100%;
                height: 50px;
                color: black;
                text-align: left;
                padding-top: 10px;
                padding-left: 20px;
                padding-right: 30px;
            }
            
            .voucher
            {
                width: 100%;
                height: 50px;
                background-color: #fafafa;
                color: black;
                text-align: left;
                padding-top: 10px;
                padding-left: 20px;
                padding-right: 15px;
            }
            
            .voucher:hover
            {
                background-color: #f7f7f7;
            }
            
            .voucher-icon
            {
                width: 14%;
                height: 20px;
                padding-top: 5px;
                margin-right: 0px;
                float: left;
            }
            
            .voucher-text
            {
                width: 86%;
                height: 15px;
                padding-top: 5px;
                float: left;
            }
            
            .carrier-tip
            {
                width: 100%;
                height: 40px;
                margin-top: 15px;
            }
            
            .company-tip
            {
                width: 100%;
                height: 40px;
                margin-top: 15px;
            }
            
            .voucher-value
            {
                width: 50%;
                height: 100%;
                //border-bottom: 2px solid black;
                float: left;
            }
            
            .change-voucher
            {
                width: 50%;
                height: 100%;
                float: left;
                text-align: right;
            }
            
            .payment-method-value
            {
                width: 40%;
                height: 100%;
                float: left;
            }
            
            .change-payment
            {
                width: 60%;
                height: 100%;
                float: left;
                text-align: right;
            }
            
            .charge-modal
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
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.0); /* Black w/ opacity */
                /* background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
            
            .charge-modal-content 
            {
                display: none;
            position: relative;
            background-color: #fefefe;
            margin-top: -170px;
            margin-left: auto;
            margin-right: auto;
            padding: 0;
            border: 0.2px solid #aaa;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.8),0 6px 20px 0 rgba(0,0,0,0.19);
            border-top-left-radius: 12px;
            width: 500px;
            height: 450px;
            -webkit-animation-name: none;
            -webkit-animation-duration: 0.3s;
            animation-name: none;
            animation-duration: 0.3s
            }
            
            .charge-modal-header 
            {
                //padding: 7px 2px;
                width: 100%;
                height: 70px;
                background-color: #c00c00;
                /* box-shadow: 0px 10px 2px #888888;  */
                color: #fff;
                font-size: 26px;
                //font-weight: bold;
                padding: 20px;
            }
            
            .charge-modal-body 
            {
                display: block;
                padding: 10px 10px;
                width: 100%;
                height: 370px;
                overflow: scroll;
                //background-image: url('images/adorama.jpg');
            }
            
            .charge-modal-button 
            {
                display: block;
                padding: 15px 10px;
                height: 50px;
                background-color: #e00e00;
                color: #ffffff;
                text-align: center;
                font-size: 15px;
                //font-weight: bold;
            }
            
            #charge-message-scarce
            {
                display: block;
                color: #222;
                font-size: 17px;
                font-family: arial;
                text-align: center;
                width: 98%;
                height: 120px;
                margin-left: auto;
                margin-right: auto;
                padding-top: 100px;
            }
            
            .charge-verify-button
            {
                display: block;
                //color: #222;
                font-size: 15px;
                //font-family: arial;
                text-align: center;
                width: 60%;
                height: 40px;
                margin-top: 70px;
                margin-left: auto;
                margin-right: auto;
            }
            
            #charge-message-searching
            {
                display: block;
                color: #222;
                font-size: 17px;
                font-family: arial;
                text-align: center;
                width: 100%;
                height: 20px;
            }
            
            #charge-step-searching
            {
                display: none;
            }
            
            #charge-step-verifying
            {
                display: none;
                width: 100%;
                height: 400px;
                margin-left: auto;
                margin-right: auto;
            }
            
            #charge-step-publishing
            {
                display: none;
            }
            
            #charge-step-placing
            {
                display: none;
            }
            
            #charge-step-placed
            {
                display: none;
            }
            
            #charge-close
            {
                color: white;
            }
    
            .charge-spin-overlay
            {
                display: block;
                //position: absolute; /* Stay in place */
                //z-index: 0; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                margin-top: 0;
                width: 100%; /* Full width */
                height: 200px; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(255,255,255); /* Fallback color */
                //background-color: rgba(255,255,255,0.4); /* Black w/ opacity */
            }
            
            .charge-spin
            {
                width: 40px;
                height: 40px;
                margin-top: 30px;
                left: 50%;
                position: absolute;
                border: 2px solid #f3f3f3;
                border-top: 3px solid #e00e00;
                border-radius: 100%;
                //margin-top: 45px;
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
            color: #f78b88;
            background-color: #e00e00;
        }
        
        .flex-button:hover
        {
            background-color: #c00c00;
        }
        
        
                
          
                
                
                </style>
                </head>
    <body>
        
        
        
        <%
        
        
        session.setAttribute("current-page", "order.jsp");
            
            String scriptedOrder = request.getParameter("order-script");
            
            if (scriptedOrder != null)
                
            {
                session.setAttribute("scripted-order", scriptedOrder);
            }
            
            else
                
            {
                session.setAttribute("scripted-order", "");
            }
            
            
            
            %>
            
            
                
        <div hidden id="destination"><%= session.getAttribute("address").toString() %></div>
        <div hidden id="latitude"><%= session.getAttribute("latitude").toString() %></div>
        <div hidden id="longitude"><%= session.getAttribute("longitude").toString() %></div>
        <div hidden id="scripted-order"><%= session.getAttribute("scripted-order").toString() %></div>
                
            <script>
                var geocoder;
                var map;
                var marker;
                
                
                var scriptedOrder = null;
                var shopsLength = null;
                
                var shopLatFloat = null;
                var shopLongFloat = null;
                
                /*
                 * Google Map with marker
                 */
                
            function initialize() {
                
                
                var initialLat = document.getElementById("latitude").innerHTML; //$('.search_latitude').val();
                var initialLong = document.getElementById("longitude").innerHTML; //$('.search_longitude').val();
                initialLat = initialLat?initialLat:17.377631;
                initialLong = initialLong?initialLong:78.478603;
                
                var scriptedOrderText = document.getElementById("scripted-order").innerHTML;
                scriptedOrder = JSON.parse(scriptedOrderText);
                
                
                shopsLength = Object.keys(scriptedOrder.expedition.outlets).length;
                //alert(shopsLength);
                
                
                
                var shopLatFloat = parseFloat(initialLat) - 0.01;
                var shopLongFloat = parseFloat(initialLong) - 0.01;
                
                var shopLat = "" + shopLatFloat;
                var shopLong = "" + shopLongFloat;
                
                var latlng = new google.maps.LatLng(initialLat, initialLong);
                var options = {
                    zoom: 16.5,
                    center: latlng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                
                map = new google.maps.Map(document.getElementById("geomap"), options);
                
                geocoder = new google.maps.Geocoder();
                
                
                marker = new google.maps.Marker({
                    map: map,
                    draggable: true,
                    position: latlng,
                    icon:'images/building-pin.png'
                    });

                    google.maps.event.addListener(marker, "dragend", function () 
                    
                    {
                    var point = marker.getPosition();
                    map.panTo(point);
                    geocoder.geocode({'latLng': marker.getPosition()}, function (results, status) {
                                     if (status == google.maps.GeocoderStatus.OK) {
                                     map.setCenter(results[0].geometry.location);
                                     marker.setPosition(results[0].geometry.location);
                                     $('.search_addr').val(results[0].formatted_address);
                                     $('.search_latitude').val(marker.getPosition().lat());
                                     $('.search_longitude').val(marker.getPosition().lng());
                                     }
                                     });
                    });
                                        
        
        
        
                //var shopLats = [];
                
                for (var t = 0; t < shopsLength; t++)
                    
                {
                    var shopID = Object.keys(scriptedOrder.expedition.outlets)[t];
                    var shoppLat = scriptedOrder.expedition.outlets[shopID].latitude;
                    var shoppLng = scriptedOrder.expedition.outlets[shopID].longitude;
                    var shoppAddress = scriptedOrder.expedition.outlets[shopID].address;
                    var shoppCity = scriptedOrder.expedition.outlets[shopID].city;
                    var shoppRegion = scriptedOrder.expedition.outlets[shopID].region;
                    var shoppCountry = scriptedOrder.expedition.outlets[shopID].country;
                    var shoppMapAddress = shoppAddress + ", " + shoppCity + ", " + shoppRegion + ", " + shoppCountry;
                    
                    shopLatFloat = parseFloat(shoppLat);
                    shopLongFloat = parseFloat(shoppLng);
                    
                    var storeMarker = new google.maps.Marker({
                       position: new google.maps.LatLng(shopLatFloat, shopLongFloat),
                       map: map,
                       draggable:true,
                       icon:'images/shopping-pin.png'
                    });

                    storeMarker.setMap(map);

                }
            
            //create an interval that opens a payment dialog at the end
            setTimeout(function(){
                    
                    processPayment();
                    
            }, 3000);
            
            var jsonOrder = document.getElementById('json-order-text').value;
            
        }
            
            
            
            
            
            
            
            
            
            
            
            $(document).ready(function () {
                              //load google map
                              initialize();
                              
                              /*
                               * autocomplete location search
                               */
                              var PostCodeid = '#search_location';
                              $(function () {
                                $(PostCodeid).autocomplete({
                                                           source: function (request, response) {
                                                           geocoder.geocode({
                                                                            'address': request.term
                                                                            }, function (results, status) {
                                                                            response($.map(results, function (item) {
                                                                                           return {
                                                                                           label: item.formatted_address,
                                                                                           value: item.formatted_address,
                                                                                           lat: item.geometry.location.lat(),
                                                                                           lon: item.geometry.location.lng()
                                                                                           };
                                                                                           }));
                                                                            });
                                                           },
                                                           select: function (event, ui) {
                                                           $('.search_addr').val(ui.item.value);
                                                           $('.search_latitude').val(ui.item.lat);
                                                           $('.search_longitude').val(ui.item.lon);
                                                           var latlng = new google.maps.LatLng(ui.item.lat, ui.item.lon);
                                                           marker.setPosition(latlng);
                                                           initialize();
                                                           }
                                                           });
                                });
                              
                              /*
                               * Point location on google map
                               */
                              $('.get_map').click(function (e) {
                                                  var address = $(PostCodeid).val();
                                                  geocoder.geocode({'address': address}, function (results, status) {
                                                                   if (status == google.maps.GeocoderStatus.OK) {
                                                                   map.setCenter(results[0].geometry.location);
                                                                   marker.setPosition(results[0].geometry.location);
                                                                   $('.search_addr').val(results[0].formatted_address);
                                                                   $('.search_latitude').val(marker.getPosition().lat());
                                                                   $('.search_longitude').val(marker.getPosition().lng());
                                                                   } else {
                                                                   alert("Geocode was not successful for the following reason: " + status);
                                                                   }
                                                                   });
                                                  e.preventDefault();
                                                  });
                              
                              //Add listener to marker for reverse geocoding
                              google.maps.event.addListener(marker, 'drag', function () {
                                                            geocoder.geocode({'latLng': marker.getPosition()}, function (results, status) {
                                                                             if (status == google.maps.GeocoderStatus.OK) {
                                                                             if (results[0]) {
                                                                             $('.search_addr').val(results[0].formatted_address);
                                                                             $('.search_latitude').val(marker.getPosition().lat());
                                                                             $('.search_longitude').val(marker.getPosition().lng());
                                                                             }
                                                                             }
                                                                             });
                                                            });
                              });

            




                </script>
                
                
                <%
                
                String jsonOrder;
                
                if (session.getAttribute("order-list") != null)
                
                {
                    jsonOrder = session.getAttribute("order-list").toString();
                }
                
                else
                
                {
                    jsonOrder = "no order json added";
                }
                
                %>
                
                
                <div id="corder" hidden><%= jsonOrder %></div>
    
    
    
    <%
        
        long sessionCustomerID = -1;
        CustomerRetrieve sessionCustomer = null;
        
        //session.setAttribute("order-list", "");
        
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
                    <div class="text-holder"><%= session.getAttribute("address").toString().toUpperCase() %></div>
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
                                        
                                        
                                        
                                        <div class="login-modal" id="login-modal">
                                            
                                            <div id='logindrop' class="logindrop">
                                            
                                                
                                                <div class="triangle"></div>
                                                
                                            
                                            <%
            
            
            
            
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
                                                                    <button class="redclicker">LOG IN</button>
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
                                                                    <button class="redclicker">SIGN UP</button>
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
                                                                    <div class="cardowner">Redeem Delivery credits</div>
                                                                </div>
                                                            
                                                            </div>
                                                </div><hr>
                                                <div>My credit cards<hr></div>
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
            
        
        <%
            
            
            DecimalFormat decimalFormat = new DecimalFormat("#0.00");
            
        String subtotal = null;
        String total = null;
        String gst = null;
        String pst = null;
        String techFee = null;
        String transitFee = null;
        String tip = null;
        String groceryCut = "0.00";
        String overlimitCut = "0.00";
        String deliveryFee = null;
        
        double subtotalCalc = 0.00;
        double totalCalc = 0.00;
        double gstCalc = 0.00;
        double pstCalc = 0.00;
        double techFeeCalc = 0.00;
        double transitFeeCalc = 0.00;
        double tipCalc = 0.00;
        double groceryCutCalc = 0.00;
        double overlimitCutCalc = 0.00;
        double deliveryFeeCalc = 0.00;
        
        
        if (request.getParameter("subtotal") != null)
            
        {
            
            if (!request.getParameter("subtotal").equalsIgnoreCase(""))
                
            {
                subtotal = request.getParameter("subtotal");
                subtotalCalc = Double.parseDouble(subtotal);
                gstCalc = 0.08 * subtotalCalc;
                gst = decimalFormat.format(gstCalc);
                pstCalc = 0.05 * subtotalCalc;
                pst = decimalFormat.format(pstCalc);
                techFeeCalc = 4.95;
                techFee = decimalFormat.format(techFeeCalc);
            }
            
        }
        
        if (request.getParameter("grocery-cut") != null)
            
        {
            
            if (!request.getParameter("grocery-cut").equalsIgnoreCase(""))
                
            {
                groceryCut = request.getParameter("grocery-cut");
            }
            
        }
        
        if (request.getParameter("overlimit-cut") != null)
            
        {
            
            if (!request.getParameter("overlimit-cut").equalsIgnoreCase(""))
                
            {
                overlimitCut = request.getParameter("overlimit-cut");
                overlimitCutCalc = Double.parseDouble(overlimitCut);
            }
            
        }
        
        deliveryFeeCalc = techFeeCalc + 0.00;
        deliveryFee = decimalFormat.format(deliveryFeeCalc);
        
        totalCalc = subtotalCalc + gstCalc + pstCalc + deliveryFeeCalc + tipCalc - overlimitCutCalc;
        total = decimalFormat.format(totalCalc);
        
            
            
            %>
        
        
        
        <div class="panel-area">
            
            <div id="geomap"></div>
            
            
            <div class="map-expedition">
                <div class="expedition-holder">
                    <div class=""><h3><b>Expedition in Winnipeg</b></h3></div>
                    <div class=""></div>
                </div>
                <div class="expedition-time">
                    <div class="icon">
                        <img style="height:25px;" src="images/delivery-time.png" alt='time' />
                    </div>
                    <div class="text">23 - 53 mins.</div>
                </div>
                <div class="expedition-destination">
                    <div class="icon">
                        <img style="height:25px;" src="images/marker.png" alt='destination' />
                    </div>
                    <div class="text"><%= session.getAttribute("address").toString() %></div>
                </div>
                <div class="expedition-head">Expedition instructions</div>
                <div class="expedition-instructions">
                    <input id="expedition-instructions" type="text" placeholder="E.g. Buzz 101, call me when you arrive." style='width:100%;border:none;color:#aaa;' />
                </div>
                <div class="expedition-line"></div>
                
            </div>
                
                
                
                
                
                                
                                <div id="voucher-modal" class="voucher-modal">

                                    <div id='voucher-modal-content' class="voucher-modal-content">

                                        <div class="voucher-modal-header">
                                            <span id="label-article-name">Voucher</span>
                                            <span id="voucher-close" class="close" onclick="closeVoucher()">&times;</span>
                                            
                                        </div>
                                        <div id="voucher-modal-body" class="voucher-modal-body">
                                            
                                            <div><img style='height:25px;' src='images/giftbox.png' alt='voucher' />Enter voucher code</div>
                                            <div>
                                                <input style="border:none;background-color:white;width:100%;height:40px;margin-left:auto;margin-right:auto;" type="text" placeholder="E.g. SCREENS24" />
                                            </div>
                                            <div class="voucher-line"></div>
                                            
                                        </div>
                                        <a href="javascript:redeemVoucher()" style='text-decoration:none;color:inherit;'>
                                            <div id="voucher-modal-footer" class="voucher-modal-footer">
                                                <h4 style="text-align:center;color:#fff;">REDEEM</h4>
                                            </div>
                                        </a>

                                    </div>

                                </div>
                
                
                
                
                                
                                <div id="payment-modal" class="payment-modal">

                                    <div id='payment-modal-content' class="payment-modal-content">

                                        <div class="payment-modal-header">
                                            <span id="label-article-name">Payment Method</span>
                                            <span id="payment-close" class="close" onclick="closePaymentMethod()">&times;</span>
                                            
                                        </div>
                                        <div id="payment-modal-body" class="payment-modal-body">
                                            
                                            
                                            
                                        </div>
                                        <a href="javascript:redeemVoucher()" style='text-decoration:none;color:inherit;'>
                                            <div id="payment-modal-footer" class="payment-modal-footer">
                                                <h4 style="text-align:center;color:#fff;">APPLY</h4>
                                            </div>
                                        </a>

                                    </div>

                                </div>
                
                
                
                
            
            
            
            
            <div class="order-panel">
                
                <div class="receipt-sender"><h3>CHILLOUTLETS</h3></div>
                <div class="calculations-holder">
                    <div class="subtotal-calculator">
                        <div class="calc-text">Order subtotal</div>
                        <div class="calc-fee">$<span id="subtotal-span"><%= subtotal %></span></div>
                    </div>
                    <div class="referral-calc">
                        <div class="calc-text">Delivery fee</div>
                        <div class="calc-fee">$<span id="tech-fee-span"><%= deliveryFee %></span></div>
                    </div>
                    
                    <div class="gst-calc">
                        <div class="calc-text">GST</div>
                        <div class="calc-fee">$<span id="gst-span"><%= gst %></span></div>
                    </div>
                    <div class="pst-calc">
                        <div class="calc-text">PST</div>
                        <div class="calc-fee">$<span id="pst-span"><%= pst %></span></div>
                    </div>
                    <div class="referral-calc">
                        <div class="calc-text">Subsidy</div>
                        <div class="calc-fee">-$<span id="grocery-cut-span">0.00</span></div>
                    </div>
                    
                    <div class="carrier-tip">
                        <div class="tip-text">Carrier Tip</div>
                        <div class="tip-fee">
                            <div style="width:100%;height:2px;background-color:#e00e00;"></div>
                            <select style="height:40px;border:none;border-radius:10px;background-color:#e00e00;color:white;text-align:right;">
                                <option value="0.00">$0.00</option>
                                <option value="1.00">$1.00</option>
                                <option value="2.00">$2.00</option>
                                <option value="3.00">$3.00</option>
                                <option value="4.00">$4.00</option>
                                <option value="5.00">$5.00</option>
                                <option value="6.00">$6.00</option>
                                <option value="7.00">$7.00</option>
                                <option value="8.00">$8.00</option>
                                <option value="9.00">$9.00</option>
                            </select>
                            <div style="width:70%;margin-left:auto;margin-right:auto;height:1px;background-color:#e00e00;"></div>
                        </div>
                    </div>
                    
                    <!--
                    <div class="company-tip">
                        <div class="tip-text">Company Tip</div>
                        <div class="tip-fee">
                            <div style="width:100%;height:2px;background-color:#e00e00;"></div>
                            <select style="height:40px;border:none;border-radius:10px;background-color:#e00e00;color:white;text-align:right;">
                                <option style="text-align:right;" value="0.00">$0.00</option>
                                <option value="1.00">$1.00</option>
                                <option value="2.00">$2.00</option>
                                <option value="3.00">$3.00</option>
                                <option value="4.00">$4.00</option>
                                <option value="5.00">$5.00</option>
                                <option value="6.00">$6.00</option>
                                <option value="7.00">$7.00</option>
                                <option value="8.00">$8.00</option>
                                <option value="9.00">$9.00</option>
                                <option value="10.00">$10.00</option>
                            </select>
                        </div>
                    </div> -->
                    
                </div>
                
                <div class="tip-jar-selector"></div>
                <a href="javascript:enterVoucher()" style="text-decoration:none;color:inherit;">
                <div class="voucher">
                    <div class="voucher-icon"><img style="height:20px;" src="images/giftbox.png" alt="cut" /></div>
                    <div class="voucher-text"><div class="voucher-value">CASHSUBSIDY &nbsp; $0.79 </div><div class="change-voucher">VOUCHER CODE</div></div>
                </div>
                </a>
                <a href="javascript:modifyPaymentMethod()" style="text-decoration:none;color:inherit;">
                <div class="voucher">
                    <div class="voucher-icon"><img style="height:20px;" src="images/dollar-symbol.png" alt="cut" /></div>
                    <div class="voucher-text"><div class="payment-method-value">CASH</div><div class="change-payment">CHANGE</div></div>
                </div>
                </a>
                <div class="total-calculator">
                    
                    <div class="total-text">Total</div>
                    <div class="total-fee">$<span id="total-span"><%= total %></span></div>
                    
                </div>
                <div class="credit-card-info"></div>
                <div class="voucher-add"></div>
                
                
                <form hidden id="place-order-form" method='post' action='OrderServlet'>
                    
                    <input type='text' id="subtotal" name="subtotal" value='' />
                    <input type='text' id="total" name="total" value='' />
                    <input type='text' id="gst" name="gst" value='' />
                    <input type='text' id="pst" name="pst" value='' />
                    <input type='text' id="tech-fee" name="tech-fee" value='' />
                    <input type='text' id="transit-fee" name="transit-fee" value='' />
                    <input type='text' id="tip" name="tip" value='' />
                    <input type='text' id="grocery-cut" name="grocery-cut" value='' />
                    <input type='text' id="overlimit-cut" name="overlimit-cut" value='' />
                    
                </form>
                
                
                <div class='checkout-area'>
                    
                    <div hidden><button id="placeorder" onclick="placeOrder()" class="checkout-button">PLACE ORDER</button></div>
                    <a href='javascript:placeOrder()' style='text-decoration:none;color:inherit;'>
                        <div class='flex-button'>PLACE ORDER</div>
                    </a>
                    
                </div>
                
                <div class=""></div>
                
            </div>
                    
                    
                    
                    
                   
                    
                                        
                                
                                <div id="charge-modal" class="charge-modal">

                                    <div id='charge-modal-content' class="charge-modal-content">
                                        
                                        <div class="charge-modal-header">
                                            <span id="label-article-name">Adding Payment Method</span>
                                            <span id="charge-close" class="close">&times;</span>
                                            
                                        </div>
                                        <div id="charge-modal-body" class="charge-modal-body">
                                            
                                            <div id="charge-step-searching">
                                                
                                                <div class='charge-spin-overlay'>
                                                    
                                                    <div class="charge-spin"></div>
                                                    
                                                </div>
                                                
                                                <div id="charge-message-searching">Searching for payment methods...</div>
                                                
                                            </div>
                                            
                                            <div id="charge-step-verifying">
                                                
                                                
                                                <div id="charge-message-scarce">Payments are currently being paid by cash beforehand. 
                                                    Are you able to pay by cash?
                                                </div>
                                                
                                                <div class='charge-verify-button'>
                                                    
                                                    <a href='javascript:continueOrder()' style='text-decoration:none;color:inherit;'>
                                                        <div class='flex-button'>YES, THAT'S FINE!</div>
                                                    </a>
                                                    
                                                </div>
                                            </div>
                                            
                                            <div id="charge-step-publishing">
                                                
                                                <div class='charge-spin-overlay'>
                                                    
                                                    <div class="charge-spin"></div>
                                                    
                                                </div>
                                                
                                                <div id="charge-message-searching">Publishing your order script...</div>
                                                
                                            </div>
                                            
                                            <div id="charge-step-placing">
                                                
                                                <div class='charge-spin-overlay'>
                                                    
                                                    <div class="charge-spin"></div>
                                                    
                                                </div>
                                                
                                                <div id="charge-message-searching">Placing your order...</div>
                                                
                                            </div>
                                            
                                            <div id="charge-step-placed">
                                                <div id="charge-message-scarce">Order Placed. The carrier will be responsible for collecting, packaging and handling of your purchases.</div>
                                                
                                                <img src="" alt="" />
                                                
                                                <br><br><br>
                                                <button id="yes-agreement">I AGREE</button>
                                            </div>
                                            
                                            
                                            
                                        </div>
                                        <a href="javascript:addToOrder()" style='text-decoration:none;color:inherit;'>
                                            <div id="charge-modal-footer" class="charge-modal-footer">
                                                
                                            </div>
                                        </a>
                                        
                                    </div>

                                </div> 
                    
                    
                    
                    
                    
                    
                    
            
            <div hidden>
                <!-- display selected location information -->
                <h4>Location Details</h4>
                <p>Address: <input type="text" class="search_addr" size="45"></p>
                    <p>Latitude: <input type="text" class="search_latitude" size="30"></p>
                        <p>Longitude: <input type="text" class="search_longitude" size="30"></p>
                </div>
            
        </div>
        
        
       
        
<script type="text/javascript">
            
            
            var customerID = null;
            var customerFullName = null;
            var customerCredit = null;
            
            var directionsService = null;
            var directionsDisplay = null;
            var markers = [];
            var carrierLatFloat = null;
            var carrierLongFloat = null;
            
            let orderPlaced = false;
            
            var spinner = document.getElementsByClassName('spinner-overlay')[0];
            var span = document.getElementsByClassName("close")[0];
            var loginModal = document.getElementById("login-modal");
            var loginDrop = document.getElementById("logindrop");
                var voucherModal = document.getElementById('voucher-modal');
                var voucherContent = document.getElementById('voucher-modal-content');
                var voucherClose = document.getElementById('voucher-close');
                var paymentModal = document.getElementById('payment-modal');
                var paymentContent = document.getElementById('payment-modal-content');
                var paymentClose = document.getElementById('payment-close');
                var chargeModal = document.getElementById('charge-modal');
                var chargeContent = document.getElementById('charge-modal-content');
                var chargeClose = document.getElementById('charge-close');
                    
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
                    
                    function register()
                    
                    {
                        document.getElementsByClassName('drop-body-login')[0].style.display = "none";
                        document.getElementsByClassName('drop-body-register')[0].style.display = "block";
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
                
                else if (event.target === voucherModal)
                    
                {
                    voucherContent.style.zIndex = '10';
                    voucherModal.style.zIndex = "10";
                    voucherModal.style.position = "absolute";
                    voucherModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                    voucherModal.style.paddingTop = "50px";
                    voucherModal.style.display = "none";
                    voucherContent.style.display = "none";
                }
                
                else if (event.target === paymentModal)
                    
                {
                    paymentContent.style.zIndex = '10';
                    paymentModal.style.zIndex = "10";
                    paymentModal.style.position = "absolute";
                    paymentModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                    paymentModal.style.paddingTop = "50px";
                    paymentModal.style.display = "none";
                    paymentContent.style.display = "none";
                }
                
            };
            
            function closeVoucher()
            
            {
                
                    voucherContent.style.zIndex = '10';
                    voucherModal.style.zIndex = "10";
                    voucherModal.style.position = "absolute";
                    voucherModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                    voucherModal.style.paddingTop = "50px";
                    voucherModal.style.display = "none";
                    voucherContent.style.display = "none";
                
            }
            
            function closePaymentMethod()
            
            {
                
                    paymentContent.style.zIndex = '10';
                    paymentModal.style.zIndex = "10";
                    paymentModal.style.position = "absolute";
                    paymentModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                    paymentModal.style.paddingTop = "50px";
                    paymentModal.style.display = "none";
                    paymentContent.style.display = "none";
                
                
            }
            
            function placeOrder()
            
            {
                orderPlaced = true;
                
                var placeOrderForm = document.getElementById('place-order-form');
                document.getElementById('subtotal').value = document.getElementById('subtotal-span').innerHTML;
                document.getElementById('total').value = document.getElementById('total-span').innerHTML;
                document.getElementById('gst').value = document.getElementById('gst-span').innerHTML;
                document.getElementById('pst').value = document.getElementById('pst-span').innerHTML;
                //document.getElementById('tech-fee').value = document.getElementById('tech-fee-span').innerHTML;
                //document.getElementById('transit-fee').value = document.getElementById('transit-fee-span').innerHTML;
                document.getElementById('grocery-cut').value = document.getElementById('grocery-cut-span').innerHTML;
                //document.getElementById('overlimit-cut').value = document.getElementById('overlimit-cut-span').innerHTML;
                //alert("1");
                var corder = JSON.parse(document.getElementById("corder").innerHTML);
                //alert("2");
                //alert("subtotal " + corder.orderSubtotal);
                
                var itemsLength = Object.keys(corder.orderList).length;
                var storesLength = 0;
                var storecount = 0;
                
                //alert("items length " + itemsLength);
                
                var orderScript = {};
                
                orderScript["gst"] = "$" + corder.orderGST;
                orderScript["rst"] = "$" + corder.orderPST;
                orderScript["subtotal"] = "$" + corder.orderSubtotal;
                orderScript["total"] = "$" + corder.orderTotal;
                orderScript["carrierStatus"] = "pending";
                orderScript["customerID"] = "833436680641";
                orderScript["datePlaced"] = "7433560455081";
                orderScript["tip"] = "$0.00";
                orderScript["subsidy"] = "$0.00";
                orderScript["voucher"] = {
                    "code": "SCREENS24",
                    "amount": "$0.00"
                };
                
                orderScript["destination"] = {
                    "address": document.getElementById("destination").innerHTML,
                    "latitude": document.getElementById("latitude").innerHTML,
                    "longitude": document.getElementById("longitude").innerHTML
                };
                
                orderScript["deliveryFee"] = "$3.95";
                orderScript["paymentMethod"] = "cash advance";
                orderScript["paymentMade"] = false;
                
                
                for (var itemcount = 0; itemcount < itemsLength; itemcount++)
                    
                {
                    
                    if (storesLength < 1)
                    
                    {
                        var outletStoreId = corder.orderList[0].outletNumber.toString() + "-" + corder.orderList[0].branchNumber.toString();
                        var stockNumber = corder.orderList[0].shelfNumber.toString() + "-" + corder.orderList[0].stockNumber.toString();;
                        
                        //put expedition in orderscript with orderList[0]
                        orderScript["expedition"] = {
                            "duration": "27 - 57 mins",
                            "outlets": {
                                [outletStoreId]: {
                                    "name": corder.orderList[itemcount].outletName,
                                    "address": corder.orderList[itemcount].address,
                                    "city": corder.orderList[itemcount].city,
                                    "region": corder.orderList[itemcount].region,
                                    "country": corder.orderList[itemcount].country,
                                    "latitude": corder.orderList[itemcount].latitude,
                                    "longitude": corder.orderList[itemcount].longitude,
                                    "collected": false,
                                    "items": {
                                        [stockNumber]: {
                                            "name": corder.orderList[itemcount].stockName,
                                            "price": "$" + corder.orderList[itemcount].price,
                                            "quantity": corder.orderList[itemcount].quantity,
                                            "stockImage": corder.orderList[itemcount].stockImage,
                                            "entryState": corder.orderList[itemcount].entryState,
                                            "collected": false
                                        }
                                    }
                                }
                            }
                        };
                        
                        storesLength++;
                        
                    }
                    
                    else
                    
                    {
                        var outletStoreId = corder.orderList[itemcount].outletNumber.toString() + "-" + corder.orderList[itemcount].branchNumber.toString();
                        var stockNumber = corder.orderList[itemcount].shelfNumber.toString() + "-" + corder.orderList[itemcount].stockNumber.toString();;
                        
                        //alert("outletStoreId " + outletStoreId);
                        //alert("outlet found key " + Object.keys(orderScript.expedition.outlets)[storecount]);
                        
                        var storeFound = false;
                        
                        //if a storeid is not found with same id, create a new storeid, else use found id
                        for (var stocount = 0; stocount < storesLength; stocount++)
                            
                        {
                            if (outletStoreId === Object.keys(orderScript.expedition.outlets)[stocount])
                            
                            {
                                storeFound = true;
                            }
                            
                        }
                            
                            if (storeFound === false)
                            
                            {
                                
                                //put expedition in orderscript with orderList[0]
                                orderScript["expedition"] = {
                                    "duration": "29 - 59 mins",
                                    "outlets": {
                                        [outletStoreId]: {
                                            "name": corder.orderList[itemcount].outletName,
                                            "address": corder.orderList[itemcount].address,
                                            "city": corder.orderList[itemcount].city,
                                            "region": corder.orderList[itemcount].region,
                                            "country": corder.orderList[itemcount].country,
                                            "latitude": corder.orderList[itemcount].latitude,
                                            "longitude": corder.orderList[itemcount].longitude,
                                            "collected": false,
                                            "items": {
                                                [stockNumber]: {
                                                    "name": corder.orderList[itemcount].stockName,
                                                    "price": "$" + corder.orderList[itemcount].price,
                                                    "quantity": corder.orderList[itemcount].quantity,
                                                    "stockImage": corder.orderList[itemcount].stockImage,
                                                    "entryState": corder.orderList[itemcount].entryState,
                                                    "collected": false
                                                }
                                            }
                                        }
                                    }
                                };
                            }
                            
                            else    
                            
                            {
                                
                                //put expedition in orderscript with orderList[0]
                                orderScript.expedition.outlets[outletStoreId].items[stockNumber] = {
                                    "name": corder.orderList[itemcount].stockName,
                                    "price": "$" + corder.orderList[itemcount].price,
                                    "quantity": corder.orderList[itemcount].quantity,
                                    "stockImage": corder.orderList[itemcount].stockImage,
                                    "entryState": corder.orderList[itemcount].entryState,
                                    "collected": false
                                };
                                
                                storecount++;
                                storesLength++;
                                
                            } 
                            
                        
                        
                    }
                    
                }
                
                
                
                //processPayment();
                
                
                
                var carrierRef = firebase.database().ref().child('orders/3562751872');
                carrierRef.set(orderScript);
                
                var crRef = firebase.database().ref().child('corders/35627521872');
                crRef.set(corder);
                
                
                
                directionsService = new google.maps.DirectionsService();
                directionsDisplay = new google.maps.DirectionsRenderer({
                    polylineOptions: {
                      strokeColor: "#c00c00",
                        strokeOpacity: 0.7,
                        strokeWeight: 7
                    }
                  });
                
                
                directionsDisplay.setMap(map);
                calculateAndDisplayRoute(directionsService, directionsDisplay);
                
                //alert("added to firebase");
                
                //placeOrderForm.submit();
            }
      

      function calculateAndDisplayRoute(directionsService, directionsDisplay) 
      
      {
          //waypoints array
        var waypts = [];
        
        
        for (var i = 0; i < shopsLength; i++) 
        
        {
            var shopID = Object.keys(scriptedOrder.expedition.outlets)[i];
            var shoppLat = scriptedOrder.expedition.outlets[shopID].latitude;
            var shoppLng = scriptedOrder.expedition.outlets[shopID].longitude;
            var shoppAddress = scriptedOrder.expedition.outlets[shopID].address;
            var shoppCity = scriptedOrder.expedition.outlets[shopID].city;
            var shoppRegion = scriptedOrder.expedition.outlets[shopID].region;
            var shoppCountry = scriptedOrder.expedition.outlets[shopID].country;
            var shoppMapAddress = shoppAddress + ", " + shoppCity + ", " + shoppRegion + ", " + shoppCountry;

            shopLatFloat = parseFloat(shoppLat);
            shopLongFloat = parseFloat(shoppLng);
            
            waypts.push({
              location: shoppMapAddress,
              stopover: true
            });
          
        }
        
        
        
            var carMarker = new google.maps.Marker({
               position: new google.maps.LatLng(carrierLatFloat, carrierLongFloat),
               map: map,
               draggable:true,
               icon:'images/car64.png'
            });
            
            
            for (var v = 0; v < markers.length; v++)
                
            {
                markers[v].setMap(null);
            }
            
            markers = [];
            
            //carMarker.setMap(map);
            markers.push(carMarker);
            
            for (var v = 0; v < markers.length; v++)
                
            {
                markers[v].setMap(map);
            }
        
        
        directionsService.route({
            
          origin: new google.maps.LatLng(carrierLatFloat, carrierLongFloat),  //document.getElementById('start').value,
          destination: document.getElementById("destination").innerHTML,
          waypoints: waypts,
          optimizeWaypoints: true,
          travelMode: 'DRIVING'
          
        }, function(response, status) 
        
        {
          if (status === 'OK') 
          
          {
            directionsDisplay.setDirections(response);
            var route = response.routes[0];
            
            var waypointLegs = JSON.stringify(route);
            
            
                var directionsRef = firebase.database().ref().child('orders/3562751872/expedition/directions');
                directionsRef.set(waypointLegs);
            
            //alert(waypointLegs);
            
            /*
            var summaryPanel = document.getElementById('directions-panel');
            summaryPanel.innerHTML = '';
            
            
            // For each route, display summary information.
            for (var i = 0; i < route.legs.length; i++) {
              var routeSegment = i + 1;
              summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment +
                  '</b><br>';
              summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
              summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
              summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
            } */
            
          } 
          
        else 
        
          {
            //window.alert('Directions request failed due to ' + status);
          }
          
        }); //directionsService made
        
      }
      
      
            
            var latitudeRef = firebase.database().ref().child('carriers/8137721630172/latitude');
                latitudeRef.on('value', function(snapshot) {
                    carrierLatFloat = parseFloat(snapshot.val());
                    //setMapOnAll(null);
                    
                    if (orderPlaced)
                        
                    {
                        calculateAndDisplayRoute(directionsService, directionsDisplay);
                    }
                    
                    //alert(snapshot.val());
                });
      
            
            var longitudeRef = firebase.database().ref().child('carriers/8137721630172/longitude');
                longitudeRef.on('value', function(snapshot) {
                    carrierLongFloat = parseFloat(snapshot.val());
                    //setMapOnAll(null);
                    
                    if (orderPlaced)
                        
                    {
                        calculateAndDisplayRoute(directionsService, directionsDisplay);
                    }
                    
                    //alert(snapshot.val());
                });
                
            
            function enterVoucher()
            
            {
                //create voucher-modal and display
                
                voucherContent.style.zIndex = '204';
                voucherModal.style.zIndex = "200";
                voucherModal.style.position = "fixed";
                voucherModal.style.backgroundColor = "rgba(0,0,0,0.6)";
                voucherModal.style.paddingTop = "90px";
                voucherModal.style.display = "block";
                voucherContent.style.display = "block";
            }
            
            function modifyPaymentMethod()
            
            {
                //create payment-modal and display
                paymentContent.style.zIndex = '204';
                paymentModal.style.zIndex = "200";
                paymentModal.style.position = "fixed";
                paymentModal.style.backgroundColor = "rgba(0,0,0,0.6)";
                paymentModal.style.paddingTop = "90px";
                paymentModal.style.display = "block";
                paymentContent.style.display = "block";
            }
            
            function processPayment()
            
            {
                //create charge-modal and display
                chargeContent.style.zIndex = '204';
                chargeModal.style.zIndex = "200";
                chargeModal.style.position = "fixed";
                chargeModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                //chargeModal.style.paddingTop = "90px";
                chargeModal.style.display = "block";
                chargeContent.style.display = "block";
                
                document.getElementById('charge-step-searching').style.display = "block";
                
                setTimeout(function()
                
                    {
                        document.getElementById('charge-step-searching').style.display = "none";
                        document.getElementById('charge-step-verifying').style.display = "block";
                        
                        
                    }, 1000);
                    
                
            }
            
            function continueOrder()
            
            {
                //create charge-modal and display
                chargeContent.style.zIndex = '0';
                chargeModal.style.zIndex = "0";
                chargeModal.style.position = "absolute";
                chargeModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                //chargeModal.style.paddingTop = "90px";
                chargeModal.style.display = "none";
                chargeContent.style.display = "none";
                
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
