

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.lbs.classificationofcancerousprofile.Helper.Utils"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.lbs.classificationofcancerousprofile.Helper.Global"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="com.lbs.classificationofcancerousprofile.Helper.DBhelper"%>

<%
    DBhelper obj = new DBhelper();
    try {
        ResultSet rs = obj.dbQuery("select * from symptom;");
        Utils.symptomlist = new HashMap<Integer, String>();
        while (rs.next()) {

            Utils.symptomlist.put(Integer.parseInt(rs.getString(1)), rs.getString(2));
            Utils.symptomkeylist.put(rs.getString(2), Integer.parseInt(rs.getString(1)));

        }

    } catch (Exception e) {
    } finally {
        obj.close();
    }
%>
<div class="dcont" id="contdashboard" > <h1>Dashboard</h1>
    <div class="container" id="notaa">

        <div class="row">
            <div class="col-sm-8  " >
            </div>
            <h2>
                <!--here starts tile-->
                <!--row1-->
                <div class="row" style="width:100%;margin-top: 30px;">

                    <div class="col-sm-3 " style="background:rgb(14,12,40);height:200px;text-align: center;padding-top: 7.5%">
                        Total number of searches : <span id="v-search"></span>
                    </div>
                    <div class="col-sm-2 " style="">

                    </div>
                    <div class="col-sm-3" style="background:rgb(14,12,40);height:200px;text-align: center;padding-top: 7.5%">
                        Total number of Patients : <span id="v-patient"></span>
                    </div>

                </div>
                <!--endrow1-->
                <!--row2-->
                <!--<div class="row" style="height:250px;" ></div>-->
                <!--endrow2-->
                <!--row3-->
                <div class="row" style="width:100%;margin-top: 30px;">

                    <div class="col-sm-3 " style="background:rgb(14,12,40);height:200px;text-align: center;padding-top: 7.5%">
                        Total number of Cancers : <span id="v-cancer"></span>
                    </div>
                    <div class="col-sm-2 " style="">

                    </div>
                    <div class="col-sm-3" style="background:rgb(14,12,40);height:200px;text-align: center;padding-top: 7.5%">
                        Total number of Symptoms : <span id="v-symptom"></span>
                    </div>

                </div></h2>
            <!--endrow3-->
            <!--here ends tile-->

        </div>

    </div>
</div>
<%
    boolean isedit = false;
    String uid = null;
    String name = "";
    int bloodgroup = 0, gender = 0, age = 0;
    float bmi = 0, tumor = 0;
    int cancer = 0, food = 0;
    String treatment = "", recovery = "";
    int stage = (-1), cancertype = -1;
    String diag = "", complications = "";
    List<Integer> symtoms = new ArrayList<Integer>();
    if (request.getParameter("id") != null) {
        if (request.getParameter("id").length() > 0) {
            isedit = true;
            uid = request.getParameter("id");
            symtoms = Utils.getSymtomIntegerList(uid);
            obj = new DBhelper();
            try {
                ResultSet data = obj.dbQuery("select * from patientpoint where idpatientpoint='" + uid + "'");
                if (data.next()) {
                    name = data.getString(2);
                    bloodgroup = data.getInt(3);
                    gender = data.getInt(4);
                    age = data.getInt(5);
                    bmi = data.getFloat(6);
                    tumor = data.getFloat(7);
                    cancer = data.getInt(8);
                    food = data.getInt(9);
                    treatment = data.getString(10);
                    recovery = data.getString(11);
                    stage = data.getInt(12);
                    cancertype = data.getInt(13);
                    complications = data.getString(14);
                    diag = data.getString(15);
                }

            } catch (Exception e) {
            } finally {
               obj.close();
            }
        }
    }
%>
<div class="dcont" id="contaddpat">
    <div class="container-fluid" >
        <div class="row">
            <div class="col-sm-12"><h1><%
                if (isedit) {
                    out.println("Edit Patient " + uid);
                } else {
                    out.println("New Patient");
                }
                    %></h1></div>

        </div>
        <div class="row">
            <div class="col-sm-10"><h3><%
                if (isedit) {
                    out.println("Edit Patient Data");
                } else {
                    out.println("Patient Data");
                }
                    %></h3>
                <div class="row">

                    <div class="col-sm-12" >
                        <form action="../AddData">
                            <div class="form-group ">
                                <label for="name">Name</label>
                                <input required type="text" name="name" class="form-control" id="name" value="<%
                                    if (isedit) {
                                        out.println(name);
                                    }
                                       %>">
                            </div>
                            <div class="form-group " style="overflow: scroll; ">
                                <div class="formctl">
                                    <label for="bloodgroup">Blood Group</label><br>
                                    <div class="btn-group">
                                        <input required type="radio" style="display:block" class="btn btn-warning" name="bloodgroup" <%if (isedit && bloodgroup == 0) {
                                                out.println("checked");
                                            }%> value="0">O+ <span style="width:20px"></span>
                                        <input type="radio" style="display:block;" class="btn btn-warning" name="bloodgroup"  value="1" <%if (isedit && bloodgroup == 1) {
                                                out.println("checked");
                                            }%> >O-<span style="width:20px"></span>
                                        <input type="radio" style="display:block;" class="btn btn-warning" name="bloodgroup"  value="2" <%if (isedit && bloodgroup == 2) {
                                                out.println("checked");
                                            }%> >A+<span style="width:20px"></span>
                                        <input type="radio" style="display:block;" class="btn btn-warning" name="bloodgroup"  value="3" <%if (isedit && bloodgroup == 3) {
                                                out.println("checked");
                                            }%> >A-<span style="width:20px"></span>
                                    </div><br>
                                    <br>
                                    <div class="btn-group">
                                        <input type="radio" style="display:block;" class="btn btn-warning" name="bloodgroup"  value="4" <%if (isedit && bloodgroup == 4) {
                                                out.println("checked");
                                            }%> >B+<span style="width:20px"></span>
                                        <input type="radio" style="display:block;" class="btn btn-warning" name="bloodgroup"  value="5" <%if (isedit && bloodgroup == 5) {
                                                out.println("checked");
                                            }%> >B-<span style="width:20px"></span>
                                        <input type="radio" style="display:block;" class="btn btn-warning" name="bloodgroup"  value="6" <%if (isedit && bloodgroup == 6) {
                                                out.println("checked");
                                            }%> >AB+<span style="width:20px"></span>
                                        <input type="radio" style="display:block;" class="btn btn-warning" name="bloodgroup"  value="7" <%if (isedit && bloodgroup == 7) {
                                                out.println("checked");
                                            }%> >AB-<span style="width:20px"></span>
                                    </div>
                                </div>
                                <br>
                                <div class="formctl">
                                    <label for="Gender">Gender</label>
                                    <br>
                                    <div class="btn-group">
                                        <input required type="radio" style="display:block" class="btn btn-warning"  <%if (isedit && gender == 0) {
                                                out.println("checked");
                                            }%> name="gender" value="0">Male <span style="width:20px"></span>
                                        <input type="radio" style="display:block" class="btn btn-warning" name="gender"   <%if (isedit && gender == 1) {
                                                out.println("checked");
                                            }%>  value="1">Female<span style="width:20px"></span>

                                    </div>
                                </div>
                                <br>
                                <div class="form-group">
                                    <label for="Age">Age</label>
                                    <input required type="number" name="age" class="form-control" id="age" value="<%if (isedit) {
                                            out.print(age);
                                        }%>">
                                </div>
                                <div class="form-group">
                                    <label for="BMI">BMI</label>
                                    <input  required type="number" name="bmi" class="form-control" step="any" value="<%if (isedit) {
                                            out.print(bmi);
                                        }%>" >
                                </div>
                                <div class="form-group">
                                    <label for="tumor">Tumor Diameter in mm</label>
                                    <input  required type="number" name="tumordiameter" class="form-control" step="any"  value="<%if (isedit) {
                                            out.print(tumor);
                                        }%>" >
                                </div>
                                <div class="formctl">
                                    <label for="Cancer History">Cancer History</label><br>
                                    <div class="btn-group">
                                        <input  required type="radio" style="display:block" class="btn btn-warning" name="cancerhistory" value="1"  <%if (isedit && cancer == 0) {
                                                out.println("checked");
                                            }%> >Yes <span style="width:20px"></span>
                                        <input type="radio" style="display:block" class="btn btn-warning" name="cancerhistory"  <%if (isedit && cancer == 1) {
                                                out.println("checked");
                                            }%>  value="0">No<span style="width:20px"></span>

                                    </div>
                                </div>
                                <br>
                                <div class="formctl">
                                    <label for="Food Category">Food Category</label>
                                    <br>
                                    <div class="btn-group">
                                        <input  required type="radio" style="display:block" class="btn btn-warning"  <%if (isedit && food == 1) {
                                                out.print("checked");
                                            }%>  name="isveg" value="1">Vegetarian <span style="width:20px"></span>
                                        <input  required type="radio" style="display:block" class="btn btn-warning"  <%if (isedit && food == 0) {
                                                out.print("checked");
                                            }%> name="isveg"  value="0">Non Vegetarian<span style="width:20px"></span>

                                    </div>
                                </div>



                                <br>
                                <label for="Cancer Type">Cancer Type</label>
                                <div>
                                    <select  required style="width:100%" name="ct"  >
                                        <%
                                            for (int temp : Utils.cancerlist.keySet()) {
                                                String opt = "";
                                                if (temp == cancertype) {
                                                    opt = "selected";
                                                }
                                                out.println("<option " + opt + " value='" + temp + "'>" + Utils.cancerlist.get(temp) + "</option>");
                                            }
                                        %>
                                    </select>

                                </div>


                                <br>
                                <div class="formctl">
                                    <label for="Stage">Stage</label>
                                    <br>
                                    <div class="btn-group">
                                        <input required type="radio" style="display:block" class="btn btn-warning"  <%if (isedit && stage == 1) {
                                                out.println("checked");
                                            }%> name="stage" value="1">Stage 1 <span style="width:20px"></span>
                                        <input type="radio" style="display:block" class="btn btn-warning" name="stage"   <%if (isedit && stage == 2) {
                                                out.println("checked");
                                            }%>  value="2">Stage 2<span style="width:20px"></span>
                                        <input type="radio" style="display:block" class="btn btn-warning" name="stage"   <%if (isedit && stage == 3) {
                                                out.println("checked");
                                            }%>  value="3">Stage 3<span style="width:20px"></span>
                                        <input type="radio" style="display:block" class="btn btn-warning" name="stage"   <%if (isedit && stage == 4) {
                                                out.println("checked");
                                            }%>  value="4">Stage 4<span style="width:20px"></span>
                                        <input type="radio" style="display:block" class="btn btn-warning" name="stage"   <%if (isedit && gender == 5) {
                                                out.println("checked");
                                            }%>  value="5">Stage 5<span style="width:20px"></span>

                                    </div>
                                </div>


                                <br>
                                <label for="Symptoms">Symptoms (Use control to select multiple items</label>
                                <div>
                                    <select  required style="width:100%" name="symptoms" id="selsymsel" multiple>
                                        <%
                                            for (int temp : Utils.symptomlist.keySet()) {
                                                String isel = "";
                                                if (symtoms.contains(temp)) {
                                                    isel = "selected";
                                                }
                                                out.println("<option " + isel + " value='" + temp + "'>" + Utils.symptomlist.get(temp) + "</option>");
                                            }
                                        %>
                                    </select>
                                    <label>Symptoms Selected : </label> <label id="selsym">0</label> 
                                </div>

                                <br>
                                <div class="form-group">
                                    <label for="Treatment">Treatment</label>
                                    <textarea  required class="form-control"  name="treatment"><%if (isedit) {
                                            out.print(treatment);
                                        }%></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="Recovery Time">Recovery Time</label>
                                    <input  required type="text" name="recoverytime" value="<%if (isedit) {
                                            out.print(recovery);
                                        }%>" class="form-control" >
                                </div>


                                <br>
                                <div class="form-group">
                                    <label for="Surgical Complications">Surgical Complications</label>
                                    <textarea  required class="form-control"  name="cc"><%if (isedit) {
                                            out.print(complications);
                                        }%></textarea>
                                </div>

                                <br>
                                <div class="form-group">
                                    <label for="Diagnosis">Diagnosis</label>
                                    <textarea  required class="form-control"  name="diag"><%if (isedit) {
                                            out.print(diag);
                                        }%></textarea>
                                </div>

                                <input type="hidden" value="<%if (isedit) {
                                        out.print("update");
                                    } else {
                                        out.print("add");
                                    }%>" name="mode">
                                <% if (isedit) {
                                %>
                                <input type="hidden" value="<%out.print(uid);%>" name="uid">
                                <%
                                    }%>
                                <button style="width: 100%" type="submit" class="btn btn-primary"><%if (isedit) {
                                        out.print("Update");
                                    } else {
                                        out.print("Add");
                                    }%></button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
            <!--            <div class="col-sm-9"><h3>Edit Category</h3>
                            <div class="row">
            
                                <div class="col-sm-6"><label>Category Name  </label> 
                                    <select id="listcat">
                                        
                                    </select>
                                    <input type="button" value="Add">
                                </div>
                            </div>
                        </div>-->
        </div>
        <script>



        </script>
    </div>
</div>
<%
    String searchkey = "";
    if (request.getParameter("key") != null) {
        searchkey = request.getParameter("key");
    }
%>
<!--codeformanpatione-->
<div class="dcont" id="contmanpat">
    <div class="container-fluid" >
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1"><h1>Manage Patient</h1>
                <form class="form-inline" action="dashboard.jsp">
                    <div class="form-group">
                        <label style="margin:10px" for="search">Search</label>
                        <input style="margin:10px" type="search" value="<%=searchkey%>" class="form-control" name="key"> 
                        <input style="margin:10px" type="hidden" name="page" value="manpat"> 
                    </div>

                    <button type="submit" class="btn btn-default">Search</button>
                    <input type="button" class="btn btn-danger" onclick="window.location = 'dashboard.jsp?page=manpat';" value="Clear">
                </form>
                <table class="table  table-bordered table-hover table-condensed table-responsive" style="background: whitesmoke">
                    <thead>
                        <tr >
                            <th>Id</th>
                            <th>Name</th>
                            <th>Blood Group</th>
                            <th>Gender</th>
                            <th>Age</th>
                            <th>BMI</th>
                            <th>Tumor Dia(mm)</th>
                            <th>Cancer History</th>
                            <th>Food Category</th>
                            <th>Treatment</th>
                            <th>Recovery Time</th>
                            <th >Stage</th>
                            <th >Cancer type</th>
                            <th >Surgical Complications</th>
                            <th >Diagnosis</th>
                            <th >Symptoms</th>

                        </tr>
                    </thead>
                    <tbody >
                        <%
                                try {
                                    obj = new DBhelper();
                                    ResultSet rxa = obj.dbQuery("select * from patientpoint where name like '%" + searchkey + "%' or age like '%" + searchkey + "%' or bmi like '%" + searchkey + "%' or tumordiameter like '%" + searchkey + "%' or treatment like '%" + searchkey + "%' or recoverytime like '%" + searchkey + "%'");
                                    while (rxa.next()) {
                                        out.println("<tr data-toggle='tooltip' title='Click to edit details of " + rxa.getString(2) + "' class='clickable-row' data-href='dashboard.jsp?page=addpat&id=" + rxa.getString(1) + "'>");
                                        for (int i = 1; i < 16; i++) {
                                            out.println("<td>");
                                            if (i == 3) {
                                                out.println(Utils.getBloodGroup(rxa.getInt(i)));
                                            } else if (i == 4) {
                                                if (rxa.getInt(i) == 0) {
                                                    out.println("Male");
                                                } else {
                                                    out.println("Female");
                                                }
                                            } else if (i == 8) {
                                                if (rxa.getInt(i) == 0) {
                                                    out.println("Yes");
                                                } else {
                                                    out.println("No");
                                                }
                                            } else if (i == 9) {
                                                if (rxa.getInt(i) == 0) {
                                                    out.println("Non Vegitarian");
                                                } else {
                                                    out.println("Vegitarian");
                                                }
                                            } else if (i == 13) {

                                                out.println(Utils.cancerlist.get(rxa.getInt(i)));

                                            } else {
                                                out.println(rxa.getString(i));
                                            }
                                            out.println("</td>");
                                        }
                                        out.println("<td style='word-wrap:break-all'>");
                                        out.println(Utils.getPatSym(rxa.getString(1)));
                                        out.println("</td>");
                                        out.println("</tr>");
                                    }
                                       obj.close();
                                } catch (Exception e) {
                                        obj.close();
                                }


                            
                               
                            
                        %>
                    </tbody>
                </table>


            </div>

        </div>

    </div>
</div>

<!--ends-->
<!--below code for symtoms-->

<div class="dcont" id="contaddsymptom">
    <div class="container-fluid" >
        <div class="row">
            <div class="col-sm-12 "><h1>Manage Symptom</h1></div>

        </div>
        <div class="row">
            <div class="col-sm-9"><h3>New Symptom</h3>
                <div class="row">

                    <div class="col-sm-6"><label>Symptom Name  </label> 
                        <input type="text" class="form-control" id="symname" value="">

                        <br>
                        <input class="btn-default form-control" type="button" onclick="addsym();" value="Add">
                    </div>
                </div>
            </div>

            <div style="margin-top: 40px" class="col-sm-9"><h3>Edit Symptom</h3>
                <div class="row">

                    <div class="col-sm-6"><label>Symptom Name  </label> 
                        <select id="listsym" onchange="perfsel(this.value);">

                        </select>
                        <input class=" form-control" type="text" id="editsyminp" ><br>
                        <input class="btn-default form-control" type="button" onclick="updatesym('edit')" value="Update">
                        <input class="btn-default form-control" type="button" onclick="updatesym('del')" value="Delete">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function updatesym(mode)
    {
        proceed = false;

        value = document.getElementById("listsym").value;
        newvalue = document.getElementById("editsyminp").value;
        if (mode == "del")
        {
            if (confirm('Are you sure you want to Delete ' + value + " ?"))
                proceed = true;
        }
        if (mode == "edit")
        {
            if (confirm('Are you sure you want to Update ' + value + " to " + newvalue + " ?"))
                proceed = true;
        }
        if (proceed)
        {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    // alert(this.responseText.toString().trim());
                    if (this.responseText.toString().trim() == "not")
                        alert("Failed");
                    else if (this.responseText.toString().trim() == "int")
                        alert("Delete all records which has " + value + " as symptom");

                    loadsym();
                }

            };
            //alert(value+","+newvalue);
            xmlhttp.open("GET", "../SymMan?mode=" + mode + "&value=" + value + "&newvalue=" + newvalue, true);
            xmlhttp.send();
        }

    }



    function perfsel(opt)
    {
        document.getElementById("editsyminp").value = opt;
    }
    function loadsym()
    {


        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                console.log(this.responseText);
                listcon = "";
                var data = JSON.parse(this.responseText);

                for (i = 0; i < data.length; i++)
                {
                    listcon += "<option value=\"" + data[i] + "\">" + data[i] + "</option>\n";

                }
                //alert(listcon);
                document.getElementById("listsym").innerHTML = listcon;
                document.getElementById("listsym").value = data[0];
                document.getElementById("editsyminp").value = data[0];
            }
        };

        xmlhttp.open("GET", "../LoadSym", true);
        xmlhttp.send();
    }

    loadsym();
</script>

<script>

    var seloption = "";
    function loadsymforselect()
    {
        var y = document.getElementById("selsymsel");
        seloption = "";
        for (i = 0; i < y.length; i++)
        {
            if (y[i].selected)
            {

                seloption += y[i].innerHTML + ","


            }

            document.getElementById("selsym").innerHTML = seloption.slice(0, seloption.length - 1);
        }


    }
    loadsymforselect();
    document.getElementById("selsymsel").onchange = function () {

        loadsymforselect();

    }


    //    ajax for loading
    function refreshstats()
    {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                console.log(this.responseText);

                var data = JSON.parse(this.responseText);
                $("#v-search").html(data['searchcount']);
                $("#v-cancer").html(data['cancertype']);
                $("#v-symptom").html(data['symptom']);
                $("#v-patient").html(data['patientcount']);


            }
        };

        xmlhttp.open("GET", "../RefreshStat", true);
        xmlhttp.send();

        var xmlhttp2 = new XMLHttpRequest();
        xmlhttp2.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                //  alert(this.responseText);



                if (this.responseText.toString().trim().length > 0)
                    $("#v-notification").html(this.responseText);
                else
                    refreshstats();



            }
        };

        xmlhttp2.open("GET", "../RefreshNotification", true);
        xmlhttp2.send();


    }

    refreshstats();
    window.setInterval(refreshstats, 5000);
</script>




