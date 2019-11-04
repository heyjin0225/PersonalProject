<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
table {
	border: 2px solid #EDEDED;
	padding: 5px;
}
table td {
	text-align: center;
	height: 40px;
	width: 890px;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bold;
}

table tbody {
	text-align: center;
	color : black;
	padding: 5px;
	border: 1px solid black;
	border-spacing: 1;
	overflow: scroll;
}
table th {
	height: 60px;
	width: 200px;
	text-align: center;
}
#OverseasDiv{
	margin-top :10px;
}

#countryid2{
	height: 30px;
	width: 50%;
	border: 1px solid #F3F3F3;
}
#cityimage1{
	width: 50%;
	height: 25px;
	border: 1px solid #F3F3F3;
	margin-top: 10px;
}
.bannerAddDiv{
	background: gray;
	border-radius: 5em;
	width: 40px;
	height: 40px;
	text-align: center;
	cursor:pointer;
	
	margin-top: 5px;
}
#cityid{
	width:50%;
	height: 25px;
	margin-top: 10px;
	margin-bottom: 5px;
	border: 1px solid #F3F3F3;
}
#wordname{
	width:50%;
	height: 25px;
	border: 1px solid #F3F3F3;
}
#cityaddr{
	width:50%;
	height: 25px;
	border: 1px solid #F3F3F3;
}
#latitud{
	width:50%;
	height: 25px;
	margin-bottom: 5px;
	border: 1px solid #F3F3F3;
}
#longitude{
	width:50%;
	height: 25px;
	border: 1px solid #F3F3F3;
}
#cityinfo{
	margin-top :10px;
	width:50%;
	border: 1px solid #F3F3F3;
}
#travelinfo{
	margin-top :10px;
	width:50%;
	border: 1px solid #F3F3F3;
}
#climate{
	margin-top :10px;
	width:50%;
	border: 1px solid #F3F3F3;
}
#visa{
	width:50%;
	height: 25px;
	border: 1px solid #F3F3F3;
}
</style>

<form name="insertRegisterForm" method="post" enctype="multipart/form-data" action="../adminPage/countryInsert.do">
<font size="6pt" style="color: #363636;">나라  등록하기</font><br><hr align="left" style="color: black;
				  margin-top: 10px;
		    	  margin-bottom: 0px;
		    	  width: 205px;
		    	  border-top: 2px solid #5A5A5A;"><br>
<table  class="table table-striped" >
	<tr>
		<th>나라</th>
		<td>
			<input type="radio" id="countryid" class="domestic" name="countryid" value="국내">&nbsp;국내&emsp;
			<input type="radio" id="countryid" class="overseas" name="countryid" value="해외">&nbsp;해외
			<div id="OverseasDiv">
				<select id="countryid2" name="countryid2" >
					<option value="">나라 카테고리 선택</option>
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
			<input type="file" name="imageUpload[]" id="imageUpload" multiple="multiple" style="width:440px;"/>
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>
    		<input type="text" title="나라이름을 입력해주세요" placeholder="나라이름" id="cityid" name="cityid" >
    		<div id="cityIdDiv"></div>
    		<input type="text" title="도시이름을 입력해주세요" placeholder="도시이름" id="wordname" name="wordname" >
    		<div id="wordNameDiv"></div>
    	</td>
    </tr>
    <tr>
		<th>위치</th>
		<td>
    		<input type="text" title="위치를 입력해주세요" placeholder="위치" id="cityaddr" name="cityaddr" >
    		<div id="cityAddrDiv"></div>
    	</td>
    </tr>
    <tr>
		<th>위도 / 경도</th>
		<td>
    		<input type="text" title="위도를 입력해주세요" placeholder="위도" id="latitud" name="latitud" >
    		<div id="latitudDiv"></div>
    		<input type="text" title="경도를 입력해주세요" placeholder="경도" id="longitude" name="longitude" >
    		<div id="longitudeDiv"></div>
    	</td>
    </tr>
    <tr>
        <th>도시정보</th>
        <td>
        	<textarea cols="10" title="도시정보를 입력하세요. " rows="8" id="cityinfo"  name="cityinfo" placeholder="도시정보"></textarea>
        	<div class="cityInfoDiv"></div>
        </td>
    </tr>
    <tr>
        <th>여행정보</th>
        <td>
        	<textarea cols="10" title="여행정보를 입력하세요. " rows="8" id="travelinfo"  name="travelinfo" placeholder="여행정보"></textarea>
        	<div class="travelInfoDiv"></div>
        </td>
    </tr>
    <tr>
        <th>기후</th>
        <td>
        	<textarea cols="10" title="기후를 입력하세요. " rows="8" id="climate"  name="climate" placeholder="기후"></textarea>
        	<div class="climateDiv"></div>
        </td>
    </tr>
   <tr>
		<th>비자</th>
		<td>
    		<input type="text" title="비자를 입력해주세요" placeholder="비자" id="visa" name="visa" >
    		<div id="visaDiv"></div>
    	</td>
    </tr> 

	<tr>
		<td id="btnId" colspan="2" style="text-align:right;">
			<input type="submit" class="btn btn-default" id="countryResisterBtn" value="나라 등록">
		</td>
	</tr>
</table>
</form>
<br/>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>




