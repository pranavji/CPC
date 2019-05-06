

<%@page import="com.lbs.classificationofcancerousprofile.Helper.Utils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
<% Utils.refreshcans();
    Utils.refreshsyms();%>
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
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li ><a href="index.jsp">Home</a></li>
                        <li><a href="admin/index.jsp">Admin Login</a></li>
                        <li class="active"><a href="treatmentfinder.jsp">Find Your Treatment</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>

            </div>
        </div>

      

            <div class="container">
                <div class="row">

                    <div class="col-md-12 col-sm-12">


                        <h1>Enter Your Details</h1>

                        <form class="" action="FindRank">
                            <div class="form-group ">
                                <label for="name">Name</label>
                                <input required type="text" name="name" class="form-control" id="name" value="">
                            </div>
                            <div class="form-group " >
                                <div class="formctl">
                                    <label for="bloodgroup">Blood Group</label><br>
                                    <div class="btn-group">
                                        <div> <input id="idfl" required type="radio" style="display:block" class="btn btn-warning" name="bloodgroup"  value="0">O+ <span style="width:20px"></span></div>
                                       <div>  <input id="idfl" type="radio" style="display:block;" class="btn btn-warning" name="bloodgroup"  value="1"  >O-<span style="width:20px"></span></div>
                                       <div>  <input id="idfl" type="radio" style="display:block;" class="btn btn-warning" name="bloodgroup"  value="2" >A+<span style="width:20px"></span></div>
                                       <div>  <input id="idfl" type="radio" style="display:block;" class="btn btn-warning" name="bloodgroup"  value="3"  >A-<span style="width:20px"></span></div>
                                    </div>
                                    <div class="btn-group">
                                      <div>   <input id="idfl" type="radio" style="display:block;" class="btn btn-warning" name="bloodgroup"  value="4"  >B+<span style="width:20px"></span></div>
                                      <div>   <input id="idfl" type="radio" style="display:block;" class="btn btn-warning" name="bloodgroup"  value="5" >B-<span style="width:20px"></span></div>
                                       <div>  <input id="idfl" type="radio" style="display:block;" class="btn btn-warning" name="bloodgroup"  value="6" >AB+<span style="width:20px"></span></div>
                                           <div>  <input id="idfl" type="radio" style="display:block;" class="btn btn-warning" name="bloodgroup"  value="7"  >AB-<span style="width:20px"></span></div>
                                    </div>
                                </div>
                                <br>
                                <div class="formctl">
                                    <label for="Gender">Gender</label>
                                    <br>
                                    <div class="btn-group">
                                        <div><input id="idfl" required type="radio" style="display:block" class="btn btn-warning"  name="gender" value="0">Male <span style="width:20px"></span></div>
                                            <div><input id="idfl" type="radio" style="display:block" class="btn btn-warning" name="gender"     value="1">Female<span style="width:20px"></span></div>

                                    </div>
                                </div>
                                <br>
                                <div class="form-group">
                                    <label for="Age">Age</label>
                                    <input required type="number" name="age" class="form-control" id="age" value="">
                                </div>
                                <div class="form-group">
                                    <label for="BMI">BMI</label>
                                    <input  required type="number" name="bmi" class="form-control" step="any" value="" >
                                </div>
                                <div class="form-group">
                                    <label for="tumor">Tumor Diameter in mm</label>
                                    <input  required type="number" name="tumordiameter" class="form-control" step="any"  value="" >
                                </div>
                                <div class="formctl">
                                    <label for="Cancer History">Cancer History</label><br>
                                    <div class="" >
                                        <div><input style="float:left;display: inline" required type="radio" style="display:block" class="btn btn-warning" name="cancerhistory" value="1"  >Yes <span style="width:20px"></span></div>
                                        <div><input style="float:left;display: inline" type="radio" style="display:block" class="btn btn-warning" name="cancerhistory"    value="0">No<span style="width:20px"></span></div>

                                    </div>
                                </div>
                                <br>
                                <div class="formctl">
                                    <label for="Food Category">Food Category</label>
                                    <br>
                                    <div class="btn-group">
                                        <div><input id="idfl" required type="radio" style="display:block" class="btn btn-warning"   name="isveg" value="1">Vegetarian <span style="width:20px"></span></div>
                                        <div><input id="idfl" required type="radio" style="display:block" class="btn btn-warning"  name="isveg"  value="0">Non Vegetarian<span style="width:20px"></span></div>

                                    </div>
                                </div>
                                            
                                        <br>
                                        
                                <label for="Cancer Type">Cancer Type</label>
                                <div>
                                    <select  required style="width:100%" name="ct"  >
                                        <%
                                            for (int temp : Utils.cancerlist.keySet()) {
                                         
                                                   
                                                out.println("<option  value='" + temp + "'>" + Utils.cancerlist.get(temp) + "</option>");
                                            }
                                        %>
                                    </select>
                                    
                                </div>
                                    
                                    
                                <br>
                                <div class="formctl">
                                    <label for="Stage">Stage</label>
                                    <br>
                                    <div class="btn-group">
                                        <ul style="list-style: none">
                                            
                                            <li><input id="idfl" required type="radio" style="display:block" class="btn btn-warning"   name="stage" value="1">Stage 1 <span style="width:20px"></span></li>
                                            <li><input  id="idfl" type="radio" style="display:block" class="btn btn-warning" name="stage"    value="2">Stage 2<span style="width:20px"></span></li>
                                            <li> <input id="idfl"  type="radio" style="display:block" class="btn btn-warning" name="stage"    value="3">Stage 3<span style="width:20px"></span></li>
                                            <li> <input  id="idfl" type="radio" style="display:block" class="btn btn-warning" name="stage"    value="4">Stage 4<span style="width:20px"></span></li>
                                            <li> <input  id="idfl" type="radio" style="display:block" class="btn btn-warning" name="stage"   value="5">Stage 5<span style="width:20px"></span></li>
                                        </ul>
                                        
                                        
                                        
                                         
                                          

                                    </div>
                                </div>
                                            
                                <br>
                                <label for="Symptoms">Symptoms (Use control to select multiple in computer)</label>
                                <div>
                                    <select  required style="width:100%" name="symptoms" id="selsymsel" multiple>
                                        <%
                                            System.out.println("execing");
                                            Utils.refreshsyms();
                                            for (int temp : Utils.symptomlist.keySet()) {
                                                String isel = "";
                                                      System.out.println(temp);
                                                out.println("<option " + isel + " value='" + temp + "'>" + Utils.symptomlist.get(temp) + "</option>");
                                            }
                                        %>
                                    </select>
                                    <label>Symptoms Selected : </label> <label id="selsym">none</label> 
                                </div>
                                <br>



                                <button style="width: 100%" type="submit" class="btn btn-primary">Find</button>
                            </div>
                        </form>


                    </div>

                </div>
            </div>
        </section>

        <!-- Blog Section -->

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
                            <p>DEVELOPED BY: SAYUJIA S,ROSHNI S,MERIN KUREIN ,POOJA S,SALINI J R</p>
                        </div>
                    </div>

                    <div class="col-md-4 col-md-offset-1 col-sm-6">
                        <h3>Talk to us</h3>
                        <p><i class="fa fa-globe"></i> LBS College of Engineering</p>
                        <p><i class="fa fa-phone"></i> 9074351493,9074600327</p>
                        <a href="cancerclassificationservice.in">roshnisaramathew21@gmail.com,sayu.sayujia17@gmail.com</a>

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
<script>
     var seloption = "";
   document.getElementById("selsymsel").onchange = function () {
      
           var y=document.getElementById("selsymsel");
           seloption = "";
            for( i=0;i<y.length;i++)
            {
               if(y[i].selected) 
               {
                   
                   seloption+=y[i].innerHTML+","
               
               
                }
                
              document.getElementById("selsym").innerHTML=seloption.slice(0,seloption.length-1);
            }
          

        
    }
</script>
    </body>
</html>