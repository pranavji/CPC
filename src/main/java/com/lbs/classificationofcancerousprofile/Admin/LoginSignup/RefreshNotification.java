/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbs.classificationofcancerousprofile.Admin.LoginSignup;

import com.lbs.classificationofcancerousprofile.Helper.DBhelper;
import com.lbs.classificationofcancerousprofile.Helper.Global;
import com.lbs.classificationofcancerousprofile.Helper.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
public class RefreshNotification extends HttpServlet {

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
            ResultSet rs=obj.dbQuery("select * from notification order by ctime desc limit 20");
            String cont="";
            Utils.refreshcans();
            while(rs.next())
            {
                String name=rs.getString(2);
                String mgs=rs.getString(3);
              
               
                String time=rs.getString(4);
               
               
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.0");
                LocalDateTime dateTime = LocalDateTime.parse(time, formatter);
                 DateTimeFormatter printformat = DateTimeFormatter.ofPattern("hh:mm 'on' dd MMM");

                  
                cont+="  <a href=\"#\" class=\"list-group-item list-group-item-action active\">\n" +
"                                                    <div class=\"notification-info\">\n" +
"                                                        <div class=\"notification-list-user-img\"><img src=\"assets/images/avatar-2.png\" alt=\"\" class=\"user-avatar-md rounded-circle\"></div>\n" +
"                                                        <div class=\"notification-list-user-block\"><span class=\"notification-list-user-name\">"+name+"</span>  "+mgs+" \n" +
"                                                            <div class=\"notification-date\">"+dateTime.format(printformat)+"</div>\n" +
"                                                        </div>\n" +
"                                                    </div>\n" +
"                                                </a>";
            }
            
        out.println(cont);
        } catch (Exception ex) {
            Logger.getLogger(RefreshNotification.class.getName()).log(Level.SEVERE, null, ex);
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
