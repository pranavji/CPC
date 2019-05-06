
<!--//for cancermanage-->
<!--below code for cancermanagement-->

<div class="dcont" id="contaddcancer">
    <div class="container-fluid" >
        <div class="row">
            <div class="col-sm-12 "><h1>Manage Cancers</h1></div>

        </div>
        <div class="row">
            <div class="col-sm-9"><h3>New Cancer</h3>
                <div class="row">

                    <div class="col-sm-6"><label>Cancer Name  </label> 
                        <input type="text" class="form-control" id="canname" value="">

                        <br>
                        <input class="btn-default form-control" type="button" onclick="addcan();" value="Add">
                    </div>
                </div>
            </div>

            <div style="margin-top: 40px" class="col-sm-9"><h3>Edit Cancer</h3>
                <div class="row">

                    <div class="col-sm-6"><label>Cancer Name  </label> 
                        <select id="listcan" onchange="perfsel2(this.value);">

                        </select>
                        <input class=" form-control" type="text" id="editcaninp" ><br>
                        <input class="btn-default form-control" type="button" onclick="updatecan('edit')" value="Update">
                        <input class="btn-default form-control" type="button" onclick="updatecan('del')" value="Delete">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function updatecan(mode)
    {
        proceed = false;

        value = document.getElementById("listcan").value;
        newvalue = document.getElementById("editcaninp").value;
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
                    if (this.responseText.toString().trim() == "not")
                        alert("Failed");
                    else if (this.responseText.toString().trim() == "int")
                        alert("Delete all patient records that has "+value+" as cancer");
                    loadcan();
                }

            };

            xmlhttp.open("GET", "../CanMan?mode=" + mode + "&value=" + value + "&newvalue=" + newvalue, true);
            xmlhttp.send();
        }

    }



    function perfsel2(opt)
    {
        document.getElementById("editcaninp").value = opt;
    }
    function loadcan()
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
                document.getElementById("listcan").innerHTML = listcon;
                document.getElementById("listcan").value = data[0];
                document.getElementById("editcaninp").value = data[0];
            }
        };

        xmlhttp.open("GET", "../LoadCan", true);
        xmlhttp.send();
    }

    loadcan();
    
</script>