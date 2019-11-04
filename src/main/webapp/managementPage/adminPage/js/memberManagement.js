$(document).ready(function() {
	$('#memberListTable').on('click', '.memberDeleteBtn', function() {
		if (confirm("정말 삭제하시겠습니까?")==true){
		    $.ajax({
		    	type : 'POST',
		    	url : '/hairShopProject/adminPage/memberDelete.do',
		    	data : {'email':$(this).attr('id')},
		    	success : function() {
		    		location.reload();
		    	}
		    });
		}else{
		    return;
		}
	});
});