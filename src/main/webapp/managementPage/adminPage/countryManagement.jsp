<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="/PersonalProject/managementPage/adminPage/css/countryManagement.css">

<font size="6pt" style="color: #363636;">나라 관리</font><br>
	<hr align="left" style="color: black;
				  margin-top: 10px;
		    	  margin-bottom: 0px;
		    	  width: 160px;
		    	  border-top: 2px solid #5A5A5A;"><br>

<form class="countryListForm">
<div class="countryManagement">
	<div class="countryTotal">나라 Total : </div><br>
	
</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/PersonalProject/managementPage/adminPage/js/countryManagement.js"></script>
<script>
var countryNameAr = new Array(); // 나라 이름 배열

$(document).ready(function() {
	
	$.ajax({
		type : 'POST',
		url : '/PersonalProject/adminPage/getTotalCountry.do',
		dataType : 'text',
		success : function(data) {
			$('.countryTotal').append(data)
		}
	});
	
	// 나라 이름과 그 이름으로 나라 리스트 조회 - 각 나라만의 table 생성
	$.ajax({
		type : 'POST',
		url : '/PersonalProject/adminPage/getCountryName.do',
		dataType : 'json',
		success : function(data) {
			//alert(JSON.stringify(data));
			
			// 나라 이름 배열 초기화
			$.each(data.countryNameList, function(index, items) {
				countryNameAr[index] = items;
				//alert("countryNameAr[index] = "+countryNameAr[index]);
			});
			
			// 나라마다 table 하나씩 생성
			var cnt = 0; // 나라을 세번씩 선택하기 위한 cnt
			//alert("countryNameAr.length = "+countryNameAr.length);
			for(var i=0; i<countryNameAr.length; i++) {
				//alert("i= "+i);
				$('<table/>', {
					style : 'clear: both;',
					id : countryNameAr[i],
					class : 'countryListTable',
					align : 'center'
					
					}).append($('<tr/>').append($('<td/>', {
						style : 'font-weight: bold;'
							
						}).append($('<div/>', {
							text : countryNameAr[i],
							class : 'countryListToggle',
							style : 'background: linear-gradient(to bottom, #7B7B7B, #575757);'+
									'height: 100%;'+
									'border: 0px;'+
									'width: 100%;'+
									'font-size: 17px;'+
									'text-align: center;'+
									'letter-spacing: 3px;',
					
					}))).append($('<td/>', {
						style : 'width: 40px; border: 0px; font-size: 30px; color: #484848; padding-top: 4px;'
							
					}).append($('<i/>', {
							style : 'width: 40px; height: 100%; cursor: pointer;',
							class : 'fa fa-minus-circle countryDeleteBtn',
							id : countryNameAr[i]
					
				})))).appendTo($('.countryManagement'));
				
			}//for문
		} // success
	}); // ajax
});
</script>