package u56survey

import grails.util.GrailsUtil
import org.codehaus.groovy.grails.commons.ApplicationHolder

class LoginTagLib {
	def loginControl = {
		switch(GrailsUtil.getEnvironment()){

				case "development":
					if(session.user){
					  out << message(code:"hello")+"  ${session.user.login} "
                                          //out << """[${link(action:"logout", controller:"person"){"Login as other"}}]"""
					  out << """[${link(action:"logout", controller:"person"){message(code:'logout2')}}]"""
					  
					} else {
					  out << """[${link(action:"login", controller:"person"){message(code:'login2')}}]"""
					}
				break
				case "production":
					if(session.user){
					  out << message(code:"hello")+"  ${session.user.login} "
					  
                                          //out << """[${link(action:"logout", controller:"person"){"Login as other"}}]"""
					  
					  out << """-[${link(action:"securelogout", controller:"person"){message(code:'logout2')}}]"""
					  
					} else {
					  out << """[${link(action:"login", controller:"person"){message(code:'login2')}}]"""
					}
				break
			  }
		

	  }
	
}
