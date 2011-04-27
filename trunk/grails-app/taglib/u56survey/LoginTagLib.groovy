package u56survey

class LoginTagLib {
	def loginControl = {
		if(session.user){
		  out << message(code:"hello")+"  ${session.user} "
		  out << """[${link(action:"logout", controller:"person"){"Logout"}}]"""
		} else {
		  out << """[${link(action:"login", controller:"person"){"Login"}}]"""
		}
	  }
	
}
