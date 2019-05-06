<%-- 
    Document   : index.jsp
    Created on : 7 Feb, 2019, 4:14:26 PM
    Author     : TechJoint
--%>

<%@page import="java.sql.ResultSet"%>

<%@page import="com.lbs.classificationofcancerousprofile.Helper.DBhelper"%>
<%@page import="com.lbs.classificationofcancerousprofile.Helper.Utils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<%
   
    Cookie cookie = null;
    Cookie[] cookies = null;

    // Get an array of Cookies associated with the this domain
    cookies = request.getCookies();

    if (cookies != null) {

        for (int i = 0; i < cookies.length; i++) {
            cookie = cookies[i];
//               out.println("<h2> Found Cookies Name and Value</h2>"+cookie.getName());
            if (cookie.getName().equals("username") && !cookie.getValue().equals("")) {
                session.setAttribute("username", cookie.getValue());
            }
            if (cookie.getName().equals("name") && !cookie.getValue().equals("")) {
                session.setAttribute("name", cookie.getValue());
            }
        }
    }
    Object uname = session.getAttribute("username");
    String name="" ;
    try {
            name= session.getAttribute("name").toString();
        } catch (Exception e) {
        }
    if (uname == null) {
        response.sendRedirect("index.jsp?status=nologin&uname=" + uname);
    }
    if (uname != null) {
        if (uname.toString().equals("")) {
            response.sendRedirect("index.jsp?status=nologin&uname=" + uname);
        }

    }
    DBhelper obj=new DBhelper();
    try{
    ResultSet rs = obj.dbQuery("select enabled from adminlogin where username='" + uname + "';");
    if (rs.next()) {
        if (rs.getInt(1) == 0) {
            response.sendRedirect("index.jsp?status=ne&uname=" + uname);
        }
    }
    }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
           obj.close();
        }
    Utils.refreshcans();
    Utils.refreshsyms();
%>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
        <link href="assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/libs/css/style.css">
        <link rel="stylesheet" href="assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
        <link rel="stylesheet" href="assets/vendor/charts/chartist-bundle/chartist.css">
        <link rel="stylesheet" href="assets/vendor/charts/morris-bundle/morris.css">
        <link rel="stylesheet" href="assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="assets/vendor/charts/c3charts/c3.css">
        <link rel="stylesheet" href="assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/general.js"></script>
        <style>
            input{
                display:block;
            }
            .btn-default:hover
            {
                cursor: pointer;
                background:#6610f2; 
                color:white;
            }
            .table:hover
            {
                cursor: pointer;
            }

            label
            {
                color: black;
            }
            #notaa
            {
                margin-left: 25%;

            }
            #notaa *
            {
                color: white;

            }
            #notaa h1
            {
                color: white;
            }
            @media screen and (max-width: 1000px) {
                #notaa
            {
                margin-left: 5%;

            }
            }
        </style>
        <title>LBS Admin Dashboard</title>
        <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
        <script>

            jQuery(document).ready(function ($) {
                $(".clickable-row").click(function () {
                    window.location = $(this).data("href");
                });
            });
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
    </head>

    <body>
        <!-- ============================================================== -->
        <!-- main wrapper -->
        <!-- ============================================================== -->
        <div class="dashboard-main-wrapper">
            <!-- ============================================================== -->
            <!-- navbar -->
            <!-- ============================================================== -->
            <div class="dashboard-header">
                <nav class="navbar navbar-expand-lg bg-white fixed-top">
                    <a class="navbar-brand" href="dashboard.jsp">CPC Admin</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse " id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto navbar-right-top">
                            <li class="nav-item">
                                <div id="custom-search" class="top-search-bar">
                                    <input class="form-control btn-facebook" type="button" value="Go to Main Site" style="cursor: pointer" onclick="window.location = '../'">
                                </div>
                            </li>
                            <li class="nav-item dropdown notification">
                                <a class="nav-link nav-icons" href="#" id="navbarDropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-fw fa-bell"></i> <span class="indicator"></span></a>
                                <ul class="dropdown-menu dropdown-menu-right notification-dropdown">
                                    <li>
                                        <div class="notification-title"> Notification</div>
                                        <div class="notification-list">
                                            <div class="list-group" id="v-notification">


                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <!--<div class="list-footer"> <a href="#">View all notifications</a></div>-->
                                    </li>
                                </ul>
                            </li>

                            <li class="nav-item dropdown nav-user">
                                <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/avatar-1.png" alt="" class="user-avatar-md rounded-circle"></a>
                                <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                    <div class="nav-user-info">
                                        <h5 class="mb-0 text-white nav-user-name">Hello <%=name%> </h5>

                                    </div>

                                    <a class="dropdown-item" style="cursor:pointer" onclick="showchangepass('<%=uname%>', '<%=name%>')"><i class="fas fa-cog mr-2"></i>Setting</a>
                                    <a class="dropdown-item" href="../doLogout"><i class="fas fa-power-off mr-2"></i>Logout</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>

            <div class="nav-left-sidebar sidebar-dark">
                <div class="menu-list">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="d-xl-none d-lg-none" href="#">Dashboard</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav flex-column">
                                <li class="nav-divider">
                                    Menu
                                </li>
                                <%
                                    String cupage = request.getParameter("page");
                                    if (cupage == null) {
                                        cupage = "dash";
                                    }

                                %>
                                <li class="nav-item ">
                                    <a id="link_contdash" onclick="window.location = 'dashboard.jsp';" class="nav-link <%if (cupage.equals("dash")) {
                                            out.println("active");
                                        } %> " href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle"></i>Dashboard <span class="badge badge-success">6</span></a>

                                </li>



                                <li class="nav-item ">
                                    <a id="link_contaddsymptom" onclick="window.location = 'dashboard.jsp?page=managesym';" class="nav-link <%if (cupage.equals("managesym")) {
                                            out.println("active");
                                        } %> " href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle"></i>Manage Symptom <span class="badge badge-success">6</span></a>

                                </li>
                                <li class="nav-item ">
                                    <a id="link_contaddpat" class="nav-link <%if (cupage.equals("addpat")) {
                                            out.println("active");
                                        } %> " onclick="window.location = 'dashboard.jsp?page=addpat';" href="" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle active"></i>Add Patient Details <span class="badge badge-success">6</span></a>

                                </li>
                                <li class="nav-item ">
                                    <a id="link_contmanpat" class="nav-link <%if (cupage.equals("manpat")) {
                                            out.println("active");
                                        }%> " onclick="window.location = 'dashboard.jsp?page=manpat';" href="" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle"></i>Manage Patient Details <span class="badge badge-success">6</span></a>

                                </li>
                                <li class="nav-item ">
                                    <a id="link_contmancan" class="nav-link <%if (cupage.equals("mancan")) {
                                            out.println("active");
                                        }%> " onclick="window.location = 'dashboard.jsp?page=mancan';" href="" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle"></i>Manage Cancer Details <span class="badge badge-success">6</span></a>

                                </li>
                                <li class="nav-item ">
                                    <a id="link_contmancan" class="nav-link <%if (cupage.equals("manusr")) {
                                            out.println("active");
                                        }%> " onclick="window.location = 'dashboard.jsp?page=manusr';" href="" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle"></i>Manage users <span class="badge badge-success">6</span></a>

                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>

            <div class="dashboard-wrapper">
                <div class="dashboard-ecommerce">
                    <div id="contentspace" >
                        <jsp:include page="views/dashboard.jsp" />

                        <jsp:include page="views/cancermanagement.jsp" />
                        <jsp:include page="views/users.jsp" />
                    </div>
                    <script>
                        // chcontent('contdashboard');
                    </script>
                </div>
            </div>

            <%                       if (request.getParameter("page") != null) {
//                           if(request.getParameter("page").equals("addpat"))
//                           {
//                               out.println("<script>chcontent('contaddpat');</script>");
//                           }
//                           else
//                           {
//                               out.println("<script>chcontent('contdashboard');</script>");
//                           }
                    switch (request.getParameter("page")) {
                        case "addpat":
                            out.println("<script>chcontent('contaddpat');</script>");
                            break;
                        case "managesym":
                            out.println("<script>chcontent('contaddsymptom');</script>");
                            break;
                        case "manpat":
                            out.println("<script>chcontent('contmanpat');</script>");
                            break;
                        case "mancan":
                            out.println("<script>chcontent('contaddcancer');</script>");
                            break;
                        case "manusr":
                            out.println("<script>chcontent('contmanuser');</script>");
                            break;
                        default:
                            out.println("<script>chcontent('contdashboard');</script>");
                            break;
                    }

                } else {
                    out.println("<script>chcontent('contdashboard');</script>");
                }
                if (request.getParameter("msg") != null) {
                    out.println("<script>alert('" + request.getParameter("msg") + "')</script>");
                }
            %>      
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <div class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <!--Project by Sayujia,Roshni,Merin,Pooja and Salini-->
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="text-md-right footer-links d-none d-sm-block">
                                <a href="javascript: void(0);">About</a>
                                <a href="javascript: void(0);">Support</a>
                                <a href="javascript: void(0);">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- end wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <!-- jquery 3.3.1 -->

    <!-- bootstap bundle js -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- slimscroll js -->
    <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <!-- main js -->
    <script src="assets/libs/js/main-js.js"></script>
    <!-- chart chartist js -->
    <script src="assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
    <!-- sparkline js -->
    <script src="assets/vendor/charts/sparkline/jquery.sparkline.js"></script>
    <!-- morris js -->
    <script src="assets/vendor/charts/morris-bundle/raphael.min.js"></script>
    <script src="assets/vendor/charts/morris-bundle/morris.js"></script>
    <!-- chart c3 js -->
    <script src="assets/vendor/charts/c3charts/c3.min.js"></script>
    <script src="assets/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
    <script src="assets/vendor/charts/c3charts/C3chartjs.js"></script>
    <script src="assets/libs/js/dashboard-ecommerce.js"></script>

</body>

</html>