/**
 * 자바스크립트 외부파일
 */


/**
 * 체크박스 전체선택, 해제
 */
function checkAll(){ 
      if( $("#th_checkAll").is(':checked') ){
        $("input[name=checkRow]").prop("checked", true);
      }else{
        $("input[name=checkRow]").prop("checked", false);
      }
};


/**
 * 삭제(체크박스 선택된 것 전부)
 */
function deleteAction(){
  var checkRow = "";
  $( "input[name='checkRow']:checked" ).each (function (){
    checkRow = checkRow + $(this).val()+"," ;
  });
  checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); //맨끝 콤마 지우기
 
  if(checkRow == ''){
    alert("삭제할 대상을 선택하세요.");
    $('#smallModal').modal('hide');
    return false;
 
  }
 
     var dno = checkRow;
      
   //   location.href="${pageContext.request.contextPath}/aDeleteDeclareBoard.do?dno="+dno;  
  
};