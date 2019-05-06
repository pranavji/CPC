

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

</head>
<body>
<% Utils.refreshcans();
    Utils.refreshsyms();%>
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
          <div class="collapse navbar-collapse">
               <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="index.jsp">Home</a></li>
                    <li><a href="admin/index.jsp">Admin Login</a></li>
                    <li><a href="treatmentfinder.jsp">Find Your Treatment</a></li>
                    <li><a href="#foot">Contact</a></li>
               </ul>
          </div>

  </div>
</div>

<!-- Home Section -->

<section id="home" class="main-home parallax-section">
     <div class="overlay"></div>
     <div id="particles-js"></div>
     <div class="container">
          <div class="row">

               <div class="col-md-12 col-sm-12">
                    <h1>Welcome</h1>
                    <h4>Find out treatment from symptoms </h4>
                    <a href="treatmentfinder.jsp" class="smoothScroll btn btn-default">Find Your Treatment</a>
               </div>

          </div>
     </div>
</section>

<!-- Blog Section -->

<section id="blog">
     <div class="container">
        
         
     </div>
</section>

<!-- Footer Section -->
<section id="foot"></section>
<footer >
     <div class="container">
          <div class="row">

               <div class="col-md-5 col-md-offset-1 col-sm-6">
                    <h3> CANCER CLASSIFICATION SYSTEM </h3>
                    <p>machine learning based classification technique for cancerous profiles</p>
                    <div class="footer-copyright">
                         <!--<p>DEVELOPED BY: SAYUJIA S,ROSHNI S,MERIN KURIEN ,POOJA S,SALINI J R</p>-->
                    </div>
               </div>

               <div class="col-md-4 col-md-offset-1 col-sm-6">
                    <h3>Talk to us</h3>
                    <p><i class="fa fa-globe"></i> LBS College of Engineering</p>
                    <p><i class="fa fa-phone"></i><a href="tel:+919074351493">Call 9074351493</a> ,<a href="tel:+919074600327">Call 9074600327</a> </p>
<!--                    <a href="mailto:roshnisaramathew21@gmail.com">roshnisaramathew21@gmail.com</a><br>
                    <a href="mailto:sayu.sayujia17@gmail.com">sayu.sayujia17@gmail.com</a><br>
                    <a href="mailto:merrinkurien@gmail.com">merrinkurien@gmail.com</a>-->
                     <a href="tel:+918129311475">Call Us</a>
               </div>

               <div class="clearfix col-md-12 col-sm-12">
                    <hr>
               </div>

               <div class="col-md-12 col-sm-12">
                    <ul class="social-icon">
                         <li><a href="#" class="fa fa-facebook"></a></li>
                         <li><a href="#" class="fa fa-twitter"></a></li>
                         <li><a href="#" class="fa fa-google-plus"></a></li>
                         <li><a href="#" class="fa fa-dribbble"></a></li>
                         <li><a href="#" class="fa fa-linkedin"></a></li>
                    </ul>
               </div>
               
          </div>
     </div>
</footer>

<!-- Back top -->
<a href="#back-top" class="go-top"><i class="fa fa-angle-up"></i></a>

<!-- SCRIPTS -->

<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/particles.min.js"></script>
<script src="js/app.js"></script>
<script src="js/jquery.parallax.js"></script>
<script src="js/smoothscroll.js"></script>
<script src="js/custom.js"></script>

</body>
</html>