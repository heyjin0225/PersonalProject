$(document).ready(function(){
	if($('#id').val()==""){
		location.href="/PersonalProject/main/index.do";
	}
	//여행지 등록
	$('.travel_writeBtn').on('click',function(){
		$("#wordDiv").empty();
		$('#cityIdDiv').empty();
		$('#cityContentDiv').empty();
		if($('#countryid option:selected').val()==""){
			$("#wordDiv").text("나라를 선택하세요").css('color','red').css('font-size','9pt').css('margin-top','5px').css('font-weight','bold');			
		}else if($('#cityimage').val()==""){
			$('#wordDiv').text("파일을 입력하세요").css('color','red').css('font-size','9pt').css('font-weight','bold').css('margin-top','5px');	
		}else if($('#cityid').val()==""){
			$('#cityIdDiv').text("도시이름를 입력하세요").css('color','red').css('font-size','9pt').css('font-weight','bold').css('margin-top','5px');	
		}else if($('#citycontent').val()==""){
			$('#cityContentDiv').text("소개글을 입력하세요").css('color','red').css('font-size','9pt').css('font-weight','bold').css('margin-top','5px');	
		}else {
			$('#travel_writeForm').submit();
		}
	});
	
	//나라 카테고리 - 국내
	$('.domestic').on('click',function(){
		$('#cityid').attr('disabled',true);
	});
	
	$('.domestic').on('click',function(){
		$("#countryid2").val("대한민국").prop("selected", true);
	});
	
	$('.overseas').on('click',function(){
		$("select option[value='대한민국']").prop('disabled',true);
	});
});