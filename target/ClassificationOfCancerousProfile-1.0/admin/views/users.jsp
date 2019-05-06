<div class="container" id="changepasswordpanel" style="top:100px;position: fixed;width: 90%;height:500px;z-index: 9999;background: rgba(56,66,132,0.8);display: none">
    <div class="row" style="position: relative">
        <div  class="col-sm-11"></div><div class="col-sm-1"><br><button onclick='$("#changepasswordpanel").fadeOut(500);' style="width:100%">X</button></div>

    </div>
    <div class="row" style="position: relative;color:white">
        <div  class="col-sm-8 col-sm-offset-2">
            <h3 style="color:white">Change password for</h3><h3 style="color:white" id="tcuser">xx</h3>
            <form class="form-horizontal" onsubmit="return performsub()" action="">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="email">Name</label>
                    <div class="col-sm-10">
                        <input type="name" required="" id="tname" class="form-control" placeholder="Enter Name">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Password:</label>
                    <div class="col-sm-10"> 
                        <input type="password" required="" id="tpwd" class="form-control" name="pwd" placeholder="Enter new password">

                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Password:</label>
                    <div class="col-sm-10"> 
                        <input type="password" required="" class="form-control" id="tcpwd" name="cpwd" placeholder="Confirm new password">

                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Enabled</label>
                    <div class="col-sm-10"> 
                        <input type="checkbox" id="tenable" style="align:left;left: 0px" checked  name="enabled" >

                    </div>
                </div>
                <input type="hidden" id="cuser" class="form-control"  name="uname" >

                <div class="form-group"> 
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Update</button>
                    </div>
                </div>
            </form>


        </div>

    </div>
</div>

<script>
    function showchangepass(uname, name)
    {
        $("#changepasswordpanel").fadeIn(500);
        $("#cuser").val(uname);
        $("#tcuser").html(uname);
        $("#tname").val(name);
    }
    function performsub()
    {
         uname=$("#cuser").val();
         name=$("#tname").val();
         pwd=$("#tpwd").val();
         cpwd=$("#tcpwd").val();
         enable=$("#tenable").prop("checked");
         if(pwd==cpwd)
         {
         alert(uname+name+pwd+uname+enable);
          var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
               alert(this.responseText);
              $("#changepasswordpanel").fadeOut(500);
              return false;
            }

        };

        xmlhttp.open("GET", "../UpdatePassword?uname="+uname+"&name="+name+"&pwd="+pwd+"&enabled="+enable, true);
        xmlhttp.send();
        
        }
        else
        {
            alert("Password Mismatch");
            return false;
        }
        
    }
</script>
<%

%>
<!--codeformanpatione-->
<div class="dcont" id="contmanuser">
    <%        String skey = request.getParameter("skey");
        if (skey == null) {
            skey = "";
        }

    %>
    <div class="container-fluid" >
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1"><h1>Manage User</h1>
                <form class="form-inline" action="dashboard.jsp">
                    <div class="form-group">
                        <label style="margin:10px" for="search">Search</label>
                        <input style="margin:10px" type="search" id="searchuser" onkeyup="dousersearch();" value="<%=skey%>" class="form-control" name="key"> 
                        <input style="margin:10px" type="hidden" name="page" value="manpat"> 
                    </div>


                    <input type="button" class="btn btn-danger" onclick="window.location = 'dashboard.jsp?page=manusr';" value="Clear">
                </form>
                <table class="table  table-bordered table-hover table-condensed" style="background: whitesmoke">
                    <thead>
                        <tr >
                            <th>Username</th>
                            <th>Name</th>
                            <th>Enabled</th>



                        </tr>
                    </thead>
                    <tbody id="usertable" >

                    </tbody>
                </table>


            </div>

        </div>

    </div>
</div>

<script>
    function dousersearch()
    {
        key = $("#searchuser").val();

        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                $("#usertable").html(this.responseText);
              
            }

        };

        xmlhttp.open("GET", "../searchuser?key="+key, true);
        xmlhttp.send();
    }
    dousersearch();
</script>
<!--ends-->