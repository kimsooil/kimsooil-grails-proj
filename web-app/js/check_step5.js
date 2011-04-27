function checkForm5()
{
	// instantiate object
	fv = new formValidator();
	
	if (!fv.isRadioChecked(document.getElementsByName('q22_1')) ||
		!fv.isRadioChecked(document.getElementsByName('q22_2')) ||
		!fv.isRadioChecked(document.getElementsByName('q22_3')) ||
		!fv.isRadioChecked(document.getElementsByName('q22_4')) ||
		!fv.isRadioChecked(document.getElementsByName('q22_5')) ||
		!fv.isRadioChecked(document.getElementsByName('q22_6')) ||
		!fv.isRadioChecked(document.getElementsByName('q22_7')) )
	{
		fv.raiseError(i18nmessages.step5Err1);
	}
	if (getRadioValue(document.getElementsByName('q22_8'))!='never' && fv.isEmpty($('#q22_others').val()) )
	{
		fv.raiseError(i18nmessages.step5Err2);
	}
	
	if (!fv.isRadioChecked(document.getElementsByName('LevelOfActivity')))
	{
		fv.raiseError(i18nmessages.step5Err3);
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