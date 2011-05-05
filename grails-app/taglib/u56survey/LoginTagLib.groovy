package u56survey

import grails.util.GrailsUtil
import org.codehaus.groovy.grails.commons.ApplicationHolder

class LoginTagLib {
	def loginControl = {
		switch(GrailsUtil.getEnvironment()){

				case "development":
					if(session.user){
					  out << message(code:"hello")+"  ${session.user} "
					  out << """[${link(action:"logout", controller:"person"){"Logout"}}]"""
					  
					} else {
					  out << """[${link(action:"login", controller:"person"){"Login"}}]"""
					}
				break
				case "production":
					if(session.user){
					  out << message(code:"hello")+"  ${session.user} "
					  out << """[${link(action:"logout", controller:"person"){"Switch user"}}]"""
					  
					  out << """-[${link(action:"securelogout", controller:"person"){"Logout"}}]"""
					  
					} else {
					  out << """[${link(action:"login", controller:"person"){"Login"}}]"""
					}
				break
			  }
		

	  }
	
}
