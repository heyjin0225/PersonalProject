$(document).ready(function() {
	// 나라 삭제 버튼
	$('.countryManagement').on('click', '.countryDeleteBtn', function() {
		if (confirm("정말 삭제하시겠습니까?")==true){
		    $.ajax({
		    	type : 'POST',
		    	url : '/PersonalProject/adminPage/countryDelete.do',
		    	data : {'wordname':$(this).attr('id')},
		    	success : function() {
		    		location.reload();
		    	}
		    });
		}else{
		    return;
		}
	});
	
	
});