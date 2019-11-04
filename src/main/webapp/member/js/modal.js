$(document).ready(function(){
	//비밀번호찾기
	$('.findPwdForm').hide();
	//아이디 찾기
	if($('input:radio[name=find]:checked').val()==0){
		$('#findTitle').text('아이디 찾기');
	}
	
	//회원가입 - Next
	$('#writeBtn').on('click',function(){
		var getId = RegExp(/^[A-Za-z0-9_\.\-]+/);
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	    var getName = RegExp(/^[가-힣]+$/);
	    var num = /[0-9]/;
        var eng = /[a-zA-Z]/;
        var spe = /[\~\!\@\#\$\%\<\>\^\&\*\-\_]/;
        
        $('#idDiv, #nameDiv, #pwdDiv, #rePwdDiv, #emailDiv').empty();
		
		
        if($('.name').val()=="") {
			$('<span/>',{
				style : 'color:black; font-weight:bold; font-size:9pt;',
				text : '이름을 입력해 주세요.'
			}).appendTo($('#nameDiv'));
		} else if(!getName.test($('.name').val())) {
			$('<span/>',{
				style : 'color:black; font-weight:bold; font-size:9pt;',
				text : '한글로 이름을 입력해 주세요.'
			}).appendTo($('#nameDiv'));
			$('.name').val("");
			$('.name').focus();
		} else if($('.id').val()=="") {
			$('<span/>',{
				style : 'color:black; font-weight:bold; font-size:9pt;',
				text : '아이디를 입력해 주세요.'
			}).appendTo($('#idDiv'));
			$('.id').focus();
		} else if(!getId.test($('.id').val())) {
			$('<span/>',{
				style : 'color:black; font-weight:bold; font-size:9pt;',
				text : '아이디 형식에 맞게 입력해 주세요.'
			}).appendTo($('#idDiv'));
			$('.id').val("");
			$('.id').focus();
		} else if($('#idcheck').val()=="") {
			$('<span/>',{
				style : 'color:black; font-weight:bold; font-size:9pt;',
				text : '아이디를 체크해주세요.'
			}).appendTo($('#idDiv'));
		} else if($('.pwd').val()=="") {
			$('<span/>',{
				style : 'color:black; font-weight:bold; font-size:9pt;',
				text : '비밀번호를 입력해 주세요.'
			}).appendTo($('#pwdDiv'));
		} else if($('.pwd').val().length < 8) {
			$('<span/>',{
				style : 'color:black; font-weight:bold; font-size:9pt;',
				text : '비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요.'
			}).appendTo($('#pwdDiv'));
			$('.pwd').val("");
			$('.pwd').focus();
		} else if(!num.test($('.pwd').val())||!eng.test($('.pwd').val())||!spe.test($('.pwd').val())||$('.pwd').val().length<8||$('.pwd').val().length>16) {
			$('<span/>',{
				style : 'color:black; font-weight:bold; font-size:9pt;',
				text : '비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요.'
			}).appendTo($('#pwdDiv'));
			$('.pwd').val("");
			$('.pwd').focus();
		} else if($('.rePwd').val()=="") {
			$('<span/>',{
				style : 'color:black; font-weight:bold; font-size:9pt;',
				text : '비밀번호를 재입력해 주세요.'
			}).appendTo($('#rePwdDiv'));
		} else if($('.rePwd').val().length < 8) {
			$('<span/>',{
				style : 'color:black; font-weight:bold; font-size:9pt;',
				text : '비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요.'
			}).appendTo($('#rePwdDiv'));
			$('.rePwd').val("");
			$('.rePwd').focus();
		} else if(!num.test($('.rePwd').val())||!eng.test($('.rePwd').val())||!spe.test($('.rePwd').val())||$('.rePwd').val().length<8||$('.rePwd').val().length>16) {
			$('<span/>',{
				style : 'color:black; font-weight:bold; font-size:9pt;',
				text : '비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요.'
			}).appendTo($('#rePwdDiv'));
			$('.rePwd').val("");
			$('.rePwd').focus();
		} else if($('.email').val()=="") {
			$('<span/>',{
				style : 'color:black; font-weight:bold; font-size:9pt;',
				text : '이메일을 입력해 주세요.'
			}).appendTo($('#emailDiv'));
			$('.email').focus();
		} else if(!getMail.test($('.email').val())) {
			$('<span/>',{
				style : 'color:black; font-weight:bold; font-size:9pt;',
				text : '이메일 형식에 맞게 입력해 주세요.'
			}).appendTo($('#emailDiv'));
			$('.email').val("");
			$('.email').focus();
		}  else if($('#emailcheck').val()=="") {
			$('<span/>',{
				style : 'color:black; font-weight:bold; font-size:9pt;',
				text : '이메일을 체크해주세요.'
			}).appendTo($('#emailDiv'));
		} else if($('.zipcode').val()==""){
			$('<span/>',{
				style : 'color:black; font-weight:bold; font-size:9pt;',
				text : '주소를 검색해주세요.'
			}).appendTo($('#addrDiv'));
		} else if($('.addr2').val()==""){
			$('<span/>',{
				style : 'color:black; font-weight:bold; font-size:9pt;',
				text : '상세주소를 입력해주세요.'
			}).appendTo($('#addrDiv'));
			$('.addr2').focus();
		}else {
			$.ajax({
				type : 'POST',
				url : '../member/write.do',
				data :  {'id':$('.id').val(), 'pwd':$('.pwd').val(), 'name':$('.name').val(), 'email':$('.email').val(), 
						'zipcode':$('.zipcode').val(), 'addr1':$('.addr1').val(), 'addr2':$('.addr2').val()},
				dataType : 'text',
				success : function(data){
					alert(data);
					if(data=="success"){
						alert("회원가입 완료!!\n\n작성하신 이메일로 인증 메일을 발송했습니다.\n인증을 하셔야 로그인이 가능합니다.");
						location.href="../main/index.do"
					}
				}
			});
		}
	});
	
	//비밀번호 재입력
	$('#rePwd').keyup(function(){
		if($('.pwd').val() != $(this).val()){
			$('#rePwdDiv').text("비밀번호가 맞지 않습니다.").css('color','black').css('font-size','9pt').css('font-weight','bold');
		}else if($('.pwd').val() == $(this).val()){
			$('#rePwdDiv').text("비밀번호가 맞습니다.").css('color','black').css('font-size','9pt').css('font-weight','bold');
		}
	});
	
	//이메일 체크
	$('.emailCheck').on('click',function(){
		$('#emailDiv').empty();
		
		$.ajax({
			type : 'POST',
			url : '/PersonalProject/member/checkEmail.do',
			data : {'email':$('.email').val()},
			dataType : 'text',
			success : function(data){
				if(data=="empty") {
					$('<span/>',{
						style : 'color:black; font-weight:bold; font-size:9pt;',
						text : '이메일을 입력하세요.'
					}).appendTo($('#emailDiv'));
				} else if(data=="exist"){
					$('<span/>',{
						style : 'color:black; font-weight:bold; font-size:9pt;',
						text : '사용 불가능한 이메일 입니다.'
					}).appendTo($('#emailDiv'));
					$('.email').val('');
				} else if(data=="non_exist"){
					$('<span/>',{
						style : 'color:black; font-weight:bold; font-size:9pt;',
						text : '사용 가능한 이메일 입니다.'
					}).appendTo($('#emailDiv'));
					$('#emailcheck').val(email);
				}
			}
		});
	});
	
	//아이디 체크
	$('.idCheck').on('click',function(){
		$('#idDiv').empty();
		
		$.ajax({
			type : 'POST',
			url : '/PersonalProject/member/checkId.do',
			data : {'id':$('.id').val()},
			dataType : 'text',
			success : function(data){
				if(data=="empty") {
					$('<span/>',{
						style : 'color:black; font-weight:bold; font-size:9pt;',
						text : '아이디를 입력하세요.'
					}).appendTo($('#idDiv'));
				} else if(data=="exist"){
					$('<span/>',{
						style : 'color:black; font-weight:bold; font-size:9pt;',
						text : '사용 불가능한 아이디 입니다.'
					}).appendTo($('#idDiv'));
					$('.id').val('');
				} else if(data=="non_exist"){
					$('<span/>',{
						style : 'color:black; font-weight:bold; font-size:9pt;',
						text : '사용 가능한 아이디 입니다.'
					}).appendTo($('#idDiv'));
					$('#idcheck').val(id);
				}
			}
		});
	});
	
	//우편번호 검색
	$('.postSearch').on('click',function(){
		$('#addrDiv').empty();
		
		checkPost();
	});
	
	// 로그인
	$('#loginBtn').on('click', function() {
		$('#loginIdDiv').empty();
		$('#loginPwdDiv').empty();
		
		var loginId = $('#loginId').val();
		var loginPwd = $('#loginPwd').val();
		
		if($('#loginId').val()=="")	$('#loginIdDiv').text('아이디를 입력해 주세요.').css('color','red').css('font-weight','bold').css('font-size','9pt');
		
		else if($('#loginPwd').val()=="") $('#loginPwdDiv').text('비밀번호를 입력해 주세요.').css('color','red').css('font-weight','bold').css('font-size','9pt');
		
		else {
			try { 
				var rsaPublicKeyModulus = $("#hiddenModulus").val();
				var rsaPublicKeyExponent = $("#hiddenExponent").val();
				makePrivateKey(loginId, loginPwd, rsaPublicKeyModulus, rsaPublicKeyExponent); 
			} catch(err) { 
					alert(err); 
			}
		}
	});
	
	//아이디 & 비밀번호 찾기
	$('#findId_Pwd').click(function(){
		$('#myModal_login').fadeOut(300);
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
		$('#myModal_find').css({
			'width' : maskWidth,
			'height' : maskHeight
		});
		//alert(maskWidth+","+maskHeight);
		rsaFind();
	});
	
	$('.checkInput').on('click',function(){
		$('.findSpan').remove();
		$('.findIdDivValid').css('height','40px');
		$('.findPwdDivValid').css('height','40px');
	});
	
	$('#findIdBtn').on('click', function(){
		$('.findSpan').remove();
		$('.findIdDivValid').empty();
		
		if($('#checkEmail').val()==""){
			/* $('<span/>',{
				style : 'font-size:12pt; font-weight:bold; color: black;',
				text : '이메일을 전부 입력해주세요.'
			}).appendTo($('.findIdDivValid')); */
			
			$('.findIdDivValid').css('height','14.5px');
		 	$('.findIdDivValid').before($('<span/>',{
		 		class : 'findSpan',
				style : 'font-size:12pt; font-weight:bold; color: black;',
				text : '이메일을 전부 입력해주세요.'
			}));
		} else {
			$.ajax({
				type : 'POST',
				url : '../member/findId.do',
				data : {'email':$('#checkEmail').val()},
				dataType : 'text',
				success : function(data){
					if(data==""){
						alert("가입된 아이디가 없습니다.");
					} else {
						$('<span/>',{
							style : 'font-size:12pt; font-weight:bold; color: black;',
							text : '찾으시는 아이디는 '+data+' 입니다.'
						}).appendTo($('.findIdDivValid'));
					}
				}
			});
		}
	});
	$('#findMemberBtn').on('click', function(){
		$('.findSpan').remove();
		$('.findPwdDivValid').empty();
		
		if($('#checkId').val()==""){

			$('.findPwdDivValid').css('height','14.5px');
		 	$('.findPwdDivValid').before($('<span/>',{
		 		class : 'findSpan',
				style : 'font-size:12pt; font-weight:bold; color: black;',
				text : '아이디를 전부 입력해주세요.'
			}));
			
		} else {
			$.ajax({
				type : 'POST',
				url : '/PersonalProject/member/findMember.do',
				data : {'id':$('#checkId').val()},
				dataType : 'text',
				success : function(data){
					if(data=="fail"){
						$('<span/>',{
							style : 'font-size:12pt; font-weight:bold; color:black;',
							text : '작성하신 아이디는 가입되어있지 않습니다.'
						}).appendTo($('.findPwdDivValid'));
						
					} else if(data=="invalid_email"){
						$('<span/>',{
							style : 'font-size:12pt; font-weight:bold; color:black;',
							text : '인증되지 않은 아이디입니다.'
						}).appendTo($('.findPwdDivValid'));
						
					} else if(data=="success"){
						alert("가입하신 이메일로 임시 비밀번호를 전송하였습니다.");
						location.href="../main/index.do";
					}
				}
			});
		}
	});
	$('.findId').on('click', function(){
		$('.findPwdForm').hide();
		$('.findIdForm').show();
		$('#findTitle').text("아이디 찾기");
		$('.findPwdDivValid').text('');
		$('.checkInput').text('');
	});
	$('.findPwd').on('click', function(){
		$('.findIdForm').hide();
		$('.findPwdForm').show();
		$('#findTitle').text("비밀번호 찾기");
		$('.findIdDivValid').text('');
		$('.checkInput').text('');
	});
	
	/* 유효성 검사 리셋 */
	$('.close, .findMemberToggle').on('click', function() {
		$('.findPwdDivValid, .findIdDivValid').text('');
		
	});
	
	/* 모달 종료 버튼 */
	$('#loginCancelBtn').on('click', function() {
		$('#myModal_find').fadeOut(300);
	});
});