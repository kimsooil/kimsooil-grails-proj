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
		//	println "${it.name}"
			fields.add(it.name)
		}
		
		
		Map labels =["id":"id", "dateCreated":"Created", "lastUpdated":"Updated", "surveyer":"consenter", "completed":"completedOrNot","consentNum":"icn", "consentNumSurv":"surveyName","consentNumLoc":"site","mrn":"mrn",
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
				]
		// Formatter closure
		def upperCase = { domain, value ->
			return value.toUpperCase() }
		
		
		Map formatters = [author: upperCase]
		
		Map parameters = [title: "survey_list"]
		
		
		if(params?.format && params.format != "html"){
			response.contentType = ConfigurationHolder.config.grails.mime.types[params.format] 
			response.setHeader("Content-disposition", "attachment; filename=survey_list.${params.extension}")
			params.max=1000000
			
			//exportService.export(params.format, response.outputStream, Survey.list(params), [:], [:])
			exportService.export(params.format, response.outputStream, Survey.list(params), fields, labels, formatters, parameters)
		}
				
        [surveyInstanceList: Survey.list(params), surveyInstanceTotal: Survey.count()]
    }
	def list_surveyer = {
		session.step=''
		def selectedSurveys=getSurveyList(session.user.login, params)
		def surveySize=u56survey.Survey.countBySurveyer(session.user.login)
		
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
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
		[surveyInstanceList: Survey.list(params), surveyInstanceTotal: Survey.count()]
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
			if (params.version) {
				def version = params.version.toLong()
				if (surveyInstance.version > version) {
					
					surveyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'survey.label', default: 'Survey')] as Object[], "Another user has updated this Survey while you were editing")
					render(view: ("step"+currentStep), model: [surveyInstance: surveyInstance, thisyear:thisyear, countryNames:countryNames])
					return
				}
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
