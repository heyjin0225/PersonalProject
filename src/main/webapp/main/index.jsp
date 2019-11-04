<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimum-scale=1" name="viewport">
<meta name="viewport" content="width=device-width, initial-scale=1"><!-- 스마트폰 연결 @media -->
<title>WORLD TRIP</title>
<!-- For project_img png / title 이미지 -->
<link rel="shortcut icon" type="image/icon"	href="/PersonalProject/main/assets/logo/project_img.png" />

<!--  date picker css-->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
  
<!--style2.css-->
<link rel="stylesheet" href="/PersonalProject/main/assets/css/style2.css">

<!--font-awesome.min.css-->
<!-- <link rel="stylesheet" href="/PersonalProject/main/assets/css/font-awesome.min.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- modal css -->
<link rel="stylesheet" href="/PersonalProject/member/css/modal.css">


<style type="text/css">
*{
	box-sizing: border-box;
}
/* 상단고정+ 드롭다운 */
body{
	margin: 0;
	line-height: 1.6em;
}
.header_menu_bar {
  background: white;
  display: inline-block;
  width: 100%;
  border-bottom: 1px solid #c2c2c2;
  line-height: 1.6em;

}
.header_menu {
	margin: 0;
	padding: 0; 
}
.header_menu li {
  float: left;
  list-style:none;
  position: relative;
}
.header_menu li:hover {
	background: hotpink; 
}
.header_menu li:hover>a {
	color: white; 
	text-decoration: none;
}
.header_menu a {
  color: hotpink;
  display: block;
  padding: 10px 20px;
  text-decoration: none;
  font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
  font-size: 14px;
}
.header_menu ul {
  background: #eee;
  border: 1px solid silver;
  display: none;
  padding: 0;
  position: absolute;
  left: 0;
  top: 100%;
  width: 160px;
  z-index: 2;
}
.header_menu ul li {
	float: none;
	width: 100%;
}
.header_menu ul li:hover { 
	background: white; width: 100%;
}
.header_menu ul li:hover a {
	color: black; 
}
.header_menu ul a {
	color: black; 
}
.header_menu ul ul {
	left: 100%; top: 0;
}
.header_menu ul ul li {
	float:left; margin-right:10px;
}

/* 스마트폰 연결 */
/*↓ 요건 나  */
@media only screen and (max-width:500px){
	
	.header_menu a{
		padding : 5px 10px;
	}
	
	#loginId{
		width : 150px;
	}
	#loginPwd{
		margin-left: 0px;
		width: 150px;
	}
}
/*↓ 요건 다른 사람*/
@media only screen and (max-width:400px){
	
	.header_menu a{
		padding : 5px 8px;
	}
	
	#loginId{
		width : 130px;
	}
	#loginPwd{
		margin-left: 0px;
		width: 130px;
	}
}
</style>
</head>
<body>
	<header>
		<div class='header_menu_bar'>
		  <ul class="header_menu">
		  	<li><a href="/PersonalProject/main/index.do" onfocus=this.blur()>홈</a></li>
		    <li><a href="#" onclick="return false;" onfocus=this.blur()>여행지</a>
		    	<ul>
		    		<li><a href="/PersonalProject/travel/domestic.do">국내(대한민국)</a></li>
		    		<li><a href="/PersonalProject/travel/overseas.do">해외</a></li>
		    	</ul>
		    </li>
		    <li><a href="#" onfocus=this.blur()>나라</a>
		      <ul>
		        <li><a href="/PersonalProject/country/Korea.do">대한민국</a></li>
		        <li><a href="#" onclick="return false;">해외</a>
		          <ul>
		            <li><a href="/PersonalProject/country/Asia.do">아시아</a></li>
		            <li><a href="/PersonalProject/country/Europe.do">유럽</a></li>
		            <li><a href="/PersonalProject/country/MiddleEast.do">중동</a></li>
		            <li><a href="/PersonalProject/country/Africa.do">아프리카</a></li>
		            <li><a href="/PersonalProject/country/NorthAmerica.do">북아메리카</a></li>
		            <li><a href="/PersonalProject/country/SouthAmerica.do">남아메리카</a></li>
		            <li><a href="/PersonalProject/country/Oceania.do">오세아니아</a></li>
		          </ul>
		        </li>
		      </ul>
		    </li>
		    <li><a href="/PersonalProject/info/infomation.do" onfocus=this.blur()>정보 마당</a></li> 
		    <li style="float: right;">
				<input type="hidden" id="memId" value="${memId }" />
				<input type="hidden" id="typeVal" value="${memType }" />
				
				<c:if test="${memId==null }">
					<li style="float: right;">
			    		<a id="registerA" href="#" onfocus=this.blur()>회원가입</a>
			  	  	</li>
					<li style="float: right;">
				    	<a id="loginA" href="#" onfocus=this.blur()>로그인</a>
				    </li>
				</c:if>
				
				
				<c:if test="${memId!=null }">
					<c:if test="${memType==0 }">
						<li style="float: right;">
				    		<a id="logoutBtn" href="#">로그아웃</a>
				  	  	</li>
						<li style="float: right;">
				    		<a id="loggedinA" href="#">${memName } 님</a>
				  	  	</li>
					</c:if>
					<c:if test="${memType==1 }">
						<li style="float: right;">
				    		<a id="logoutBtn" href="#">로그아웃</a>
				  	  	</li>
						<li style="float: right;">
				    		<a id="loggedinA" href="#">관리자</a>
				  	  	</li>
					</c:if>
				</c:if>
			</li>
		  </ul>
		</div>
	</header>
	<section>
		<jsp:include page="${display }" />
	</section>
	<!-- modal창 부분 -->
	<!-- 로그인 -->
	<div id="myModal_login" class="modal_login">
		<div class="modal-content">
			<!-- 로그인 -->
			<div class="card">
				<img class="x_img" src="/PersonalProject/main/assets/img/엑스.png">
				<h1 class="title" style="margin-bottom: 10px;">Login</h1>
				
				<form name="loginForm" id="loginForm" method="post" action="../member/memberLogin.do">
					<div class="input-container">
						<label>Username</label>&emsp;<input type="text" id="loginId" name="loginId" required="required" autocomplete="off" /> 
					</div>
					
					<div class="input-container" align="center">
						<div id="loginIdDiv"></div>
					</div>
					
					<div class="input-container">
						<label>Password</label>&emsp;<input type="password" id="loginPwd" name="loginPwd" required="required" autocomplete="off" /> 
					</div>
					
					<div class="input-container" align="center">
						<div id="loginPwdDiv"></div>
					</div>
					
					<div class="button-container">
						<button type="button" id="loginBtn">
							<span>Go</span>
						</button>
					</div>
					
					<input type="hidden" name="publicKeyModulus" id="hiddenModulus" value="${publicKeyModulus }">
					<input type="hidden" name="publicKeyExponent" id="hiddenExponent" value="${publicKeyExponent }">
					<input type="hidden" name="securedUsername" id="securedUsername">
					<input type="hidden" name="securedPassword" id="securedPassword">
				</form>
				<div style="font-family: Open Sans, sans-serif; font-size: 10pt; ">아이디와 비밀번호가 기억나지 않으세요? <a id="findId_Pwd" href="javascript:void(0)">아이디/비밀번호 찾기</a></div>
			</div>
		</div>
	</div>
	<!-- 회원가입 -->
	<div id="myModal_register" class="modal_register">
		<div class="modal-content">
			<!-- 회원가입 -->
			<div class="card alt">
				
				<img class="x_img" src="/PersonalProject/main/assets/img/엑스.png">
				<h1 class="title">Register</h1>
				
				<form class="signUpForm">
					<div class="input-container">
						<label id="name" >Name</label>&emsp;<input type="text" class="name" required="required" autocomplete="off" /> 
					</div>
					
					<div class="input-container" align="center">
						<div id="nameDiv" style="text-align: left; margin-left: 75px;"></div>
					</div>
					
					<div class="input-container">
						<label id="id" >I D</label>&emsp;<input type="text" class="id" required="required" autocomplete="off" />&emsp;
						<input class="btn btn-primary idCheck" type="button" value="ID Check" style="width:100px; height:22px; color:white; background:#098bf7;"/>
						<input type="hidden" id="idcheck" value="">
					</div>
					
					<div class="input-container" align="center">
						<div id="idDiv" style="text-align: left; margin-left: 75px;"></div>
					</div>
					
					<div class="input-container">
						<label id="password" >Password</label>&emsp;<input type="password" class="pwd" required="required" /> 
					</div>
					
					<div class="input-container" align="center">
						<div id="pwdDiv" style="text-align: left; margin-left: 75px;"></div>
					</div>
					
					<div class="input-container">
						<label id="re_password" >Repeat Password</label>&emsp;<input type="password" id="rePwd" class="rePwd" required="required"/> 
					</div>
					
					<div class="input-container" align="center" style="padding-bottom: 10px;">
						<div id="rePwdDiv" style="text-align: left; margin-left: 80x; margin-top: 10px;"></div>
					</div>
					
					<div class="input-container">
						<label id="email">Email</label>&emsp;<input type="text" class="email" required="required" autocomplete="off" />&emsp;
						<input class="btn btn-primary emailCheck" type="button" value="Email Check" style="width:100px; height:22px; color:white; background:#098bf7;"/>
						<input type="hidden" id="emailcheck" value="">
					</div>
					
					<div class="input-container" align="center">
						<div id="emailDiv" style="text-align: left; margin-left: 75px;"></div>
					</div>
					
					<div class="input-container">
						<label id="zipcode">Zipcode</label>&emsp;<input type="text" name="zipcode" id="isZipcode" class="zipcode" required="required" autocomplete="off" />&emsp;
						<input class="btn btn-primary postSearch" type="button" value="Post Search" style="width:100px; height:22px; color:white; background:#098bf7;"/>
					</div>
					
					<div class="input-container" style="padding-top: 5px;">	
						<label id="address">Address</label>&emsp;<input type="text" name="addr1" id="addr1" class="addr1" required="required" autocomplete="off" />
					</div>	
					
					<div class="input-container" style="padding-top: 5px;">
						<label id="de_address">Detailed Address</label>&emsp;<input type="text" name="addr2" id="addr2" class="addr2" required="required" autocomplete="off" />
					</div>	
					
					<div class="input-container" align="center">
						<div id="addrDiv" style="text-align: left; margin-left: 75px; margin-top: 5px;"></div>
					</div>
					
					<br>
					<div class="button-container" id="writeBtn">
						<button type="button">
							<span>Next</span>
						</button>
					</div>
					<input type="hidden" name="publicKeyModulus" id="hiddenModulus" value="${publicKeyModulus }">
					<input type="hidden" name="publicKeyExponent" id="hiddenExponent" value="${publicKeyExponent }">
					<input type="hidden" name="securedUsername" id="securedUsername">
					<input type="hidden" name="securedPassword" id="securedPassword">
				</form>
			</div> <!-- card alt -->
		</div>
	</div>
	<!-- 아이디/비밀번호 찾기 -->
	<div id="myModal_find" class="findMemeberDiv modal_find">
		<div class="modal-content">
			<div class="findMemberToggle">
				<h1 class="findMemberTitle">
					<div id="findTitle"></div>
					
					<br>
					
					<div class="findIdPwdDiv" style="font-size:12pt">
						<input type="radio" name="find" class="findId" value="0" checked>아이디찾기&emsp;
						<input type="radio" name="find" class="findPwd" value="1" >비밀번호찾기
					</div>
				</h1>
				
				<form class="findIdForm">
					<div class="input-container">
						<label for="findId" class="find" style="font-size:17pt;">Email</label>&emsp;
						<input id="checkEmail" type="text" class="checkInput" required="required" style="width:380px;"/><br>
						
						<div class="bar"></div>
						
					</div>
					<div class="idValid-container" align="center">
							<div class="findIdDivValid" style="height: 40px;"></div>
					</div>
					
					<div class="button-container findBtn" id="findIdBtn">
						<button type="button">
							<span>NEXT</span>
						</button>
					</div>
				</form>
				
				<!-- 비밀번호 찾기 -->
				<form class="findPwdForm">
					<div class="input-container">
						<label for="findPwd" style="font-size:17pt;">ID</label>&emsp;
						<input type="text" id="checkId" class="checkInput" required="required" style="width:380px"/>
						
						<div class="bar"></div>
					</div>
					
					<div class="pwdValid-container" align="center">
						<div class="findPwdDivValid" style="height: 40px;"></div>
					</div>
					
					<div class="button-container findBtn" id="findMemberBtn">
						<button type="button">
							<span>NEXT</span>
						</button>
					</div>
				</form>
			</div><br>
			<div id="loginCancelBtn" class="rerun">
				<a><i class="fa fa-reply" aria-hidden="true"></i></a>
			</div>
		</div>
	</div>
	
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script> -->
<!-- 로그인 -->
<script src="/PersonalProject/main/assets/js/login.js"></script>
<!-- 모달모달모달  -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
<!-- 로그인 Modal -->
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/rsa.js"></script>
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/jsbn.js"></script>
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/prng4.js"></script>
<script type="text/javascript" src="http://www-cs-students.stanford.edu/~tjw/jsbn/rng.js"></script>
<script	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- modal관련 js -->
<script type="text/javascript" src="/PersonalProject/member/js/login.js"></script>
<script type="text/javascript" src="/PersonalProject/member/js/index.js"></script>
<script type="text/javascript" src="/PersonalProject/member/js/modal.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//메뉴바 상단 고정
	$(".header_menu li").hover(function(){
	  $('ul:first',this).show();
	}, function(){
	  $('ul:first',this).hide();
	});
	$(".header_menu>li:has(ul)>a").each( function() {
	  $(this).html( $(this).html()+' &or;' );
	});
	$(".header_menu ul li:has(ul)")
	  .find("a:first")
	  .append("<p style='float:right;margin:-3px'>&#9656;</p>");
	
	
	//lightbox - 로그인
	$('#loginA').on('click',function(){
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
		$('#myModal_login').css({
			'width' : maskWidth,
			'height' : maskHeight
		});
		
		//alert(maskWidth+","+maskHeight);
		rsaLogin();
	});
	$('.x_img').on('click',function(){
		close_pop();
		
	});
	
	//lightbox - 회원가입
	$('#registerA').on('click',function(){
		var maskHeight = 
			$(window).scroll(function () {
				var height = $(document).scrollTop();
			}); 
		var maskWidth = $(window).width();
		$('#myModal_register').css({
			'width' : maskWidth, 
			'height' : maskHeight
		});
		
		//alert(maskWidth+","+maskHeight);
		rsaResigster();
	});
	$('.x_img').on('click',function(){
		close_pop_R();
		$('.id, .name, .pwd, .rePwd, .zipcode, .addr1, .addr2').val("");
		$('#idDiv, #nameDiv, #pwdDiv, #rePwdDiv').empty();
	});
	
	/////////////////////////////////////////////
});//ready(function)
//////////////////////////////////////////////////////////////////로그인
//팝업 Close 기능
function close_pop(flag) {
	$('#myModal_login').hide();
};

function rsaLogin(){
	//애니메이션 효과
	$.ajax({
		type : 'POST',
		url : '/PersonalProject/member/makeRSAKey.do',
		success : function(data) {
			var rsaPublicKey = data.split(',');
			$('#hiddenModulus').val(rsaPublicKey[0]);
			$('#hiddenExponent').val(rsaPublicKey[1]);
			
			if(data != null){
				$(".modal_login").fadeIn(500);
			}
		}
	});
}
///////////////////////////////////////////////////////////////회원가입
//팝업 Close 기능
function close_pop_R(flag) {
	$('#myModal_register').hide();
};

function rsaResigster(){
	//애니메이션 효과
	$.ajax({
		type : 'POST',
		url : '/PersonalProject/member/makeRSAKey.do',
		success : function(data) {
			var rsaPublicKey = data.split(',');
			$('#hiddenModulus').val(rsaPublicKey[0]);
			$('#hiddenExponent').val(rsaPublicKey[1]);
			
			if(data != null){
				$("#myModal_register").fadeIn(500);
			}
		}
	});
}

function loginPop() {
	if (confirm("로그인 후 이용 하실수 있습니다.\n로그인 하시겠습니까?") == true){    //확인
		var maskHeight = 
			$(window).scroll(function () {
				var height = $(document).scrollTop();
			}); 
		var maskWidth = $(window).width();
		//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$('#myModal_login').css({
			'width' : maskWidth,
			'height' : maskHeight
		});
		//애니메이션 효과
		rsaLogin();
	}else{   //취소
	    return;
	}
}
</script>
</body>
</html>






















