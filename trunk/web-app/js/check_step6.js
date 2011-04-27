function checkForm6()
{
	// instantiate object
	fv = new formValidator();
	
	if (!fv.isRadioChecked(document.getElementsByName('q24_howDoYouFeelRightNow')))
	{
		fv.raiseError(i18nmessages.step6Err1);
	}
	if (fv.isEmpty(document.getElementById('q25_howHaveYouFeltForPast4Weeks').value))
	{
		fv.raiseError(i18nmessages.step6Err2);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q26')))
	{
		fv.raiseError(i18nmessages.step6Err3);
	}
	if (getRadioValue(document.getElementsByName('q26'))=='yes' && $('#q26_explain').val()=='')
	{
		fv.raiseError(i18nmessages.step6Err4);
	}	
	if (!fv.isRadioChecked(document.getElementsByName('q27')))
	{
		fv.raiseError(i18nmessages.step6Err5);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q28')))
	{
		fv.raiseError(i18nmessages.step6Err6);
	}
	if (!fv.isRadioChecked(document.getElementsByName('q29_1')) ||
		!fv.isRadioChecked(document.getElementsByName('q29_2')) ||
		!fv.isRadioChecked(document.getElementsByName('q29_3')) ||
		!fv.isRadioChecked(document.getElementsByName('q29_4')) ||
		!fv.isRadioChecked(document.getElementsByName('q29_5')) ||
		!fv.isRadioChecked(document.getElementsByName('q29_6')) )
	{
		fv.raiseError(i18nmessages.step6Err7);
	}
	if (getRadioValue(document.getElementsByName('q29_7'))=='yes' && fv.isEmpty($('#q29_other').val()) )
	{
		fv.raiseError(i18nmessages.step6Err8);
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