<g:javascript>
var i18nmessages={};

function updateConfigurationMap(newConfigurationMap) {
	for(key in newConfigurationMap){
		i18nmessages[key] = newConfigurationMap[key];
	}

	//or in jQuery way
//	jQuery.each(newConfiguration, function(key, val) {
//		i18nmessages[key] = val
//	});

}
updateConfigurationMap({

   step1Err1 : "${message(code:'step1.err.msgs1').encodeAsHTML()}",
   step1Err2 : "${message(code:'step1.err.msgs2').encodeAsHTML()}",
   step1Err3 : "${message(code:'step1.err.msgs3').encodeAsHTML()}",
   step1Err4 : "${message(code:'step1.err.msgs4').encodeAsHTML()}",
   step1Err5 : "${message(code:'step1.err.msgs5').encodeAsHTML()}",
   step1Err6 : "${message(code:'step1.err.msgs6').encodeAsHTML()}",
   step1Err7 : "${message(code:'step1.err.msgs7').encodeAsHTML()}",
   step1Err8 : "${message(code:'step1.err.msgs8').encodeAsHTML()}",
   step1Err9 : "${message(code:'step1.err.msgs9').encodeAsHTML()}",
   step1Err10 : "${message(code:'step1.err.msgs10').encodeAsHTML()}",
   step1Err11 : "${message(code:'step1.err.msgs11').encodeAsHTML()}",
   step1Err12 : "${message(code:'step1.err.msgs12').encodeAsHTML()}",
   step1Err13 : "${message(code:'step1.err.msgs13').encodeAsHTML()}",
   step1Err14 : "${message(code:'step1.err.msgs14').encodeAsHTML()}",
   step1Err15 : "${message(code:'step1.err.msgs15').encodeAsHTML()}",
   step1Err16 : "${message(code:'step1.err.msgs16').encodeAsHTML()}",
   step1Err17 : "${message(code:'step1.err.msgs17').encodeAsHTML()}",
   step1Err18 : "${message(code:'step1.err.msgs18').encodeAsHTML()}",

   step2Err1 : "${message(code:'step2.err.msgs1').encodeAsHTML()}",
   step2Err2 : "${message(code:'step2.err.msgs2').encodeAsHTML()}",
   step2Err3 : "${message(code:'step2.err.msgs3').encodeAsHTML()}",
   step2Err4 : "${message(code:'step2.err.msgs4').encodeAsHTML()}",
   step2Err5 : "${message(code:'step2.err.msgs5').encodeAsHTML()}",
   step2Err6 : "${message(code:'step2.err.msgs6').encodeAsHTML()}",
   step2Err7 : "${message(code:'step2.err.msgs7').encodeAsHTML()}",
   step2Err8 : "${message(code:'step2.err.msgs8').encodeAsHTML()}",
   step2Err9 : "${message(code:'step2.err.msgs9').encodeAsHTML()}",
   step2Err10 : "${message(code:'step2.err.msgs10').encodeAsHTML()}",
   step2Err11 : "${message(code:'step2.err.msgs11').encodeAsHTML()}",
   step2Err12 : "${message(code:'step2.err.msgs12').encodeAsHTML()}",
   step2Err13 : "${message(code:'step2.err.msgs13').encodeAsHTML()}",
   step2Err14 : "${message(code:'step2.err.msgs14').encodeAsHTML()}",
   step2Err15 : "${message(code:'step2.err.msgs15').encodeAsHTML()}",
   step2Err16 : "${message(code:'step2.err.msgs16').encodeAsHTML()}",

   step3Err1 : "${message(code:'step3.err.msgs1').encodeAsHTML()}",
   step3Err2 : "${message(code:'step3.err.msgs2').encodeAsHTML()}",
   step3Err3 : "${message(code:'step3.err.msgs3').encodeAsHTML()}",
   step3Err4 : "${message(code:'step3.err.msgs4').encodeAsHTML()}",
   
   step4Err1 : "${message(code:'step4.err.msgs1').encodeAsHTML()}",
   step4Err2 : "${message(code:'step4.err.msgs2').encodeAsHTML()}",
   step4Err3 : "${message(code:'step4.err.msgs3').encodeAsHTML()}",
   step4Err4 : "${message(code:'step4.err.msgs4').encodeAsHTML()}",
   step4Err5 : "${message(code:'step4.err.msgs5').encodeAsHTML()}",
   step4Err6 : "${message(code:'step4.err.msgs6').encodeAsHTML()}",
   step4Err7 : "${message(code:'step4.err.msgs7').encodeAsHTML()}",
   step4Err8 : "${message(code:'step4.err.msgs8').encodeAsHTML()}",
   step4Err9 : "${message(code:'step4.err.msgs9').encodeAsHTML()}",
   step4Err10 : "${message(code:'step4.err.msgs10').encodeAsHTML()}",
   step4Err11 : "${message(code:'step4.err.msgs11').encodeAsHTML()}",
   step4Err12 : "${message(code:'step4.err.msgs12').encodeAsHTML()}",
   
   step5Err1 : "${message(code:'step5.err.msgs1').encodeAsHTML()}",
   step5Err2 : "${message(code:'step5.err.msgs2').encodeAsHTML()}",
   step5Err3 : "${message(code:'step5.err.msgs3').encodeAsHTML()}",
   
   step6Err1 : "${message(code:'step6.err.msgs1').encodeAsHTML()}",
   step6Err2 : "${message(code:'step6.err.msgs2').encodeAsHTML()}",
   step6Err3 : "${message(code:'step6.err.msgs3').encodeAsHTML()}",
   step6Err4 : "${message(code:'step6.err.msgs4').encodeAsHTML()}",
   step6Err5 : "${message(code:'step6.err.msgs5').encodeAsHTML()}",
   step6Err6 : "${message(code:'step6.err.msgs6').encodeAsHTML()}",
   step6Err7 : "${message(code:'step6.err.msgs7').encodeAsHTML()}",
   step6Err8 : "${message(code:'step6.err.msgs8').encodeAsHTML()}",     

   step7Err1 : "${message(code:'step7.err.msgs1').encodeAsHTML()}",
   step7Err2 : "${message(code:'step7.err.msgs2').encodeAsHTML()}",
   step7Err3 : "${message(code:'step7.err.msgs3').encodeAsHTML()}",
   step7Err4 : "${message(code:'step7.err.msgs4').encodeAsHTML()}",
   step7Err5 : "${message(code:'step7.err.msgs5').encodeAsHTML()}",
   step7Err6 : "${message(code:'step7.err.msgs6').encodeAsHTML()}",
   step7Err7 : "${message(code:'step7.err.msgs7').encodeAsHTML()}",
   
   step8Err1 : "${message(code:'step8.err.msgs1').encodeAsHTML()}",
   step8Err2 : "${message(code:'step8.err.msgs2').encodeAsHTML()}",
   step8Err3 : "${message(code:'step8.err.msgs3').encodeAsHTML()}",
   step8Err4 : "${message(code:'step8.err.msgs4').encodeAsHTML()}",
   step8Err5 : "${message(code:'step8.err.msgs5').encodeAsHTML()}",
   step8Err6 : "${message(code:'step8.err.msgs6').encodeAsHTML()}",
   step8Err7 : "${message(code:'step8.err.msgs7').encodeAsHTML()}",
   step8Err8 : "${message(code:'step8.err.msgs8').encodeAsHTML()}",
   step8Err9 : "${message(code:'step8.err.msgs9').encodeAsHTML()}",
   step8Err10 : "${message(code:'step8.err.msgs10').encodeAsHTML()}",
   step8Err11 : "${message(code:'step8.err.msgs11').encodeAsHTML()}",
   step8Err12 : "${message(code:'step8.err.msgs12').encodeAsHTML()}",
   step8Err13 : "${message(code:'step8.err.msgs13').encodeAsHTML()}",
   step8Err14 : "${message(code:'step8.err.msgs14').encodeAsHTML()}",
   step8Err15 : "${message(code:'step8.err.msgs15').encodeAsHTML()}",
   
   step9Err1 : "${message(code:'step9.err.msgs1').encodeAsHTML()}",
   step9Err2 : "${message(code:'step9.err.msgs2').encodeAsHTML()}",
   step9Err3 : "${message(code:'step9.err.msgs3').encodeAsHTML()}",
   step9Err4 : "${message(code:'step9.err.msgs4').encodeAsHTML()}",
   step9Err5 : "${message(code:'step9.err.msgs5').encodeAsHTML()}",
   step9Err6 : "${message(code:'step9.err.msgs6').encodeAsHTML()}",
   step9Err7 : "${message(code:'step9.err.msgs7').encodeAsHTML()}",
   step9Err8 : "${message(code:'step9.err.msgs8').encodeAsHTML()}",
   step9Err9 : "${message(code:'step9.err.msgs9').encodeAsHTML()}",
   step9Err9_1 : "${message(code:'step9.err.msgs9.1').encodeAsHTML()}",
   step9Err10 : "${message(code:'step9.err.msgs10').encodeAsHTML()}",
   step9Err11 : "${message(code:'step9.err.msgs11').encodeAsHTML()}",
   step9Err12 : "${message(code:'step9.err.msgs12').encodeAsHTML()}",
   step9Err13 : "${message(code:'step9.err.msgs13').encodeAsHTML()}",
   step9Err14 : "${message(code:'step9.err.msgs14').encodeAsHTML()}",
   step9Err15 : "${message(code:'step9.err.msgs15').encodeAsHTML()}",
   step9Err16 : "${message(code:'step9.err.msgs16').encodeAsHTML()}",
   step9Err16_1 : "${message(code:'step9.err.msgs16.1').encodeAsHTML()}",
   step9Err17 : "${message(code:'step9.err.msgs17').encodeAsHTML()}",
   step9Err17_1 : "${message(code:'step9.err.msgs17.1').encodeAsHTML()}",   
   step9Err18 : "${message(code:'step9.err.msgs18').encodeAsHTML()}",
   
   step10Err1 : "${message(code:'step10.err.msgs1').encodeAsHTML()}",
   step10Err2 : "${message(code:'step10.err.msgs2').encodeAsHTML()}",
   step10Err3 : "${message(code:'step10.err.msgs3').encodeAsHTML()}",
   step10Err4 : "${message(code:'step10.err.msgs4').encodeAsHTML()}",
   step10Err5 : "${message(code:'step10.err.msgs5').encodeAsHTML()}",
   step10Err6 : "${message(code:'step10.err.msgs6').encodeAsHTML()}",
   step10Err7 : "${message(code:'step10.err.msgs7').encodeAsHTML()}",
   step10Err8 : "${message(code:'step10.err.msgs8').encodeAsHTML()}",
   step10Err9 : "${message(code:'step10.err.msgs9').encodeAsHTML()}",
   step10Err10 : "${message(code:'step10.err.msgs10').encodeAsHTML()}",
   step10Err11 : "${message(code:'step10.err.msgs11').encodeAsHTML()}",
   step10Err12 : "${message(code:'step10.err.msgs12').encodeAsHTML()}",
   step10Err13 : "${message(code:'step10.err.msgs13').encodeAsHTML()}",
   step10Err14 : "${message(code:'step10.err.msgs14').encodeAsHTML()}",
   step10Err15 : "${message(code:'step10.err.msgs15').encodeAsHTML()}",
   step10Err16 : "${message(code:'step10.err.msgs16').encodeAsHTML()}",
   step10Err17 : "${message(code:'step10.err.msgs17').encodeAsHTML()}",
   step10Err18 : "${message(code:'step10.err.msgs18').encodeAsHTML()}",
   step10Err19 : "${message(code:'step10.err.msgs19').encodeAsHTML()}",
   step10Err20 : "${message(code:'step10.err.msgs20').encodeAsHTML()}",

   step11Err1 : "${message(code:'step11.err.msgs1').encodeAsHTML()}",
   step11Err2 : "${message(code:'step11.err.msgs2').encodeAsHTML()}",
   step11Err3 : "${message(code:'step11.err.msgs3').encodeAsHTML()}",
   step11Err4 : "${message(code:'step11.err.msgs4').encodeAsHTML()}",
   step11Err5 : "${message(code:'step11.err.msgs5').encodeAsHTML()}",
   step11Err6 : "${message(code:'step11.err.msgs6').encodeAsHTML()}",
   step11Err7 : "${message(code:'step11.err.msgs7').encodeAsHTML()}",
   step11Err8 : "${message(code:'step11.err.msgs8').encodeAsHTML()}",
   step11Err8_1 : "${message(code:'step11.err.msgs8.1').encodeAsHTML()}",   
   step11Err9 : "${message(code:'step11.err.msgs9').encodeAsHTML()}",
   step11Err10 : "${message(code:'step11.err.msgs10').encodeAsHTML()}",
   step11Err11 : "${message(code:'step11.err.msgs11').encodeAsHTML()}",
   step11Err12 : "${message(code:'step11.err.msgs12').encodeAsHTML()}",
   step11Err13 : "${message(code:'step11.err.msgs13').encodeAsHTML()}",
   step11Err14 : "${message(code:'step11.err.msgs14').encodeAsHTML()}",
   step11Err15 : "${message(code:'step11.err.msgs15').encodeAsHTML()}",
   
   step12Err1 : "${message(code:'step12.err.msgs1').encodeAsHTML()}",
   step12Err2 : "${message(code:'step12.err.msgs2').encodeAsHTML()}",
   step12Err3 : "${message(code:'step12.err.msgs3').encodeAsHTML()}",
   step12Err4 : "${message(code:'step12.err.msgs4').encodeAsHTML()}",

   step13Err1 : "${message(code:'step13.err.msgs1').encodeAsHTML()}",
   step13Err2 : "${message(code:'step13.err.msgs2').encodeAsHTML()}",
   step13Err3 : "${message(code:'step13.err.msgs3').encodeAsHTML()}",
   step13Err4 : "${message(code:'step13.err.msgs4').encodeAsHTML()}",
   step13Err5 : "${message(code:'step13.err.msgs5').encodeAsHTML()}",
   step13Err6 : "${message(code:'step13.err.msgs6').encodeAsHTML()}",
   step13Err7 : "${message(code:'step13.err.msgs7').encodeAsHTML()}",
   step13Err8 : "${message(code:'step13.err.msgs8').encodeAsHTML()}",
   step13Err9 : "${message(code:'step13.err.msgs9').encodeAsHTML()}",

   step14Err1 : "${message(code:'step14.err.msgs1').encodeAsHTML()}",
   step14Err2 : "${message(code:'step14.err.msgs2').encodeAsHTML()}",
   step14Err3 : "${message(code:'step14.err.msgs3').encodeAsHTML()}",
   step14Err4 : "${message(code:'step14.err.msgs4').encodeAsHTML()}",
   step14Err5 : "${message(code:'step14.err.msgs5').encodeAsHTML()}",
   step14Err6 : "${message(code:'step14.err.msgs6').encodeAsHTML()}",
   step14Err7 : "${message(code:'step14.err.msgs7').encodeAsHTML()}",
   step14Err8 : "${message(code:'step14.err.msgs8').encodeAsHTML()}",
   step14Err9 : "${message(code:'step14.err.msgs9').encodeAsHTML()}",
   step14Err10 : "${message(code:'step14.err.msgs10').encodeAsHTML()}",
   step14Err11 : "${message(code:'step14.err.msgs11').encodeAsHTML()}",
                   
 });
 </g:javascript>