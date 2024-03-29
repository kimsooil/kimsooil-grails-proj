package u56survey

import static java.util.Calendar.*

import org.codehaus.groovy.grails.commons.ConfigurationHolder
import org.codehaus.groovy.grails.commons.DefaultGrailsDomainClass

class SurveyController {
	def beforeInterceptor = [action:this.&authz, except:["index"]]

	// Export service provided by Export plugin
	def exportService
	
	def today = new Date()
	def thisyear=today[YEAR]
	
	def authz() {
		 if(!session.user) {
			 session.returnURL = request.request.requestURL
			 if (params.login && params.password)
			 	redirect(controller:"person", action:"authenticate", params:params)
			 else
			 	redirect(controller:"person", action:"login", params:params)
			 
			 return false
		 }
	}
	
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

	List fields = [
		"id",
		"surveyer",
		"mode",
		"completed",
		"completedBy",
		"dateCompleted",
		"consentNumSurv",
		"consentNumLoc",
		"consentNum",
		//"mrn",
		"step",
		"dateCreated",
		"lastUpdated",
		"being_treated_for_cancer",
		//"DOB",
		"shortDOB",
		"sex",
		"race",
		"other_race",
		"hispanic_or_latino",
		"addr_street1",
		"addr_street2",
		"addr_city",
		"addr_state",
		"addr_zipcode",
		"country",
		"marital_status",
		"education",
		"current_occupation",
		"current_occupation_time",
		"prior_job",
		"prior_job_time",
		"q8_1",
		"q8_1_which",
		"q8_2",
		"q8_3",
		"q8_4",
		"q8_4_which",
		"q8_5",
		"q8_others",
		"weight",
		"height_feet",
		"height_inches",
		"q11a_1",
		"q11a_1Year_only",
		"q11a_2",
		"q11a_2Year_only",
		"q11a_3",
		"q11a_3Year_only",
		"q11a_4",
		"q11a_4Year_only",
		"q11a_5",
		"q11a_5Year_only",
		"q11a_6",
		"q11a_6Year_only",
		"q11a_hep_donotknow_type",
		"q11a_hep_donotknow_type_Year_only",
		"haveCancer",
		"q12_1_1",
		"q12_1_2",
		"q12_1_3",
		"q12_1_4",
		"q12_1_ageDiagnosed",
		"q12_2_1",
		"q12_2_2",
		"q12_2_3",
		"q12_2_4",
		"q12_2_ageDiagnosed",
		"q12_3_1",
		"q12_3_2",
		"q12_3_3",
		"q12_3_4",
		"q12_3_ageDiagnosed",
		"q12_4_1",
		"q12_4_2",
		"q12_4_3",
		"q12_4_4",
		"q12_4_ageDiagnosed",
		"q12_5_1",
		"q12_5_2",
		"q12_5_3",
		"q12_5_4",
		"q12_5_ageDiagnosed",
		"q12_6_1",
		"q12_6_2",
		"q12_6_3",
		"q12_6_4",
		"q12_6_ageDiagnosed",
		"q12_7_1",
		"q12_7_2",
		"q12_7_3",
		"q12_7_4",
		"q12_7_ageDiagnosed",
		"q12_8_1",
		"q12_8_2",
		"q12_8_3",
		"q12_8_4",
		"q12_8_ageDiagnosed",
		"q12_9_1",
		"q12_9_2",
		"q12_9_3",
		"q12_9_4",
		"q12_9_ageDiagnosed",
		"q12_10_1",
		"q12_10_2",
		"q12_10_3",
		"q12_10_4",
		"q12_10_ageDiagnosed",
		"q12_11_1",
		"q12_11_2",
		"q12_11_3",
		"q12_11_4",
		"q12_11_ageDiagnosed",
		"q12_12_1",
		"q12_12_2",
		"q12_12_3",
		"q12_12_4",
		"q12_12_ageDiagnosed",
		"q12_13_1",
		"q12_13_2",
		"q12_13_3",
		"q12_13_4",
		"q12_13_ageDiagnosed",
		"q12_14_1",
		"q12_14_2",
		"q12_14_3",
		"q12_14_4",
		"q12_14_ageDiagnosed",
		"q12_15_1",
		"q12_15_2",
		"q12_15_3",
		"q12_15_4",
		"q12_15_ageDiagnosed",
		"q12_16_1",
		"q12_16_2",
		"q12_16_3",
		"q12_16_4",
		"q12_16_ageDiagnosed",
		"q12_17_1",
		"q12_17_2",
		"q12_17_3",
		"q12_17_4",
		"q12_17_ageDiagnosed",
		"q12_18_1",
		"q12_18_2",
		"q12_18_3",
		"q12_18_4",
		"q12_18_ageDiagnosed",
		"q12_19_1",
		"q12_19_2",
		"q12_19_3",
		"q12_19_4",
		"q12_19_ageDiagnosed",
		"q12_20_1",
		"q12_20_2",
		"q12_20_3",
		"q12_20_4",
		"q12_20_ageDiagnosed",
		"q12_21_1",
		"q12_21_2",
		"q12_21_3",
		"q12_21_4",
		"q12_21_ageDiagnosed",
		"q12_22_1",
		"q12_22_2",
		"q12_22_3",
		"q12_22_4",
		"q12_22_ageDiagnosed",
		"q12_23_1",
		"q12_23_2",
		"q12_23_3",
		"q12_23_4",
		"q12_23_ageDiagnosed",
		"q12_24_1",
		"q12_24_2",
		"q12_24_3",
		"q12_24_4",
		"q12_24_ageDiagnosed",
		"q12_which_cancer",
		"q12_25",
		"q12_25_1",
		"q12_25_2",
		"q12_25_3",
		"q12_25_4",
		"q12_25_ageDiagnosed",
		"q12_26",
		"q12_26_1",
		"q12_26_2",
		"q12_26_3",
		"q12_26_4",
		"q12_26_ageDiagnosed",
		"q12_27",
		"q12_27_1",
		"q12_27_2",
		"q12_27_3",
		"q12_27_4",
		"q12_27_ageDiagnosed",
		"q12_28",
		"q12_28_1",
		"q12_28_2",
		"q12_28_3",
		"q12_28_4",
		"q12_28_ageDiagnosed",
		"q12_29",
		"q12_29_1",
		"q12_29_2",
		"q12_29_3",
		"q12_29_4",
		"q12_29_ageDiagnosed",
		"spread_cancer",
		"spread_bone",
		"spread_brain",
		"spread_liver",
		"spread_lung",
		"spread_other",
		"spread_where",
		"familyHaveCancer",
		"q13_1_ageDiagnosed",
		"q13_1_cancerType",
		"q13_2_ageDiagnosed",
		"q13_2_cancerType",
		"q13_3_ageDiagnosed",
		"q13_3_cancerType",
		"q13_4_ageDiagnosed",
		"q13_4_cancerType",
		"q13_5_ageDiagnosed",
		"q13_5_cancerType",
		"q13_6_ageDiagnosed",
		"q13_6_cancerType",
		"q13_7_ageDiagnosed",
		"q13_7_cancerType",
		"q13_8_ageDiagnosed",
		"q13_8_cancerType",
		"q13_9_ageDiagnosed",
		"q13_9_cancerType",
		"q13_10_ageDiagnosed",
		"q13_10_cancerType",
		"q13_11_ageDiagnosed",
		"q13_11_cancerType",
		"q13_12_ageDiagnosed",
		"q13_12_cancerType",
		"q13_13_ageDiagnosed",
		"q13_13_cancerType",
		"q13_14_ageDiagnosed",
		"q13_14_cancerType",
		"q13_15_ageDiagnosed",
		"q13_15_cancerType",

		"q13_16",
		"q13_16_ageDiagnosed",
		"q13_16_cancerType",
		"q13_17",
		"q13_17_ageDiagnosed",
		"q13_17_cancerType",
		"q13_18",
		"q13_18_ageDiagnosed",
		"q13_18_cancerType",
		"q13_19",
		"q13_19_ageDiagnosed",
		"q13_19_cancerType",
		"q13_20",
		"q13_20_ageDiagnosed",
		"q13_20_cancerType",

		"q13_other_family_member",
		"q14_1",
		"q14_1_howManyPerWeek",
		"q14_2",
		"q14_2_howManyPerWeek",
		"q14_3",
		"q14_3_howManyPerWeek",
		"q15_1",
		"q15_1_howManyTimesPerWeek",
		"q15_1_howManyYears",
		"q15_2",
		"q15_2_howManyTimesPerWeek",
		"q15_2_howManyYears",
		"q15_3",
		"q15_3_howManyTimesPerWeek",
		"q15_3_howManyYears",
		"q15_4",
		"q15_4_howManyTimesPerWeek",
		"q15_4_howManyYears",
		"q16",
		"q17",
		"q18",
		"q19",
		"stillSmoke",
		"q21DateStopSmoking_short",
		"q21_whenStopSmoking_months",
		"q21_whenStopSmoking_years",
		"q22_1",
		"q22_2",
		"q22_3",
		"q22_4",
		"q22_5",
		"q22_6",
		"q22_7",
		"q22_8",
		"q22_others",
		"levelOfActivity",
		"q24_howDoYouFeelRightNow",
		"q25_howHaveYouFeltForPast4Weeks",
		"q26",
		"q26_explain",
		"q27",
		"q28",
		"q29_1",
		"q29_2",
		"q29_3",
		"q29_4",
		"q29_5",
		"q29_6",
		"q29_7",
		"q29_other",
		"q30_1",
		"q30_2",
		"q30_3",
		"q30_4",
		"q30_5",
		"q30_6",
		"q31_1",
		"q31_2",
		"q31_3",
		"q32",
		"findings_rectal_exam",
		"date_rectal_exam_short",
		"q33",
		"results_PSA_test",
		"date_most_recent_PSA_test_short",
		"q34",
		"q35",
		"q36_1",
		"q36_2",
		"q36_3",
		"q36_4",
		"q36_5",
		"q36_6",
		"q37",
		"q37_what",
		"q38",
		"q39",
		"q40",
		"resultsFecalOccultBloodTest",
		"q41",
		"date_digital_rectal_exam_short",
		"q42",
		"date_sigmoidoscopy_colonoscopy_short",
		"q42_1",
		"q42_2",
		"q42_3",
		"q42_4",
		"q42_5",
		"q42_6",
		"q42_7",
		"q42_8",
		"q43",
		"q43_biopsy_results",
		"q44",
		"q44_hemoglobin_levels",
		"q45_1",
		"q45_2",
		"q45_3",
		"q45_4",
		"q45_5",
		"q45_6",
		"q45_7",
		"q46_1",
		"q46_2",
		"q46_3",
		"q46_4",
		"q46_5",
		"q46_6",
		"q46_7",
		"q47",
		"q48_date_last_visit_gynecologist_short",
		"q49",
		"q49_findings_pelvic_exam",
		"q50",
		"q50_findings_digital_rectal_exam",
		"q51",
		"q51_1",
		"q51_1_date_short",
		"q51_1_result",
		"q51_2",
		"q51_2_date_short",
		"q51_2_result",
		"q51_3",
		"q51_3_date_short",
		"q51_3_result",
		"q51_4",
		"q51_4_date_short",
		"q51_4_result",
		"q51_5",
		"q51_5_date_short",
		"q51_5_result",
		"q51_6",
		"q51_6_date_short",
		"q51_6_result",
		"q52",
		"q52_date_most_recent_pap_smear_short",
		"q52_results_pap_smear",
		"q53",
		"q53_how_long_use_fertility_medication",
		"q53_medication_fertility",
		"q54",
		"q55",
		"q56",
		"q57",
		"q58",
		"q59",
		"q59_whatAge",
		"q59_why",
		"q60",
		"q61",
		"q61_whatAge",
		"q62",
		"q63",
		"q64",
		"q65",
		"q66InMenopause",
		"q67",
		"q68",
		"q69",
		"q69_forWhat",
		"q69_whatAgeStarted",
		"q69_which",
		"q70",
		"q71shortdate",
		"q72",
		"q73_alive",
		"q73_dead",
		"q73_miscarriage",
		"q74",
		"q75",
		"q76",
		"q77",
		"q78_1_month",
		"q78_1_week",
		"q78_2_month",
		"q78_2_week",
		"q78_3_month",
		"q78_3_week",
		"q78_4_month",
		"q78_4_week",
		"q78_5_month",
		"q78_5_week",
		"q78_6_month",
		"q78_6_week",
		"q78_7_month",
		"q78_7_week",
		"q78_8_month",
		"q78_8_week",
		"q78_9_month",
		"q78_9_week",
		"q78_10_month",
		"q78_10_week",
		"q79",
		"q80",
		"q80_howLong",
		"q80_whatAge",
		"q80_which",
		"q81",
		"q81_other",
		"q82",
		"q82_1",
		"q82_1_aliveDead",
		"q82_1_type",
		"q82_1_whatAge",
		"q82_2",
		"q82_2_aliveDead",
		"q82_2_type",
		"q82_2_whatAge",
		"q82_3",
		"q82_3_aliveDead",
		"q82_3_type",
		"q82_3_whatAge",
		"q82_4",
		"q82_4_aliveDead",
		"q82_4_type",
		"q82_4_whatAge",
		"q82_5",
		"q82_5_aliveDead",
		"q82_5_type",
		"q82_5_whatAge",
		"q82_6",
		"q82_6_aliveDead",
		"q82_6_type",
		"q82_6_whatAge",
		"q82_7",
		"q82_7_aliveDead",
		"q82_7_type",
		"q82_7_whatAge",
		"q82_8",
		"q82_8_aliveDead",
		"q82_8_type",
		"q82_8_whatAge",
		"q82_9",
		"q82_9_aliveDead",
		"q82_9_type",
		"q82_9_whatAge",
		"q82_10",
		"q82_10_aliveDead",
		"q82_10_type",
		"q82_10_whatAge",
		"q82_11",
		"q82_11_aliveDead",
		"q82_11_type",
		"q82_11_whatAge",
		"q82_12",
		"q82_12_aliveDead",
		"q82_12_type",
		"q82_12_whatAge",
		"q82_13",
		"q82_13_aliveDead",
		"q82_13_type",
		"q82_13_whatAge",
		"q82_14",
		"q82_14_aliveDead",
		"q82_14_type",
		"q82_14_whatAge",
		"q82_15",
		"q82_15_aliveDead",
		"q82_15_type",
		"q82_15_whatAge",
		"q82_others",
		"q83",
		"q84_1",
		"q84_1_rad_date_short",
		"q84_1_whatAge",
		"q84_2",
		"q84_2_rad_date_short",
		"q84_2_whatAge",
		"q84_3",
		"q84_3_rad_date_short",
		"q84_3_whatAge",
		"q84_4",
		"q84_4_rad_date_short",
		"q84_4_whatAge",
		"q84_5",
		"q84_5_rad_date_short",
		"q84_5_whatAge",
		"q84_6",
		"q84_6_rad_date_short",
		"q84_6_whatAge",
		"q84_7",
		"q84_7_rad_date_short",
		"q84_7_whatAge",
		"q84_8",
		"q84_8_rad_date_short",
		"q84_8_whatAge",
		"q84_9",
		"q84_9_rad_date_short",
		"q84_9_whatAge",
		"q84_10",
		"q84_10_rad_date_short",
		"q84_10_whatAge",
		"q84_another",
		"q85",
		"q85_sat_fat_1",
		"q85_sat_fat_2",
		"q85_sat_fat_3",
		"q85_sat_fat_4",
		"q85_sat_fat_5",
		"q85_sat_fat_6",
		"q85_sat_fat_7",
		"q85_sat_fat_8",
		"q85_sat_fat_9",
		"q85_sat_fat_10",
		"q85_sat_fat_11",
		"q85_sat_fat_12",
		"q85_sat_fat_13",
		"q85_sat_fat_14",        
		"q85_sat_fat_other",
		"q85_vege_1",
		"q85_vege_2",
		"q85_vege_3",
		"q85_vege_4",
		"q85_vege_5",
		"q85_vege_6",
		"q85_vege_7",
		"q85_vege_8",
		"q85_vege_9",
		"q85_vege_10",
		"q85_vege_11",
		"q85_vege_12",
		"q85_vege_13",
		"q85_vege_14",
		"q85_vege_other",
		"q85_which",
		"q86",
		"q87",
		"q88",
		"q89_1",
		"q89_2",
		"q89_3",
		"q89_4",
		"q89_5",
		"q89_6",
		"q89_7",
		"q89_other",
		"q90_1",
		"q90_1_age",
		"q90_1_year_only",
		"q90_2",
		"q90_2_age",
		"q90_2_year_only",
		"q90_3",
		"q90_3_age",
		"q90_3_year_only",
		"q90_4",
		"q90_4_age",
		"q90_4_year_only",
		"q90_5",
		"q90_5_age",
		"q90_5_year_only",
		"q90_6",
		"q90_6_age",
		"q90_6_year_only",
		"q90_7",
		"q90_7_medcon",
		"q90_7_age",
		"q90_7_year_only",
		"q90_8",
		"q90_8_medcon",
		"q90_8_age",
		"q90_8_year_only",
		"q90_9",
		"q90_9_medcon",
		"q90_9_age",
		"q90_9_year_only",
		"q90_10",
		"q90_10_medcon",
		"q90_10_age",
		"q90_10_year_only",
		"q90_11",
		"q90_11_medcon",
		"q90_11_age",
		"q90_11_year_only",

		"q91_1",
		"q91_1_howManyYears",
		"q91_2",
		"q91_2_howManyYears",
		"q91_3",
		"q91_3_howManyYears",
		"q92_1",
		"q92_1_howManyYears",
		"q92_2",
		"q92_2_howManyYears",
		"q92_3",
		"q92_3_howManyYears",
		"q92_4",
		"q92_4_howManyYears",
		"q92_5",
		"q92_5_howManyYears",
		"q92_6",
		"q92_6_howManyYears",
		"q92_7",
		"q92_7_howManyYears",
		"q92_8",
		"q92_8_howManyYears",
		"q92_9",
		"q92_9_howManyYears",
		"q93",
		"q93_1",
		"q93_1_howManyMonths",
		"q93_2",
		"q93_2_howManyMonths",
		"q93_3",
		"q93_3_howManyMonths",
		"q93_4",
		"q93_4_howManyMonths",
		"q93_5",
		"q93_5_howManyMonths",
		"q94_1",
		"q94_1_NumPillsPerWeek",
		"q94_1_ageStart",
		"q94_1_ageStop",
		"q94_2",
		"q94_2_NumPillsPerWeek",
		"q94_2_ageStart",
		"q94_2_ageStop",
		"q94_3",
		"q94_3_NumPillsPerWeek",
		"q94_3_ageStart",
		"q94_3_ageStop",
		"q94_4",
		"q94_4_NumPillsPerWeek",
		"q94_4_ageStart",
		"q94_4_ageStop",
		"q94_otherMedName1",
		"q94_5",
		"q94_5_NumPillsPerWeek",
		"q94_5_ageStart",
		"q94_5_ageStop",
		"q94_otherMedName2",
		"q94_6",
		"q94_6_NumPillsPerWeek",
		"q94_6_ageStart",
		"q94_6_ageStop",
		"q94_otherMedName3",
		"q94_7",
		"q94_7_NumPillsPerWeek",
		"q94_7_ageStart",
		"q94_7_ageStop",
		"q94_otherMedName4",
		"q94_8",
		"q94_8_NumPillsPerWeek",
		"q94_8_ageStart",
		"q94_8_ageStop",
		"q94_otherMedName5",
		"q94_9",
		"q94_9_NumPillsPerWeek",
		"q94_9_ageStart",
		"q94_9_ageStop",

		"q95_doctor_name",
		"q95_addr_street1",
		"q95_addr_street2",
		"q95_addr_city",
		"q95_addr_state",
		"q95_addr_zipcode",
		"q95_country",
		"q95_doctor_telephone",
		"q95_doctor_other_info",
		"other_memo",
		]

	
	Map global_labels =[
"id":"id",
"surveyer":"consenter",
"mode":"mode",
"completed":"Completed",
"completedBy":"CompletedBy",
"dateCompleted":"dateCompleted",
"consentNumSurv":"surveyName",
"consentNumLoc":"site",
"consentNum":"InformedConsentNumber",
//"mrn":"mrn",
"step":"step",
"dateCreated":"Created",
"lastUpdated":"Updated",

"being_treated_for_cancer":"Q000_Are_you_currently_being_treated_for_cancer",

"shortDOB":"Q001_Date_of_Birth",	
"sex":"Q001_sex",

"race":"Q002_race",
"other_race":"Q002_other_race",
"hispanic_or_latino":"Q003_Do_you_consider_yourself_Hispanic_or_Latino",


			 
"addr_street1":"Q004_Street1",
"addr_street2":"Q004_Street2",
"addr_city":"Q004_City",
"addr_state":"Q004_State",
"addr_zipcode":"Q004_Zip",
"country":"Q005_Country",
"marital_status":"Q006_marital_status",
"education":"Q007_education",

"current_occupation":"Q008_current_occupation",
"current_occupation_time":"Q008_current_occupation_years",
"prior_job":"Q009_prior_job",
"prior_job_time":"Q009_prior_job_time",

"q8_1":"Q010_chemical",
"q8_1_which":"Q010_which_chemical",
"q8_2":"Q010_silica",
"q8_3":"Q010_asbestos",
"q8_4":"Q010_industrial_wastes",
"q8_4_which":"Q010_which_wastes",
"q8_5":"Q010_construction",
"q8_others":"Q010_other_occupational_exposure",


"weight":"Q011_weight_pounds",
"height_feet":"Q012_height_feet",
"height_inches":"Q012_height_inches",


"q11a_1":"Q013_hepA",
"q11a_1Year_only":"Q013_hepA_year",
"q11a_2":"Q013_hepB",
"q11a_2Year_only":"Q013_hepB_year",
"q11a_3":"Q013_hepC",
"q11a_3Year_only":"Q013_hepC_year",
"q11a_4":"Q013_hpv",
"q11a_4Year_only":"Q013_hpv_year",
"q11a_5":"Q013_hiv",
"q11a_5Year_only":"Q013_hiv_year",
"q11a_6":"Q013_helico",
"q11a_6Year_only":"Q013_helico_year",
"q11a_hep_donotknow_type":"Q013_hep_do_not_know_type",
"q11a_hep_donotknow_type_Year_only":"Q013_hep_do_not_know_type_year",

"haveCancer":"Q014_have_you_ever_told_by_doctor_you_have_cancer",
"q12_1_1":"Q015_AnalCancer_radio",
"q12_1_2":"Q015_AnalCancer_chemo",
"q12_1_3":"Q015_AnalCancer_surgery",
"q12_1_4":"Q015_AnalCancer_none",
"q12_1_ageDiagnosed":"Q015_AnalCancer_ageDiagnosed",
"q12_2_1":"Q015_BladderCancer_radio",
"q12_2_2":"Q015_BladderCancer_chemo",
"q12_2_3":"Q015_BladderCancer_surgery",
"q12_2_4":"Q015_BladderCancer_none",
"q12_2_ageDiagnosed":"Q015_BladderCancer_ageDiagnosed",
"q12_3_1":"Q015_BrainCancer_radio",
"q12_3_2":"Q015_BrainCancer_chemo",
"q12_3_3":"Q015_BrainCancer_surgery",
"q12_3_4":"Q015_BrainCancer_none",
"q12_3_ageDiagnosed":"Q015_BrainCancer_ageDiagnosed",
"q12_4_1":"Q015_BreastCancer_radio",
"q12_4_2":"Q015_BreastCancer_chemo",
"q12_4_3":"Q015_BreastCancer_surgery",
"q12_4_4":"Q015_BreastCancer_none",
"q12_4_ageDiagnosed":"Q015_BreastCancer_ageDiagnosed",
"q12_5_1":"Q015_CarcinoidTumor_radio",
"q12_5_2":"Q015_CarcinoidTumor_chemo",
"q12_5_3":"Q015_CarcinoidTumor_surgery",
"q12_5_4":"Q015_CarcinoidTumor_none",
"q12_5_ageDiagnosed":"Q015_CarcinoidTumor_ageDiagnosed",
"q12_6_1":"Q015_CervicalCancer_radio",
"q12_6_2":"Q015_CervicalCancer_chemo",
"q12_6_3":"Q015_CervicalCancer_surgery",
"q12_6_4":"Q015_CervicalCancer_none",
"q12_6_ageDiagnosed":"Q015_CervicalCancer_ageDiagnosed",
"q12_7_1":"Q015_ColonCancer_radio",
"q12_7_2":"Q015_ColonCancer_chemo",
"q12_7_3":"Q015_ColonCancer_surgery",
"q12_7_4":"Q015_ColonCancer_none",
"q12_7_ageDiagnosed":"Q015_ColonCancer_ageDiagnosed",
"q12_8_1":"Q015_UterineCancer_radio",
"q12_8_2":"Q015_UterineCancer_chemo",
"q12_8_3":"Q015_UterineCancer_surgery",
"q12_8_4":"Q015_UterineCancer_none",
"q12_8_ageDiagnosed":"Q015_UterineCancer_ageDiagnosed",
"q12_9_1":"Q015_EsophagealCancer_radio",
"q12_9_2":"Q015_EsophagealCancer_chemo",
"q12_9_3":"Q015_EsophagealCancer_surgery",
"q12_9_4":"Q015_EsophagealCancer_none",
"q12_9_ageDiagnosed":"Q015_EsophagealCancer_ageDiagnosed",
"q12_10_1":"Q015_GallBladderCancer_radio",
"q12_10_2":"Q015_GallBladderCancer_chemo",
"q12_10_3":"Q015_GallBladderCancer_surgery",
"q12_10_4":"Q015_GallBladderCancer_none",
"q12_10_ageDiagnosed":"Q015_GallBladderCancer_ageDiagnosed",
"q12_11_1":"Q015_GIST_radio",
"q12_11_2":"Q015_GIST_chemo",
"q12_11_3":"Q015_GIST_surgery",
"q12_11_4":"Q015_GIST_none",
"q12_11_ageDiagnosed":"Q015_GIST_ageDiagnosed",
"q12_12_1":"Q015_HodgkinsLymphoma_radio",
"q12_12_2":"Q015_HodgkinsLymphoma_chemo",
"q12_12_3":"Q015_HodgkinsLymphoma_surgery",
"q12_12_4":"Q015_HodgkinsLymphoma_none",
"q12_12_ageDiagnosed":"Q015_HodgkinsLymphoma_ageDiagnosed",
"q12_13_1":"Q015_KidneyCancer_radio",
"q12_13_2":"Q015_KidneyCancer_chemo",
"q12_13_3":"Q015_KidneyCancer_surgery",
"q12_13_4":"Q015_KidneyCancer_none",
"q12_13_ageDiagnosed":"Q015_KidneyCancer_ageDiagnosed",
"q12_14_1":"Q015_Leukemia_radio",
"q12_14_2":"Q015_Leukemia_chemo",
"q12_14_3":"Q015_Leukemia_surgery",
"q12_14_4":"Q015_Leukemia_none",
"q12_14_ageDiagnosed":"Q015_Leukemia_ageDiagnosed",
"q12_15_1":"Q015_LiverCancer_radio",
"q12_15_2":"Q015_LiverCancer_chemo",
"q12_15_3":"Q015_LiverCancer_surgery",
"q12_15_4":"Q015_LiverCancer_none",
"q12_15_ageDiagnosed":"Q015_LiverCancer_ageDiagnosed",
"q12_16_1":"Q015_LungCancer_radio",
"q12_16_2":"Q015_LungCancer_chemo",
"q12_16_3":"Q015_LungCancer_surgery",
"q12_16_4":"Q015_LungCancer_none",
"q12_16_ageDiagnosed":"Q015_LungCancer_ageDiagnosed",
"q12_17_1":"Q015_Melanoma_radio",
"q12_17_2":"Q015_Melanoma_chemo",
"q12_17_3":"Q015_Melanoma_surgery",
"q12_17_4":"Q015_Melanoma_none",
"q12_17_ageDiagnosed":"Q015_Melanoma_ageDiagnosed",
"q12_18_1":"Q015_MultipleMyeloma_radio",
"q12_18_2":"Q015_MultipleMyeloma_chemo",
"q12_18_3":"Q015_MultipleMyeloma_surgery",
"q12_18_4":"Q015_MultipleMyeloma_none",
"q12_18_ageDiagnosed":"Q015_MultipleMyeloma_ageDiagnosed",
"q12_19_1":"Q015_NoHodgkinsLymphoma_radio",
"q12_19_2":"Q015_NoHodgkinsLymphoma_chemo",
"q12_19_3":"Q015_NoHodgkinsLymphoma_surgery",
"q12_19_4":"Q015_NoHodgkinsLymphoma_none",
"q12_19_ageDiagnosed":"Q015_NoHodgkinsLymphoma_ageDiagnosed",
"q12_20_1":"Q015_ThroatCancer_radio",
"q12_20_2":"Q015_ThroatCancer_chemo",
"q12_20_3":"Q015_ThroatCancer_surgery",
"q12_20_4":"Q015_ThroatCancer_none",
"q12_20_ageDiagnosed":"Q015_ThroatCancer_ageDiagnosed",
"q12_21_1":"Q015_OvarianCancer_radio",
"q12_21_2":"Q015_OvarianCancer_chemo",
"q12_21_3":"Q015_OvarianCancer_surgery",
"q12_21_4":"Q015_OvarianCancer_none",
"q12_21_ageDiagnosed":"Q015_OvarianCancer_ageDiagnosed",
"q12_22_1":"Q015_PancreaticCancer_radio",
"q12_22_2":"Q015_PancreaticCancer_chemo",
"q12_22_3":"Q015_PancreaticCancer_surgery",
"q12_22_4":"Q015_PancreaticCancer_none",
"q12_22_ageDiagnosed":"Q015_PancreaticCancer_ageDiagnosed",
"q12_23_1":"Q015_ProstateCancer_radio",
"q12_23_2":"Q015_ProstateCancer_chemo",
"q12_23_3":"Q015_ProstateCancer_surgery",
"q12_23_4":"Q015_ProstateCancer_none",
"q12_23_ageDiagnosed":"Q015_ProstateCancer_ageDiagnosed",
"q12_24_1":"Q015_OtherCancer_radio",
"q12_24_2":"Q015_OtherCancer_chemo",
"q12_24_3":"Q015_OtherCancer_surgery",
"q12_24_4":"Q015_OtherCancer_none",
"q12_24_ageDiagnosed":"Q015_OtherCancer_ageDiagnosed",
"q12_which_cancer":"Q015_OtherCancerTypeNotListed",
"q12_25":"Q015_MoreCancerType1",
"q12_25_1":"Q015_MoreCancerType1_radio",
"q12_25_2":"Q015_MoreCancerType1_chemo",
"q12_25_3":"Q015_MoreCancerType1_surgery",
"q12_25_4":"Q015_MoreCancerType1_none",
"q12_25_ageDiagnosed":"Q015_MoreCancerType1_ageDiagnosed",
"q12_26":"Q015_MoreCancerType2",
"q12_26_1":"Q015_MoreCancerType2_radio",
"q12_26_2":"Q015_MoreCancerType2_chemo",
"q12_26_3":"Q015_MoreCancerType2_surgery",
"q12_26_4":"Q015_MoreCancerType2_none",
"q12_26_ageDiagnosed":"Q015_MoreCancerType2_ageDiagnosed",
"q12_27":"Q015_MoreCancerType3",
"q12_27_1":"Q015_MoreCancerType3_radio",
"q12_27_2":"Q015_MoreCancerType3_chemo",
"q12_27_3":"Q015_MoreCancerType3_surgery",
"q12_27_4":"Q015_MoreCancerType3_none",
"q12_27_ageDiagnosed":"Q015_MoreCancerType3_ageDiagnosed",
"q12_28":"Q015_MoreCancerType4",
"q12_28_1":"Q015_MoreCancerType4_radio",
"q12_28_2":"Q015_MoreCancerType4_chemo",
"q12_28_3":"Q015_MoreCancerType4_surgery",
"q12_28_4":"Q015_MoreCancerType4_none",
"q12_28_ageDiagnosed":"Q015_MoreCancerType4_ageDiagnosed",
"q12_29":"Q015_MoreCancerType5",
"q12_29_1":"Q015_MoreCancerType5_radio",
"q12_29_2":"Q015_MoreCancerType5_chemo",
"q12_29_3":"Q015_MoreCancerType5_surgery",
"q12_29_4":"Q015_MoreCancerType5_none",
"q12_29_ageDiagnosed":"Q015_MoreCancerType5_ageDiagnosed",
"spread_cancer":"Q016_have_been_told_your_cancer_spread",
"spread_bone":"Q017_spread_bone",
"spread_brain":"Q017_spread_brain",
"spread_liver":"Q017_spread_liver",
"spread_lung":"Q017_spread_lung",
"spread_other":"Q017_spread_other",
"spread_where":"Q017_spread_where",

"familyHaveCancer":"Q018_familyHaveCancer",

"q13_1_ageDiagnosed":"Q018_mother_ageDiagnosed",
"q13_1_cancerType":"Q018_mother_cancerType",
"q13_2_ageDiagnosed":"Q018_father_ageDiagnosed",
"q13_2_cancerType":"Q018_father_cancerType",
"q13_3_ageDiagnosed":"Q018_sister_ageDiagnosed",
"q13_3_cancerType":"Q018_sister_cancerType",
"q13_4_ageDiagnosed":"Q018_brother_ageDiagnosed",
"q13_4_cancerType":"Q018_brother_cancerType",
"q13_5_ageDiagnosed":"Q018_daughter_ageDiagnosed",
"q13_5_cancerType":"Q018_daughter_cancerType",
"q13_6_ageDiagnosed":"Q018_son_ageDiagnosed",
"q13_6_cancerType":"Q018_son_cancerType",
"q13_7_ageDiagnosed":"Q018_m_grandmother_ageDiagnosed",
"q13_7_cancerType":"Q018_m_grandmother_cancerType",
"q13_8_ageDiagnosed":"Q018_m_grandfather_ageDiagnosed",
"q13_8_cancerType":"Q018_m_grandfather_cancerType",
"q13_9_ageDiagnosed":"Q018_m_aunt_ageDiagnosed",
"q13_9_cancerType":"Q018_m_aunt_cancerType",
"q13_10_ageDiagnosed":"Q018_m_uncle_ageDiagnosed",
"q13_10_cancerType":"Q018_m_uncle_cancerType",
"q13_11_ageDiagnosed":"Q018_p_grandmother_ageDiagnosed",
"q13_11_cancerType":"Q018_p_grandmother_cancerType",
"q13_12_ageDiagnosed":"Q018_p_grandfather_ageDiagnosed",
"q13_12_cancerType":"Q018_p_grandfather_cancerType",
"q13_13_ageDiagnosed":"Q018_p_aunt_ageDiagnosed",
"q13_13_cancerType":"Q018_p_aunt_cancerType",
"q13_14_ageDiagnosed":"Q018_p_uncle_ageDiagnosed",
"q13_14_cancerType":"Q018_p_uncle_cancerType",
"q13_15_ageDiagnosed":"Q018_other_ageDiagnosed",
"q13_15_cancerType":"Q018_other_cancerType",
"q13_16":"Q018_more1",
"q13_16_ageDiagnosed":"Q018_more1_ageDiagnosed",
"q13_16_cancerType":"Q018_more1_cancerType",
"q13_17":"Q018_more2",
"q13_17_ageDiagnosed":"Q018_more2_ageDiagnosed",
"q13_17_cancerType":"Q018_more2_cancerType",
"q13_18":"Q018_more3",
"q13_18_ageDiagnosed":"Q018_more3_ageDiagnosed",
"q13_18_cancerType":"Q018_more3_cancerType",
"q13_19":"Q018_more4",
"q13_19_ageDiagnosed":"Q018_more4_ageDiagnosed",
"q13_19_cancerType":"Q018_more4_cancerType",
"q13_20":"Q018_more5",
"q13_20_ageDiagnosed":"Q018_more5_ageDiagnosed",
"q13_20_cancerType":"Q018_more5_cancerType",

"q13_other_family_member":"Q018_other_family_member",
"q14_1":"Q019_beer",
"q14_1_howManyPerWeek":"Q019_beer_drinks_a_week",
"q14_2":"Q019_wine",
"q14_2_howManyPerWeek":"Q019_wine_drinks_a_week",
"q14_3":"Q019_hard_liquor",
"q14_3_howManyPerWeek":"Q019_hard_liquor_drinks_a_week",
"q15_1":"Q020_01_chewing_tobacco",
"q15_1_howManyTimesPerWeek":"Q020_01_howManyTimesPerWeek",
"q15_1_howManyYears":"Q020_01_howManyYears",
"q15_2":"Q020_02_snuff_dip",
"q15_2_howManyTimesPerWeek":"Q020_02_howManyTimesPerWeek",
"q15_2_howManyYears":"Q020_02_howManyYears",
"q15_3":"Q020_03_pipe",
"q15_3_howManyTimesPerWeek":"Q020_03_howManyTimesPerWeek",
"q15_3_howManyYears":"Q020_03_howManyYears",
"q15_4":"Q020_04_cigar",
"q15_4_howManyTimesPerWeek":"Q020_04_howManyTimesPerWeek",
"q15_4_howManyYears":"Q020_04_howManyYears",
"q16":"Q021_smoke_100_cigarettes",
"q17":"Q022_at_what_age_begin_smoking",
"q18":"Q023_total_years_of_smoking",
"q19":"Q024_average_cigarettes_smoke_a_day",

"stillSmoke":"Q025_still_smoke",

"q21DateStopSmoking_short":"Q026_date_stop_smoking",
"q21_whenStopSmoking_months":"Q026_how_long_ago_stop_smoking_months",
"q21_whenStopSmoking_years":"Q026_how_long_ago_stop_smoking_years",
"q22_1":"Q027_running_freq",
"q22_2":"Q027_walking_freq",
"q22_3":"Q027_swimming_freq",
"q22_4":"Q027_aerobics_freq",
"q22_5":"Q027_weightlifting_freq",
"q22_6":"Q027_bicycling_freq",
"q22_7":"Q027_gymnastics_freq",
"q22_8":"Q027_other_freq",
"q22_others":"Q027_other_activity",
"levelOfActivity":"Q028_level_of_activity",
"q24_howDoYouFeelRightNow":"Q029_howDoYouFeelRightNow",
"q25_howHaveYouFeltForPast4Weeks":"Q030_howHaveYouFeltForPast4Weeks",
"q26":"Q031_have_any_health_problem",
"q26_explain":"Q031_explain",
"q27":"Q032_does_health_affect_social_activity",
"q28":"Q033_how_is_your_health",
"q29_1":"Q034_depression",
"q29_2":"Q034_dementia",
"q29_3":"Q034_schizophrenia",
"q29_4":"Q034_attention_deficit",
"q29_5":"Q034_manic_depressive",
"q29_6":"Q034_obsessive_compulsive",
"q29_7":"Q034_other",
"q29_other":"Q034_other_psychological_problem",
"q30_1":"Q035_painful_urination",
"q30_2":"Q035_difficulty_starting_urine_stream",
"q30_3":"Q035_blood_in_urine",
"q30_4":"Q035_sensation_of_not_emptying_bladder_after_finish_urinating",
"q30_5":"Q035_urinating_more_than_once_every_two_hours",
"q30_6":"Q035_getting_up_more_than_once_a_night_to_urinate",
"q31_1":"Q036_prostatitis",
"q31_2":"Q036_enlarged_prostate",
"q31_3":"Q036_needed_prostate_biopsy",
"q32":"Q037_had_rectal_exam",
"findings_rectal_exam":"Q037_rectal_exam_findings",
"date_rectal_exam_short":"Q037_date_rectal_exam",
"q33":"Q038_had_PSA_test",
"date_most_recent_PSA_test_short":"Q038_date_most_recent_PSA_test",
"results_PSA_test":"Q038_PSA_test_results",
"q34":"Q039_have_erectile_dysfunction",
"q35":"Q040_have_digestive_tract_problem",
"q36_1":"Q041_change_in_bowel_habit",
"q36_2":"Q041_change_in_stool_color",
"q36_3":"Q041_constipation",
"q36_4":"Q041_fine_stool",
"q36_5":"Q041_blood_in_stool",
"q36_6":"Q041_black_stool",
"q37":"Q042_have_rectal_bleeding",
"q37_what":"Q042_rectal_bleeding_type",
"q38":"Q043_pain_rectal_bleeding",
"q39":"Q044_whether_recommended_fecal_occult_blood_test",
"q40":"Q045_had_fecal_occult_blood_test",
"resultsFecalOccultBloodTest":"Q045_result_fecal_occult_blood_test",
"q41":"Q046_have_digital_rectal_exam",
"date_digital_rectal_exam_short":"Q046_date_digital_rectal_exam",
"q42":"Q047_have_sigmoidoscopy_or_colonoscopy",
"date_sigmoidoscopy_colonoscopy_short":"Q047_date_sigmoidoscopy_colonoscopy",

"q42_1":"Q047_normal",
"q42_2":"Q047_ulcers",
"q42_3":"Q047_tumor",
"q42_4":"Q047_diverticulitis",
"q42_5":"Q047_colitis",
"q42_6":"Q047_fistula",
"q42_7":"Q047_hemorrhoids",
"q42_8":"Q047_polyps",



"q43":"Q048_biopsy_performed_during_sigmoidoscoopy_or_colonoscopy",
"q43_biopsy_results":"Q048_biopsy_results",
"q44":"Q049_have_anemia",
"q44_hemoglobin_levels":"Q049_hemoglobin_levels",
"q45_1":"Q050_irregular_menstrual_cycles",
"q45_2":"Q050_significant_weight_change",
"q45_3":"Q050_abdominal_inflammation",
"q45_4":"Q050_pelvic_discomfort",
"q45_5":"Q050_vaginal_bleeding",
"q45_6":"Q050_back_pain",
"q45_7":"Q050_increased_abdominal_size",
"q46_1":"Q051_increased_gas_production",
"q46_2":"Q051_lack_of_appetite",
"q46_3":"Q051_indigestion",
"q46_4":"Q051_nausea_vomiting",
"q46_5":"Q051_abdominal_distention",
"q46_6":"Q051_increased_urinating_freq",
"q46_7":"Q051_other",
"q47":"Q052_how_often_visit_gynecologist",
"q48_date_last_visit_gynecologist_short":"Q053_last_visit_to_gynecologist",
"q49":"Q054_have_pelvic_exam",
"q49_findings_pelvic_exam":"Q054_findings_pelvic_exam",
"q50":"Q055_have_digital_rectal_exam",
"q50_findings_digital_rectal_exam":"Q055_findings_digital_rectal_exam",
"q51":"Q056_whether_doctor_order_any_diagnostic_test",
"q51_1":"Q056_CA125",
"q51_1_date_short":"Q056_CA125_date",
"q51_1_result":"Q056_CA125_result",
"q51_2":"Q056_alpha_fetoprotein",
"q51_2_date_short":"Q056_alpha_fetoprotein_date",
"q51_2_result":"Q056_alpha_fetoprotein_result",
"q51_3":"Q056_quantitativeHCG",
"q51_3_date_short":"Q056_quantitativeHCG_date",
"q51_3_result":"Q056_quantitativeHCG_result",
"q51_4":"Q056_sonogram",
"q51_4_date_short":"Q056_sonogram_date",
"q51_4_result":"Q056_sonogram_result",
"q51_5":"Q056_barium_enema",
"q51_5_date_short":"Q056_barium_enema_date",
"q51_5_result":"Q056_barium_enema_result",
"q51_6":"Q056_intravenous_pyelogram",
"q51_6_date_short":"Q056_intravenous_pyelogram_date",
"q51_6_result":"Q056_intravenous_pyelogram_result",
"q52":"Q057_have_pap_smear",
"q52_date_most_recent_pap_smear_short":"Q057_date_most_recent_pap_smear",
"q52_results_pap_smear":"Q057_results_pap_smear",
"q53":"Q058_have_fertility_medication",
"q53_how_long_use_fertility_medication":"Q058_how_long_use_fertility_medication",
"q53_medication_fertility":"Q058_which_fertility_medication",
"q54":"Q059_atWhatAge_first_menstruation",
"q55":"Q060_howOften_menstrual_cycle_days",
"q56":"Q061_howManyDays_bleeding_last",
"q57":"Q062_bled_between_menstrual_periods",
"q58":"Q063_have_pain_during_menstrual_periods",
"q59":"Q064_have_uterus_been_removed",
"q59_whatAge":"Q064_whatAge",
"q59_why":"Q064_why",
"q60":"Q065_have_endometriosis",
"q61":"Q066_endometriosis_diagnosed_by_surgery",
"q61_whatAge":"Q066__whatAge",
"q62":"Q067_ovaries_removed",
"q63":"Q068_both_ovaries_removed",
"q64":"Q069_why_ovaries_removed",
"q65":"Q070_whatAge_ovaries_removed",
"q66InMenopause":"Q071_in_menopause",
"q67":"Q072_going_through_menopause",
"q68":"Q073_whatAge_menopause_start",
"q69":"Q074_take_prescribed_hormones",
"q69_forWhat":"Q074_forWhat",
"q69_whatAgeStarted":"Q074_whatAgeStarted",
"q69_which":"Q074_which",
"q70":"Q075_have_mammogram_every_year",
"q71shortdate":"Q076_last_mammogram",
"q72":"Q077_have_ever_been_pregnant",
"q73_alive":"Q078_alive",
"q73_dead":"Q078_dead",
"q73_miscarriage":"Q078_miscarriage",
"q74":"Q079_whatAge_first_pregnancy",
"q75":"Q080_whatAge_first_child",
"q76":"Q081_how_many_children",
"q77":"Q082_breastfeed",
"q78_1_month":"Q083_01_month",
"q78_1_week":"Q083_01_week",
"q78_2_month":"Q083_02_month",
"q78_2_week":"Q083_02_week",
"q78_3_month":"Q083_03_month",
"q78_3_week":"Q083_03_week",
"q78_4_month":"Q083_04_month",
"q78_4_week":"Q083_04_week",
"q78_5_month":"Q083_05_month",
"q78_5_week":"Q083_05_week",
"q78_6_month":"Q083_06_month",
"q78_6_week":"Q083_06_week",
"q78_7_month":"Q083_07_month",
"q78_7_week":"Q083_07_week",
"q78_8_month":"Q083_08_month",
"q78_8_week":"Q083_08_week",
"q78_9_month":"Q083_09_month",
"q78_9_week":"Q083_09_week",
"q78_10_month":"Q083_10_month",
"q78_10_week":"Q083_10_week",

"q79":"Q084_take_estrogen",
"q80":"Q085_used_contraceptive_method",
"q80_howLong":"Q085_howLong_years",
"q80_whatAge":"Q085_whatAge",
"q80_which":"Q085_which",
"q81":"Q086_which_contraceptive_currently_using",
"q81_other":"Q086_other_contraceptive_method",
"q82":"Q087_diagnosed_any_family_member_breast_cancer",
"q82_1":"Q087_01_mother",
"q82_1_aliveDead":"Q087_01_aliveDead",
"q82_1_type":"Q087_01_type",
"q82_1_whatAge":"Q087_01_whatAge",
"q82_2":"Q087_02_father",
"q82_2_aliveDead":"Q087_02_aliveDead",
"q82_2_type":"Q087_02_type",
"q82_2_whatAge":"Q087_02_whatAge",
"q82_3":"Q087_03_sister",
"q82_3_aliveDead":"Q087_03_aliveDead",
"q82_3_type":"Q087_03_type",
"q82_3_whatAge":"Q087_03_whatAge",
"q82_4":"Q087_04_brother",
"q82_4_aliveDead":"Q087_04_aliveDead",
"q82_4_type":"Q087_04_type",
"q82_4_whatAge":"Q087_04_whatAge",
"q82_5":"Q087_05_daughter",
"q82_5_aliveDead":"Q087_05_aliveDead",
"q82_5_type":"Q087_5_type",
"q82_5_whatAge":"Q087_05_whatAge",
"q82_6":"Q087_06_son",
"q82_6_aliveDead":"Q087_06_aliveDead",
"q82_6_type":"Q087_06_type",
"q82_6_whatAge":"Q087_06_whatAge",
"q82_7":"Q087_07_m_grandmother",
"q82_7_aliveDead":"Q087_07_aliveDead",
"q82_7_type":"Q087_07_type",
"q82_7_whatAge":"Q087_07_whatAge",
"q82_8":"Q087_08_m_grandfather",
"q82_8_aliveDead":"Q087_08_aliveDead",
"q82_8_type":"Q087_08_type",
"q82_8_whatAge":"Q087_08_whatAge",
"q82_9":"Q087_09_m_aunt",
"q82_9_aliveDead":"Q087_09_aliveDead",
"q82_9_type":"Q087_09_type",
"q82_9_whatAge":"Q087_09_whatAge",
"q82_10":"Q087_10_m_uncle",
"q82_10_aliveDead":"Q087_10_aliveDead",
"q82_10_type":"Q087_10_type",
"q82_10_whatAge":"Q087_10_whatAge",
"q82_11":"Q087_11_p_grandmother",
"q82_11_aliveDead":"Q087_11_aliveDead",
"q82_11_type":"Q087_11_type",
"q82_11_whatAge":"Q087_11_whatAge",
"q82_12":"Q087_12_p_grandfather",
"q82_12_aliveDead":"Q087_12_aliveDead",
"q82_12_type":"Q087_12_type",
"q82_12_whatAge":"Q087_12_whatAge",
"q82_13":"Q087_13_p_aunt",
"q82_13_aliveDead":"Q087_13_aliveDead",
"q82_13_type":"Q087_13_type",
"q82_13_whatAge":"Q087_13_whatAge",
"q82_14":"Q087_14_p_uncle",
"q82_14_aliveDead":"Q087_14_aliveDead",
"q82_14_type":"Q087_14_type",
"q82_14_whatAge":"Q087_14_whatAge",
"q82_15":"Q087_15_other",
"q82_15_aliveDead":"Q087_15_aliveDead",
"q82_15_type":"Q087_15_type",
"q82_15_whatAge":"Q087_15_whatAge",

"q82_others":"Q087_others",
"q83":"Q088_exposed_to_radiation_treatment",
"q84_1":"Q089_01_tb",
"q84_1_rad_date_short":"Q089_01_rad_date",
"q84_1_whatAge":"Q089_01_whatAge",
"q84_2":"Q089_02_vertebral_column",
"q84_2_rad_date_short":"Q089_02_rad_date",
"q84_2_whatAge":"Q089_02_whatAge",
"q84_3":"Q089_03_chest",
"q84_3_rad_date_short":"Q089_03_rad_date",
"q84_3_whatAge":"Q089_03_whatAge",
"q84_4":"Q089_04_abdomen",
"q84_4_rad_date_short":"Q089_04_rad_date",
"q84_4_whatAge":"Q089_04_whatAge",
"q84_5":"Q089_05_acne",
"q84_5_rad_date_short":"Q089_05_rad_date",
"q84_5_whatAge":"Q089_05_whatAge",
"q84_6":"Q089_06_thymus",
"q84_6_rad_date_short":"Q089_06_rad_date",
"q84_6_whatAge":"Q089_06_whatAge",
"q84_7":"Q089_07_non_hodgkin",
"q84_7_rad_date_short":"Q089_07_rad_date",
"q84_7_whatAge":"Q089_07_whatAge",
"q84_8":"Q089_08_neck",
"q84_8_rad_date_short":"Q089_08_rad_date",
"q84_8_whatAge":"Q089_08_whatAge",
"q84_9":"Q089_09_fluoroscopic",
"q84_9_rad_date_short":"Q089_09_rad_date",
"q84_9_whatAge":"Q089_09_whatAge",
"q84_10":"Q089_10_another",
"q84_10_rad_date_short":"Q089_10_rad_date",
"q84_10_whatAge":"Q089_10_whatAge",

"q84_another":"Q089_10_another_place",
"q85":"Q090_on_diet",
"q85_which":"Q090_which_diet",
"q85_sat_fat_1":"Q090_sat_fat_poultry",
"q85_sat_fat_2":"Q090_sat_fat_fast_foods",
"q85_sat_fat_3":"Q090_sat_fat_pork",
"q85_sat_fat_4":"Q090_sat_fat_butter",
"q85_sat_fat_5":"Q090_sat_fat_fried_foods",
"q85_sat_fat_6":"Q090_sat_fat_ice_cream",
"q85_sat_fat_7":"Q090_sat_fat_cheese",
"q85_sat_fat_8":"Q090_sat_fat_lard",
"q85_sat_fat_9":"Q090_sat_fat_vegetable_oils",
"q85_sat_fat_10":"Q090_sat_fat_dairy_products",
"q85_sat_fat_11":"Q090_sat_fat_bacon",
"q85_sat_fat_12":"Q090_sat_fat_french_fries",
"q85_sat_fat_13":"Q090_sat_fat_red_meat",
"q85_sat_fat_14":"Q090_sat_fat_other",
"q85_sat_fat_other":"Q090_sat_fat_other_what",
"q85_vege_1":"Q090_vege_broccoli",
"q85_vege_2":"Q090_vege_carrots",
"q85_vege_3":"Q090_vege_cauliflower",
"q85_vege_4":"Q090_vege_spinach",
"q85_vege_5":"Q090_vege_lettuce",
"q85_vege_6":"Q090_vege_tomatoes",
"q85_vege_7":"Q090_vege_asparagus",
"q85_vege_8":"Q090_vege_beetroot",
"q85_vege_9":"Q090_vege_green_beans",
"q85_vege_10":"Q090_vege_pumpkin",
"q85_vege_11":"Q090_vege_gherkin",
"q85_vege_12":"Q090_vege_plantains",
"q85_vege_13":"Q090_vege_beans",
"q85_vege_14":"Q090_vege_other",
"q85_vege_other":"Q090_vege_other_what",

"q86":"Q091_taken_vitamins_or_minerals_last_five_years",
"q87":"Q092_currently_taking_vitamins_or_minerals",
"q88":"Q093_howOften_take_vitamins_or_minerals",
"q89_1":"Q094_multi_vitamins",
"q89_2":"Q094_vita_A",
"q89_3":"Q094_vita_B",
"q89_4":"Q094_vita_C",
"q89_5":"Q094_vita_E",
"q89_6":"Q094_Calcium",
"q89_7":"Q094_Beta_carotene",
"q89_other":"Q094_other",
"q90_1":"Q095_01_asthma",
"q90_1_age":"Q095_01_age",
"q90_1_year_only":"Q095_01_year",
"q90_2":"Q095_02_chronic_bronchitis",
"q90_2_age":"Q095_02_age",
"q90_2_year_only":"Q095_02_year",
"q90_3":"Q095_03_emphysema",
"q90_3_age":"Q095_03_age",
"q90_3_year_only":"Q095_03_year",
"q90_4":"Q095_04_pneumonia",
"q90_4_age":"Q095_04_age",
"q90_4_year_only":"Q095_04_year",
"q90_5":"Q095_05_hay_fever",
"q90_5_age":"Q095_05_age",
"q90_5_year_only":"Q095_05_year",
"q90_6":"Q095_06_eczema_dermatitis",
"q90_6_age":"Q095_06_age",
"q90_6_year_only":"Q095_06_year",
"q90_7":"Q095_07_moreMedicalCondition",
"q90_7_medcon":"Q095_07_whichMedicalCondition",
"q90_7_age":"Q095_07_age",
"q90_7_year_only":"Q095_07_year",
"q90_8":"Q095_08_moreMedicalCondition",
"q90_8_medcon":"Q095_08_whichMedicalCondition",
"q90_8_age":"Q095_08_age",
"q90_8_year_only":"Q095_08_year",
"q90_9":"Q095_09_moreMedicalCondition",
"q90_9_medcon":"Q095_09_whichMedicalCondition",
"q90_9_age":"Q095_09_age",
"q90_9_year_only":"Q095_09_year",
"q90_10":"Q095_10_moreMedicalCondition",
"q90_10_medcon":"Q095_10_whichMedicalCondition",
"q90_10_age":"Q095_10_age",
"q90_10_year_only":"Q095_10_year",
"q90_11":"Q095_11_moreMedicalCondition",
"q90_11_medcon":"Q095_11_whichMedicalCondition",
"q90_11_age":"Q095_11_age",
"q90_11_year_only":"Q095_11_year",

"q91_1":"Q096_01_second_hand_smoke_at_home",
"q91_1_howManyYears":"Q096_01_howManyYears",
"q91_2":"Q096_02_second_hand_smoke_at_work",
"q91_2_howManyYears":"Q096_02_howManyYears",
"q91_3":"Q096_03_second_hand_smoke_at_leisure",
"q91_3_howManyYears":"Q096_03_howManyYears",
"q92_1":"Q097_01_asbestos",
"q92_1_howManyYears":"Q097_01_howManyYears",
"q92_2":"Q097_02_sand_silica_concrete_dust",
"q92_2_howManyYears":"Q097_02_howManyYears",
"q92_3":"Q097_03_solvents",
"q92_3_howManyYears":"Q097_03_howManyYears",
"q92_4":"Q097_04_arsenic",
"q92_4_howManyYears":"Q097_04_howManyYears",
"q92_5":"Q097_05_chromium_nickel",
"q92_5_howManyYears":"Q097_05_howManyYears",
"q92_6":"Q097_06_cadmium",
"q92_6_howManyYears":"Q097_06_howManyYears",
"q92_7":"Q097_07_berylium",
"q92_7_howManyYears":"Q097_07_howManyYears",
"q92_8":"Q097_08_radon_uranium",
"q92_8_howManyYears":"Q097_08_howManyYears",
"q92_9":"Q097_09_benzene",
"q92_9_howManyYears":"Q097_09_howManyYears",

"q93":"Q098a_used_nicotine_replacement_product",
"q93_1":"Q098b_01_pills",
"q93_1_howManyMonths":"Q098b_01_howManyMonths",
"q93_2":"Q098b_02_nicotine_gum",
"q93_2_howManyMonths":"Q098b_02_howManyMonths",
"q93_3":"Q098b_03_nicotine_patch",
"q93_3_howManyMonths":"Q098b_03_howManyMonths",
"q93_4":"Q098b_04_nicotine_lozenge",
"q93_4_howManyMonths":"Q098b_04_howManyMonths",
"q93_5":"Q098b_05_nicotine_nasal_spray_oral_inhaler",
"q93_5_howManyMonths":"Q098b_05_howManyMonths",
"q94_1":"Q099_01_NSAIDS",
"q94_1_NumPillsPerWeek":"Q099_01_NumPillsPerWeek",
"q94_1_ageStart":"Q099_01_ageStart",
"q94_1_ageStop":"Q099_01_ageStop",
"q94_2":"Q099_02_STATINS",
"q94_2_NumPillsPerWeek":"Q099_02_NumPillsPerWeek",
"q94_2_ageStart":"Q099_02_ageStart",
"q94_2_ageStop":"Q099_02_ageStop",
"q94_3":"Q099_03_asthma_medicine",
"q94_3_NumPillsPerWeek":"Q099_03_NumPillsPerWeek",
"q94_3_ageStart":"Q099_03_ageStart",
"q94_3_ageStop":"Q099_03_ageStop",
"q94_4":"Q099_04_diabetes_medicine",
"q94_4_NumPillsPerWeek":"Q099_04_NumPillsPerWeek",
"q94_4_ageStart":"Q099_04_ageStart",
"q94_4_ageStop":"Q099_04_ageStop",
"q94_5":"Q099_05_other_med1",
"q94_otherMedName1":"Q099_05_otherMedName",
"q94_5_NumPillsPerWeek":"Q099_05_NumPillsPerWeek",
"q94_5_ageStart":"Q099_05_ageStart",
"q94_5_ageStop":"Q099_05_ageStop",
"q94_6":"Q099_06_other_med2",
"q94_otherMedName2":"Q099_06_otherMedName",
"q94_6_NumPillsPerWeek":"Q099_06_NumPillsPerWeek",
"q94_6_ageStart":"Q099_06_ageStart",
"q94_6_ageStop":"Q099_06_ageStop",
"q94_7":"Q099_07_other_med3",
"q94_otherMedName3":"Q099_07_otherMedName",
"q94_7_NumPillsPerWeek":"Q099_07_NumPillsPerWeek",
"q94_7_ageStart":"Q099_07_ageStart",
"q94_7_ageStop":"Q099_07_ageStop",
"q94_8":"Q099_08_other_med4",
"q94_otherMedName4":"Q099_08_otherMedName",
"q94_8_NumPillsPerWeek":"Q099_08_NumPillsPerWeek",
"q94_8_ageStart":"Q099_08_ageStart",
"q94_8_ageStop":"Q099_08_ageStop",
"q94_9":"Q099_09_other_med5",
"q94_otherMedName5":"Q099_09_otherMedName",
"q94_9_NumPillsPerWeek":"Q099_09_NumPillsPerWeek",
"q94_9_ageStart":"Q099_09_ageStart",
"q94_9_ageStop":"Q099_09_ageStop",

"q95_doctor_name":"q100_doctor_name",
"q95_addr_street1":"q100_addr_street1",
"q95_addr_street2":"q100_addr_street2",
"q95_addr_city":"q100_addr_city",
"q95_addr_state":"q100_addr_state",
"q95_addr_zipcode":"q100_addr_zipcode",
"q95_country":"q100_country",
"q95_doctor_telephone":"q100_doctor_telephone",
"q95_doctor_other_info":"q100_doctor_other_info",
"other_memo":"Memo_comment",
		]

	List fields_short = [

		"consentNum",
		"sex",
		"shortDOB",
		"race",
		"other_race",
		"hispanic_or_latino",
		"addr_state",

		"haveCancer",
                "q12_cancerlist",
        
		"familyHaveCancer",
                "q13_family_cancerlist",
/*        
		"q13_1_ageDiagnosed",
		"q13_1_cancerType",
		"q13_2_ageDiagnosed",
		"q13_2_cancerType",
		"q13_3_ageDiagnosed",
		"q13_3_cancerType",
		"q13_4_ageDiagnosed",
		"q13_4_cancerType",
		"q13_5_ageDiagnosed",
		"q13_5_cancerType",
		"q13_6_ageDiagnosed",
		"q13_6_cancerType",
		"q13_7_ageDiagnosed",
		"q13_7_cancerType",
		"q13_8_ageDiagnosed",
		"q13_8_cancerType",
		"q13_9_ageDiagnosed",
		"q13_9_cancerType",
		"q13_10_ageDiagnosed",
		"q13_10_cancerType",
		"q13_11_ageDiagnosed",
		"q13_11_cancerType",
		"q13_12_ageDiagnosed",
		"q13_12_cancerType",
		"q13_13_ageDiagnosed",
		"q13_13_cancerType",
		"q13_14_ageDiagnosed",
		"q13_14_cancerType",
		"q13_15_ageDiagnosed",
		"q13_15_cancerType",

		"q13_16",
		"q13_16_ageDiagnosed",
		"q13_16_cancerType",
		"q13_17",
		"q13_17_ageDiagnosed",
		"q13_17_cancerType",
		"q13_18",
		"q13_18_ageDiagnosed",
		"q13_18_cancerType",
		"q13_19",
		"q13_19_ageDiagnosed",
		"q13_19_cancerType",
		"q13_20",
		"q13_20_ageDiagnosed",
		"q13_20_cancerType",

		"q13_other_family_member",
*/
		"q16",
		"q17",
		"q18",
		"q19",
		"stillSmoke",
		"q21DateStopSmoking_short",
		"q21_whenStopSmoking_months",
		"q21_whenStopSmoking_years",

		"other_memo",
		]

	
	Map global_labels_short =[

"consentNum":"InformedConsentNumber",
"sex":"Q001_sex",
"shortDOB":"Q001_Date_of_Birth",	
"race":"Q002_race",
"other_race":"Q002_other_race",
"hispanic_or_latino":"Q003_Do_you_consider_yourself_Hispanic_or_Latino",
"addr_state":"Q004_State",

"haveCancer":"Q014_have_you_ever_told_by_doctor_you_have_cancer",

"q12_cancerlist":"Q015_CancerList",

"familyHaveCancer":"Q018_familyHaveCancer",

"q13_family_cancerlist":"Q018_FamilyCancerList",

"q16":"Q021_smoke_100_cigarettes",
"q17":"Q022_at_what_age_begin_smoking",
"q18":"Q023_total_years_of_smoking",
"q19":"Q024_average_cigarettes_smoke_a_day",

"stillSmoke":"Q025_still_smoke",

"q21DateStopSmoking_short":"Q026_date_stop_smoking",
"q21_whenStopSmoking_months":"Q026_how_long_ago_stop_smoking_months",
"q21_whenStopSmoking_years":"Q026_how_long_ago_stop_smoking_years",
"other_memo":"Memo_comment",
		]    
    
	def show = {
		session.step=''
		def surveyInstance = Survey.get(params.id)
		if (!surveyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
		
			[surveyInstance: surveyInstance]
		}
	}
    def list = {

		session.step=''
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		
		//List fields = []
		
		//def d = new DefaultGrailsDomainClass(Survey.class)
		//d.persistentProperties.each{
			//fields.add(it.name)
		//}
		
		

		// Formatter closure
		def upperCase = { domain, value ->
			return value.toUpperCase() }
		
		
		Map formatters = [author: upperCase]
		
		Map parameters = [title: "survey_list", separator:"\t"]
		
		def surveys = Survey.list()
                //def sclone=new ArrayList(surveys) // shallow copy ... similar to .clone()
                surveys.each{
			def shortDOB = it.DOB ? String.format('%tY/%<tm/%<td', it.DOB) : ""
			it.putAt("shortDOB", shortDOB)
			def q11a_1Year_only = it.q11a_1Year ? String.format('%tY', it.q11a_1Year) : ""
			def q11a_2Year_only = it.q11a_2Year ? String.format('%tY', it.q11a_2Year) : ""
			def q11a_3Year_only = it.q11a_3Year ? String.format('%tY', it.q11a_3Year) : ""
			def q11a_4Year_only = it.q11a_4Year ? String.format('%tY', it.q11a_4Year) : ""
			def q11a_5Year_only = it.q11a_5Year ? String.format('%tY', it.q11a_5Year) : ""
			def q11a_6Year_only = it.q11a_6Year ? String.format('%tY', it.q11a_6Year) : ""
			def q11a_hep_donotknow_type_Year_only = it.q11a_hep_donotknow_type_Year ? String.format('%tY', it.q11a_hep_donotknow_type_Year) : ""
			it.putAt("q11a_1Year_only", q11a_1Year_only)
			it.putAt("q11a_2Year_only", q11a_2Year_only)
			it.putAt("q11a_3Year_only", q11a_3Year_only)
			it.putAt("q11a_4Year_only", q11a_4Year_only)
			it.putAt("q11a_5Year_only", q11a_5Year_only)
			it.putAt("q11a_6Year_only", q11a_6Year_only)
			it.putAt("q11a_hep_donotknow_type_Year_only", q11a_hep_donotknow_type_Year_only)
			def q21DateStopSmoking_short = it.q21DateStopSmoking ? String.format('%tY/%<tm/%<td', it.q21DateStopSmoking) : ""
			it.putAt("q21DateStopSmoking_short", q21DateStopSmoking_short)
			def date_most_recent_PSA_test_short = it.dateMostRecentPSAtest ? String.format('%tY/%<tm', it.dateMostRecentPSAtest) : ""
			def date_rectal_exam_short = it.dateRectalExam ? String.format('%tY/%<tm', it.dateRectalExam) : ""
			it.putAt("date_rectal_exam_short", date_rectal_exam_short)
			it.putAt("date_most_recent_PSA_test_short", date_most_recent_PSA_test_short)
			def date_digital_rectal_exam_short = it.dateDigitalRectalExam ? String.format('%tY/%<tm', it.dateDigitalRectalExam) : ""
			def date_sigmoidoscopy_colonoscopy_short = it.dateSigmoidoscopyColonoscopy ? String.format('%tY/%<tm', it.dateSigmoidoscopyColonoscopy): ""
			it.putAt("date_digital_rectal_exam_short", date_digital_rectal_exam_short)
			it.putAt("date_sigmoidoscopy_colonoscopy_short", date_sigmoidoscopy_colonoscopy_short)
			
			def q48_date_last_visit_gynecologist_short = it.q48dateLastVisitGynecologist ? String.format('%tY/%<tm', it.q48dateLastVisitGynecologist): ""
			it.putAt("q48_date_last_visit_gynecologist_short", q48_date_last_visit_gynecologist_short)
			def q51_1_date_short = it.q51date1 ? String.format('%tY/%<tm', it.q51date1): ""
			def q51_2_date_short = it.q51date2 ? String.format('%tY/%<tm', it.q51date2): ""
			def q51_3_date_short = it.q51date3 ? String.format('%tY/%<tm', it.q51date3): ""
			def q51_4_date_short = it.q51date4 ? String.format('%tY/%<tm', it.q51date4): ""
			def q51_5_date_short = it.q51date5 ? String.format('%tY/%<tm', it.q51date5): ""
			def q51_6_date_short = it.q51date6 ? String.format('%tY/%<tm', it.q51date6): ""
			it.putAt("q51_1_date_short", q51_1_date_short)
			it.putAt("q51_2_date_short", q51_2_date_short)
			it.putAt("q51_3_date_short", q51_3_date_short)
			it.putAt("q51_4_date_short", q51_4_date_short)
			it.putAt("q51_5_date_short", q51_5_date_short)
			it.putAt("q51_6_date_short", q51_6_date_short)
			def q52_date_most_recent_pap_smear_short = it.q52dateMostRecentPapSmear ? String.format('%tY/%<tm', it.q52dateMostRecentPapSmear): ""
			it.putAt("q52_date_most_recent_pap_smear_short", q52_date_most_recent_pap_smear_short)
			def q71shortdate = it.q71 ? String.format('%tY/%<tm', it.q71): ""
			it.putAt("q71shortdate", q71shortdate)
			def q84_1_rad_date_short = it.q84_1_rad_date ? String.format('%tY/%<tm/%<td', it.q84_1_rad_date): ""
			def q84_2_rad_date_short = it.q84_2_rad_date ? String.format('%tY/%<tm/%<td', it.q84_2_rad_date): ""
			def q84_3_rad_date_short = it.q84_3_rad_date ? String.format('%tY/%<tm/%<td', it.q84_3_rad_date): ""
			def q84_4_rad_date_short = it.q84_4_rad_date ? String.format('%tY/%<tm/%<td', it.q84_4_rad_date): ""
			def q84_5_rad_date_short = it.q84_5_rad_date ? String.format('%tY/%<tm/%<td', it.q84_5_rad_date): ""
			def q84_6_rad_date_short = it.q84_6_rad_date ? String.format('%tY/%<tm/%<td', it.q84_6_rad_date): ""
			def q84_7_rad_date_short = it.q84_7_rad_date ? String.format('%tY/%<tm/%<td', it.q84_7_rad_date): ""
			def q84_8_rad_date_short = it.q84_8_rad_date ? String.format('%tY/%<tm/%<td', it.q84_8_rad_date): ""
			def q84_9_rad_date_short = it.q84_9_rad_date ? String.format('%tY/%<tm/%<td', it.q84_9_rad_date): ""
			def q84_10_rad_date_short = it.q84_10_rad_date ? String.format('%tY/%<tm/%<td', it.q84_10_rad_date): ""
			it.putAt("q84_1_rad_date_short", q84_1_rad_date_short)
			it.putAt("q84_2_rad_date_short", q84_2_rad_date_short)
			it.putAt("q84_3_rad_date_short", q84_3_rad_date_short)
			it.putAt("q84_4_rad_date_short", q84_4_rad_date_short)
			it.putAt("q84_5_rad_date_short", q84_5_rad_date_short)
			it.putAt("q84_6_rad_date_short", q84_6_rad_date_short)
			it.putAt("q84_7_rad_date_short", q84_7_rad_date_short)
			it.putAt("q84_8_rad_date_short", q84_8_rad_date_short)
			it.putAt("q84_9_rad_date_short", q84_9_rad_date_short)
			it.putAt("q84_10_rad_date_short", q84_10_rad_date_short)
			def q90_1_year_only = it.q90_1_year ? String.format('%tY', it.q90_1_year): ""
			def q90_2_year_only = it.q90_2_year ? String.format('%tY', it.q90_2_year): ""
			def q90_3_year_only = it.q90_3_year ? String.format('%tY', it.q90_3_year): ""
			def q90_4_year_only = it.q90_4_year ? String.format('%tY', it.q90_4_year): ""
			def q90_5_year_only = it.q90_5_year ? String.format('%tY', it.q90_5_year): ""
			def q90_6_year_only = it.q90_6_year ? String.format('%tY', it.q90_6_year): ""
			def q90_7_year_only = it.q90_7_year ? String.format('%tY', it.q90_7_year): ""
			def q90_8_year_only = it.q90_8_year ? String.format('%tY', it.q90_8_year): ""
			def q90_9_year_only = it.q90_9_year ? String.format('%tY', it.q90_9_year): ""
			def q90_10_year_only = it.q90_10_year ? String.format('%tY', it.q90_10_year): ""
			def q90_11_year_only = it.q90_11_year ? String.format('%tY', it.q90_11_year): ""
			it.putAt("q90_1_year_only", q90_1_year_only)
			it.putAt("q90_2_year_only", q90_2_year_only)
			it.putAt("q90_3_year_only", q90_3_year_only)
			it.putAt("q90_4_year_only", q90_4_year_only)
			it.putAt("q90_5_year_only", q90_5_year_only)
			it.putAt("q90_6_year_only", q90_6_year_only)
			it.putAt("q90_7_year_only", q90_7_year_only)
			it.putAt("q90_8_year_only", q90_8_year_only)
			it.putAt("q90_9_year_only", q90_9_year_only)
			it.putAt("q90_10_year_only", q90_10_year_only)
			it.putAt("q90_11_year_only", q90_11_year_only)
                        
                        def cancers=" "
                        if ((it.q12_1_1 || it.q12_1_2 || it.q12_1_3 || it.q12_1_4) && it.q12_1_ageDiagnosed && it.q12_1_ageDiagnosed.trim()!="-1"){ cancers+= "Anal cancer|" }
                        if ((it.q12_2_1 || it.q12_2_2 || it.q12_2_3 || it.q12_2_4) && it.q12_2_ageDiagnosed && it.q12_2_ageDiagnosed.trim()!="-1" ){ cancers+= "Bladder cancer|" }
                        if ((it.q12_3_1 || it.q12_3_2 || it.q12_3_3 || it.q12_3_4) && it.q12_3_ageDiagnosed && it.q12_3_ageDiagnosed.trim()!="-1" ){ cancers+= "Brain cancer|" }
                        if ((it.q12_4_1 || it.q12_4_2 || it.q12_4_3 || it.q12_4_4) && it.q12_4_ageDiagnosed && it.q12_4_ageDiagnosed.trim()!="-1" ){ cancers+= "Breast cancer|" }
                        if ((it.q12_5_1 || it.q12_5_2 || it.q12_5_3 || it.q12_5_4) && it.q12_5_ageDiagnosed && it.q12_5_ageDiagnosed.trim()!="-1" ){ cancers+= "Carcinoid Tumor|" }
                        if ((it.q12_6_1 || it.q12_6_2 || it.q12_6_3 || it.q12_6_4) && it.q12_6_ageDiagnosed && it.q12_6_ageDiagnosed.trim()!="-1" ){ cancers+= "Cervical cancer|" }
                        if ((it.q12_7_1 || it.q12_7_2 || it.q12_7_3 || it.q12_7_4) && it.q12_7_ageDiagnosed && it.q12_7_ageDiagnosed.trim()!="-1" ){ cancers+= "Colon cancer|" }
                        if ((it.q12_8_1 || it.q12_8_2 || it.q12_8_3 || it.q12_8_4) && it.q12_8_ageDiagnosed && it.q12_8_ageDiagnosed.trim()!="-1" ){ cancers+= "Uterine cancer|" }
                        if ((it.q12_9_1 || it.q12_9_2 || it.q12_9_3 || it.q12_9_4) && it.q12_9_ageDiagnosed && it.q12_9_ageDiagnosed.trim()!="-1" ){ cancers+= "Esophageal cancer|" }
                        if ((it.q12_10_1 || it.q12_10_2 || it.q12_10_3 || it.q12_10_4) && it.q12_10_ageDiagnosed && it.q12_10_ageDiagnosed.trim()!="-1" ){ cancers+= "GallBladdr cancer|" }
                        if ((it.q12_11_1 || it.q12_11_2 || it.q12_11_3 || it.q12_11_4) && it.q12_11_ageDiagnosed && it.q12_11_ageDiagnosed.trim()!="-1" ){ cancers+= "Gastrointestinal stromal tumor|" }
                        if ((it.q12_12_1 || it.q12_12_2 || it.q12_12_3 || it.q12_12_4) && it.q12_12_ageDiagnosed && it.q12_12_ageDiagnosed.trim()!="-1" ){ cancers+= "Hodgkin's lymphoma|" }
                        if ((it.q12_13_1 || it.q12_13_2 || it.q12_13_3 || it.q12_13_4) && it.q12_13_ageDiagnosed && it.q12_13_ageDiagnosed.trim()!="-1" ){ cancers+= "Kidney cancer|" }
                        if ((it.q12_14_1 || it.q12_14_2 || it.q12_14_3 || it.q12_14_4) && it.q12_14_ageDiagnosed && it.q12_14_ageDiagnosed.trim()!="-1" ){ cancers+= "Leukemia|" }
                        if ((it.q12_15_1 || it.q12_15_2 || it.q12_15_3 || it.q12_15_4) && it.q12_15_ageDiagnosed && it.q12_15_ageDiagnosed.trim()!="-1" ){ cancers+= "Liver cancer|" }
                        if ((it.q12_16_1 || it.q12_16_2 || it.q12_16_3 || it.q12_16_4) && it.q12_16_ageDiagnosed && it.q12_16_ageDiagnosed.trim()!="-1" ){ cancers+= "Lung cancer|" }
                        if ((it.q12_17_1 || it.q12_17_2 || it.q12_17_3 || it.q12_17_4) && it.q12_17_ageDiagnosed && it.q12_17_ageDiagnosed.trim()!="-1" ){ cancers+= "Melanoma|" }
                        if ((it.q12_18_1 || it.q12_18_2 || it.q12_18_3 || it.q12_18_4) && it.q12_18_ageDiagnosed && it.q12_18_ageDiagnosed.trim()!="-1" ){ cancers+= "Multiple myeloma|" }
                        if ((it.q12_19_1 || it.q12_19_2 || it.q12_19_3 || it.q12_19_4) && it.q12_19_ageDiagnosed && it.q12_19_ageDiagnosed.trim()!="-1" ){ cancers+= "Non-Hodgkin's lymphoma|" }
                        if ((it.q12_20_1 || it.q12_20_2 || it.q12_20_3 || it.q12_20_4) && it.q12_20_ageDiagnosed && it.q12_20_ageDiagnosed.trim()!="-1" ){ cancers+= "Throat cancer|" }
                        if ((it.q12_21_1 || it.q12_21_2 || it.q12_21_3 || it.q12_21_4) && it.q12_21_ageDiagnosed && it.q12_21_ageDiagnosed.trim()!="-1" ){ cancers+= "Ovarian cancer|" }
			if ((it.q12_22_1 || it.q12_22_2 || it.q12_22_3 || it.q12_22_4) && it.q12_22_ageDiagnosed && it.q12_22_ageDiagnosed.trim()!="-1" ){ cancers+= "Pancreatic cancer|" }
                        if ((it.q12_23_1 || it.q12_23_2 || it.q12_23_3 || it.q12_23_4) && it.q12_23_ageDiagnosed && it.q12_23_ageDiagnosed.trim()!="-1" ){ cancers+= "Prostate ancer|" }
                        if ((it.q12_24_1 || it.q12_24_2 || it.q12_24_3 || it.q12_24_4) && it.q12_which_cancer!="" && it.q12_24_ageDiagnosed && it.q12_24_ageDiagnosed.trim()!="-1" ){ cancers+= it.q12_which_cancer }
                        if ((it.q12_25_1 || it.q12_25_2 || it.q12_25_3 || it.q12_25_4) && it.q12_25!="" && it.q12_25_ageDiagnosed && it.q12_25_ageDiagnosed.trim()!="-1" ){ cancers+= it.q12_25 }
                        if ((it.q12_26_1 || it.q12_26_2 || it.q12_26_3 || it.q12_26_4) && it.q12_26!="" && it.q12_26_ageDiagnosed && it.q12_26_ageDiagnosed.trim()!="-1" ){ cancers+= it.q12_26 }
                        if ((it.q12_27_1 || it.q12_27_2 || it.q12_27_3 || it.q12_27_4) && it.q12_27!="" && it.q12_27_ageDiagnosed && it.q12_27_ageDiagnosed.trim()!="-1" ){ cancers+= it.q12_27 }
                        if ((it.q12_28_1 || it.q12_28_2 || it.q12_28_3 || it.q12_28_4) && it.q12_28!="" && it.q12_28_ageDiagnosed && it.q12_28_ageDiagnosed.trim()!="-1" ){ cancers+= it.q12_28 }
                        if ((it.q12_29_1 || it.q12_29_2 || it.q12_29_3 || it.q12_29_4) && it.q12_29!="" && it.q12_29_ageDiagnosed && it.q12_29_ageDiagnosed.trim()!="-1" ){ cancers+= it.q12_29 }
                       
                       it.putAt("q12_cancerlist", cancers)
                       
                        def familyCancers=" "
                        if (it.q13_1_cancerType) {familyCancers += "Mother:"+it.q13_1_cancerType+", "}
                        if (it.q13_2_cancerType) {familyCancers += "Father:"+it.q13_2_cancerType+", "}
                        if (it.q13_3_cancerType) {familyCancers += "Sister:"+it.q13_3_cancerType+", "}
                        if (it.q13_4_cancerType) {familyCancers += "Brother:"+it.q13_4_cancerType+", "}
                        if (it.q13_5_cancerType) {familyCancers += "Daughter:"+it.q13_5_cancerType+", "}
                        if (it.q13_6_cancerType) {familyCancers += "Son:"+it.q13_6_cancerType+", "}
                        if (it.q13_7_cancerType) {familyCancers += "Maternal_Grandmother:"+it.q13_7_cancerType+", "}
                        if (it.q13_8_cancerType) {familyCancers += "Maternal_Grandfather:"+it.q13_8_cancerType+", "}
                        if (it.q13_9_cancerType) {familyCancers += "Maternal_Aunt:"+it.q13_9_cancerType+", "}
                        if (it.q13_10_cancerType) {familyCancers += "Maternal_Uncle:"+it.q13_10_cancerType+", "}
                        if (it.q13_11_cancerType) {familyCancers += "Paternal_Grandmother:"+it.q13_11_cancerType+", "}
                        if (it.q13_12_cancerType) {familyCancers += "Paternal_Grandfather:"+it.q13_12_cancerType+", "}
                        if (it.q13_13_cancerType) {familyCancers += "Paternal_Aunt:"+it.q13_13_cancerType+", "}
                        if (it.q13_14_cancerType) {familyCancers += "Paternal_Uncle:"+it.q13_14_cancerType+", "}
                        if (it.q13_15_cancerType) {familyCancers += it.q13_other_family_member+":"+it.q13_15_cancerType+", "}
                        if (it.q13_16_cancerType) {familyCancers += it.q13_16+":"+it.q13_16_cancerType+", "}
                        if (it.q13_17_cancerType) {familyCancers += it.q13_17+":"+it.q13_17_cancerType+", "}
                        if (it.q13_18_cancerType) {familyCancers += it.q13_18+":"+it.q13_18_cancerType+", "}
                        if (it.q13_19_cancerType) {familyCancers += it.q13_19+":"+it.q13_19_cancerType+", "}
                        if (it.q13_20_cancerType) {familyCancers += it.q13_20+":"+it.q13_20_cancerType+", "}
                        
            
                        it.putAt("q13_family_cancerlist", familyCancers)
		}
		
		
		if(params?.format && params.format != "html"){
			if (params.extension=="csv"){
				params.extension="tsv.txt"
                                /*
				surveys.each {
					if (it.other_memo){
						String ss=it.other_memo.toString()
						it.other_memo=ss.replaceAll("\\r\\n|\\r|\\n", "-**-").replaceAll("\\t", " ")
					
						//println it.other_memo
					}
				}
                                */

			}
                        else if (params.extension=="csv2"){
                            params.extension="-short.tsv.txt"
                            params.format="csv"
                        }
                        else if (params.extension=="xml2"){
                            params.extension="-short.xml"
                            params.format="xml"
                        }
                        
			response.contentType = ConfigurationHolder.config.grails.mime.types[params.format] 
			response.setHeader("Content-disposition", "attachment; filename=survey_list.${params.extension}")
			params.max=1000000
			
			//exportService.export(params.format, response.outputStream, Survey.list(params), [:], [:])
			//exportService.export(params.format, response.outputStream, Survey.list(params).sort{it.id}, fields, global_labels, formatters, parameters)
			if (params.extension=="-short.tsv.txt" || params.extension=="-short.xml"){
                            exportService.export(params.format, response.outputStream, surveys.sort{it.id}, fields_short, global_labels_short, formatters, parameters)
                        }
                        else{
                            exportService.export(params.format, response.outputStream, surveys.sort{it.id}, fields, global_labels, formatters, parameters)
                        }
		}
		params.sort = params.sort ? params.sort : "id" 
		params.order= params.order ? params.order : "desc"
        [surveyInstanceList: Survey.list(params).sort{-it.id}, surveyInstanceTotal: Survey.count()]
    }
	def list_surveyer = {
		session.step=''
		def selectedSurveys=getSurveyList(session.user.login, params)
                //def selectedSurveysClone=new ArrayList(selectedSurveys) // shallow copy ... similar to .clone()

		def surveySize=u56survey.Survey.countBySurveyer(session.user.login)
		
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		
		/////List fields = []
		
		/////def d = new DefaultGrailsDomainClass(Survey.class)
		/////d.persistentProperties.each{
			//println "${it.name}"
		/////	fields.add(it.name)
		/////}
		
		

		// Formatter closure
		def upperCase = { domain, value ->
			return value.toUpperCase() }
		
		
		Map formatters = [author: upperCase]
		
		//Map parameters = [title: "survey_list", separator:"\t"]
		Map parameters = [title: "survey_list"]
/*
                selectedSurveys.each{
			def shortDOB = it.DOB ? String.format('%tY/%<tm/%<td', it.DOB) : ""
			it.putAt("shortDOB", shortDOB)
			def q11a_1Year_only = it.q11a_1Year ? String.format('%tY', it.q11a_1Year) : ""
			def q11a_2Year_only = it.q11a_2Year ? String.format('%tY', it.q11a_2Year) : ""
			def q11a_3Year_only = it.q11a_3Year ? String.format('%tY', it.q11a_3Year) : ""
			def q11a_4Year_only = it.q11a_4Year ? String.format('%tY', it.q11a_4Year) : ""
			def q11a_5Year_only = it.q11a_5Year ? String.format('%tY', it.q11a_5Year) : ""
			def q11a_6Year_only = it.q11a_6Year ? String.format('%tY', it.q11a_6Year) : ""
			def q11a_hep_donotknow_type_Year_only = it.q11a_hep_donotknow_type_Year ? String.format('%tY', it.q11a_hep_donotknow_type_Year) : ""
			it.putAt("q11a_1Year_only", q11a_1Year_only)
			it.putAt("q11a_2Year_only", q11a_2Year_only)
			it.putAt("q11a_3Year_only", q11a_3Year_only)
			it.putAt("q11a_4Year_only", q11a_4Year_only)
			it.putAt("q11a_5Year_only", q11a_5Year_only)
			it.putAt("q11a_6Year_only", q11a_6Year_only)
			it.putAt("q11a_hep_donotknow_type_Year_only", q11a_hep_donotknow_type_Year_only)
			def q21DateStopSmoking_short = it.q21DateStopSmoking ? String.format('%tY/%<tm/%<td', it.q21DateStopSmoking) : ""
			it.putAt("q21DateStopSmoking_short", q21DateStopSmoking_short)
			def date_most_recent_PSA_test_short = it.dateMostRecentPSAtest ? String.format('%tY/%<tm', it.dateMostRecentPSAtest) : ""
			def date_rectal_exam_short = it.dateRectalExam ? String.format('%tY/%<tm', it.dateRectalExam) : ""
			it.putAt("date_rectal_exam_short", date_rectal_exam_short)
			it.putAt("date_most_recent_PSA_test_short", date_most_recent_PSA_test_short)
			def date_digital_rectal_exam_short = it.dateDigitalRectalExam ? String.format('%tY/%<tm', it.dateDigitalRectalExam) : ""
			def date_sigmoidoscopy_colonoscopy_short = it.dateSigmoidoscopyColonoscopy ? String.format('%tY/%<tm', it.dateSigmoidoscopyColonoscopy): ""
			it.putAt("date_digital_rectal_exam_short", date_digital_rectal_exam_short)
			it.putAt("date_sigmoidoscopy_colonoscopy_short", date_sigmoidoscopy_colonoscopy_short)
			
			def q48_date_last_visit_gynecologist_short = it.q48dateLastVisitGynecologist ? String.format('%tY/%<tm', it.q48dateLastVisitGynecologist): ""
			it.putAt("q48_date_last_visit_gynecologist_short", q48_date_last_visit_gynecologist_short)
			def q51_1_date_short = it.q51date1 ? String.format('%tY/%<tm', it.q51date1): ""
			def q51_2_date_short = it.q51date2 ? String.format('%tY/%<tm', it.q51date2): ""
			def q51_3_date_short = it.q51date3 ? String.format('%tY/%<tm', it.q51date3): ""
			def q51_4_date_short = it.q51date4 ? String.format('%tY/%<tm', it.q51date4): ""
			def q51_5_date_short = it.q51date5 ? String.format('%tY/%<tm', it.q51date5): ""
			def q51_6_date_short = it.q51date6 ? String.format('%tY/%<tm', it.q51date6): ""
			it.putAt("q51_1_date_short", q51_1_date_short)
			it.putAt("q51_2_date_short", q51_2_date_short)
			it.putAt("q51_3_date_short", q51_3_date_short)
			it.putAt("q51_4_date_short", q51_4_date_short)
			it.putAt("q51_5_date_short", q51_5_date_short)
			it.putAt("q51_6_date_short", q51_6_date_short)
			def q52_date_most_recent_pap_smear_short = it.q52dateMostRecentPapSmear ? String.format('%tY/%<tm', it.q52dateMostRecentPapSmear): ""
			it.putAt("q52_date_most_recent_pap_smear_short", q52_date_most_recent_pap_smear_short)
			def q71shortdate = it.q71 ? String.format('%tY/%<tm', it.q71): ""
			it.putAt("q71shortdate", q71shortdate)
			def q84_1_rad_date_short = it.q84_1_rad_date ? String.format('%tY/%<tm/%<td', it.q84_1_rad_date): ""
			def q84_2_rad_date_short = it.q84_2_rad_date ? String.format('%tY/%<tm/%<td', it.q84_2_rad_date): ""
			def q84_3_rad_date_short = it.q84_3_rad_date ? String.format('%tY/%<tm/%<td', it.q84_3_rad_date): ""
			def q84_4_rad_date_short = it.q84_4_rad_date ? String.format('%tY/%<tm/%<td', it.q84_4_rad_date): ""
			def q84_5_rad_date_short = it.q84_5_rad_date ? String.format('%tY/%<tm/%<td', it.q84_5_rad_date): ""
			def q84_6_rad_date_short = it.q84_6_rad_date ? String.format('%tY/%<tm/%<td', it.q84_6_rad_date): ""
			def q84_7_rad_date_short = it.q84_7_rad_date ? String.format('%tY/%<tm/%<td', it.q84_7_rad_date): ""
			def q84_8_rad_date_short = it.q84_8_rad_date ? String.format('%tY/%<tm/%<td', it.q84_8_rad_date): ""
			def q84_9_rad_date_short = it.q84_9_rad_date ? String.format('%tY/%<tm/%<td', it.q84_9_rad_date): ""
			def q84_10_rad_date_short = it.q84_10_rad_date ? String.format('%tY/%<tm/%<td', it.q84_10_rad_date): ""
			it.putAt("q84_1_rad_date_short", q84_1_rad_date_short)
			it.putAt("q84_2_rad_date_short", q84_2_rad_date_short)
			it.putAt("q84_3_rad_date_short", q84_3_rad_date_short)
			it.putAt("q84_4_rad_date_short", q84_4_rad_date_short)
			it.putAt("q84_5_rad_date_short", q84_5_rad_date_short)
			it.putAt("q84_6_rad_date_short", q84_6_rad_date_short)
			it.putAt("q84_7_rad_date_short", q84_7_rad_date_short)
			it.putAt("q84_8_rad_date_short", q84_8_rad_date_short)
			it.putAt("q84_9_rad_date_short", q84_9_rad_date_short)
			it.putAt("q84_10_rad_date_short", q84_10_rad_date_short)
			def q90_1_year_only = it.q90_1_year ? String.format('%tY', it.q90_1_year): ""
			def q90_2_year_only = it.q90_2_year ? String.format('%tY', it.q90_2_year): ""
			def q90_3_year_only = it.q90_3_year ? String.format('%tY', it.q90_3_year): ""
			def q90_4_year_only = it.q90_4_year ? String.format('%tY', it.q90_4_year): ""
			def q90_5_year_only = it.q90_5_year ? String.format('%tY', it.q90_5_year): ""
			def q90_6_year_only = it.q90_6_year ? String.format('%tY', it.q90_6_year): ""
			def q90_7_year_only = it.q90_7_year ? String.format('%tY', it.q90_7_year): ""
			def q90_8_year_only = it.q90_8_year ? String.format('%tY', it.q90_8_year): ""
			def q90_9_year_only = it.q90_9_year ? String.format('%tY', it.q90_9_year): ""
			def q90_10_year_only = it.q90_10_year ? String.format('%tY', it.q90_10_year): ""
			def q90_11_year_only = it.q90_11_year ? String.format('%tY', it.q90_11_year): ""
			it.putAt("q90_1_year_only", q90_1_year_only)
			it.putAt("q90_2_year_only", q90_2_year_only)
			it.putAt("q90_3_year_only", q90_3_year_only)
			it.putAt("q90_4_year_only", q90_4_year_only)
			it.putAt("q90_5_year_only", q90_5_year_only)
			it.putAt("q90_6_year_only", q90_6_year_only)
			it.putAt("q90_7_year_only", q90_7_year_only)
			it.putAt("q90_8_year_only", q90_8_year_only)
			it.putAt("q90_9_year_only", q90_9_year_only)
			it.putAt("q90_10_year_only", q90_10_year_only)
			it.putAt("q90_11_year_only", q90_11_year_only)
			
		}        
        */
		if(params?.format && params.format != "html"){
			if (params.extension=="csv"){
				params.extension=session.user.login+".tsv.txt"
				/*
				selectedSurveysClone.each {
					if (it.other_memo){
						String ss=it.other_memo.toString()
						it.other_memo=ss.replaceAll("\\r\\n|\\r|\\n", "-**-").replaceAll("\\t", " ")
						//	println it.other_memo
					}
				}
				*/
				
				
			}
                        else if (params.extension=="xml"){
                                params.extension=session.user.login+".xml"
                        }
			response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
			response.setHeader("Content-disposition", "attachment; filename=survey_list.${params.extension}")
			params.max=1000000
			
			//exportService.export(params.format, response.outputStream, Survey.list(params), [:], [:])
			exportService.export(params.format, response.outputStream, selectedSurveys.sort{it.id}, fields, global_labels, formatters, parameters)
		}

		[surveyInstanceList: selectedSurveys.sort{-it.id}, surveyInstanceTotal: surveySize]
	}
	def getSurveyList(surveyer, params) {
		params.max = Math.min(params?.max?.toInteger() ?: 10, 100)
		params.offset = params?.offset?.toInteger() ?: 0
		params.sort = params?.sort ?: "id"
		params.order = params?.order ?: "asc"

		def surveys = u56survey.Survey.createCriteria().list(
				max: params.max,
				offset: params.offset,
				sort: params.sort,
				order: params.order) {
			eq "surveyer", surveyer
		}
	}

	def paper = {
		if (params.MRN && !params.mrn) params.mrn=params.MRN
		def existing_survey = params.mrn ? Survey.findByMrn(params.mrn): null
		if (existing_survey) redirect(action:"paper_edit", id: existing_survey.id)
		
		def countries = [] as SortedSet
		def countryNames = [:] // map
		
		Locale.ISOCountries.each {
		  if (it) {
			countries << it
		  }
		}
		countries.each{twolettercode->
			Locale l= new Locale("", twolettercode);
			countryNames.put(twolettercode, l.getDisplayCountry())
		}
		countryNames.remove("US")
		countryNames.remove("PR")
		countryNames=["PR":"PUERTO RICO", "US":"UNITED STATES", "--":"--"]+countryNames.sort{it.value}
		
		flash.paper = "paper"
		def surveyInstance = new Survey()
		surveyInstance.mode="paper"
		surveyInstance.save() // id will be created at this time.
		surveyInstance.consentNumSurv="HISPBB"
		surveyInstance.consentNumLoc=session.user.location
		//surveyInstance.consentNum=surveyInstance.id
		surveyInstance.surveyer=session.user.login
		surveyInstance.step="1"
		surveyInstance.properties = params
		thisyear=thisyear-18
		return [surveyInstance: surveyInstance, thisyear:thisyear, countryNames:countryNames]

	}
	def paper_edit = {
		def countries = [] as SortedSet
		def countryNames = [:] // map
		
		Locale.ISOCountries.each {
		  if (it) {
			countries << it
		  }
		}
		countries.each{twolettercode->
			Locale l= new Locale("", twolettercode);
			countryNames.put(twolettercode, l.getDisplayCountry())
		}
		countryNames.remove("US")
		countryNames.remove("PR")
		countryNames=["PR":"PUERTO RICO", "US":"UNITED STATES", "--":"--"]+countryNames.sort{it.value}
		
		def today = new Date()
		//today=today.minusYears(18) // subject should be 18 years old or more
		def thisyear=today[YEAR]
		
		flash.paper = "paper"
		//params.mode="paper"
		def surveyInstance = Survey.get(params.id)

		if (!surveyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [surveyInstance: surveyInstance, countryNames:countryNames, thisyear:thisyear]
		}
	}
	def step1 = { // copied from create
		
		if (params.MRN && !params.mrn) params.mrn=params.MRN
		def existing_survey = params.mrn ? Survey.findByMrn(params.mrn): null
		if (existing_survey) redirect(action:"step1_edit", id: existing_survey.id)
		
		def countries = [] as SortedSet
		def countryNames = [:] // map
		
		Locale.ISOCountries.each {
		  if (it) {
			countries << it
		  }
		}
		countries.each{twolettercode->
			Locale l= new Locale("", twolettercode);
			countryNames.put(twolettercode, l.getDisplayCountry())
		}
		countryNames.remove("US")
		countryNames.remove("PR")
		countryNames=["PR":"PUERTO RICO", "US":"UNITED STATES", "--":"--"]+countryNames.sort{it.value}
		
		def surveyInstance = new Survey()
		surveyInstance.save() // id will be created at this time.
		surveyInstance.consentNumSurv="HISPBB"
		surveyInstance.consentNumLoc=session.user.location
		//surveyInstance.consentNum=surveyInstance.id
		surveyInstance.surveyer=session.user.login
		surveyInstance.step="1"
		surveyInstance.properties = params
		thisyear=thisyear-18
		//return [surveyInstance: surveyInstance, thisyear:thisyear, countryNames:countryNames]
		
		redirect(action: "step1_edit", id: surveyInstance.id, surveyer:session.user.login)
	}

	def step1_edit ={ // copied from edit
		def countries = [] as SortedSet
		def countryNames = [:]
		
		Locale.ISOCountries.each {
		  if (it) {
			countries << it
		  }
		}
		countries.each{twolettercode->
			Locale l= new Locale("", twolettercode);
			countryNames.put(twolettercode, l.getDisplayCountry())
		}
		countryNames.remove("US")
		countryNames.remove("PR")
		countryNames=["PR":"PUERTO RICO", "US":"UNITED STATES", "--":"--"]+countryNames.sort{it.value}
		
        def surveyInstance = Survey.get(params.id)
        if (!surveyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
            redirect(action: "list")
        }
        else {
			thisyear=thisyear-18
            return [surveyInstance: surveyInstance, thisyear:thisyear, countryNames:countryNames]
        }
	}

/*
	def step2_after_save={
		def surveyInstance = new Survey(params)
		if (surveyInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'survey.label', default: 'Survey'), surveyInstance.id])}"
			//redirect(action: "show", id: surveyInstance.id)
			redirect(action: "step2", id: surveyInstance.id)
		}
		else {
			render(view: "step1", model: [surveyInstance: surveyInstance, thisyear:thisyear])
		}
	}
*/
	def step2 = { // copied from edit
        def surveyInstance = Survey.get(params.id)
		surveyInstance.properties = params
        if (!surveyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
            redirect(action: "list")
        }
        else {
			def thisyear=today[YEAR]
            return [surveyInstance: surveyInstance, thisyear:thisyear]
        }
	}
	def step2_after_update={ // copied from update
		def surveyInstance = Survey.get(params.id)
		
		
		def countries = [] as SortedSet
		def countryNames = [:]
		
		Locale.ISOCountries.each {
		  if (it) {
			countries << it
		  }
		}
		countries.each{twolettercode->
			Locale l= new Locale("", twolettercode);
			countryNames.put(twolettercode, l.getDisplayCountry())
		}
		countryNames.remove("US")
		countryNames.remove("PR")
		countryNames=["PR":"PUERTO RICO", "US":"UNITED STATES", "--":"--"]+countryNames.sort{it.value}
		
		surveyInstance.surveyer=session.user.login
		surveyInstance.step="1"
		
		if (surveyInstance) {

			if (params.version) {
				def version = params.version.toLong()
				if (surveyInstance.version > version) {
					
					surveyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'survey.label', default: 'Survey')] as Object[], "Another user has updated this Survey while you were editing")
					//render(view: "edit", model: [surveyInstance: surveyInstance])
					render(view: "step1_edit", model: [surveyInstance: surveyInstance, thisyear:thisyear, countryNames:countryNames])
					return
				}
			}

			surveyInstance.properties = params
			//if (surveyInstance.save(flush: true)) {
			if (!surveyInstance.hasErrors() && surveyInstance.save(validate: false, flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'survey.label', default: 'Survey'), surveyInstance.id])}"
				//redirect(action: "show", id: surveyInstance.id)
				redirect(action: "step2", id: surveyInstance.id)
			}
			else {
				flash.message = "Not saved... Something wrong here..."
				render(view: "step1_edit", model: [surveyInstance: surveyInstance, thisyear:thisyear, countryNames:countryNames])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}

	}
	def step3 ={
		def surveyInstance = Survey.get(params.id)
		if (!surveyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [surveyInstance: surveyInstance]
		}
	}

	def step4={
		def surveyInstance = Survey.get(params.id)
		if (!surveyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
			def today = new Date()
			def thisyear=today[YEAR]
			return [surveyInstance: surveyInstance, thisyear:thisyear]
		}
	}

	def step5={
		def surveyInstance = Survey.get(params.id)
		if (!surveyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [surveyInstance: surveyInstance]
		}
	}

	def step6={
		def surveyInstance = Survey.get(params.id)
		if (!surveyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [surveyInstance: surveyInstance]
		}
	}

	def step7={
		def surveyInstance = Survey.get(params.id)

		def today = new Date()
		def thisyear=today[YEAR]

		if (!surveyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [surveyInstance: surveyInstance, thisyear:thisyear]
		}
	}

	def step8={
		def surveyInstance = Survey.get(params.id)
		def today = new Date()
		def thisyear=today[YEAR]
		if (!surveyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [surveyInstance: surveyInstance, thisyear:thisyear]
		}
	}

	def step9={
		def surveyInstance = Survey.get(params.id)
		def today = new Date()
		def thisyear=today[YEAR]
		if (!surveyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [surveyInstance: surveyInstance, thisyear:thisyear]
		}
	}

	def step10={
		def surveyInstance = Survey.get(params.id)
		def today = new Date()
		def thisyear=today[YEAR]
		if (!surveyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [surveyInstance: surveyInstance, thisyear:thisyear]
		}
	}

	def step11={
		def surveyInstance = Survey.get(params.id)
		if (!surveyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [surveyInstance: surveyInstance]
		}
	}

	def step12={
		def surveyInstance = Survey.get(params.id)
		def today = new Date()
		def thisyear=today[YEAR]
		if (!surveyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [surveyInstance: surveyInstance, thisyear:thisyear]
		}
	}

	def step13={
		def surveyInstance = Survey.get(params.id)
		if (!surveyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [surveyInstance: surveyInstance]
		}
	}

	def step14={
		def surveyInstance = Survey.get(params.id)
		def today = new Date()
		def thisyear=today[YEAR]
		if (!surveyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [surveyInstance: surveyInstance, thisyear:thisyear]
		}
	}

	def step15={
		def countries = [] as SortedSet
		def countryNames = [:] // map
		
		Locale.ISOCountries.each {
		  if (it) {
			countries << it
		  }
		}
		countries.each{twolettercode->
			Locale l= new Locale("", twolettercode);
			countryNames.put(twolettercode, l.getDisplayCountry())
		}
		countryNames.remove("US")
		countryNames.remove("PR")
		countryNames=["PR":"PUERTO RICO", "US":"UNITED STATES", "--":"--"]+countryNames.sort{it.value}
		
		def surveyInstance = Survey.get(params.id)
		if (!surveyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [surveyInstance: surveyInstance, countryNames:countryNames]
		}
	}

	def preview={
		def countries = [] as SortedSet
		def countryNames = [:] // map
		
		Locale.ISOCountries.each {
		  if (it) {
			countries << it
		  }
		}
		countries.each{twolettercode->
			Locale l= new Locale("", twolettercode);
			countryNames.put(twolettercode, l.getDisplayCountry())
		}
		countryNames.remove("US")
		countryNames.remove("PR")
		countryNames=["PR":"PUERTO RICO", "US":"UNITED STATES", "--":"--"]+countryNames.sort{it.value}
		
		def today = new Date()
		//today=today.minusYears(18) // subject should be 18 years old or more
		def thisyear=today[YEAR]
		
		def surveyInstance = Survey.get(params.id)

		if (!surveyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [surveyInstance: surveyInstance, countryNames:countryNames, thisyear:thisyear]
		}
	}
	def print={
		def countries = [] as SortedSet
		def countryNames = [:] // map
		
		Locale.ISOCountries.each {
		  if (it) {
			countries << it
		  }
		}
		countries.each{twolettercode->
			Locale l= new Locale("", twolettercode);
			countryNames.put(twolettercode, l.getDisplayCountry())
		}
		countryNames.remove("US")
		countryNames.remove("PR")
		countryNames=["PR":"PUERTO RICO", "US":"UNITED STATES", "--":"--"]+countryNames.sort{it.value}
		
		def today = new Date()
		//today=today.minusYears(18) // subject should be 18 years old or more
		def thisyear=today[YEAR]
		
		def surveyInstance = Survey.get(params.id)
				
		if (!surveyInstance) {
			//flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			//redirect(action: "list")
			//flash.message = "Save as PDF / Print / Fill in the form"
			flash.print = "print"
			surveyInstance = new Survey()
			
			return [surveyInstance: surveyInstance, countryNames:countryNames, thisyear:thisyear]
		}
		else {
			return [surveyInstance: surveyInstance, countryNames:countryNames, thisyear:thisyear]
		}
	}
	def verify={
		def countries = [] as SortedSet
		def countryNames = [:] // map
		
		Locale.ISOCountries.each {
		  if (it) {
			countries << it
		  }
		}
		countries.each{twolettercode->
			Locale l= new Locale("", twolettercode);
			countryNames.put(twolettercode, l.getDisplayCountry())
		}
		countryNames.remove("US")
		countryNames.remove("PR")
		countryNames=["PR":"PUERTO RICO", "US":"UNITED STATES", "--":"--"]+countryNames.sort{it.value}
		
		def today = new Date()
		//today=today.minusYears(18) // subject should be 18 years old or more
		def thisyear=today[YEAR]
		
		def surveyInstance = Survey.get(params.id)

		if (!surveyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [surveyInstance: surveyInstance, countryNames:countryNames, thisyear:thisyear]
		}
	}

	def verify_after_update={
		def surveyInstance = Survey.get(params.id)
		if (surveyInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (surveyInstance.version > version) {
					
					surveyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'survey.label', default: 'Survey')] as Object[], "Another user has updated this Survey while you were editing")
					render(view: "step15", model: [surveyInstance: surveyInstance, thisyear:thisyear])
					return
				}
			}
			surveyInstance.surveyer=session.user.login
			surveyInstance.step="15"
			surveyInstance.properties = params
			if (!surveyInstance.hasErrors() && surveyInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'survey.label', default: 'Survey'), surveyInstance.id])}"
				//redirect(action: "show", id: surveyInstance.id)
				redirect(action: "verify", id: surveyInstance.id)
			}
			else {
				render(view: "step15", model: [surveyInstance: surveyInstance, thisyear:thisyear])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
	}
	def preview_after_update={
		def surveyInstance = Survey.get(params.id)
		if (surveyInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (surveyInstance.version > version) {
					
					surveyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'survey.label', default: 'Survey')] as Object[], "Another user has updated this Survey while you were editing")
					render(view: "step15", model: [surveyInstance: surveyInstance, thisyear:thisyear])
					return
				}
			}
			surveyInstance.surveyer=session.user.login
			surveyInstance.step="15"
			surveyInstance.properties = params
			if (!surveyInstance.hasErrors() && surveyInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'survey.label', default: 'Survey'), surveyInstance.id])}"
				//redirect(action: "show", id: surveyInstance.id)
                                log.info " Updated/Verify  by "+session.user.login+"(Step "+surveyInstance.step+" of ICN="+surveyInstance.consentNum+" id="+surveyInstance.id+")"
				redirect(action: "preview", id: surveyInstance.id)
			}
			else {
				render(view: "step15", model: [surveyInstance: surveyInstance, thisyear:thisyear])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
	}

	def done={ // copied from show
		redirect(action: "show", id:params.id)
	}

	def completed = {

		//def surveyCompletedInstance = new SurveyCompleted()
		def surveyInstance = Survey.get(params.id)
      
		if (surveyInstance) {
			
            if (params.version) {
                def version = params.version.toLong()
                if (surveyInstance.version > version) {
                    
                    surveyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'survey.label', default: 'Survey')] as Object[], "Another user has updated this Survey while you were editing")
                    render(view: "show", model: [surveyInstance: surveyInstance])
                    return
                }
            }
            
            surveyInstance.properties = params
			surveyInstance.completed=true
			surveyInstance.step='completed'
			surveyInstance.completedBy = session.user.login
			surveyInstance.dateCompleted=new Date()
			
			//surveyCompletedInstance.properties = params
			//surveyCompletedInstance.completed=true
			//surveyCompletedInstance.step='completed'
			//surveyCompletedInstance.completedBy = session.user.login
			
            //if (!surveyInstance.hasErrors() && surveyInstance.save(flush: true) && surveyCompletedInstance.save(flush: true)) {
	if (!surveyInstance.hasErrors() && surveyInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'survey.label', default: 'Survey'), surveyInstance.id])}"
                //redirect(action: "show", id: surveyInstance.id)
                log.info "Verified/OK  by "+session.user.login+"(Step "+surveyInstance.step+" of ICN="+surveyInstance.consentNum+" id="+surveyInstance.id+")"
				redirect(action: "thankyou")
            }
            else {
                //render(view: "edit", model: [surveyInstance: surveyInstance])
                flash.message = "The survey has not been submitted successfully. Please try again. If the problem does not go away, please contact administrator."
                log.error "Verified/ERROR  by "+session.user.login+"(Step "+surveyInstance.step+" of ICN="+surveyInstance.consentNum+" id="+surveyInstance.id+")"
				redirect(action: "preview", id: surveyInstance.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
            redirect(action: "list")
        }
	}
	def thankyou={}
	def calendarview={
		
		session.step=''
		params.max = Math.min(params.max ? params.int('max') : Survey.count(), Survey.count())
		
		if( session?.user?.role == "surveyer" ){
			def selectedSurveys=getSurveyList(session.user.login, params)
			def surveySize=u56survey.Survey.countBySurveyer(session.user.login)
			
			[surveyInstanceList: selectedSurveys, surveyInstanceTotal: surveySize]
		}
		else if( session?.user?.role == "admin" ){
			[surveyInstanceList: Survey.list(params), surveyInstanceTotal: Survey.count()]
		}
	}

    def update = {
        def surveyInstance = Survey.get(params.id)
        if (surveyInstance) {
			
            if (params.version) {
                def version = params.version.toLong()
                if (surveyInstance.version > version) {
                    
                    surveyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'survey.label', default: 'Survey')] as Object[], "Another user has updated this Survey while you were editing")
                    render(view: "show", model: [surveyInstance: surveyInstance])
                    return
                }
            }
            if (params.consentNum && params.consentNum.isNumber()){
		params.consentNumInt=Integer.toString(params.consentNum.toInteger())
            }

             surveyInstance.properties = params

            //surveyInstance.surveyer=session.user.login
             surveyInstance.updatedBy = session.user.login
            if (session.step!='') surveyInstance.step=session.step.toString()
			
	    if (!surveyInstance.hasErrors() && surveyInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'survey.label', default: 'Survey'), surveyInstance.id])}"
                log.info "Updated  by "+session.user.login+"(Step "+surveyInstance.step+" of ICN="+surveyInstance.consentNum+" id="+surveyInstance.id+")"
                redirect(action: "show", id: surveyInstance.id)
            }
            else {
		flash.message = "***** Inputs cannot be saved due to error(s). Try again. *****"
                //render(view: "edit", model: [surveyInstance: surveyInstance])
				//redirect(action: "show", id: surveyInstance.id)
                surveyInstance.step=='1' ? render(view: ("step1_edit"), model: [surveyInstance: surveyInstance, thisyear:thisyear, countryNames:countryNames]) : render(view: ("step"+surveyInstance.step), model: [surveyInstance: surveyInstance, thisyear:thisyear, countryNames:countryNames])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
            redirect(action: "list")
        }
    }
	def update_unified = {
		def currentStep =  session.step!='' && session.step ? session.step.toInteger() : 1
		def nextStep=currentStep+1
		


		def countries = [] as SortedSet
		def countryNames = [:]
		
		Locale.ISOCountries.each {
		  if (it) {
			countries << it
		  }
		}
		countries.each{twolettercode->
			Locale l= new Locale("", twolettercode);
			countryNames.put(twolettercode, l.getDisplayCountry())
		}
		countryNames.remove("US")
		countryNames.remove("PR")
		countryNames=["PR":"PUERTO RICO", "US":"UNITED STATES", "--":"--"]+countryNames.sort{it.value}
		
		def surveyInstance = Survey.get(params.id)
		if (surveyInstance) {
			
			if (currentStep==6 && surveyInstance.sex=='female') nextStep=8
			else if (currentStep==8 && surveyInstance.sex=='male') nextStep=12
			
			if (params.version) {
				def version = params.version.toLong()
				if (surveyInstance.version > version) {
					
					surveyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'survey.label', default: 'Survey')] as Object[], "Another user has updated this Survey while you were editing")
					render(view: ("step"+currentStep), model: [surveyInstance: surveyInstance, thisyear:thisyear, countryNames:countryNames])
					return
				}
			}
			
			if (params.consentNum){
				params.consentNumInt=Integer.toString(params.consentNum.toInteger())
			}
			
			surveyInstance.properties = params
			
			//surveyInstance.surveyer=session.user.login // when ever updated, save the surveyer (loggined user)
			surveyInstance.updatedBy = session.user.login
			surveyInstance.step=currentStep
			
			if (!surveyInstance.hasErrors() && surveyInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'survey.label', default: 'Survey'), surveyInstance.id])}"
				//redirect(action: "show", id: surveyInstance.id)
                                
                                log.info "Updated/Next-"+session.user.login+"-ID:"+surveyInstance.id+"-Step:"+surveyInstance.step+"-"+params
				
				if (currentStep==8 && surveyInstance.sex=='male')
					redirect(action: "step11", fragment: "step11b", id: surveyInstance.id)
				else
					redirect(action: ("step"+nextStep), id: surveyInstance.id)
			}
			else {
				flash.message = "Inputs cannot be saved due to error(s). Try again."
				render(view: ("step"+currentStep), model: [surveyInstance: surveyInstance, thisyear:thisyear, countryNames:countryNames])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
	}
        
	def ajaxValidICNorNot={
		def whatEntered = params['icnEntered']
                def siteEntered = params['siteEntered']
		def resultOut = ""
		if (whatEntered.isNumber()){
			def whatNumber = whatEntered.toInteger()
			if (whatNumber >=1 && whatNumber <10000){
				//resultOut = Survey.findByConsentNum(whatEntered) ? "Existing ICN" : "Valid"
				
				//resultOut = Survey.findByConsentNum(whatEntered) ? message(code: 'existing.icn', default: 'Existing ICN') : ""
				
				resultOut = Survey.findByConsentNumAndConsentNumLoc(whatEntered, siteEntered) || Survey.findByConsentNumIntAndConsentNumLoc(whatNumber, siteEntered) ? message(code: 'existing.icn', default: 'Existing ICN') : ""
			}
			else
				resultOut = "1 ~ 9999"
		}
		else 
			resultOut = message(code: 'step1.err.msgs.icn', default: 'Number Only')
		//render params['icnEntered']
		render "<font color='red'>"+resultOut+"</font>"
	}
}

	/*
    def create = {
        def surveyInstance = new Survey()
        surveyInstance.properties = params
        return [surveyInstance: surveyInstance]
    }

    def save = {
        def surveyInstance = new Survey(params)
        if (surveyInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'survey.label', default: 'Survey'), surveyInstance.id])}"
            redirect(action: "show", id: surveyInstance.id)
        }
        else {
            //render(view: "create", model: [surveyInstance: surveyInstance])
			render(view: "step1", model: [surveyInstance: surveyInstance, thisyear:thisyear])
        }
    }

    def edit = {
        def surveyInstance = Survey.get(params.id)
        if (!surveyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [surveyInstance: surveyInstance]
        }
    }

    def delete = {
        def surveyInstance = Survey.get(params.id)
        if (surveyInstance) {
            try {
                surveyInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
            redirect(action: "list")
        }
    }
    */
/*
	def pdf ={
		def countries = [] as SortedSet
		def countryNames = [:] // map
		
		Locale.ISOCountries.each {
		  if (it) {
			countries << it
		  }
		}
		countries.each{twolettercode->
			Locale l= new Locale("", twolettercode);
			countryNames.put(twolettercode, l.getDisplayCountry())
		}
		countryNames.remove("US")
		countryNames.remove("PR")
		countryNames=["PR":"PUERTO RICO", "US":"UNITED STATES", "--":"--"]+countryNames.sort{it.value}
		
		def today = new Date()
		def thisyear=today[YEAR]
		
		def surveyInstance = Survey.get(params.id)
		if (!surveyInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
					renderPdf(template: 'preview', model:[surveyInstance: surveyInstance, countryNames:countryNames, thisyear:thisyear])
		}


	}
*/
