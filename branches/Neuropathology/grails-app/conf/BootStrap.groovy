import org.codehaus.groovy.grails.commons.ApplicationHolder
import braintumorpathologyreview.DataSourceUtils

class BootStrap {

     def init = { servletContext ->
	 
	DataSourceUtils.tune(servletContext) // fix for the database killing idle connections : see more http://tinyurl.com/2fjsoq7
	 
	/*
	 * how to upload data
	 * 1. obtain excel files
	 * 2. normalize the number of columns by adding omitted columns
	 * 3. if last columns' data is empty, add a space
	 * 4. save as "tab-limited text file"
	 * 5. place the file into /conf/resources/
	 * 6. change the filepath in BootStrap.groovy
	 * 7. copy newly-added pdf files into /web-app/pdf/ from H:\Brain Tumor (Egan)\Slide Requests\Scanned Documents
         ****** (To Do) IF "Not Available" should not find the pdf file. (Even though file exist, ignore/mark as "Not Available".
	 * 8. run in development environment after changing "def dataUpload=true"
	 * 9. run sql on review_questions table: "UPDATE review_questions SET reviewer_id=1 WHERE reviewer_id IS NULL"
	 ****. (Test in local machine) See if unassigned case can be assigned to existing reviewer(s)
	 * 10. If all works, deploy to test site (http://kimsivm2/... Apache+mod_jk+Tomcat)
	 * 11. after deploying (droping .war file under TOMCAT/APP_NAME/webapps/), copy newly-added pdf files need to be copied into TOMCAT/webapps/pdf/
	 * 12. That's all.
	 */
	
     environments  {
         development { // rename to "development" for execute the line here 
			def dataUpload=false
			def WantToAddUsers=false
			
			def admin=null, melissa=null, egankm=null, kristen=null, yachnisa=null, nikols=null 
    	 	//if (!braintumorpathologyreview.User.findByLogin("admin")){     	 
			if (dataUpload){
				if (WantToAddUsers){
		         admin=new braintumorpathologyreview.User(login:"admin", password:"password", email:"soo.kim@moffitt.org", name:"Administrator", role:"admin").save()
		         //def kimsooil=new braintumorpathologyreview.User(login:"kimsooil", password:"password", email:"soo.kim@moffitt.org", name:"SOO IL KIM", role:"reviewer").save()
		         melissa=new braintumorpathologyreview.User(login:"melissa", password:"password", email:"Melissa.Madden@moffitt.org", name:"Melissa Madden", role:"reviewer").save()
		         egankm=new braintumorpathologyreview.User(login:"egankm", password:"password", email:"egankm@moffitt.org", name:"Kathleen Egan", role:"reviewer").save()
				 kristen=new braintumorpathologyreview.User(login:"kristen", password:"password", email:"kristen.niemeyer@moffitt.org", name:"Kristen Niemeyer", role:"reviewer").save()
				 yachnisa=new braintumorpathologyreview.User(login:"yachnisa", password:"moffitt", email:"yachnis@pathology.ufl.edu", name:"Anthony T. Yachnis", role:"reviewer").save()
				 nikols=new braintumorpathologyreview.User(login:"nikols", password:"moffitt", email:"hilary.highfield.nickols@Vanderbilt.Edu", name:"Hilary Highfield Nikols", role:"reviewer").save()
				}
				 def NumberOfFound=0;
				 //def filePath = "resources/DummyData2010.08.05.txt"
				 //def filePath = "resources/DataUpload1.2010.09.13-normalized.txt"
				 //def filePath = "resources/braintumorpathologyreview-normalized-DataUpload2-2011-04-14v2-2.txt" // /conf/resource/...
                                 def filePath = "resources/DataUpload3.2011.09.15-v1.txt"
				 
				 def fstream = ApplicationHolder.application.parentContext.getResource("classpath:$filePath").inputStream
				 fstream.toCsvReader(['separatorChar':'\t','escapeChar':'|']).eachLine { tokens ->
					 System.out.println(tokens)
					 //log.info tokens
						def c=new braintumorpathologyreview.CaseDetails(
																	  subject_initials:tokens[0],
																	  studyid:tokens[1],
																	  gliomaOrMeningioma:tokens[2],
																	  
																	  surgeryDate1:tokens[3],
																	  surgeryType1:tokens[4],
																	  reviewType1:tokens[5],
																	  SurgPathNum1:tokens[6],
																	  Diagnosis1:tokens[7],
																	  Site1:tokens[8],
																	  ReportUrl1:tokens[9],
																	  pshow1: tokens[9]?true:false,
																	  
																	  surgeryDate2:tokens[10],
																	  surgeryType2:tokens[11],
																	  reviewType2:tokens[12],
																	  SurgPathNum2:tokens[13],
																	  Diagnosis2:tokens[14],
																	  Site2:tokens[15],
																	  ReportUrl2:tokens[16],
																	  pshow2: tokens[16]?true:false,
																	  
																	  surgeryDate3:tokens[17],
																	  surgeryType3:tokens[18],
																	  reviewType3:tokens[19],
																	  SurgPathNum3:tokens[20],
																	  Diagnosis3:tokens[21],
																	  Site3:tokens[22],
																	  ReportUrl3:tokens[23],
																	  pshow3: tokens[23]?true:false,
																	  
																	  surgeryDate4:tokens[24],
																	  surgeryType4:tokens[25],
																	  reviewType4:tokens[26],
																	  SurgPathNum4:tokens[27],
																	  Diagnosis4:tokens[28],
																	  Site4:tokens[29],
																	  ReportUrl4:tokens[30],
																	  pshow4: tokens[30]?true:false,
																	  
																	  surgeryDate5:tokens[31],
																	  surgeryType5:tokens[32],
																	  reviewType5:tokens[33],
																	  SurgPathNum5:tokens[34],
																	  Diagnosis5:tokens[35],
																	  Site5:tokens[36],
																	  ReportUrl5:tokens[37],
																	  pshow5: tokens[37]?true:false,
																	  
																	  surgeryDate6:tokens[38],
																	  surgeryType6:tokens[39],
																	  reviewType6:tokens[40],
																	  SurgPathNum6:tokens[41],
																	  Diagnosis6:tokens[42],
																	  Site6:tokens[43],
																	  ReportUrl6:tokens[44],
																	  pshow6: tokens[44]?true:false,
																	  
																	  MRIDate1:tokens[45],
																	  MRISummary1:tokens[46],
																	  MRIReport1:tokens[47],
																	  mshow1: tokens[47]?true:false,
																	  
																	  MRIDate2:tokens[48],
																	  MRISummary2:tokens[49],
																	  MRIReport2:tokens[50],
																	  mshow2: tokens[50]?true:false,
																	  
																	  SurgType1:tokens[51],
																	  StainType1:tokens[52],
																	  imageid1:tokens[53],
																	  sshow1: tokens[53]?true:false,
																	  
																	  SurgType2:tokens[54],
																	  StainType2:tokens[55],
																	  imageid2:tokens[56],
																	  sshow2: tokens[56]?true:false,
																	  
																	  SurgType3:tokens[57],
																	  StainType3:tokens[58],
																	  imageid3:tokens[59],
																	  sshow3: tokens[59]?true:false,
																	  
																	  SurgType4:tokens[60],
																	  StainType4:tokens[61],
																	  imageid4:tokens[62],
																	  sshow4: tokens[62]?true:false,
																	  
																	  SurgType5:tokens[63],
																	  StainType5:tokens[64],
																	  imageid5:tokens[65],
																	  sshow5: tokens[65]?true:false,
																	  
																	  SurgType6:tokens[66],
																	  StainType6:tokens[67],
																	  imageid6:tokens[68],
																	  //sshow6: tokens[68]?true:false).save()
																	  sshow6: tokens[68]?true:false,
																	  case_note:tokens[69]).save() // case_note is added for 2nd data set
																	  
				def webRootDir = servletContext.getRealPath("/") // /web-app/pdf (need to be uploaded to the server separately in order to be found

				for ( i in 1..6 ) {

					def Found=false
					def fileNameOnly=""
					new File(webRootDir, "/pdf").eachFileRecurse {file->
						def sp=file.name.split("\\\\")
						fileNameOnly = sp[sp.size()-1]
						if (file.isFile() && ((fileNameOnly.toLowerCase()==c.studyid+".path."+i+".pdf") ||(fileNameOnly.toLowerCase()=="0"+c.studyid+".path."+i+".pdf"))){
							Found=true
							NumberOfFound++;
						
							if (c.('ReportUrl'+i).toLowerCase()=="not available")
								log.error "Not available but found: "+fileNameOnly  	
							if (fileNameOnly!=fileNameOnly.toLowerCase())
									//System.out.println("*** Found "+fileNameOnly)
									log.info "*** Found "+fileNameOnly
							else 
									//System.out.println("Found "+fileNameOnly)
									log.info "Found "+fileNameOnly
							c.('ReportUrl'+i)= Found ? fileNameOnly : "N/A"
						}

					}
					if (c.('ReportUrl'+i).toLowerCase()=="available" && !Found)
					log.error "Available but not found: "+fileNameOnly

				}
				for ( i in 1..2 ) {

					def Found=false
					def fileNameOnly=""
					new File(webRootDir, "/pdf").eachFileRecurse {file->
						def sp=file.name.split("\\\\")
						fileNameOnly = sp[sp.size()-1]

						if (file.isFile() && ((fileNameOnly.toLowerCase()==c.studyid+".mri."+i+".pdf")||(fileNameOnly.toLowerCase()=="0"+c.studyid+".mri."+i+".pdf"))){
							Found=true
							NumberOfFound++;

							if (c.('MRIReport'+i)=="Not available")
							log.error "Not available but found: "+fileNameOnly

							if (fileNameOnly!=fileNameOnly.toLowerCase())
									//System.out.println("*** Found "+fileNameOnly)
									log.info "*** Found "+fileNameOnly
							else 
									//System.out.println("Found "+fileNameOnly)
									log.info "Found "+fileNameOnly
							c.('MRIReport'+i)= Found ? fileNameOnly : "N/A"
						}
					}
					if (c.('MRIReport'+i)=="Available" && !Found)
					log.error "Available but not found: "+fileNameOnly

				}
				for ( i in 1..6 ) {
					def sp=c.('imageid'+i).split("\\\\")
					def imageidOnly=sp[sp.size()-1]
					c.('imageid'+i)=imageidOnly
					if (c.('StainType'+i)=="Ki67" || c.('StainType'+i)=="MIB-1") c.('StainType'+i)= "Ki67/MIB-1"
					if (imageidOnly=="" && c.('SurgType'+i)!="" && c.('StainType'+i)!=""){
						 c.('sshow'+i)= true
						 c.('imageid'+i)="Available Upon Request"
					}
				}
				c.save(flush:true)
				def dataEntryInstance=new braintumorpathologyreview.DataEntry(studyid:c.studyid,
					 surgerytype:c.surgeryType1,
					 casestatus:"Unassigned",
					 owner:"Administrator",
					 imageid:"",
					 imagelocation:"",
					 filename_images:"", 
					 filename_pathreport:"", 
					 filename_mrireport:"", 
					 surgical_center:"", 
					 pathology_summary:"", 
					 mri_summary:"", 
					 track_logs:"").save()
					 
				def reviewQuestionsInstance = new braintumorpathologyreview.ReviewQuestions()
				reviewQuestionsInstance.studyid=c.studyid
				def adminid=braintumorpathologyreview.User.findByLogin('admi')
				reviewQuestionsInstance.reviewer=admin ? admin : braintumorpathologyreview.User.get(admin)
				reviewQuestionsInstance.save(); // go to Phymyadmin, review_questions's review_id need to be filled with admin's id(1). -- manually for now...
				dataEntryInstance.addToReviews(reviewQuestionsInstance)
			}
			log.info "Number of PDF files found: "+NumberOfFound
						
 	 	}
         }
	     production{} 
	   }
     
     }
     def destroy = {
     }
} 

//surgerytype(inList:["Biopsy","Resection", "2nd Resection", "3rd Resection"])
//casestatus(inList:["New", "In Progress", "Re-review", "Complete", "Incomplete"])