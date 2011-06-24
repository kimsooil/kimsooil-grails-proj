import grails.util.GrailsUtil
import org.codehaus.groovy.grails.commons.ApplicationHolder
import u56survey.DataSourceUtils

class BootStrap {
	

    def init = { servletContext ->
		
		DataSourceUtils.tune(servletContext) // fix for the database killing idle connections : see more http://tinyurl.com/2fjsoq7
		
		//Date.metaClass.getAge = { new Date().year - delegate.year }
		
		Date.metaClass.methodMissing = {String methodName, args ->
			List interceptableMethods = ['addYears', 'addMonths', 'addWeeks', 'addDays', 'addHours', 'addMinutes', 'addSeconds', 'minusYears', 'minusMonths', 'minusWeeks', 'minusDays', 'minusHours', 'minusMinutes', 'minusSeconds']
			if (methodName in interceptableMethods && args[0] instanceof Integer) {
				String method = methodName.replace('add', '')
				method = method.replace('minus', '')
				def impl = {methodArg ->
					Date date
					use(org.codehaus.groovy.runtime.TimeCategory) {
						if (methodName.contains('add')) {
							date = delegate + methodArg."get${method}"()
						}
						else {
							date = delegate - methodArg."get${method}"()
						}
					}
					return date
				}
				Date.metaClass."${methodName}" = impl
				impl(* args)
			}
			else {
				throw new MissingMethodException(methodName, Date, args)
			}
		}
		
		switch(GrailsUtil.getEnvironment()){
		//switch(Environment.getCurrent() ){
			case "development":
				def admin = new u56survey.Person(login:"admin", password:"pa\$\$word", name:"Administrator", role:"admin", location:"MOFF", language:"English").save()
				//def kimsooil = new u56survey.Person(login:"kimsooil", password:"password", name:"Soo I. Kim", role:"surveyer", location:"MOFF").save()
				def survey = new u56survey.Person(login:"survey", password:"\$urvey", name:"Surveyer", role:"surveyer", location:"MOFF", language:"English").save()
				/****
				for ( i in 0..10000 ) { // testing to see if creation/update speed is fast enough as the size grows
					def surveyInstance = new u56survey.Survey()
					if (surveyInstance.save(flush: true)) {
						System.out.println(i+" created.")
					}
				}
				********/
			break
			case "production":
			  def admin = new u56survey.Person(login:"admin", password:"pa\$\$word", name:"Administrator", role:"admin", location:"MOFF", language:"English").save()
			  
			  def survey = new u56survey.Person(login:"survey", password:"\$urvey", name:"Surveyer", role:"surveyer", location:"MOFF", language:"English").save()
			break
		  }
	  
    }
    def destroy = {
    }
}
