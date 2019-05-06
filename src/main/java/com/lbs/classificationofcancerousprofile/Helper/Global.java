/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbs.classificationofcancerousprofile.Helper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TechJoint
 */
public class Global {

    public static final int MALE = 0;
    public static final int FEMALE = 1;
    public static final int OP = 0;
    public static final int ON = 1;
    public static final int AP = 2;
    public static final int AN = 3;
    public static final int BP = 4;
    public static final int BN = 5;
    public static final int ABP = 6;
    public static final int ABN = 7;
    public static  int TOTAL_SYMPTOM;
    public static  float MAX_TUMOR_DIAMETER=6;
    public static  float MAX_AGE=100;
    public static  float MAX_BMI=50;
    public static  float MIN_TUMOR_DIAMETER=0.1f;
    public static  float MIN_AGE=3;
    public static  float MIN_BMI=18;

    
    public static void loadmax(int age , float bmi,float td)
    {
        DBhelper obj=new DBhelper();
        try {
             obj=new DBhelper();
            ResultSet Rs=obj.dbQuery("select round(max(age),2) as maxage,round(max(bmi),2) as maxbmi, round(max(tumordiameter),2) as maxtd,round(min(age),2) as minage, round(min(bmi),2) as minbmi,round(min(tumordiameter),2) as mintd from patientpoint;");
            if(Rs.next())
            {
                MAX_AGE=Rs.getFloat("maxage");
                MAX_BMI=Rs.getFloat("maxbmi");
                MAX_TUMOR_DIAMETER=Rs.getFloat("maxtd");
                MIN_AGE=Rs.getFloat("minage");
                MIN_BMI=Rs.getFloat("minbmi");
                MIN_TUMOR_DIAMETER=Rs.getFloat("mintd");
            }
            //System.out.println(String.format("age=%s,bmi=%s,td=%s",age,bmi,td));
            MAX_AGE=MAX_AGE>age?MAX_AGE:age;
            MAX_BMI=MAX_BMI>bmi?MAX_BMI:bmi;
            MAX_TUMOR_DIAMETER=MAX_TUMOR_DIAMETER>td?MAX_TUMOR_DIAMETER:td;
            MIN_AGE=MIN_AGE<age?MIN_AGE:age;
            MIN_BMI=MIN_BMI<age?MIN_BMI:bmi;
            MIN_TUMOR_DIAMETER=MIN_TUMOR_DIAMETER<td?MIN_TUMOR_DIAMETER:td;
        } catch (Exception ex) {
            Logger.getLogger(Global.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
           
                obj.close();
           
        }
    }
    
}
 
