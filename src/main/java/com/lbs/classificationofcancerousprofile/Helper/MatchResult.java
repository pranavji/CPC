/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbs.classificationofcancerousprofile.Helper;

/**
 *
 * @author TechJoint
 */
public class MatchResult {
    private boolean bloodgroup=false,gender=false,cancerhistory=false,isveg=false;
    private float bmi,tumordiameter,total,nonsymptom,age,symptom;
    private PatientPoint persondetails;
    
    
    public float getAge() {
        return age;
    }

    public PatientPoint getPersondetails() {
        return persondetails;
    }

    public void setPersondetails(PatientPoint persondetails) {
        this.persondetails = persondetails;
    }

    public void setAge(float age) {
        this.age = age;
    }

    public float getNonsymptom() {
        return nonsymptom;
    }

    public void setNonsymptom(float nonsymptom) {
        this.nonsymptom = nonsymptom;
    }

    public float getSymptom() {
        return symptom;
    }

    public void setSymptom(float symptom) {
        this.symptom = symptom;
    }

    public boolean isBloodgroup() {
        return bloodgroup;
    }

    public void setBloodgroup(boolean bloodgroup) {
        this.bloodgroup = bloodgroup;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public boolean isCancerhistory() {
        return cancerhistory;
    }

    public void setCancerhistory(boolean cancerhistory) {
        this.cancerhistory = cancerhistory;
    }

    public boolean isIsveg() {
        return isveg;
    }

    public void setIsveg(boolean isveg) {
        this.isveg = isveg;
    }

    public float getBmi() {
        return bmi;
    }

    public void setBmi(float bmi) {
        this.bmi = bmi;
    }

    public float getTumordiameter() {
        return tumordiameter;
    }

    public void setTumordiameter(float tumordiameter) {
        this.tumordiameter = tumordiameter;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }



    public MatchResult() {
    }
    
    
}
