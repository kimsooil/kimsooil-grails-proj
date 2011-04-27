package u56survey

import static java.util.Calendar.YEAR

class SurveyController {
	def beforeInterceptor = [action:this.&authz, except:["index"]]
	
	def authz() {
		 if(!session.user) {
			  redirect(controller:"person", action:"login")
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
	def today = new Date()
	def thisyear=today[YEAR]
	
	def step1 = { // copied from create
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
		surveyInstance.consentNum=surveyInstance.id
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
		today=today.minusYears(18) // subject should be 18 years old or more
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
			surveyInstance.step="verify"
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

		def surveyCompletedInstance = new SurveyCompleted()
		def surveyInstance = Survey.get(params.id)

		surveyInstance.completed=true
		surveyInstance.surveyer=session.user.login
		surveyInstance.step=''
		surveyCompletedInstance.completed=true
        
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
			
			params.id=null
			surveyCompletedInstance.properties = params
			surveyCompletedInstance.consentNumSurv=surveyInstance.consentNumSurv
			surveyCompletedInstance.consentNumLoc=surveyInstance.consentNumLoc
			surveyCompletedInstance.consentNum=surveyInstance.consentNum
			
            if (!surveyInstance.hasErrors() && surveyInstance.save(flush: true) && surveyCompletedInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'survey.label', default: 'Survey'), surveyInstance.id])}"
                redirect(action: "show", id: surveyInstance.id)
            }
            else {
                //render(view: "edit", model: [surveyInstance: surveyInstance])
				redirect(action: "verify", id: surveyInstance.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
            redirect(action: "list")
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
		def currentStep =  session.step
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
			surveyInstance.surveyer=session.user.login
			surveyInstance.step=session.step.toString()
			surveyInstance.properties = params
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
}
