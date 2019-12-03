<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	#adImg{
		width:500px;
		height:600px;
		border:1px solid black;
	}
	
	.c1, .c2{display:none;}
	#color input{width:30px; height:30px; border:1px solid lightgray; margin-right:5px;}
	#updateForm>form>div{margin-bottom:35px;}
	li{margin-bottom:20px; color:orangered;}
	#searchForm div{display:inline-block;}
	.form-center {
		text-align: center !important;
		content: center !important;
	}
</style>

	<jsp:include page="../includes/header.jsp" />
	
	<div class="container" style="margin-bottom:70px;">
		
		<div class="navigation d-flex justify-content-center" style="margin-top:100px; margin-bottom:30px;">
			<!-- 메뉴바 -->
			<ul class="nav nav-primary nav-tabs mt-3 d-flex flex-column flex-md-row">
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#" id="updateProfileBtn"> 
					<i class="fa fa-edit"></i>
						프로필 수정
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#" id="adBtn"> 
					<i class="fa fa-ad"></i>
						광고 관리
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="modal" href="#updatePass"> 
					<i class="fa fa-key"></i>
						비밀번호 변경
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="modal" href="#deleteMember"> 
					<i class="fa fa-ban"></i>
						회원 탈퇴
					</a>
				</li>
			</ul>
		</div>
		
	
		<!-- 광고신청 -->
        <div tabindex="-1" role="dialog" >
			<div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content" style="border: none !important;">
			    	<div class="modal-header">
			        	<h5 class="modal-title" id="exampleModalLabel">광고 신청</h5>
			      	</div>
			      
			      	<form id="adInsertForm" method="post" enctype="multipart/form-data" onsubmit="return insertPay();">
						<input type="hidden" name="mno" id="mno" value="${loginUser.mno}"/>
						<div class="form-group" style="margin-bottom:25px;">
							<label for="adName">업체명</label>
							<input type="text" id="adName" class="form-control" name="name" placeholder="업체명을 입력해주세요." maxlength="16">
						</div>
						<div class="form-group">
							<label for="url">연결 URL</label>
							<input type="text" class="form-control" id="url" name="url" placeholder="http://" maxlength="50">
						<div>
							<p>
								<small class="form-text text-success"><i class="fa fa-check"></i> 광고 등록할 유튜브 주소를 입력해주세요.</small>
							</p>
						</div>
						</div>
						<div class="form-group">
							<label for="file-input" class=" form-control-label">등록 이미지</label>
							<input type="file" id="file-input" name="uploadFile" class="form-control-file" style="display:none;" onchange="previewImg(this);">
							<img id="adImg"/>
							<div>
								<p><small class="form-text text-success"><i class="fa fa-check"></i> 금액(390,000원)을 선지불하고 계약 기간 동안 광고가 노출되는 정액제 상품입니다.
								<br><i class="fa fa-check"></i> 신청 버튼 클릭시 결제페이지로 이동합니다.
								<br><i class="fa fa-check"></i> 광고 신청시 관리자 승인 처리 후 7일 동안 진행됩니다. 
								</small></p>
								<p>
								<input type="checkbox" name="checkCondition" id="checkCondition" onclick="agreeCheck();"/>
								<label class="text-danger" for="checkCondition">위 구매 조건 확인 및 결제 진행에 동의</label>
								</p>
							</div>
						</div>
				      	<div class="modal-footer" style="margin-top:20px; ">
				        	<button type="button" class="btn btn-success" id="adConfirm" disabled>광고신청</button>
				        	<button type="button" class="btn btn-secondary" data-dismiss="modal" id="closeBtn123">취소</button>
				      	</div>
			       </form>
				</div>
			 </div>
		</div> <!-- 광고신청 끝 -->
		
		<!-- 비밀번호 변경 탭 -->
			<!-- 비밀번호 변경 모달창 -->
			<div class="modal fade" id="updatePass" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="passClose">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <!-- 비밀번호 입력 폼 -->
			      <form action="mpUpdatePass.do" method="post" onsubmit="return passCheck();">
					<div class="form-group" style="margin-bottom:25px;">
						<label for="userPwd">현재 비밀번호</label>
						<input type="password" class="form-control" id="currentPass" name="currentPass" placeholder="현재 비밀번호" maxlength="16">
					</div>
					<div class="form-group" style="margin-bottom:25px; position:relative;">
						<label for="newPwd1">새 비밀번호</label>
						<input type="password" class="form-control" id="pass" name="pass" placeholder="새 비밀번호" maxlength="16">
						<div class="c1 fCheck1" style="position:absolute;"><p><small class="form-text text-danger">형식에 맞지 않습니다.</small></p></div>
						<div class="c1 sCheck1" style="position:absolute;"><p><small class="form-text text-success">사용 가능합니다.</small></p></div>
					</div>
					<div class="form-group" style="margin-bottom:25px; position:relative;">
						<label for="newPwd2">새 비밀번호 확인</label>
						<input type="password" class="form-control" id="pass2" name="pass2" placeholder="새 비밀번호 확인" maxlength="16">
						<div class="c2 fCheck2" style="position:absolute;"><p><small class="form-text text-danger">비밀번호가 일치하지 않습니다.</small></p></div>
						<div class="c2 sCheck2" style="position:absolute;"><p><small class="form-text text-success">비밀번호 확인!</small></p></div>
					</div>
				
				      <div class="modal-footer">
				        <button type="submit" class="btn btn-success">변경하기</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="passClose2">취소</button>
				      </div>
			       </form>
			     
			    </div>
			  </div>
			</div>
			
			<!-- 회원 탈퇴 탭 -->
			<!-- 회원 탈퇴 모달창 -->
			<div class="modal fade" id="deleteMember" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="deleteClose">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <ul>
			        	<li><b>탈퇴 시 회원정보는 복구할 수 없습니다.</b></li>
			        	<li><b>모든 업로드 사진들이 같이 삭제됩니다.</b></li>
			        	<li><b>탈퇴하시려면 아래에 현재 비밀번호를 입력해주세요.</b></li>
			        </ul>
			      </div>
			      <!-- 회원 탈퇴 입력 폼 -->
			      <div align="center">
				      <div class="form-group">
				      	<label>이메일</label>
				      	<p style="color:royalblue;">${ loginUser.email }</p>
				      </div>
				      <div class="form-group">
				      	<label>닉네임</label>
				      	<p style="color:royalblue;">${ loginUser.nickName }</p>
				      </div>
			      </div>
			      
					<div class="form-group" align="center">
						<label for="userPwd">현재 비밀번호</label>
						<input type="password" class="form form-control form-center" id="userPass" name="userPass" placeholder="현재 비밀번호">
					</div>
				
				    <div class="modal-footer">
				      <button type="button" class="btn btn-success" id="deleteBtn">탈퇴하기</button>
				      <button type="button" class="btn btn-secondary" data-dismiss="modal" id="deleteClose2">취소</button>
				    </div>
			     
			    </div>
			  </div>
			</div>
			
	</div>
		
		
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
		<script>
		
		// 체크박스 여부확인 
		function agreeCheck(){
			var chk = $('input:checkbox[id="checkCondition"]').is(":checked");
			if(chk==true){
				$("#adConfirm").removeAttr('disabled');
			}else{
				$("#adConfirm").attr("disabled", true);
			}
			
		}
		
		// 이미지 부분 클릭시 input 파일나오게
		$(function(){
			$("#adImg").click(function(){
				$(this).prev().click();
			});
				
		});
		
		// 사진미리보기
		function previewImg(input){
			
			if(input.files && input.files[0]){
				
				var reader = new FileReader();
				
				reader.onload = function(e){
					$("#adImg").attr('src',e.target.result);
				}
				reader.readAsDataURL(input.files[0]); // 파일읽기
			}
		}
		

	 	$(function(){
			
			$("#adConfirm").on("click",function(){
			
			// 값이 하나라도 저장되지 않으면 버튼 눌리지않도록
			if($("#adName").val() == ""){
				alert("업체명을 입력해주세요.");
				$("#adName").focus();
				return ;
			}
			if($("#url").val() == ""){
				alert("동영상 url을 입력해주세요.");
				$("#url").focus();
				return ;
			}
			if($("#file-input").val() == ""){
				alert("이미지를 등록해주세요.");
				return ;
			}
			
				var IMP = window.IMP;
				IMP.init('iamport');
				IMP.request_pay({
					pg : 'html5_inicis',
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '광고 등록',
				    amount : 100,
				    buyer_email : '${loginUser.email}',
				    buyer_name : "${loginUser.nickName}",
				    buyer_tel : '010-1234-5678',
				    buyer_addr : '서울특별시 강남구 삼성동',
				    buyer_postcode : '123-456'
				}, function(rsp) {
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다. 관리자 검토 후 승인시 진행됩니다.';
				       // msg += '고유ID : ' + rsp.imp_uid;
				       // msg += '상점 거래ID : ' + rsp.merchant_uid;
				        //msg += '결제 금액 : ' + rsp.paid_amount;
				       // msg += '카드 승인번호 : ' + rsp.apply_num;
				        
				        var form = $("#adInsertForm")[0];
				        var formData = new FormData(form);
				
				        //console.log(formData);
				        
				         $.ajax({
				        	url:"aInsertAd.do",
				        	processData: false,
				        	contentType: false,
				        	data: formData,
				        	type:"post",
				        	success:function(data){
				        	// 마이페이지 광고리스트 페이지로이동
				        	alert("광고가 정상적으로 신청되었습니다.");
				       		location.href="mpSAdList.do";
				       
				        	},error:function(){
				        		console.log("ajax 통신 실패");
				        	}
				        }); 
				        
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				        
				    }
				
				    alert(msg);
				});	
			})
		})
		</script>
		
		<script>
			<%-- 비밀번호 변경 유효성 검사 --%>
			$("#pass").on("input", function(){
				if($("#pass").val().length < 8){
					$(".fCheck1").show();
					$(".sCheck1").hide();
				}else{
					$(".fCheck1").hide();
					$(".sCheck1").show();
				}
				if($("#pass").val().length == 0){
					$(".c1").hide();
				}
				
			});
			
			$("#pass2").on("input", function(){
				if(($("#pass").val() != "") && ($("#pass").val() != $("#pass2").val())){
					$(".fCheck2").show();
					$(".sCheck2").hide();
				}else if($("#pass").val() == $("#pass2").val()){
					$(".fCheck2").hide();
					$(".sCheck2").show();
				}
				if($("#pass2").val().length == 0){
					$(".c2").hide();
				}
			});
			
			function passCheck(){
				if($("#currentPass").val() != "${loginUser.pass}"){
					alert("현재 비밀번호가 일치하지 않습니다.");
					$("#currentPass").val("").focus();
					return false;
				}
				if($("#pass").val().length < 8){
					alert("새 비밀번호 형식이 맞지 않습니다.");
					$("#pass").val("").focus();
					$("#pass2").val("");
					$(".fCheck1").hide();
					$(".sCheck1").hide();
					$(".fCheck2").hide();
					$(".sCheck2").hide();
					return false;
				}
				if($("#pass").val() != $("#pass2").val()){
					alert("새 비밀번호가 일치하지 않습니다.");
					$("#pass2").val("").focus();
					$(".fCheck2").hide();
					$(".sCheck2").hide();
					return false;
				}
				return true;
			}
			
			<%-- 회원탈퇴 유효성검사 --%>
			$("#deleteBtn").on("click", function(){
				if($("#userPass").val() == "${loginUser.pass}"){
					var real = confirm("정말로 탈퇴하시겠습니까?");
					if(real){
						location.href="mpDeleteMem.do";
					}
				}else{
					alert("비밀번호가 일치하지 않습니다.");
					$("#userPass").val("").focus();
				}
			});
			
			<%-- 모달창 닫을 때 입력값 초기화 --%>
			$("html").click(function(e){
				if($("#updatePass").css("display") == "block"){
					if(!$("#updatePass").has(e.target).length){
						$("#currentPass").val("");
						$("#pass").val("");
						$("#pass2").val("");
						$(".fCheck1").hide();
						$(".sCheck1").hide();
						$(".fCheck2").hide();
						$(".sCheck2").hide();
					}
				}
			});
			
			$("html").click(function(e){
				if($("#deleteMember").css("display") == "block"){
					if(!$("#deleteMember").has(e.target).length){
						$("#userPass").val("");
					}
				}
			});
			
			$("#passClose, #passClose2").click(function(){
				$("#currentPass").val("");
				$("#pass").val("");
				$("#pass2").val("");
				$(".fCheck1").hide();
				$(".sCheck1").hide();
				$(".fCheck2").hide();
				$(".sCheck2").hide();
			});
			
			$("#deleteClose, #deleteClose2").click(function(){
				$("#userPass").val("");
			});
			
			// 프로필 페이지 이동
			$("#updateProfileBtn").click(function(){
				location.href="mpProfileUpdate.do";
			});
			
			// 광고 페이지 이동
			$("#adBtn, #closeBtn123").click(function(){
				location.href="mpSAdList.do";
			});
		</script>

<jsp:include page="../includes/footer.jsp" />