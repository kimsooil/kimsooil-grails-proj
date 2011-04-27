function checkForm13()
{
	// instantiate object
	fv = new formValidator();
	
	if (!fv.isRadioChecked(document.getElementsByName('q85')) )
	{
		fv.raiseError(i18nmessages.step13Err1);
	}
	if (getRadioValue(document.getElementsByName('q85'))=='yes' && fv.isEmpty($('#q85_which').val())){
		fv.raiseError(i18nmessages.step13Err2);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_1')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_2')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_3')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_4')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_5')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_6')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_7')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_8')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_9')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_10')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_11')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_12')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_sat_fat_13')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_vege_1')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_vege_2')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_vege_3')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_vege_4')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_vege_5')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_vege_6')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_vege_7')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_vege_8')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_vege_9')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_vege_10')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_vege_11')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_vege_12')) ||
		!fv.isRadioChecked(document.getElementsByName('q85_vege_13')) )
	{
		fv.raiseError(i18nmessages.step13Err3);
	}
	if (fv.isRadioChecked(document.getElementsByName('q85_sat_fat_14')) && getRadioValue(document.getElementsByName('q85_sat_fat_14'))!='none' && fv.isEmpty($('#q85_sat_fat_other').val()))
	{
		fv.raiseError(i18nmessages.step13Err4);
	}
	if (fv.isRadioChecked(document.getElementsByName('q85_vege_14')) && getRadioValue(document.getElementsByName('q85_vege_14'))!='none' && fv.isEmpty($('#q85_vege_other').val()))
	{
		fv.raiseError(i18nmessages.step13Err5);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q86')) )
	{
		fv.raiseError(i18nmessages.step13Err6);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q87')) )
	{
		fv.raiseError(i18nmessages.step13Err7);
	}
	if (getRadioValue(document.getElementsByName('q87'))=='yes'){ 
		if (!fv.isRadioChecked(document.getElementsByName('q88')))
			fv.raiseError(i18nmessages.step13Err8);
			
		if (!fv.isRadioChecked(document.getElementsByName('q89_1')) ||
			!fv.isRadioChecked(document.getElementsByName('q89_2')) ||
			!fv.isRadioChecked(document.getElementsByName('q89_3')) ||
			!fv.isRadioChecked(document.getElementsByName('q89_4')) ||
			!fv.isRadioChecked(document.getElementsByName('q89_5')) ||
			!fv.isRadioChecked(document.getElementsByName('q89_6')) ||
			!fv.isRadioChecked(document.getElementsByName('q89_7'))	)
		{
			fv.raiseError(i18nmessages.step13Err9); 
		}
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
