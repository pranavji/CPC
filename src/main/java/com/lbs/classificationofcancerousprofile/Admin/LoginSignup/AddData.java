/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbs.classificationofcancerousprofile.Admin.LoginSignup;

import com.lbs.classificationofcancerousprofile.Helper.DBhelper;
import com.lbs.classificationofcancerousprofile.Helper.Global;
import com.lbs.classificationofcancerousprofile.Helper.Notification;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class AddData extends HttpServlet {

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
            String mode = request.getParameter("mode");
            String stage, cancertype, sc, diag;
            stage = request.getParameter("stage");
            sc = request.getParameter("cc");
            diag = request.getParameter("diag");
            cancertype = request.getParameter("ct");
            symptom = request.getParameterValues("symptoms");
            out.println(name + "<br>" + gender + "<br>" + bloodgroup + "<br>" + age + "<br>" + bmi + "<br>" + tumordiameter + "<br>"
                    + cancerhistory + "<br>" + isveg + "<br>" + treatment + "<br>" + recoverytime + "<br>"
            );
//            out.println("chintoms");
//            String symptoms="";
//            for(int i=0;i<symptom.length;i++)
//            {
//                
//                if(i!=symptom.length-1)
//                    symptoms+=symptom[i]+",";
//                else
//                     symptoms+=symptom[i];
//            }
//            out.println(symptoms);

            if (mode.equals("add")) {
                String qry = String.format("insert into patientpoint (name, bloodgroup, gender, age, bmi, tumordiameter, cancerhistory, isveg, treatment, recoverytime,stage,cancertype,surgicalcomplications,diagnosis) VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s');",
                        name, bloodgroup, gender, age, bmi, tumordiameter, cancerhistory, isveg, treatment, recoverytime, stage, cancertype, sc, diag);
                System.out.println(qry);
                DBhelper obj = new DBhelper();
                try {
                    new DBhelper().dbUpdate(qry);
                    ResultSet rs = obj.dbQuery("select max(idpatientpoint) from patientpoint;");
                    int id = 0;

                    if (rs.next()) {
                        id = rs.getInt(1);
                    }
                    String q2;
                    for (String symid : symptom) {
                        q2 = String.format("insert into patssym (patid,symid) values('%s','%s')", id, symid);
                        new DBhelper().dbUpdate(q2);
                    }
                    Notification.pushNotification("User " + request.getSession().getAttribute("name").toString(), " has added patient details of " + name + " ");
                    response.sendRedirect("admin/dashboard.jsp?page=manpat&msg=Successfully added " + name);
                } catch (Exception ex) {
                    Logger.getLogger(AddData.class.getName()).log(Level.SEVERE, null, ex);
                    response.sendRedirect("admin/dashboard.jsp?page=managepat&msg=Failed to add " + name);
                } finally {
                    obj.close();
                }
            } else {
                String qry = String.format("update patientpoint set name='%s',bloodgroup='%s',gender='%s',age='%s',bmi='%s',tumordiameter='%s',cancerhistory='%s',isveg='%s',treatment='%s',recoverytime='%s',stage='%s',cancertype='%s',surgicalcomplications='%s',diagnosis='%s' where idpatientpoint='%s';",
                         name, bloodgroup, gender, age, bmi, tumordiameter, cancerhistory, isveg, treatment, recoverytime, stage, cancertype, sc, diag, request.getParameter("uid"));
                System.out.println(qry);
                try {
                    new DBhelper().dbUpdate(qry);
                    int id = Integer.parseInt(request.getParameter("uid"));
                    new DBhelper().dbUpdate("delete from patssym where patid='" + id + "';");
                    String q2;
                    for (String symid : symptom) {
                        q2 = String.format("insert into patssym (patid,symid) values('%s','%s')", id, symid);
                        new DBhelper().dbUpdate(q2);
                    }
                    Notification.pushNotification("User " + request.getSession().getAttribute("name").toString(), " has updated patient details of " + name + " ");
                    response.sendRedirect("admin/dashboard.jsp?page=manpat&msg=Successfully Updated " + name);
                } catch (Exception ex) {
                    Logger.getLogger(AddData.class.getName()).log(Level.SEVERE, null, ex);
                    response.sendRedirect("admin/dashboard.jsp?page=managepat&msg=Failed to Update " + name);
                }

            }
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
