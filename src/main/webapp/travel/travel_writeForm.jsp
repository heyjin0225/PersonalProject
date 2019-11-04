<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="/PersonalProject/travel/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 
<style type="text/css">
.travel_write-menu-footer li{
	list-style: none; 
	display: block;
	float: left;
	position: relative;
	padding: 0px 20px;	
	margin-left: 10%;
	cursor: pointer;
}
.travel_write-menu-footer{
	margin-left: 25%;
}
</style>
</head>
<body>
<h1 align="center" style="font-family: 함초롬바탕; font-weight: bold;">Travel Writing</h1>
<div class="container">
    <form id="travel_writeForm" method="post" enctype="multipart/form-data" action="../travel/travel_write.do" >
       <table class="table table-bordered">
        <tr>
        	<th>아이디</th>
        	<td>
        		<input type="text" id="id" name="userid" value="${memId }" class="form-control">
        	</td>
        </tr>
        <tr>
        	<th>대륙</th>
        	<td>
        		<input type="radio" id="countryid" class="domestic" name="countryid" value="국내">&nbsp;국내&emsp;
        		<input type="radio" id="countryid" class="overseas" name="countryid" value="해외">&nbsp;해외
        		<div id="OverseasDiv">
	       			<select id="countryid2" name="countryid2" class="form-control">
						<option value="">대륙 카테고리 선택</option>
						<option value="대한민국">대한민국</option>
						<option value="아시아">아시아</option>
						<option value="유럽">유럽</option>
						<option value="중동">중동</option>
						<option value="아프리카">아프리카</option>
						<option value="북아메리카">북아메리카</option>
						<option value="남아메리카">남아메리카</option>
						<option value="오세아니아">오세아니아</option>
					</select>
	       		</div>
        	</td>
	        	
        </tr>
        <tr>
        	<th>나라 이미지</th>
        	<td>
				<input type="file" size="45" id="cityimage" name="Cimg" class="form-control">
				<div id="wordDiv"></div>
        	</td>
        </tr>
        <tr>
        	<th>이름</th>
        	<td>
        		<input type="text" title="나라이름을 입력해주세요" placeholder="나라이름" id="cityid" name="cityid" class="form-control">
        		<div id="cityIdDiv"></div>
        		<input type="text" title="도시이름을 입력해주세요" placeholder="도시이름" id="wordname" name="wordname" class="form-control">
        		<div id="wordNameDiv"></div>
        	</td>
        </tr>
        <tr>
            <th>소개글</th>
            <td>
            	<textarea cols="10" title="소개글을 입력하세요. " rows="8" id="citycontent"  name="citycontent" class="form-control"></textarea>
            	<div class="cityContentDiv"></div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="travel_write-menu-footer" >
                 <li class="travel_writeBtn">여행지 등록</li>
                 <li class="reset">다시쓰기</li>
                 <li class="travel_listBtn">여행지 목록</li>
             </div>
            </td>
        </tr>
    </table>
</form>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../travel/js/travel.js"></script>
</body>
</html>