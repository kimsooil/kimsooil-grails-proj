package u56survey

class Person {
  static constraints = {
    login(unique:true)
    password(password:true)
	role(inList:["surveyer", "admin"])
	location(inList:["MOFF", "SANL"])
	language(inList:["English", "Spanish"])
	sex(inList:["Female", "Male"])
  }
  
  String login // userid
  String password
  String name
  String location // 4-letter code
  String language
  String role = "surveyer"
  
  // additional info
  String locationName
  String locAddress
  String locCity
  String locState
  String locCountry
  String locZipCode
  String locAreaCode
  String locPhoneNum
  String locPhoneExt
  String nameFirst
  String nameMiddle
  String nameLast
  Date dob
  String sex
  String ssn
  String email1
  String email2
  String phone1Area
  String phone1Num
  String phone1Ext
  String phone2Area
  String phone2Num
  String phone2Ext
  String homeAddress
  String homeCity
  String homeState
  String homeCountry
  String homeZipCode
  String PrimaryPhoneArea
  String PrimaryPhoneNum
  String PrimaryPhoneExt
  String EmergencyContact_FirstName
  String EmergencyContact_MiddleName
  String EmergencyContact_LastName
  String EmergencyContact_email
  String EmergencyContact_phone
  String assignedToLocation
  
  String toString(){
    name
  }
}

