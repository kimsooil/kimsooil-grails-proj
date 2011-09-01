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

	Map global_labels =["id":"id", "dateCreated":"Created", "lastUpdated":"Updated", "surveyer":"consenter", "completed":"completedOrNot","consentNum":"icn", "consentNumSurv":"surveyName","consentNumLoc":"site","mrn":"mrn",
		"being_treated_for_cancer":"q0_Are_you_currently_being_treated_for_cancer", "sex":"q1_sex", "DOB":"q1_Date_of_Birth", "race":"q2_race","other_race":"q2_other_race",
		"hispanic_or_latino":"q3_Do_you_consider_yourself_Hispanic_or_Latino",
		"addr_street1":"q4_Street1", "addr_street2":"q4_Street2", "addr_city":"q4_City", "addr_state":"q4_State", "addr_zipcode":"q4_Zip", "country":"q5_Country",
		"marital_status":"q6_marital_status", "education":"q7_education",	"current_occupation":"q8_current_occupation", "current_occupation_time":"q8_current_occupation_years", "prior_job":"q9_prior_job", "prior_job_time":"q9_prior_job_time",
		"q8_1":"q10_chemical", "q8_1_which":"q10_which_chemical", "q8_2":"q10_silica","q8_3":"q10_asbestos", "q8_4":"q10_industrial_wastes","q8_4_which":"q10_which_wastes", "q8_5":"q10_construction", "q8_others":"q10_other_occupational_exposure",
		"weight":"q11_weight_pounds", "height_feet":"q12_height_feet", "height_inches":"q12_height_inches",
		"q11a_hep_donotknow_type":"q13_hep_do_not_know_type", "q11a_hep_donotknow_type_Year":"q13_hep_do_not_know_type_year", "q11a_1":"q13_hepA", "q11a_1Year":"q13_hepA_year","q11a_2":"q13_hepB", "q11a_2Year":"q13_hepB_year","q11a_3":"q13_hepC", "q11a_3Year":"q13_hepC_year",
		"q11a_4":"q13_hpv", "q11a_4Year":"q13_hpv_year","q11a_5":"q13_hiv", "q11a_5Year":"q13_hiv_year","q11a_6":"q13_helico", "q11a_6Year":"q13_helico_year",
			 
		"haveCancer":"q14_have_you_ever_told_by_doctor_you_have_cancer",
		"q12_1_ageDiagnosed":"q15_1_ageDiagnosed", "q12_1_1":"q15_1_radio", "q12_1_2":"q15_1_chemo", "q12_1_3":"q15_1_surgery", "q12_1_4":"q15_1_none",
		"q12_2_ageDiagnosed":"q15_2_ageDiagnosed", "q12_2_1":"q15_2_radio", "q12_2_2":"q15_2_chemo", "q12_2_3":"q15_2_surgery", "q12_2_4":"q15_2_none",
		"q12_3_ageDiagnosed":"q15_3_ageDiagnosed", "q12_3_1":"q15_3_radio", "q12_3_2":"q15_3_chemo", "q12_3_3":"q15_1_surgery", "q12_3_4":"q15_3_none",
		"q12_4_ageDiagnosed":"q15_4_ageDiagnosed", "q12_4_1":"q15_4_radio", "q12_4_2":"q15_4_chemo", "q12_4_3":"q15_4_surgery", "q12_4_4":"q15_4_none",
		"q12_5_ageDiagnosed":"q15_5_ageDiagnosed", "q12_5_1":"q15_5_radio", "q12_5_2":"q15_5_chemo", "q12_5_3":"q15_5_surgery", "q12_5_4":"q15_5_none",
		"q12_6_ageDiagnosed":"q15_6_ageDiagnosed", "q12_6_1":"q15_6_radio", "q12_6_2":"q15_6_chemo", "q12_6_3":"q15_6_surgery", "q12_6_4":"q15_6_none",
		"q12_7_ageDiagnosed":"q15_7_ageDiagnosed", "q12_7_1":"q15_7_radio", "q12_7_2":"q15_7_chemo", "q12_7_3":"q15_7_surgery", "q12_7_4":"q15_7_none",
		"q12_8_ageDiagnosed":"q15_8_ageDiagnosed", "q12_8_1":"q15_8_radio", "q12_8_2":"q15_8_chemo", "q12_8_3":"q15_8_surgery", "q12_8_4":"q15_8_none",
		"q12_9_ageDiagnosed":"q15_9_ageDiagnosed", "q12_9_1":"q15_9_radio", "q12_9_2":"q15_9_chemo", "q12_9_3":"q15_9_surgery", "q12_9_4":"q15_9_none",
		"q12_10_ageDiagnosed":"q15_10_ageDiagnosed", "q12_10_1":"q15_10_radio", "q12_10_2":"q15_10_chemo", "q12_10_3":"q15_10_surgery", "q12_10_4":"q15_10_none",
		"q12_11_ageDiagnosed":"q15_11_ageDiagnosed", "q12_11_1":"q15_11_radio", "q12_11_2":"q15_11_chemo", "q12_11_3":"q15_11_surgery", "q12_11_4":"q15_11_none",
		"q12_12_ageDiagnosed":"q15_12_ageDiagnosed", "q12_12_1":"q15_12_radio", "q12_12_2":"q15_12_chemo", "q12_12_3":"q15_12_surgery", "q12_12_4":"q15_12_none",
		"q12_13_ageDiagnosed":"q15_13_ageDiagnosed", "q12_13_1":"q15_13_radio", "q12_13_2":"q15_13_chemo", "q12_13_3":"q15_13_surgery", "q12_13_4":"q15_13_none",
		"q12_14_ageDiagnosed":"q15_14_ageDiagnosed", "q12_14_1":"q15_14_radio", "q12_14_2":"q15_14_chemo", "q12_14_3":"q15_14_surgery", "q12_14_4":"q15_14_none",
		"q12_15_ageDiagnosed":"q15_15_ageDiagnosed", "q12_15_1":"q15_15_radio", "q12_15_2":"q15_15_chemo", "q12_15_3":"q15_15_surgery", "q12_15_4":"q15_15_none",
		"q12_16_ageDiagnosed":"q15_16_ageDiagnosed", "q12_16_1":"q15_16_radio", "q12_16_2":"q15_16_chemo", "q12_16_3":"q15_16_surgery", "q12_16_4":"q15_16_none",
		"q12_17_ageDiagnosed":"q15_17_ageDiagnosed", "q12_17_1":"q15_17_radio", "q12_17_2":"q15_17_chemo", "q12_17_3":"q15_17_surgery", "q12_17_4":"q15_17_none",
		"q12_18_ageDiagnosed":"q15_18_ageDiagnosed", "q12_18_1":"q15_18_radio", "q12_18_2":"q15_18_chemo", "q12_18_3":"q15_18_surgery", "q12_18_4":"q15_18_none",
		"q12_19_ageDiagnosed":"q15_19_ageDiagnosed", "q12_19_1":"q15_19_radio", "q12_19_2":"q15_19_chemo", "q12_19_3":"q15_19_surgery", "q12_19_4":"q15_19_none",
		"q12_20_ageDiagnosed":"q15_20_ageDiagnosed", "q12_20_1":"q15_20_radio", "q12_20_2":"q15_20_chemo", "q12_20_3":"q15_20_surgery", "q12_20_4":"q15_20_none",
		"q12_21_ageDiagnosed":"q15_21_ageDiagnosed", "q12_21_1":"q15_21_radio", "q12_21_2":"q15_21_chemo", "q12_21_3":"q15_21_surgery", "q12_21_4":"q15_21_none",
		"q12_22_ageDiagnosed":"q15_22_ageDiagnosed", "q12_22_1":"q15_22_radio", "q12_22_2":"q15_22_chemo", "q12_22_3":"q15_22_surgery", "q12_22_4":"q15_22_none",
		"q12_23_ageDiagnosed":"q15_23_ageDiagnosed", "q12_23_1":"q15_23_radio", "q12_23_2":"q15_23_chemo", "q12_23_3":"q15_23_surgery", "q12_23_4":"q15_23_none",
		"q12_24_ageDiagnosed":"q15_24_ageDiagnosed", "q12_24_1":"q15_24_radio", "q12_24_2":"q15_24_chemo", "q12_24_3":"q15_24_surgery", "q12_24_4":"q15_24_none",
		"q12_which_cancer":"q15_24_which_cancer",
		"spread_cancer":"q16_have_been_told_your_cancer_spread",
		"spread_liver":"q17_spread_liver", "spread_brain":"q17_spread_brain", "spread_lung":"q17_spread_lung", "spread_bone":"q17_spread_bone", "spread_other":"q17_spread_other",
		"spread_where":"q17_spread_where",
		"familyHaveCancer":"q18_familyHaveCancer",
		"q13_1_cancerType":"q18_mother_cancerType",
		"q13_1_ageDiagnosed":"q18_mother_ageDiagnosed",
		"q13_2_cancerType":"q18_father_cancerType",
		"q13_2_ageDiagnosed":"q18_father_ageDiagnosed",
		"q13_3_cancerType":"q18_sister_cancerType",
		"q13_3_ageDiagnosed":"q18_sister_ageDiagnosed",
		"q13_4_cancerType":"q18_brother_cancerType",
		"q13_4_ageDiagnosed":"q18_brother_ageDiagnosed",
		"q13_5_cancerType":"q18_daugther_cancerType",
		"q13_5_ageDiagnosed":"q18_daugther_ageDiagnosed",
		"q13_6_cancerType":"q18_son_cancerType",
		"q13_6_ageDiagnosed":"q18_son_ageDiagnosed",
		"q13_7_cancerType":"q18_m_grandmother_cancerType",
		"q13_7_ageDiagnosed":"q18_m_grandmother_ageDiagnosed",
		"q13_8_cancerType":"q18_m_grandfather_cancerType",
		"q13_8_ageDiagnosed":"q18_m_grandfather_ageDiagnosed",
		"q13_9_cancerType":"q18_m_aunt_cancerType",
		"q13_9_ageDiagnosed":"q18_m_aunt_ageDiagnosed",
		"q13_10_cancerType":"q18_m_uncle_cancerType",
		"q13_10_ageDiagnosed":"q18_m_uncle_ageDiagnosed",
		"q13_11_cancerType":"q18_p_grandmother_cancerType",
		"q13_11_ageDiagnosed":"q18_p_grandmother_ageDiagnosed",
		"q13_12_cancerType":"q18_p_grandfather_cancerType",
		"q13_12_ageDiagnosed":"q18_p_grandfather_ageDiagnosed",
		"q13_13_cancerType":"q18_p_aunt_cancerType",
		"q13_13_ageDiagnosed":"q18_p_aunt_ageDiagnosed",
		"q13_14_cancerType":"q18_p_uncle_cancerType",
		"q13_14_ageDiagnosed":"q18_p_uncle_ageDiagnosed",
		"q13_15_cancerType":"q18_other_cancerType",
		"q13_15_ageDiagnosed":"q18_other_ageDiagnosed",
		"q13_other_family_member":"q18_other_family_member",
		"q14_1":"q19_beer","q14_1_howManyPerWeek":"q19_beer_drinks_a_week",
		"q14_2":"q19_wine", "q14_2_howManyPerWeek":"q19_wine_drinks_a_week",
		"q14_3":"q19_hard_liquor", "q14_3_howManyPerWeek":"q19_hard_liquor_drinks_a_week",
		"q15_1":"q20_1_chewing_tobacco", "q15_1_howManyTimesPerWeek":"q20_1_howManyTimesPerWeek", "q15_1_howManyYears":"q20_1_howManyYears",
		"q15_2":"q20_2_snuff_dip","q15_2_howManyTimesPerWeek":"q20_2_howManyTimesPerWeek","q15_2_howManyYears":"q20_2_howManyYears",
		"q15_3":"q20_3_pipe","q15_3_howManyTimesPerWeek":"q20_3_howManyTimesPerWeek","q15_3_howManyYears":"q20_3_howManyYears",
		"q15_4":"q20_4_cigar","q15_4_howManyTimesPerWeek":"q20_4_howManyTimesPerWeek","q15_4_howManyYears":"q20_4_howManyYears",
		"q16":"q21_smoke_100_cigarettes",
		"q17":"q22_at_what_age_begin_smoking",
		"q18":"q23_total_years_of_smoking",
		"q19":"q24_average_cigarettes_smoke_a_day",
		"stillSmoke":"q25_still_smoke",
		"q21DateStopSmoking":"q26_date_stop_smoking",
		"q21_whenStopSmoking_years":"q26_how_long_ago_stop_smoking_years",
		"q21_whenStopSmoking_months":"q26_how_long_ago_stop_smoking_months",
		"q22_1":"q27_running_freq",
		"q22_2":"q27_walking_freq",
		"q22_3":"q27_swimming_freq",
		"q22_4":"q27_aerobics_freq",
		"q22_5":"q27_weightlifting_freq",
		"q22_6":"q27_bicycling_freq",
		"q22_7":"q27_gymnastics_freq",
		"q22_8":"q27_other_freq",
		"q22_others":"q27_other_activity",
		"levelOfActivity":"q28_level_of_activity",
		"q24_howDoYouFeelRightNow":"q29_howDoYouFeelRightNow",
		"q25_howHaveYouFeltForPast4Weeks":"q30_howHaveYouFeltForPast4Weeks",
		"q26":"q31_have_any_health_problem",
		"q26_explain":"q31_explain",
		"q27":"q32_does_health_affect_social_activity",
		"q28":"q33_how_is_your_health",
		"q29_1":"q34_depression",
		"q29_2":"q34_dementia",
		"q29_3":"q34_schizophrenia",
		"q29_4":"q34_attention_deficit",
		"q29_5":"q34_manic_depressive",
		"q29_6":"q34_obsessive_compulsive",
		"q29_7":"q34_other",
		"q29_other":"q34_other_psychological_problem",
		"q30_1":"q35_painful_urination",
		"q30_2":"q35_difficulty_starting_urine_stream",
		"q30_3":"q35_blood_in_urine",
		"q30_4":"q35_sensation_of_not_emptying_bladder_after_finish_urinating",
		"q30_5":"q35_urinating_more_than_once_every_two_hours",
		"q30_6":"q35_getting_up_more_than_once_a_night_to_urinate",
		"q31_1":"q36_prostatitis",
		"q31_2":"q36_enlarged_prostate",
		"q31_3":"q36_needed_prostate_biopsy",
		"q32":"q37_had_rectal_exam",
		"date_rectal_exam":"q37_date_rectal_exam",
		"findings_rectal_exam":"q37_rectal_exam_findings",
		"q33":"q38_had_PSA_test",
		"date_most_recent_PSA_test":"q38_date_most_recent_PSA_test",
		"results_PSA_test":"q38_PSA_test_results",
		"q34":"q39_have_erectile_dysfunction",
		"q35":"q40_have_digestive_tract_problem",
		"q36_1":"q41_change_in_bowel_habit",
		"q36_2":"q41_change_in_stool_color",
		"q36_3":"q41_constipation",
		"q36_4":"q41_fine_stool",
		"q36_5":"q41_blood_in_stool",
		"q36_6":"q41_black_stool",
		"q37":"q42_have_rectal_bleeding",
		"q37_what":"q42_rectal_bleeding_type",
		"q38":"q43_pain_rectal_bleeding",
		"q39":"q44_whether_recommended_fecal_occult_blood_test",
		"q40":"q45_result_fecal_occult_blood_test",
		"q41":"q46_have_digital_rectal_exam",
		"date_digital_rectal_exam":"q46_date_digital_rectal_exam",
		"q42":"q47_have_sigmoidoscopy_or_colonoscopy",
		"date_sigmoidoscopy_colonoscopy":"q47_date_sigmoidoscopy_colonoscopy",
		"q42_1":"q47_normal",
		"q42_2":"q47_ulcers",
		"q42_3":"q47_tumor",
		"q42_4":"q47_diverticulitis",
		"q42_5":"q47_colitis",
		"q42_6":"q47_fistula",
		"q42_7":"q47_hemorrhoids",
		"q42_8":"q47_polyps",
		"q43":"q48_biopsy_performed_during_sigmoidoscoopy_or_colonoscopy",
		"q43_biopsy_results":"q48_biopsy_results",
		"q44":"q49_have_anemia",
		"q44_hemoglobin_levels":"q49_hemoglobin_levels",
		"q45_1":"q50_irregular_menstrual_cycles",
		"q45_2":"q50_significant_weight_change",
		"q45_3":"q50_abdominal_inflammation",
		"q45_4":"q50_pelvic_discomfort",
		"q45_5":"q50_vaginal_bleeding",
		"q45_6":"q50_back_pain",
		"q45_7":"q50_increased_abdominal_size",
		"q46_1":"q51_increased_gas_production",
		"q46_2":"q51_lack_of_appetite",
		"q46_3":"q51_indigestion",
		"q46_4":"q51_nausea_vomiting",
		"q46_5":"q51_abdominal_distention",
		"q46_6":"q51_increased_urinating_freq",
		"q46_7":"q51_other",
		"q47":"q52_how_often_visit_gynecologist",
		"q48_date_last_visit_gynecologist":"q53_last_visit_to_gynecologist",
		"q49":"q54_have_pelvic_exam",
		"q49_findings_pelvic_exam":"q54_findings_pelvic_exam",
		"q50":"q55_have_digital_rectal_exam",
		"q50_findings_digital_rectal_exam":"q55_findings_digital_rectal_exam",
		"q51":"q56_whether_doctor_order_any_diagnostic_test",
		"q51_1":"q56_CA125",
		"q51_1_date":"q56_CA125_date",
		"q51_1_result":"q56_CA125_result",
		"q51_2":"q56_alpha_fetoprotein",
		"q51_2_date":"q56_alpha_fetoprotein_date",
		"q51_2_result":"q56_alpha_fetoprotein_result",
		"q51_3":"q56_quantitativeHCG",
		"q51_3_date":"q56_quantitativeHCG_date",
		"q51_3_result":"q56_quantitativeHCG_result",
		"q51_4":"q56_sonogram",
		"q51_4_date":"q56_sonogram_date",
		"q51_4_result":"q56_sonogram_result",
		"q51_5":"q56_barium_enema",
		"q51_5_date":"q56_barium_enema_date",
		"q51_5_result":"q56_barium_enema_result",
		"q51_6":"q56_intravenous_pyelogram",
		"q51_6_date":"q56_intravenous_pyelogram_date",
		"q51_6_result":"q56_intravenous_pyelogram_result",
		"q52":"q57_have_pap_smear",
		"q52_date_most_recent_pap_smear":"q57_date_most_recent_pap_smear",
		"q52_results_pap_smear":"q57_results_pap_smear",
		"q53":"q58_have_fertility_medication",
		"q53_medication_fertility":"q58_which_fertility_medication",
		"q53_how_long_use_fertility_medication":"q58_how_long_use_fertility_medication",
		"q54":"q59_atWhatAge_first_menstruation",
		"q55":"q60_howOften_menstrual_cycle_days",
		"q56":"q61_howManyDays_bleeding_last",
		"q57":"q62_bled_between_menstrual_periods",
		"q58":"q63_have_pain_during_menstrual_periods",
		"q59":"q64_have_uterus_been_removed",
		"q59_why":"q64_why",
		"q59_whatAge":"q64_whatAge",
		"q60":"q65_have_endometriosis",
		"q61":"q66_endometriosis_diagnosed_by_surgery",
		"q61_whatAge":"q66__whatAge",
		"q62":"q67_ovaries_removed",
		"q63":"q68_both_ovaries_removed",
		"q64":"q69_why_ovaries_removed",
		"q65":"q70_whatAge_ovaries_removed",
		"q66":"q71_in_menopause",
		"q67":"q72_going_through_menopause",
		"q68":"q73_whatAge_menopause_start",
		"q69":"q74_take_prescribed_hormones",
		"q69_which":"q74_which",
		"q69_forWhat":"q74_forWhat",
		"q69_whatAgeStarted":"q74_whatAgeStarted",
		"q70":"q75_have_mammogram_every_year",
		"q71":"q76_last_mammogram",
		
		"q72":"q77_have_ever_been_pregnant",
		"q73_alive":"q83_alive",
		"q73_dead":"q83_dead",
		"q73_miscarriage":"q83_miscarriage",
		"q74":"q79_whatAge_first_pregnancy",
		"q75":"q80_whatAge_first_child",
		"q76":"q81_how_many_children",
		"q77":"q82_breastfeed",
		"q78_1_week":"q83_1_week",
		"q78_1_month":"q83_1_month",
		"q78_2_week":"q83_2_week",
		"q78_2_month":"q83_2_month",
		"q78_3_week":"q83_3_week",
		"q78_3_month":"q83_3_month",
		"q78_4_week":"q83_4_week",
		"q78_4_month":"q83_4_month",
		"q78_5_week":"q83_5_week",
		"q78_5_month":"q83_5_month",
		"q78_6_week":"q83_6_week",
		"q78_6_month":"q83_6_month",
		"q78_7_week":"q83_7_week",
		"q78_7_month":"q83_7_month",
		"q78_8_week":"q83_8_week",
		"q78_8_month":"q83_8_month",
		"q78_9_week":"q83_9_week",
		"q78_9_month":"q83_9_month",
		"q78_10_week":"q83_10_week",
		"q78_10_month":"q83_10_month",
		"q79":"q84_take_estrogen",
		"q80":"q85_used_contraceptive_method",
		"q80_which":"q85_which",
		"q80_whatAge":"q85_whatAge",
		"q80_howLong":"q85_howLong_years",
		"q81":"q86_which_contraceptive_currently_using",
		"q81_other":"q86_other_contraceptive_method",
		"q82":"q87_diagnosed_any_family_member_breast_cancer",
		"q82_1":"q87_1_mother",
		"q82_2":"q87_2_father",
		"q82_3":"q87_3_sister",
		"q82_4":"q87_4_brother",
		"q82_5":"q87_5_daughter",
		"q82_6":"q87_6_son",
		"q82_7":"q87_7_m_grandmother",
		"q82_8":"q87_8_m_grandfather",
		"q82_9":"q87_9_m_aunt",
		"q82_10":"q87_10_m_uncle",
		"q82_11":"q87_11_p_grandmother",
		"q82_12":"q87_12_p_grandfather",
		"q82_13":"q87_13_p_aunt",
		"q82_14":"q87_14_p_uncle",
		"q82_15":"q87_15_other",
		"q82_1_type":"q87_1_type",
		"q82_2_type":"q87_2_type",
		"q82_3_type":"q87_3_type",
		"q82_4_type":"q87_4_type",
		"q82_5_type":"q87_5_type",
		"q82_6_type":"q87_6_type",
		"q82_7_type":"q87_7_type",
		"q82_8_type":"q87_8_type",
		"q82_9_type":"q87_9_type",
		"q82_10_type":"q87_10_type",
		"q82_11_type":"q87_11_type",
		"q82_12_type":"q87_12_type",
		"q82_13_type":"q87_13_type",
		"q82_14_type":"q87_14_type",
		"q82_15_type":"q87_15_type",
		"q82_1_whatAge":"q87_1_whatAge",
		"q82_2_whatAge":"q87_2_whatAge",
		"q82_3_whatAge":"q87_3_whatAge",
		"q82_4_whatAge":"q87_4_whatAge",
		"q82_5_whatAge":"q87_5_whatAge",
		"q82_6_whatAge":"q87_6_whatAge",
		"q82_7_whatAge":"q87_7_whatAge",
		"q82_8_whatAge":"q87_8_whatAge",
		"q82_9_whatAge":"q87_9_whatAge",
		"q82_10_whatAge":"q87_10_whatAge",
		"q82_11_whatAge":"q87_11_whatAge",
		"q82_12_whatAge":"q87_12_whatAge",
		"q82_13_whatAge":"q87_13_whatAge",
		"q82_14_whatAge":"q87_14_whatAge",
		"q82_15_whatAge":"q87_15_whatAge",
		"q82_1_aliveDead":"q87_1_aliveDead",
		"q82_2_aliveDead":"q87_2_aliveDead",
		"q82_3_aliveDead":"q87_3_aliveDead",
		"q82_4_aliveDead":"q87_4_aliveDead",
		"q82_5_aliveDead":"q87_5_aliveDead",
		"q82_6_aliveDead":"q87_6_aliveDead",
		"q82_7_aliveDead":"q87_7_aliveDead",
		"q82_8_aliveDead":"q87_8_aliveDead",
		"q82_9_aliveDead":"q87_9_aliveDead",
		"q82_10_aliveDead":"q87_10_aliveDead",
		"q82_11_aliveDead":"q87_11_aliveDead",
		"q82_12_aliveDead":"q87_12_aliveDead",
		"q82_13_aliveDead":"q87_13_aliveDead",
		"q82_14_aliveDead":"q87_14_aliveDead",
		"q82_15_aliveDead":"q87_15_aliveDead",
		"q82_others":"q87_others",
		
		"q83":"q88_exposed_to_radiation_treatment",
		"q84_1":"q89_1_tb",
		"q84_2":"q89_2_vertebral_column",
		"q84_3":"q89_3_chest",
		"q84_4":"q89_4_abdomen",
		"q84_5":"q89_5_acne",
		"q84_6":"q89_6_thymus",
		"q84_7":"q89_7_non_hodgkin",
		"q84_8":"q89_8_neck",
		"q84_9":"q89_9_fluoroscopic",
		"q84_10":"q89_10_another",
		"q84_another":"q89_another_place",
		"q84_1_rad_date":"q89_1_rad_date",
		"q84_2_rad_date":"q89_2_rad_date",
		"q84_3_rad_date":"q89_3_rad_date",
		"q84_4_rad_date":"q89_4_rad_date",
		"q84_5_rad_date":"q89_5_rad_date",
		"q84_6_rad_date":"q89_6_rad_date",
		"q84_7_rad_date":"q89_7_rad_date",
		"q84_8_rad_date":"q89_8_rad_date",
		"q84_9_rad_date":"q89_9_rad_date",
		"q84_10_rad_date":"q89_10_rad_date",
		"q84_1_whatAge":"q89_1_whatAge",
		"q84_2_whatAge":"q89_2_whatAge",
		"q84_3_whatAge":"q89_3_whatAge",
		"q84_4_whatAge":"q89_4_whatAge",
		"q84_5_whatAge":"q89_5_whatAge",
		"q84_6_whatAge":"q89_6_whatAge",
		"q84_7_whatAge":"q89_7_whatAge",
		"q84_8_whatAge":"q89_8_whatAge",
		"q84_9_whatAge":"q89_9_whatAge",
		"q84_10_whatAge":"q89_10_whatAge",
		
		"q85":"q90_on_diet",
		"q85_which":"q90_which_diet",
		"q85_sat_fat_1":"q90_sat_fat_poultry",
		"q85_sat_fat_2":"q90_sat_fat_fast_foods",
		"q85_sat_fat_3":"q90_sat_fat_pork",
		"q85_sat_fat_4":"q90_sat_fat_butter",
		"q85_sat_fat_5":"q90_sat_fat_fried_foods",
		"q85_sat_fat_6":"q90_sat_fat_ice_cream",
		"q85_sat_fat_7":"q90_sat_fat_cheese",
		"q85_sat_fat_8":"q90_sat_fat_lard",
		"q85_sat_fat_9":"q90_sat_fat_vegetable_oils",
		"q85_sat_fat_10":"q90_sat_fat_dairy_products",
		"q85_sat_fat_11":"q90_sat_fat_bacon",
		"q85_sat_fat_12":"q90_sat_fat_french_fries",
		"q85_sat_fat_13":"q90_sat_fat_red_meat",
		"q85_sat_fat_14":"q90_sat_fat_other",
		"q85_sat_fat_other":"q90_sat_fat_other_what",
		"q85_vege_1":"q90_vege_broccoli",
		"q85_vege_2":"q90_vege_carrots",
		"q85_vege_3":"q90_vege_cauliflower",
		"q85_vege_4":"q90_vege_spinach",
		"q85_vege_5":"q90_vege_lettuce",
		"q85_vege_6":"q90_vege_tomatoes",
		"q85_vege_7":"q90_vege_asparagus",
		"q85_vege_8":"q90_vege_beetroot",
		"q85_vege_9":"q90_vege_green_beans",
		"q85_vege_10":"q90_vege_pumpkin",
		"q85_vege_11":"q90_vege_gherkin",
		"q85_vege_12":"q90_vege_plantains",
		"q85_vege_13":"q90_vege_beans",
		"q85_vege_14":"q90_vege_other",
		"q85_vege_other":"q90_vege_other_what",
		"q86":"q91_taken_vitamins_or_minerals_last_five_years",
		"q87":"q92_currently_taking_vitamins_or_minerals",
		"q88":"q93_howOften_take_vitamins_or_minerals",
		"q89_1":"q94_multi_vitamins",
		"q89_2":"q94_vita_A",
		"q89_3":"q94_vita_B",
		"q89_4":"q94_vita_C",
		"q89_5":"q94_vita_C",
		"q89_6":"q94_vita_E",
		"q89_7":"q94_calcium",
		"q89_8":"q94_beta_carotene",
		"q89_other":"q94_other",
		
		"q90_1":"q95_1_asthma",
		"q90_2":"q95_2_chronic_bronchitis",
		"q90_3":"q95_3_emphysema",
		"q90_4":"q95_4_pneumonia",
		"q90_5":"q95_5_hay_fever",
		"q90_6":"q95_6_eczema_dermatitis",
		"q90_1_age":"q95_1_age",
		"q90_2_age":"q95_2_age",
		"q90_3_age":"q95_3_age",
		"q90_4_age":"q95_4_age",
		"q90_5_age":"q95_5_age",
		"q90_6_age":"q95_6_age",
		"q90_1_year":"q95_1_year",
		"q90_2_year":"q95_2_year",
		"q90_3_year":"q95_3_year",
		"q90_4_year":"q95_4_year",
		"q90_5_year":"q95_5_year",
		"q90_6_year":"q95_6_year",
		"q91_1":"q96_1_second_hand_smoke_at_home",
		"q91_2":"q96_2_second_hand_smoke_at_work",
		"q91_3":"q96_3_second_hand_smoke_at_leisure",
		"q91_1_howManyYears":"q96_1_howManyYears",
		"q91_2_howManyYears":"q96_2_howManyYears",
		"q91_3_howManyYears":"q96_3_howManyYears",
		"q92_1":"q97_1_asbestos",
		"q92_2":"q97_2_sand_silica_concrete_dust",
		"q92_3":"q97_3_solvents",
		"q92_4":"q97_4_arsenic",
		"q92_5":"q97_5_chromium_nickel",
		"q92_6":"q97_6_cadmium",
		"q92_7":"q97_7_berylium",
		"q92_8":"q97_8_radon_uranium",
		"q92_9":"q97_9_benzene",
		"q92_1_howManyYears":"q97_1_howManyYears",
		"q92_2_howManyYears":"q97_2_howManyYears",
		"q92_3_howManyYears":"q97_3_howManyYears",
		"q92_4_howManyYears":"q97_4_howManyYears",
		"q92_5_howManyYears":"q97_5_howManyYears",
		"q92_6_howManyYears":"q97_6_howManyYears",
		"q92_7_howManyYears":"q97_7_howManyYears",
		"q92_8_howManyYears":"q97_8_howManyYears",
		"q92_9_howManyYears":"q97_9_howManyYears",
		"q93":"q98a_used_nicotine_replacement_product",
		"q93_1":"q98b_1_pills",
		"q93_2":"q98b_2_nicotine_gum",
		"q93_3":"q98b_3_nicotine_patch",
		"q93_4":"q98b_4_nicotine_lozenge",
		"q93_5":"q98b_5_nicotine_nasal_spray_oral_inhaler",
		"q93_1_howManyMonths":"q98b_1_howManyMonths",
		"q93_2_howManyMonths":"q98b_2_howManyMonths",
		"q93_3_howManyMonths":"q98b_3_howManyMonths",
		"q93_4_howManyMonths":"q98b_4_howManyMonths",
		"q93_5_howManyMonths":"q98b_5_howManyMonths",
		"q94_1":"q99_1_NSAIDS",
		"q94_2":"q99_2_STATINS",
		"q94_3":"q99_3_asthma_medicine",
		"q94_4":"q99_4_diabetes_medicine",
		"q94_5":"q99_5_other_med1",
		"q94_6":"q99_6_other_med2",
		"q94_1_ageStart":"q99_1_ageStart",
		"q94_2_ageStart":"q99_2_ageStart",
		"q94_3_ageStart":"q99_3_ageStart",
		"q94_4_ageStart":"q99_4_ageStart",
		"q94_5_ageStart":"q99_5_ageStart",
		"q94_6_ageStart":"q99_6_ageStart",
		"q94_1_ageStop":"q99_1_ageStop",
		"q94_2_ageStop":"q99_2_ageStop",
		"q94_3_ageStop":"q99_3_ageStop",
		"q94_4_ageStop":"q99_4_ageStop",
		"q94_5_ageStop":"q99_5_ageStop",
		"q94_6_ageStop":"q99_6_ageStop",
		"q94_1_NumPillsPerWeek":"q99_1_NumPillsPerWeek",
		"q94_2_NumPillsPerWeek":"q99_2_NumPillsPerWeek",
		"q94_3_NumPillsPerWeek":"q99_3_NumPillsPerWeek",
		"q94_4_NumPillsPerWeek":"q99_4_NumPillsPerWeek",
		"q94_5_NumPillsPerWeek":"q99_5_NumPillsPerWeek",
		"q94_6_NumPillsPerWeek":"q99_6_NumPillsPerWeek",
		"q94_otherMedName1":"q99_otherMedName1",
		"q94_otherMedName2":"q99_otherMedName2",
		
		"q95_doctor_name":"q100_doctor_name",
		"q95_doctor_telephone":"q100_doctor_telephone",
		"q95_doctor_other_info":"q100_doctor_other_info",
		"q95_addr_street1":"q100_addr_street1",
		"q95_addr_street2":"q100_addr_street2",
		"q95_addr_city":"q100_addr_city",
		"q95_addr_state":"q100_addr_state",
		"q95_addr_zipcode":"q100_addr_zipcode",
		"q95_country":"q100_country",
		]
	
	
    def list = {

		session.step=''
        params.max = Math.min(params.max ? params.int('max') : 10, 100)

		
		//List fields = ["id", "dateCreated", "lastUpdated", "consentNum", "consentNumSurv","consentNumLoc","mrn","surveyer","completed",
		//			   "being_treated_for_cancer", "sex", "DOB", "race","other_race","hispanic_or_latino",
		//			   "addr_street1", "addr_street2", "addr_city", "addr_state", "addr_zipcode", "country",
		//			   "marital_status", "education",	"current_occupation", "current_occupation_time", "prior_job", "prior_job_time",
		//			   "q8_1","q8_1_which", "q8_2","q8_3", "q8_4","q8_4_which", "q8_5", "q8_others" // occupatioal exposure
		//]
		
		List fields = []
		
		def d = new DefaultGrailsDomainClass(Survey.class)
		d.persistentProperties.each{
			//println "${it.name}"
			fields.add(it.name)
		}
		
		

		// Formatter closure
		def upperCase = { domain, value ->
			return value.toUpperCase() }
		
		
		Map formatters = [author: upperCase]
		
		Map parameters = [title: "survey_list", separator:"\t"]
		
		
		if(params?.format && params.format != "html"){
			response.contentType = ConfigurationHolder.config.grails.mime.types[params.format] 
			response.setHeader("Content-disposition", "attachment; filename=survey_list.${params.extension}.txt")
			params.max=1000000
			
			//exportService.export(params.format, response.outputStream, Survey.list(params), [:], [:])
			exportService.export(params.format, response.outputStream, Survey.list(params), fields, global_labels, formatters, parameters)
		}
				
        [surveyInstanceList: Survey.list(params), surveyInstanceTotal: Survey.count()]
    }
	def list_surveyer = {
		session.step=''
		def selectedSurveys=getSurveyList(session.user.login, params)
		def surveySize=u56survey.Survey.countBySurveyer(session.user.login)
		
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		
		List fields = []
		
		def d = new DefaultGrailsDomainClass(Survey.class)
		d.persistentProperties.each{
			//println "${it.name}"
			fields.add(it.name)
		}
		
		

		// Formatter closure
		def upperCase = { domain, value ->
			return value.toUpperCase() }
		
		
		Map formatters = [author: upperCase]
		
		Map parameters = [title: "survey_list", separator:"\t"]
		
		
		if(params?.format && params.format != "html"){
			response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
			response.setHeader("Content-disposition", "attachment; filename=survey_list.${params.extension}.txt")
			params.max=1000000
			
			//exportService.export(params.format, response.outputStream, Survey.list(params), [:], [:])
			exportService.export(params.format, response.outputStream, selectedSurveys, fields, global_labels, formatters, parameters)
		}
		[surveyInstanceList: selectedSurveys, surveyInstanceTotal: surveySize]
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
	/*
    def create = {
        def surveyInstance = new Survey()
        surveyInstance.properties = params
        return [surveyInstance: surveyInstance]
    }
	*/

	
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
		return [surveyInstance: surveyInstance, thisyear:thisyear, countryNames:countryNames]
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
	/*
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
    */

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
			
			//surveyCompletedInstance.properties = params
			//surveyCompletedInstance.completed=true
			//surveyCompletedInstance.step='completed'
			//surveyCompletedInstance.completedBy = session.user.login
			
            //if (!surveyInstance.hasErrors() && surveyInstance.save(flush: true) && surveyCompletedInstance.save(flush: true)) {
			if (!surveyInstance.hasErrors() && surveyInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'survey.label', default: 'Survey'), surveyInstance.id])}"
                //redirect(action: "show", id: surveyInstance.id)
				redirect(action: "thankyou")
            }
            else {
                //render(view: "edit", model: [surveyInstance: surveyInstance])
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
	/*
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
    */

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
            
			if (params.haveCancer=="no"){
				params.spread_cancer="n/a"
				params.liver=false
				params.brain=false
				params.lung=false
				params.bone=false
				params.other=false
				params.spread_where=" "
			}
			
			if (params.q11a_hep_donotknow_type){
				params.q11a_1="n/a"
				params.q11a_2="n/a"
				params.q11a_3="n/a"
			}
			if (params.q37=="no"){
				params.q37_what="n/a"
				params.q38="n/a"
			}
			if (params.q39=="no"){
				params.q40="n/a"
			}
			if (params.q42=="no"){
				params.q42_1="n/a"
				params.q42_2="n/a"
				params.q42_3="n/a"
				params.q42_4="n/a"
				params.q42_5="n/a"
				params.q42_6="n/a"
				params.q42_7="n/a"
				params.q42_8="n/a"
				params.q43="n/a"
				params.q43_biopsy_results=" "
			}

            surveyInstance.properties = params

			surveyInstance.surveyer=session.user.login
			if (session.step!='') surveyInstance.step=session.step.toString()
			
			if (!surveyInstance.hasErrors() && surveyInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'survey.label', default: 'Survey'), surveyInstance.id])}"
                redirect(action: "show", id: surveyInstance.id)
            }
            else {
                //render(view: "edit", model: [surveyInstance: surveyInstance])
				redirect(action: "show", id: surveyInstance.id)
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
			// special care for radio buttons (virtually initialize to null - not-existing value 
			if (params.haveCancer=="no"){
				params.spread_cancer="n/a"
				params.liver=false
				params.brain=false
				params.lung=false
				params.bone=false
				params.other=false
				params.spread_where=" "
			}
			
			if (params.q11a_hep_donotknow_type){
				params.q11a_1="n/a"
				params.q11a_2="n/a"
				params.q11a_3="n/a"
			}
			if (params.q37=="no"){
				params.q37_what="n/a"
				params.q38="n/a"
			}
			if (params.q39=="no"){
				params.q40="n/a"
			}
			if (params.q42=="no"){
				params.q42_1="n/a"
				params.q42_2="n/a"
				params.q42_3="n/a"
				params.q42_4="n/a"
				params.q42_5="n/a"
				params.q42_6="n/a"
				params.q42_7="n/a"
				params.q42_8="n/a"
				params.q43="n/a"
				params.q43_biopsy_results=" "
			}
			surveyInstance.properties = params
			
			//surveyInstance.surveyer=session.user.login // when ever updated, save the surveyer (loggined user)
			surveyInstance.updatedBy = session.user.login
			surveyInstance.step=currentStep
			
			if (!surveyInstance.hasErrors() && surveyInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'survey.label', default: 'Survey'), surveyInstance.id])}"
				//redirect(action: "show", id: surveyInstance.id)
				redirect(action: ("step"+nextStep), id: surveyInstance.id)
			}
			else {
				render(view: ("step"+currentStep), model: [surveyInstance: surveyInstance, thisyear:thisyear, countryNames:countryNames])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
	}
	/*
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
	
	def ajaxValidICNorNot={
		def whatEntered = params['icnEntered']
		def resultOut = ""
		if (whatEntered.isNumber()){
			def whatNumber = whatEntered.toInteger()
			if (whatNumber >=1 && whatNumber <10000){
				//resultOut = Survey.findByConsentNum(whatEntered) ? "Existing ICN" : "Valid"
				resultOut = Survey.findByConsentNum(whatEntered) ? "Existing ICN" : ""
			}
			else
				resultOut = "Valid rane: 1 ~ 9999"
		}
		else 
			resultOut = "Number Only"
		//render params['icnEntered']
		render "<font color='red'>"+resultOut+"</font>"
	}
}
