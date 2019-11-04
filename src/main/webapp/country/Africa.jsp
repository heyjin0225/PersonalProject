<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="/PersonalProject/country/css/country.css">
 
<section id="display">	
	<section id="Africa">
		<div class="container">
			<div class="section-header" style="text-align: center;">
				<h2 style="font-size: 20pt;">아프리카</h2>
			</div>
			<div id="serachOptionList" align="right" style="width: 71.2%; margin-bottom: 9px; margin-left: 14%;">
				<select id="searchOption" class="searchOption-control">
					<option value="cityid">나라</option>
					<option value="wordname">도시</option>
				</select>
			<input type="text" id="keyword" class="keyword-control">
			<input type="button" id="search" value="검색" class="search-control">
			</div>
		</div>
	</section>
</section>
<div id="Africa-list" align="center" style ="margin: 0 auto; width : 80%;"></div>
<div class="nextviewDiv" align="center" style="width: 72%; margin-left: 11.5%; float: left"></div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../country/js/Africa.js"></script>