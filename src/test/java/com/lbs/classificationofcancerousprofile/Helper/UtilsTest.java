/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbs.classificationofcancerousprofile.Helper;

import org.junit.Assert;
import org.junit.Test;

/**
 *
 * @author TechJoint
 */
public class UtilsTest {
    @Test
    public void testgetBloodGroup()
    {
        Assert.assertSame (Utils.getBloodGroup(0),"O+");
    }
    
}
