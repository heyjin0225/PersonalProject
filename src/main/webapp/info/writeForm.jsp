<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="/PersonalProject/info/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<style type="text/css">
.write-menu-footer li{
	list-style: none; 
	display: block;
	float: left;
	position: relative;
	padding: 0px 20px;	
	margin-left: 10%;
	cursor: pointer;
}
.write-menu-footer{
	margin-left: 25%;
}
</style>
</head>
<body>
<h1 align="center" style="font-family: 함초롬바탕; font-weight: bold;">Writing</h1>
<div class="container">
<table class="table table-bordered">
    <tbody>
        <form id="writeForm" action="/PersonalProject/info/write.do" method="post">
            <tr>
                <th>제목</th>
                <td>
                	<input type="text" title="제목을 입력해주세요. " id="subject" name="subject" class="form-control"/>
                	<div class="subjectDiv"></div>
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                	<textarea cols="10" title="내용을 입력해주세요. " rows="8" id="content"  name="content" class="form-control"></textarea>
                	<div class="contentDiv"></div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="write-menu-footer" >
	                    <li class="write">글등록</li>
	                    <li class="reset">다시쓰기</li>
	                    <li class="list">글목록</li>
	                </div>
                </td>
            </tr>
        </form>
    </tbody>
</table>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../info/js/info.js"></script>
</body>
</html>