package braintumorpathologyreview

class User {
	  static hasMany = [reviews:ReviewQuestions]
 
	  String login
	  String password
	  String name
	  String email
	  String role="reviewer"
		  
	  String toString(){
	    login
	  }

	  static constraints = {
		    login(unique:true)
		    password(password:true)
		    name()
		    role(inList:["reviewer", "admin"])
		  }

	}