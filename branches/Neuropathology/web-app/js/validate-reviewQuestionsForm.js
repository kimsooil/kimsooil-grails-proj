function toggleNecrosis(){
        		if (document.getElementById('necrosis').checked){
        			$('NecrosisScale').disabled = '';
        			//$('necrosisLabel').style.color = 'red';
        			//$('necrosisDiv').style.display='inline';

        		}
        		else {
        			$('NecrosisScale').value='null';
        			$('NecrosisScale').disabled = 'true';
        		
        			//$('necrosisLabel').style.color = 'black';
        			//$('necrosisDiv').style.display='none';

        		}
        		
}
function toggleVP(){
        		if (document.getElementById('vascularProliferation').checked){
        			$('VPscale').disabled = '';
        			//$('VPscaleLabel').style.color = 'red';
        			//$('VPscaleDiv').style.display='inline';

        		}
        		else {
        			$('VPscale').value='null';
        			$('VPscale').disabled = 'true';
        			//$('VPscaleLabel').style.color = 'black';
        			//$('VPscaleDiv').style.display='none';

        		}
        		
}
function checkIfMoreOptions(){
	var gsc=document.getElementById('gradingSubClassification').value;
	
	if (gsc=='1E' || gsc=='1F' || gsc=='1G' || gsc=='1J'){
		$('gemistocyticDiv').style.display='inline';
	}
	else{
		
		$('gemistocyticDiv').style.display='none';
		
	}
	
	if (gsc=='2A' || gsc=='2B' || gsc=='2C'){
		$('extentOligoDiv').style.display='inline';
	}
	else{
		
		$('extentOligoDiv').style.display='none';
		
	}
	
	if (gsc=='9'){
		$('possibleSubClassificationDiv').style.display='inline';
	}
	else{
		
		$('possibleSubClassificationDiv').style.display='none';
		
	}
	// reset all setting when changed - defaults are all 'null'
	$('gemistocytic').value='null'; 
	$('extentOligo').value='null';
	$('possibleSubClassification').value='null';
}
function checkIfCertaintySelected(){
	var loc=trim(document.getElementById('levelOfDiagnosticCertainty').value);
	if (loc=='null' || loc=='' ||loc==null){
		alert('Please select Level of Certainty');
		focus(document.getElementById('levelOfDiagnosticCertainty'));
		return false;
	}
	else
		return true;
}
function checkIfDXSelected(){
	var loc=trim(document.getElementById('gradingSubClassification').value);
	if (loc=='null' || loc==''|| loc==null){
		alert('Please select Dx(Grading Sub-Classification)');
		focus(document.getElementById('GradingSubClassification'));
		return false;
	}
	else
		return true;
}
function checkIfAllRequiredAreSelected(){
	if (document.getElementById('necrosis').checked && $('NecrosisScale').value=='null'){
		alert('Please choose a scale for Necrosis');
		$('NecrosisScale').focus();
		
		return false;
		}

	if (document.getElementById('vascularProliferation').checked && $('VPscale').value=='null'){
		alert('Please choose a scale for Vascular Proliferation');
		focus(document.getElementById('VPscale'));
		return false;
	}
	if (checkIfDXSelected() && checkIfOptionsNotSelected() && checkIfCertaintySelected()) return true; else return false;
 
}

function checkIfOptionsNotSelected(){
	var gsc=document.getElementById('gradingSubClassification').value;
	if ((gsc=='1E' || gsc=='1F' || gsc=='1G' || gsc=='1J') && $('gemistocytic').value=='null'){
			alert('Please choose Yes or No for Gemistocytic.');
			focus(document.getElementById('gemistocytic'));
			return false;
	}
	if ((gsc=='2A' || gsc=='2B' || gsc=='2C') && $('extentOligo').value=='null'){
			alert('Please tell us more about Extent of Oligo Component');
			focus(document.getElementById('extentOligo'));
			return false;
	}
	if (gsc=='9' && $('possibleSubClassification').value=='null'){		
			alert('Please choose a possible Sub-classification');
			focus(document.getElementById('possibleSubClassification'));
			return false;
	}
	return true;
}

function trim (str) {
	var	str = str.replace(/^\s\s*/, ''),
		ws = /\s/,
		i = str.length;
	while (ws.test(str.charAt(--i)));
	return str.slice(0, i + 1);
}


function askWhy()
{
	var trimmedNotes = trim(document.getElementById('notes').value);
	if (trimmedNotes=='' || trimmedNotes==null){
		alert('Please type why/what you request.');
		return false;
	}
	else
		return true;
		
}
