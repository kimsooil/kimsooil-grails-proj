package u56survey

import java.util.Date;

class SurveyCompleted {
	Date dateCreated // built-in
	Date lastUpdated // built-in

//  New ID / ethnic 	
	String consentNum // informed consent number
	String consentNumSurv="HISPBB" // Name of the survey
	String consentNumLoc
	
	// status keeping
	String step // step #. If completed, put 'completed' 
	String surveyer // admin or surveyer's login
	String updatedBy
	String completedBy
	
	Boolean completed=false
	
	String race
	String other_race
	String hispanic_or_latino
	String being_treated_for_cancer
		
// 	Demographic data
	String sex
	String age // calculate from DOB
	String addr_street1
	String addr_street2
	String addr_city
	String addr_state
	String addr_zipcode
	String country // use g:countrySelect tag
	Date DOB // date of birth mm/dd/yy
	String phone
	String marital_status // married,single,divorce, consensual relationship, other (widow)
	String education
	Boolean education_completed
	String current_occupation
	String current_occupation_time // years
	String prior_job
	String prior_job_time // years

	// occupational exposures
	String q8_1
	String q8_1_which // chemicals
	String q8_2
	String q8_3
	String q8_4
	String q8_4_which // industrial wastes
	String q8_5
	String q8_others // others... explain

// Person History of Cancer
	String weight // pounds
	String height_feet // feet inches
	String height_inches

	Boolean q11 // have you ever told by a doctor or health care provider that you have cancer
	String haveCancer

	String q11a_1, q11a_2, q11a_3, q11a_4, q11a_5, q11a_6 //  _5~_7 added for separate yes/no question
	//String q11a_hep_a_str, q11a_hep_b_str, q11a_hep_c_str, q11a_hep_donotknow_type_str // added for separate yes/no question
	//Boolean q11a_hep_a, q11a_hep_b, q11a_hep_c, q11a_hep_donotknow_type
	Boolean q11a_hep_donotknow_type
	Date q11a_1Year, q11a_2Year, q11a_3Year, q11a_4Year, q11a_5Year, q11a_6Year
	
	String spread_cancer // q11c
	Boolean spread_liver, spread_brain, spread_lung, spread_bone, spread_other 
	String spread_where
	
	// (preserve order of creation)
	String q12_1
	String q12_1_ageDiagnosed
	Boolean q12_1_1, q12_1_2, q12_1_3, q12_1_4
	String q12_2
	String q12_2_ageDiagnosed
	Boolean q12_2_1, q12_2_2, q12_2_3, q12_2_4
	String q12_3
	String q12_3_ageDiagnosed
	Boolean q12_3_1, q12_3_2, q12_3_3, q12_3_4
	String q12_4
	String q12_4_ageDiagnosed
	Boolean q12_4_1, q12_4_2, q12_4_3, q12_4_4
	String q12_5
	String q12_5_ageDiagnosed
	Boolean q12_5_1, q12_5_2, q12_5_3, q12_5_4
	String q12_6
	String q12_6_ageDiagnosed
	Boolean q12_6_1, q12_6_2, q12_6_3, q12_6_4
	String q12_7
	String q12_7_ageDiagnosed
	Boolean q12_7_1, q12_7_2, q12_7_3, q12_7_4
	String q12_8
	String q12_8_ageDiagnosed
	Boolean q12_8_1, q12_8_2, q12_8_3, q12_8_4
	String q12_9
	String q12_9_ageDiagnosed
	Boolean q12_9_1, q12_9_2, q12_9_3, q12_9_4
	String q12_10
	String q12_10_ageDiagnosed
	Boolean q12_10_1, q12_10_2, q12_10_3, q12_10_4
	String q12_11
	String q12_11_ageDiagnosed
	Boolean q12_11_1, q12_11_2, q12_11_3, q12_11_4
	String q12_12
	String q12_12_ageDiagnosed
	Boolean q12_12_1, q12_12_2, q12_12_3, q12_12_4
	String q12_13
	String q12_13_ageDiagnosed
	Boolean q12_13_1, q12_13_2, q12_13_3, q12_13_4
	String q12_14
	String q12_14_ageDiagnosed
	Boolean q12_14_1, q12_14_2, q12_14_3, q12_14_4
	String q12_15
	String q12_15_ageDiagnosed
	Boolean q12_15_1, q12_15_2, q12_15_3, q12_15_4
	String q12_16
	String q12_16_ageDiagnosed
	Boolean q12_16_1, q12_16_2, q12_16_3, q12_16_4
	String q12_17
	String q12_17_ageDiagnosed
	Boolean q12_17_1, q12_17_2, q12_17_3, q12_17_4
	String q12_18
	String q12_18_ageDiagnosed
	Boolean q12_18_1, q12_18_2, q12_18_3, q12_18_4
	String q12_19
	String q12_19_ageDiagnosed
	Boolean q12_19_1, q12_19_2, q12_19_3, q12_19_4
	String q12_20
	String q12_20_ageDiagnosed
	Boolean q12_20_1, q12_20_2, q12_20_3, q12_20_4
	String q12_21
	String q12_21_ageDiagnosed
	Boolean q12_21_1, q12_21_2, q12_21_3, q12_21_4
	String q12_22
	String q12_22_ageDiagnosed
	Boolean q12_22_1, q12_22_2, q12_22_3, q12_22_4
	String q12_23
	String q12_23_ageDiagnosed
	Boolean q12_23_1, q12_23_2, q12_23_3, q12_23_4
	String q12_24
	String q12_24_ageDiagnosed
	Boolean q12_24_1, q12_24_2, q12_24_3, q12_24_4
	String q12_which_cancer
	
	

// Family History of Cancer
	Boolean q13 // have any of your following blood-related family members been told by a doctor or other health care professional that they have cancer?
	String familyHaveCancer

	String q13_1_cancerType
	String q13_1_ageDiagnosed
	String q13_2_cancerType
	String q13_2_ageDiagnosed
	String q13_3_cancerType
	String q13_3_ageDiagnosed
	String q13_4_cancerType
	String q13_4_ageDiagnosed
	String q13_5_cancerType
	String q13_5_ageDiagnosed
	String q13_6_cancerType
	String q13_6_ageDiagnosed
	String q13_7_cancerType
	String q13_7_ageDiagnosed
	String q13_8_cancerType
	String q13_8_ageDiagnosed
	String q13_9_cancerType
	String q13_9_ageDiagnosed
	String q13_10_cancerType
	String q13_10_ageDiagnosed
	String q13_11_cancerType
	String q13_11_ageDiagnosed
	String q13_12_cancerType
	String q13_12_ageDiagnosed
	String q13_13_cancerType
	String q13_13_ageDiagnosed
	String q13_14_cancerType
	String q13_14_ageDiagnosed
	String q13_15_cancerType
	String q13_15_ageDiagnosed
	String q13_other_family_member
// Alcohol use
	
	String q14_1
	String q14_1_howManyPerWeek
	String q14_2
	String q14_2_howManyPerWeek
	String q14_3
	String q14_3_howManyPerWeek

// Tobacco use

	String q15_1
	String q15_1_howManyTimesPerWeek
	String q15_1_howManyYears
	String q15_2
	String q15_2_howManyTimesPerWeek
	String q15_2_howManyYears
	String q15_3
	String q15_3_howManyTimesPerWeek
	String q15_3_howManyYears
	String q15_4 
	String q15_4_howManyTimesPerWeek
	String q15_4_howManyYears
		
	// q16: Have you smoked at least 100 cigarettes (that's about 5 packs of cigarettes) in  your entire life? 
	String q16
	// if q16=false/no, skip to q22
	String q17 // Years, How old were you when you began to smoke cigarettes?
	String q18// About how many total years have you actually smoked cigarettes? (Do not include the times you may have quit smoking for a month or more)
	String q19 // On average, how many cigarettes did/do you smoke per day?
	Boolean q20 // Do you still smoke cigarettes?
	String stillSmoke
	Date q21_dateStopSmoking // if q20=no/false
	String q21_whenStopSmoking_years
	String q21_whenStopSmoking_months 

// Physical Activity (q22 starts...)

	String q22_1
	String q22_2
	String q22_3
	String q22_4
	String q22_5
	String q22_6
	String q22_7
	String q22_8, q22_others
	
	
	String LevelOfActivity // choose one from drop down list
	// 1. Active, no restrictions
	// 2. Restrictions, no exhaustive activities, but able to work
	// 3. Ambulatory, not able to do any work activities
	// 4. Confined to a wheel chair or bed partially
	// 5. Complete handicapped, totally bedridden or wheel chair

// quality of Life
	String q24_howDoYouFeelRightNow // q24. Calm, much energy, desolation, sadness
	String q25_howHaveYouFeltForPast4Weeks // q25. free text
	String q26 // in the past 3 months have you had any health problem
	String q26_explain
	String WhatIsProblem_q26 // explain
	String q27 // Does your health affect your social activity
	String q28 // excellent, very good, good, regular, poor
	
	String q29_1, q29_2, q29_3, q29_4, q29_5, q29_6, q29_7, q29_other
		
// History of Prostate Cancer (q30)
	
	// q30: Have you ever had in the past 3 months some of the following problems? please make a check mark in the table below.
	String q30_1 // painful urination
	String q30_2 // difficulty starting urine stream
	String q30_3 // blood in urine
	String q30_4 // Sensation of not emptying bladder completely after you finished urinating 
	String q30_5 // Urinating more than once every two hours during the day
	String q30_6 // Getting up more than once a night to urinate

	// q31: Did your doctor ever say that you have any of the following problems with your porstate? Please make a check mark in the table below.
	String q31_1 // Prostatitis (any infection or inflammation of the prostate
	String q31_2 // enlarged prostate or Benighn  Prostatic Hypertrophy
	String q31_3 // needed a prostate biopsy
	
	String q32 // Have you ever had a rectal exam?
	Date date_rectal_exam // month and year only
	String findings_rectal_exam
	
	String q33 // Have you ever a prostatic specific antigen(PSA) test?
	Date date_most_recent_PSA_test // month and year only
	String results_PSA_test
	
	String q34 // have you ever had erectile dysfunction
	
// History of Colon Cancer
	
	String q35 // have you have any digestive tract problem
	
	// q36: have you ever had any of the following symptoms in the last 3 months? Please make a check mark in the table below
	String q36_1// change in bowel habits
	String q36_2 // change in stool color
	String q36_3 // constipation
	String q36_4 // fine stool
	String q36_5 // blood in stool
	String q36_6 // black or tarry stool
	// q37 If you ever had rectal bleeding, how do you describe it:
	String q37 // bright red bleeding, melena (black stool)
	
	String q38 // If you ever had rectal bleeding, did you feel pain
	String q39 // have you doctor or health care provider recommended that you have a fecal occult blood test
	
	// q40: results of the fecal occult blood test
	String q40 // negative / positive
	
	
	String q41 // q41: have you ever had a digital rectal exam (yes/no/five or more years)
	Date date_digital_rectal_exam // month and year only // MARK if 5 years or more before (***)
	
	String q42 // have you ever had a sigmoidoscopy or colonoscopy
	Date date_sigmoidoscopy_colonoscopy // month and year only
	
	String q42_1 // noraml
	String q42_2 // ulcers
	String q42_3 // tumor
	String q42_4 // diverticulitis
	String q42_5 // colitis
	String q42_6 // fistula
	String q42_7 // hemorrhoids
	String q42_8 // polyps
	
	String q43 // a biopsy was performed
	String q43_biopsy_results
	
	String q44 // have you ever had anemia
	String q44_hemoglobin_levels
	
// History of Ovarian Cancer
	// q45: have you had any of the following gynecological problems in the past 3 months? please make a check mark in the table below
	String q45_1 // significant gain or loss of weight
	String q45_2 // abdominal inflammation
	String q45_3 // pelvic discomfort
	String q45_4 // vaginal bleeding
	String q45_5 // back pain that worsen with time
	String q45_6 // increasd abdominal size
	String q45_7
	//q46: have you ever had any of these gastrointestinal symptoms? please make a check mark in the table below
	String q46_1 // Increased gas production
	String q46_2 // lack of appetite
	String q46_3 // indigestion
	String q46_4 // nausea, vomiting
	String q46_5 // abdominal distention
	String q46_6 // increased urinating frequency
	String q46_7
	
	String q47 // every 6 months, every year, never
	Date q48_date_last_visit_gynecologist // month and year only
	String q49 // have you had a pelvic exam: yes, no
	String q49_findings_pelvic_exam // if q49=yes/true
	String q50 // have you had a digital rectal exam ... ??? same as q41
	String q50_findings_digital_rectal_exam
	
	// q51: Did your doctor order any of the following diagnostic test? please make a check mark in the table below
	String q51
	String q51_1 // CA 125
	String q51_2 // alphha-fetoprotein
	String q51_3 // quantitative HCG
	String q51_4 // sonogram
	String q51_5 // barium enema
	String q51_6 // intravenous pyelogram
	Date q51_1_date,q51_2_date,q51_3_date,q51_4_date,q51_5_date,q51_6_date
	String q51_1_result,q51_2_result,q51_3_result,q51_4_result,q51_5_result,q51_6_result
	
	String q52 // have you had a Pap Smear
	Date q52_date_most_recent_pap_smear //if q52 is yes/true
	String q52_results_pap_smear
	
	String q53 // have you ever used some medications for fertility?
	String q53_medication_fertility
	String q53_how_long_use_fertility_medication
	
// History of Gynecological and obstertrical hormonal history (female only)
	String q54
	String q55
	String q56
	String q57
	String q58
	String q59
	String q59_why
	String q59_whatAge
	String q60
	String q61
	String q61_whatAge
	String q62
	String q63
	String q64
	String q65
	String q66
	String q67
	String q68
	String q69
	String q69_which
	String q69_forWhat
	String q69_whatAgeStarted
	String q70
	Date q71
// Pregnancy History (female only)
	String q72
	String q73
	String q73_alive, q73_dead, q73_miscarriage
	String q74
	String q75
	String q76
	String q77
	String q78_1_week, q78_1_month
	String q78_2_week, q78_2_month
	String q78_3_week, q78_3_month
	String q78_4_week, q78_4_month
	String q78_5_week, q78_5_month
	String q78_6_week, q78_6_month
	String q78_7_week, q78_7_month
	String q78_8_week, q78_8_month
	String q78_9_week, q78_9_month
	String q78_10_week, q78_10_month
	String q79
	String q80, q80_which, q80_whatAge, q80_howLong
	String q81
	String q82
	String q82_1, q82_2, q82_3, q82_4, q82_5, q82_6, q82_7, q82_8, q82_9, q82_10, q82_11,q82_12,q82_13,q82_14,q82_15
	String q82_1_type, q82_2_type, q82_3_type, q82_4_type, q82_5_type, q82_6_type, q82_7_type, q82_8_type, q82_9_type, q82_10_type, q82_11_type, q82_12_type, q82_13_type, q82_14_type, q82_15_type
	String q82_1_whatAge, q82_2_whatAge, q82_3_whatAge, q82_4_whatAge, q82_5_whatAge, q82_6_whatAge, q82_7_whatAge, q82_8_whatAge, q82_9_whatAge, q82_10_whatAge, q82_11_whatAge,q82_12_whatAge,q82_13_whatAge,q82_14_whatAge,q82_15_whatAge
	String q82_1_aliveDead, q82_2_aliveDead, q82_3_aliveDead, q82_4_aliveDead, q82_5_aliveDead, q82_6_aliveDead, q82_7_aliveDead, q82_8_aliveDead, q82_9_aliveDead, q82_10_aliveDead, q82_11_aliveDead,q82_12_aliveDead,q82_13_aliveDead,q82_14_aliveDead,q82_15_aliveDead
	String q82_others
	
// Radiation History
	String q83
	String q84_1, q84_2, q84_3, q84_4, q84_5, q84_6, q84_7, q84_8, q84_9, q84_10
	Date q84_1_rad_date, q84_2_rad_date, q84_3_rad_date, q84_4_rad_date, q84_5_rad_date, q84_6_rad_date, q84_7_rad_date, q84_8_rad_date, q84_9_rad_date, q84_10_rad_date
	String q84_1_whatAge, q84_2_whatAge, q84_3_whatAge, q84_4_whatAge, q84_5_whatAge, q84_6_whatAge, q84_7_whatAge, q84_8_whatAge, q84_9_whatAge, q84_10_whatAge
	String q84_another
// Nutritional History
	String q85
	String q85_which
	String q85_sat_fat_1,q85_sat_fat_2,q85_sat_fat_3,q85_sat_fat_4,q85_sat_fat_5,q85_sat_fat_6,q85_sat_fat_7,q85_sat_fat_8,q85_sat_fat_9,q85_sat_fat_10,q85_sat_fat_11,q85_sat_fat_12,q85_sat_fat_13,q85_sat_fat_14
	String q85_vege_1,q85_vege_2,q85_vege_3,q85_vege_4,q85_vege_5,q85_vege_6,q85_vege_7,q85_vege_8,q85_vege_9,q85_vege_10,q85_vege_11,q85_vege_12,q85_vege_13,q85_vege_14
	String q85_sat_fat_other, q85_vege_other
	String q86
	String q87
	String q88
	String q89_1,q89_2,q89_3,q89_4,q89_5,q89_6,q89_7,q89_8, q89_other
// Lung Cancer Risk Assessment	
	String q90_1,q90_2,q90_3,q90_4,q90_5,q90_6
	String q90_1_age,q90_2_age,q90_3_age,q90_4_age,q90_5_age,q90_6_age
	Date q90_1_year,q90_2_year,q90_3_year,q90_4_year,q90_5_year,q90_6_year
	String q91_1, q91_2, q91_3
	String q91_1_howManyYears, q91_2_howManyYears, q91_3_howManyYears
	String q92_1,q92_2,q92_3,q92_4,q92_5,q92_6,q92_7,q92_8,q92_9
	String q92_1_howManyYears,q92_2_howManyYears,q92_3_howManyYears,q92_4_howManyYears,q92_5_howManyYears,q92_6_howManyYears,q92_7_howManyYears,q92_8_howManyYears,q92_9_howManyYears
	String q93
	String q93_1,q93_2,q93_3,q93_4,q93_5
	String q93_1_howManyMonths,q93_2_howManyMonths,q93_3_howManyMonths,q93_4_howManyMonths,q93_5_howManyMonths
	String q94_1,q94_2,q94_3,q94_4,q94_5, q94_6
	String q94_1_ageStart,q94_2_ageStart,q94_3_ageStart,q94_4_ageStart,q94_5_ageStart,q94_6_ageStart
	String q94_1_ageStop,q94_2_ageStop,q94_3_ageStop,q94_4_ageStop,q94_5_ageStop,q94_6_ageStop
	String q94_1_NumPillsPerWeek,q94_2_NumPillsPerWeek,q94_3_NumPillsPerWeek,q94_4_NumPillsPerWeek,q94_5_NumPillsPerWeek,q94_6_NumPillsPerWeek
	String q94_otherMedName1
	String q94_otherMedName2
	
	String q95_doctor_name, q95_doctor_telephone, q95_doctor_other_info
	String q95_addr_street1,q95_addr_street2, q95_addr_city, q95_addr_state, q95_addr_zipcode, q95_country

}
