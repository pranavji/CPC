<%-- 
    Document   : index
    Created on : 7 Feb, 2019, 4:27:14 PM
    Author     : TechJoint
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%
        Cookie cookie = null;
        Cookie[] cookies = null;

        // Get an array of Cookies associated with the this domain
        cookies = request.getCookies();

        if (cookies != null) {

            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];

                if (cookie.getName().equals("username")) {
                    session.setAttribute("username", cookie.getValue());
                }
            }
        }
        Object uname = session.getAttribute("username");
        if (uname != null) {
            if (!uname.equals("")) {
                response.sendRedirect("dashboard.jsp");
            }
        }


    %>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <style>
            input{
                margin-top:20px;
                margin-bottom:20px;
            }
            .statusbox
            {


                border:1px solid lightblue;
                border-radius:20px;
                box-shadow:0px 0px 20px lightblue;
                padding:30px;
                text-align: center;
                position: fixed;
                top:30%;
                left:40%;
                z-index: 999;
                background: white;
            }
        </style>
    </head>
   
    <body>
        <% String status = request.getParameter("status");
            if (status != null) {
                if (status.equals("failed")) {//out.println("<script>alert('login failed.')</script>");
                    out.println("<div class='statusbox'><h5>SignUp failed Try again</h5><button onclick='$(\".statusbox\").fadeOut(1000);' class='btn btn-warning'>Ok</button></div>");
                }
                if (status.equals("nologin")) {
                    out.println("<div class='statusbox' ><h5>Login again</h5><button onclick='$(\".statusbox\").fadeOut(1000);' class='btn btn-warning'>Ok</button></div>");
                }
                if (status.equals("LoggedOut")) {
                    out.println("<div class='statusbox' ><h5>You have been logged out</h5><button onclick='$(\".statusbox\").fadeOut(1000);' class='btn btn-warning'>Ok</button></div>");
                }
            }
        %>
        <h1>SignUp!</h1>
        <script>
            allok=true;
        </script>
        <form onsubmit="if(!allok){alert('Check all fields');} return allok" action="../doSignup" method="POST">

            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3" style="box-shadow: 0px 0px 20px lightblue;order-radius: 20px;border: 1px solid lightblue;margin-top: 10%;padding:40px">

                         <label for="uname"><b>Name</b></label><label  for="status"><b></b></label>
                        <input class="form-control" id="inuser2"  type="text" placeholder="Enter Name" name="name" required>
                        
                        <label for="uname"><b>Email</b></label><label id="statx" for="status" style="color:red"><b></b></label>
                        <input class="form-control" id="inuser" onkeyup=" showHint(this.value);" type="email" placeholder="Enter Username" name="uname" required>

                        <label for="psw"><b>Password</b></label>
                        <input class="form-control" type="password" placeholder="Enter Password" name="psw" required>

                        <button type="submit" class="btn btn-default">Sign Up</button>

                        <label>
                            <input type="checkbox" checked="checked" name="remember"> Remember me
                        </label>

                        <br>
                        
                     <span class="psw"> Already a member?<a href="index.jsp">Login</a></span>
                        </form>
                    </div>
                </div>
            </div>
    </body>
     <script>
        function showHint(str) {
            console.log(str);
            if (str.length <2) {
                document.getElementById("statx").innerHTML = "";
                return;
            } else {
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                       // console.log(this.responseText);
                        if(this.responseText=="true")
                        {
                            document.getElementById("statx").innerHTML="&nbsp&nbsp&nbspAlready Exists";
                            document.getElementById("inuser").style.borderColor="red";
                            allok=false;
                        }
                        else{
                            document.getElementById("statx").innerHTML="";
                            document.getElementById("inuser").style.borderColor="black";
                            allok=true;
                        }
                    }
                };
                xmlhttp.open("GET", "../Usercheck?username=" + str, true);
                xmlhttp.send();
            }
        }
       
    </script>
</html>
