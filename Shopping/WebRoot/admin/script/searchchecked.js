addEvent(window,'load',function(){
							var fm = document.getElementsByName('complex')[0];

							
							var lowNormalPrice = fm.elements['lowNormalPrice'];
							var highNormalPrice = fm.elements['highNormalPrice'];
							var lowMemberPrice = fm.elements['lowMemberPrice'];
							var highMemberPrice = fm.elements['highMemberPrice'];
							
																				
							
							addEvent(fm,'submit',function(evt){                          //提交验证
														 												
									if(lowNormalPrice.value == '') {
										lowNormalPrice.value =-1;
										}
									if(highNormalPrice.value == '') {
										highNormalPrice.value =-1;
										}
									if(lowMemberPrice.value == '') {
										lowMemberPrice.value =-1;
										}
									if(highMemberPrice.value == '') {
										highMemberPrice.value =-1;
										}
									
									
									
								});	
		
			 });