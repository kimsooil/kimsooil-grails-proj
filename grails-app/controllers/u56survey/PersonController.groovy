package u56survey

class PersonController {
	def scaffold = true
	
	def beforeInterceptor = [action:this.&auth,
		except:["login", "authenticate", "logout", "securelogout"]]

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
  
}
