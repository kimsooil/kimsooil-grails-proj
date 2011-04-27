package u56survey

class PersonController {
	def scaffold = true
	
	def beforeInterceptor = [action:this.&auth,
		except:["login", "authenticate", "logout"]]

	def auth() {
		if( !(session?.user?.role == "admin") ){
		  flash.message = "You must be an administrator to perform that task."
		  redirect(action:"login")
		  return false
		}
	  }
	
	def login = {}
	
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
			redirect(uri:"/survey/list?lang=en")
		}
		else if (session.user.language=="Spanish"){
			redirect(uri:"/survey/list?lang=es")
		}
	  }
	  else{
		  //System.err.print now;
		  //System.err.println(" Login("+params.login+":"+params.password+") Failed")

		  log.error " Login("+params.login+":"+params.password+") Failed"
		  flash.message = "Sorry, ${params.login}. Please try again."
		  redirect(action:"login")
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
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 25, 100)
        [personInstanceList: Person.list(params), personInstanceTotal: Person.count()]
    }
  
}
