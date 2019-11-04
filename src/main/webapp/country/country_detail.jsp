<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../country/css/swiper.min.css">    
<style>
.swiper-container{
	width: 100%;
	height: 400px;
}
.countryImg{
	width: 100%;
	height: 400px;
} 
/*  */
button.disable {
	cursor: not-allowed;
	background-color: gray;
}
div.tab-div {
	padding-bottom: 70px;
	outline: none;
}
li.tab {
	padding-bottom: 30px;
}
div.tab-div :focus {
	outline: none;
}
h1, h2, h3, h4, h5, h6 {
	font-family: 'Source Sans Pro';
	font-weight: 700;
}
.fancyTab {
	text-align: center;
	vertical-align: middle;
	padding: 15px 0;
	background-color: #eee;
	box-shadow: 0 0 0 1px #ddd;
	height: 70px;
	top: 15px;
	transition: top .2s;
}
.fancyTab.active {
	height: 70px;
	transition: height .2s;
	font-weight: bold;
}
.whiteBlock {
	display: none;
}
.fancyTab.active .whiteBlock {
	display: block;
	bottom: -2px;
	background-color: #fff;
	width: 99%;
	position: absolute;
	z-index: 1;
}
.fancyTab a {
	font-family: 'Source Sans Pro';
	font-size: 1.65em;
	font-weight: 300;
	transition: .2s;
	color: #333;
}
/*.fancyTab .hidden-xs {
		  white-space:nowrap;
		}*/
.fancyTabs {
	border-bottom: 2px solid #ddd;
	margin: 15px 0 0;
}
li.fancyTab a {
	padding-top: 15px;
	top: -15px;
	padding-bottom: 0;
}
li.fancyTab.active a {
	/* 		  padding-top: inherit; */
	
}
.fancyTab .fa {
	font-size: 40px;
	width: 100%;
	padding: 15px 0 5px;
	color: #666;
}
.fancyTab.active .fa {
	color: #cfb87c;
}
.fancyTab a:focus {
	outline: none;
}
.fancyTabContent {
	border-color: transparent;
	box-shadow: 0 -2px 0 -1px #fff, 0 0 0 1px #ddd;
	padding: 30px 15px 15px;
	position: relative;
	background-color: #fff;
	text-align: center;
}
.nav-tabs>li.fancyTab.active>a, .nav-tabs>li.fancyTab.active>a:focus,
	.nav-tabs>li.fancyTab.active>a:hover {
	border-width: 0;
}
.nav-tabs>li.fancyTab:hover {
	background-color: #f9f9f9;
	box-shadow: 0 0 0 1px #ddd;
}
.nav-tabs>li.fancyTab.active:hover {
	background-color: #fff;
	box-shadow: 1px 1px 0 1px #fff, 0 0px 0 1px #ddd, -1px 1px 0 0px #ddd
		inset;
}
.nav-tabs>li.fancyTab:hover a {
	border-color: transparent;
}
.nav.nav-tabs .fancyTab a[data-toggle="tab"] {
	background-color: transparent;
	border-bottom: 0;
}
.nav-tabs>li.fancyTab:hover a {
	border-right: 1px solid transparent;
}
.nav-tabs>li.fancyTab>a {
	margin-right: 0;
	border-top: 0;
	padding-bottom: 30px;
	margin-bottom: -30px;
}
.nav-tabs>li.fancyTab {
	margin-right: 0;
	margin-bottom: 0;
}
.nav-tabs>li.fancyTab:last-child a {
	border-right: 1px solid transparent;
}
.nav-tabs>li.fancyTab.active:last-child {
	border-right: 0px solid #ddd;
	box-shadow: 0px 2px 0 0px #fff, 0px 0px 0 1px #ddd;
}
.fancyTab:last-child {
	box-shadow: 0 0 0 1px #ddd;
}
.tabs .nav-tabs li.fancyTab.active a {
	box-shadow: none;
	top: 0;
}
.fancyTab.active {
	background: #fff;
	box-shadow: 1px 1px 0 1px #fff, 0 0px 0 1px #ddd, -1px 1px 0 0px #ddd
		inset;
	padding-bottom: 30px;
}
.arrow-down {
	display: none;
	width: 0;
	height: 0;
	border-left: 20px solid transparent;
	border-right: 20px solid transparent;
	border-top: 22px solid #ddd;
	position: absolute;
	top: -1px;
	left: calc(10% - 20px);
}
.arrow-down-inner {
	width: 0;
	height: 0;
	border-left: 18px solid transparent;
	border-right: 18px solid transparent;
	border-top: 12px solid #fff;
	position: absolute;
	top: -22px;
	left: -18px;
}
.fancyTab.active .arrow-down {
	display: block;
}
@media ( max-width : 1200px) {
	.fancyTab .fa {
		font-size: 36px;
	}
	.fancyTab .hidden-xs {
		font-size: 22px;
	}
}
@media ( max-width : 992px) {
	.fancyTab .fa {
		font-size: 33px;
	}
	.fancyTab .hidden-xs {
		font-size: 13px;
		font-weight: normal;
	}
}
@media ( max-width : 768px) {
	.fancyTab>a {
		font-size: 18px;
	}
	.nav>li.fancyTab>a {
		padding: 15px 0;
		margin-bottom: inherit;
	}
	.fancyTab .fa {
		font-size: 30px;
	}
	.nav-tabs>li.fancyTab>a {
		border-right: 1px solid transparent;
		padding-bottom: 0;
	}
	.fancyTab.active .fa {
		color: #333;
	}
}
td.serviceCheck {
	opacity: 0.4;
	cursor: pointer;
}
td.check {
	opacity: 1;
	cursor: pointer;
}
/* tab 메뉴 */
.z-tabs {
	margin: 10px;
	display: inline-block;
	border-bottom: 1px solid #ddd;
	width: 80%;
	padding: 0;
}
.z-tabs>li {
	display: inline;
	float: left;
	margin-bottom: 8px;
	width: 25%;
}
.z-tabs>li>a {
	text-decoration: none;
	padding: .5em 1em;
	border-radius: 4px 4px 0 0;
	background: #fff;
	color: #37b;
	font-size: 20pt;
}
.z-tabs>li>a:hover {
	background: #ddd;
}
.z-tabs>li.active>a {
	border: 1px solid #ddd;
	border-bottom-color: transparent;
	cursor: default;
	color: #000;
}
.z-tabs>li.active>a:hover {
	background: #fff;
}
/*  z-tab 위에 메뉴 css--> 	*/
.reserve-haircut {
	cursor: pointer;
}
.reserve-hairperm {
	cursor: pointer;
}
.reserve-hairdye {
	cursor: pointer;
}
.reserve-hairstyling {
	cursor: pointer;
}
.reserve-hairclinic {
	cursor: pointer;
}
button.timeOptionBtn {
	border-radius: 3em;
	margin: 5px 8px;
}
.reserveTable {
    max-width: 96%;
	vertical-align: middle;
	margin: 0.4%;
}
.reserveTable tr{
	border-top: 1px solid; 
	border-bottom: 1px solid; 
	border-color: #ddd;
}
/* 	서비스 리스트    */
.serviceChoice {
	margin-left: 20px;
	margin-right: 20px;
	width: 100%;
	text-align: left;
}
.tl_default {
	cursor: pointer;
	padding: 10px;
	border: 1px solid #ddd;
	position: relative;
	float: left;
	margin: 0.28%;
	margin-bottom: 19px;
	width: 18.8%;
	display: list-item;
	text-align: -webkit-match-parent;
}
.td_t {
	display: inline-block;
	overflow: hidden;
	max-height: 36px;
	color: #222;
	vertical-align: top;
	letter-spacing: -.5px;
	font-weight: 700;
	font-size: 18px;
	line-height: 18px;
	zoom: 1;
	display: inline;
	text-align: left;
}
.td_t {
	text-align: right;
}
.td_ow {
	display: block;
	text-align: right;
	overflow: hidden;
	padding-top: 4px;
	text-overflow: ellipsis;
	white-space: nowrap;
	color: #ee0006;
}
.td_o {
	color: #888;
	text-align: right;
	display: block;
	text-align: right;
	overflow: hidden;
	padding-top: 4px;
	text-overflow: ellipsis;
	white-space: nowrap;
}
li.chosen {
	background-color: #ebebeb;
}
img.designerImages {
	width: 100%;
	border-radius: 10em;
	margin: 10px;
}
button.selectedBtn {
	background-color: lime;
}   
</style>
<link href="/PersonalProject/country/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link href="/PersonalProject/country/css/style.css" rel="stylesheet"
	media="screen">
<link href="/PersonalProject/country/color/default.css"
	rel="stylesheet" media="screen">
<section id="detail" class="countryDetail">
	<!-- Loading Screen -->
	<div data-u="loading" class="jssorl-009-spin"
		style="position: absolute; top: 43px; left: 0px; width: 100%; height: 400px; text-align: center; background-color: rgba(0, 0, 0, 0.7);">
		<img
			style="margin-top: -19px; position: relative; top: 50%; width: 38px; height: 38px;"
			src="/PersonalProject/main/assets/img/spin.svg" />
	</div>
	<!-- swiper -->
	<div class="swiper-container" style="margin-top: -6px;">
		<div class="swiper-wrapper"></div>
		<!-- 네비게이션 버튼 지정 -->
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
		<!-- 페이징 -->
		<div class="swiper-pagination"></div>
	</div>
	<!-- 나라 - 정보 -->
	<div class="container tab-div">
		<section id="fancyTabWidget" class="tabs t-tabs">
			<ul class="nav nav-tabs fancyTabs" role="tablist">
				
			<li class="tab fancyTab active" id="li-tab0">
				<div class="arrow-down">
					<div class="arrow-down-inner"></div>
				</div><a id="tab0" href="#tabBody0" role="tab" aria-controls="tabBody0"
				aria-selected="true" data-toggle="tab" tabindex="0"> <span>기본 정보</span>
			</a>
				<div class="whiteBlock"></div>
			</li>

			<li class="tab fancyTab" id="li-tab1">
				<div class="arrow-down">
					<div class="arrow-down-inner"></div>
				</div> <a id="tab1" href="#tabBody1" role="tab" aria-controls="tabBody1"
				aria-selected="true" data-toggle="tab" tabindex="0"> <span>도시 정보</span>
			</a>
				<div class="whiteBlock"></div>
			</li>
			<li class="tab fancyTab" id="li-tab2">
				 <div class="arrow-down">
					<div class="arrow-down-inner"></div>
				</div><a id="tab2" href="#tabBody2" role="tab" aria-controls="tabBody2"
				aria-selected="true" data-toggle="tab" tabindex="0"> <span>여행 정보</span>
			</a>
				<div class="whiteBlock"></div>
			</li>
		
			</ul>
			
			<div id="myTabContent" class="tab-content fancyTabContent"
			aria-live="polite">
				<div class="tab-pane fade active in" id="tabBody0" role="tabpanel"
					aria-labelledby="tab0" aria-hidden="false" tabindex="0">
					<section id="spacer1" class="home-section spacer">
					
						<!-- 소개글 내 이미지 -->
						<div class="container" id="homeBackgroundImg">
							<div class="row">
								<div class="col-md-12">
									<div class="color-light">
										<h1 class="wow bounceInDown" style="width: 95%;">
											<span id="countryName_span" style="display: inline-block; font-size: 18px; margin-bottom: 10px;"></span><br>
											<span id="countryName2_span" style="font-size: 40px;"></span>
										</h1>
										<div class="inner-Box">
											<!-- 나라 이름 -->
											<h2 class="inner-head">
												<span class="inner-information">INFORMATION</span>
											</h2>
											<dl class="inner-discription">
												<dt>위치</dt>
												<dd>
													<h2 class="wow bounceInDown">
														<span id="countryAddr"></span>
													</h2>
													<!-- 나라 주소 -->
												</dd>
											
												<dt>날씨</dt>
												<dd>
													<h2 class="wow bounceInDown">
														<span id="countryClimate" style="cursor:pointer;"></span>
													</h2>
													<!-- 나라 날씨 -->
												</dd>
												
												<dt>비자</dt>
												<dd>
													<h2 class="wow bounceInUp">
														<span id="countryVisa"></span>
													</h2>
													<!-- 나라 비자 -->
												</dd>
											</dl>
										</div><!-- .inner-Box -->
									</div>
								</div>
							</div>
						</div>
					</section>
				</div><!-- 기본 정보 -->
				<div class="tab-pane  fade" id="tabBody1" role="tabpanel"
					aria-labelledby="tab1" aria-hidden="true" tabindex="0">
					<div class="row">
						<div class="col-md-offset-2 col-md-8">
							<div class="section-heading">
								<h2 class="countryName"></h2>
								<div class="inner-Box">
									<span id="countryName_span2"></span>
								</div>
							</div>
						</div>
					</div>
				</div><!-- 도시 정보 -->
				<div class="tab-pane  fade" id="tabBody2" role="tabpanel"
					aria-labelledby="tab2" aria-hidden="true" tabindex="0">
					<div class="row">
						<div class="col-md-offset-2 col-md-8">
							<div class="section-heading">
								<h2 class="countryName"></h2>
								<div class="inner-Box">
									<span id="travelInfo"></span>
								</div>
							</div>
						</div>
					</div>
				</div><!-- 여행 정보 -->
			</div>
		</section>
	</div>
</section>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- <script type="text/javascript" src="../country/js/country_detail.js"></script> -->
<!-- <script src="/PersonalProject/main/assets/js/slider.js"></script> -->
<!-- swiper js -->
<script src="../country/js/swiper.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	/* slide_start */
	//jssor_1_slider_init();
	var wordname = '${wordname}';
	 $.ajax({
         type : 'POST',
         url : '/PersonalProject/country/getWordnameInfo.do',
         data : {'wordname' : wordname},
         dataType: 'json',
         success : function(data){
        	 $('.swiper-wrapper').html("<div class='swiper-slide' style='margin-right: 15px;'><img class='countryImg' src='/PersonalProject/country/storage/"+data.map.CITYIMAGE1+"'  ></div>"
						+"<div class='swiper-slide' style='margin-right: 15px;'><img class='countryImg' src='/PersonalProject/country/storage/"+data.map.CITYIMAGE2+"' ></div>"
						+"<div class='swiper-slide' style='margin-right: 15px;'><img class='countryImg' src='/PersonalProject/country/storage/"+data.map.CITYIMAGE3+"' ></div>"
						+"<div class='swiper-slide' style='margin-right: 15px;'><img class='countryImg' src='/PersonalProject/country/storage/"+data.map.CITYIMAGE4+"' ></div>"
						+"<div class='swiper-slide' style='margin-right: 15px;'><img class='countryImg' src='/PersonalProject/country/storage/"+data.map.CITYIMAGE5+"' ></div>");
			
  			init();
  			if(data.map.CITYID == null){
  				$('#countryName_span').html(data.map.COUNTRYID+" > "+data.map.COUNTRYID2);
  	  			$('#countryName2_span').text(data.map.WORDNAME);
  	  			$('#countryAddr').text(data.map.CITYADDR);
  	  			$('#countryClimate').html("<a onclick='climateInfo()'>"+data.map.CLIMATE+"</a>");
  	  			$('#countryVisa').text(data.map.VISA);
  	  			$('.countryName').text(data.map.WORDNAME);
  	  			$('#countryName_span2').text(data.map.CITYINFO);
  	  			$('#travelInfo').text(data.map.TRAVELINFO);
  			}else{
  				$('#countryName_span').html(data.map.COUNTRYID+" > "+data.map.COUNTRYID2+" > "+data.map.CITYID);
  	  			$('#countryName2_span').text(data.map.WORDNAME);
  	  			$('#countryAddr').text(data.map.CITYADDR);
  	  			$('#countryClimate').html("<a onclick='climateInfo()'>"+data.map.CLIMATE+"</a>");
  	  			$('#countryVisa').text(data.map.VISA);
  	  			$('.countryName').text(data.map.WORDNAME);
  	  			$('#countryName_span2').text(data.map.CITYINFO);
  	  			$('#travelInfo').text(data.map.TRAVELINFO);
  			}
  			
         },
         error : function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
     });
   
     $('#li-tab0').on('click',function(){
    	 var para = document.location.href.split("#tabBody");
    	 $('.tab').removeClass('active');
    	 $('#li-tab'+para[1]).addClass('active');
    	 $('.fade').removeClass('active in');
    	 $('#tabBody'+para[1]).addClass('active in');
     });
     $('#li-tab1').on('click',function(){
    	 var para = document.location.href.split("#tabBody");
    	 $('.tab').removeClass('active');
    	 $('#li-tab'+para[1]).addClass('active');
    	 $('.fade').removeClass('active in');
    	 $('#tabBody'+para[1]).addClass('active in');
     });
     $('#li-tab2').on('click',function(){
    	 var para = document.location.href.split("#tabBody");
    	 $('.tab').removeClass('active');
    	 $('#li-tab'+para[1]).addClass('active');
    	 $('.fade').removeClass('active in');
    	 $('#tabBody'+para[1]).addClass('active in');
     });
});
function climateInfo(){
	location.href="https://weather.naver.com/";
}
var coverflowSetting = {
		  slideShadow : true,
		  rotate : 50,
		  stretch : 0, // 슬라이더간 거리(픽셀) : 클수록 슬라이더가 서로 많이 겹침
		  depth : 100, // 깊이 효과값 : 클수록 멀리있는 느낌이 강해짐
	      modifier : 1,
}
var swiper = null;
function init(){
	if(swiper != null) swiper.destroy();
	swiper = new Swiper('.swiper-container', {
	    spaceBetween: 30,
	    centeredSlides: true,
	    autoplay: {
	      delay: 2500,
	      disableOnInteraction: false,
	    },
	    pagination: {
	      el: '.swiper-pagination',
	      clickable: true,
	    },
	    navigation: {
	      nextEl: '.swiper-button-next',
	      prevEl: '.swiper-button-prev',
	    },
	  });
}
</script>