<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	#adImg{
		width:500px;
		height:600px;
		border:1px solid black;
	}
</style>

	<jsp:include page="../includes/header.jsp" />
	
	<div class="container" style="margin-bottom:70px;">
		
		<div class="navigation d-flex justify-content-center" style="margin-top:100px; margin-bottom:30px;">
			<!-- 메뉴바 -->
			<ul class="nav nav-primary nav-tabs mt-3 d-flex flex-column flex-md-row">
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#updateProfile"> 
					<i class="fa fa-edit"></i>
						프로필 수정
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#ad" id="adBtn"> 
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
	
        <div class="" id="updatePass" tabindex="-1" role="dialog" >
			<div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			    	<div class="modal-header">
			        	<h5 class="modal-title" id="exampleModalLabel">광고 신청</h5>
			      	</div>
			      
			      	<form id="adInsertForm" method="post" enctype="multipart/form-data" onsubmit="return insertPay();">
						<input type="hidden" name="mno" id="mno" value="${loginUser.mno}"/>
						<div class="form-group" style="margin-bottom:25px;">
							<label for="adName">업체명</label>
							<input type="text" id="adName" class="form-control" name="name" placeholder="업체명을 입력해주세요." maxlength="16">
						</div>
						<div class="form-group" style="margin-bottom:25px; position:relative;">
							<label for="url">연결 URL</label>
							<input type="text" class="form-control" id="url" name="url" placeholder="http://" maxlength="50">
						<div style="position:absolute;">
							<p>
								<small class="form-text text-success"><i class="fa fa-check"></i> 광고 등록할 유튜브 주소를 입력해주세요.</small></p></div>
						</div>
						<div class="form-group" style="margin-bottom:25px; position:relative;">
							<label for="file-input" class=" form-control-label">등록 이미지</label>
							<input type="file" id="file-input" name="uploadFile" class="form-control-file" style="display:none;" onchange="previewImg(this);">
							<img id="adImg"/>
							<div style="position:absolute;">
								<p><small class="form-text text-success"><i class="fa fa-check"></i> 광고 신청시 관리자 승인 처리 후 7일 동안 진행됩니다. 
								<br><i class="fa fa-check"></i> 신청 버튼 클릭시 결제페이지로 이동합니다.</small></p>
							</div>
							<br>
							<br>
							<div class="c2 sCheck2" style="position:absolute;">
								<p>
								<small class="form-text text-danger"><input type="checkbox" name="checkCondition" id="checkCondition" onclick="agreeCheck();"/>위 구매 조건 확인 및 결제 진행에 동의</small></p>
							</div>
						</div>
						<br>
				      	<div class="modal-footer">
				        	<button type="button" class="btn btn-success" id="adConfirm" disabled>광고신청</button>
				        	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				      	</div>
			       </form>
				</div>
			 </div>
		</div> <!-- 광고신청 끝 -->
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
				        var msg = '결제가 완료되었습니다.';
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

<jsp:include page="../includes/footer.jsp" />