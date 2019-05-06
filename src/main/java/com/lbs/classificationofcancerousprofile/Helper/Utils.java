/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbs.classificationofcancerousprofile.Helper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TechJoint
 */
public class Utils {

    public static HashMap<Integer, String> symptomlist = new HashMap<Integer, String>();
    public static HashMap<String, Integer> symptomkeylist = new HashMap<String, Integer>();
    public static HashMap<Integer, String> cancerlist = new HashMap<Integer, String>();
    public static HashMap<String, Integer> cancerkeylist = new HashMap<String, Integer>();
//    public static String convertIntMapToString(String data) {
//        refreshsyms();
//        String retval = "";
//        String datasplit[] = data.split(",");
//        for (int i = 0; i < datasplit.length; i++) {
//            if (i < datasplit.length - 1) {
//                retval += symptomlist.get(Integer.parseInt(datasplit[i])) + ",";
//            } else {
//                retval += symptomlist.get(Integer.parseInt(datasplit[i]));
//            }
//
//        }
//        return retval;
//    }

    public static void refreshsyms() {
        DBhelper obj = new DBhelper();
        try {
            ResultSet rs = obj.dbQuery("select * from symptom;");
            Utils.symptomlist = new HashMap<Integer, String>();
            Utils.symptomkeylist = new HashMap< String,Integer>();
            while (rs.next()) {

                Utils.symptomlist.put(Integer.parseInt(rs.getString(1)), rs.getString(2));
                Utils.symptomkeylist.put(rs.getString(2), Integer.parseInt(rs.getString(1)));

            }

        } catch (SQLException ex) {
            Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            obj.close();
        }
    }

    public static void refreshcans() {
        DBhelper obj = new DBhelper();
        try {
            ResultSet rs = obj.dbQuery("select * from cancertype;");
            Utils.cancerlist = new HashMap<Integer, String>();
            Utils.cancerkeylist = new HashMap< String,Integer>();
            while (rs.next()) {

                Utils.cancerlist.put((rs.getInt(1)), rs.getString(2));
                Utils.cancerkeylist.put(rs.getString(2), (rs.getInt(1)));

            }

        } catch (SQLException ex) {
            Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            obj.close();
        }
    }

    public static String getPatSym(String id) {
        String retval = "";
        DBhelper obj = new DBhelper();
        try {
            refreshsyms();

            List<String> datasplit = new ArrayList<String>();
            ResultSet rs = obj.dbQuery("select symid from patssym where patid='" + id + "';");
            while (rs.next()) {
                datasplit.add(rs.getString(1));
            }
            for (int i = 0; i < datasplit.size(); i++) {
                if (i < datasplit.size() - 1) {

                    retval += symptomlist.get(Integer.parseInt(datasplit.get(i))) + ",<br>";
                } else {
                    retval += symptomlist.get(Integer.parseInt(datasplit.get(i)));
                }

            }

        } catch (Exception ex) {
            Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            obj.close();
        }
        return retval;
    }

    public static List<Integer> getSymtomIntegerList(String id) {
        List<Integer> retval = new ArrayList<Integer>();
        DBhelper obj = new DBhelper();
        try {
            refreshsyms();

            ResultSet rs = obj.dbQuery("select symid from patssym where patid='" + id + "';");
            while (rs.next()) {
                retval.add(Integer.parseInt(rs.getString(1)));
            }

        } catch (Exception ex) {
            Logger.getLogger(Utils.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
           obj.close();
        }
        return retval;
    }

    public static String getBloodGroup(int id) {
        switch (id) {
            case 0:
                return ("O+");
            case 1:
                return ("O-");
            case 2:
                return ("A+");
            case 3:
                return ("A-");
            case 4:
                return ("B+");
            case 5:
                return ("B-");
            case 6:
                return ("AB+");
            case 7:
                return ("AB-");
            default:
                return null;

        }
    }
}
