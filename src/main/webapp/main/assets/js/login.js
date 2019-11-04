$(document).ready(function() {
	// 로그아웃
	$('#logoutBtn').on('click', function() {
		location.href="/PersonalProject/member/memberLogout.do";
	});
	
	$('#loggedinA').on('click', function() {
		$.ajax({
			type : 'POST',
			url : '/PersonalProject/managementPage/managementPage.do',
			data : {'memId':$('#memId').val()},
			dataType : 'text',
			success : function(data) {
				if(data=="0") {
					location.href="/PersonalProject/managementPage/memberPage.do";
				}else if(data=="1") {
					location.href="/PersonalProject/managementPage/adminPage.do";
				}
			}
		});
	});
});