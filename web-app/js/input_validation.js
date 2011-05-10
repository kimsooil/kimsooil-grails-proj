//----------------------
function DisableEnableForm(xForm,xHow){
  objElems = xForm.elements;
  for(i=0;i<objElems.length;i++){
    objElems[i].disabled = xHow;
  }
}
jQuery.expr[':'].regex = function(elem, index, match) {
    var matchParams = match[3].split(','),
        validLabels = /^(data|css):/,
        attr = {
            method: matchParams[0].match(validLabels) ? 
                        matchParams[0].split(':')[0] : 'attr',
            property: matchParams.shift().replace(validLabels,'')
        },
        regexFlags = 'ig',
        regex = new RegExp(matchParams.join('').replace(/^\s+|\s+$/g,''), regexFlags);
    return regex.test(jQuery(elem)[attr.method](attr.property));
}

function toggleQ12(){
	myoption=-1;
	//radioobj=document.getElementsByName('haveCancer'); // NOTE: getElementsByName() doesn't work in IE
	radioobj=document.surveyform2.haveCancer;
	len = radioobj.length;
	for (i=len-1; i > -1; i--) {
		if (radioobj[i].checked){
			myoption=i;
		}
		//alert("option: "+myoption);
		
	}
	if (radioobj[myoption].value=='yes'){
		document.getElementById('q12div').style.display = 'block';
	} else {
		document.getElementById('q12div').style.display = 'none';
	}        		
}


function toggleQ13(){
	myoption=-1;
	radioobj=document.surveyform3.familyHaveCancer;
	len = radioobj.length;
	for (i=len-1; i > -1; i--) {
		if (radioobj[i].checked){
			myoption=i;
		}
		//alert("option: "+myoption);
		
	}
	if (radioobj[myoption].value=='yes'){
		document.getElementById('q13div').style.display = 'block';
	} else {
		document.getElementById('q13div').style.display = 'none';
	}        		
}
function postcode_validate(zipcode)
{

    var regPostcode = /^\d{5}$|^\d{5}-\d{4}$/;;

    obj = document.getElementById("status");
	obj.style.display = 'inline';
	if (zipcode.length > 1){
	    if(regPostcode.test(zipcode) == false)
	    {
	
	        obj.innerHTML = "<font color='red'>Invalid</font>";
	
	    }
	    else
	    {
			obj.style.display = 'none';
	        obj.innerHTML = "<font color='blue'>Valid</font>";
	
	    }
	}

}
function isCountryValid(country)
{

    obj = document.getElementById("country_status");
	obj.style.display = 'inline';
    if(country == "" || country == "--")
    {

        obj.innerHTML = "<font color='red'>Invalid</font>";

    }
    else
    {
		obj.style.display = 'none';
        obj.innerHTML = "<font color='blue'>Valid</font>";

    }

}
function checkIfValidNumber(val, min, max, obj)
{
    //obj = document.getElementById("country_status");
	obj.style.display = 'inline';	
	if (val!='' && val!=null){
		if (isNaN(val))
		{
			obj.innerHTML = "<font color='red'>Invalid</font>";
		}
		else
		{
			if (val < min || val > max){
				obj.innerHTML = "<font color='red'>Invalid</font>";
			}
			else {
				obj.style.display = 'none';
				obj.innerHTML = "<font color='blue'>Valid</font>";
			}
		}
	}
}
function checkIfNumber(val, obj)
{
    //obj = document.getElementById("country_status");
	obj.style.display = 'inline';	
	if (val!='' && val!=null){
		if (isNaN(val))
		{
			obj.innerHTML = "<font color='red'>Invalid</font>";
		}
		else
		{
			obj.style.display = 'none';
			obj.innerHTML = "<font color='blue'>Valid</font>";
		}
	}
}
function checkIfNumberOnly(val, obj)
{
    //obj = document.getElementById("country_status");
	obj.style.display = 'inline';	
	if (val!='' && val!=null){
		if (isNaN(val))
		{
			obj.style.display = 'none';
			obj.innerHTML = "<font color='blue'>Valid</font>";
		}
		else
		{
			
			obj.innerHTML = "<font color='red'>Warning: Not valid input</font>";
		}
	}
}
function sumOfNumbers(n1, n2, n3, obj)
{
		
	if ((n1.value!='' && n1.value!=null) && (n2.value!='' && n2.value!=null) && (n3.value!='' && n3.value!=null)){
		if (!isNaN(n1.value) && !isNaN(n2.value) && !isNaN(n3.value))
		{
				sum = parseInt(n1.value) + parseInt(n2.value) + parseInt(n3.value);
				obj.style.display = 'inline';
				if (sum <= 10)
					obj.innerHTML = "<font color='blue'><b>(Total: "+sum+")</b></font>";
				else
					obj.innerHTML = "<font color='red'><b>(Total: "+sum+")</b></font>";

		}
	}
}
function getRadioValue(radioobj){
	myoption=-1;
	len = radioobj.length;
	for (i=len-1; i > -1; i--) {
		if (radioobj[i].checked){
			myoption=i;
		}
	}
	if (myoption==-1){
		return '';
	}
	return (radioobj[myoption].value);
}
