<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="/PersonalProject/managementPage/adminPage/css/countryManagement.css">

<font size="6pt" style="color: #363636;">���� ����</font><br>
	<hr align="left" style="color: black;
				  margin-top: 10px;
		    	  margin-bottom: 0px;
		    	  width: 160px;
		    	  border-top: 2px solid #5A5A5A;"><br>

<form class="countryListForm">
<div class="countryManagement">
	<div class="countryTotal">���� Total : </div><br>
	
</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/PersonalProject/managementPage/adminPage/js/countryManagement.js"></script>
<script>
var countryNameAr = new Array(); // ���� �̸� �迭

$(document).ready(function() {
	
	$.ajax({
		type : 'POST',
		url : '/PersonalProject/adminPage/getTotalCountry.do',
		dataType : 'text',
		success : function(data) {
			$('.countryTotal').append(data)
		}
	});
	
	// ���� �̸��� �� �̸����� ���� ����Ʈ ��ȸ - �� ������ table ����
	$.ajax({
		type : 'POST',
		url : '/PersonalProject/adminPage/getCountryName.do',
		dataType : 'json',
		success : function(data) {
			//alert(JSON.stringify(data));
			
			// ���� �̸� �迭 �ʱ�ȭ
			$.each(data.countryNameList, function(index, items) {
				countryNameAr[index] = items;
				//alert("countryNameAr[index] = "+countryNameAr[index]);
			});
			
			// ���󸶴� table �ϳ��� ����
			var cnt = 0; // ������ ������ �����ϱ� ���� cnt
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
				
			}//for��
		} // success
	}); // ajax
});
</script>