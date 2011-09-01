package u56survey

class PersonController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	//def scaffold = true
	
	def beforeInterceptor = [action:this.&auth,
		except:["login", "authenticate", "logout", "securelogout", "edit_info", "update_info"]]

	def auth() {
		if( !(session?.user?.role == "admin") ){
		  flash.message = "You must be an administrator to perform that task."
		  session.returnURL = request.request.requestURL
		  //session.returnURL = request.forwardURI
		  redirect(action:"login")
		  return false
		}
	  }
	
	def login = {
		//flash.message = session.returnURL
		//flash.message = message(code:"login_message")
	}
	
	def authenticate = {
	  def now = new Date()
	  def user = Person.findByLoginAndPassword(params.login.toLowerCase(), params.password) // ignore case for solving issue of AutoCapitalization on iOS devices (iphone,ipad)
	  if (user){
		session.user = user
		flash.message = message(code:"hello")+" ${session.user.name}!"
		//System.err.print now;
		//System.err.println(" Login("+user.login+") Successful")

		log.info " Login("+user.login+") Successful"

		//redirect(controller:"survey", action:"list")
		if (session.user.language=="English"){
			if (session.returnURL)
				redirect(url:session.returnURL+"?lang=en")
			else
				redirect(uri:"/survey/list?lang=en")
		}
		else if (session.user.language=="Spanish"){
			if (session.returnURL)
				redirect(url:session.returnURL+"?lang=es")
			else
				redirect(uri:"/survey/list?lang=es")
		}
	  }
	  else{
		  //System.err.print now;
		  //System.err.println(" Login("+params.login+":"+params.password+") Failed")

		  log.error " Login("+params.login+":"+params.password+") Failed"
		  //flash.message = "Sorry, ${params.login}. Please try again."
		  flash.message = message(code:"login_message")
		  redirect(action:"login", params:params)
	  }
	  
	}
	
	def logout = {
		if (session.user){
			def now = new Date()
		  //flash.message = "Goodbye ${session.user.name}"
			flash.message = "Goodbye."
			//System.err.print now
			//System.err.println(" User:'"+session.user.login+"' Logged out")
			//log.info now
			log.info " User:'"+session.user.login+"' Logged out"
		  session.user = null
		  redirect(controller:"survey", action:"list")
		}
		else
		  redirect(controller:"survey", action:"list")
	}
	def securelogout = {
		if (session.user){
			def now = new Date()
		  //flash.message = "Goodbye ${session.user.name}"
			flash.message = "Goodbye."
			//System.err.print now
			//System.err.println(" User:'"+session.user.login+"' Logged out")
			//log.info now
			log.info " User:'"+session.user.login+"' Logged out"
		  session.user = null
		  //redirect(controller:"survey", action:"list")
		  redirect(url:"https://secure.moffitt.org:443/dana-na/auth/logout.cgi")
		}
		else
		  //redirect(controller:"survey", action:"list")
		redirect(url:"https://secure.moffitt.org:443/dana-na/auth/logout.cgi")
		  
	}
	def list = {
		params.max = Math.min(params.max ? params.int('max') : 25, 100)
		[personInstanceList: Person.list(params), personInstanceTotal: Person.count()]
	}

	def edit_info = {
		def user = Person.findByLogin(params.user)
		def personInstance = Person.get(user.id)
		if (!personInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [personInstance: personInstance]
		}
	}
	def update_info = {
		def personInstance = Person.get(params.id)
		if (personInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (personInstance.version > version) {
					
					personInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'person.label', default: 'Person')] as Object[], "Another user has updated this Person while you were editing")
					render(view: "edit_info", model: [personInstance: personInstance])
					return
				}
			}
			personInstance.properties = params
			if (!personInstance.hasErrors() && personInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])}"
				//redirect(action: "show", id: personInstance.id)
				redirect(controller:"survey", action: "list")
			}
			else {
				render(view: "edit_info", model: [personInstance: personInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
			redirect(controller:"survey", action: "list")
		}
	}
	
	
    def index = {
        redirect(action: "list", params: params)
    }



    def create = {
        def personInstance = new Person()
        personInstance.properties = params
        return [personInstance: personInstance]
    }

    def save = {
        def personInstance = new Person(params)
        if (personInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])}"
            redirect(action: "show", id: personInstance.id)
        }
        else {
            render(view: "create", model: [personInstance: personInstance])
        }
    }

    def show = {
        def personInstance = Person.get(params.id)
        if (!personInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
            redirect(action: "list")
        }
        else {
            [personInstance: personInstance]
        }
    }

    def edit = {
        def personInstance = Person.get(params.id)
        if (!personInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [personInstance: personInstance]
        }
    }

    def update = {
        def personInstance = Person.get(params.id)
        if (personInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (personInstance.version > version) {
                    
                    personInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'person.label', default: 'Person')] as Object[], "Another user has updated this Person while you were editing")
                    render(view: "edit", model: [personInstance: personInstance])
                    return
                }
            }
            personInstance.properties = params
            if (!personInstance.hasErrors() && personInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])}"
                redirect(action: "show", id: personInstance.id)
            }
            else {
                render(view: "edit", model: [personInstance: personInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def personInstance = Person.get(params.id)
        if (personInstance) {
            try {
                personInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])}"
            redirect(action: "list")
        }
    }
}
