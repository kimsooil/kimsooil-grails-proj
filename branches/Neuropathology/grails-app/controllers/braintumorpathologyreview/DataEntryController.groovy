package braintumorpathologyreview

import java.util.Date;

class DataEntryController {
	  //def beforeInterceptor = [action:this.&auth, except:["list"]]
	  def beforeInterceptor = [action:this.&authz, except:["firstpage", "contact", "sendcontact"]]	                           

	  def authz() {
	   if(!session.user) {
 
	      redirect(controller:"user", action:"login")
	      return false
	   }
	}

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

      def GradingSubClassification = ["1":"Astrocytic Neoplasms",
           		                      "1A":"pilocytic astrocytoma, WHO I",
           		                                   "1B":"pilomyxoid astrocytoma, WHO II",
           		                                   "1C":"subependymal giant cell astrocytoma, WHO I",  
           		                                   "1D":"pleomorphic xanthoastrocytoma, WHO II",
           		                                   "1E":"astrocytoma, WHO II",
           		                                   "1F":"anaplastic astrocytoma, WHO III", 
           		                                   "1G":"glioblastoma, WHO IV",
           		                                   "1H":"glioblastoma, small cell GBM, WHO IV",
           		                                   "1I":"glioblastoma, giant cell GBM, WHO IV",
           		                                   "1J":"glioblastoma, gliosarcoma, WHO IV",
           		                                   "1K":"glioblastoma with PNET-like component, WHO IV",
           		                                   "1L":"gliomatosis cerebri (no WHO grade)",
           		                                   "1M":"glioblastoma with oligodendroglioma",
           		                                "2":"Mixed Glial Neoplasms:",
           		                                   "2A":"oligoastrocytoma, WHO II",  
           		                                   "2B":"anaplastic oligoastrocytoma, WHO III",
           		                                   "2C":"glioblastoma with oligoastrocytoma",
           		                                "3":"Oligodendroglial Neoplasms:",
           		                                   "3A":"oligodendroglioma, WHO II",
           		                                   "3B":"anaplastic oligodendroglioma, WHO III",
           		                                "4":"Ependymal tumors",
           		                                   "4A":"subependymoma, WHO I",
           		                                   "4B":"myxopapillary ependymoma, WHO I",
           		                                   "4C":"ependymoma, WHO II",
           		                                   "4D":"anaplastic ependymoma, WHO III",
           		                                "5":"Neuronal / mixed neuronal-glial tumors",
           		                                   "5A":"gangliocytoma, WHO I",
           		                                   "5B":"ganglioglioma, WHO I",
           		                                   "5C":"anaplastic ganglioglioma, WHO III",
           		                                   "5D":"DIA and ganglioglioma, WHO I",
           		                                   "5E":"DNT, WHO I",
           		                                   "5F":"central neurocytoma, WHO II",
           		                                   "5G":"extraventricular neurocytoma, WHO II",
           		                                   "5H":"cerebellar liponeurocytoma, WHO II",
           		                                   "5I":"paraganglioma, spinal cord, WHO I",
           		                                   "5J":"papillary glioneuronal tumor, WHO I",
           		                                   "5K":"rosette-form. glioneuronal tum of 4th ven, WHO I",
           		                                   "5L":"glioneuronal tumor with neuropil-like isl, WHO II",
           		                                   "5M":"glioneuronal tumor with neuropil-like isl, WHO III",
           		                                "6":"Embryonal tumors",
           		                                   "6A":"medulloblastoma, WHO IV",
           		                                   "6B":"medulloblastoma, desmopl/nodular, WHO IV",
           		                                   "6C":"medulloblastoma with exten nodul, WHO IV",
           		                                   "6D":"medulloblastoma, large cell/anapl, WHO IV",
           		                                   "6E":"CNS PNET, WHO IV",
           		                                   "6F":"AT/RT, WHO IV",
           		                                   "6G":"germinoma",
           		                                   "6H":"germ cell tumor",
           		                                "7":"Other",
           		                                   "7A":"choroid plexus papilloma, WHO I",
           		                                   "7B":"atypical choroid plexus papilloma, WHO II",
           		                                   "7C":"choroid plexus carcinoma, WHO III",
           		                                   "7D":"angiocentric glioma, WHO I",
           		                                   "7E":"chordoid glioma of the third ventricle, WHO II",
           		                                   "7F":"astroblastoma",
           		                                   "7G":"pineocytoma, WHO I",
           		                                   "7H":"pineal parenchymal tumor of intermed diff, WHO II",
           		                                   "7I":"pineal parenchymal tumor of intermed diff, WHO III",
           		                                   "7J":"pineoblastoma, WHO IV",
           		                                   "7K":"papillary tumor of the pineal region, WHO II",
           		                                   "7L":"papillary tumor of the pineal region, WHO III",
           		                                   "7M":"granular cell astrocytoma",
           		                                   "7N":"hemangioblastoma, WHO I",
           		                                   "7O":"meningioma",
           		                                   "7P":"melanocytoma",
           		                                   "7Q":"primary melanoma",
           		                                   "7R":"hemangiopericytoma, WHO II",
           		                                   "7S":"anaplastic hemangiopericytoma, WHO III",
           		                                   "7T":"primary sarcoma",
           		                                "8":"Uncertain phenotype:",
           		                                   "8A":"high grade glioma without specific phenotype",
           		                                   "8B":"low grade glioma without specific phenotype",
           		                                   "8C":"malignant tumor without phenotype, non-PNET",
           		                                "9":"not known; see atypical case info"]
	
    def index = {
        redirect(action: "list", params: params)
    }

    def firstpage = {
	    if(session?.user?.role == "admin"){
		      //flash.message = "You must be an administrator to perform that task."

	        def unassigned = DataEntry.countByCasestatus("Unassigned")
	        def newassignment = DataEntry.countByCasestatus("New Assignment")
	        def in_progress = DataEntry.countByCasestatus("In Progress")
	        def needs_info = DataEntry.countByCasestatus("Needs More Info")
	        //def completed = DataEntry.countByCasestatus("Completed")
	        //def re_review = DataEntry.countByCasestatus("Re-review")
			def complete = ReviewQuestions.countByStatus("Complete")
			def re_review = ReviewQuestions.countByStatus("Re-review")

    	def filter=params.filter
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
	        
	        
	        //[dataEntryInstanceList: DataEntry.list(params), dataEntryInstanceTotal: DataEntry.count(), unassigned:unassigned, newassignment:newassignment, in_progress:in_progress, complete:complete, incomplete:incomplete]
	    	[dataEntryInstanceList: DataEntry.list(params), dataEntryInstanceTotal: DataEntry.count(), filter:filter, reviews: ReviewQuestions.list(), reviewsTotal: ReviewQuestions.count(), unassigned:unassigned, newassignment:newassignment, in_progress:in_progress, needs_info:needs_info, complete:complete, re_review:re_review]
	    }
	    else if (session?.user?.role == "reviewer"){
	    	def u = User.findByLogin(session?.user?.login)
	    	def reviews_assigned=u.reviews
			def num_not_completed = 0
			reviews_assigned.each{
				//if (it.status=="New Assignment" || it.status=="In Progress" || it.status=="Needs More Info"){
				if (it.status=="New Assignment" || it.status=="In Progress"){
					num_not_completed++
				} 
			}
			def num_completed = 0
			reviews_assigned.each{
				if (it.status=="Complete" || it.status=="Re-review"){
					num_completed++
				}
			}

	        [reviews_assigned: reviews_assigned, num_not_completed:num_not_completed, num_completed:num_completed]
	    	
	    }
	    else{
	    	redirect(controller:"user", action:"login")
	    }

    }    
	def secondpage = {
		if (session?.user?.role == "reviewer"){
			def u = User.findByLogin(session?.user?.login)
			def reviews_assigned=u.reviews
			def listing=params.listing
			[reviews_assigned: reviews_assigned, listing:listing, GSC:GradingSubClassification]
			
		}
		else{
			redirect(controller:"user", action:"login")
		}

	}
	def getDataEntryList(status, params) {
		params.max = Math.min(params?.max?.toInteger() ?: 1000, 1000)
		params.offset = params?.offset?.toInteger() ?: 0
		params.sort = params?.sort ?: "studyid"
		params.order = params?.order ?: "asc"

		def dataEntries = braintumorpathologyreview.DataEntry.createCriteria().list(
				max: params.max,
				offset: params.offset,
				sort: params.sort,
				order: params.order) {
			eq "casestatus", status
		}
	}
	def getDataEntryList3(status1, status2, status3, params) {
		params.max = Math.min(params?.max?.toInteger() ?: 1000, 1000)
		params.offset = params?.offset?.toInteger() ?: 0
		params.sort = params?.sort ?: "studyid"
		params.order = params?.order ?: "asc"

		def dataEntries = braintumorpathologyreview.DataEntry.createCriteria().list(
				max: params.max,
				offset: params.offset,
				sort: params.sort,
				order: params.order) {
			or{
				eq "casestatus", status1
				eq "casestatus", status2
				eq "casestatus", status3
			}
		}
	}
	def getReviewQuestionsList(status, params) {
		params.max = Math.min(params?.max?.toInteger() ?: 1000, 1000)
		params.offset = params?.offset?.toInteger() ?: 0
		params.sort = params?.sort ?: "studyid"
		params.order = params?.order ?: "asc"

		def dataEntries = braintumorpathologyreview.ReviewQuestions.createCriteria().list(
				max: params.max,
				offset: params.offset,
				sort: params.sort,
				order: params.order) {
			eq "status", status
		}
	}

	def getReviewQuestionsList2(status1, status2, params) {
		params.max = Math.min(params?.max?.toInteger() ?: 1000, 1000)
		params.offset = params?.offset?.toInteger() ?: 0
		params.sort = params?.sort ?: "studyid"
		params.order = params?.order ?: "asc"

		def dataEntries = braintumorpathologyreview.ReviewQuestions.createCriteria().list(
				max: params.max,
				offset: params.offset,
				sort: params.sort,
				order: params.order) {
			or {
				eq "status", status1
				eq "status", status2
			}
		}
	}

	def list = {
    	def filter=params.filter
        //params.max = Math.min(params.max ? params.int('max') : 1000, 1000)
		params.sort = params?.sort ?: "studyid"
        [dataEntryInstanceList: DataEntry.list(params), dataEntryInstanceTotal: DataEntry.count(), filter:filter]
    }
	def list_unassigned = {
		def filter=params.filter
		//params.max = Math.min(params.max ? params.int('max') : 1000, 1000)
		//[dataEntryInstanceList: DataEntry.findAllByCasestatus("Unassigned"), dataEntryInstanceTotal: DataEntry.countByCasestatus("Unassigned"), filter:filter]
		[dataEntryInstanceList: getDataEntryList("Unassigned", params), dataEntryInstanceTotal: DataEntry.countByCasestatus("Unassigned"), filter:filter]
	}
	def list_new_inprogress = {
		/*
		def filter=params.filter
		params.max = Math.min(params.max ? params.int('max') : 100, 100)
		def dEntry=DataEntry.findAll("from DataEntry as d where d.casestatus='New Assignment' or d.casestatus='In Progress'")
		dEntry.sort{it.lastUpdated}
		def rqList=ReviewQuestions.findAll("from ReviewQuestions as r where r.status='New Assignment' or r.status='In Progress'")
		rqList.sort{it.dateAssigned}
		def rq_new = ReviewQuestions.findAllByStatus("New Assignment")
		rq_new.sort{it.lastUpdated}
		def rq_inprogress = ReviewQuestions.findAllByStatus("In Progress")
		rq_inprogress.sort{it.lastUpdated}
		def dTotal = dEntry.size()
		[dataEntryInstanceList: dEntry, rqList:rqList, rq_new:rq_new, rq_inprogress:rq_inprogress, dataEntryInstanceTotal: dTotal, filter:filter]
		*/
		def filter=params.filter
		//params.max = Math.min(params.max ? params.int('max') : 1000, 1000)
		def rqList = getReviewQuestionsList2('New Assignment', 'In Progress', params)
		def rqListTotal= rqList.size()
		[rqList:rqList, rqListTotal:rqListTotal, filter:filter]

	}
	def list_needs_info = {
		def filter=params.filter
		//params.max = Math.min(params.max ? params.int('max') : 1000, 1000)
		//[dataEntryInstanceList: DataEntry.findAllByCasestatus("Needs More Info").sort{it.dateUpdated}, dataEntryInstanceTotal: DataEntry.countByCasestatus("Needs More Info"), filter:filter]
		[dataEntryInstanceList: getDataEntryList("Needs More Info", params), dataEntryInstanceTotal: DataEntry.countByCasestatus("Needs More Info"), filter:filter]
	}
	def list_completed_rereview = {
		def filter=params.filter
		//params.max = Math.min(params.max ? params.int('max') : 1000, 1000)
		//[rq_complete:ReviewQuestions.findAllByStatus("Complete"), rq_rereview:ReviewQuestions.findAllByStatus("Re-review"), dataEntryInstanceList: DataEntry.findAll("from DataEntry as d where d.casestatus='Completed' or d.casestatus='Re-review' or d.casestatus='New Assignment'"), dEList_completed: DataEntry.findAllByCasestatus("Completed"), dEList_rereview: DataEntry.findAllByCasestatus("Re-review"), filter:filter, GSC:GradingSubClassification]
		[rq_rereview:getReviewQuestionsList("Re-review", params), dataEntryInstanceList: getDataEntryList3('Completed','Re-review','New Assignment', params), GSC:GradingSubClassification]
	}
	def list_completed_rereview_v2 = {
		def filter=params.filter
		//params.max = Math.min(params.max ? params.int('max') : 1000, 1000)
		//[rq_complete:ReviewQuestions.findAllByStatus("Complete"), rq_rereview:ReviewQuestions.findAllByStatus("Re-review"), dataEntryInstanceList: DataEntry.findAll("from DataEntry as d where d.casestatus='Completed' or d.casestatus='Re-review' or d.casestatus='New Assignment'"), dEList_completed: DataEntry.findAllByCasestatus("Completed"), dEList_rereview: DataEntry.findAllByCasestatus("Re-review"), filter:filter, GSC:GradingSubClassification]
		[rq_rereview:getReviewQuestionsList("Re-review", params), dataEntryInstanceList: getDataEntryList3('Completed','Re-review','New Assignment', params), GSC:GradingSubClassification]
	}

    def create = {
        def dataEntryInstance = new DataEntry()
        dataEntryInstance.properties = params

        return [dataEntryInstance: dataEntryInstance]
    }

	def create_dataEntry_and_caseDetails = {

		def caseDetailsInstance = new CaseDetails()
		
		//dataEntryInstance.properties = params
		caseDetailsInstance.properties=params

		return [caseDetailsInstance:caseDetailsInstance, GradingSubClassification:GradingSubClassification]
	}
	def save_dataEntry_and_caseDetails = {

		def caseDetailsInstance = new CaseDetails(params)
	   /*
	   def today = new Date()
	   
	   for ( i in 1..6 ){
		   if (params['pdate'+i].format("MM/dd/yyyy")==today.format("MM/dd/yyyy") || params['pdate'+i] > today)
		   		caseDetailsInstance.('surgeryDate'+i)=""
		   else
		   		caseDetailsInstance.('surgeryDate'+i) = params['pdate'+i].format("MM/dd/yyyy")
	   }
	   for ( i in 1..2 ){
		   if (params['mdate'+i].format("MM/dd/yyyy")==today.format("MM/dd/yyyy") || params['mdate'+i] > today)
		   		caseDetailsInstance.('MRIDate'+i) = ""
		   else
		   		caseDetailsInstance.('MRIDate'+i) = params['mdate'+i].format("MM/dd/yyyy")
	   }
		*/
	   for ( i in 1..6 ) {
			   
		   def uploadedFile = request.getFile('payload'+i)
		   if(!uploadedFile.empty){
			 println "Class: ${uploadedFile.class}"
			 println "Name: ${uploadedFile.name}"
			 println "OriginalFileName: ${uploadedFile.originalFilename}"
			 println "Size: ${uploadedFile.size}"
			 println "ContentType: ${uploadedFile.contentType}"
			 
			 def webRootDir = servletContext.getRealPath("/")
			 //def userDir = new File(webRootDir, "/files/${session.user.login}/${params.studyid}/path")
			 def userDir = new File(webRootDir, "/pdf")
			 userDir.mkdirs()
			 def fileNameChanged= caseDetailsInstance.studyid+".path."+i+".pdf"
			 uploadedFile.transferTo( new File( userDir, fileNameChanged))
			 caseDetailsInstance.('ReportUrl'+i) = fileNameChanged
		   }
	   }
	   for ( i in 1..2 ) {
		   
		   def uploadedFile = request.getFile('mripayload'+i)
		   if(!uploadedFile.empty){
			 println "Class: ${uploadedFile.class}"
			 println "Name: ${uploadedFile.name}"
			 println "OriginalFileName: ${uploadedFile.originalFilename}"
			 println "Size: ${uploadedFile.size}"
			 println "ContentType: ${uploadedFile.contentType}"
			 
			 def webRootDir = servletContext.getRealPath("/")
			 //def userDir = new File(webRootDir, "/files/${session.user.login}/${params.studyid}/mri")
			 def userDir = new File(webRootDir, "/pdf")
			 userDir.mkdirs()
			 def fileNameChanged= caseDetailsInstance.studyid+".mri."+i+".pdf"
			 uploadedFile.transferTo( new File( userDir, fileNameChanged))
			 caseDetailsInstance.('MRIReport'+i) = fileNameChanged
		   }
	   }
	   def admin=User.findByLogin("admin")
	   def dataEntryInstance=new DataEntry(studyid:params.studyid,
		   surgerytype:params.surgeryType1,
		   casestatus:"Unassigned",
		   owner:"Administrator",
		   imageid:"",
		   imagelocation:params.Status1,
		   filename_images:"",
		   filename_pathreport:"",
		   filename_mrireport:"",
		   surgical_center:"",
		   pathology_summary:"",
		   mri_summary:"",
		   track_logs:"").save(flush: true)
		   
	  def reviewQuestionsInstance = new ReviewQuestions(studyid:params.studyid, reviewer:admin).save(flush: true)
	  dataEntryInstance.addToReviews(reviewQuestionsInstance)

		if (caseDetailsInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'caseDetails.label', default: 'CaseDetails'), caseDetailsInstance.id])}"
			//redirect(action: "firstpage")
			redirect(action: "show_dataEntry_and_caseDetails", id: caseDetailsInstance.id)
		}
		else {
			flash.message = "Something wrong happens during saving"
			render(view: "create_dataEntry_and_caseDetails", model: [caseDetailsInstance: caseDetailsInstance])
		}
	}

	def show_dataEntry_and_caseDetails = {
		def caseDetailsInstance=CaseDetails.get(params.id)
		def dataEntryInstance=DataEntry.findByStudyid(caseDetailsInstance.studyid)
		if (!dataEntryInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dataEntry.label', default: 'DataEntry'), params.id])}"
			redirect(action: "list")
		}
		else {
			[dataEntryInstance: dataEntryInstance, caseDetailsInstance:caseDetailsInstance, GradingSubClassification:GradingSubClassification]
		}
	}

	def edit_dataEntry_and_caseDetails = {
		def caseDetailsInstance=CaseDetails.get(params.id)
		def dataEntryInstance=DataEntry.findByStudyid(caseDetailsInstance.studyid)

		if (!dataEntryInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dataEntry.label', default: 'DataEntry'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [dataEntryInstance: dataEntryInstance, caseDetailsInstance:caseDetailsInstance, GradingSubClassification:GradingSubClassification]
		}
	}
	def update_dataEntry_and_caseDetails = {
		def caseDetailsInstance = CaseDetails.get(params.id)
		def dataEntryInstance=DataEntry.findByStudyid(caseDetailsInstance.studyid)
		
		caseDetailsInstance.properties = params
		dataEntryInstance.studyid=params.studyid
		dataEntryInstance.reviews.each{r->
			r.studyid=params.studyid
		}
		dataEntryInstance.save(flush:true)
		/*
		def today=new Date()
		
	   for ( i in 1..6 ){
		   if (params['pdate'+i].format("MM/dd/yyyy")!=today.format("MM/dd/yyyy") && params['pdate'+i] < today)
		   		caseDetailsInstance.('surgeryDate'+i) = params['pdate'+i].format("MM/dd/yyyy")
	   }
	   for ( i in 1..2 ){
		   if (params['mdate'+i].format("MM/dd/yyyy")!=today.format("MM/dd/yyyy") && params['mdate'+i] < today)
		   		caseDetailsInstance.('MRIDate'+i) = params['mdate'+i].format("MM/dd/yyyy")
	   }
	   */
 
		
		for ( i in 1..6 ) {
				
			def uploadedFile = request.getFile('payload'+i)
			if(!uploadedFile.empty){
			  println "Class: ${uploadedFile.class}"
			  println "Name: ${uploadedFile.name}"
			  println "OriginalFileName: ${uploadedFile.originalFilename}"
			  println "Size: ${uploadedFile.size}"
			  println "ContentType: ${uploadedFile.contentType}"
			  
			  def webRootDir = servletContext.getRealPath("/")
			  def userDir = new File(webRootDir, "/pdf")
			  userDir.mkdirs()
			  def fileNameChanged= caseDetailsInstance.studyid+".path."+i+".pdf"
			  uploadedFile.transferTo( new File( userDir, fileNameChanged))
			  caseDetailsInstance.('ReportUrl'+i) = fileNameChanged
			}
		}
		for ( i in 1..2 ) {
			
			def uploadedFile = request.getFile('mripayload'+i)
			if(!uploadedFile.empty){
			  println "Class: ${uploadedFile.class}"
			  println "Name: ${uploadedFile.name}"
			  println "OriginalFileName: ${uploadedFile.originalFilename}"
			  println "Size: ${uploadedFile.size}"
			  println "ContentType: ${uploadedFile.contentType}"
			  
			  def webRootDir = servletContext.getRealPath("/")
			  def userDir = new File(webRootDir, "/pdf")
			  userDir.mkdirs()
			  def fileNameChanged= caseDetailsInstance.studyid+".mri."+i+".pdf"
			  uploadedFile.transferTo( new File( userDir, fileNameChanged))
			  caseDetailsInstance.('MRIReport'+i) = fileNameChanged
			}
		}

				
		if (!caseDetailsInstance.hasErrors() && caseDetailsInstance.save(flush: true)) {
			flash.message = "Update Successful."
			//redirect(action: "firstpage")
			redirect(action: "show_dataEntry_and_caseDetails", id: caseDetailsInstance.id)
		}
		else {
			flash.message = "Something wrong happens during saving"
			render(view: "edit_dataEntry_and_caseDetails", model: [caseDetailsInstance: caseDetailsInstance])
		}
	}

	
	def save = {
   	
        def dataEntryInstance = new DataEntry(params)
        def admin=braintumorpathologyreview.User.findByLogin("admin")
		
		def reviewQuestionsInstance = new ReviewQuestions()
		reviewQuestionsInstance.studyid=params.studyid
		reviewQuestionsInstance.reviewer=admin
		
		def caseDetailsInstance = new CaseDetails(params)
		caseDetailsInstance.studyid=params.studyid
		caseDetailsInstance.save(flush: true)
		
		dataEntryInstance.addToReviews(reviewQuestionsInstance)

       	    //handle uploaded file
       	    def uploadedFile = request.getFile('payload')
       	    if(!uploadedFile.empty){
       	      println "Class: ${uploadedFile.class}"
       	      println "Name: ${uploadedFile.name}"
       	      println "OriginalFileName: ${uploadedFile.originalFilename}"
       	      println "Size: ${uploadedFile.size}"
       	      println "ContentType: ${uploadedFile.contentType}"
       	      
       	      def webRootDir = servletContext.getRealPath("/")
       	      def userDir = new File(webRootDir, "/files/${session.user.login}/${params.studyid}/images")
       	      userDir.mkdirs()
       	      uploadedFile.transferTo( new File( userDir, uploadedFile.originalFilename))
       	      dataEntryInstance.filename_images = uploadedFile.originalFilename
       	    }
   	    def uploadedFile2 = request.getFile('payload2')
   	    if(!uploadedFile2.empty){
   	      println "Class: ${uploadedFile2.class}"
   	      println "Name: ${uploadedFile2.name}"
   	      println "OriginalFileName: ${uploadedFile2.originalFilename}"
   	      println "Size: ${uploadedFile2.size}"
   	      println "ContentType: ${uploadedFile2.contentType}"
   	      
   	      def webRootDir2 = servletContext.getRealPath("/")
   	      def userDir2 = new File(webRootDir2, "/files/${session.user.login}/${params.studyid}/path")
   	      userDir2.mkdirs()
   	      uploadedFile2.transferTo( new File( userDir2, uploadedFile2.originalFilename))
   	      dataEntryInstance.filename_pathreport = uploadedFile2.originalFilename
   	    }     
   	    def uploadedFile3 = request.getFile('payload3')
   	    if(!uploadedFile3.empty){
   	      println "Class: ${uploadedFile3.class}"
   	      println "Name: ${uploadedFile3.name}"
   	      println "OriginalFileName: ${uploadedFile3.originalFilename}"
   	      println "Size: ${uploadedFile3.size}"
   	      println "ContentType: ${uploadedFile3.contentType}"
   	      
   	      def webRootDir3 = servletContext.getRealPath("/")
   	      def userDir3 = new File(webRootDir3, "/files/${session.user.login}/${params.studyid}/mri")
   	      userDir3.mkdirs()
   	      uploadedFile3.transferTo( new File( userDir3, uploadedFile3.originalFilename))
   	      dataEntryInstance.filename_mrireport = uploadedFile3.originalFilename
   	    }  
       		 
        if (dataEntryInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'dataEntry.label', default: 'DataEntry'), dataEntryInstance.id])}"
            redirect(action: "show", id: dataEntryInstance.id)
        }
        else {
            render(view: "create", model: [dataEntryInstance: dataEntryInstance])
        }
    }

    def show = {
        def dataEntryInstance = DataEntry.get(params.id)
		def caseDetailsInstance=CaseDetails.findByStudyid(dataEntryInstance.studyid)
        if (!dataEntryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dataEntry.label', default: 'DataEntry'), params.id])}"
            redirect(action: "list")
        }
        else {
            [dataEntryInstance: dataEntryInstance, caseDetailsInstance:caseDetailsInstance]
        }
    }

    def edit = {
        def dataEntryInstance = DataEntry.get(params.id)
        if (!dataEntryInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dataEntry.label', default: 'DataEntry'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [dataEntryInstance: dataEntryInstance]
        }
    }

    def update = {
        def dataEntryInstance = DataEntry.get(params.id)
        if (dataEntryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dataEntryInstance.version > version) {
                    
                    dataEntryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dataEntry.label', default: 'DataEntry')] as Object[], "Another user has updated this DataEntry while you were editing")
                    render(view: "edit", model: [dataEntryInstance: dataEntryInstance])
                    return
                }
            }
            dataEntryInstance.properties = params
            
       	    //handle uploaded file
       	    def uploadedFile = request.getFile('payload')
       	    if(!uploadedFile.empty){
       	      println "Class: ${uploadedFile.class}"
       	      println "Name: ${uploadedFile.name}"
       	      println "OriginalFileName: ${uploadedFile.originalFilename}"
       	      println "Size: ${uploadedFile.size}"
       	      println "ContentType: ${uploadedFile.contentType}"
       	      
       	      def webRootDir = servletContext.getRealPath("/")
       	      def userDir = new File(webRootDir, "/files/${session.user.login}/${params.studyid}/images")
       	      userDir.mkdirs()
       	      uploadedFile.transferTo( new File( userDir, uploadedFile.originalFilename))
       	      dataEntryInstance.filename_images = uploadedFile.originalFilename
       	    }            
       	    def uploadedFile2 = request.getFile('payload2')
       	    if(!uploadedFile2.empty){
       	      println "Class: ${uploadedFile2.class}"
       	      println "Name: ${uploadedFile2.name}"
       	      println "OriginalFileName: ${uploadedFile2.originalFilename}"
       	      println "Size: ${uploadedFile2.size}"
       	      println "ContentType: ${uploadedFile2.contentType}"
       	      
       	      def webRootDir2 = servletContext.getRealPath("/")
       	      def userDir2 = new File(webRootDir2, "/files/${session.user.login}/${params.studyid}/path")
       	      userDir2.mkdirs()
       	      uploadedFile2.transferTo( new File( userDir2, uploadedFile2.originalFilename))
       	      dataEntryInstance.filename_pathreport = uploadedFile2.originalFilename
       	    }     
       	    def uploadedFile3 = request.getFile('payload3')
       	    if(!uploadedFile3.empty){
       	      println "Class: ${uploadedFile3.class}"
       	      println "Name: ${uploadedFile3.name}"
       	      println "OriginalFileName: ${uploadedFile3.originalFilename}"
       	      println "Size: ${uploadedFile3.size}"
       	      println "ContentType: ${uploadedFile3.contentType}"
       	      
       	      def webRootDir3 = servletContext.getRealPath("/")
       	      def userDir3 = new File(webRootDir3, "/files/${session.user.login}/${params.studyid}/mri")
       	      userDir3.mkdirs()
       	      uploadedFile3.transferTo( new File( userDir3, uploadedFile3.originalFilename))
       	      dataEntryInstance.filename_mrireport = uploadedFile3.originalFilename
       	    }                 
            if (!dataEntryInstance.hasErrors() && dataEntryInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dataEntry.label', default: 'DataEntry'), dataEntryInstance.id])}"
                redirect(action: "show", id: dataEntryInstance.id)
            }
            else {
                render(view: "edit", model: [dataEntryInstance: dataEntryInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dataEntry.label', default: 'DataEntry'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def dataEntryInstance = DataEntry.get(params.id)
        if (dataEntryInstance) {
            try {
                dataEntryInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'dataEntry.label', default: 'DataEntry'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'dataEntry.label', default: 'DataEntry'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dataEntry.label', default: 'DataEntry'), params.id])}"
            redirect(action: "list")
        }
    }
	def showcasedetails ={
		  def d = DataEntry.findByStudyid(params.id)
		  redirect(action:"show", id:d.id)
	  }
    def create_review ={
    	def dataEntryInstance = DataEntry.get(params.id)
    	def admin=braintumorpathologyreview.User.findByLogin("admin")
		def reviewQuestionsInstance = new ReviewQuestions()
		reviewQuestionsInstance.studyid=params.studyid
		reviewQuestionsInstance.reviewer=admin
		dataEntryInstance.addToReviews(reviewQuestionsInstance)

        if (dataEntryInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dataEntryInstance.version > version) {
                    
                    dataEntryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dataEntry.label', default: 'DataEntry')] as Object[], "Another user has updated this DataEntry while you were editing")
                    render(view: "edit", model: [dataEntryInstance: dataEntryInstance])
                    return
                }
            }
            dataEntryInstance.properties = params
            if (!dataEntryInstance.hasErrors() && dataEntryInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dataEntry.label', default: 'DataEntry'), dataEntryInstance.id])}"
				dataEntryInstance.casestatus="Unassigned"
				dataEntryInstance.owner="Administrator"
                redirect(action: "show", id: dataEntryInstance.id)
            }
            else {
                render(view: "edit", model: [dataEntryInstance: dataEntryInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dataEntry.label', default: 'DataEntry'), params.id])}"
            redirect(action: "list")
        }
    }
	def create_review_unassigned ={
		def dataEntryInstance = DataEntry.get(params.id)
		def admin=braintumorpathologyreview.User.findByLogin("admin")
		def reviewQuestionsInstance = new ReviewQuestions()
		reviewQuestionsInstance.studyid=params.studyid
		reviewQuestionsInstance.reviewer=admin
		dataEntryInstance.addToReviews(reviewQuestionsInstance)
			
		if (dataEntryInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (dataEntryInstance.version > version) {
					
					dataEntryInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dataEntry.label', default: 'DataEntry')] as Object[], "Another user has updated this DataEntry while you were editing")
					render(view: "edit", model: [dataEntryInstance: dataEntryInstance])
					return
				}
			}
			dataEntryInstance.properties = params
			if (!dataEntryInstance.hasErrors() && dataEntryInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'dataEntry.label', default: 'DataEntry'), dataEntryInstance.id])}"
				dataEntryInstance.casestatus="Unassigned"
				dataEntryInstance.owner="Administrator"

				redirect(action: "list_unassigned", id: dataEntryInstance.id)
			}
			else {
				render(view: "edit", model: [dataEntryInstance: dataEntryInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'dataEntry.label', default: 'DataEntry'), params.id])}"
			redirect(action: "list")
		}
	}
    
    def open_imagescope_sis_file = {
    	def sisfile="<SIS version='1.0'><Image><URL>"+params.imagelocation+"</URL><Authtok>Basic c29vLmlsLmtpbTpicmFpbnR1bW9y</Authtok></Image></SIS>"
    	response.setHeader("Content-disposition", "attachment; filename=image.sis")
    	render(contentType:"text/html", text:sisfile)
    		
    }
    def contact ={} 
	 
	def sendcontact = {
		  def coordinator= "moffitt.brain@gmail.com"
		  try {
	    		sendMail {
	    			to coordinator      // Email of Coordinator
	    			//subject "Brain Tumor Pathology Review - Contact"
	    			cc session.user.email
	    			subject "[Neuropathology review]: "+params.contactSubject
	    			//body    params.contactBody
	    			html "${params.contactBody}"+"<br/><br/>Sent from <a href='mailto:${session.user.email}'>${session.user.name}</a>"
	    		}
	    		flash.message = "Email sent to ${coordinator}"
	    	} catch(Exception e) {
	    		log.error "Problem sending email $e.message", e
	    		flash.message = "Email NOT sent"
	    	}
	    	flash.message = "Message sent to Coordinator (CC-ed to your email too)"
	    	redirect(action:"firstpage")
	    		
	}	  	  


}
