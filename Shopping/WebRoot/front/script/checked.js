addEvent(window,'load',function(){
							var fm = document.getElementsByName('myform')[0];

							
							var username = fm.elements['username'];

							
							addEvent(username,'blur',function(){
													 if(!checkUsername(username.value)) {
														  document.getElementById('error1').innerHTML = '\��������ȷ���û���,�û�������Ϊ3-18λ,����ֻ��Ϊ���֣���ĸ���»�����ɣ�';
														  }
													  else{
														  document.getElementById('error1').innerHTML = '';
														  }
												 });
							
							
							var passward =  fm.elements['pwd'];
							addEvent(passward,'blur',function(){
														if(!checkPassard(passward.value)) {
															document.getElementById('error2').innerHTML = '\��������ȷ������,�û�������Ϊ6-16λ,����ֻ��Ϊ���֣���ĸ���»�����ɣ�';
															}
														else if(strEqual(username.value,passward.value)) {
															document.getElementById('error2').innerHTML = '\�����û��������벻����ͬ';
															}
														else{
															document.getElementById('error2').innerHTML = '';
															}
													});
							
							var passward2 =  fm.elements['pwd2'];
							addEvent(passward2,'blur',function(){
														if(!strEqual(passward2.value,passward.value)) {
															document.getElementById('error3').innerHTML = '\����������������������ͬ';
															}
														else{
															document.getElementById('error3').innerHTML = '';
															}
													});
							
							
							
							var address =  fm.elements['addr'];
							addEvent(address,'blur',function(){
														if(address.value == '') {
															document.getElementById('error4').innerHTML = '\��ַ����Ϊ�ա�';
															}
														else{
															document.getElementById('error4').innerHTML = '';
															}
													});	
							
							addEvent(address,'paste',function(evt){
															   alert('��ַ��ֹ����');
															   preDef(evt);
															   })
							
							
															   
							var phone =  fm.elements['phone'];
							addEvent(phone,'blur',function(){
														if(phone.value == '') {
															document.getElementById('error5').innerHTML = '\�绰����Ϊ�ա�';
															}
														else{
															document.getElementById('error5').innerHTML = '';
															}
													});	
																				
							
							addEvent(fm,'submit',function(evt){                          //�ύ��֤
														 
												
									if(!checkUsername(username.value)) {
									  document.getElementById('error1').innerHTML = '\						    ��������ȷ���û���,�û�������Ϊ3-18λ,����ֻ��Ϊ���֣���ĸ���»�����ɣ�';
									  preDef(evt);
									  }
									 if(!checkPassard(passward.value)&&strEqual(username.value,passward.value)||!checkPassard(passward.   value)) {
										document.getElementById('error2').innerHTML = '\��������ȷ������,�û�������Ϊ6-16λ,����ֻ��Ϊ���֣���ĸ���»�����ɣ�';
										preDef(evt);
										}
									if(strEqual(username.value,passward.value)) {
										document.getElementById('error2').innerHTML = '\�����û��������벻����ͬ';
										 preDef(evt);
										}
									if(!strEqual(passward2.value,passward.value)) {
										document.getElementById('error3').innerHTML = '\����������������������ͬ';
										preDef(evt);
										}
									if(address.value == '') {
										document.getElementById('error4').innerHTML = '\��ַ����Ϊ�ա�';
										preDef(evt);
										}
									if(phone.value == '') {
										document.getElementById('error5').innerHTML = '\�绰����Ϊ�ա�';
										preDef(evt);
										}
									
									
								});	
		
			 });


function checkUsername(ssn){
	var str = /^\w{3,18}$/ig;
	if(!str.test(ssn)) {
		//alert("\��������ȷ���û���,�û�������Ϊ3-18λ,����ֻ��Ϊ���֣���ĸ���»�����ɣ�");
		//form.username.focus();
		return false;
	}

	return true;
}

function checkPassard(ssn){
	var str = /^\w{6,16}$/ig;
	if(!str.test(ssn)) {
		//alert("\��������ȷ������,�û�������Ϊ6-16λ,����ֻ��Ϊ���֣���ĸ���»�����ɣ�");
		//form.username.focus();
		return false;
	}

	return true;
}

function strEqual(ssn1,ssn2) {
	if(ssn1 == ssn2){
		return true;
		}
	else 
		return false;
	}

