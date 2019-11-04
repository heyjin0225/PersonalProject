$(document).ready(function(){
	// 로그인
	$('#loginBtn').on('click', function() {
		var loginId = $('#loginId').val();
		var loginPwd = $('#loginPwd').val();
		
		if(loginId!=""&&loginPwd!="") {
			$.ajax({
				type : 'POST',
				url : '/PersonalProject/member/memberLogin.do',
				data : {'loginId':loginId, 'loginPwd':loginPwd},
				dataType : 'text',
				success : function(data) {
					if(data=='exist') {
						location.reload(); 
					}else if(data=='non_exist') 
						alert("아이디/비밀번호가 틀렸거나 이메일 인증을 하지 않았습니다.\n확인해주세요.");
				}
			});
		}
	});
	
	// 비밀번호 찾기
	$('.findMemberToggle').on('click', function() {
		$('.loginContainer').stop().removeClass('active');
	  	$('.loginContainer').stop().addClass('findMember');
	});
	
	// 회원가입 창
	$('.loginToggle').on('click', function() {
		$('.loginContainer').stop().removeClass('findMember');
	  	$('.loginContainer').stop().addClass('active');
	});
	
	$('.close').on('click', function() {
	  $('.loginContainer').stop().removeClass('active');
	  $('.loginContainer').stop().removeClass('findMember');
	});
});
/////////////////////////////////////////////////////////////////아이디&비밀번호 찾기
function rsaFind(){
	//애니메이션 효과
	$.ajax({
		type : 'POST',
		url : '/PersonalProject/member/makeRSAKey.do',
		success : function(data) {
			var rsaPublicKey = data.split(',');
			//alert(rsaPublicKey);
			$('#hiddenModulus').val(rsaPublicKey[0]);
			$('#hiddenExponent').val(rsaPublicKey[1]);
			
			if(data != null){
				$("#myModal_find").fadeIn(500);
			}
		}
	});
}
//로그인 키
function makePrivateKey(loginId, loginPwd, rsaPublicKeyModulus, rsaPublicKeyExponent) {
	var rsa = new RSAKey(); 

	rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent); 
	
	// 사용자 ID와 비밀번호를 RSA로 암호화한다. 
	var securedUsername = rsa.encrypt(loginId); 
	var securedPassword = rsa.encrypt(loginPwd); 
	
	// POST 로그인 폼에 값을 설정하고 발행(submit)한다. 
	document.loginForm.securedUsername.value = securedUsername; 
	document.loginForm.securedPassword.value = securedPassword;
	if(loginId!=""&&loginPwd!="") {
		$.ajax({
			type : 'POST',
			url : '/PersonalProject/member/memberLogin.do',
			data : {'loginId':loginId, 'loginPwd':loginPwd, 'publicKeyModulus':rsaPublicKeyModulus, 'publicKeyExponent':rsaPublicKeyExponent, 'securedUsername':securedUsername, 'securedPassword':securedPassword},
			dataType : 'text',
			success : function(data) {
				if(data=='exist') {
					window.location.reload();
				}else if(data=='non_exist') 
					alert("아이디/비밀번호가 틀렸거나 이메일 인증을 하지 않았습니다.\n확인해주세요.");
			}
		});
	}
}
function checkPost(){
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }
			alert(data.zonecode);
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('isZipcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr1').value = fullAddr;
			
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addr2').focus();
           
        }
    }).open();
}