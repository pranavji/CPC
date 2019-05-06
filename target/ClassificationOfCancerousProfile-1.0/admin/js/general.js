function chcontent(name)
{

    document.getElementById("contdashboard").style.display="none";
    document.getElementById("contaddpat").style.display="none";
    document.getElementById("contaddsymptom").style.display="none";
    document.getElementById("contmanpat").style.display="none";
     document.getElementById("contaddcancer").style.display="none";
          document.getElementById("contmanuser").style.display="none";
        document.getElementById(name).style.display="block";
        
       
}

function addsym()
{
     catname=document.getElementById("symname").value;
     if(catname.length>0)
     {
   // alert("read"+catname);
     var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        console.log(this.responseText);
                        if(this.responseText=="added")
                        {
                           loadsym();
                           document.getElementById("symname").value="";
                        }
                        else{
                        
                            document.getElementById("listsym").value=catname;
                        }
                    }
                };
               // alert(catname);
                xmlhttp.open("GET", "../SymAdd?catname=" + catname, true);
                xmlhttp.send();
            }
            else
                alert("Enter a Symptom before proceeding");
}
function addcan()
{
     catname=document.getElementById("canname").value;
     if(catname.length>0)
     {
   // alert("read"+catname);
     var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        console.log(this.responseText);
                        if(this.responseText=="added")
                        {
                           loadcan();
                           document.getElementById("canname").value="";
                        }
                        else{
                        
                            document.getElementById("listcan").value=catname;
                        }
                    }
                };
               // alert(catname);
                xmlhttp.open("GET", "../CanAdd?catname=" + catname, true);
                xmlhttp.send();
            }
            else
                alert("Enter a Cancer before proceeding");
}