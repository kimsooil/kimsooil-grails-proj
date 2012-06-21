package braintumorpathologyreview

import java.util.Date;

class ReviewQuestions {

	//static belongsTo = [reviews:DataEntry]
	
	String studyid=""
	User reviewer
	String cycle="1"
	String status="Unassigned"
	Boolean AstrocyticPhenotype=false
	Boolean OligodendroglialPhenotype=false
	Boolean Mitoses=false
	Boolean Necrosis=false
	String NecrosisScale="" // should not be null if Necrosis=true
	Boolean PseudopalisadingNecrosis=false
	//Boolean Invasion=false
	Boolean PerivascularInflammation=false
	Boolean VascularProliferation=false
	String VPscale="" // if VascularProliferation==true, choose one 
	Boolean RosenthalFibers=false
	Boolean EGBS=false
	Boolean Mini_gemistocytesPresent=false
	//Boolean ArtifactPresentOrBadSection=false
	Boolean GiantCellsPresent=false
	String GradingSubClassification=""
	String Gemistocytic=""// if GradingSubClassification is 1E or 1F, check yes/no
	//String PredominantSubtype="" // if GradingSubClassification is 2A, 2B, or 2C, choose one
	String ExtentOligo="" // renamed "PredominantSubtype"
	String PossibleSubClassification="" // if GradingSubClassification==9, choose one
	String LevelOfDiagnosticCertainty="" // 1(low) ~ 3(high)
	String Notes=""
	String Messages=""
	//Boolean complete // complete(yes) or/ incomplete(no)
	
	Date dateCreated // auto-timestamped, for disabling set "autoTimestamp false"
	Date lastUpdated // auto-timestamped, ...
	Date dateAssigned
	Date dateCompleted

	  String toString(){
	    studyid+" ("+reviewer+")"
	  }
   static constraints = {
         reviewer(nullable:true)
		 dateAssigned(nullable:true)
		 dateCompleted(nullable:true)
    }
   static mapping={
	   columns{
		   notes type:"text"
		   messages type:"text"
	   }
   }
}
