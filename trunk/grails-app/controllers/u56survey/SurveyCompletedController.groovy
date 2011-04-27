package u56survey
import static java.util.Calendar.YEAR
class SurveyCompletedController {
	def scaffold = true
	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[surveyInstanceList: SurveyCompleted.list(params), surveyInstanceTotal: SurveyCompleted.count()]
	}
	def view={
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
		
		def surveyCompletedInstance = SurveyCompleted.get(params.id)
		if (!surveyCompletedInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'survey.label', default: 'Survey'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [surveyInstance: surveyCompletedInstance, countryNames:countryNames, thisyear:thisyear]
		}
	}
}
