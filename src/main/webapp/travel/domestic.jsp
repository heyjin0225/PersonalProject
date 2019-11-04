<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
h3{
	margin : 0;
}
/* 좋아요 css */
.btn_like{
	display: block;
	float: right;
	width: 44px;
	height: 44px;
	border: 1px solid #e8e8e8;
	border-radius: 44px;
	background-color: #fff;
	color: #DD5D54;
	box-shadow: 0 2px 2px 0 rgba(0,0,0,0.03);
	transition: border .2s ease-out,box-shadow .1s ease-out,background-color .4s ease-out;
	cursor: pointer;
}
.btn_like:hover {
  border: 1px solid rgba(228,89,89,0.3);
  background-color: rgba(228,89,89,0.02);
  box-shadow: 0 2px 4px 0 rgba(228,89,89,0.2);
}
.btn_unlike .img_etomi{
	background-position: -30px -120px;
}

.btn_like .heart_img {
    margin: 8px 0 0 3px;
    border-radius: 9px;
}
.heart_img {
    width: 36px;
    height: 30px;
    pointer-events: none;
}
.heart_img.hi{	
	background-image: url(/PersonalProject/main/assets/img/heart.png);
	-webkit-background-size: 36px 30.5px;
    background-size: 36px 30.5px;
    animation: on_m 1.06s steps(72);
}
.heart_img.bye{
	background-image: url(/PersonalProject/main/assets/img/heart2.png);
	-webkit-background-size: 36px 30px;
    background-size: 36px 30px;
    animation: off_m 1.06s steps(66);
}
</style>
<input type="hidden" id="pg" value="${pg}" />
<section id="display">
	<!--explore start -->
	<section id="domestic" class="domestic">
		<div class="container">
			<div class="section-header" style="text-align: center;">
				<h2 style="font-size: 20pt; padding: 10px;">국내 여행지</h2>
				
			</div>
		</div>
		<!--/.container-->
	</section>
	<table id="domestic-list" style ="margin: 0 auto; width : 75%;"></table>
	
	<!--/.explore-->
	<!--explore end -->
</section>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../travel/js/domestic.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var memId = "<%=session.getAttribute("memId") %>";
	if (memId != "null"){
		var heart_id = memId;
		$.ajax({
			type : 'POST',
			url : '/PersonalProject/travel/getHeart.do',
			data : {'heart_id': heart_id},
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				 $.each(data.list, function(index,items){
					if(items.heart_check == 1){
						$('#heartBtn'+items.heart_no).addClass('btn_unlike');
						$('#heart_img'+items.heart_no).addClass('hi');
						$('#heart_img'+items.heart_no).removeClass('bye');
					} 
				});
			},
			error : function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
	
		});
	}
});
function moveHeart(seq){
	var heart_no = seq;
	var heart_id = '${memId}';
	if('${memId}' != ""){
		if($('#heartBtn'+seq).hasClass('btn_unlike')){				//좋아요 취소
			$.ajax({
				type : 'POST',
				url : '/PersonalProject/travel/deleteHeart.do',
				data : {'heart_no':heart_no, 'heart_id': heart_id},
				dataType : 'json',
				success : function(data){
					alert("좋아요 취소");
				}
			});
			$('#heartBtn'+seq).removeClass('btn_unlike');
			$('#heart_img'+seq).removeClass('hi');
			$('#heart_img'+seq).addClass('bye');
		}else{
			$.ajax({
		  		type : 'POST',
				url : '/PersonalProject/travel/insertHeart.do',
				data : {'heart_no':heart_no, 'heart_id': heart_id},	
				dataType : 'json',
				success : function(data) {
					alert("좋아요");
				}
		  	});  
			$('#heartBtn'+seq).addClass('btn_unlike');
			$('#heart_img'+seq).addClass('hi');
			$('#heart_img'+seq).removeClass('bye');
		}
	}else{
		loginPop();

	}

}
</script>