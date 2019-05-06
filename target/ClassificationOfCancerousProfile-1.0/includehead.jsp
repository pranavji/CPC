
<%@page import="com.lbs.classificationofcancerousprofile.Helper.Utils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <title>Cancer Classification System</title>
        <!--
        
        Template 2085 Neuron
        
        http://www.tooplate.com/view/2085-neuron
        
        -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="css/style.css">
        <link href="https://fonts.googleapis.com/css?family=Lora|Merriweather:300,400" rel="stylesheet">
        <style>
            #idfl{float:left;

                  display: inline}
            .itemclass:hover
            {
                border:1px solid blue;
                cursor: pointer;
                box-shadow: 0px 0px 20px #08c;
                color:white;
            }
            .noselect {
                -webkit-touch-callout: none; /* iOS Safari */
                -webkit-user-select: none; /* Safari */
                -khtml-user-select: none; /* Konqueror HTML */
                -moz-user-select: none; /* Firefox */
                -ms-user-select: none; /* Internet Explorer/Edge */
                user-select: none; /* Non-prefixed version, currently
                                      supported by Chrome and Opera */
            }
        </style>
    </head>
    <body>

        <!-- PRE LOADER -->

        <div class="preloader">
            <div class="sk-spinner sk-spinner-wordpress">
                <span class="sk-inner-circle"></span>
            </div>
        </div>

        <!-- Navigation section  -->

        <div style="background: rgba(200,255,0,0)" class="navbar navbar-default navbar-static-top" role="navigation">
            <div class="container">

                <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                    </button>
                    <a href="index.jsp" class="navbar-brand">Cancer Classification System</a>
                </div>
                <br>

                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li ><a href="index.jsp">Home</a></li>
                        <li><a href="admin/index.jsp">Admin Login</a></li>
                        <li class="active"><a href="#">Find Your Treatment</a></li>
                        <li><a href="#foot">Contact</a></li>
                    </ul>
                </div>

            </div>
        </div>



        <div class="container">
            <div class="row">
                <h3>Search Results for <%out.println(request.getParameter("name"));%></h3>
                <div class="col-md-12 col-sm-12">
