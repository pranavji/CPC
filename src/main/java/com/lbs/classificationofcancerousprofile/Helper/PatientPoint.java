
package com.lbs.classificationofcancerousprofile.Helper;

import java.util.HashMap;


public class PatientPoint {

    private String str_name;
    private int int_bloodgroup, int_gender, int_age;
    private int int_cancertype,int_stage;
    private float float_bmi, float_tumor_diameter;
    private boolean bool_cancer_history, bool_isveg;
    private HashMap<Integer, String> m_symtop;
    private String 
            str_treatment, 
            str_recoverytime,
            str_surgery_complications,
            str_diagnosis;
    private int id;

    public int getInt_cancertype() {
        return int_cancertype;
    }

    public void setInt_cancertype(int int_cancertype) {
        this.int_cancertype = int_cancertype;
    }

    public String getStr_surgery_complications() {
        return str_surgery_complications;
    }

    public void setStr_surgery_complications(String str_surgery_complications) {
        this.str_surgery_complications = str_surgery_complications;
    }

    public String getStr_diagnosis() {
        return str_diagnosis;
    }

    public void setStr_diagnosis(String str_diagnosis) {
        this.str_diagnosis = str_diagnosis;
    }
    
    //access nonaccess returntype fname(args)

    public int getInt_stage() {
        return int_stage;
    }

    public void setInt_stage(int int_stage) {
        this.int_stage = int_stage;
    }

    public PatientPoint(String str_name, int int_bloodgroup, int int_gender, int int_age, int int_cancertype, int int_stage, float float_bmi, float float_tumor_diameter, boolean bool_cancer_history, boolean bool_isveg, HashMap<Integer, String> m_symtop) {
        this.str_name = str_name;
        this.int_bloodgroup = int_bloodgroup;
        this.int_gender = int_gender;
        this.int_age = int_age;
        this.int_cancertype = int_cancertype;
        this.int_stage = int_stage;
        this.float_bmi = float_bmi;
        this.float_tumor_diameter = float_tumor_diameter;
        this.bool_cancer_history = bool_cancer_history;
        this.bool_isveg = bool_isveg;
        this.m_symtop = m_symtop;
    }

    public PatientPoint(String str_name, int int_bloodgroup, int int_gender, int int_age, int int_cancertype, int int_stage, float float_bmi, float float_tumor_diameter, boolean bool_cancer_history, boolean bool_isveg, HashMap<Integer, String> m_symtop, String str_treatment, String str_recoverytime, String str_surgery_complications, String str_diagnosis, int id) {
        this.str_name = str_name;
        this.int_bloodgroup = int_bloodgroup;
        this.int_gender = int_gender;
        this.int_age = int_age;
        this.int_cancertype = int_cancertype;
        this.int_stage = int_stage;
        this.float_bmi = float_bmi;
        this.float_tumor_diameter = float_tumor_diameter;
        this.bool_cancer_history = bool_cancer_history;
        this.bool_isveg = bool_isveg;
        this.m_symtop = m_symtop;
        this.str_treatment = str_treatment;
        this.str_recoverytime = str_recoverytime;
        this.str_surgery_complications = str_surgery_complications;
        this.str_diagnosis = str_diagnosis;
        this.id = id;
    }

  

    
    

    public MatchResult calc_distance(PatientPoint obj) {
        System.out.println("____________________________________________________________________________________________");
        System.out.println("Calculating distance for "+this.str_name+" to "+obj.str_name);
        float non_symptom_rank = 0, symptom_rank = 0;
        MatchResult result=new MatchResult();
        if (this.int_bloodgroup == obj.int_bloodgroup) {
            non_symptom_rank++;
            result.setBloodgroup(true);
            
        }
        System.out.println("blood grp math"+this.int_bloodgroup+" : "+obj.int_bloodgroup);
        if (this.int_gender == obj.int_gender) {
            non_symptom_rank++;
            result.setGender(true);
        }
        System.out.println("gender math"+this.int_gender+" : "+obj.int_gender);
        if (this.bool_cancer_history == obj.bool_cancer_history) {
            non_symptom_rank++;
            result.setCancerhistory(true);
        }
        System.out.println("cancer math"+this.bool_cancer_history+" : "+obj.bool_cancer_history);
        if (this.bool_isveg == obj.bool_isveg) {
            non_symptom_rank++;
            result.setIsveg(true);
        }
          System.out.println("isveg math"+this.bool_isveg+" : "+obj.bool_isveg);
        //calculating variance of bmi
        float bmicalc=calc_variance(this.float_bmi, obj.float_bmi, Global.MIN_BMI, Global.MAX_BMI);
         System.out.println("bmi var "+bmicalc+" orig "+this.float_bmi+":"+ obj.float_bmi+" , min max"+Global.MIN_BMI+":"+ Global.MAX_BMI);
        result.setBmi(bmicalc);
        non_symptom_rank += bmicalc;
        //calculating variance of tumor diameter
        float tdcalc=calc_variance(this.float_tumor_diameter, obj.float_tumor_diameter,Global.MIN_TUMOR_DIAMETER, Global.MAX_TUMOR_DIAMETER);
        result.setTumordiameter( tdcalc);
        System.out.println("td var "+tdcalc+" orig "+this.float_tumor_diameter+":"+ obj.float_tumor_diameter+" , min max"+Global.MIN_TUMOR_DIAMETER+":"+ Global.MAX_TUMOR_DIAMETER);
        non_symptom_rank +=result.getTumordiameter();
        //calculating variance of age
        float calcage=calc_variance(this.int_age, obj.int_age,Global.MIN_AGE, Global.MAX_AGE);
        result.setAge(calcage);
        non_symptom_rank += calcage;
        System.out.println("age var "+calcage+" orig "+this.int_age+":"+ obj.int_age+" , min max"+Global.MIN_AGE+":"+ Global.MAX_AGE);
        non_symptom_rank/=7;
        result.setNonsymptom(non_symptom_rank);
        int totalsymptom=m_symtop.size()>obj.m_symtop.size()?m_symtop.size():obj.m_symtop.size();
        int matchval=0;
        
        //syntaxfor foreach
        //for(datatypeofelementincolection tempvar : collection){}\
        //example 
        //int[] roll={12,22,41,44};
        //for (int temp : roll){s.o.p("roll="+temp);}
        //for(int i=0;i<roll.size();i++)
        //{s.o.p(roll[i]);}
        System.out.println("total syms in pat"+m_symtop.size());
        System.out.println("total syms in current"+obj.m_symtop.size());
        for(int x:m_symtop.keySet())
        {
            for(int y:obj.m_symtop.keySet())
            {
                System.out.println(x+" with "+y);
                if(x==y)
                {
                    matchval++;
                    System.out.println("matched");
                }
                else
                    System.out.println("no");
            }
        }
        System.out.println("matchval="+matchval+"totsym="+totalsymptom);
        symptom_rank=(float)matchval/(float)totalsymptom;
        System.out.println("symtom rank"+symptom_rank);
        result.setSymptom(symptom_rank);
        result.setTotal(((symptom_rank+non_symptom_rank)/2));
        result.setPersondetails(obj);
        
        System.out.println("____________________________________________________________________________________________");
        return result;
    }
    //our formula
    private float calc_variance(float target, float current, float minval,float maxval) {
        return (1 - Math.abs(target - current) / (maxval-minval));
    }

    public String getStr_name() {
        return str_name;
    }

    public void setStr_name(String str_name) {
        this.str_name = str_name;
    }

    public String getStr_treatment() {
        return str_treatment;
    }

    public void setStr_treatment(String str_treatment) {
        this.str_treatment = str_treatment;
    }

    public String getStr_recoverytime() {
        return str_recoverytime;
    }

    public void setStr_recoverytime(String str_recoverytime) {
        this.str_recoverytime = str_recoverytime;
    }
   

   

  
}
