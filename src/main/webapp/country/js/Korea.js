$(document).ready(function(){
	//대한민국 리스트
	var dataList;
	var listIndex;
	var i = 0;
	var j;
	var dataListSize;
	$.ajax({
		type: 'POST',
		url: '/PersonalProject/country/KoreaList.do',
		data: {'countryid2': "대한민국"},
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			dataList = data.list;
			dataListSize = dataList.length;
			$('#Korea-list tr:ge(0)').remove();
			$.each(data.list, function(index,items){
				$('<div/>',{
					style : 'width: 380px; float: left;',
					class : 'countryImage',
					onclick : 'moveToWordname("'+items.wordname+'")'
				}).append($('<div/>',{
					style : 'width: 380px;'
				}).append($('<div/>',{
					class : 'imageDiv',
					style : 'width: 350px;'
					}).append($('<img/>',{
						style : 'border: 1px solid black;',
						src : '../country/storage/'+items.cityimage1,
						width : '330',
						height : '230'
					}))
				).append($('<div/>',{
					class : 'countryDiv',
					align : 'center',
					style : 'width: 330px; display: table; height: 45px; ',
					html : '<strong style="font-size: 16pt; display: table-cell; vertical-align: middle; ">'+items.countryid2+' / '+items.wordname+'</strong>'
					})
				)).appendTo($('#Korea-list'));
		
				
				if((index%9) == 8){
					$('<div/>',{
						id : 'nextView',
						class : 'form-control',
						text : '더보기'
					}).appendTo($('.nextviewDiv'));
					listIndex = index;
					return false;
				}
			});//$.each
			i = i+9;
			$('#nextView').on('click',function(){
				$('#nextView').hide();
				for(j = i; j<i+9; j++){
					if(j >= dataListSize) return false;
					$('<div/>',{
						style : 'width: 380px; float: left;',
						class : 'countryImage',
						onclick : 'moveToWordname("'+dataList[j].wordname+'")'
					}).append($('<div/>',{
						style : 'width: 380px;'
					}).append($('<div/>',{
						class : 'imageDiv',
						style : 'width: 350px;'
						}).append($('<img/>',{
							style : 'border: 1px solid black;',
							src : '../country/storage/'+dataList[j].cityimage1,
							width : '330',
							height : '230'
						}))
					).append($('<div/>',{
						class : 'countryDiv',
						align : 'center',
						style : 'width: 330px; display: table; height: 45px; ',
						html : '<strong style="font-size: 16pt; display: table-cell; vertical-align: middle; ">'+dataList[j].countryid2+' / '+dataList[j].wordname+'</strong>'
						})
					)).appendTo($('#Korea-list'));
	
				}
				$('#nextView').show();
			});
			
		},//success
		error: function(data){
			alert("error");
		}
	});
});
function moveToWordname(wordname) {
	location.href="/PersonalProject/country/country_detail.do?wordname="+encodeURI(wordname);
}