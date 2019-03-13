<%-- 
    Document   : store
    Created on : 20-Dec-2018, 8:54:03 AM
    Author     : mac
--%>

<%@page import="shelves.Shelves"%>
<%@page import="outlet.store.Store"%>
<%@page import="port.Port"%>
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
        <title>Add Goods to your Store</title>
        <link rel="shortcut icon" type="image/png" href="../../images/chilliredup.png"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
            <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFj2N3AJH2KQcjFL00WxtGSZJsfI7wxoA"></script>
            
		<link rel="stylesheet" href="../../assets/css/main.css" />
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
                
                .area-span
                {
                    width: 100%;
                    height: 60px;
                    margin-top: 10px;
                    margin-left: auto;
                    margin-right: auto;
                }
                
                .product-span
                {
                    width: 100%;
                    height: 40px;
                    margin-top: 5px;
                    margin-left: auto;
                    margin-right: auto;
                }
                
                .product-span > input
                {
                    width: 100%;
                    height: 40px;
                }
                
                .product-search
                {
                    width: 90%;
                    height: 275px;
                    margin-top: 120px;
                    margin-left: auto;
                    margin-right: auto;
                }
                
                .product-search > input
                {
                    width: 100%;
                    height: 40px;
                }
                
                .bag
                {
                    height: 150px;
                    margin-top: 30px;
                    margin-left: 95px;
                }
                
                .license-uploader
                {
                    width: 100%;
                    height: 140px;
                    background-color: #eee;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    background-image: url('../../images/plus.png');
                    background-size: contain;
                    background-repeat: no-repeat;
                    background-position: center;
                    margin-bottom: 30px;
                }
                
                .license-uploader > img
                {
                    max-width:100%;
                    max-height:100%;
                }
                
                .start-building-msg
                {
                    display: block;
                    color: #777;
                    font-family: Roboto;
                    font-size: 18px;
                    font-weight: normal;
                    text-align: left;
                    width: 100%;
                    margin-top: 40px;
                    margin-left: auto;
                    margin-right: auto;
                    height: 40px;
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
                    height: 170px;
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
                    height: 30px;
                    font-size: 14px;
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
                
                .picture-item-edit
                {
                    width: 120px;
                    height: 120px;
                    //border: 0.5px solid #aaa;
                    //border-radius: 5px;
                    float: left;
                }
                
                .stock-name-show
                {
                    width: 100%;
                    height: 70%;
                    padding-top: 12%;
                    margin-left: auto;
                    margin-right: auto;
                    padding-bottom: 2%;
                    font-size: 12px;
                    text-align: center;
                    text-decoration-line: none;
                    color: #c00c00;
                    background-color: #fff;
                }
                
                .stock-editor
                {
                    width: 100%;
                    height: 30%;
                    margin-left: auto;
                    margin-right: auto;
                    font-size: 10px;
                    text-decoration-line: none;
                    background-color: #fff;
                }
                
                .stock-name-copy
                {
                    width: 33.3%;
                    height: 100%;
                    float: left;
                }
                
                .stock-name-copy > img
                {
                    height: 20px;
                    display: none;
                }
                
                .stock-image-upload
                {
                    width: 33.3%;
                    height: 100%;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    float: left;
                }
                
                .stock-image-upload > img
                {
                    height: 20px;
                    max-width:100%;
                    max-height:100%;
                }
                
                .stock-save-changes
                {
                    width: 33.3%;
                    height: 100%;
                    float: left;
                }
                
                .stock-save-changes > img
                {
                    height: 20px;
                    display: none;
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
                width: 300px;
                height: 500px;
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
            }
            
            .modal-body-article
            {
                width: 100%;
                min-height: 200px;
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
            margin-bottom: 10px;
        }
        
        #platform-select
        {
            width: 100%;
            height: 40px;
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
        
        #platform-panel
        {
            top: 30px;
            padding-top: 10px;
            padding-bottom: 10px;
            width: 317px;
            height: 560px;
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
            text-decoration: inherit;
        }
        
        .focused
        {
            background-color: #ddd;
        }
                
                
                
                </style>
                </head>
                
    <body onload="optimizeShop()">
    
    
    
    <%
        


        
        
        %>
    
    
    <script>
        
        $('body').on('contextmenu', 'img', function(e) {return false;});
        $('body').on('contextmenu', 'video', function(e) {return false;});
        
    </script>
    
        
        <header>
                                    <a href="store.jsp" style="text-decoration:none;color:inherit;"><div style="text-decoration:none;color:inherit;float:left;">
            <img src="../../images/chilloutlets.png" style="margin-left:15px;height:30px;margin-top:28px;" />
            <!-- <img src='images/transparent-white.png' style="margin-left:2px;height:15px;" /> -->
                                        </div></a>
            
            <div class="toolholder">
            <a href="javascript:setActive()" style="text-decoration:none;color:inherit;">
            <div class="nav-tools">
                <div class="tool-label">Store Portal</div>
                <div class="selected-tool">
                    <div class="text-holder">SAFEWAY - RIVERDALE</div>
                    <div id="nav-caret" class="caret-holder"><i class="fa fa-caret-down" style="font-size:15px"></i></div>
                </div>
            </div>
            </a>
                </div>
        </header>
                                        
                                            
                                        
                                        <div class='spinner-overlay'>
                                            
                                            <div class="spinner"></div>
                                            
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
        
        else
            
        {
            shelfNumber = "1";
        }
        
        shelfNumber = "1";
        int shopShelfNumber = Integer.parseInt(shelfNumber);
        
        
        //Shop store = new Shop(shopOutletNumber, shopBranchNumber, shopShelfNumber);
        Store store = new Store(shopOutletNumber, shopBranchNumber, shopShelfNumber);
        
        poster = "/outlets/safeway.jpeg";
        
        
        
%>
        
                    
                    
                <a href="javascript:browseShop('<%= shopOutletNumber %>', '<%= shopBranchNumber %>')">    
                    <div class="branch">
                        <img src="<%= poster %>" />
                    </div>
                </a>
                    
                    
    
    <%

           
    
%>
                    
                    
                    
                </div>
                
                <div class="sliding-scene">
                    
                    <div class="entrace-top">
                        <img src="/outlets/Shoppers/safeway.jpg" />
                    </div>
                    
                    
                    
                    <div class="inlet">
                        
                        <%
        
        
        
        //out.println(outletNumber + " " + branchNumber + " " + shelfNumber);
        
        String shelfName = store.getShelfName();
        
        int counter = 0;
        int column;
        int row;
        int columnSize = store.getColumnSize();
        int rowSize = 6;
        
        for (column = 0; column < columnSize; column++)
            
        {
        
        
        %>
                        
                    <div class="shelf">
                        <div class="shelf-top">
                            
                            <%
            
            
            for (row = 0; (row < rowSize) && (store.getShelves(column, row) != null); row++)
                
            {
                
                
            String image = store.getShelves(column, row).getStockImage();
            
            if (image != null)
                
            {
            
            %>
                            
            
                <a href="javascript:retrieveStockArticle('<%= store.getShelves(column, row).getStockNumber() %>', '<%= store.getShelves(column, row).getStockName().replace("'", "\\'") %>', '<%= "/outlets/" + store.getShelves(column, row).getStockImage() %>', '<%= store.getShelves(column, row).getPrice() %>')"><div class="picture-item"><img src="<%= "/outlets/" + store.getShelves(column, row).getStockImage() %>" /></div></a>
                            
                            
                            <%
            
            
            }
            
            else
                
            {
                
                image = "../../images/add.png";
                
            
            %>
                            
            <div class="picture-item-edit">
                    
                    <div class="stock-name-show">
                        <a style="text-decoration-line:none;color:inherit;" href="javascript:copyName(<%= counter %>)">
                           <%= store.getShelves(column, row).getStockName() %>
                        </a>
                        
                           <div hidden><textarea class="copy-clipboard-textarea"><%= store.getShelves(column, row).getStockName() %></textarea></div>
                        <div hidden><input type="text" value="<%= store.getShelves(column, row).getStockName() %>" class="copy-clipboard-input"></div>
                    </div>
                    <div class="stock-editor">
                        <div id="stock-name-copy" class="stock-name-copy"><img src="../../images/cut-content-button.png" alt="copy" title="Copy name" /></div>
                        
                        <a href="javascript:retrieveStockArticle('<%= store.getShelves(column, row).getStockNumber() %>', '<%= store.getShelves(column, row).getStockName().replace("'", "\\'") %>', '<%= "../../images/add.png" %>', '<%= store.getShelves(column, row).getPrice() %>')">
                           <div id="stock-image-upload" class="stock-image-upload"><img src="../../images/plus.png" alt="upload" title="Upload image" /></div>
                        </a>
                           
                        <a href="javascript:retrieveStockArticle('<%= store.getShelves(column, row).getStockNumber() %>', '<%= store.getShelves(column, row).getStockName().replace("'", "\\'") %>', '<%= "../../images/add.png" %>', '<%= store.getShelves(column, row).getPrice() %>')">
                            <div id="stock-save-changes" class="stock-save-changes"><img src="../../images/arrow-shuffle.png" alt="apply" title="Apply changes" /></div>
                        </a>
                    </div>
                </div>
                            
                            
                            <%
            
                            counter++;
                            
            }
            
            }
                
            
            
            %>
                            
                        </div>
                        <div class="shelf-bottom">
                            
                            <%
            
            
            for (row = 0; (row < rowSize) && (store.getShelves(column, row) != null); row++)
                
            {
                
            
            
            %>
                            
                            
                            
                            <div class="tag-field">
                                <div class="price-tag"><%= store.getShelves(column, row).getPrice() %></div>
                            </div>
                            
                            
                            
                            <%
            
            
            }
                
            
            
            %>
            
            
            
                        </div>
                        </div>
        
        
                        
                        <%
        
        }
        
        OrderRebuild reorder = null;
        
        
        if (session.getAttribute("order-list") != null)
            
        {
            
            String orderJSON = session.getAttribute("order-list").toString();
            reorder = new OrderRebuild(orderJSON);
            
        }
        
        
        
        
        
        
        
        %>
                        
        
                    
                    </div>
        
        
        <form hidden id="shop-form" method="post" action="store.jsp">
            
            <input type="text" id="shop-outlet-number" name="outlet-number" value="<%= outletNumber %>" />
            <input type="text" id="shop-branch-number" name="branch-number" value="<%= branchNumber %>" />
            <input type="text" id="shop-shelf-number" name="shelf-number" value="<%= shelfNumber %>" />
            <input type="text" id="shop-count" value="<%= store.getShopCount() %>" />
            
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
                                                <h3>Price CAD<span id="label-article-price">$7.99</span></h3>
                                                <div hidden><input hidden type="text" id="stock-number-input" value="" /></div>
                                                <span>Enjoy Chocolate Cheerios cereal—a perfect balance of whole grain goodness and delicious 
                                                    chocolate taste. Made with whole-grain oats, and real cocoa they’re now gluten-free and have 
                                                    only 8 grams of sugar. A heart-healthy choice for 
                                                    our whole family, and a great combination that will make you and your family smile.</span>
                                                
                                            </div>
                                            <div class="modal-body-article"><img src="/outlets/Shoppers/french-toast-crunch.jpg" alt="main-image" /></div>
                                            
                                        </div>
                                        <a href="javascript:addToOrder()" style='text-decoration:none;color:inherit;'>
                                            <div id="modal-footer" class="modal-footer">
                                                <h4 style="text-align:center;color:#fff;">ADD TO ORDER $<span id="add-order-price">9.99</span></h4>
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
            
        </form>
        
            <div class="order-panel">
                
                
                    <form id="stock-submit-form" method="post" enctype="multipart/form-data" action='../../StoreStockLoadServlet' onsubmit="return true;">
                
                
                <div class="product-search">
                    
                    
                
                    <div class="start-building-msg">Store a product in section.</div>
                    
                
                    
                    <%
                    
                    
                    Shelves shelves = new Shelves(shopOutletNumber, shopBranchNumber);
                    
                    
                    
                    %>
                        
                        
                
                  <!--  <div id="platform-title">Please select your current product section.</div><br> -->
                <div id="platform-overlay">
                        <div id="select-platform" class="custom-select">
                            <select id="platform-select" name="stock-section">
                    
                                
                    
                    <%
                    
                    
                    for (int count = 0; (count < shelves.getSize()) && (shelves.getShelf(count) != null); count++)
                        
                    {
                    
                    
                        if (count == 0)
                            
                        {
                    
                    %>
                    
                    
                    
                    <option id="platform-option" value="<%= shelves.getShelf(count).getShelfNumber() %>"><%= shelves.getShelf(count).getShelfName() %></option>
                    
                
                    
                    <%
                    
                    
                        }
                    
                    
                    %>
                    
                    
                    
                    <option id="platform-option" value="<%= shelves.getShelf(count).getShelfNumber() %>"><%= shelves.getShelf(count).getShelfName() %></option>
                    
                
                    
                    <%
                    
                    
                    }
                    
                    
                    %>
                    
                    
                    
                    
                            </select>
                          </div>
                </div>
                  
             <!--   <div id="platform-underline"></div> -->
                
                <div id="platform-panel" class="selectpanel">
                    
                
                    
                    <%
                    
                    
                    for (int count = 0; (count < shelves.getSize()) && (shelves.getShelf(count) != null); count++)
                        
                    {
                    
                    
                    
                    %>
                    
                    
                    
                    
                    <a style="text-decoration:inherit;" href="javascript:selectPlatform('<%= shelves.getShelf(count).getShelfName() %>', <%= count %>)"><div class="panel-item"><%= shelves.getShelf(count).getShelfName() %></div></a>
                    
                
                    
                    <%
                    
                    
                    }
                    
                    
                    %>
                    
                    
                    
                    
                </div>
                      
                
             
             <div class="product-span"><input type="text" id="stock-name" name="stock-name" placeholder="Product Name *" /></div>
                    
                    <div class="product-span"><input type="text" id="stock-price" name="stock-price" placeholder="Stock Price *" /></div>
                    
                    <div class="area-span"><textarea row="2" col="2" id="stock-description" name="stock-description" placeholder="Product Description"></textarea></div>
                    <br>
                
                        
                
                
                </div>
                
                <!--
                <a href="javascript:addProduct()" style="text-decoration:none;"><img id="add-image-icon" class="bag" src="../../images/plus.png" alt='add' /></a>
                -->
                
                
                    <div hidden><input id="direct-deposit-upload-button" type="file" name="stock-image" /></div>
                    
                    <a href="javascript:addProduct()">
                        <div id="license-uploader" class="license-uploader"></div>
                    </a>
                    
                
                
                <%
                    
                    
                    if (session.getAttribute("order-list") == null)
                        
                    {
                        
                    
                    %>
                    
                    
                
                
                <%
                    }
                    
                    else
                        
                    {
                    
                    if (reorder.getOrder().getOrderSubtotal().equalsIgnoreCase("0.00"))
                        
                    {
                        
                    
                    %>
                    
                    
                    
                
                <%
                    
                    
                    }
                    
                    else
                        
                    {
                    
                    
                    %>
                
                <div class="subtotal-checker"><div class="checker">Order Subtotal</div><div class="subtotal">$<span id="subtotal-double"><%= reorder.getOrder().getOrderSubtotal() %></span></div></div>
                <div class='checkout-area'><button onclick="checkout()" class="checkout-button">CHECKOUT</button></div>
                
                
                
                
                <%
                    
                    
                    }
                    
                }
                    
                    
                    %>
                
                    
                    
                    
                    <div class='checkout-area'><button class="checkout-button">ADD TO STOCK</button></div>
                    
                    </form>
                    
            </div>
        </div>
        
                    
                    <div hidden id='invible'><input id='invisible-input' value='' /></div>
        
        
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
            
        
        
        function addProduct()
        
        {
            document.getElementById('direct-deposit-upload-button').click();
        }
                    
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
                
            };
            
            
            
            function checkout()
            
            {
                var checkoutForm = document.getElementById('checkout-form');
                document.getElementById('subtotal').value = document.getElementById('subtotal-double').innerHTML;
                
                var subtotal = document.getElementById('subtotal-double').innerHTML;
                var subtotalCalc = parseFloat(subtotal);
                
                if (subtotalCalc >= 100.00)
                    
                {
                    document.getElementById('overlimit-cut').value = "15.00";
                }
                
                checkoutForm.submit();
            }
            
            function browseShop(outletNumber, branchNumber)
            
            {
                var shopForm = document.getElementById('shop-form');
                
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
            
            function selectPlatform(passed, position)
            
            {
                    var platformPanel = document.getElementById("platform-panel");
                    
                    var count = position;
                    
                    var c = document.getElementsByClassName("selected-option-platform")[count];
                    c.click();
                    
                    platformPanel.style.display = "none";
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
            
            
            function copyName(counter) 
            
            {
                /* Get the text field */
                var copyText = document.getElementsByClassName("copy-clipboard-input")[counter];
                var num = document.getElementsByClassName("copy-clipboard-input")[0].value;
                document.getElementById("invisible-input").value = num;
                
                /* Select the text field */
                document.getElementById("invisible-input").select();
                
                /* Copy the text inside the text field */
                document.execCommand("copy");
                
                //var string = copyText.value;
                //copyText.value = string;
                
                /* Alert the copied text */
                alert("Copied the text: " + copyText.value);
             }
            



            
    
            
            
        </script>
        
        
<!--
<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
};

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
};

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target === modal) {
        modal.style.display = "none";
    }
};
</script>
-->

        
    </body>
</html>
