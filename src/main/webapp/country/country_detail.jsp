<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../country/css/swiper.min.css">    
<link rel="stylesheet" href="../country/css/country_detail.css">
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