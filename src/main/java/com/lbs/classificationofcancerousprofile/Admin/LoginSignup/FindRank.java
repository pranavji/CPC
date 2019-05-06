/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbs.classificationofcancerousprofile.Admin.LoginSignup;

import com.lbs.classificationofcancerousprofile.Helper.DBhelper;
import com.lbs.classificationofcancerousprofile.Helper.Global;
import com.lbs.classificationofcancerousprofile.Helper.MatchResult;
import com.lbs.classificationofcancerousprofile.Helper.Notification;
import com.lbs.classificationofcancerousprofile.Helper.PatientPoint;
import com.lbs.classificationofcancerousprofile.Helper.Utils;
import com.sun.javafx.scene.control.skin.VirtualFlow;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TechJoint
 */
public class FindRank extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            String name, gender, bloodgroup, tumordiameter, age, bmi, cancerhistory, isveg, treatment, recoverytime;

            String[] symptom;
            name = request.getParameter("name");
            gender = request.getParameter("gender");
            bloodgroup = request.getParameter("bloodgroup");
            age = request.getParameter("age");
            bmi = request.getParameter("bmi");
            tumordiameter = request.getParameter("tumordiameter");
            cancerhistory = request.getParameter("cancerhistory");
            isveg = request.getParameter("isveg");
            treatment = request.getParameter("treatment");
            recoverytime = request.getParameter("recoverytime");
            //String mode = request.getParameter("mode");
            int int_bloodgroup = Integer.parseInt(bloodgroup), int_gender = Integer.parseInt(gender), int_age = Integer.parseInt(age);
            float float_bmi = Float.parseFloat(bmi), float_tumor_diameter = Float.parseFloat(tumordiameter);
            boolean bool_cancer_history, bool_isveg;
            int int_cancertype = Integer.parseInt(request.getParameter("ct"));
            int int_stage = Integer.parseInt(request.getParameter("stage"));
            symptom = request.getParameterValues("symptoms");
            bool_isveg = isveg.equals("1") ? true : false;
            bool_cancer_history = cancerhistory.equals("1") ? true : false;
            //refresh dataset
            new DBhelper().dbUpdate(String.format("insert into search (name,stage,cancertype) values('%s','%s','%s');",name,int_stage,int_cancertype));
            Notification.pushNotification(name, " with Stage "+int_stage+" "+Utils.cancerlist.get(int_cancertype)+" has searched");
            Utils.refreshsyms();
            Global.loadmax(int_age, float_bmi, float_tumor_diameter);

            HashMap<Integer, String> patient_sym = new HashMap<Integer, String>();
            for (String x : symptom) {
                int symid = Integer.parseInt(x);
                patient_sym.put(symid, Utils.symptomlist.get(symid));

            }
            //PatientPoint patient = new PatientPoint(name, int_bloodgroup, int_gender, int_age, float_bmi, float_tumor_diameter, bool_cancer_history, bool_isveg, patient_sym);
            PatientPoint patient = new PatientPoint(name, int_bloodgroup, int_gender, int_age, int_cancertype, int_stage, float_bmi, float_tumor_diameter, bool_cancer_history, bool_isveg, patient_sym);
            List<PatientPoint> trainedset = new ArrayList<PatientPoint>();
            //aquire trained data
            DBhelper obj=new DBhelper();
            ResultSet rs = obj.dbQuery("select * from patientpoint where cancertype='" + int_cancertype + "' and stage='" + int_stage + "';");
            while (rs.next()) {
                int tid = rs.getInt(1);
                name = rs.getString(2);
                int_bloodgroup = rs.getInt(3);
                int_gender = rs.getInt(4);
                int_age = rs.getInt(5);
                float_bmi = rs.getFloat(6);
                float_tumor_diameter = rs.getFloat(7);
                bool_cancer_history = rs.getString(8).equals("1") ? true : false;
                bool_isveg = rs.getString(9).equals("1") ? true : false;
                treatment = rs.getString(10);
                recoverytime = rs.getString(11);

                int_stage = rs.getInt(12);
                int_cancertype=rs.getInt(13);
                String surgicalcomplication = rs.getString(14);
                String str_diagnosis = rs.getString(15);
            
                DBhelper obj2=new DBhelper();
                
                ResultSet trs = obj2.dbQuery("select symptom.idsymtom as symid , symptom.symptom as symptom from symptom where symptom.idsymtom in (select patssym.symid from patssym where patssym.patid='" + tid + "');");
                HashMap<Integer, String> tempsym = new HashMap<Integer, String>();
                while (trs.next()) {
                    tempsym.put(trs.getInt(1), trs.getString(2));
                }
               
                obj2.close();
//                PatientPoint temp = new PatientPoint(name, int_bloodgroup, int_gender, int_age, float_bmi, float_tumor_diameter, bool_cancer_history, bool_isveg, tempsym, treatment, recoverytime, recoverytime, tid);
                //System.out.println("surgical complciton"+surgicalcomplication);
                PatientPoint temp = new PatientPoint(name, int_bloodgroup, int_gender, int_age, int_cancertype, int_stage, float_bmi, float_tumor_diameter, bool_cancer_history, bool_isveg, tempsym, treatment, recoverytime, surgicalcomplication, str_diagnosis, tid);
                trainedset.add(temp);
            }
            obj.close();
            List<MatchResult> result = new ArrayList<MatchResult>();
            //compate for each
            for (PatientPoint temp : trainedset) {
                result.add(patient.calc_distance(temp));
            }

            Collections.sort(result, new Comparator<MatchResult>() {
                @Override
                public int compare(MatchResult p1, MatchResult p2) {
                    return Float.compare(p2.getTotal(), p1.getTotal());
                }
            });
            request.getRequestDispatcher("includehead.jsp").include(request, response);
            if (result.size() == 0) {
                out.println("<div class='row'>");
                out.println("<div class='col-sm-12' style='background:lightblue;margin:10px;padding:20px;border-radius:20px'>");
                out.print("<h1>No Results</h1>");
                out.println("</div></div>");
            }
            int i=0;
            for (MatchResult x : result) {
               
                out.println("<div class='row ' style='z-index:0'>");
                out.println("<div class='col-sm-10 ' style='color:#000034;background:lightblue;margin:10px;padding:20px;border-radius:20px'>");

                out.println("<div class='row' style='color:#000034;border-radius:2pxmargin-top:5px;margin-bottom:5px'>");
                out.println("<div class='col-sm-12' >");
                Utils.refreshcans();
                out.println("<h5>Cancer Type : " + Utils.cancerlist.get(x.getPersondetails().getInt_cancertype()) + "</h5> <h5>Stage : " + x.getPersondetails().getInt_stage() + "</h5><br>");
                out.println("</div></div>");
                //inner
                out.println("<div class='row' style='color:#000034;border-radius:2pxmargin-top:5px;margin-bottom:5px'>");
                out.println("<div class='col-sm-12' >");

                out.println("<h5>Suggested Treatment : </h5>" + x.getPersondetails().getStr_treatment() + ""
                        + "<h5>Diagnosis :</h5> " + x.getPersondetails().getStr_diagnosis() 
                        + "<h5>Surgery Complications :</h5> " + x.getPersondetails().getStr_surgery_complications()
                        + "<br>");
                out.println("</div></div>");

                out.println("<div class='row' style='color:#000034;border-radius:2pxmargin-top:5px;margin-bottom:5px'>");
                out.println("<div class='col-sm-12' >");
                out.println("<h5>Recovery Time : </h5>" + x.getPersondetails().getStr_recoverytime() + "<br>");

                out.println("</div></div>");
                out.println("<div class='row ' style='color:#000034;border-radius:2px;margin-top:5px;margin-bottom:5px'>");
                out.println("<div class='col-sm-12' >");
                DecimalFormat f = new DecimalFormat("##.00");
                out.println("<h5 style='color:red'>Total Confidence : " + f.format((x.getTotal() * 100)) + "%</h5><br>");
                out.println("</div></div>");
//                    panelctl
                out.println("<h5 class='itemclass' onclick='togglenow("+i+")' style='border-radius:2px;padding:20px;box-shadow: 0px 0px 5px lightblue;background:#47C1FA'><button style='background: none;\n" +
"	color: inherit;\n" +
"	border: none;\n" +
"	padding: 0;\n" +
"	font: inherit;\n" +
"	cursor: pointer;\n" +
"	outline: inherit;'>Detailed Match</button><img id='down"+i+"' style='margin:-5px;height:30px;float:right' src='images/down.gif'> </h5>");
                out.print("<div  id='roster"+i+"' class='noselect' style='z-index:9900099;display:none;height:0px;position:relative;height:50%;border-radius:0px 0px 10px 10px;background:rgba(255,255,255,0.2)'>");
                   out.println("<div class='row itemclass' style='color:#000034;background:#47C1FA;box-shadow 1px 1px 5px #000034;width:80%;margin-left:10%;padding:10px;border-radius:5px;;margin-top:5px;margin-bottom:5px'>");
                out.println("<div class='col-sm-12' >");
                f = new DecimalFormat("##.00");
           
                out.println("BMI Match : " + f.format((x.getBmi() * 100)) + "%<br>");
                out.println("</div></div>");

                out.println("<div class='row itemclass' style='color:#000034;background:#47C1FA;box-shadow 1px 1px 5px #000034;width:80%;margin-left:10%;padding:10px;border-radius:5px;;margin-top:5px;margin-bottom:5px'>");
                out.println("<div class='col-sm-12' >");
                f = new DecimalFormat("##.00");
                out.println("Tumor Diameter Match : " + f.format((x.getTumordiameter() * 100)) + "%<br>");
                out.println("</div></div>");

                out.println("<div class='row itemclass' style='color:#000034;background:#47C1FA;box-shadow 1px 1px 5px #000034;width:80%;margin-left:10%;padding:10px;border-radius:5px;;margin-top:5px;margin-bottom:5px'>");
                out.println("<div class='col-sm-12' >");
                f = new DecimalFormat("##.00");
                out.println("Age Match : " + f.format((x.getAge() * 100)) + "%<br>");
                out.println("</div></div>");

                out.println("<div class='row itemclass' style='color:#000034;background:#47C1FA;box-shadow 1px 1px 5px #000034;width:80%;margin-left:10%;padding:10px;border-radius:5px;;margin-top:5px;margin-bottom:5px'>");
                out.println("<div class='col-sm-12' >");
                f = new DecimalFormat("##.00");
                out.println("Blood Group Match : " + x.isBloodgroup() + "<br>");
                out.println("</div></div>");

                out.println("<div class='row itemclass' style='color:#000034;background:#47C1FA;box-shadow 1px 1px 5px #000034;width:80%;margin-left:10%;padding:10px;border-radius:5px;;margin-top:5px;margin-bottom:5px'>");
                out.println("<div class='col-sm-12' >");
                f = new DecimalFormat("##.00");
                out.println("Gender Match : " + x.isGender() + "<br>");
                out.println("</div></div>");

                out.println("<div class='row itemclass' style='color:#000034;background:#47C1FA;box-shadow 1px 1px 5px #000034;width:80%;margin-left:10%;padding:10px;border-radius:5px;;margin-top:5px;margin-bottom:5px'>");
                out.println("<div class='col-sm-12' >");
                f = new DecimalFormat("##.00");
                out.println("Vegetarian Match : " + x.isIsveg() + "<br>");
                out.println("</div></div>");

                out.println("<div class='row itemclass' style='color:#000034;background:#47C1FA;box-shadow 1px 1px 5px #000034;width:80%;margin-left:10%;padding:10px;border-radius:5px;;margin-top:5px;margin-bottom:5px'>");
                out.println("<div class='col-sm-12' >");
                f = new DecimalFormat("##.00");
                out.println("Cancer history match : " + x.isCancerhistory() + "<br>");
                out.println("</div></div>");

                out.println("<div class='row itemclass' style='color:#000034;background:#47C1FA;box-shadow 1px 1px 5px #000034;width:80%;margin-left:10%;padding:10px;border-radius:5px;;margin-top:5px;margin-bottom:5px'>");
                out.println("<div class='col-sm-12' >");
                f = new DecimalFormat("##.00");
                out.println("Non Symptom Match : " + f.format((x.getNonsymptom() * 100)) + "%<br>");
                out.println("</div></div>");

                out.println("<div class='row itemclass' style='color:#000034;background:#47C1FA;box-shadow 1px 1px 5px #000034;width:80%;margin-left:10%;padding:10px;border-radius:5px;;margin-top:5px;margin-bottom:5px'>");
                out.println("<div class='col-sm-12' >");
                f = new DecimalFormat("##.00");
                out.println("Symptom Match : " + f.format((x.getSymptom() * 100)) + "%<br>");
                out.println("</div></div>");

                out.print("</div>");
                out.println("</div></div>");
               
                i++;
            }
            request.getRequestDispatcher("includefoot.jsp").include(request, response);
            try {
              
            } catch (Exception e) {
            };
        } catch (Exception ex) {
            Logger.getLogger(FindRank.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
