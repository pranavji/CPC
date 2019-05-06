/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbs.classificationofcancerousprofile.Helper;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TechJoint
 */
public class Notification {
    public static void pushNotification(String name,String msg)
    {
        DBhelper obj=new DBhelper();
        try {
            obj.dbUpdate("insert into notification (subject,message) values('"+name+"','"+msg+"')");
        } catch (Exception ex) {
            Logger.getLogger(Notification.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
