package braintumorpathologyreview

class CaseDetails {
	String subject_initials=""
	String studyid=""
	String gliomaOrMeningioma=""
	String case_note=""

	//Pathology	
	//Date pdate1
	String surgeryDate1=""
	String surgeryType1=""
	String reviewType1=""
	String SurgPathNum1=""
	String Diagnosis1=""
	String Site1=""
	String ReportUrl1=""
	Boolean pshow1=false

	//Date pdate2
	String surgeryDate2=""
	String surgeryType2=""
	String reviewType2=""
	String SurgPathNum2=""
	String Diagnosis2=""
	String Site2=""
	String ReportUrl2=""
	Boolean pshow2=false
	
	//Date pdate3
	String surgeryDate3=""
	String surgeryType3=""
	String reviewType3=""
	String SurgPathNum3=""
	String Diagnosis3=""
	String Site3=""
	String ReportUrl3=""
	Boolean pshow3=false
	
	//Date pdate4
	String surgeryDate4=""
	String surgeryType4=""
	String reviewType4=""
	String SurgPathNum4=""
	String Diagnosis4=""
	String Site4=""
	String ReportUrl4=""
	Boolean pshow4=false

	//Date pdate5
	String surgeryDate5=""
	String surgeryType5=""
	String reviewType5=""
	String SurgPathNum5=""
	String Diagnosis5=""
	String Site5=""
	String ReportUrl5=""
	Boolean pshow5=false
	
	//Date pdate6
	String surgeryDate6=""
	String surgeryType6=""
	String reviewType6=""
	String SurgPathNum6=""
	String Diagnosis6=""
	String Site6=""
	String ReportUrl6=""
	Boolean pshow6=false

	//MRI
	//Date mdate1
	String MRIDate1=""
	String MRISummary1=""
	String MRIReport1=""
	Boolean mshow1=false
		
	//Date mdate2
	String MRIDate2=""
	String MRISummary2=""
	String MRIReport2=""
	Boolean mshow2=false
	
	//Slide
	String SurgType1=""
	String StainType1=""
	String imageid1=""
	Boolean sshow1=false
	
	String SurgType2=""
	String StainType2=""
	String imageid2=""
	Boolean sshow2=false

	String SurgType3=""
	String StainType3=""
	String imageid3=""
	Boolean sshow3=false
	
	String SurgType4=""
	String StainType4=""
	String imageid4=""
	Boolean sshow4=false
	
	String SurgType5=""
	String StainType5=""
	String imageid5=""
	Boolean sshow5=false
	
	String SurgType6=""
	String StainType6=""
	String imageid6=""
	Boolean sshow6=false

	static mapping = {
		columns{
			case_note type:"text"
		}
	}

}
