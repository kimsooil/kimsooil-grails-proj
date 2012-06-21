package braintumorpathologyreview

class DataEntry {

	//static hasMany = [reviews:ReviewQuestions, reviewers:User]
	List reviews // keep objects "reviews" in the orders which they were added
	static hasMany = [reviews:ReviewQuestions]

	String studyid
	String surgerytype
	String casestatus="Unassigned"
	String owner="admin"

	String imageid
	String imagelocation
	String filename_images
	String filename_pathreport
	String filename_mrireport
	
	String surgical_center
	String pathology_summary
	String mri_summary
	String track_logs=""

	Date dateCreated // auto-timestamped, for disabling set "autoTimestamp false"
	Date lastUpdated // auto-timestamped, ...

    static constraints = {
		studyid(unique:true)
		//surgerytype(inList:["Biopsy","Resection", "2nd Resection", "3rd Resection"])
		casestatus(nullable:true, inList:["Unassigned", "New Assignment", "In Progress", "Needs More Info", "Completed", "Re-review"])

		//owner(blank:false)
		imageid(blank:true, nullable:true)
		imagelocation(blank:true, nullable:true)
		filename_images(blank:true, nullable:true)
		filename_pathreport(blank:true, nullable:true)
		filename_mrireport(blank:true, nullable:true)
		surgical_center(blank:true, nullable:true)

    }
	static mapping={
		columns{
			track_logs type:"text"
		}
	}
}
