package u56survey

class LoginTagLib {
	def loginControl = {
		if(session.user){
		  out << message(code:"hello")+"  ${session.user} "
		  out << """[${link(action:"logout", controller:"person"){"Switch user"}}]"""
		  
		  out << """-[${link(action:"securelogout", controller:"person"){"<label style='color:red'>SecureLogout</label>"}}]"""
		  
		} else {
		  out << """[${link(action:"login", controller:"person"){"Login"}}]"""
		}
	  }
	
}
