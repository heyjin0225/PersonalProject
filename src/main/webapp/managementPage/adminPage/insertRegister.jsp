<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	if('${su }' == 1)
		alert("나라 등록 완료");		
	else
		alert("나라 등록 실패");
	location.href = "/PersonalProject/adminPage/insertManagement.do";
</script>