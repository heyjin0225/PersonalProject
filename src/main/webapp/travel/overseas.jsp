<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
.continent{
	text-decoration: none;
	color: black;
	cursor: pointer;
}
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
#nextView{
	display:block;
	width:100%;
	height:34px;
	padding:6px 12px;
	font-size:14px;
	line-height:1.42857143;
	color:#555;
	background-color:#fff;
	background-image:none;
	border:1px solid #ccc;
	border-radius:4px;
	-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);
	box-shadow:inset 0 1px 1px rgba(0,0,0,.075);
	-webkit-transition:border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
	-o-transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s;
	transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s
}

#overseas-list{
	width: 75%;
}
#imageOverseasBox{
	width: 380px;
	/* margin-right: 20px; */
	text-align: center;
}
#textOverseasBox{
	width:800px;
}

@media only screen and (min-width:1501px) and (max-width:1800px){
	#allOverseasBox{
		display: flex;
	}
}

@media only screen and (max-width:1500px){
	#allOverseasBox{
		margin: 0 auto;
	}
	
	#imageOverseasBox{
		width: 100%;
	}
	.imageOverseasDiv{
		width: 350px;
		margin: 0 auto;
	}
	#textOverseasBox{
		width: auto;
	}
	.textOverseasDiv{
		width: 350px;
		margin: 0 auto;
	}
}
</style>

<section id="display">
	<!--explore start -->
	<section id="overseas" class="overseas">
		<div class="container">
			<div class="section-header" style="text-align: center;">
				<h2 style="font-size: 20pt;">해외 여행지</h2>
			</div>
			<!-- 해외 여행지는 나라 선택 (아시아, 유럽, 아프리카, 남아메리카, 북아메리카, 오세아니아) -->
			<div style="margin: 0px auto; width: 75%; text-align: right; word-break: keep-all; ">
				<a class="continent" onclick="return false;" value="아시아">아시아</a>&emsp;
				<a class="continent" onclick="return false;" value="유럽">유럽</a>&emsp;
				<a class="continent" onclick="return false;" value="중동">중동</a>&emsp;
				<a class="continent" onclick="return false;" value="아프리카">아프리카</a>&emsp;
				<a class="continent" onclick="return false;" value="남아메리카">남아메리카</a>&emsp;
				<a class="continent" onclick="return false;" value="북아메리카">북아메리카</a>&emsp;
				<a class="continent" onclick="return false;" value="오세아니아">오세아니아</a>
			</div>
		</div>
		<!--/.container-->
	</section>
	<table id="overseas-list" style ="margin: 0 auto;"></table>
	<!--/.explore-->
	<!--explore end -->
</section>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../travel/js/overseas.js"></script>
<script type="text/javascript" src="../travel/js/overseasOther.js"></script>
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