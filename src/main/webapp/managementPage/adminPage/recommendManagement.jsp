<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form name="recommendCountryForm" method="post" action="/PersonalProject/adminPage/recommendCountryUpdate.do">
<font size="6pt" style="color: #363636;">추천 나라 선택</font><br><hr align="left" style="color: black;
				  margin-top: 10px;
		    	  margin-bottom: 0px;
		    	  width: 205px;
		    	  border-top: 2px solid #5A5A5A;"><br>
<table class="table table-striped">
	<tr>
		<td style="width: 500px;">
			<span>
				<select id="recommendCountrySelect" name="recommendCountrySelect" multiple style="width: 100%; height:300px; font-size: 13pt;">
					<c:forEach var="list" items="${recommendCountryList }">
						<option value=${list.WORDNAME }>${list.WORDNAME }</option>
					</c:forEach>
				</select>
			</span>
		</td>
	</tr>
	<tr>
		<td id="btnId" colspan="2" style="text-align: right;">
			<input type="button" class="btn btn-default" id="recommendCountryResisterBtn" value="추천 나라 등록">
		</td>
	</tr>
</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#recommendCountryResisterBtn').on('click',function(){
		if($('select#recommendCountrySelect option:selected').length ==6) {
			$('form[name=recommendCountryForm]').submit();	
		} else {
			alert('나라 6곳을 선택해 주세요.');
		}
	});	
	
});
</script>
