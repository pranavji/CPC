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
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TechJoint
 */
public class doSignup extends HttpServlet {

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
        String name = request.getParameter("name");
        String username = request.getParameter("uname");
        String password = request.getParameter("psw");

        String x = null;
        try {
            x = request.getParameter("remember");
        } catch (Exception e) {
        }
        try {
            String qry = String.format("insert into adminlogin (USERNAME,PASSWORD,NAME) "
                    + "values('%s','%s','%s');", username, AeSimpleSHA1.SHA1(password), name);
            new DBhelper().dbUpdate(qry);

            HttpSession s = request.getSession();
            s.setAttribute("username", username);
            s.setAttribute("name", name);
            //System.err.println(username+"here");
            if (x != null) {
                Cookie ck = new Cookie("username", username);
                ck.setPath("/");
                ck.setMaxAge(96000);
                response.addCookie(ck);
                Cookie ck2 = new Cookie("name", name);
                ck2.setPath("/");
                ck2.setMaxAge(96000);
                response.addCookie(ck2);
            }
            Notification.pushNotification("User " + s.getAttribute("name").toString(), " has Signed Up");
            response.sendRedirect("admin/dashboard.jsp?ss=" + username);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/signin.jsp?status=failed");
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
