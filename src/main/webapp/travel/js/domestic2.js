$.each(data.list, function(index,items){
				$('<div/>',{
					class : items.seq,
					id : 'allBoxBody',
					html : 
						'<div id="imageBox">'+
						'<div class="imageDiv" style="width:350px;">'+
						'<img width="350" height="250" src="../travel/storage/'+items.cityimage+'" style="border: 1px solid black"/>'+
						'</div>'+
						'</div>'+
						'<div id="textBox">'+
						'<div class="textDiv" style="font-size: 14pt;">'+
						'<span>대륙 카테고리></span>'+
						'<strong>'+items.countryid+'</strong><br>'+
						'<span>나라></span>'+
						'<strong>'+items.countryid2+'</strong><br>'+
						'<span>도시></span>'+
						'<strong>'+items.wordname+'</strong><br>'+
						'<span>소개글></span>'+
						'<div height="120" style="width: 80%;">'+
						'<h3>'+items.citycontent+'</h3>'+
						'</div>'+
						'<a id="heartBtn'+items.seq+'" class="btn_like" onclick="moveHeart('+items.seq+')">'+
						'<img class="heart_img bye" id="heart_img'+items.seq+'"/>'+
						'</a>'
						
						
				}).appendTo($('#domestic-list'));
				$('#allBoxBody').after($('<div/>',{
					id : 'line'
				}).append($('<hr>',{
					style : 'margin-top: 50px; border-bottom: 1px solid silver; border-left: 1px solid white; border-right: 1px solid white; border-top: 1px solid white;'
				})));
});



$.each(data.list, function(index,items){
	$('<div/>',{
		class : items.seq,
		id : 'allBox',
		style : "display: flex;"
	}).append($('<div/>',{
		id : 'imageBox'
	}).append($('<div/>',{
		class : 'imageDiv',
		style : 'width: 350px;'
		}).append($('<img/>',{
			style : 'border: 1px solid black;',
			src : '../travel/storage/'+items.cityimage,
			width : '350',
			height : '250'
		}))
	)).append($('<div/>',{
		id : 'textBox'
		}).append($('<div/>',{
		class : 'textDiv',
		style : 'overflow: hidden; font-size: 14pt;'
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
		})).append($('<div/>',{
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
		)
	).appendTo($('#domestic-list'));

	$('.'+items.seq).after($('<div/>',{
		id : 'line-after'
	}).append($('<hr>',{
		style : ' border-bottom: 1px solid silver; border-left: 1px solid white; border-right: 1px solid white; border-top: 1px solid white;'
	})));


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
