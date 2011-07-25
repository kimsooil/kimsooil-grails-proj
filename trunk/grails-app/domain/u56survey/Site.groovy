package u56survey

class Site {
String name
String fourletters
String location
    static constraints = {
		fourletters(unique:true,inList:["MOFF", "FLHO", "PSoM", "STLU", "HIMA", "SJVA", "AMHO", 'PRTB', "DEMO"])
		location(inList:["Florida", "Puerto Rico"])
    }
	String toString(){
		fourletters+' ('+name+')'
	}
}
