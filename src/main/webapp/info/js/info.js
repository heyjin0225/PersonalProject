$(document).ready(function(){
	$('.writeForm').on('click',function(){
		location.href="/PersonalProject/info/writeForm.do";
	});
	
	$('.write').on('click',function(){
		$('.subjectDiv, .contentDiv').empty();
		
		if($('#subject').val()==""){
			$(".subjectDiv").text("제목을 입력하세요").css('color','black').css('font-size','9pt').css('font-weight','bold');			
		}else if($('#content').val()==""){
			$('.contentDiv').text("내용을 입력하세요").css('color','black').css('font-size','9pt').css('font-weight','bold');	
		}else {
			$('#writeForm').submit();
		}
	});
	
	$('.reset').on('click',function(){
		$('.form-control').val("");
	});
	
	$('.list').on('click',function(){
		location.href="/PersonalProject/info/infomation.do";
	});
	
	$.ajax({
		type : 'POST',
		url : '/PersonalProject/info/boardList.do',
		data: {'pg':$('#pg').val()},
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index,items){
				$('<ul/>').append($('<li/>',{
					style : 'list-style: none; padding: 10px 20px; margin-left: 29.5%; float: left; ',
					html : items.seq 
				})).append($('<div/>',{
					style : 'padding: 10px 20px; float: left; position: relative; text-align : center; width: 249px; height: 15px; text-align: center;',
					class : 'subjectA '+ items.seq,
					href : 'javascript:void(0)',
					html : items.subject 
				})).append($('<li/>',{
					style : 'list-style: none; padding: 10px 20px; float: left; position: relative;',
					html : items.name 
				})).append($('<li/>',{
					style : 'list-style: none; padding: 10px 20px; margin-left: 5%; float: left; position: relative;',
					html : items.logtime
				})).append($('<hr>',{
					style : 'width: 51.52%; margin-left: -2.5%; border-bottom: 1px solid silver; border-left: 1px solid white; border-right: 1px solid white; border-top: 1px solid white;'
				})).appendTo($('#board-list'));
				
				
			});
			$('#board-paging').html(data.infoPaging.pagingHTML);
		},
		error : function(data){
			alert("error");
		}
	});
});