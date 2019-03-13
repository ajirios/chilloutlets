<%-- 
    Document   : explore
    Created on : 6-Sep-2018, 9:29:43 PM
    Author     : ajirios
--%>

<%@page import="order.OrderRebuild"%>
<%@page import="customer.CustomerRetrieve"%>
<%@page import="shop.Shop"%>
<%@page import="com.google.gson.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html>
    <head>
        <title>Shop @ Chilloutlets</title>
        <link rel="shortcut icon" type="image/png" href="images/chilliredup.png"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
            <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDgh6-uYI5m95sBlU4oC5UB0pzh2o0FTsI"></script>
            
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
                
                .panel-area
                {
                    width: 100%;
                    height: 100vh;
                    overflow: visible;
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
                    height: 100%;
                    width: 100px;
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
                    width: calc(100% - 100px);
                    margin-top: 90px;
                    margin-left: 100px;
                    //background-color: bisque;
                }
                
                .entrace-top
                {
                    height: 95px;
                    width: 96%;
                    margin-top: 5px;
                    margin-left: auto;
                    margin-right: auto;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    background-color: wheat;
                    background-size: cover;
                    color: #fff;
                    //float: left;
                }
                
                .entrace-top > img 
                {
                    max-height: 94%;
                    max-width: 100%;
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
                    height: 100%;
                    width: 350px;
                    right: 0px;
                    background-color: #eee;
                    box-shadow: 0px 4px 15px #888;
                    float: right;
                }
                
                .incentive-promo
                {
                    width: 100%;
                    height: 50px;
                    margin-top: 70px;
                    margin-left: auto;
                    margin-right: auto;
                    background-color: #668702;
                    color: white;
                    text-align: center;
                    font-size: 16px;
                    padding-top: 12px;
                }
                
                .product-search
                {
                    width: 90%;
                    height: 40px;
                    margin-top: 20px;
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
                    height: 150px;
                    margin-top: 30px;
                    margin-left: 125px;
                }
                
                .start-building-msg
                {
                    display: block;
                    color: #777;
                    font-family: Roboto;
                    font-size: 15px;
                    text-align: center;
                    width: 90%;
                    margin-top: 40px;
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
                    height: 160px;
                    background-color: #fff;
                    padding: 5px 5px;
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
                    height: 40px;
                    padding-top: 3px;
                    padding-bottom: 3px;
                }
                
                .item-count
                {
                    width: 7%;
                    margin-left: 3%;
                    margin-right: 0%;
                    height: 34px;
                    color: #e00800;
                    font-size: 14px;
                    font-family: arial;
                    font-weight: bold;
                    float: left;
                }
                
                .item-name
                {
                    width: 56%;
                    height: 34px;
                    margin-left: 2%;
                    margin-right: 2%;
                    color: #333;
                    font-size: 14px;
                    font-family: arial;
                    font-weight: bold;
                    float: left;
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: nowrap;
                }
                
                .item-price
                {
                    width: 16%;
                    height: 34px;
                    margin-left: 2%;
                    margin-right: 2%;
                    color: #333;
                    font-size: 14px;
                    font-family: arial;
                    font-weight: bold;
                    text-align: right;
                    float: left;
                }
                
                .item-remove
                {
                    width: 10%;
                    margin-left: 0%;
                    margin-right: 0%;
                    height: 34px;
                    color: #aaa;
                    font-size: 20px;
                    float: left;
                }
                
                .branch
                {
                    width: 90px;
                    height: 90px;
                    margin-top: 10px;
                    margin-left: 5px;
                    background-color: white;
                }
                
                .branch > img
                {
                    width: 90px;
                    height: 90px;
                }
                
                .store-inside
                {
                    width: 100%;
                    height: 90%;
                    margin-top: 10%;
                    background-color: #eee;
                    overflow: scroll;
                }
                
                .shelf
                {
                    width: 96%;
                    height: 150px;
                    margin-top: 10px;
                    margin-left: 2%;
                    margin-right: 2%;
                    float: left;
                }
                
                .shelf-bottom
                {
                    width: 100%;
                    height: 30px;
                    background-color: #444;
                }
                
                .shelf-top
                {
                    width: 100%;
                    height: 120px;
                    background-color: #fff;
                }
                
                .picture-item
                {
                    width: 120px;
                    height: 120px;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    float: left;
                }
                
                .picture-item > img
                {
                    max-width:100%;
                    max-height:100%;
                }
                
                .tag-field
                {
                    width: 120px;
                    height: 20px;
                    margin-top: 5px;
                    float: left;
                }
                
                .price-tag
                {
                    width: 60px;
                    height: 20px;
                    margin-left: 30px;
                    margin-right: 30px;
                    background-color: #fff;
                    //border-top: 2px solid #e00b00;
                    text-align: center;
                    font-size: 12px;
                    font-weight: bold;
                    color: black;
                }
                
                .outlet-button
                {
                    background-color: #e00800;
                    color: #fff;
                    font-size: 15px;
                    text-align: center;
                    width: 200px;
                    height: 35px;
                    margin-right: 5px;
                    float: left;
                }
                
                .cat-button
                {
                    background-color: #e00800;
                    color: #fff;
                    font-size: 15px;
                    text-align: center;
                    width: 200px;
                    margin-left: 5px;
                    height: 35px;
                    float: left;
                }
                
                .search-query
                {
                    width: 300px;
                    height: 35px;
                    float: left;
                }
                
                .door
                {
                    display: block;
                    height: calc(100% - 200px);
                    width: calc(92% - 400px);
                    margin-top: 10px;
                    margin-left: 2%;
                    margin-right: 2%;
                    z-index: 10;
                    position: absolute;
                }
                
                .left-door
                {
                    height: 100%;
                    width: 50%;
                    margin-left: 0px;
                    margin-right: 0px;
                    z-index: 10;
                    float: left;
                }
                
                .left-frame
                {
                    height: 100%;
                    width: 39px;
                    margin-left: 0px;
                    margin-right: 0px;
                    border-left: 1px solid #333;
                    background-color: #fff;
                    z-index: 10;
                    float: left;
                }
                
                .right-door
                {
                    height: 100%;
                    width: 50%;
                    margin-left: 0px;
                    margin-right: 0px;
                    z-index: 10;
                    float: left;
                }
                
                .right-frame
                {
                    height: 100%;
                    width: 39px;
                    margin-left: 0px;
                    margin-right: 0px;
                    border-right: 1px solid #333;
                    background-color: #fff;
                    z-index: 10;
                    float: left;
                }
                
                .left-pane
                {
                    height: 100%;
                    width: calc(100% - 40px);
                    margin-left: 0px;
                    margin-right: 0px;
                    background-color: #333;
                    z-index: 10;
                    opacity: 0.5;
                    float: left;
                }
                
                .right-pane
                {
                    height: 100%;
                    width: calc(100% - 40px);
                    margin-left: 0px;
                    margin-right: 0px;
                    background-color: #333;
                    z-index: 10;
                    opacity: 0.5;
                    float: left;
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
            
            .previous-handle
            {
                display: none;
                height: 50px;
                width: 50px;
                margin-top: 205px;
                margin-left: 1%;
                margin-right: calc(93% - 450px);
                z-index: 9;
                position: absolute;
                background-color: #e00800;
                border-radius: 25px;
                box-shadow: 0 3px 8px #777;
            }
            
            .previous-pointer
            {
                height: 50px;
                width: 50px;
                border-radius: 25px;
            }
            
            .next-handle
            {
                display: block;
                height: 50px;
                width: 50px;
                margin-top: 200px;
                margin-right: 0%;
                margin-left: calc(94% - 450px);
                z-index: 9;
                position: absolute;
                background-color: #e00800;
                border-radius: 25px;
                box-shadow: 0 3px 8px #777;
            }
            
            .next-pointer
            {
                height: 50px;
                width: 50px;
                border-radius: 25px;
            }
            
            .shelf-flat
            {
                display: block;
                height: 2px;
                width: calc(92% - 400px);
                margin-top: 0px;
                margin-left: 2%;
                margin-right: 0%;
                z-index: 9;
                position: absolute;
                background-color: #e00800;
            }
            
            .shelf-panel
            {
                display: block;
                height: 30px;
                width: 300px;
                margin-top: 0px;
                margin-right: 18.1%;
                margin-left: calc(75.9% - 700px);
                z-index: 9;
                position: absolute;
                background-color: #e00800;
                color: white;
                font-weight: bold;
                border-bottom-left-radius: 70px;
                border-bottom-right-radius: 70px;
                box-shadow: 0 3px 8px #777;
            }
            
            .shelf-label
            {
                height: 25px;
                width: 250px;
                padding-top: 2.5px;
                margin-left: 25px;
                margin-right: 25px;
                padding-bottom: 2.5px;
                text-align: center;
            }
            
            .modal
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
            
            .modal-content 
            {
            position: relative;
            background-color: #fefefe;
            margin-top: -70px;
            margin-left: auto;
            margin-right: auto;
            padding: 0;
            border: 0.2px solid #aaa;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.8),0 6px 20px 0 rgba(0,0,0,0.19);
            border-top-left-radius: 12px;
            width: 400px;
            height: 580px;
            -webkit-animation-name: none;
            -webkit-animation-duration: 0.3s;
            animation-name: none;
            animation-duration: 0.3s
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
                height: 60px;
                background-color: #e00b00;
                /* box-shadow: 0px 10px 2px #888888;  */
                color: white;
                font-size: 26px;
                //font-weight: bold;
                padding: 20px;
            }

            .modal-body 
            {
                display: none;
                padding: 2px 10px;
                height: 490px;
                overflow: scroll;
                background-color: #eee;
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
            
            .spinner-overlay
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
            
            .spinner
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
            
            .modal-body-image
            {
                width: 100%;
                min-height: 200px;
            }
            
            .modal-body-image > img
            {
                width: 100%;
            }
            
            .modal-body-controls
            {
                width: 100%;
                min-height: 200px;
                background-color: #eee;
            }
            
            .modal-body-article
            {
                width: 100%;
                min-height: 200px;
            }
            
            .log-modal
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
            
            .log-modal-content 
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
            width: 700px;
            height: 450px;
            -webkit-animation-name: none;
            -webkit-animation-duration: 0.3s;
            animation-name: none;
            animation-duration: 0.3s
            }
            
            .log-modal-header 
            {
                padding: 7px 2px;
                height: 60px;
                background-color: #fff;
                /* box-shadow: 0px 10px 2px #888888;  */
                color: #444;
                font-size: 26px;
                //font-weight: bold;
                padding: 30px;
            }

            .log-modal-body 
            {
                display: none;
                padding: 20px 140px;
                height: 380px;
                overflow: scroll;
                //background-image: url('images/adorama.jpg');
            }

            .log-modal-button 
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
            
            .log-modal-swap
            {
                width: 100%;
                height: 30px;
                margin-bottom: 20px;
                padding-top: 10px;
                text-align: right;
                text-decoration-line: none;
                text-decoration: none !important;
                color: #f50;
                font-size: 12px;
            }

            .log-modal-button:hover
            {
                background-color: #c00c00;
            }
            
            .log-modal-email
            {
                width: 100%;
                height: 70px;
                margin-top: 30px;
                margin-bottom: 10px;
            }
            
            .log-modal-password
            {
                width: 100%;
                height: 90px;
                margin-top: 0px;
                margin-bottom: 10px;
            }
            
            .log-modal-email-splash
            {
                display: none;
            }
            
            .log-modal-password-splash
            {
                display: none;
            }
            
            .log-modal-email-underline
            {
                width: 100%;
                height: 2px;
                margin-top: 0px;
                margin-bottom: 10px;
                background-color: #eee;
            }
            
            .log-modal-password-underline
            {
                width: 100%;
                height: 2px;
                margin-top: 0px;
                margin-bottom: 10px;
                background-color: #eee;
            }
            
            .log-in-modal-body
            {
                display: block;
            }
            
            .sign-up-modal-body
            {
                display: none;
            }
            
            .sign-up-modal-button 
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
            
            .sign-up-modal-swap
            {
                width: 100%;
                height: 30px;
                margin-bottom: 20px;
                padding-top: 10px;
                text-align: right;
                text-decoration-line: none;
                text-decoration: none !important;
                color: #f50;
                font-size: 12px;
            }
            
            .sign-up-modal-button:hover
            {
                background-color: #c00c00;
            }
            
            .sign-up-modal-name-splash
            {
                display: none;
            }
            
            .sign-up-modal-mobile-splash
            {
                display: none;
            }
            
            .sign-up-modal-email-splash
            {
                display: none;
            }
            
            .sign-up-modal-confirm-splash
            {
                display: none;
            }
            
            .sign-up-modal-password-splash
            {
                display: none;
            }
            
            .sign-up-modal-name-underline
            {
                width: 100%;
                height: 2px;
                margin-top: 0px;
                margin-bottom: 0px;
                background-color: #eee;
            }
            
            .sign-up-modal-mobile-underline
            {
                width: 100%;
                height: 2px;
                margin-top: 0px;
                margin-bottom: 0px;
                background-color: #eee;
            }
            
            .sign-up-modal-email-underline
            {
                width: 100%;
                height: 2px;
                margin-top: 0px;
                margin-bottom: 0px;
                background-color: #eee;
            }
            
            .sign-up-modal-password-underline
            {
                width: 100%;
                height: 2px;
                margin-top: 0px;
                margin-bottom: 0px;
                background-color: #eee;
            }
            
            .sign-up-modal-confirm-underline
            {
                width: 100%;
                height: 2px;
                margin-top: 0px;
                margin-bottom: 0px;
                background-color: #eee;
            }
            
            .sign-up-modal-name-underline
            {
                width: 100%;
                height: 2px;
                margin-top: 0px;
                margin-bottom: 0px;
                background-color: #eee;
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
            color: #fff;
            background-color: #e00e00;
        }
        
        .flex-button:hover
        {
            background-color: #c00c00;
        }
            
            
                
                
                
                </style>
                </head>
                
    <body onload="optimizeShop()">
    
    
    
    <%
        
        
        session.setAttribute("current-page", "shop.jsp");
        
        long sessionCustomerID = -1;
        CustomerRetrieve sessionCustomer = null;
        
        if (session.getAttribute("customer-id") == null)
        
        {
            sessionCustomerID = -1;
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
    
    
        
        <div id="customer-id-tag" hidden><%= sessionCustomerID %></div>
        
        
    <script>
        
        $('body').on('contextmenu', 'img', function(e) {return false;});
        $('body').on('contextmenu', 'video', function(e) {return false;});
        
    </script>
    
        
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
                                        
                    
                    
                    <div id="door-state"><%= session.getAttribute("door-state").toString() %></div>
                    
                    
                                            
                                        
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
                                                                    <div class="cardowner">Credits</div>
                                                                </div>
                                                            
                                                            </div>
                                                </div><hr>
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
                                                <div class="" style="width:100%;height:60px;box-shadow:0 9px 8px #aaa;font-size:20px;color:#000;font-family:arial;padding:20px;">Change delivery speed</div>
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
                    
    
    
    <%

        String ticketInput = null;
        Gson gson = new Gson();
        JsonArray ticketArray = null;
        JsonObject ticket = null;
        
        if (request.getParameter("ticket-input") != null)
            
        {
            
            ticketInput = request.getParameter("ticket-input");
            session.setAttribute("ticket-input", ticketInput);
            JsonParser parser = new JsonParser();
            JsonElement tradeElement = parser.parse(ticketInput);
            ticketArray = tradeElement.getAsJsonArray();
            
        }
        
        else
            
        {
            ticketInput = session.getAttribute("ticket-input").toString();
        }
        


%>
        
    
    
        
        <div class="panel-area">
            <div class="explore-panel">
                
                <div class="filter-panel">
                    <br><br><br><br><br><br>
                    
    
    
    <%

        String outletNumber = null;
        String branchNumber = null;
        String jsonOutletNumber = null;
        String jsonBranchNumber = null;
        String outletName = null;
        String branchLocation = null;
        String poster = null;
        
        int shopElement = 0;
        int shopOutletNumber = 10;
        int shopBranchNumber = 7100;
        
        String shelfNumber = null;
        
        
        
        if (request.getParameter("outlet-number") != null)
            
        {
            outletNumber = request.getParameter("outlet-number");
        }
        
        if (request.getParameter("branch-number") != null)
            
        {
            branchNumber = request.getParameter("branch-number");
        }
        
        if (request.getParameter("shelf-number") != null)
            
        {
            shelfNumber = request.getParameter("shelf-number");
        }
        
        
        if (ticketArray != null)
            
        {
            
            
            for (int count = 0; count < ticketArray.size(); count++)
                
            {
                ticket = ticketArray.get(count).getAsJsonObject();
                
                if (count == 0)
                    
                {
                    if (outletNumber == null)
                        
                    {
                        outletNumber = ticket.get("outletNum").getAsString();
                    }
                    
                    if (branchNumber == null)
                        
                    {
                        branchNumber = ticket.get("branchNum").getAsString();
                    }
                    
                    if (shelfNumber == null)
                        
                    {
                        shelfNumber = "1";
                    }
                }
                
                jsonOutletNumber = ticket.get("outletNum").getAsString();
                jsonBranchNumber = ticket.get("branchNum").getAsString();
                outletName = ticket.get("name").getAsString();
                branchLocation = ticket.get("location").getAsString();
                poster = "/outlets/" + ticket.get("poster").getAsString();

%>
        
                    
                    
                <a href="javascript:browseShop('<%= jsonOutletNumber %>', '<%= jsonBranchNumber %>')">    
                    <div class="branch">
                        <img src="<%= poster %>" />
                    </div>
                </a>
                    
                    
    
    <%

            }
            
        }


%>
                    
                    
                    
                </div>
                
                <div class="sliding-scene">
                    
                    <div class="entrace-top">
                        <img src="/outlets/Shoppers/safeway.jpg" />
                    </div>
                    
                    
                    
                    <div class="inlet">
                        
                        <%
        
        int shopShelfNumber = Integer.parseInt(shelfNumber);
        shopOutletNumber = Integer.parseInt(outletNumber);
        shopBranchNumber = Integer.parseInt(branchNumber);
        
        //out.println(outletNumber + " " + branchNumber + " " + shelfNumber);
        
        Shop shop = new Shop(shopOutletNumber, shopBranchNumber, shopShelfNumber);
        
        String shelfName = shop.getShelfName();
        
        int column;
        int row;
        int columnSize = shop.getColumnSize();
        int rowSize = 6;
        
        for (column = 0; column < columnSize; column++)
            
        {
        
        
        %>
                        
                    <div class="shelf">
                        <div class="shelf-top">
                            
                            <%
            
            
            for (row = 0; (row < rowSize) && (shop.getShelves(column, row) != null); row++)
                
            {
                
            
            
            %>
                            
            
                <a href="javascript:retrieveStockArticle('<%= shop.getShelves(column, row).getStockNumber() %>', '<%= shop.getShelves(column, row).getStockName().replace("'", "\\'") %>', '<%= "/outlets/" + shop.getShelves(column, row).getStockImage() %>', '<%= shop.getShelves(column, row).getPrice() %>')"><div class="picture-item"><img src="<%= "/outlets/" + shop.getShelves(column, row).getStockImage() %>" /></div></a>
                            
                            
                            <%
            
            
            }
                
            
            
            %>
                            
                        </div>
                        <div class="shelf-bottom">
                            
                            <%
            
            
            for (row = 0; (row < rowSize) && (shop.getShelves(column, row) != null); row++)
                
            {
                
            
            
            %>
                            
                            
                            
                            <div class="tag-field">
                                <div class="price-tag"><%= shop.getShelves(column, row).getPrice() %></div>
                            </div>
                            
                            
                            
                            <%
            
            
            }
                
            
            
            %>
            
            
            
                        </div>
                        </div>
        
        
                        
                        <%
        
        }
        
        OrderRebuild reorder = null;
        String orderJSON = "no order";
        
        
        if (session.getAttribute("order-list") != null)
            
        {
            
            orderJSON = session.getAttribute("order-list").toString();
            reorder = new OrderRebuild(orderJSON);
            
        }
        
        
        
        
        
        
        
        %>
                        
        
                    
                    </div>
        
        
        <div id="corder" hidden><%= orderJSON %></div>
        
        
        <form hidden id="shop-form" method="post" action="shop.jsp">
            
            <input type="text" id="shop-outlet-number" name="outlet-number" value="<%= outletNumber %>" />
            <input type="text" id="shop-branch-number" name="branch-number" value="<%= branchNumber %>" />
            <input type="text" id="shop-shelf-number" name="shelf-number" value="<%= shelfNumber %>" />
            <input type="text" id="shop-count" value="<%= shop.getShopCount() %>" />
            
            <input type="text" id="ticket-input" name="ticket-input" value="" />
            
        </form>
        
        
                    <div class="previous-handle">
                        <a href="javascript:visitPreviousShelves()">
                        <div class="previous-pointer">
                            <i class="fa fa-arrow-left" style="font-size:30px;color:#fff;margin-top:9px;margin-left:13px;"></i>
                        </div>
                        </a>
                    </div>
        
                    <div class="next-handle">
                        <a href="javascript:visitNextShelves()">
                        <div class="next-pointer">
                            <i class="fa fa-arrow-right" style="font-size:30px;color:#fff;margin-top:9px;margin-left:13px;"></i>
                        </div>
                        </a>
                    </div>
        
                    
        
                    <div class="shelf-flat"></div>
                    <div class="shelf-panel">
                        <div class="shelf-label">
                            <span class="shelf-label-header"><%= shelfName %></span>
                        </div>
                    </div>
                    
                    
                    
                    <div class="door">
                        <a href="javascript:openDoors()">
                        
                        <div class="left-door">
                            <div class="left-pane"></div>
                            <div class="left-frame"></div>
                        </div>
                        <div class="right-door">
                            <div class="right-frame"></div>
                            <div class="right-pane"></div>
                        </div>
                        </a>
                    </div>
                    
                                        
                                
                                <div id="log-modal" class="log-modal">

                                    <div id='log-modal-content' class="log-modal-content">

                                        <div class="log-modal-header">
                                            <span id="">Please Sign In or Sign Up to Continue</span>
                                            <span class="close">&times;</span>
                                            
                                        </div>
                                        <div id="log-modal-body" class="log-modal-body">
                                            
                                            <div id="log-in-modal-body" class="log-in-modal-body">
                                                
                <form id="log-in-modal-form" method="post" action="Login">
                        
                                                <div class="log-modal-email">
                                                    <div class="log-modal-email-splash">Email</div>
                                                    <div class="log-modal-email-input">
                                                        <input type="text" name="customer-email" placeholder="Email" style="border:none;background-color:white;color:#444;font-size:15px;" />
                                                    </div>
                                                    <div class="log-modal-email-underline"></div>
                                                </div>
                                                
                                                <div class="log-modal-password">
                                                    <div class="log-modal-password-splash">Password</div>
                                                    <div class="log-modal-password-input">
                                                        <input type="password" name="customer-password" placeholder="Password" style="border:none;background-color:white;color:#444;font-size:15px;" />
                                                    </div>
                                                    <div class="log-modal-password-underline"></div>
                                                </div>

                                                <div class="log-modal-swap">
                                                    <a href="javascript:enterSignUpModal()" style='text-decoration:inherit;color:inherit;'>
                                                        <div style='text-decoration:none;'>Don't have an account currently? Sign up here.</div>
                                                    </a>
                                                </div>
                                                
                                                <div hidden>
                                                    <input type="text" id="log-outlet-number" name="outlet-number" value="<%= outletNumber %>" />
                                                    <input type="text" id="log-branch-number" name="branch-number" value="<%= branchNumber %>" />
                                                    <input type="text" id="log-shelf-number" name="shelf-number" value="<%= shelfNumber %>" />
                                                    
                                                </div>

                                                <a href="javascript:submitAccountLogIn()" style='text-decoration:none;color:inherit;'>
                                                    <div id="log-modal-button" class="log-modal-button">LOG IN</div>
                                                </a>
                                                
                                                    <div hidden><input id="log-in-modal-submit" type="button" hidden /></div>
                                                
                                            </form>
                                            </div>
                                            
                                            

                                            <div id="sign-up-modal-body" class="sign-up-modal-body">
                                                
                                            <form id="sign-up-modal-form" method="post" action="LogRegister" onsubmit="return true">
                    
                                                <div class="sign-up-modal-name">
                                                    <div class="sign-up-modal-name-splash">Name</div>
                                                    <div class="sign-up-modal-name-input">
                                                        <input type="text" name="customer-full-name" placeholder="Name" style="border:none;background-color:white;color:#444;font-size:15px;" />
                                                    </div>
                                                    <div class="sign-up-modal-name-underline"></div>
                                                </div>
                                                
                                                <div class="sign-up-modal-email">
                                                    <div class="sign-up-modal-email-splash">Email</div>
                                                    <div class="sign-up-modal-email-input">
                                                        <input type="text" name="customer-email-address" placeholder="Email" style="border:none;background-color:white;color:#444;font-size:15px;" />
                                                    </div>
                                                    <div class="sign-up-modal-email-underline"></div>
                                                </div>
                                                
                                                <div class="sign-up-modal-mobile">
                                                    <div class="sign-up-modal-mobile-splash">Mobile number</div>
                                                    <div class="sign-up-modal-mobile-input">
                                                        <input type="text" name="customer-phone-number" placeholder="Mobile number" style="border:none;background-color:white;color:#444;font-size:15px;" />
                                                    </div>
                                                    <div class="sign-up-modal-mobile-underline"></div>
                                                </div>
                                                
                                                <div class="sign-up-modal-password">
                                                    <div class="sign-up-modal-password-splash">Password</div>
                                                    <div class="sign-up-modal-password-input">
                                                        <input type="password" name="customer-password" placeholder="Password" style="border:none;background-color:white;color:#444;font-size:15px;" />
                                                    </div>
                                                    <div class="sign-up-modal-password-underline"></div>
                                                </div>
                                                
                                                <div class="sign-up-modal-password">
                                                    <div class="sign-up-modal-confirm-splash">Password Confirmation</div>
                                                    <div class="sign-up-modal-password-input">
                                                        <input type="password" name="confirm-password" placeholder="Try Password Again" style="border:none;background-color:white;color:#444;font-size:15px;" />
                                                    </div>
                                                    <div class="sign-up-modal-confirm-underline"></div>
                                                </div>
                                                
                                                <div hidden>
                                                    <input type="text" id="sign-up-outlet-number" name="outlet-number" value="<%= outletNumber %>" />
                                                    <input type="text" id="sign-up-branch-number" name="branch-number" value="<%= branchNumber %>" />
                                                    <input type="text" id="sign-up-shelf-number" name="shelf-number" value="<%= shelfNumber %>" />
                                                    
                                                </div>
                                                
                                                <div class="log-modal-swap">
                                                    <a href="javascript:enterLogInModal()" style='text-decoration:inherit;color:inherit;'>
                                                        <div style='text-decoration:none;'>Don't have an account currently? Log in here.</div>
                                                    </a>
                                                </div>
                                                
                                                <a href="javascript:submitAccountSignUp()" style='text-decoration:none;color:inherit;'>
                                                    <div id="sign-up-modal-button" class="sign-up-modal-button">SIGN UP</div>
                                                </a>
                                                
                                                    <div hidden><input id="sign-up-modal-submit" type="button" hidden /></div>
                                                
                                                </form>
                                            </div>
                                        
                                            
                                            
                                        </div>

                                    </div>

                                </div>
                    
                                        
                                                    
                                                    
                                                    
                                                    
                                                    
                                                    
                                
                                <div id="myModal" class="modal">

                                    <div id='modal-content' class="modal-content">

                                        <div class="modal-header">
                                            <span id="label-article-name">French Toast Crunch</span>
                                            <span class="close">&times;</span>
                                            
                                        </div>
                                        <div id="modal-body" class="modal-body">
                                            
                                            <div class="modal-body-image">
                                                <img id="label-article-image" src="/outlets/Shoppers/french-toast-crunch.jpg" alt="main-image" />
                                            </div>
                                            
                                            <div class="modal-body-controls">
                                                
                                                <h3 hidden>Price CAD<span id="label-article-price" hidden>$7.99</span></h3>
                                                <div hidden><input hidden type="text" id="stock-number-input" value="" /></div>
                                                
                                                <div class="" style="background-color:#eee;width:100%;height:300px;">
                                                    
                                                    <div class="" style="width:100%;height:60px;padding-top:30px;font-size:20px;font-family:arial;color:#333;">Kellogg's Frosted Flakes 200mL</div>
                                                    <div class="" style="width:100%;height:140px;padding-top:10px;font-size:12px;font-family:arial;color:#333;">
                                                        Kellogg's Frosted Flakes cereal is a source of 8 essential nutrients and has no artificial flavours or colours. The sweet, crunchy flakes help give kids a great start to their day as part of a nutritious breakfast. THEY'RE GR-R-REAT!
                                                    </div>
                                                    
                                                    <!--
                                                    <div class="" style="width:100%;height:150px;padding-top:10px;">
                                                        <textarea rows="4" cols="5"></textarea>
                                                    </div>
                                                    -->
                                                    
                                                    <div class="" style="width:150px;height:50px;margin-left:auto;margin-right:auto;margin-bottom:10px;font-family:arial;">
                                                        <a href="javascript:subtractOneProduct()" style="text-decoration:inherit;"><div class="" style="width:50px;height:50px;text-align:center;color:#e00e00;float:left;background-color:#fafafa;border:1px solid #eee;border-radius:4px;font-size:19px;padding:12px;">&minus;</div></a>
                                                        <div class="" style="width:50px;height:50px;text-align:center;color:#e00e00;float:left;background-color:#fafafa;border:1px solid #eee;border-radius:4px;font-size:19px;padding:12px;">1</div>
                                                        <a href="javascript:addOneProduct()" style="text-decoration:inherit;"><div class="" style="width:50px;height:50px;text-align:center;color:#e00e00;float:left;background-color:#fafafa;border:1px solid #eee;border-radius:4px;font-size:19px;padding:12px;">&plus;</div></a>
                                                    </div>
                                                    
                                                </div>
                                                
                                            </div>
                                            
                                            <!--
                                            <div class="modal-body-article"><img src="/outlets/Shoppers/french-toast-crunch.jpg" alt="main-image" /></div>
                                            -->                                            
                                            
                                        </div>
                                        <a href="javascript:addToOrder()" style='text-decoration:none;color:inherit;'>
                                            <div id="modal-footer" class="modal-footer">
                                                <div style="width:100%;">
                                                    
                                                    <div style="width:70%;float:left;text-align:center;color:#fff;">ADD TO ORDER</div>
                                                    <div style="width:30%;float:left;text-align:center;color:#fff;">$<span id="add-order-price">9.99</span></div>
                                                    
                                                </div>
                                            </div>
                                        </a>

                                    </div>

                                </div>
                                                    
                                                    
                                                    
                    
                    
                    
                    
                    
                </div>
                
                
            </div>
        
        <form hidden id="checkout-form" method='post' action='order.jsp'>
            
            <input type='text' id="subtotal" name="subtotal" value='' />
            <input type='text' id="grocery-cut" name="grocery-cut" value='' />
            <input type='text' id="overlimit-cut" name="overlimit-cut" value='' />
            <input type="text" id="order-script-input" name="order-script" />
            
        </form>
        
            <div class="order-panel">
                <div class="incentive-promo">You are $39.09 away from -$5.00</div>
                <div class="product-search"><input type="text" placeholder="Search product" /></div>
                <img class="bag" src="images/red-shopping-bag.png" alt='bag' />
                
                
                <%
                    
                    
                    if (session.getAttribute("order-list") == null)
                        
                    {
                        
                    
                    %>
                    
                    
                    <div class="start-building-msg">Start building your order by adding items from your personalized market.</div>
                
                
                <%
                    }
                    
                    else
                        
                    {
                    
                    if (reorder.getOrder().getOrderSubtotal().equalsIgnoreCase("0.00"))
                        
                    {
                        
                    
                    %>
                    
                    
                <div class="start-building-msg">Start building your order by adding items from your personalized market.</div>
                    
                
                <%
                    
                    
                    }
                    
                    else
                        
                    {
                    
                    
                    %>
                
                    
                <div class="subtotal-checker">
                    <div class="checker">Order Subtotal</div>
                    <div class="subtotal">$<span id="subtotal-double"><%= reorder.getOrder().getOrderSubtotal() %></span></div>
                </div>
                
                
                
                <div class='checkout-area'>
                    
                    <div hidden><button onclick="checkout()" class="checkout-button">CHECKOUT</button></div>
                    <a href='javascript:checkout()' style='text-decoration:none;color:inherit;'>
                        <div class='flex-button'>CHECKOUT</div>
                    </a>
                    
                </div>
                
                
                <div class="order-list">
                    <div class="order-list-header"></div>
                
                <%
                    
                    
                    for (int count = 0; count < reorder.getOrder().getOrderList().size(); count++)
                        
                    {
                    
                    %>
                    
                    
                    <div class="order-item">
                        
                        <a style="color:inherit;text-decoration:inherit;" href='javascript:editItem()'>
                        <div class="item-count"><%= reorder.getOrder().getOrderList().get(count).getQuantity() %></div>
                        </a>
                        
                        <a style="color:inherit;text-decoration:inherit;" href='javascript:editItem()'>
                            <div class="item-name"><%= reorder.getOrder().getOrderList().get(count).getStockName() %></div>
                        </a>
                        
                        <a style="color:inherit;text-decoration:inherit;" href='javascript:editItem()'>
                        <div class="item-price">$<%= reorder.getOrder().getOrderList().get(count).getPrice() %></div>
                        </a>
                        
                        <a style="color:inherit;text-decoration:inherit;" href='javascript:crossItem()'>
                        <div id="item-remove" class="item-remove">&Cross;</div>
                        </a>
                        
                    </div>
                    
                
                <%
                    
                    }
                    
                    %>
                    
                    
                    
                </div>
                
                
                <%
                    
                    
                    }
                    
                }
                    
                    
                    %>
                
                    
                
            </div>
        </div>
        
        
        
        <script type="text/javascript">
            
            
            var header = document.getElementsByTagName("header")[0];
            var modal = document.getElementById("myModal");
            var modalContent = document.getElementById("modal-content");
            var modalBody = document.getElementById("modal-body");
            var modalFooter = document.getElementById("modal-footer");
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
            
            
            var logModal = document.getElementById("log-modal");
            var logModalContent = document.getElementById("log-modal-content");
            var logModalBody = document.getElementById("log-modal-body");
            
            
                    
                    function setActive()
                    
                    {
                        modal.style.position = "absolute";
                        modalContent.style.animationName = "none";
                        modalContent.style.WebkitAnimationName = "none";
                        modal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        modal.style.paddingTop = "300px";
                        modalBody.style.display = "none";
                        modalFooter.style.display = "none";
                        modal.style.display = "none";
                        
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
                        modal.style.position = "absolute";
                        modalContent.style.animationName = "none";
                        modalContent.style.WebkitAnimationName = "none";
                        modal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        modal.style.paddingTop = "300px";
                        modalBody.style.display = "none";
                        modalFooter.style.display = "none";
                        modal.style.display = "none";
                        
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
                        modal.style.position = "absolute";
                        modalContent.style.animationName = "none";
                        modalContent.style.WebkitAnimationName = "none";
                        modal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        modal.style.paddingTop = "300px";
                        modalBody.style.display = "none";
                        modalFooter.style.display = "none";
                        modal.style.display = "none";
                        
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
                        modal.style.position = "absolute";
                        modalContent.style.animationName = "none";
                        modalContent.style.WebkitAnimationName = "none";
                        modal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        modal.style.paddingTop = "300px";
                        modalBody.style.display = "none";
                        modalFooter.style.display = "none";
                        modal.style.display = "none";
                        
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
                        modal.style.position = "absolute";
                        modalContent.style.animationName = "none";
                        modalContent.style.WebkitAnimationName = "none";
                        modal.style.backgroundColor = "rgba(0,0,0,0.0)";
                        modal.style.paddingTop = "300px";
                        modalBody.style.display = "none";
                        modalFooter.style.display = "none";
                        modal.style.display = "none";
                        
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
                
                else if (event.target === modal)
                    
                {
                    
                    modal.style.zIndex = "0";
                    modal.style.position = "absolute";
                    modalContent.style.animationName = "none";
                    modalContent.style.WebkitAnimationName = "none";
                    modal.style.backgroundColor = "rgba(0,0,0,0.0)";
                    modal.style.paddingTop = "300px";
                    modalBody.style.display = "none";
                    modalFooter.style.display = "none";
                    modal.style.display = "none";
                }
                
                else if (event.target === logModal)
                    
                {
                    
                    logModal.style.zIndex = "0";
                    logModal.style.position = "absolute";
                    logModalContent.style.animationName = "none";
                    logModalContent.style.WebkitAnimationName = "none";
                    logModal.style.backgroundColor = "rgba(0,0,0,0.0)";
                    logModal.style.paddingTop = "300px";
                    logModalBody.style.display = "none";
                    logModalContent.style.display = "none";
                    logModal.style.display = "none";
                }
                
            };
            
            
            
            function checkout()
            
            {
                var checkoutForm = document.getElementById('checkout-form');
                document.getElementById('subtotal').value = document.getElementById('subtotal-double').innerHTML;
                
                var doors = document.getElementsByClassName('door')[0];
                doors.style.display = 'block';
                
                
                var xml = new XMLHttpRequest();

                  xml.onreadystatechange = function() {

                      if (xml.readyState == 4)

                      {

                          if (xml.status == 200)

                          {
                              //alert("door session open");
                          }

                      }

                  };
                  
                  var post = "";

                  xml.open("GET", "DoorCloseServlet?" + post, true);
                  xml.send();
                  
                
                var subtotal = document.getElementById('subtotal-double').innerHTML;
                var subtotalCalc = parseFloat(subtotal);
                
                if (subtotalCalc >= 100.00)
                    
                {
                    document.getElementById('overlimit-cut').value = "15.00";
                }
                
                var corder = JSON.parse(document.getElementById("corder").innerHTML);
                
                //alert("subtotal " + corder.orderSubtotal);
                
                var itemsLength = Object.keys(corder.orderList).length;
                var storesLength = 0;
                var storecount = 0;
                
                //alert("items length " + itemsLength);
                
                var orderScript = {};
                
                orderScript["gst"] = "$" + corder.orderGST;
                orderScript["rst"] = "$" + corder.orderPST;
                orderScript["subtotal"] = "$" + corder.orderSubtotal;
                
                
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
                
                
                var orderText = JSON.stringify(orderScript);
                document.getElementById("order-script-input").value = orderText;
                //alert(orderText);
                
                
                if (document.getElementById("customer-id-tag").innerHTML === "-1")
                    
                {
                    //logging customer in
                    logModal.style.zIndex = "100";
                    logModal.style.position = "fixed";
                    logModalContent.style.animationName = "block";
                    logModalContent.style.WebkitAnimationName = "block";
                    logModal.style.backgroundColor = "rgba(0,0,0,0.6)";
                    logModal.style.paddingTop = "300px";
                    logModalBody.style.display = "block";
                    logModalContent.style.display = "block";
                    logModal.style.display = "block";
                }
                
                else
                
                {
                    checkoutForm.submit();
                }
                
                
                
            }
            
            function browseShop(outletNumber, branchNumber)
            
            {
                var shopForm = document.getElementById('shop-form');
                
                var doors = document.getElementsByClassName('door')[0];
                doors.style.display = 'block';
                
                
                var xml = new XMLHttpRequest();

                  xml.onreadystatechange = function() {

                      if (xml.readyState == 4)

                      {

                          if (xml.status == 200)

                          {
                              //alert("door session open");
                          }

                      }

                  };
                  
                  var post = "";

                  xml.open("GET", "DoorCloseServlet?" + post, true);
                  xml.send();
                
                document.getElementById('shop-outlet-number').value = outletNumber;
                document.getElementById('shop-branch-number').value = branchNumber;
                document.getElementById('shop-shelf-number').value = "1";
                document.getElementById('ticket-input').value = document.cookie;
                
                shopForm.submit();
            }
            
            function openDoors()
            
            {
                var doors = document.getElementsByClassName('door')[0];
                doors.style.display = 'none';
                
                
                var xml = new XMLHttpRequest();

                  xml.onreadystatechange = function() {

                      if (xml.readyState == 4)
                      
                      {
                          
                          if (xml.status == 200)

                          {
                              //alert("door session open");
                          }

                      }

                  };
                  
                  var post = "";

                  xml.open("GET", "DoorOpenServlet?" + post, true);
                  xml.send();

            }
            
            
            
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
            
            function retrieveStockArticle(stockNumber, stockName, stockImage, stockPrice)
            
            {
                modal.style.position = "fixed";
                modal.style.zIndex = "300";
                modalContent.style.animationName = "animatetop";
                modalContent.style.WebkitAnimationName = "animatetop";
                modal.style.backgroundColor = "rgba(0,0,0,0.6)";
                modal.style.paddingTop = "100px";
                modalBody.style.display = "block";
                modalFooter.style.display = "block";
                modal.style.display = "block";
                
                document.getElementById('stock-number-input').value = stockNumber;
                
                if (stockPrice.charAt(0) === '$')
                    
                {
                    stockPrice = stockPrice.substring(1);
                }
                
                var outletNumber = document.getElementById('shop-outlet-number').innerHTML;
                var branchNumber = document.getElementById('shop-branch-number').innerHTML;
                var shelfNumber = document.getElementById('shop-shelf-number').innerHTML;
                document.getElementById('label-article-name').innerHTML = stockName;
                document.getElementById('label-article-price').innerHTML = "$" + stockPrice;
                document.getElementById('label-article-image').src = stockImage;
                document.getElementById('add-order-price').innerHTML = stockPrice;
            }
            
            function addToOrder()
            
            {
                //add to order
                /*
                var subtotal = document.getElementById('subtotal-double').innerHTML;
                var subtotalCalc = parseFloat(subtotal);
                var price = document.getElementById('add-order-price').innerHTML;
                var priceCalc = parseFloat(price);
                
                var calculation = subtotalCalc + priceCalc;
                document.getElementById('subtotal-double').innerHTML = Number((calculation).toFixed(2));
                */
               
                //turn off
                modal.style.position = "absolute";
                modalContent.style.animationName = "none";
                modalContent.style.WebkitAnimationName = "none";
                modal.style.backgroundColor = "rgba(0,0,0,0.0)";
                modal.style.paddingTop = "300px";
                modalBody.style.display = "none";
                modalFooter.style.display = "none";
                modal.style.display = "none";
                
                var outletNumber = document.getElementById('shop-outlet-number').value;
                var branchNumber = document.getElementById('shop-branch-number').value;
                var shelfNumber = document.getElementById('shop-shelf-number').value;
                var stockNumber = document.getElementById('stock-number-input').value;
                var stockName = document.getElementById('label-article-name').innerHTML;
                var stockPrice = document.getElementById('add-order-price').innerHTML;
                var stockImage = document.getElementById('label-article-image').src;


                var xml = new XMLHttpRequest();

                  xml.onreadystatechange = function() {

                      if (xml.readyState == 4)

                      {

                          if (xml.status == 200)

                          {
                              
                              //alert("xml " + xml.responseText);
                              
                                var order = xml.responseXML.getElementsByTagName("Order")[0];
                                var customerID = order.getElementsByTagName("customerID")[0].firstChild.nodeValue;
                                var orderNumber = order.getElementsByTagName("orderNumber")[0].firstChild.nodeValue;
                                var orderSubtotal = order.getElementsByTagName("orderSubtotal")[0].firstChild.nodeValue;
                                
                                //document.getElementById('subtotal-double').innerHTML = orderSubtotal;
                                
                                var stocks = order.getElementsByTagName("Stock");
                                
                                //alert(document.cookie);
                                
                                spinner.style.display = "block";
                                spinner.style.zIndex = "300";
                                
                                setTimeout(function(){
                                    location.reload();
                                }, 2000);
                                
                                
                              
                          }
                          //alert("xml readyState " + xml.readyState + " status " + xml.status);
                      }

                  };

                  var post = "session-outlet-number=" + outletNumber + "&session-branch-number=" + branchNumber + "&session-shelf-number=" + shelfNumber
                   + "&session-stock-number=" + stockNumber + "&session-stock-name=" + stockName + "&session-stock-price=" + stockPrice + "&session-stock-image=" + stockImage;

                  xml.open("GET", "OrderSessionServlet?" + post, true);
                  xml.send();

                
            }
            
            function visitNextShelves()
            
            {
                var shopForm = document.getElementById('shop-form');
                var outletNumber = document.getElementById('shop-outlet-number');
                var branchNumber = document.getElementById('shop-branch-number');
                var shelfNumber = document.getElementById('shop-shelf-number');
                var shopCount = document.getElementById('shop-count');
                
                var calcShelfNumber = parseInt(shelfNumber.value);
                var calcShopCount = parseInt(shopCount.value);
                
                if (calcShelfNumber <= calcShopCount)
                    
                {
                    calcShelfNumber++;
                    document.getElementById('shop-shelf-number').value = calcShelfNumber;
                    document.getElementById('ticket-input').value = document.cookie;
                    shopForm.submit();
                }
                
                
            }
            
            function visitPreviousShelves()
            
            {
                var shopForm = document.getElementById('shop-form');
                var outletNumber = document.getElementById('shop-outlet-number');
                var branchNumber = document.getElementById('shop-branch-number');
                var shelfNumber = document.getElementById('shop-shelf-number');
                var calcShelfNumber = parseInt(shelfNumber.value);
                
                if (calcShelfNumber > 0)
                    
                {
                    calcShelfNumber--;
                    document.getElementById('shop-shelf-number').value = calcShelfNumber;
                    document.getElementById('ticket-input').value = document.cookie;
                    shopForm.submit();
                }
                
                
            }
            
            function optimizeShop()
            
            {
                var shelfNumber = document.getElementById('shop-shelf-number');
                var calcShelfNumber = parseInt(shelfNumber.value);
                
                if (calcShelfNumber > 1)
                    
                {
                    document.getElementsByClassName('previous-handle')[0].style.display = "block";
                    document.getElementsByClassName('door')[0].style.display = "none";
                }
                
                else
                    
                {
                    document.getElementsByClassName('previous-handle')[0].style.display = "none";
                    
                    setTimeout(function(){
                        
                        //document.getElementsByClassName('door')[0].style.display = "none";
                        
                    }, 2000);
                    
                    //document.getElementsByClassName('door')[0].style.display = "none";
                }
                
                
                if (document.getElementById('door-state').innerHTML === "open")
                    
                {
                    var doors = document.getElementsByClassName('door')[0];
                    doors.style.display = 'none';
                }
                
                else
                
                {
                    var doors = document.getElementsByClassName('door')[0];
                    doors.style.display = 'block';
                }
                
            }
    
    function addStockToOrder(stockNumber)
    
    {
        var outletNumber = document.getElementById('shop-outlet-number').value;
        var branchNumber = document.getElementById('shop-branch-number').value;
        var shelfNumber = document.getElementById('shop-shelf-number').value;
        var stockName = document.getElementById('label-article-name').innerHTML;
        var stockPrice = document.getElementById('add-order-price').innerHTML;
        var stockImage = document.getElementById('label-article-image').src;
        
        
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

          var post = "session-outlet-number=" + outletNumber + "&session-branch-number=" + branchNumber + "&session-shelf-number=" + shelfNumber
           + "&session-stock-number=" + stockNumber + "&session-stock-name=" + stockName + "&session-stock-price=" + stockPrice + "&session-stock-image=" + stockImage;

          xml.open("GET", "OrderSessionServlet?" + post, true);
          xml.send();
          
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
    
    function enterSignUpModal()
    
    {
        document.getElementById("log-in-modal-body").style.display = "none";
        document.getElementById("sign-up-modal-body").style.display = "block";
    }
    
    function enterLogInModal()
    
    {
        document.getElementById("sign-up-modal-body").style.display = "none";
        document.getElementById("log-in-modal-body").style.display = "block";
    }
    
    function submitAccountLogIn()
    
    {
        document.getElementById("log-in-modal-form").submit();
    }
    
    function submitAccountSignUp()
    
    {
        document.getElementById("sign-up-modal-form").submit();
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
