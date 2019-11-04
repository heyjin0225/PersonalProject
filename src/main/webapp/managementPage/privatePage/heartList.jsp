<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
#cancel_heart {
	display:inline-block;
	font-size: 20pt;
	margin-left: 5px;
}
#cancel_heart:hover {
	cursor: pointer;
}
#searchResultTable {
	width:55%;
}
#searchResultTableBody td {
	/* width: 7% ;*/
	padding: 10px;
	border: 1px solid #909090;
	border-bottom: 1px solid grey;
	border-left: 1px solid white;
	border-right: 1px solid white;
}

#searchResultTableBody span {
	margin-left: 10px;
}
#GoBtn{
	font-family: Gadugi;
	font-size: 14pt;
	font-style: italic;
}
</style>

<font size="6pt" class="modifyFormTitle" style="color: #363636;">관심 여행지</font><br>
<hr align="left" class="modifyFormTitle" style="color: black;
			  margin-top: 10px;
	    	  margin-bottom: 0px;
	    	  width: 200px;
	    	  border-top: 2px solid #5A5A5A;
	    	  margin-left: 41.5%;"><br><br><br>
<div id="searchResultDiv" style="overflow-x:hidden; height: 100%; ">
	<table id="searchResultTable" class="table table-hover">
		<thead></thead>
		<tbody id="searchResultTableBody">
		<tr bgcolor="#484848" style="padding: 5px; border-top: 2px solid #909090; border-bottom: 2px solid #909090; font-weight: bold;">						
			<td style="width: 200px; color: white; text-align:center;">
				이미지
			</td>
			
			<td style="width: 45%; color: white; text-align:center;">
				나라정보
			</td>
			
			<td style="width: 25%; color: white; text-align:center;">
				비고
			</td>
		</tr>
		</tbody>
	</table>
</div>

<script src="http://code.jquery.com/jquery-latest.js"></script>    
<script type="text/javascript">
$().ready(function(){
	var memId = "<%=session.getAttribute("memId") %>";
	if (memId != "null"){
		$.ajax({
			type : 'POST',
			url : '/PersonalProject/privatePage/getHeartList.do',
			dataType: 'json',
			success : function(data){
				if(data.heartListSize === 0) {
					$('#searchResultTable').after($('<div/>',{
						align : "center",
						text : "관심 가는 나라가 없습니다.",
						style : "height: 30px; font-size: 18pt; margin-top: 65px;"
					}));
				} else {
					$.each(data.heartList, function(index, items){
						if(items.CITYID == null){
							$('<tr/>',{
								
							}).append($('<td/>',{
								
								}).append($('<img/>',{
									width : '200',
									height: '150',
									src : '/PersonalProject/travel/storage/'+items.CITYIMAGE
								}))
							).append($('<td/>',{
								style :'text-align: center; font-size: 13pt;',
								html : items.COUNTRYID+" > "+items.COUNTRYID2+"<br><strong>"+items.WORDNAME+"</strong>"
							})).append($('<td/>',{
								}).append($('<div/>',{
									text : 'GO',
									id : 'GoBtn',
									onclick : 'go_btn("'+items.WORDNAME+'");',
									style : 'cursor: pointer;'
									}).append($('<span/>',{
										text : '자세히',
										style : 'font-style: normal;'
									}))
								).append($('<div/>',{
									text: '×',
									id : "cancel_heart",
									onclick : "cancel_heart('"+items.SEQ+"');",
									style : 'cursor: pointer;'
									}).append($('<span/>',{
										text : '취소',
										style : 'font-size: 21px; margin-left: 20px;'
									}))
								)
							).appendTo($('#searchResultTableBody'));
						}else{
							$('<tr/>',{
								
							}).append($('<td/>',{
								
								}).append($('<img/>',{
									width : '200',
									height: '150',
									src : '/PersonalProject/travel/storage/'+items.CITYIMAGE
								}))
							).append($('<td/>',{
								style :'text-align: center; font-size: 13pt;',
								html : items.COUNTRYID+" > "+items.COUNTRYID2+" > "+items.CITYID+"<br><strong>"+items.WORDNAME+"</strong>"
							})).append($('<td/>',{
								}).append($('<div/>',{
									text : 'GO',
									id : 'GoBtn',
									onclick : 'go_btn("'+items.WORDNAME+'");',
									style : 'cursor: pointer;'
									}).append($('<span/>',{
										text : '자세히',
										style : 'font-style: normal;'
									}))
								).append($('<div/>',{
									text: '×',
									id : "cancel_heart",
									onclick : "cancel_heart('"+items.SEQ+"');",
									style : 'cursor: pointer;'
									}).append($('<span/>',{
										text : '취소',
										style : 'font-size: 21px; margin-left: 20px;'
									}))
								)
							).appendTo($('#searchResultTableBody'));
						}
						
					});
				}
			}
		});
	}else{
		location.href="/PersonalProject/main/index.do";
	}
});

function cancel_heart(seq) {
	var memId = "<%=session.getAttribute("memId") %>";
	$.ajax({
		type : 'POST',
		url : '/PersonalProject/travel/deleteHeart.do',
		data : {'memId' : memId, 'seq' : seq},			
		dataType : 'json',
		success : function(data) {
			alert("좋아요 취소");
		}
	});
	location.reload();
}

function go_btn(wordname){
	$.ajax({
		type : 'POST',
		url : '/PersonalProject/privatePage/checkCountryList.do',
		data : {'wordname':wordname},
		dataType : 'json',
		success : function(data){
			if (data.checkCountrySize == 0){
				alert("현재 선택하신 나라가 올라와 있지 않습니다.");
			}else{
				location.href="/PersonalProject/country/country_detail.do?wordname="+encodeURI(wordname);
			}
		}
	});
}
</script>



