/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbs.classificationofcancerousprofile.Admin.LoginSignup;

import com.lbs.classificationofcancerousprofile.Helper.DBhelper;
import com.lbs.classificationofcancerousprofile.Helper.Global;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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
public class searchuser extends HttpServlet {

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
        DBhelper obj=new DBhelper();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
         
            ResultSet rs=obj.dbQuery("select * from adminlogin where username like '%"+request.getParameter("key")+"%' or name like '%"+request.getParameter("key")+"%'");
            String cont="";
            while(rs.next())
            {
                String enakey="";
                if(rs.getInt("enabled")==0)
                {
                    enakey="<a style='color:green' href='../enable?set=1&uname="+URLEncoder.encode( ""+rs.getString("username"), "UTF-8" )+"&key="+request.getParameter("key")+"' > Enable </a>";
                }
                else
                    enakey="<a style='color:red' href='../enable?set=0&uname="+URLEncoder.encode( ""+rs.getString("username"), "UTF-8" )+"&key="+request.getParameter("key")+"' > Disable </a>";
                cont+=String.format("<tr><td>%s</td><td>%s</td><td>%s</td></tr>",rs.getString("username"),rs.getString("name"),enakey);
            }
            out.println(cont);
        } catch (Exception ex) {
            Logger.getLogger(searchuser.class.getName()).log(Level.SEVERE, null, ex);
            response.getWriter().println("Refresh");
        }
         finally
        {
            obj.close();
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
