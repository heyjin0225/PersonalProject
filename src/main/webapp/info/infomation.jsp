<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link rel="stylesheet" href="../css/info.css">
<style type="text/css">
body{
	margin: 0;
}
#information_Board{
	font-size: 25pt;
	margin-left: -6%;
	padding: 15px;
}
.board-menu-bar {
  background: white;
  display: inline-block;
  width: 51.5%;
  border-bottom: 1px solid black;
  margin-left: 23%;
}
.board-menu {
	margin: 0;
	padding: 0; 
}
.board-menu li {
  float: left;
  list-style:none;
  /* position: relative; */
  color: black;
  display: block;
  padding: 10px 20px;
  text-decoration: none;
  margin-left: 10%;
}
.board-menu ul {
  background: #eee;
  border: 1px solid silver;
  display: none;
  padding: 0;
  position: absolute;
  left: 0;
  top: 100%;
  width: 160px;
}
.board-menu ul li {
	float: none;
}
.board-menu-footer {
	list-style: none; 
	width: 50%;
	text-align: right; 
	margin-left: 25%;
	cursor: pointer;
	
}

</style>
</head>
<body>
<h1 align="center" id="information_Board">Information board</h1>
<input type="hidden" id="pg" value="${pg}" />
<div class="board-menu-bar">
	<ul class="board-menu">
		<li class="board_seq" >글번호</li>
		<li class="board_subject" style="margin-left:9%;">제목</li>
		<li class="board_name" style="margin-left:11%;">작성자</li>
		<li class="board_logtime" style="margin-left:11.5%;">작성일</li>
	</ul>
</div>
<div id="board-list"></div>
<div id="board-paging" style="width: 45%; text-align: center; margin-left: 26%; float : left; padding: 5px;"></div>
<div class="board-menu-footer">
<c:if test="${memId != null }">
	<li class="writeForm">글쓰기</li>
</c:if>
</div>
<br>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function boardSearch(pg){
	$('#pg').val(pg);//내가 onclick한 pg값으로 변경
	$('#search').trigger('click','trigger');//다른 이벤트 호출(trigger)
}
</script>
<script type="text/javascript" src="../info/js/info.js"></script>
</body>
