function checkForm2()
{
	// instantiate object
	fv = new formValidator();
	
	if (fv.isEmpty(document.getElementById('weight').value)){
		fv.raiseError(i18nmessages.step2Err1);
	}
	else{
		if (!fv.isValidNumber(document.getElementById('weight').value, 10, 599)){
			fv.raiseError(i18nmessages.step2Err2);
		}
	}	
	if (fv.isEmpty(document.getElementById('height_feet').value)){
		fv.raiseError(i18nmessages.step2Err3);
	}
	else{
		if (!fv.isValidNumber(document.getElementById('height_feet').value, 0, 10)){
			fv.raiseError(i18nmessages.step2Err4);
		}
	}	
	if (fv.isEmpty(document.getElementById('height_inches').value)){
		fv.raiseError(i18nmessages.step2Err5);
	}		
	else{
		if (!fv.isValidNumber(document.getElementById('height_inches').value, 0, 11.99)){
			fv.raiseError(i18nmessages.step2Err6);
		}
	}	
	//if (!fv.isChecked(document.getElementById('q11a_hep_a')) &&
	//	!fv.isChecked(document.getElementById('q11a_hep_b')) &&
	//	!fv.isChecked(document.getElementById('q11a_hep_c')) &&
	//	!fv.isChecked(document.getElementById('q11a_hep_donotknow_type')) &&
	//	getRadioValue(document.getElementsByName('q11a_1'))=='yes'	 ){
	//		fv.raiseError(i18nmessages.step2Err7);
	//}
	if  (!$('#q11a_hep_donotknow_type').attr("checked") ){
		if ( !fv.isRadioChecked(document.getElementsByName('q11a_1')) || !fv.isRadioChecked(document.getElementsByName('q11a_2')) || !fv.isRadioChecked(document.getElementsByName('q11a_3')) ){
			fv.raiseError(i18nmessages.step2Err8+" 1");
		}
	}
	if (!fv.isRadioChecked(document.getElementsByName('q11a_4')) ||
		!fv.isRadioChecked(document.getElementsByName('q11a_5')) ||
		!fv.isRadioChecked(document.getElementsByName('q11a_6')) ){
			fv.raiseError(i18nmessages.step2Err8+" 2");	
	}
	/*
	if (fv.needSpecify(document.getElementsByName('q11a_1'), document.getElementById('q11a_1Year_year'), 'yes')||
			fv.needSpecify(document.getElementsByName('q11a_2'), document.getElementById('q11a_2Year_year'), 'yes')||
			fv.needSpecify(document.getElementsByName('q11a_3'), document.getElementById('q11a_3Year_year'), 'yes')||
			fv.needSpecify(document.getElementsByName('q11a_4'), document.getElementById('q11a_4Year_year'), 'yes')||
			fv.needSpecify(document.getElementsByName('q11a_5'), document.getElementById('q11a_5Year_year'), 'yes')||
			fv.needSpecify(document.getElementsByName('q11a_6'), document.getElementById('q11a_6Year_year'), 'yes')){
		fv.raiseError(i18nmessages.step2Err9);
	}
	*/
	if (!fv.isRadioChecked(document.getElementsByName('haveCancer'))){
		fv.raiseError(i18nmessages.step2Err10);
	}
	var c1=false;
	$(':regex(id,q12_([0-9]|[0-9][0-9])_[1-4])').each( function() {
		if (this.checked) c1=true;
	});
	if (!c1 && getRadioValue(document.getElementsByName('haveCancer'))=='yes'){
		fv.raiseError(i18nmessages.step2Err11);
	}
	for (i=1;i<=24;i++){
		r1=false;
		for (j=1;j<=3;j++){ // if not 'none'
			if ($("#q12_"+i+"_"+j).is(':checked')) r1=true;
		}
		if (r1 && $("#q12_"+i+"_ageDiagnosed").val()==''){
			fv.raiseError(i18nmessages.step2Err12+" (#"+i+").")
		}
		if ($("#q12_"+i+"_ageDiagnosed").val()!='' && !isValidNumber($("#q12_"+i+"_ageDiagnosed").val(), 1, 125)){
			fv.raiseError(i18nmessages.step2Err13+" (#"+i+").");
		}
	}

	if (!fv.isRadioChecked(document.getElementsByName('spread_cancer'))){
		fv.raiseError(i18nmessages.step2Err14);
	}
	else{ // if answered (yes or no)
		if (getRadioValue(document.getElementsByName('spread_cancer'))=='yes'){
			sp1=false;
			$("[name*='spread_'][type=checkbox]").each( function() {
				if (this.checked) sp1=true;
			});
			if (!sp1)
				fv.raiseError(i18nmessages.step2Err15);
			if ($('#spread_other').is(':checked') && $('#spread_where').val()=='')
				fv.raiseError(i18nmessages.step2Err16);
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
//function resetIfnone_hep(){
//	if (document.getElementById('q11a_hep_donotknow_type').checked){
//		document.getElementById('q11a_hep_a').checked='';
//		document.getElementById('q11a_hep_b').checked='';
//		document.getElementById('q11a_hep_c').checked='';
//	}		  	
//}
function resetIfnone(){
	for (i=1;i<=24;i++){
		if (document.getElementById('q12_'+i+'_4').checked){
			for (j=1;j<=3;j++){
				$('#q12_'+i+'_'+j).attr('checked', '');
			}
			//$('#q12_'+i+'_ageDiagnosed').val('');
		}
	}
}        