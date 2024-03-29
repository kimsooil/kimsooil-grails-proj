function checkForm8()
{
	// instantiate object
	fv = new formValidator();
	
	if (!fv.isRadioChecked(document.getElementsByName('q35')) )
	{
		fv.raiseError(i18nmessages.step8Err1);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q36_1')) ||
		!fv.isRadioChecked(document.getElementsByName('q36_2')) ||
		!fv.isRadioChecked(document.getElementsByName('q36_3')) ||
		!fv.isRadioChecked(document.getElementsByName('q36_4')) ||
		!fv.isRadioChecked(document.getElementsByName('q36_5')) ||
		!fv.isRadioChecked(document.getElementsByName('q36_6')) )
	{
		fv.raiseError(i18nmessages.step8Err2);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q37')) )
	{
		fv.raiseError(i18nmessages.step8Err3);
	}
	if (getRadioValue(document.getElementsByName('q37'))=='yes' && !fv.isRadioChecked(document.getElementsByName('q37_what')) )
	{
		fv.raiseError(i18nmessages.step8Err3);
	}
	if (getRadioValue(document.getElementsByName('q37'))=='yes' && !fv.isRadioChecked(document.getElementsByName('q38')) )
	{
		fv.raiseError(i18nmessages.step8Err4);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q39')) )
	{
		fv.raiseError(i18nmessages.step8Err5);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q40')) )
	{
		fv.raiseError(i18nmessages.step8Err6);
	}
	if (getRadioValue(document.getElementsByName('q40'))=='yes' && !fv.isRadioChecked(document.getElementsByName('resultsFecalOccultBloodTest')) )
	{
		fv.raiseError(i18nmessages.step8Err6);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q41')) )
	{
		fv.raiseError(i18nmessages.step8Err7);
	}
	if (getRadioValue(document.getElementsByName('q41'))=='yes' || getRadioValue(document.getElementsByName('q41'))=='five')
	{
            if ( !(fv.isEmpty(document.getElementById('dateDigitalRectalExam_month').value) && fv.isEmpty(document.getElementById('dateDigitalRectalExam_year').value)) &&
                    (fv.isEmpty(document.getElementById('dateDigitalRectalExam_month').value) ||
                    fv.isEmpty(document.getElementById('dateDigitalRectalExam_year').value)) ){
                            fv.raiseError(i18nmessages.step8ErrInvalidDate1);
            }	            
        }        
	if ( ($("#dateDigitalRectalExam_year").val() == today_year.toString())  &&
			(parseInt($("#dateDigitalRectalExam_month").val()) > today_month)
		){
			fv.raiseError("Q46: "+i18nmessages.step8ErrInvalidDate1);
		}
	if ( ($("#dateDigitalRectalExam_year").val() == dob_year.toString())  &&
			(parseInt($("#dateDigitalRectalExam_month").val()) < dob_month)
		){
			fv.raiseError("Q46: "+i18nmessages.step8ErrInvalidDate1);
		}

	/*
	if (getRadioValue(document.getElementsByName('q41'))!='no' &&
	($('#date_digital_rectal_exam_month').val()=='' ||$('#date_digital_rectal_exam_year').val()=='')
	)
	{
		fv.raiseError(i18nmessages.step8Err8);
	}
	*/
	if (!fv.isRadioChecked(document.getElementsByName('q42')) )
	{
		fv.raiseError(i18nmessages.step8Err9);
	}
	/*
	if (getRadioValue(document.getElementsByName('q42'))=='yes' &&
	($('#date_sigmoidoscopy_colonoscopy_month').val()=='' ||$('#date_sigmoidoscopy_colonoscopy_year').val()=='')
	)
	{
		fv.raiseError(i18nmessages.step8Err10);
	}
	*/
	if ( ($("#dateSigmoidoscopyColonoscopy_year").val() == today_year.toString())  &&
			(parseInt($("#dateSigmoidoscopyColonoscopy_month").val()) > today_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q47: "+i18nmessages.step8ErrInvalidDate2);
		}
	if ( ($("#dateSigmoidoscopyColonoscopy_year").val() == dob_year.toString())  &&
			(parseInt($("#dateSigmoidoscopyColonoscopy_month").val()) < dob_month) // java.util.Calendar.MONTH is 0~11
		){
			fv.raiseError("Q47: "+i18nmessages.step8ErrInvalidDate2);
		}	
	
	if (getRadioValue(document.getElementsByName('q42'))=='yes')
	{
		if ((!fv.isRadioChecked(document.getElementsByName('q42_1')) ||
			!fv.isRadioChecked(document.getElementsByName('q42_2')) ||
			!fv.isRadioChecked(document.getElementsByName('q42_3')) ||
			!fv.isRadioChecked(document.getElementsByName('q42_4')) ||
			!fv.isRadioChecked(document.getElementsByName('q42_5')) ||
			!fv.isRadioChecked(document.getElementsByName('q42_6')) ||
			!fv.isRadioChecked(document.getElementsByName('q42_7')) ||
			!fv.isRadioChecked(document.getElementsByName('q42_8'))) )
				fv.raiseError(i18nmessages.step8Err11);

		if (!fv.isRadioChecked(document.getElementsByName('q43')) )
		{
			fv.raiseError(i18nmessages.step8Err12);
		}
                if ( !(fv.isEmpty(document.getElementById('dateSigmoidoscopyColonoscopy_month').value) && fv.isEmpty(document.getElementById('dateSigmoidoscopyColonoscopy_year').value)) &&
                        (fv.isEmpty(document.getElementById('dateSigmoidoscopyColonoscopy_month').value) ||
                        fv.isEmpty(document.getElementById('dateSigmoidoscopyColonoscopy_year').value)) ){
                                fv.raiseError(i18nmessages.step8ErrInvalidDate2);
                }                
		/*
		if (getRadioValue(document.getElementsByName('q43'))=='yes' &&
			fv.isEmpty($('#q43_biopsy_results').val())
		)
		{
			fv.raiseError(i18nmessages.step8Err13);
		}
		*/
	}
	if (!fv.isRadioChecked(document.getElementsByName('q44')) )
	{
		fv.raiseError(i18nmessages.step8Err14);
	}	
	if (getRadioValue(document.getElementsByName('q44'))=='yes'
	)
	{
		//if (fv.isEmpty($('#q44_hemoglobin_levels').val())) // no-entering is allowed 
			//fv.raiseError(i18nmessages.step8Err15);
		//else if (!fv.isValidNumber($('#q44_hemoglobin_levels').val(), 7, 15))
		if (!fv.isEmpty($('#q44_hemoglobin_levels').val()) && !fv.isValidNumber($('#q44_hemoglobin_levels').val(), 7, 15))
		
			fv.raiseError("Q49: Enter valid number (Hemoglobin levels)");
	}		
	// all done
	// if errors, display, else proceed
	if (fv.numErrors() > 0)
	{
		fv.displayErrors();
	
		return false;
	}
	else
	{
		return true;
	}
}