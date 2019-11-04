<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<link rel="stylesheet" href="/PersonalProject/managementPage/privatePage/css/memberPage.css">

<div class="myPage">
   <div class="myPage_menu">
      <ul class="myPage_menu_ul">
        <li class="myPage_menu_li"><a href="/PersonalProject/privatePage/modifyForm.do">회원정보수정</a></li>
        <li class="myPage_menu_li"><a href="/PersonalProject/privatePage/heartList.do">관심 여행지</a></li>
        <li class="myPage_menu_li"><a href="/PersonalProject/privatePage/deleteForm.do">회원 탈퇴</a></li>
        <li class="myPage_menu_li"><a href="/PersonalProject/travel/travel_writeForm.do">여행지 등록</a></li>
      </ul>
   </div>
   
    <div class="myPage_body" align="center">
      <jsp:include page="${memberPage}" />
   </div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   $('.myPage_menu_li a').on('click',function(){
      $('.myPage_menu_li a').removeClass('myPage_menu_ul_active');
      $(this).addClass('myPage_menu_ul_active');
   });
});
</script>