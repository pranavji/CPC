/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbs.classificationofcancerousprofile.Helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author prana
 */
public class DBhelper {

    public static String user = "cpc";
    public static String password = "cpc@123";
    public static String dbname = "cpcdb";
    private Connection con=null;
    public static String SERVER_IP = "10.0.0.3:3306";;

    public void close() {
        try {
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {

        }
    }

    public void dbUpdate(String qry) throws Exception {

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://" + SERVER_IP + "/" + dbname, user, password);
        PreparedStatement st = con.prepareStatement(qry);
        st.executeUpdate();
        con.close();

    }

    public ResultSet dbQuery(String qry) throws Exception {

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://" + SERVER_IP + "/" + dbname, user, password);
        PreparedStatement st = con.prepareStatement(qry);

        return st.executeQuery();

    }

}
