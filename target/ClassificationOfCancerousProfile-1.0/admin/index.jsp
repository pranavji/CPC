<%-- 
    Document   : index
    Created on : 7 Feb, 2019, 4:27:14 PM
    Author     : TechJoint
--%>

<%@page import="com.lbs.classificationofcancerousprofile.Helper.DBhelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%
     Cookie cookie = null;
         Cookie[] cookies = null;
         
         // Get an array of Cookies associated with the this domain
         cookies = request.getCookies();
         
         if( cookies != null ) {
            
            
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
             
               if(cookie.getName().equals("username"))
               {
                   session.setAttribute("username", cookie.getValue());
               }
            }
         } 
    Object uname=session.getAttribute("username");
   int enabled=0;
    if(uname!=null)
    {DBhelper obj=new DBhelper();
        try
        {
        
          ResultSet rs=obj.dbQuery("select enabled from adminlogin where username='"+uname+"';");
           
   if(rs.next())
   {
       enabled=rs.getInt(1);
      }
   
        if(!uname.equals("")&&enabled==1)
            response.sendRedirect("dashboard.jsp");
    }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            obj.close();
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
        <% String status =request.getParameter("status");
          if(status!=null)
          {
              if(status.equals("failed"))
              {//out.println("<script>alert('login failed.')</script>");
                out.println("<div class='statusbox'><h5>Login failed Try again</h5><button onclick='$(\".statusbox\").fadeOut(1000);' class='btn btn-warning'>Ok</button></div>");
              }  
              if(status.equals("nologin"))
              {
                out.println("<div class='statusbox' ><h5>Login again</h5><button onclick='$(\".statusbox\").fadeOut(1000);' class='btn btn-warning'>Ok</button></div>");
              }  
               if(status.equals("ne"))
              {
                out.println("<div class='statusbox' ><h5>Not Enabled</h5><button onclick='$(\".statusbox\").fadeOut(1000);' class='btn btn-warning'>Ok</button></div>");
              }  
               if(status.equals("LoggedOut"))
              {
                out.println("<div class='statusbox' ><h5>You have been logged out</h5><button onclick='$(\".statusbox\").fadeOut(1000);' class='btn btn-warning'>Ok</button></div>");
              }  
          }
        %>
        <h1>Login!</h1>
        <form onsubmit="if(!validform){alert('enter a valid username')};return validform;" action="../doLogin" method="POST">

            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3" style="box-shadow: 0px 0px 20px lightblue;order-radius: 20px;border: 1px solid lightblue;margin-top: 10%;padding:40px">
 
    <label for="uname"><b>Username</b></label>
    <input id="uname" onkeyup="validateuname(this.value)"  class="form-control" type="text" placeholder="Enter Username" name="uname" required>

    <label for="psw"><b>Password</b></label>
    <input class="form-control" type="password" placeholder="Enter Password" name="psw" required>

    <button type="submit" class="btn btn-default">Login</button>
   
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>

 <br>
 
   
<br>
    <span class="psw"> <a href="signin.jsp">Sign Up</a></span>
</form>
        </div>
        </div>
        </div>
    </body>
    <script>
        var validform=false;
       
      function  validateuname(value)
      {
          if(value.length<4)
          {
              document.getElementById("uname").style.color="red";
              validform=false;
          }
          else
          {
              document.getElementById("uname").style.color="black";
              validform=true;
              
        }
      }
    </script>
</html>
