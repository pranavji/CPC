/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbs.classificationofcancerousprofile.Admin.LoginSignup;

import com.lbs.classificationofcancerousprofile.Helper.AeSimpleSHA1;
import com.lbs.classificationofcancerousprofile.Helper.DBhelper;
import com.lbs.classificationofcancerousprofile.Helper.Notification;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 *
 * @author TechJoint
 */
public class doLogin extends HttpServlet {

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
        String username=request.getParameter("uname");
        String password=request.getParameter("psw");
        
        String x=null;
        try{
        x=request.getParameter("remember");
        }catch(Exception e)
        {
        }
        DBhelper obj=new DBhelper();
        try{
            String qry=String.format("select * "
                    + "from adminlogin where username='%s'"
                    + " and password='%s'", username,AeSimpleSHA1.SHA1(password));
            ResultSet rs=obj.dbQuery(qry);
            
        if(rs.next())
        {
            HttpSession s=request.getSession();
            s.setAttribute("username", username);
              
            s.setAttribute("name", rs.getString("name"));
            System.err.println(username+"here");
            if(x!=null)           
            {
            Cookie ck=new Cookie("username", username);  
              ck.setPath("/");
        ck.setMaxAge(96000);
            response.addCookie(ck);  
             Cookie ck2=new Cookie("name", rs.getString("name"));  
              ck2.setPath("/");
        ck2.setMaxAge(96000);
            response.addCookie(ck2);  
            }
           obj.close();
            Notification.pushNotification("User "+s.getAttribute("name")," has Logged in");
            response.sendRedirect("admin/dashboard.jsp?ss="+username);
        }
       
            
        else
        {obj.close();
           response.sendRedirect("admin/index.jsp?status=failed");
        }
        
        }catch(Exception e)
        {
            e.printStackTrace();
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
