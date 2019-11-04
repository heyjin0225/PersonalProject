$(document).ready(function(){
	//국내 여행지 리스트
	var dataList;
	var listIndex;
	var i = 0;
	var j;
	var dataListSize;
	$.ajax({
		type: 'POST',
		url: '/PersonalProject/travel/domesticList.do',
		data: {'countryid': "국내"},
		dataType: 'json',
		success: function(data){
			//alert(JSON.stringify(data));
			dataList = data.list;
			dataListSize = dataList.length;
			$('#domestic-list tr:ge(0)').remove();
			$.each(data.list, function(index,items){
				$('<tr/>',{
					class : items.seq
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
					style : 'width: 260px; overflow: hidden; font-size: 14pt;'
					}).append($('<span/>',{
						text : '대륙 카테고리> '
					})).append($('<strong/>',{
						html : items.countryid+'<br>'
					})).append($('<span/>',{
						text : '나라> '
					})).append($('<strong/>',{
						html : items.countryid2+'<br>'
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
				).appendTo($('#domestic-list'));
		
				$('.'+items.seq).after($('<td/>',{
					colspan : '2',
					id : 'line-after'
				}).append($('<hr>',{
					style : ' border-bottom: 1px solid silver; border-left: 1px solid white; border-right: 1px solid white; border-top: 1px solid white;'
				})));
				
				if((index%5) == 4){
					$('<td/>',{
						colspan : '2',
						align : 'right'
					}).append($('<input/>',{
						type : 'button',
						id : 'nextView',
						value : '더보기'
					})).appendTo($('#domestic-list'));
					listIndex = index;
					return false;
				}
			});//$.each
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
							text : '나라 카테고리> '
						})).append($('<strong/>',{
							html : dataList[j].countryid+'<br>'
						})).append($('<span/>',{
							text : '나라> '
						})).append($('<strong/>',{
							html : dataList[j].countryid2+'<br>'
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
					).appendTo($('#domestic-list'));
			
					$('.'+dataList[j].seq).after($('<td/>',{
						colspan : '2',
						id : 'line-after'
					}).append($('<hr>',{
						style : ' border-bottom: 1px solid silver; border-left: 1px solid white; border-right: 1px solid white; border-top: 1px solid white;'
					})));
				}
				$('#nextView').show();
			});
			
		},//success
		error: function(data){
			alert("error");
		}
	});
	
	
});