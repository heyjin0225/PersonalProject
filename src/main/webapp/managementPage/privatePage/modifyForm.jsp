<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/PersonalProject/managementPage/privatePage/css/memberPage.css">

<div id="modifyFormDiv">
<font size="6pt" clss="modifyFormTitle" style="color: #363636;">회원 정보 수정</font><br>
<hr align="left" clss="modifyFormTitle" style="color: black;
			  margin-top: 10px;
	    	  margin-bottom: 0px;
	    	  width: 213px;
	    	  border-top: 2px solid #5A5A5A;
	    	  margin-left: 40.7%;"><br><br><br>
<form name="modifyForm" class="modifyForm">
<table class="modifyTable">
	<tr>
		<td align="center">이름</td>
		<td>
			<input type="text" class="modifyName" size="20" value="${memberDTO.name }">
			<div class="checkModifyNameDiv"></div>
		</td>
	</tr>
	<tr>
		<td align="center">아이디</td>
		<td>
			<input type="text" class="modifyId" size="30" value="${memberDTO.id }" readonly>
		</td>
	</tr>
  	<tr>
	   <td align="center">비밀번호</td>
	   <td>
		   	<input type="password" class="modifyPwd" size="30">
		    <div class="checkModifyPwdDiv"></div>
	   </td>
  	</tr>
  	<tr>
   		<td align="center">재확인</td>
	   	<td>
		    <input type="password" class="modifyRePwd" size="30">
		    <div class="checkModifyRePwdDiv"></div>
	   	</td>
  	</tr>
  	<tr>
		<td align="center">이메일</td>
		<td>
			<input type="text" class="modifyEmail" size="30" value="${memberDTO.email }" readonly>
		</td>
	</tr>
	<tr>
		<td align="center">주소</td>
		<td>
			<input type="text" id="zipcode" size="10" value="${memberDTO.zipcode }" readonly>
			<input type="button" value="우편번호검색" class="checkPostBtn"><br>
			<input type="text" id="addr1" size="50" value="${memberDTO.addr1 }" readonly><br>
			<input type="text" id="addr2" size="50" value="${memberDTO.addr2 }">
			<div class="checkAddr2Div"></div>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="background: #ffffff;">
			<input type="button" class="modifyBtn" value="회원정보수정">
			<input type="reset" value="다시작성">
		</td>
	</tr>
</table>
</form>
</div>
<script src="/PersonnalProject/managementPage/privatePage/js/memberPage.js"></script>
<script>
$(document).ready(function(){
	$('table td:last').css("background","white").css("font-weight","initial");
	
	$('.modifyName, .modifyPwd, .modifyRePwd, #addr2').on('click',function(){
		$('.checkNameDiv, .checkPwdDiv, .checkRePwdDiv, .checkAddr2Div').empty();
	});
	
	$('.checkRePwdDiv').keyup('change',function(){
		if($('.modifyPwd').val() == $('.modifyRePwd').val())
			$('.checkRePwdDiv').text('비밀번호가 동일합니다.').css('color','blue').css('font-size','9pt');
		else
			$('.checkRePwdDiv').text('비밀번호가 맞지 않습니다.').css('color','red').css('font-size','9pt');
	});
	
	$('.modifyBtn').on('click',function(){
		if($('.modifyName').val()=="") {
			$('<span/>',{
				style : 'color:red; font-weight:bold; font-size:9pt;',
				text : '이름을 입력해 주세요.'
			}).appendTo($('.checkModifyNameDiv'));
		} else if($('.modifyPwd').val()=="") {
			$('<span/>',{
				style : 'color:red; font-weight:bold; font-size:9pt;',
				text : '비밀번호를 입력해 주세요.'
			}).appendTo($('.checkModifyPwdDiv'));
		} else if($('.modifyRePwd').val()=="") {
			$('<span/>',{
				style : 'color:red; font-weight:bold; font-size:9pt;',
				text : '비밀번호를 재입력해 주세요.'
			}).appendTo($('.checkModifyRePwdDiv'));
			
		} else if($('.modifyRePwd').val()!=$('.modifyPwd').val()) {
			$('<span/>',{
				style : 'color:red; font-weight:bold; font-size:9pt;',
				text : '비밀번호가 맞지 않습니다.'
			}).appendTo($('.checkModifyRePwdDiv'));
		} else if($('#addr2').val()=="") {
			$('<span/>',{
				style : 'color:red; font-weight:bold; font-size:9pt;',
				text : '상세주소를 입력해주세요.'
			}).appendTo($('.checkAddr2Div'));
		}else {
			$.ajax({
				type : 'POST',
				url : '../privatePage/modify.do',
				data :  {'email':$('.modifyEmail').val(), 'id':$('.modifyId').val(), 'name':$('.modifyName').val(), 'pwd':$('.modifyPwd').val(), 'zipcode':$('#zipcode').val(), 'addr1':$('#addr1').val(), 'addr2':$('#addr2').val()},
				dataType : 'text',
				success : function(data){
					if(data=="success"){
						alert("회원님의 정보를 수정하였습니다.");
						location.href="../managementPage/memberPage.do";
					}
				}
			});
		}
	});
});
</script>