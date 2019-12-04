/**
 * 자바스크립트 외부파일
 */

/**
 * 키워드 검색
 */

$(function(){ // 검색창
	
	$("#keyword").keyup(function(){ // 키보드 눌렀다가 뗐을때 이벤트 발생
		var k = $(this).val();
		$(".table>tbody>tr").hide();
		var email= $(".table>tbody>tr> td:nth-child(5n+4):contains('" + k + "')"); // 이메일 검색
		var nickname= $(".table>tbody>tr> td:nth-child(5n+5):contains('" + k + "')"); // 닉네임 검색
		
		$(email).parent().show();
		$(nickname).parent().show();
	});
	
	
});	

function allCheck(){ // 전체 선택,해제
    if( $("#checkAll").is(':checked') ){
      $("input[name=checkRow]").prop("checked", true);
    }else{
      $("input[name=checkRow]").prop("checked", false);
    }
};

/* 삭제여부 모달창 뜨기전에 조건검사먼저 진행 */
$("#deleteBtn").click(function () {
	
	 var checkRow = "";
	  $( "input[name='checkRow']:checked" ).each (function (){
	    checkRow = checkRow + $(this).val()+"," ; // 변수에 번호 ,로 이어서 담아주기
	  });
	  checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); //맨끝 콤마 지우기
	  
  	  if(checkRow == ''){
	    alert("삭제할 대상을 선택하세요.");
	    return false;
	 
	  }
	  //console.log("나옴");
  	$('#deleteModal').show(); // 삭제여부 모달창 열어주기
		  
});


//탭 클릭시 이벤트
$("#adListTab").click(function(){ 
	//alert("gg");
	$("#nav-waiting div").attr("style","display:none");	
	$("#nav-ongoing div").attr("style","display:none");	
	$("#nav-home div").attr("style","display:block");
	$("#nav-home div.row").attr("style", "display:flex");
	
});

$("#adUnapproved").click(function(){
	$("#nav-home div").attr("style","display:none");	
	$("#nav-ongoing div").attr("style","display:none");	
	$("#nav-waiting div").attr("style","display:block");
	
});

$("#adOngoing").click(function(){
	$("#nav-home div").attr("style","display:none");	
	$("#nav-waiting div").attr("style","display:none");
	$("#nav-ongoing div").attr("style","display:block");
	
});



