<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
.recommendCountryContentBody{
	padding-right: 20px;
	width: 400px;
}
/*max-width는 전체 화면의 크기를 말한다.  */
@media only screen and (max-width:1200px){
	.recommendCountryContent{
		/* flex-direction:column; */
		flex-wrap: wrap;
		justify-content: center;
	}
}
</style>

<section id="display">
	
	<!--explore start -->
	<section id="explore" class="explore" style="margin-top:-10px;">
		<div align="center" style="padding-bottom: 30px; margin-top: -35px;">※여행지는 사용자들이 등록한 탭이며, 나라는 에디터가 등록한 탭입니다.※</div>
		<div class="container">
			<div class="section-header" style="text-align: center;">
				<h2 style="margin: 0px 0px 10px; font-size: 20pt;">이 달의 추천 나라</h2>
				<p style="font-family: 휴먼편지체; font-size: 15pt;">에디터가 선정한 이달의 추천 나라 입니다!</p>
			</div>
			<!--/.section-header-->
			<div class="explore-content" align="center">
				<div class="row" style="width:80%;">
					<!-- 1~6 슬롯 나라 시작 -->
					<div class="row recommendCountryContent" style="display: flex;"></div>
					<!-- 1~6 슬롯 나라 끝 -->
				</div>
			</div>
		</div>
		<!--/.container-->
	</section>
	<!--/.explore-->
	<!--explore end -->
	
</section>
<script src="/PersonalProject/main/assets/js/slider.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
         type : 'POST',
         url : '/PersonalProject/main/getRecommendView.do',
         dataType: 'json',
         success : function(data){
         	$.each(data.list, function(index,items){
         		if(items.CITYID == null){
         			$('<div/>',{
             			class : 'recommendCountryContentBody',
             			html :
             				'<div class=" col-md-4 col-sm-6">'+
             				'<div class="single-explore-item">'+
             				'<div class="single-explore-img" id="countryRecommendSlot" style="line-height: 0;">'+
    						'<div id="mainTitleCountryImage'+index+'"></div>'+ /* 타이틀 이미지 */
    						'<div class="single-explore-img-info">'+
    						'<button onclick="window.location.href=#">이번달 추천!</button>'+ /* 빨간 추천 버튼 */
    						'<div class="single-explore-image-icon-box">'+
    						'<ul>'+
    						'<li>'+
    						'<div class="single-explore-image-icon">'+
    						'<i class="fa fa-arrows-alt"></i>'+
    						'</div>'+
    						'</li>'+
    						'<li>'+
    						'<div class="single-explore-image-icon">'+
    						'<i class="fa fa-bookmark-o"></i>'+
    						'</div>'+
    						'</li>'+
    						'</ul>'+
    						'</div>'+
    						'</div>'+
    						'</div>'+
    						'<div class="single-explore-txt bg-theme-1" style="text-align: left;">'+
    						'<p style="font-size: 12px;"></p>'+
    						'<h2 class="mainTitleWordName">'+
    						'<a id="mainTitleCountryName'+index+'"  style="text-decoration: none;" class="countryLink'+index+'" href="/PersonalProject/country/country_index.do?countryId='+items.WORDNAME+'">'+items.WORDNAME+'</a>'+ /* 타이틀 */
    						'</h2>'+
    						'<div class="col-sm-10" style="margin: 15px 0px 20px;">'+
    						'<span id="countryContent'+index+'">'+items.CITYADDR+'</span>'+ /*(주소) */
    						'</div>'+
    						'</div>'+
    						'</div>'+
    						'</div>'+
    						'</div>'+
    						'</div>'
             		 }).appendTo($('div.recommendCountryContent'));
             		$('div#mainTitleCountryImage'+index).html("<img src='../country/storage/"+items.CITYIMAGE+"' alt='explore image' style='height: 255px;'/>");
         		}else{
         			 $('<div/>',{
              			class : 'recommendCountryContentBody',
              			html :
              				'<div class=" col-md-4 col-sm-6">'+
              				'<div class="single-explore-item">'+
              				'<div class="single-explore-img" id="countryRecommendSlot" style="line-height: 0;">'+
     						'<div id="mainTitleCountryImage'+index+'"></div>'+ /* 타이틀 이미지 */
     						'<div class="single-explore-img-info">'+
     						'<button onclick="window.location.href=#">이번달 추천!</button>'+ /* 빨간 추천 버튼 */
     						'<div class="single-explore-image-icon-box">'+
     						'<ul>'+
     						'<li>'+
     						'<div class="single-explore-image-icon">'+
     						'<i class="fa fa-arrows-alt"></i>'+
     						'</div>'+
     						'</li>'+
     						'<li>'+
     						'<div class="single-explore-image-icon">'+
     						'<i class="fa fa-bookmark-o"></i>'+
     						'</div>'+
     						'</li>'+
     						'</ul>'+
     						'</div>'+
     						'</div>'+
     						'</div>'+
     						'<div class="single-explore-txt bg-theme-1" style="text-align: left;">'+
     						'<p style="font-size: 12px;">'+items.CITYID+'</p>'+
     						'<h2 class="mainTitleWordName">'+
     						'<a id="mainTitleCountryName'+index+'"  style="text-decoration: none;" class="countryLink'+index+'" href="/PersonalProject/country/country_index.do?countryId='+items.WORDNAME+'">'+items.WORDNAME+'</a>'+ /*타이틀 */
     						'</h2>'+
     						'<div class="col-sm-10" style="margin: 15px 0px 20px;">'+
     						'<span id="countryContent'+index+'">'+items.CITYADDR+'</span>'+ /*(주소) */
     						'</div>'+
     						'</div>'+
     						'</div>'+
     						'</div>'+
     						'</div>'+
     						'</div>'
              		 }).appendTo($('div.recommendCountryContent'));
              		$('div#mainTitleCountryImage'+index).html("<img src='../country/storage/"+items.CITYIMAGE+"' alt='explore image' style='height: 255px;'/>");
         		}
         		
         	});
         }
	});
	
	

});
</script>