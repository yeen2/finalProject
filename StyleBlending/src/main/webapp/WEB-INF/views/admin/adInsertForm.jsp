<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 광고신청모달 -->
      <div class="modal" id="updatePass" tabindex="-1" role="dialog" >
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">광고 신청</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <!-- 비밀번호 입력 폼 -->
			      <form action="aInsertPayView.do" method="post" enctype="multipart/form-data"  onsubmit="return insertPay();">
					<input type="hidden" name="mno" value="${loginUser.mno }"/>
					<div class="form-group" style="margin-bottom:25px;">
						<label for="adName">업체명</label>
						<input type="text" class="form-control" id="adName" name="name" placeholder="업체명을 입력해주세요." maxlength="16">
					</div>
					<div class="form-group" style="margin-bottom:25px; position:relative;">
						<label for="url">연결 URL</label>
						<input type="text" class="form-control" id="url" name="url" placeholder="http://" maxlength="16">
						<div style="position:absolute;"><p><small class="form-text text-success">클릭시 표시할 대표 URL을 입력합니다.</small></p></div>
					</div>
					<div class="form-group" style="margin-bottom:25px; position:relative;">
						<label for="file-input" class=" form-control-label">등록 이미지</label>
						<input type="file" id="file-input" name="uploadFile" class="form-control-file">
						<div class="c2 fCheck2" style="position:absolute;"><p><small class="form-text text-danger">
						광고 신청시 관리자 승인 처리 후 30일 동안 진행됩니다. 신청 버튼클릭시 결제페이지로 이동합니다.
						</small></p></div>
						<div class="c2 sCheck2" style="position:absolute;">
							<p>
							<input type="checkbox" name="checkCondition" id="checkCondition" value="1"/>
							<small class="form-text text-success">위 구매 조건 확인 및 결제 진행에 동의</small></p>
						</div>
					</div>
					<br>
				      <div class="modal-footer">
				        <button type="submit" class="btn btn-success">광고신청</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				      </div>
			       </form>
			     
			    </div>
			  </div>
			</div>
</body>
</html>