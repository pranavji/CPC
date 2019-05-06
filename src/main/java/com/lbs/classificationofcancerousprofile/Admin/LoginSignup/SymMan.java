/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbs.classificationofcancerousprofile.Admin.LoginSignup;

import com.lbs.classificationofcancerousprofile.Helper.DBhelper;
import com.lbs.classificationofcancerousprofile.Helper.Notification;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TechJoint
 */
public class SymMan extends HttpServlet {

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
            try{
          String mode;
          String value;
          String newValue;
          mode=request.getParameter("mode");
          
          if(mode.equals("edit"))
          {
              value=request.getParameter("value");
              newValue=request.getParameter("newvalue");
              String q="update  symptom set symptom='"+newValue+"' where symptom='"+value+"';";
              System.out.println(q);
              new DBhelper().dbUpdate(q);
              Notification.pushNotification("User "+request.getSession().getAttribute("name").toString()," has update symptom "+value+" to "+newValue);
          }
          else
          {
               value=request.getParameter("value");
             
              new DBhelper().dbUpdate("delete from symptom where symptom='"+value+"';");
               Notification.pushNotification("User "+request.getSession().getAttribute("name").toString()," has deleted symptom "+value+"");
          }
          out.println("success");
          
            }
            catch(MySQLIntegrityConstraintViolationException e)
            {
                out.println("int");
            }
            catch(Exception e)
            {
                e.printStackTrace();
                 out.println("not");
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
