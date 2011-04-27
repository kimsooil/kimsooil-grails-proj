package u56survey

class Person {
  static constraints = {
    login(unique:true)
    password(password:true)
	role(inList:["surveyer", "surveyee", "admin"])
	location(inList:["MOFF", "SANL"])
	language(inList:["English", "Spanish"])
  }
  
  String login
  String password
  String name
  String location // 4-letter code
  String language
  String role = "surveyer"
  
  String toString(){
    name
  }
}

