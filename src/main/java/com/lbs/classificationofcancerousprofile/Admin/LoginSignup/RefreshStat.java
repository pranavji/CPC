/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbs.classificationofcancerousprofile.Admin.LoginSignup;

import com.google.gson.Gson;
import com.lbs.classificationofcancerousprofile.Helper.DBhelper;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.Json;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.lbs.classificationofcancerousprofile.Helper.DBhelper.*;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author TechJoint
 */
public class RefreshStat extends HttpServlet {

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
        Connection con=null;
        try (PrintWriter out = response.getWriter()) {
            
          HashMap<String,String> data=new HashMap<String,String>();
           
             Class.forName("com.mysql.jdbc.Driver");
             con=DriverManager.getConnection("jdbc:mysql://"+DBhelper.SERVER_IP+"/"+DBhelper.dbname,DBhelper.user,DBhelper.password);
            PreparedStatement st=con.prepareStatement("select count(*) as count from search;");
            
            ResultSet rs= st.executeQuery();
            if(rs.next())
            {
                data.put("searchcount", rs.getString("count")); 
            }
            st=con.prepareStatement("select count(*) as count from patientpoint;");
            
             rs= st.executeQuery();
            if(rs.next())
            {
                data.put("patientcount", rs.getString("count")); 
            }
            st=con.prepareStatement("select count(*) as count from cancertype;");
            
             rs= st.executeQuery();
            if(rs.next())
            {
                data.put("cancertype", rs.getString("count")); 
            }
            st=con.prepareStatement("select count(*) as count from symptom;");
            
             rs= st.executeQuery();
            if(rs.next())
            {
                data.put("symptom", rs.getString("count")); 
            }
            
            Gson obj=new Gson();
            String tosend=obj.toJson(data);
            out.print(tosend);
            
            
          
        } catch (Exception ex) {
            Logger.getLogger(RefreshStat.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally 
        {
            if(con!=null)
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(RefreshStat.class.getName()).log(Level.SEVERE, null, ex);
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
