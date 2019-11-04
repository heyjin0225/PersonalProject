$(document).ready(function(){
	//해외 여행지(대륙) 선택
	 var continentSrc= "";

	 $('.continent').on("click",function(){

		var continentSrc= $(this).attr('value');
			
		var dataList;
		var listIndex;
		var i = 0;
		var j;
		var dataListSize;
		
		$.ajax({
			type : 'POST',
			url : '/PersonalProject/travel/continentList.do',
			data : {'countryid2': continentSrc},
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				dataList = data.list;
				dataListSize = dataList.length;
				if(dataListSize == 0){
					$('#overseas-list').remove();
					alert(continentSrc+" 카테고리에 소속된 나라가 없습니다.");
					location.href="/PersonalProject/travel/overseas.do";
				}else{
				
					$('#overseas-list tr:gt(0)').remove();
					$('#overseas-list tr:eq(0)').remove();
					$('#nextViewBtn').remove();
					$.each(data.list, function(index,items){
						$('<tr/>',{
							class : items.seq,
						}).append($('<td/>',{
							style : 'width: 360px;'
						}).append($('<div/>',{
							class : 'imageDiv',
							style : 'width: 350px;'
							}).append($('<img/>',{
								style : 'border: 1px solid black;',
								src : '../travel/storage/'+items.cityimage,
								width : '350',
								height : '250'
							}))
						)).append($('<td/>').append($('<div/>',{
							style : 'width: 250px; overflow: hidden; font-size: 14pt;'
							}).append($('<span/>',{
								text : '대륙 카테고리> '
							})).append($('<strong/>',{
								html : items.countryid+" / "+items.countryid2+'<br>'
							})).append($('<span/>',{
								text : '나라> '
							})).append($('<strong/>',{
								html : items.cityid+'<br>'
							})).append($('<span/>',{
								text : '도시> '
							})).append($('<strong/>',{
								html : items.wordname+'<br>'
							})).append($('<span/>',{
								text : '소개글> '
							}))).append($('<div/>',{
								height : '120'
							}).append($('<h3/>',{
							html : items.citycontent
							}))).append($('<a/>',{
								id : 'heartBtn'+items.seq,
								class : 'btn_like',
								onclick : 'moveHeart("'+items.seq+'")'
								}).append($('<img/>',{
									class : 'heart_img bye',
									id : 'heart_img'+items.seq
								}))
							)
						).appendTo($('#overseas-list'));
						if((index%5) == 4){
							$('<td/>',{
								colspan : '2',
								align : 'right'
							}).append($('<input/>',{
								type : 'button',
								id : 'nextView',
								value : '더보기'
							})).appendTo($('#overseas-list'));
							listIndex = index;
							return false;
						}
					
					});//$.each
				}
				i = i+5;
				$('#nextView').on('click',function(){
					$('#nextView').hide();
					for(j = i; j<i+5; j++){
						if(j >= dataListSize) return false;
						$('<tr/>',{
							class : dataList[j].seq
						}).append($('<td/>',{
							style : 'width: 360px;'
						}).append($('<div/>',{
							class : 'imageDiv',
							style : 'width: 350px;'
							}).append($('<img/>',{
								style : 'border: 1px solid black;',
								src : '../travel/storage/'+dataList[j].cityimage,
								width : '350',
								height : '250'
							}))
						)).append($('<td/>').append($('<div/>',{
							style : 'width: 250px; overflow: hidden; font-size: 14pt;'
							}).append($('<span/>',{
								text : '대륙 카테고리> '
							})).append($('<strong/>',{
								html : dataList[j].countryid+" / "+dataList[j].countryid2+'<br>'
							})).append($('<span/>',{
								text : '나라> '
							})).append($('<strong/>',{
								html : dataList[j].cityid+'<br>'
							})).append($('<span/>',{
								text : '도시> '
							})).append($('<strong/>',{
								html : dataList[j].wordname+'<br>'
							})).append($('<span/>',{
								text : '소개글> '
							}))).append($('<div/>',{
								height : '120'
							}).append($('<h3/>',{
							html : dataList[j].citycontent
							}))).append($('<a/>',{
								id : 'heartBtn'+dataList[j].seq,
								class : 'btn_like',
								onclick : 'moveHeart("'+dataList[j].seq+'")'
								}).append($('<img/>',{
									class : 'heart_img bye',
									id : 'heart_img'+dataList[j].seq
								}))
							)
						).appendTo($('#overseas-list'));
				
						
					}
					$('#nextView').show();
				});
			},
			error : function(data){
				alert("안된다... 왜지???");
			}
		});

	 });
});