function checkForm14()
{
	// instantiate object
	fv = new formValidator();

	if (!fv.isRadioChecked(document.getElementsByName('q90_1')) ||
		!fv.isRadioChecked(document.getElementsByName('q90_2')) ||
		!fv.isRadioChecked(document.getElementsByName('q90_3')) ||
		!fv.isRadioChecked(document.getElementsByName('q90_4')) ||
		!fv.isRadioChecked(document.getElementsByName('q90_5')) ||
		!fv.isRadioChecked(document.getElementsByName('q90_6'))	 )
	{
		fv.raiseError(i18nmessages.step14Err1);
	}	
	if (getRadioValue(document.getElementsByName("q90_1"))=='yes' && $("#q90_1_year").val()=='') 
	{
		//if (fv.isEmpty($('#q90_1_age').val()) && fv.isEmpty($('#q90_1_year_year').val()) )
			//fv.raiseError(i18nmessages.step14Err2+"(#1)");
		if (!fv.isValidNumber($('#q90_1_age').val(), 0, 125))
			fv.raiseError(i18nmessages.step14Err3);
	}
	if (getRadioValue(document.getElementsByName("q90_2"))=='yes' && $("#q90_2_year").val()=='')
	{
		//if (fv.isEmpty($('#q90_2_age').val()) && fv.isEmpty($('#q90_2_year_year').val()) ) 
			//fv.raiseError(i18nmessages.step14Err2+"(#2)");
		if (!fv.isValidNumber($('#q90_2_age').val(), 0, 125))
			fv.raiseError(i18nmessages.step14Err3);
	}
	if (getRadioValue(document.getElementsByName("q90_3"))=='yes' && $("#q90_3_year").val()=='')
	{
		//if (fv.isEmpty($('#q90_3_age').val()) && fv.isEmpty($('#q90_3_year_year').val()) ) 
			//fv.raiseError(i18nmessages.step14Err2+"(#3)");
		if (!fv.isValidNumber($('#q90_3_age').val(), 0, 125))
			fv.raiseError(i18nmessages.step14Err3);
	}
	if (getRadioValue(document.getElementsByName("q90_4"))=='yes' && $("#q90_4_year").val()=='')
	{
		//if (fv.isEmpty($('#q90_4_age').val()) && fv.isEmpty($('#q90_4_year_year').val()) ) 
			//fv.raiseError(i18nmessages.step14Err2+"(#4)");
		if (!fv.isValidNumber($('#q90_4_age').val(), 0, 125))
			fv.raiseError(i18nmessages.step14Err3);
	}
	if (getRadioValue(document.getElementsByName("q90_5"))=='yes' && $("#q90_5_year").val()=='')
	{
		//if (fv.isEmpty($('#q90_5_age').val()) && fv.isEmpty($('#q90_5_year_year').val()) ) 
			//fv.raiseError(i18nmessages.step14Err2+"(#5)");
		if (!fv.isValidNumber($('#q90_5_age').val(), 0, 125))
			fv.raiseError(i18nmessages.step14Err3);
	}
	if (getRadioValue(document.getElementsByName("q90_6"))=='yes' && $("#q90_6_year").val()=='')
	{
		//if (fv.isEmpty($('#q90_6_age').val()) && fv.isEmpty($('#q90_6_year_year').val()) ) 
			//fv.raiseError(i18nmessages.step14Err2+"(#6)");
		if (!fv.isValidNumber($('#q90_6_age').val(), 0, 125))
			fv.raiseError(i18nmessages.step14Err3);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q91_1')) ||
		!fv.isRadioChecked(document.getElementsByName('q91_2')) ||
		!fv.isRadioChecked(document.getElementsByName('q91_3'))	 )
	{
		fv.raiseError(i18nmessages.step14Err4);
	}
	if (getRadioValue(document.getElementsByName('q91_1'))!='never' && !fv.isValidNumber($('#q91_1_howManyYears').val(), 0, 100))
	{
		fv.raiseError(i18nmessages.step14Err5+"(#1)");
	}
	if (getRadioValue(document.getElementsByName('q91_2'))!='never' && !fv.isValidNumber($('#q91_2_howManyYears').val(), 0, 100))
	{
		fv.raiseError(i18nmessages.step14Err5+"(#2)");
	}	
	if (getRadioValue(document.getElementsByName('q91_3'))!='never' && !fv.isValidNumber($('#q91_3_howManyYears').val(), 0, 100))
	{
		fv.raiseError(i18nmessages.step14Err5+"(#3)");
	}	
	if (!fv.isRadioChecked(document.getElementsByName('q92_1')) ||
		!fv.isRadioChecked(document.getElementsByName('q92_2')) ||
		!fv.isRadioChecked(document.getElementsByName('q92_3')) ||
		!fv.isRadioChecked(document.getElementsByName('q92_4')) ||
		!fv.isRadioChecked(document.getElementsByName('q92_5')) ||
		!fv.isRadioChecked(document.getElementsByName('q92_6')) ||
		!fv.isRadioChecked(document.getElementsByName('q92_7')) ||
		!fv.isRadioChecked(document.getElementsByName('q92_8')) ||
		!fv.isRadioChecked(document.getElementsByName('q92_9')) )
	{
		fv.raiseError(i18nmessages.step14Err6);
	}
	if (getRadioValue(document.getElementsByName('q92_1'))!='never' && !fv.isValidNumber($('#q92_1_howManyYears').val(), 0, 100))
	{
		fv.raiseError(i18nmessages.step14Err7+"(#1)");
	}
	if (getRadioValue(document.getElementsByName('q92_2'))!='never' && !fv.isValidNumber($('#q92_2_howManyYears').val(), 0, 100))
	{
		fv.raiseError(i18nmessages.step14Err7+"(#2)");
	}
	if (getRadioValue(document.getElementsByName('q92_3'))!='never' && !fv.isValidNumber($('#q92_3_howManyYears').val(), 0, 100))
	{
		fv.raiseError(i18nmessages.step14Err7+"(#3)");
	}
	if (getRadioValue(document.getElementsByName('q92_4'))!='never' && !fv.isValidNumber($('#q92_4_howManyYears').val(), 0, 100))
	{
		fv.raiseError(i18nmessages.step14Err7+"(#4)");
	}
	if (getRadioValue(document.getElementsByName('q92_5'))!='never' && !fv.isValidNumber($('#q92_5_howManyYears').val(), 0, 100))
	{
		fv.raiseError(i18nmessages.step14Err7+"(#5)");
	}
	if (getRadioValue(document.getElementsByName('q92_6'))!='never' && !fv.isValidNumber($('#q92_6_howManyYears').val(), 0, 100))
	{
		fv.raiseError(i18nmessages.step14Err7+"(#6)");
	}
	if (getRadioValue(document.getElementsByName('q92_7'))!='never' && !fv.isValidNumber($('#q92_7_howManyYears').val(), 0, 100))
	{
		fv.raiseError(i18nmessages.step14Err7+"(#7)");
	}
	if (getRadioValue(document.getElementsByName('q92_8'))!='never' && !fv.isValidNumber($('#q92_8_howManyYears').val(), 0, 100))
	{
		fv.raiseError(i18nmessages.step14Err7+"(#8)");
	}
	if (getRadioValue(document.getElementsByName('q92_9'))!='never' && !fv.isValidNumber($('#q92_9_howManyYears').val(), 0, 100))
	{
		fv.raiseError(i18nmessages.step14Err7+"(#9)");
	}
	if (!fv.isRadioChecked(document.getElementsByName('q93')) )
	{
		fv.raiseError(i18nmessages.step14Err8);
	}
	if 	(getRadioValue(document.getElementsByName('q93'))=='yes')
	{
		if (!fv.isRadioChecked(document.getElementsByName('q93_1')) ||
			!fv.isRadioChecked(document.getElementsByName('q93_2')) ||
			!fv.isRadioChecked(document.getElementsByName('q93_3')) ||
			!fv.isRadioChecked(document.getElementsByName('q93_4')) ||
			!fv.isRadioChecked(document.getElementsByName('q93_5')) )
		{
			fv.raiseError(i18nmessages.step14Err9);
		}	
		if (getRadioValue(document.getElementsByName('q93_1'))!='never' && !fv.isValidNumber($('#q93_1_howManyMonths').val(), 0, 100))
			fv.raiseError(i18nmessages.step14Err10+"(#1)");
		if (getRadioValue(document.getElementsByName('q93_2'))!='never' && !fv.isValidNumber($('#q93_2_howManyMonths').val(), 0, 100))
			fv.raiseError(i18nmessages.step14Err10+"(#2)");
		if (getRadioValue(document.getElementsByName('q93_3'))!='never' && !fv.isValidNumber($('#q93_3_howManyMonths').val(), 0, 100))
			fv.raiseError(i18nmessages.step14Err10+"(#3)");
		if (getRadioValue(document.getElementsByName('q93_4'))!='never' && !fv.isValidNumber($('#q93_4_howManyMonths').val(), 0, 100))
			fv.raiseError(i18nmessages.step14Err10+"(#4)");
		if (getRadioValue(document.getElementsByName('q93_5'))!='never' && !fv.isValidNumber($('#q93_5_howManyMonths').val(), 0, 100))
			fv.raiseError(i18nmessages.step14Err10+"(#5)");
	}
	for (i=1;i<=6;i++){
		if ((!fv.isEmpty($('#q94_'+i+'_ageStart').val()) && !fv.isValidNumber($('#q94_'+i+'_ageStart').val(), 0, 100)) ||
			(!fv.isEmpty($('#q94_'+i+'_ageStop').val()) && !fv.isValidNumber($('#q94_'+i+'_ageStop').val(), 0, 100)) )
		{
			fv.raiseError(i18nmessages.step14Err11+i);
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

