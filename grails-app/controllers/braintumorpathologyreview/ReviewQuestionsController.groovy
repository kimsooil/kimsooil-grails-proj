package braintumorpathologyreview

class ReviewQuestionsController {
	  def beforeInterceptor = [action:this.&authz, except:["index", "list"]]

	  def authz() {
	     if(!session.user) {
	          redirect(controller:"user", action:"login")
	          return false
	     }
	  }

	  def reviewStatus=["Unassigned", "New Assignment", "In Progress", "Re-review", "Incomplete", "Complete"]
      def VPscale=["Marked", "Moderate", "Focal"]
      def ExtentOligoList=["Extensive(>80%)", "Moderate(20~80%)", "Minimal(<20%)"]
	  def GemistocyticOptions=['Yes', 'No']
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


	

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

	def returnToMain ={
		redirect(controller:"dataEntry", action:"firstpage")
	}
    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [reviewQuestionsInstanceList: ReviewQuestions.list(params), reviewQuestionsInstanceTotal: ReviewQuestions.count()]
    }
    def list_unassigned = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        
        [reviewQuestionsInstanceList: ReviewQuestions.findAllByStatus("Unassigned"), reviewQuestionsInstanceTotal: ReviewQuestions.countByStatus("Unassigned")]
        //redirect(action: "list", params: params)
    }
	def list_newassignment = {
	    params.max = Math.min(params.max ? params.int('max') : 10, 100)
	        
	   [reviewQuestionsInstanceList: ReviewQuestions.findAllByStatus("New Assignment"), reviewQuestionsInstanceTotal: ReviewQuestions.countByStatus("New Assignment")]
	        //redirect(action: "list", params:[reviewQuestionsInstanceList: ReviewQuestions.findAllByStatus("New Assignment"), reviewQuestionsInstanceTotal: ReviewQuestions.countByStatus("New Assignment")])
	}	  
	def list_inprogress = {
	    params.max = Math.min(params.max ? params.int('max') : 10, 100)
		        
	   [reviewQuestionsInstanceList: ReviewQuestions.findAllByStatus("In Progress"), reviewQuestionsInstanceTotal: ReviewQuestions.countByStatus("In Progress")]
		        //redirect(action: "list", params: params)
	}	  
	def list_incomplete = {
	    params.max = Math.min(params.max ? params.int('max') : 10, 100)
			        
	   [reviewQuestionsInstanceList: ReviewQuestions.findAllByStatus("Incomplete"), reviewQuestionsInstanceTotal: ReviewQuestions.countByStatus("Incomplete")]
			        //redirect(action: "list", params: params)
	}	  
	def list_complete = {
	    params.max = Math.min(params.max ? params.int('max') : 10, 100)
				        
	   [reviewQuestionsInstanceList: ReviewQuestions.findAllByStatus("Complete"), reviewQuestionsInstanceTotal: ReviewQuestions.countByStatus("Complete")]
				        //redirect(action: "list", params: params)
	}	  

	  
    def create = {
        def reviewQuestionsInstance = new ReviewQuestions()
        reviewQuestionsInstance.properties = params
        
        
        return [reviewQuestionsInstance: reviewQuestionsInstance, VPscale:VPscale, ExtentOligoList:ExtentOligoList, GradingSubClassification:GradingSubClassification, PossibleSubClassification:PossibleSubClassification]
    }

    def save = {
        def reviewQuestionsInstance = new ReviewQuestions(params)
        if (reviewQuestionsInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), reviewQuestionsInstance.id])}"
            redirect(action: "show", id: reviewQuestionsInstance.id)
        }
        else {
            render(view: "create", model: [reviewQuestionsInstance: reviewQuestionsInstance])
        }
    }

    def show = {
        def reviewQuestionsInstance = ReviewQuestions.get(params.id)
        def dataEntryInstance=DataEntry.findByStudyid(reviewQuestionsInstance.studyid)
		def caseDetailsInstance=CaseDetails.findByStudyid(dataEntryInstance.studyid)
		

       
        if (!reviewQuestionsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
            redirect(action: "list")
        }
        else {
            //[completeDropdown:completeDropdown, reviewQuestionsInstance: reviewQuestionsInstance, dataEntryInstance:dataEntryInstance, reviewStatus:reviewStatus, VPscale:VPscale, ExtentOligoList:ExtentOligoList, GradingSubClassification:GradingSubClassification, PossibleSubClassification:PossibleSubClassification]
			[caseDetailsInstance:caseDetailsInstance, reviewQuestionsInstance: reviewQuestionsInstance, dataEntryInstance:dataEntryInstance, reviewStatus:reviewStatus, VPscale:VPscale, ExtentOligoList:ExtentOligoList, GradingSubClassification:GradingSubClassification, GemistocyticOptions:GemistocyticOptions]
        }
    }

    def edit = {
        def reviewQuestionsInstance = ReviewQuestions.get(params.id)
        def dataEntryInstance=DataEntry.findByStudyid(reviewQuestionsInstance.studyid)
		def caseDetailsInstance=CaseDetails.findByStudyid(dataEntryInstance.studyid)
		
        if (!reviewQuestionsInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
            redirect(action: "list")
        }
        else {
            //return [completeDropdown:completeDropdown, dataEntryInstance:dataEntryInstance, reviewQuestionsInstance: reviewQuestionsInstance, reviewStatus:reviewStatus, VPscale:VPscale, ExtentOligoList:ExtentOligoList, GradingSubClassification:GradingSubClassification, PossibleSubClassification:PossibleSubClassification]
			[caseDetailsInstance:caseDetailsInstance, reviewQuestionsInstance: reviewQuestionsInstance, dataEntryInstance:dataEntryInstance, reviewStatus:reviewStatus, VPscale:VPscale, ExtentOligoList:ExtentOligoList, GradingSubClassification:GradingSubClassification, GemistocyticOptions:GemistocyticOptions]
        }
        
    }
	def edit2 = {
		def reviewQuestionsInstance = ReviewQuestions.get(params.id)
		def dataEntryInstance=DataEntry.findByStudyid(reviewQuestionsInstance.studyid)
		def caseDetailsInstance=CaseDetails.findByStudyid(dataEntryInstance.studyid)
		
		if (!reviewQuestionsInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
			redirect(action: "list")
		}
		else {
			//return [completeDropdown:completeDropdown, dataEntryInstance:dataEntryInstance, reviewQuestionsInstance: reviewQuestionsInstance, reviewStatus:reviewStatus, VPscale:VPscale, ExtentOligoList:ExtentOligoList, GradingSubClassification:GradingSubClassification, PossibleSubClassification:PossibleSubClassification]
			[caseDetailsInstance:caseDetailsInstance, reviewQuestionsInstance: reviewQuestionsInstance, dataEntryInstance:dataEntryInstance, reviewStatus:reviewStatus, VPscale:VPscale, ExtentOligoList:ExtentOligoList, GradingSubClassification:GradingSubClassification]
		}
		
	}

    def update = {
        def reviewQuestionsInstance = ReviewQuestions.get(params.id)
        
        def old_status=reviewQuestionsInstance.status
        
        if (reviewQuestionsInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (reviewQuestionsInstance.version > version) {
                    
                    reviewQuestionsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'reviewQuestions.label', default: 'ReviewQuestions')] as Object[], "Another user has updated this ReviewQuestions while you were editing")
                    render(view: "edit", model: [reviewQuestionsInstance: reviewQuestionsInstance])
                    return
                }
            }
            reviewQuestionsInstance.properties = params

            if (session.user.login!="admin"){ // if role == reviewer
                if (reviewQuestionsInstance?.status=="Unassigned"){
                	if (params.completeDropdown=='Complete') 
                		reviewQuestionsInstance?.status = "Complete"
                	else if (params.completeDropdown=='Incomplete') 
                		reviewQuestionsInstance?.status = "Incomplete"
                	else 
                		reviewQuestionsInstance?.status = "New Assignment"
                }
                else if (reviewQuestionsInstance?.status=="New Assignment"){
                	if (params.completeDropdown=='Complete') 
                		reviewQuestionsInstance?.status = "Complete"
                	else if (params.completeDropdown=='Incomplete') 
                		reviewQuestionsInstance?.status = "Incomplete"
                	else 
                		reviewQuestionsInstance?.status = "In Progress"	                	
                }
                else if (reviewQuestionsInstance?.status=="In Progress"){
                	if (params.completeDropdown=='Complete') 
                		reviewQuestionsInstance?.status = "Complete"
                	else if (params.completeDropdown=='Incomplete') 
                		reviewQuestionsInstance?.status = "Incomplete"
                	// do nothing if 'complete' is not set
                }
                else if (reviewQuestionsInstance?.status=="Complete"){
                	if (params.completeDropdown=='Incomplete') 
                		reviewQuestionsInstance?.status = "Incomplete"
                }
                else if (reviewQuestionsInstance?.status=="Incomplete"){
                	if (params.completeDropdown=='Complete') 
                		reviewQuestionsInstance?.status = "Complete"
                }

                if (params.completeDropdown=='Complete or not?'){
                		reviewQuestionsInstance?.status = "In Progress"
                }	                             
            }
            else{ // if admin, can do anything
                if (old_status!=reviewQuestionsInstance?.status){ // override anything
                	// do nothing (actually changed status will be saved automatically)
                	if (params.completeDropdown=="Complete" && reviewQuestionsInstance?.status!="Complete"){
                		reviewQuestionsInstance?.status="Incomplete"
                		reviewQuestionsInstance?.complete=false
                	}
                }
                else {
                	if (params.completeDropdown=="Complete"){
	                	reviewQuestionsInstance.complete=true
	                	reviewQuestionsInstance.status="Complete"
	                }
	                else if (params.completeDropdown=="Incomplete"){ 
	                	reviewQuestionsInstance.complete=false
	                	reviewQuestionsInstance.status="Incomplete"
	                }
	                else if (params.completeDropdown=='Complete or not?'){
	                		reviewQuestionsInstance.status = "In Progress"
	                		reviewQuestionsInstance.complete=false
	                }
                }              	
            }
            
            
            if (!reviewQuestionsInstance.hasErrors() && reviewQuestionsInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), reviewQuestionsInstance.id])}"
                	
	               
                redirect(action: "show", id: reviewQuestionsInstance.id)
            }
            else {
                render(view: "edit", model: [reviewQuestionsInstance: reviewQuestionsInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def reviewQuestionsInstance = ReviewQuestions.get(params.id)
        if (reviewQuestionsInstance) {
            try {
                reviewQuestionsInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
            redirect(action: "list")
        }
    }
  	def showreviewdetails ={
		  def d = ReviewQuestions.get(params.id)
		  redirect(action:"show", id:d.id)
	}
	def sendEmail = {
		  def review = ReviewQuestions.get(params.id)

		  def userInstance=review.reviewer
	    	try {
	    		sendMail {
	    			to      "${userInstance.email}"
	    			subject "Brain Tumor Pathology Review - Notification ["+review.studyid+"]"
	    			html    g.render(template:'/email/assignmentNotification', model:[userInstance:userInstance])
	    		}
	    		flash.message = "Notification email sent to ${userInstance.email}"
	    	} catch(Exception e) {
	    		log.error "Problem sending email $e.message", e
	    		flash.message = "Confirmation email NOT sent"
	    	}
	    	flash.message = "Notification sent to "+userInstance.email
	    	redirect(controller:"dataEntry", acion:"list")
	    		
	}
	def assign ={
	        def reviewQuestionsInstance = ReviewQuestions.get(params.id)
	        if (!reviewQuestionsInstance) {
	            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
	            redirect(controller:"dataEntry", action: "list")
	        }
	        else {
	            return [reviewQuestionsInstance: reviewQuestionsInstance,]
	        }

	  }
	def update_after_assignment = {
		def reviewQuestionsInstance = ReviewQuestions.get(params.id)
		def dataEntryFound = DataEntry.findByStudyid(reviewQuestionsInstance.studyid)
		def dataEntryInstance = DataEntry.get(dataEntryFound.id)

		if (reviewQuestionsInstance) {

			reviewQuestionsInstance.properties = params
			if (!reviewQuestionsInstance.hasErrors() && reviewQuestionsInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), reviewQuestionsInstance.id])}"
					
				if (reviewQuestionsInstance?.reviewer.login!="admin"){
					if (reviewQuestionsInstance?.status=="Unassigned"){
						reviewQuestionsInstance?.status = "New Assignment"
					}
					else if (reviewQuestionsInstance?.status=="New Assignment"){
						reviewQuestionsInstance?.status = "In Progress"
					}
					else if (reviewQuestionsInstance?.complete==true){
						reviewQuestionsInstance?.status = "Complete"
					}
					dataEntryInstance.owner=reviewQuestionsInstance.reviewer.name
					dataEntryInstance.casestatus="New Assignment"
				}

				redirect(controller:"dataEntry", action: "show", id: dataEntryInstance.id)
				//redirect(action: "show", id: reviewQuestionsInstance.id)
				//redirect(controller:"dataEntry", action: "list")
			}
			else {
				render(view: "assign", model: [reviewQuestionsInstance: reviewQuestionsInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
			redirect(action: "list")
		}
	}
	def assign_unassigned ={
		def reviewQuestionsInstance = ReviewQuestions.get(params.id)
		if (!reviewQuestionsInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
			redirect(controller:"dataEntry", action: "list")
		}
		else {
			return [reviewQuestionsInstance: reviewQuestionsInstance]
		}

  }
	def assign_needs_more_info ={
		def reviewQuestionsInstance = ReviewQuestions.get(params.id)
		if (!reviewQuestionsInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
			redirect(controller:"dataEntry", action: "list")
		}
		else {
			return [reviewQuestionsInstance: reviewQuestionsInstance]
		}

  }
	def assign_rereview ={
		def reviewQuestionsInstance = ReviewQuestions.get(params.id)
		if (!reviewQuestionsInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
			redirect(controller:"dataEntry", action: "list")
		}
		else {
			return [reviewQuestionsInstance: reviewQuestionsInstance]
		}

  }
	def assign_rereview_complete ={
		def reviewQuestionsInstance = ReviewQuestions.get(params.id)
		if (!reviewQuestionsInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
			redirect(controller:"dataEntry", action: "list")
		}
		else {
			return [reviewQuestionsInstance: reviewQuestionsInstance]
		}

  }
	def doAssign_unassigned = {
		def reviewQuestionsInstance = ReviewQuestions.get(params.id)
		def dataEntryFound = DataEntry.findByStudyid(reviewQuestionsInstance.studyid)
		def dataEntryInstance = DataEntry.get(dataEntryFound.id)
		if (reviewQuestionsInstance) {

			reviewQuestionsInstance.properties = params
			if (!reviewQuestionsInstance.hasErrors() && reviewQuestionsInstance.save(flush: true)) {
				//flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), reviewQuestionsInstance.id])}"
				flash.message = "Assigned."

				reviewQuestionsInstance?.status = "New Assignment"
				reviewQuestionsInstance?.dateAssigned = new Date()

				dataEntryInstance.owner=reviewQuestionsInstance.reviewer.name
				dataEntryInstance.casestatus="New Assignment"
				dataEntryInstance.track_logs += "-=-["+reviewQuestionsInstance.lastUpdated.format('MM/dd/yyyy HH:mm')+": New Assigned to "+reviewQuestionsInstance.reviewer.name+"]"
				
				//redirect(action: "show", id: reviewQuestionsInstance.id)
				redirect(controller:"dataEntry", action: "list_unassigned")
			}
			else {
				render(view: "assign_unassigned", model: [reviewQuestionsInstance: reviewQuestionsInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
			redirect(controller:"dataEntry", action: "list_unassigned")
		}
	}
	def doAssign_needs_more_info = {
		def reviewQuestionsInstance = ReviewQuestions.get(params.id)
		def dataEntryFound = DataEntry.findByStudyid(reviewQuestionsInstance.studyid)
		def dataEntryInstance = DataEntry.get(dataEntryFound.id)
		if (reviewQuestionsInstance) {

			reviewQuestionsInstance.properties = params
			if (!reviewQuestionsInstance.hasErrors() && reviewQuestionsInstance.save(flush: true)) {
				//flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), reviewQuestionsInstance.id])}"
				flash.message = "Re-assigned."

				reviewQuestionsInstance?.status = "In Progress"
				reviewQuestionsInstance?.dateAssigned = new Date()
				
				dataEntryInstance.owner=reviewQuestionsInstance.reviewer.name
				dataEntryInstance.casestatus="In Progress"
				dataEntryInstance.track_logs += "-=-["+reviewQuestionsInstance.lastUpdated.format('MM/dd/yyyy HH:mm')+": Re-assigned]"
				//redirect(action: "show", id: reviewQuestionsInstance.id)
				redirect(controller:"dataEntry", action: "list_needs_info")
			}
			else {
				render(view: "assign_needs_more_info", model: [reviewQuestionsInstance: reviewQuestionsInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
			redirect(controller:"dataEntry", action: "list_needs_info")
		}
	}
	def doAssign_needs_more_info_and_sending_message = {
		def reviewQuestionsInstance = ReviewQuestions.get(params.id)
		def dataEntryFound = DataEntry.findByStudyid(reviewQuestionsInstance.studyid)
		def dataEntryInstance = DataEntry.get(dataEntryFound.id)
		if (reviewQuestionsInstance) {

			reviewQuestionsInstance.properties = params
			reviewQuestionsInstance?.status = "In Progress"
			reviewQuestionsInstance?.dateAssigned = new Date()
			
			if (!reviewQuestionsInstance.hasErrors() && reviewQuestionsInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), reviewQuestionsInstance.id])}"
					

				//reviewQuestionsInstance?.status = "In Progress"
				//reviewQuestionsInstance?.dateAssigned = new Date()
				
				dataEntryInstance.owner=reviewQuestionsInstance.reviewer.name
				dataEntryInstance.casestatus="In Progress"
				//redirect(action: "show", id: reviewQuestionsInstance.id)
				//redirect(controller:"dataEntry", action: "list_needs_info")
				//
				// sending message too... copied from sendcontact3()
				//
				def now=new Date()
				try {
					  sendMail {
						  to reviewQuestionsInstance.reviewer.email      // Email of Coordinator
						  //subject "Brain Tumor Pathology Review - Contact"
						  //cc session.user.email
						  //subject "[Neuropathology review]: "+params.contactSubject
						  subject "[Neuropathology review]: ReAssigned - "+reviewQuestionsInstance.studyid
						  //body    params.contactBody
						  html "${params.contactBody}"+"<br/><br/>Sent from <a href='mailto:${session.user.email}'>${session.user.name}</a>"
					  }
					  
				  } catch(Exception e) {
					  log.error "Problem sending email $e.message", e
					  flash.message = "Email NOT sent"
				  }
				  def aMessage = "-=-["+now.format('MM/dd/yyyy HH:mm')+": Admin: &quot;"+params.contactBody+"&quot;]"
				  reviewQuestionsInstance.messages += aMessage
				  dataEntryInstance.track_logs += aMessage
				  //dataEntryInstance.track_logs += "-=-["+now.format('MM/dd/yyyy')+": ReAssigned to "+reviewQuestionsInstance.reviewer.name+"]"
				  
				  flash.message = "Re-assigned & Notified via Email."
				  //flash.message=r.messages
				  //redirect(controller:"reviewQuestions", action:"show", id:params.id)
				  redirect(controller:"dataEntry", action:"list_needs_info")
	   
			}
			else {
				render(view: "assign_needs_more_info", model: [reviewQuestionsInstance: reviewQuestionsInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
			redirect(controller:"dataEntry", action: "list_needs_info")
		}
	}
	def doAssign_rereview = {
		def reviewQuestionsInstance = ReviewQuestions.findById(params.id)
		
		def dataEntryFound = DataEntry.findByStudyid(params.studyid)
		def dataEntryInstance = DataEntry.get(dataEntryFound.id)

		def reviewQuestionsInstanceNew = new ReviewQuestions()
	
		if (reviewQuestionsInstanceNew && params.reviewer.id!='') {
			reviewQuestionsInstanceNew.studyid=dataEntryInstance.studyid
			reviewQuestionsInstanceNew.cycle="2"
			reviewQuestionsInstanceNew.reviewer=User.findById(params.reviewer.id)
			dataEntryInstance.addToReviews(reviewQuestionsInstanceNew) // saving new
			
			//reviewQuestionsInstance.properties = params
			if (reviewQuestionsInstanceNew.save(flush: true)) {
				flash.message = "2nd reviewer assigned"

				//reviewQuestionsInstance?.status = "New Assignment"
				reviewQuestionsInstanceNew.status = "New Assignment"
				reviewQuestionsInstanceNew.status = "Complete"
				reviewQuestionsInstanceNew.dateAssigned = new Date()

				dataEntryInstance.owner=reviewQuestionsInstanceNew.reviewer.name
				dataEntryInstance.casestatus="New Assignment"
				dataEntryInstance.track_logs += "-=-["+reviewQuestionsInstanceNew.lastUpdated.format('MM/dd/yyyy HH:mm')+": Assigned To "+reviewQuestionsInstanceNew.reviewer.name+"]"
				//redirect(action: "show", id: reviewQuestionsInstance.id)
				redirect(controller:"dataEntry", action: "list_completed_rereview")
			}
			else {
				render(view: "assign_rereview", model: [reviewQuestionsInstance: reviewQuestionsInstanceNew])
			}
		}
		else {
			flash.message = "Not found"
			redirect(controller:"dataEntry", action: "list_completed_rereview")
		}
	}
	def doAssign_rereview_complete = {
		def reviewQuestionsInstance = ReviewQuestions.findById(params.id)
		
		def dataEntryFound = DataEntry.findByStudyid(params.studyid)
		def dataEntryInstance = DataEntry.get(dataEntryFound.id)

		def reviewQuestionsInstanceNew = new ReviewQuestions()
		
		if (reviewQuestionsInstanceNew && params.reviewer.id!='') {
			reviewQuestionsInstanceNew.studyid=dataEntryInstance.studyid
			reviewQuestionsInstanceNew.cycle="2"
			reviewQuestionsInstanceNew.reviewer=User.findById(params.reviewer.id)
			reviewQuestionsInstanceNew.Notes=params.notes
			
			dataEntryInstance.addToReviews(reviewQuestionsInstanceNew) // saving new...
			
			//reviewQuestionsInstance.properties = params
			if (reviewQuestionsInstanceNew.save(flush: true)) {
				flash.message = "Reviewer assigned without changing cycle"

				//reviewQuestionsInstance?.status = "New Assignment"
				reviewQuestionsInstanceNew.status = "New Assignment"
				//reviewQuestionsInstanceNew.status = "Complete"
				reviewQuestionsInstanceNew.dateAssigned = new Date()

				dataEntryInstance.owner=reviewQuestionsInstanceNew.reviewer.name
				dataEntryInstance.casestatus="New Assignment"
				dataEntryInstance.track_logs += "-=-["+reviewQuestionsInstanceNew.lastUpdated.format('MM/dd/yyyy HH:mm')+": Assigned To "+reviewQuestionsInstanceNew.reviewer.name+"]"
				//redirect(action: "show", id: reviewQuestionsInstance.id)
				redirect(controller:"dataEntry", action: "list_completed_rereview_v2")
			}
			else {
				render(view: "assign_rereview_complete", model: [reviewQuestionsInstance: reviewQuestionsInstanceNew])
			}
		}
		else {
			flash.message = "Not found or Exceed the maximum number of reviews per case"
			redirect(controller:"dataEntry", action: "list_completed_rereview_v2")
		}
	}
	def do_save_finish_later = {
		def reviewQuestionsInstance = ReviewQuestions.get(params.id)
		def dataEntryInstance = DataEntry.findByStudyid(reviewQuestionsInstance.studyid)
		
		def caseDetailsInstance=CaseDetails.findByStudyid(dataEntryInstance.studyid)

		def now=new Date()
		
		if (reviewQuestionsInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (reviewQuestionsInstance.version > version) {
					
					reviewQuestionsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'reviewQuestions.label', default: 'ReviewQuestions')] as Object[], "Another user has updated this ReviewQuestions while you were editing")
					render(view: "edit", model: [caseDetailsInstance:caseDetailsInstance, reviewQuestionsInstance: reviewQuestionsInstance, dataEntryInstance:dataEntryInstance, reviewStatus:reviewStatus, VPscale:VPscale, ExtentOligoList:ExtentOligoList, GradingSubClassification:GradingSubClassification, GemistocyticOptions:GemistocyticOptions])
					return
				}
			}
			reviewQuestionsInstance.properties = params
			//reviewQuestionsInstance.gemistocytic=params.gemistocyticSelected=="Yes" ? true : false
			
			if (!reviewQuestionsInstance.hasErrors() && reviewQuestionsInstance.save(flush: true) && dataEntryInstance.save(flush: true)) {
				//flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), reviewQuestionsInstance.id])}"
					//flash.message += "("+params.gemistocyticSelected+")"
				//flash.message ="Saved."
				//dataEntryInstance.owner="Administrator"
				dataEntryInstance.casestatus="In Progress"
				reviewQuestionsInstance.status="In Progress"

				dataEntryInstance.track_logs += "-=-["+now.format('MM/dd/yyyy HH:mm')+": Saved by "+reviewQuestionsInstance.reviewer.name+"]"
				//redirect(action: "show", id: reviewQuestionsInstance.id)
				redirect(controller:"dataEntry", action:"firstpage")
			}
			else {
				render(view: "edit", model: [caseDetailsInstance:caseDetailsInstance, reviewQuestionsInstance: reviewQuestionsInstance, dataEntryInstance:dataEntryInstance, reviewStatus:reviewStatus, VPscale:VPscale, ExtentOligoList:ExtentOligoList, GradingSubClassification:GradingSubClassification, GemistocyticOptions:GemistocyticOptions])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
			redirect(action: "list")
		}
	}

	def contact2 ={
		def reviewQuestionsInstance=ReviewQuestions.get(params.id)
		
		reviewQuestionsInstance.properties = params
		reviewQuestionsInstance.gemistocytic=params.gemistocyticSelected=="Yes" ? true : false

		if (reviewQuestionsInstance) {
			reviewQuestionsInstance.properties = params
			reviewQuestionsInstance.gemistocytic=params.gemistocyticSelected=="Yes" ? true : false
			
			if (!reviewQuestionsInstance.hasErrors() && reviewQuestionsInstance.save(flush: true)) {
				//flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), reviewQuestionsInstance.id])}"
				//flash.message = "Dx: "+params.gradingSubClassification
				//flash.message = "All changes are saved. This review will be locked until Admin do action(s) & re-assign."
				flash.message ="What do you need in order to complete this review?"
				//dataEntryInstance.owner="Administrator"
				//dataEntryInstance.casestatus="In Progress"
				//reviewQuestionsInstance.status="In Progress"

				//dataEntryInstance.track_logs += "-=-["+now.format('MM/dd/yyyy hh:mm')+": Saved]"
				//redirect(action: "show", id: reviewQuestionsInstance.id)
			}
			else {
				//render(view: "edit", model: [reviewQuestionsInstance: reviewQuestionsInstance])
				flash.message = "Error(1)"
				redirect(action: "show", id: reviewQuestionsInstance.id)
			}
		}
		else {
			//flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
			flash.message = "Error(1)"
			redirect(action: "show", id: reviewQuestionsInstance.id)
		}

		
		flash.reviewQuestionsInstance=reviewQuestionsInstance
	
		[r:reviewQuestionsInstance]

	}
	
   def sendcontact2 = {
		 def coordinator= "moffitt.brain@gmail.com"
		 def r=ReviewQuestions.get(params.id)
		 def dataEntryFound = DataEntry.findByStudyid(r.studyid)
		 def d= DataEntry.get(dataEntryFound.id)
		 def now=new Date()
		 //d.track_logs += "-=-["+now.format('MM/dd/yyyy hh:mm')+": ReqInfo]"
		 def aMessage = "-=-["+now.format('MM/dd/yyyy HH:mm')+": "+session.user.name+": &quot;"+params.contactBody+"&quot;]"
		 try {
			   sendMail {
				   to coordinator      // Email of Coordinator
				   //subject "Brain Tumor Pathology Review - Contact"
				   cc session.user.email
				   //subject "[Neuropathology review]: "+params.contactSubject
				   subject "[Neuropathology review]: ReqInfo for "+r
				   //body    params.contactBody
				   html "${params.contactBody}"+"<br/><br/>Sent from <a href='mailto:${session.user.email}'>${session.user.name}</a>"
			   }
			   
		   } catch(Exception e) {
			   log.error "Problem sending email $e.message", e
			   flash.message = "Email NOT sent"
		   }
		   d.owner="Administrator"
		   d.casestatus="Needs More Info"
		   r.status="Needs More Info"


		   r.messages += aMessage
		   d.track_logs += aMessage
		   
		   flash.message = "Message sent to Coordinator."
		   //flash.message=r.messages
		   //redirect(controller:"reviewQuestions", action:"do_save_finish_later", id:params.id, params:params)
		   //redirect(controller:"reviewQuestions", action:"show", id:params.id)
		   //redirect(controller:"reviewQuestions", action:"do_request_more_info", id:params.id, params:params)
		   //return [params:params]
		   redirect(controller:"dataEntry", action:"firstpage")
   }

	
	def do_request_more_info = {
		def reviewQuestionsInstance = ReviewQuestions.get(params.id)
		def dataEntryFound = DataEntry.findByStudyid(reviewQuestionsInstance.studyid)
		def dataEntryInstance = DataEntry.get(dataEntryFound.id)
		
		def now=new Date()
		if (reviewQuestionsInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (reviewQuestionsInstance.version > version) {
					
					reviewQuestionsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'reviewQuestions.label', default: 'ReviewQuestions')] as Object[], "Another user has updated this ReviewQuestions while you were editing")
					render(view: "edit", model: [reviewQuestionsInstance: reviewQuestionsInstance])
					return
				}
			}
			reviewQuestionsInstance.properties = params
			//reviewQuestionsInstance.gemistocytic=params.gemistocyticSelected=="Yes" ? true : false
			if (!reviewQuestionsInstance.hasErrors() && reviewQuestionsInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), reviewQuestionsInstance.id])}"
					
				dataEntryInstance.owner="Administrator"
				dataEntryInstance.casestatus="Needs More Info"
				reviewQuestionsInstance.status="Needs More Info"

				dataEntryInstance.track_logs += "-=-["+now.format('MM/dd/yyyy hh:mm')+": ReqInfo]"
				//redirect(action: "show", id: reviewQuestionsInstance.id)
				redirect(controller:"dataEntry", action:"firstpage")
			}
			else {
				render(view: "edit", model: [reviewQuestionsInstance: reviewQuestionsInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
			redirect(action: "list")
		}
	}
	def do_review_complete = {
		def reviewQuestionsInstance = ReviewQuestions.get(params.id)
		
		def dataEntryFound = DataEntry.findByStudyid(reviewQuestionsInstance.studyid)
		def dataEntryInstance = DataEntry.get(dataEntryFound.id)
		def caseDetailsInstance=CaseDetails.findByStudyid(dataEntryInstance.studyid)
		def now=new Date()
		
		if (reviewQuestionsInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (reviewQuestionsInstance.version > version) {
					
					reviewQuestionsInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'reviewQuestions.label', default: 'ReviewQuestions')] as Object[], "Another user has updated this ReviewQuestions while you were editing")
					render(view: "edit", model: [caseDetailsInstance:caseDetailsInstance, reviewQuestionsInstance: reviewQuestionsInstance, dataEntryInstance:dataEntryInstance, reviewStatus:reviewStatus, VPscale:VPscale, ExtentOligoList:ExtentOligoList, GradingSubClassification:GradingSubClassification, GemistocyticOptions:GemistocyticOptions])
					return
				}
			}
			reviewQuestionsInstance.properties = params
			//reviewQuestionsInstance.gemistocytic=params.gemistocyticSelected=="Yes" ? true : false
			if (!reviewQuestionsInstance.hasErrors() && reviewQuestionsInstance.save(flush: true)) {
				//flash.message = "${message(code: 'default.updated.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), reviewQuestionsInstance.id])}"
				//flash.message ="Saved."
				dataEntryInstance.owner="Administrator"
				if ((reviewQuestionsInstance.levelOfDiagnosticCertainty!="3(high)"
					|| reviewQuestionsInstance.gradingSubClassification=="8"
					|| reviewQuestionsInstance.gradingSubClassification=="8A"
					|| reviewQuestionsInstance.gradingSubClassification=="8B"
					|| reviewQuestionsInstance.gradingSubClassification=="8C"
					|| reviewQuestionsInstance.gradingSubClassification=="9"
					) && (dataEntryInstance.reviews.size()!=2)){ // no 3rd-review. Stop after 2nd-review
					dataEntryInstance.casestatus="Re-review"
					reviewQuestionsInstance.status="Re-review"
					reviewQuestionsInstance.dateCompleted=new Date()
					dataEntryInstance.track_logs += "-=-["+now.format('MM/dd/yyyy HH:mm')+": Completed/Rereview _"+dataEntryInstance.id+" "+reviewQuestionsInstance.id+"_]"
				} else{
					dataEntryInstance.casestatus="Completed"
					reviewQuestionsInstance.status="Complete"
					reviewQuestionsInstance.dateCompleted=new Date()
					dataEntryInstance.track_logs += "-=-["+now.format('MM/dd/yyyy HH:mm')+": Completed _"+dataEntryInstance.id+" "+reviewQuestionsInstance.id+"_]"
				}
				//flash.message = reviewQuestionsInstance.gradingSubClassification
				//redirect(action: "show", id: reviewQuestionsInstance.id)
				redirect(controller:"dataEntry", action:"firstpage")
			}
			else {
				render(view: "edit", model: [caseDetailsInstance:caseDetailsInstance, reviewQuestionsInstance: reviewQuestionsInstance, dataEntryInstance:dataEntryInstance, reviewStatus:reviewStatus, VPscale:VPscale, ExtentOligoList:ExtentOligoList, GradingSubClassification:GradingSubClassification, GemistocyticOptions:GemistocyticOptions])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'reviewQuestions.label', default: 'ReviewQuestions'), params.id])}"
			redirect("list")
		}
	}

	def ajaxToggleNecrosis = {
		if (params.necrosisSelected == 'true'){
			render "Checked"
		}
		else
			render "Not checked"
	}
	def ajaxCheckError = {
		def gsc=params.gsc
		if (gsc == '1' || gsc=='2' || gsc=='3' || gsc=='4' || gsc=='5' || gsc=='6' || gsc=='7' || gsc=='8'){
			render "Not valid classification - Choose other"
		}
		else
			render ""
	}
	def contact3 ={
		def r=ReviewQuestions.get(params.id)
		[r:r]
	}
	
   def sendcontact3 = {
		 def coordinator= "moffitt.brain@gmail.com"
		 def r=ReviewQuestions.get(params.id)
 
		 def now=new Date()
		 try {
			   sendMail {
				   to r.reviewer.email      // Email of Coordinator
				   //subject "Brain Tumor Pathology Review - Contact"
				   //cc session.user.email
				   //subject "[Neuropathology review]: "+params.contactSubject
				   subject "[Neuropathology review]: Reply for "+r.studyid
				   //body    params.contactBody
				   html "${params.contactBody}"+"<br/><br/>Sent from <a href='mailto:${session.user.email}'>${session.user.name}</a>"
			   }
			   
		   } catch(Exception e) {
			   log.error "Problem sending email $e.message", e
			   flash.message = "Email NOT sent"
		   }
		   r.messages += "-=-["+now.format('MM/dd')+"(Admin):"+params.contactBody+"]"
		   flash.message = "Message sent to Coordinator (CC-ed to your email too)"
		   //flash.message=r.messages
		   //redirect(controller:"reviewQuestions", action:"show", id:params.id)
		   redirect(controller:"dataEntry", action:"list_needs_info")
			   
   }
 
}
