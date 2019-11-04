<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/PersonalProject/managementPage/adminPage/css/adminPage.css">

<div class="myPage" style="height: auto;">
   <div class="myPage_menu">
      <ul class="myPage_menu_ul">
		<li class="myPage_menu_li"><a href="/PersonalProject/managementPage/adminPage.do">나라 관리</a></li>
		<li class="myPage_menu_li"><a href="/PersonalProject/adminPage/memberManagement.do">회원 관리</a></li>
		<li class="myPage_menu_li"><a href="/PersonalProject/adminPage/recommendManagement.do">추천 나라 관리</a></li>
		<li class="myPage_menu_li"><a href="/PersonalProject/adminPage/insertManagement.do">나라 등록</a></li>
      </ul>
   </div>
   <div class="myPage_body">
      <jsp:include page="${myPageBody }" />
   </div>
</div>