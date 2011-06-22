function checkForm3()
{
	// instantiate object
	fv = new formValidator();

	if (!fv.isRadioChecked(document.getElementsByName('familyHaveCancer')))
	{
		fv.raiseError(i18nmessages.step3Err1);
	}

	var c1=false;
	$(':regex(id,q13_([0-9]|[0-9][0-9])_cancerType)').each( function() {
		if (this.value!='') c1=true;
	});
	var c2=false;
	$(':regex(id,q13_([0-9]|[0-9][0-9])_ageDiagnosed)').each( function() {
		if (this.value!='') c2=true;
	});
	if (!c1 && !c2 && getRadioValue(document.getElementsByName('familyHaveCancer'))=='yes'){
		fv.raiseError(i18nmessages.step3Err2);
	}
	for (i=1;i<=15;i++){
		if (($("#q13_"+i+"_cancerType").val()!='' && $("#q13_"+i+"_ageDiagnosed").val()=='') ||
			($("#q13_"+i+"_cancerType").val()=='' && $("#q13_"+i+"_ageDiagnosed").val()!='')){
			fv.raiseError(i18nmessages.step3Err3+" (#"+i+").");
		}
		if ($("#q13_"+i+"_ageDiagnosed").val()!='' && !fv.isValidNumber($("#q13_"+i+"_ageDiagnosed").val(), -1, ageCalculated)){ // 0 is for unknown age diagnosed
			fv.raiseError(i18nmessages.step3Err4+" (#"+i+").");
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