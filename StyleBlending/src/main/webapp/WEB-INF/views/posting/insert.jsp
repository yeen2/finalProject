<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	.map_wrap, .map_wrap * {
		margin: 0;
		padding: 0;
		font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
		font-size: 12px;
	}
	
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
		color: #000;
		text-decoration: none;
	}
	
	.map_wrap {
		position: relative;
		width: 100%;
		height: 500px;
	}
	
	#menu_wrap {
		position: absolute;
		top: 0;
		left: 0;
		bottom: 0;
		width: 300px;
		margin: 10px 0 30px 10px;
		padding: 5px;
		overflow-y: auto;
		background: rgba(255, 255, 255, 0.7);
		z-index: 1;
		font-size: 12px;
		border-radius: 10px;
	}
	
	.bg_white {
		background: #fff;
	}
	
	#menu_wrap hr {
		display: block;
		height: 1px;
		border: 0;
		border-top: 2px solid #5F5F5F;
		margin: 3px 0;
	}
	
	#menu_wrap .option {
		text-align: center;
	}
	
	#menu_wrap .option p {
		margin: 10px 0;
	}
	
	#menu_wrap .option button {
		margin-left: 5px;
	}
	
	#placesList li {
		list-style: none;
	}
	
	#placesList .item {
		position: relative;
		border-bottom: 1px solid #888;
		overflow: hidden;
		cursor: pointer;
		min-height: 65px;
	}
	
	#placesList .item span {
		display: block;
		margin-top: 4px;
	}
	
	#placesList .item h5, #placesList .item .info {
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	
	#placesList .item .info {
		padding: 10px 0 10px 55px;
	}
	
	#placesList .info .gray {
		color: #8a8a8a;
	}
	
	#placesList .info .jibun {
		padding-left: 26px;
		background:
			url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
			no-repeat;
	}
	
	#placesList .info .tel {
		color: #009900;
	}
	
	#placesList .item .markerbg {
		float: left;
		position: absolute;
		width: 36px;
		height: 37px;
		margin: 10px 0 0 10px;
		background:
			url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
			no-repeat;
	}
	
	#placesList .item .marker_1 {
		background-position: 0 -10px;
	}
	
	#placesList .item .marker_2 {
		background-position: 0 -56px;
	}
	
	#placesList .item .marker_3 {
		background-position: 0 -102px
	}
	
	#placesList .item .marker_4 {
		background-position: 0 -148px;
	}
	
	#placesList .item .marker_5 {
		background-position: 0 -194px;
	}
	
	#placesList .item .marker_6 {
		background-position: 0 -240px;
	}
	
	#placesList .item .marker_7 {
		background-position: 0 -286px;
	}
	
	#placesList .item .marker_8 {
		background-position: 0 -332px;
	}
	
	#placesList .item .marker_9 {
		background-position: 0 -378px;
	}
	
	#placesList .item .marker_10 {
		background-position: 0 -423px;
	}
	
	#placesList .item .marker_11 {
		background-position: 0 -470px;
	}
	
	#placesList .item .marker_12 {
		background-position: 0 -516px;
	}
	
	#placesList .item .marker_13 {
		background-position: 0 -562px;
	}
	
	#placesList .item .marker_14 {
		background-position: 0 -608px;
	}
	
	#placesList .item .marker_15 {
		background-position: 0 -654px;
	}
	
	#pagination {
		margin: 10px auto;
		text-align: center;
	}
	
	#pagination a {
		display: inline-block;
		margin-right: 10px;
	}
	
	#pagination .on {
		font-weight: bold;
		cursor: default;
		color: #777;
	}
	#divImg:hover{
		cursor: pointer;
	}

	/* 모달 */
	/* The Modal (background) */
	.modal {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		padding-top: 100px; /* Location of the box */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0, 0, 0); /* Fallback color */
		background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	}
	
	/* Modal Content */
	.modalContent {
		background-color: #fefefe;
		margin: auto;
		padding: 20px;
		border: 1px solid #888;
		border-radius: 5px;
		width: 80%;
	}
	
</style>
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery.placeholder.js"></script> --%>
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/resources/ckeditor/plugin.js"></script>
</head>
<body class="profile" style="margin-bottom: 20px !important;">
	
	<%@include file="../includes/header.jsp" %>

	<!-- Page Content -->
	<div class="container" style="margin-top: 150px; margin-bottom: 70px;">
		<form action="pInsert.do" method="post" id="insertForm" enctype="multipart/form-data" onsubmit="return insertValidate();">
		
		<div class="row">

			<!-- 왼쪽 -->
			<div class="col-lg-7">

				<!-- Title -->
				<h3 class="mt-4">" ${ loginUser.nickName } " 님의 Today's Posting</h3>
				<input type="hidden" name="mno" value="${ loginUser.mno }">
				<hr>
				<!-- 이미지 -->
				<div class="img" id="divImg" style="width: 500px; height:600px;">
					<img id="img" width="100%" height="100%">
				</div>
				<!-- 좋아요,신고-->
				<div>
					<!-- 좋아요아이콘 -->
					<!-- 댓글 아이콘 -->
					<!-- 신고 아이콘 -->
				</div>
				
				<hr>
				
				<!-- Post Content -->
				<textarea rows="10" cols="70" id="content" name="content" 
					placeholder="사진에 대한 내용과 #해시태그는 이 안에 입력해주세요."></textarea>

			</div>
			<!-- 해쉬태그 담기 -->
			<input type="hidden" name="hashtag" id="hashtag">
			
			<!-- 사진업로드 부분 (hidden) -->
			<div id="fileArea">
				<input type="file" id="fileImg" name="fileImg" onchange="loadImg(this, 1);"> 
			</div>
			
			<script>
				// 각 div 클릭할 때 파일 첨부 창이 뜨도록
				$(function() {
					$("#fileArea").hide();
		
					$("#divImg").click(function() {
						$("#fileImg").click();
					});
				});
		
				function loadImg(value, num) {
		
					if (value.files && value.files[0]) {
		
						// 1. 파일을 읽어들일 FileReader 객체 생성
						var reader = new FileReader();
		
						// 2. 파일 읽기가 다 완료되었을 때 실행되는 메소드
						reader.onload = function(e) {
							$("#img").attr("src", e.target.result); // data:URL

						}
						// 파일 읽기 메소드
						reader.readAsDataURL(value.files[0]);
					}
				}

			</script>
			
			
			<!-- 오른쪽 -->
			<div class="col-md-5">
				<!-- 1. 성별 -->
				<div class="card my-4">
					<div class="card-body" style="display: inline-block;">
						<h5
							style="display: inline-block; padding-top: 8px; margin-bottom: 0;">성별</h5>
						&nbsp;&nbsp;
						<div class="form-group" style="display: inline-block;">
							<div class="custom-control custom-radio my-2"
								style="padding-top: 0 !important; display: inline-block;">
								<input type="radio" id="men" name="gender" value="M"
									class="custom-control-input" checked> <label
									class="custom-control-label" for="men">남자</label>
							</div>
							<div class="custom-control custom-radio my-2"
								style="padding-top: 0 !important; display: inline-block;">
								<input type="radio" id="woman" name="gender" value="W"
									class="custom-control-input"> <label
									class="custom-control-label" for="woman">여자</label>
							</div>
						</div>
					</div>
				</div>

				<!-- 2. 위치선택 -->
				<div class="card my-4">
					<h5 class="card-header">촬영 위치</h5>
					<div class="card-body">
						<div class="input-group">
							<!-- 주소 담길 text  -->
							<input type="text" class="form-control" name="location" id="add">
							<!-- 지도버튼  -->
							<!-- <button type="button" class="btn btn-info" data-toggle="modal"
								id="addOpenBtn" data-target="#addModal">지도</button> -->
							<button type="button" class="btn btn-info" data-toggle="modal"
								id="addOpenBtn" >지도</button>
						</div>
					</div>
				</div>


				<!-- Side Widget -->
				<div class="card my-4" style="display: inline-block;" id="addLocation">
					<h5 class="card-header" style="display: inline-block;">스타일 정보를 공유해주세요</h5>
					<div style="display: inline-block; float: right; margin: auto;">
						<button type="button" class="btn btn-primary" id="btnAdd">추가</button>
					</div>
					<br><br>
					
					
					<%-- <% for(int i=0; i<3; i++){ %> --%>
					<div class="card-body" id="addDiv"
						style="border-radius: 0; border: none; box-shadow: 0 0 2rem rgba(0, 0, 0, 0.1);
    							transition: transform 800ms cubic-bezier(0.165, 0.84, 0.44, 1); display: inline-block;
    							margin-right: 10px; margin-left: 10px; margin-bottom: 10px;">
						<!-- 동적 추가 삭제 -->
						<div>
						
						<!-- <div style="display: inline-block; float: right;">
							<button type="button" id="removeDiv" style="cursor: pointer; background-color: transparent; border: none; text-decoration: none;">
								<i class="fas fa-times"></i>
							</button>
						</div> -->
						
							<!-- 1.카테고리 -->
							<label>카테고리</label> 
							&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group" style="display: inline-block;">
								<select class="custom-select" name="cate">
									<option value="" disabled>상의</option>
									<option value="1">&nbsp;&nbsp;&nbsp;T-SHIRT</option>
									<option value="2">&nbsp;&nbsp;&nbsp;SWEATSHIRT</option>
									<option value="3">&nbsp;&nbsp;&nbsp;SHIRT</option>
									<option value="4">&nbsp;&nbsp;&nbsp;BLAZER</option>
									<option value="5">&nbsp;&nbsp;&nbsp;JACKET</option>
									<option value="6">&nbsp;&nbsp;&nbsp;OUTER</option>
									<option value="7">&nbsp;&nbsp;&nbsp;SLEEVELESS</option>
									<option value="8">&nbsp;&nbsp;&nbsp;CROP TEE</option>
									<option value="9">&nbsp;&nbsp;&nbsp;HOODIE</option>
									<option value="10">&nbsp;&nbsp;&nbsp;POLO</option>
									<option value="11">&nbsp;&nbsp;&nbsp;KNIT</option>
									<option value="12">&nbsp;&nbsp;&nbsp;TANK TOP</option>
									<option value="13">&nbsp;&nbsp;&nbsp;VEST</option>
									<option value="14">&nbsp;&nbsp;&nbsp;CARDIGAN</option>
									<option value="15">&nbsp;&nbsp;&nbsp;COAT</option>
									<option value="" disabled>하의</option>
									<option value="16">&nbsp;&nbsp;&nbsp;JEANS</option>
									<option value="17">&nbsp;&nbsp;&nbsp;PANTS</option>
									<option value="18">&nbsp;&nbsp;&nbsp;SHORTS</option>
									<option value="19">&nbsp;&nbsp;&nbsp;SKIRT</option>
									<option value="" disabled>신발</option>
									<option value="20">&nbsp;&nbsp;&nbsp;SNEAKERS</option>
									<option value="21">&nbsp;&nbsp;&nbsp;BOOTS</option>
									<option value="22">&nbsp;&nbsp;&nbsp;HEELS</option>
									<option value="23">&nbsp;&nbsp;&nbsp;SANDALS</option>
									<option value="24">&nbsp;&nbsp;&nbsp;CASUAL SHOES</option>
									<option value="25">&nbsp;&nbsp;&nbsp;FORMAL SHOES</option>
									<option value="" disabled>악세서리</option>
									<option value="26">&nbsp;&nbsp;&nbsp;BAG</option>
									<option value="27">&nbsp;&nbsp;&nbsp;JEWELRY</option>
									<option value="28">&nbsp;&nbsp;&nbsp;BRACELET</option>
									<option value="29">&nbsp;&nbsp;&nbsp;WATCH</option>
									<option value="30">&nbsp;&nbsp;&nbsp;HAT</option>
									<option value="31">&nbsp;&nbsp;&nbsp;EYEWEAR</option>
									<option value="32">&nbsp;&nbsp;&nbsp;GLOVES</option>
									<option value="33">&nbsp;&nbsp;&nbsp;SCARF</option>
									<option value="34">&nbsp;&nbsp;&nbsp;SOCKS</option>
									<option value="35">&nbsp;&nbsp;&nbsp;WALLET</option>
									<option value="36">&nbsp;&nbsp;&nbsp;TIE</option>
									<option value="" disabled>기타</option>
									<option value="37">&nbsp;&nbsp;&nbsp;SWIMWEAR</option>
									<option value="38">&nbsp;&nbsp;&nbsp;DRESS</option>
									<option value="39">&nbsp;&nbsp;&nbsp;JUMPSUIT</option>
									<option value="40">&nbsp;&nbsp;&nbsp;OVERALL</option>
									<option value="41">&nbsp;&nbsp;&nbsp;SUIT</option>
									<option value="42">&nbsp;&nbsp;&nbsp;ONE-PIECE</option>
									<option value="43">&nbsp;&nbsp;&nbsp;CAMERA</option>
									<option value="44">&nbsp;&nbsp;&nbsp;PHONE</option>
									<option value="45">&nbsp;&nbsp;&nbsp;SNACK</option>
									<option value="46">&nbsp;&nbsp;&nbsp;ETC.</option>
									<option value="47">&nbsp;&nbsp;&nbsp;BIKE</option>
								</select>
							</div>
							
							<!-- 삭제버튼 -->
							<!-- <div style="display: inline-block; float: right;">
								<i class="fas fa-times" id="removeDiv"></i>
							</div> -->
							
							<br>
							
							<!-- 2. 브랜드 -->
							<label>브랜드</label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-group" style="display: inline-block;">
								<input type="text" class="form-control" name="brand" placeholder="브랜드를 적어주세요">
							</div>
							
							<br>
							
							<!-- 3. 컬러 -->
							<label>컬러</label>
							<div style="margin: auto; text-align: center; background-color: #F2F2F2">
							
							<div style="padding:0; margin: 0px; display: inline-block; width: 28px; height: 28px;">
								<a id="red" class="btn bb" style="padding:0; margin: 0px;"> 
									<i class="fa fa-circle fa-2x" aria-hidden="true" style="color: red;" id="red"></i>
								</a> 
							</div>
							<div style="padding:0; margin: 0px; display: inline-block; width: 28px; height: 28px;">
								<a id="orange" class="btn bb" style="padding:0; margin: 0px;"> 
									<i class="fa fa-circle fa-2x" aria-hidden="true" style="color: orange;" id="orange"></i>
								</a> 
							</div>
							<div style="padding:0; margin: 0px; display: inline-block; width: 28px; height: 28px;">
								<a id="yellow" class="btn bb" style="padding:0; margin: 0px;"> 
									<i class="fa fa-circle fa-2x" aria-hidden="true" style="color:yellow;" id="yellow"></i>
								</a> 
							</div>
							<div style="padding:0; margin: 0px; display: inline-block; width: 28px; height: 28px;">
								<a id="green" class="btn bb" style="padding:0; margin: 0px;"> 
									<i class="fa fa-circle fa-2x" aria-hidden="true" style="color: green;" id="green"></i>
								</a> 
							</div>
							<div style="padding:0; margin: 0px; display: inline-block; width: 28px; height: 28px;">
								<a id="blue" class="btn bb" style="padding:0; margin: 0px;"> 
									<i class="fa fa-circle fa-2x" aria-hidden="true" style="color: blue;" id="blue"></i>
								</a> 
							</div>
							<div style="padding:0; margin: 0px; display: inline-block; width: 28px; height: 28px;">
								<a id="navy" class="btn bb" style="padding:0; margin: 0px;"> 
									<i class="fa fa-circle fa-2x" aria-hidden="true" style="color:navy;" id="navy"></i>
								</a> 
							</div>
							<div style="padding:0; margin: 0px; display: inline-block; width: 28px; height: 28px;">
								<a id="black" class="btn bb" style="padding:0; margin: 0px;"> 
									<i class="fa fa-circle fa-2x" aria-hidden="true" style="color: black;" id="black"></i>
								</a> 
							</div>
							<div style="padding:0; margin: 0px; display: inline-block; width: 28px; height: 28px;">
								<a id="white" class="btn bb" style="padding:0; margin: 0px;"> 
									<i class="fa fa-circle fa-2x" aria-hidden="true" style="color: white; border-color: gray;" id="white"></i>
								</a> 
							</div>
							<div style="padding:0; margin: 0px; display: inline-block; width: 28px; height: 28px;">
								<a id="pink" class="btn bb" style="padding:0; margin: 0px;"> 
									<i class="fa fa-circle fa-2x" aria-hidden="true" style="color: pink;" id="pink"></i>
								</a> 
							</div>
							<div style="padding:0; margin: 0px; display: inline-block; width: 28px; height: 28px;">
								<a id="brown" class="btn bb" style="padding:0; margin: 0px;"> 
									<i class="fa fa-circle fa-2x" aria-hidden="true" style="color: brown;" id="brown"></i>
								</a> 
							</div>
							<div style="padding:0; margin: 0px; display: inline-block; width: 28px; height: 28px;">
								<a id="gray" class="btn bb" style="padding:0; margin: 0px;"> 
									<i class="fa fa-circle fa-2x" aria-hidden="true" style="color: gray;" id="gray"></i>
								</a> 
							</div>
							<div style="padding:0; margin: 0px; display: inline-block; width: 28px; height: 28px;">
								<a id="aqua" class="btn bb" style="padding:0; margin: 0px;"> 
									<i class="fa fa-circle fa-2x" aria-hidden="true" style="color: aqua;" id="aqua"></i>
								</a> 
							</div>
							</div>
							<input type="hidden" name="color" id="selectColor">
							
							
							<script>
								$(document).on("click", ".bb", function(event) {

									var c = $(this).attr('id');
									var thisAttr = $(this).children().attr('class');
									//console.log(c);

									//$(this).children().attr('class', 'fa fa-circle fa-2x');
									$(this).parent().siblings().children().children().attr('class', 'fa fa-circle fa-2x');
									//$(this).children().siblings().attr('class', 'fa fa-circle fa-2x');
									$(this).children().attr('class', 'fa fa-check fa-2x');
									
									$("#selectColor").val(c);
									
									var inputColor = $("#selectColor").val();
									console.log(inputColor);
									
									$(this).parent().parent().parent().children("#selectColor").val(c);
									//console.log($(this).parent().parent().parent().children("#selectColor").attr('value')) ;
									
									
								});
							
							</script>
							
						</div> <!-- 동적 div end  -->
					</div> 	<!-- card-body end -->
					
					<br><br>
				<%-- <% } %>  --%>
				 <script>            
			        $(document).ready (function () {                
			            $('#btnAdd').click (function () {
			            	
			            	var addContent = $('#addDiv').html();
			            	//console.log(addContent);
			            	
			            	//var origin = $("#addDiv").clone();
			            	//$('#addLocation').append(origin);
			            	
			                $('#addLocation').append(
			                	'<div class="card-body" id="addDiv" style="border-radius: 0; border: none; box-shadow: 0 0 2rem rgba(0, 0, 0, 0.1); transition: transform 800ms cubic-bezier(0.165, 0.84, 0.44, 1); display: inline-block; margin-right: 10px; margin-left: 10px;"><div><br><div style="display: inline-block; float: right;"><button type="button" id="removeDiv" style="cursor: pointer; background-color: transparent; border: none; text-decoration: none;"><i class="fas fa-times"></i></button></div>' + addContent + '</div>' 
			               	).append(
			               		'<br><br>'		
			               	); // end append    
			                
			               /*  $('#removeDiv').on('click', function () { 
			                    $(this).parent().parent().parent().remove (); // remove the textbox
			                    $(this).next ().remove (); // remove the <br>
			                    $(this).remove (); // remove the button
			                }); */
			            }); // end click                                            
			        }); // end ready 
			        
			        $(document).on("click", "#removeDiv", function(){
			        	var removeThis = $("#removeDiv");
			      		var div_=$(this).closest('div#addDiv')
			      		$(div_).next().remove();
			      		$(div_).next().remove();
			      		$(div_).remove();
			        	
			        	//removeThis.parent().parent().parent().prev().remove (); // remove the textbox
			        	//removeThis.parent().parent().parent().remove (); // remove the textbox
			        	//removeThis.next().remove(); // remove the <br>
			        	//removeThis.remove (); // remove the button
			        
			        	//$(this).parent().parent().parent().prev().remove (); // remove the textbox
			        	//$(this).parent().parent().parent().remove (); // remove the textbox
	                    //$(this).next().remove (); // remove the <br>
	                    //$(this).remove (); // remove the button
			        });
			    </script> 
			    
				</div>  <!-- card my-4 end -->
	
			</div>  <!-- col-md-5 -->

		</div>
		<br><br>
		<div style="margin-right: auto; margin-left: auto; text-align: center;" class="col-12">
			<button type="submit" class="btn btn-dark">등록</button> &nbsp;&nbsp;
			<button type="button" class="btn btn-outline-dark" onclick="location.href='main.do';">취소</button>
		</div>
		<!-- /.row -->
		</form>
	</div>
	<!-- /.container -->
	
	
	<!----------------------------------------------------- 지도 modal ----------------------------------------------->
	
	<!-- 모달창 열기 -->
	<script>
		$("#addOpenBtn").click(function () {
			console.log('위치클릭');
			//$("#addModal").css('height','500px').css('width','800px');
			$("#addModal").modal('show');		
		});
	</script>
	
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<!-- <h5 class="modal-title" id="exampleModalLabel">Here is a modal</h5> -->
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- 지도api -->
					<div class="map_wrap">
						<div id="map"
							style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

						<div id="menu_wrap" class="bg_white">
							<div class="option">
								<div>
									<form onsubmit="searchPlaces(); return false;">
										키워드 : <input type="text" value="" id="keyword">
										<button type="submit">검색하기</button>
									</form>
								</div>
							</div>
							<hr>
							<ul id="placesList"></ul>
							<div id="pagination"></div>
						</div>
					</div>
					<!-- 지도api end -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" id="addSelectBtn">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<script>
		function insertValidate() {
			
			// 각각의 input 요소들 변수에 담아두기 
			var fileImg = $("#insertForm input[name=fileImg]");
			var content = $("#insertForm #content");
			
			console.log(content);

			// 값 다 있나 검사
			if(fileImg.val().trim() == ""){
				alert("이미지를 등록해주세요.");
				fileImg.focus();
				return false;
		/* 	}else if(content.val().trim() == ""){ */
			}else if(CKEDITOR.instances.content.getData() == ""){
				alert("내용을 입력해주세요");
				content.focus();
				return false;
			}

		}
		
	</script>


	<!------------------------------------- 지도api ----------------------------->
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ef4b8fd4aebaa69e9172f4cc49921ca&libraries=services"></script>
	<script>
		$("#addSelectBtn").click(function () {
			$('#addModal').modal("hide");
		});	
	</script>
	<script>
		var markers = [];
		var map;
		var mapContainer;
		
		$("#addModal").on('shown.bs.modal', function() {
			// 마커를 담을 배열입니다
			kakao.maps.disableHD();
			mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			map = new kakao.maps.Map(mapContainer, mapOption);

		});
			
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
			
		});

		
		// 키워드로 장소를 검색합니다
		searchPlaces();
		
		
		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				//alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);
				
				console.log(data);
				
				/* 해당 주소 가져오는 코드 */
				$("#placesList li").click(function () {
					$(this).css('background-color','#dee2e6');
					
					var add = $(this).children('.info').children().eq(1).text();
					
					console.log(this);
					console.log(add);
					$("#add").val(add);
				});
				

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
	</script>
	
	<script type="text/javascript">

		//id가 content인 태그에 ckeditor를 적용
		CKEDITOR.replace("content", {
			height:200,
			extraPlugins : 'confighelper',
		}); 
	
	
	</script>		
	
	<%@include file="../includes/footer.jsp" %>
	
</body>
</html>