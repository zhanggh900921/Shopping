addEvent(window,'load',function(){
							var fm = document.getElementsByName('myform')[0];

							
							var username = fm.elements['username'];

							
							addEvent(username,'blur',function(){
													 if(!checkUsername(username.value)) {
														  document.getElementById('error1').innerHTML = '\请输入正确的用户名,用户名长度为3-18位,而且只能为数字，字母和下划线组成！';
														  }
													  else{
														  document.getElementById('error1').innerHTML = '';
														  }
												 });
							
							
							var passward =  fm.elements['pwd'];
							addEvent(passward,'blur',function(){
														if(!checkPassard(passward.value)) {
															document.getElementById('error2').innerHTML = '\请输入正确的密码,用户名长度为6-16位,而且只能为数字，字母和下划线组成！';
															}
														else if(strEqual(username.value,passward.value)) {
															document.getElementById('error2').innerHTML = '\您的用户名和密码不能相同';
															}
														else{
															document.getElementById('error2').innerHTML = '';
															}
													});
							
							var passward2 =  fm.elements['pwd2'];
							addEvent(passward2,'blur',function(){
														if(!strEqual(passward2.value,passward.value)) {
															document.getElementById('error3').innerHTML = '\您的两次输入的密码必须相同';
															}
														else{
															document.getElementById('error3').innerHTML = '';
															}
													});
							
							
							
							var address =  fm.elements['addr'];
							addEvent(address,'blur',function(){
														if(address.value == '') {
															document.getElementById('error4').innerHTML = '\地址不能为空。';
															}
														else{
															document.getElementById('error4').innerHTML = '';
															}
													});	
							
							addEvent(address,'paste',function(evt){
															   alert('地址禁止复制');
															   preDef(evt);
															   })
							
							
															   
							var phone =  fm.elements['phone'];
							addEvent(phone,'blur',function(){
														if(phone.value == '') {
															document.getElementById('error5').innerHTML = '\电话不能为空。';
															}
														else{
															document.getElementById('error5').innerHTML = '';
															}
													});	
																				
							
							addEvent(fm,'submit',function(evt){                          //提交验证
														 
												
									if(!checkUsername(username.value)) {
									  document.getElementById('error1').innerHTML = '\						    请输入正确的用户名,用户名长度为3-18位,而且只能为数字，字母和下划线组成！';
									  preDef(evt);
									  }
									 if(!checkPassard(passward.value)&&strEqual(username.value,passward.value)||!checkPassard(passward.   value)) {
										document.getElementById('error2').innerHTML = '\请输入正确的密码,用户名长度为6-16位,而且只能为数字，字母和下划线组成！';
										preDef(evt);
										}
									if(strEqual(username.value,passward.value)) {
										document.getElementById('error2').innerHTML = '\您的用户名和密码不能相同';
										 preDef(evt);
										}
									if(!strEqual(passward2.value,passward.value)) {
										document.getElementById('error3').innerHTML = '\您的两次输入的密码必须相同';
										preDef(evt);
										}
									if(address.value == '') {
										document.getElementById('error4').innerHTML = '\地址不能为空。';
										preDef(evt);
										}
									if(phone.value == '') {
										document.getElementById('error5').innerHTML = '\电话不能为空。';
										preDef(evt);
										}
									
									
								});	
		
			 });


function checkUsername(ssn){
	var str = /^\w{3,18}$/ig;
	if(!str.test(ssn)) {
		//alert("\请输入正确的用户名,用户名长度为3-18位,而且只能为数字，字母和下划线组成！");
		//form.username.focus();
		return false;
	}

	return true;
}

function checkPassard(ssn){
	var str = /^\w{6,16}$/ig;
	if(!str.test(ssn)) {
		//alert("\请输入正确的密码,用户名长度为6-16位,而且只能为数字，字母和下划线组成！");
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

