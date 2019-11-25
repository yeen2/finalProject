<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#addSearch{width:100%; height:inherit; background:lightgray; border:2px solid white;}
	#addSearchImg{padding:10px 0 10px 10px; width:10%; height:auto; display:inline-block;}
	#addSearchImg img{width:50px; height:50px; border-radius:1.5em;}
	#addSearchNick{display:inline-block; width:50%;}
	#addSearchDate{display:inline-block; width:25%; text-align:right;}
	#addSearchCon{padding:10px 10px 10px 10px;}
	#fanAreaBtn:hover, #brandAreaBtn:hover, #hashtagAreaBtn:hover, #locationAreaBtn:hover{cursor:pointer}
	#fanAreaBtn, #brandAreaBtn, #hashtagAreaBtn, #locationAreaBtn{width:23%;}
	
	.addAlarm1{width:100%; height:inherit; background:rgba(0,0,0,0.05); border-top:1px solid lightgray; border-bottom:1px solid lightgray;}
	.addAlarmImg1{padding:10px 0 0 10px; width:17%; height:auto; display:inline-block;}
	.addAlarmImg1 img{width:50px; height:50px; border-radius:1.5em;}
	.addAlarmNick1{display:inline-block; width:50%; margin-left:10px;}
	.addAlarmDate1{display:inline-block; width:25%; text-align:right;}
	.addAlarmCon1{padding:10px 10px 10px 10px;}
	
	#imgH:hover{cursor:pointer; display:block;}
	#imgL:hover{cursor:pointer; display:block;}
	#abc div, #abc i{float:left;}
	#abc div{width:45px;}
	#abc i{line-height:30px; margin-right:5px;}
	#imgClick:hover{cursor:pointer;}
	
</style>
</head>
<body style="margin-top:300px;">
	<jsp:include page="../includes/header.jsp"/>
	<!-------------------------------------- 알림창 테스트 --------------------------------------->
	<!-------------------------------------- 알림창 테스트 --------------------------------------->
	<!-------------------------------------- 알림창 테스트 --------------------------------------->
	
	<!-- 알람창!!! -->
	<div>
	<li class="nav-item">
		<div style="position:relative;" id="display">
			<a class="nav-link" id="down" href="#"> 
				<i class="far fa-bell fa-lg" style="font-size: 25px;"></i>
			</a>
			<span id="count" class="badge badge-danger badge-pill" 
					style="display:none; pointer-events:none; position:absolute; bottom:19px; left:19px;"></span>
			
			<div style="position:absolute; width:400px; max-height:255px; background:white; display:block; box-shadow:0 5px 10px rgba(0, 0, 0, 0.5);
			overflow-y:auto; overflow-x:hidden; left:-175px; z-index:1000;" id="show" class="show">
				<div style="padding:10px 10px 10px 10px;" align="right">
					<a href="#" data-toggle="tooltip" data-placement="bottom" title="모두 읽음으로 표시"><i style="font-size:30px;" class="far fa-envelope-open"></i></a>
				</div>
				<div id="contentPlus">
					
				</div>
			    
			</div>
		</div>
	</li>
	</div>
	<!-------------------------------------- 알림창 테스트 --------------------------------------->
	<!-------------------------------------- 알림창 테스트 --------------------------------------->
	<!-------------------------------------- 알림창 테스트 --------------------------------------->
	
	
	<!-------------------------------------- 검색창 테스트 --------------------------------------->
	<!-------------------------------------- 검색창 테스트 --------------------------------------->
	<!-------------------------------------- 검색창 테스트 --------------------------------------->
	
	<form>
		<!-- 송신 메시지 작성하는 창 -->
		<input id="textMessage" type="text">
		<!-- 송신 버튼 -->
		<button id="sendMessage" type="button">전송</button>
	</form>
	<br><br><br>
	<div id="count">
	
	</div>
	
	<!-- 결과 메시지 보여주는 창 -->
	<textarea id="messageTextArea" rows="10" cols="50"></textarea>

	<div style="position:relative; margin-left:100px;" id="displaySearch">
		<button class="btn btn-warning dropdown-toggle" type="button" id="alarmBtn">
		    검색창 테스트
		</button>
		
		
		<!-------------------------------------- 알림창 테스트 --------------------------------------->
		
		<div style="position:absolute; top:45px; width:400px; max-height:255px;
					overflow-y:auto; overflow-x:hidden; background:lightgray; display:none; z-index:1000;" id="searchDiv">
			<div style="width:100%; height:40px;">
				<ul style="margin-right:20px;">
					<li class="btn btn-dark" id="fanAreaBtn">회원</li>
					<li class="btn btn-light" id="brandAreaBtn">브랜드</li>
					<li class="btn btn-light" id="hashtagAreaBtn">#태그</li>
					<li class="btn btn-light" id="locationAreaBtn">위치</li>
				</ul>
			</div>
			
		    <!-- 알림 추가될 때마다 div 추가 -->
		    <!-- 회원 추가 -->
		    <div id="fanArea" style="display:block;">
		    	
		    </div>
		    
		    <!-- 브랜드 추가 -->
		    <div id="brandArea" style="display:none;">
		    	
			</div>
			
			<!-- 해시태그 추가 -->
		    <div id="hashtagArea" style="display:none;">
	
		    </div>
		    
		    <!-- 위치 추가 -->
		    <div id="locationArea" style="display:none;">
		    
		    </div>
		    
		    
		</div>
		
	</div>
	<!-------------------------------------- 검색창 테스트 --------------------------------------->
	<!-------------------------------------- 검색창 테스트 --------------------------------------->
	<!-------------------------------------- 검색창 테스트 --------------------------------------->
	
	<!-- 포스팅리스트 -->
	<div class="col-12 col-md-4" style="position:relative;">
		<div id="imgH" class="square"
			style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/profile1.jpg');">
		</div>
		<div id="aaa" style="position:absolute; display:none; bottom:16px; width:350px; height:300px; background:rgba(0,0,0,0.6);">
			<div style="margin-left:48px; margin-top:135px; color:white; position:relative;">
				<div style="float:left;"><i class="fas fa-heart"></i></div>
				<div style="float:left; left:30px; position:absolute;">100</div>
				<div style="float:left; left:100px; position:absolute;"><i class="fas fa-thumbs-down"></i></div>
				<div style="float:left; left:130px; position:absolute;">400</div>
				<div style="float:left; left:200px; position:absolute;"><i class="fas fa-comment"></i></div>
				<div style="float:left; left:230px; position:absolute;">700</div>
			</div>
		</div>
	</div>
	<div class="col-12 col-md-4">
		<div class="square"
			style="background-image: url('resources/assets/img/profile2.jpg');">
		</div>
	</div>
	<div class="col-12 col-md-4">
		<div class="square"
			style="background-image: url('resources/assets/img/profile3.jpg');">
		</div>
	</div>
	<div class="col-12 col-md-4">
		<div class="square"
			style="background-image: url('resources/assets/img/profile4.jpg');">
		</div>
	</div>
	<div class="col-12 col-md-4">
		<div class="square"
			style="background-image: url('resources/assets/img/profile5.jpg');">
		</div>
	</div>
	<div class="col-12 col-md-4">
		<div class="square"
			style="background-image: url('resources/assets/img/profile6.jpg');">
		</div>
	</div>
	<!-- 포스팅리스트 -->
	
	<!-- 좋아요리스트 -->
	<div class="col-12 col-md-4">
		<div class="square imgL"
			style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/profile1.jpg');"></div>
		<div class="imgL" style="position:absolute; display:none; bottom:16px; width:350px; height:300px; background:rgba(0,0,0,0.6);">
			<div style="margin-left:48px; margin-top:135px; color:white; position:relative;">
				<div style="float:left;"><i class="fas fa-heart"></i></div>
				<div style="float:left; left:30px; position:absolute;">100</div>
				<div style="float:left; left:200px; position:absolute;"><i class="fas fa-comment"></i></div>
				<div style="float:left; left:230px; position:absolute;">700</div>
			</div>
		</div>
	</div>
	<div class="col-12 col-md-4">
		<div class="square"
			style="background-image: url('resources/assets/img/profile2.jpg');"></div>
	</div>
	<div class="col-12 col-md-4">
		<div class="square"
			style="background-image: url('resources/assets/img/profile3.jpg');"></div>
	</div>
	<div class="col-12 col-md-4">
		<div class="square"
			style="background-image: url('resources/assets/img/profile4.jpg');"></div>
	</div>
	<div class="col-12 col-md-4">
		<div class="square"
			style="background-image: url('resources/assets/img/profile5.jpg');"></div>
	</div>
	<div class="col-12 col-md-4">
		<div class="square"
			style="background-image: url('resources/assets/img/profile6.jpg');"></div>
	</div>
	<!-- 좋아요리스트 -->
	<script>
	
	$(function(){
		$("#alarmBtn").click(function(){
			if($("#alarmDiv").css("display") == "block"){
				$("#alarmDiv").css("display", "none");
			}else{
				$("#alarmDiv").css("display", "block");
			}
			
		});
		
	});
	
	</script>
	
	<!-- 검색창 스크립트 -->
	<script>
		$(function(){
			$("#nav_search").on("input", function(){
				var search = $("#nav_search").val();
				
				if(search != ""){
					$("#searchDiv").show();
					$.ajax({
						url:"mpSSearchFan.do",
						data:{search:search},
						dataType:"json",
						type:"post",
						success:function(list){
							$("#fanArea").html("");
							
							if(list == ""){
								var $fanNull = "<div id='addSearch'>"
										    	+"<div id='addSearchImg'>"
									    		+"<i class='fas fa-user-alt'></i>"
										    	+"</div>"
										    	+"<div id='addSearchNick'>"
									    		+"<p>검색 결과가 없습니다.</p>"
										    	+"</div>"
										    	+"</div>";
							    	
								$("#fanArea").append($fanNull);
							}else{
								$.each(list, function(index, value){
									var $fan = "<div id='addSearch' class='fanFan' value='" + value.mno + "'>"
										    	+"<div id='addSearchImg'>"
									    		+"<i class='fas fa-user-alt'></i>"
										    	+"</div>"
										    	+"<div id='addSearchNick'>"
									    		+"<p>" + value.nickName + "</p>"
										    	+"</div>"
										    	+"</div>";
										    	
									$("#fanArea").append($fan);
									
								});
							}
							
						},
						error:function(){
							console.log("ajax 통신 실패");
						}
					});
					
					$.ajax({
						url:"mpSSearchBrand.do",
						data:{search:search},
						dataType:"json",
						type:"post",
						success:function(list){
							$("#brandArea").html("");
							
							if(list == ""){
								var $brandNull = "<div id='addSearch'>"
										    	+"<div id='addSearchImg'>"
									    		+"<i class='fas fa-search'></i>"
										    	+"</div>"
										    	+"<div id='addSearchNick'>"
									    		+"<p>검색 결과가 없습니다.</p>"
										    	+"</div>"
										    	+"</div>";
						
								$("#brandArea").append($brandNull);
							}else{
								$.each(list, function(index, value){
									var $brand = "<div id='addSearch' class='brandBrand' value='" + value.pno + "'>"
										    	+"<div id='addSearchImg'>"
									    		+"<i class='fas fa-search'></i>"
										    	+"</div>"
										    	+"<div id='addSearchNick'>"
									    		+"<p>" + value.brand + "</p>"
										    	+"</div>"
										    	+"</div>";
									
									$("#brandArea").append($brand);
									
								});
							}
							
						},
						error:function(){
							console.log("ajax 통신 실패");
						}
					});
					
					$.ajax({
						url:"mpSSearchHashtag.do",
						data:{search:search},
						dataType:"json",
						type:"post",
						success:function(list){
							$("#hashtagArea").html("");
							
							if(list == ""){
								var $hashtagNull = "<div id='addSearch'>"
											    	+"<div id='addSearchImg'>"
										    		+"<i class='fas fa-hashtag'></i>"
											    	+"</div>"
											    	+"<div id='addSearchNick'>"
										    		+"<p>검색 결과가 없습니다.</p>"
											    	+"</div>"
											    	+"</div>";
							    	
									$("#hashtagArea").append($hashtagNull);
							}else{
								$.each(list, function(index, value){
									var $hashtag = "<div id='addSearch' class='hashHash' value='" + value.pno + "'>"
											    	+"<div id='addSearchImg'>"
										    		+"<i class='fas fa-hashtag'></i>"
											    	+"</div>"
											    	+"<div id='addSearchNick'>"
										    		+"<p>" + value.hashtag + "</p>"
											    	+"</div>"
											    	+"</div>";
											    	
									$("#hashtagArea").append($hashtag);
									
								});
							}
							
						},
						error:function(){
							console.log("ajax 통신 실패");
						}
					});

					$.ajax({
						url:"mpSSearchLoca.do",
						data:{search:search},
						dataType:"json",
						type:"post",
						success:function(list){
							$("#locationArea").html("");
							
							if(list == ""){
								var $locationNull = "<div id='addSearch'>"
											    	+"<div id='addSearchImg'>"
										    		+"<i class='fas fa-map-marker-alt'></i>"
											    	+"</div>"
											    	+"<div id='addSearchNick'>"
										    		+"<p>검색 결과가 없습니다.</p>"
											    	+"</div>"
												    +"</div>";
								    
								$("#locationArea").append($locationNull);
							}else{
								$.each(list, function(index, value){
									var $location = "<div id='addSearch' class='locaLoca' value='" + value.pno + "'>"
											    	+"<div id='addSearchImg'>"
										    		+"<i class='fas fa-map-marker-alt'></i>"
											    	+"</div>"
											    	+"<div id='addSearchNick'>"
										    		+"<p>" + value.location + "</p>"
											    	+"</div>"
												    +"</div>";
												    
									$("#locationArea").append($location);
									
								});
							}
							
						},
						error:function(){
							console.log("ajax 통신 실패");
						}
					});
				}else{
					$("#searchDiv").hide();
					
				}
				
			});
			
			
			// 검색 메뉴 클릭 시
			$("#fanAreaBtn").click(function(){
				$("#fanArea").show();
				$("#fanAreaBtn").attr("class","btn btn-dark");
				$("#brandArea").hide();
				$("#brandAreaBtn").attr("class","btn btn-light");
				$("#hashtagArea").hide();
				$("#hashtagAreaBtn").attr("class","btn btn-light");
				$("#locationArea").hide();
				$("#locationAreaBtn").attr("class","btn btn-light");
			});
			$("#brandAreaBtn").click(function(){
				$("#fanArea").hide();
				$("#fanAreaBtn").attr("class","btn btn-light");
				$("#brandArea").show();
				$("#brandAreaBtn").attr("class","btn btn-dark");
				$("#hashtagArea").hide();
				$("#hashtagAreaBtn").attr("class","btn btn-light");
				$("#locationArea").hide();
				$("#locationAreaBtn").attr("class","btn btn-light");
			});
			$("#hashtagAreaBtn").click(function(){
				$("#fanArea").hide();
				$("#fanAreaBtn").attr("class","btn btn-light");
				$("#brandArea").hide();
				$("#brandAreaBtn").attr("class","btn btn-light");
				$("#hashtagArea").show();
				$("#hashtagAreaBtn").attr("class","btn btn-dark");
				$("#locationArea").hide();
				$("#locationAreaBtn").attr("class","btn btn-light");
			});
			$("#locationAreaBtn").click(function(){
				$("#fanArea").hide();
				$("#fanAreaBtn").attr("class","btn btn-light");
				$("#brandArea").hide();
				$("#brandAreaBtn").attr("class","btn btn-light");
				$("#hashtagArea").hide();
				$("#hashtagAreaBtn").attr("class","btn btn-light");
				$("#locationArea").show();
				$("#locationAreaBtn").attr("class","btn btn-dark");
			});
			
			// 검색 결과 뷰 영역 외 클릭 시
			$("html").click(function(e){
				if($("#searchDiv").css("display") == "block"){
					if(!$("#displaySearch").has(e.target).length){
						$("#searchDiv").hide();
					}
				}
			});
			
			// 검색 결과 클릭 시 페이지 이동
			$(document).ready(function(){
				$(document).on("click", ".fanFan", function(){
					location.href="mpViewProfile.do?mno=" + $(this).attr("value");
				});
				$(document).on("click", ".brandBrand", function(){
					
				});
				$(document).on("click", ".hashHash", function(){
					
				});
				$(document).on("click", ".locaLoca", function(){
					
				});
					
			});
			
		});
	</script>
	
	
	<!-- 알림창 스크립트 -->
	<script>
	/*
		$(function(){
			if(${ !empty loginUser }){
				alarmCheck();
				
				setInterval(function(){
					alarmCheck();
				}, 5000);
				
			}
		});
		
		function alarmCheck(){
			$.ajax({
				url:"mpSAlarmCount.do",
				dataType:"json",
				success:function(result){
					if(result > 0){
						$("#count").css("display", "block");
						$("#count").html("");
						$("#count").append(result);
					}else{
						$("#count").css("display", "none");
					}
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
				
			});
			
			$.ajax({
				url:"mpSAlarmList.do",
				dataType:"json",
				success:function(list){
					$("#contentPlus").html("");
					
					$.each(list, function(index, value){
						var $add = "<a class='dropdown-item' href='#'>"
			    				+ "<div id='addAlarm1'>"
			    				+ "<div id='addAlarmImg1'>"
			    				+ "<img src='resources/assets/img/lorde.png'>"
			    				+ "</div>"
			    				+ "<div id='addAlarmNick1'>"
			    				+ "<p>닉네임</p>"
			    				+ "</div>"
			    				+ "<div id='addAlarmDate1'>"
			    				+ "<p>320일전</p>"
			    				+ "</div>"
			    				+ "<div id='addAlarmCon1'>"
			    				+ "<p>~~~님이 팬이 되었습니다.</p>"
			    				+ "</div>"
			    				+ "</div>"
			    				+ "</a>";
			    		
			    		$("#contentPlus").append($add);
						
					});
						
				},
				error:function(){
					console.log("실패");
				}
				
			});
		}
		
		$("#down").on("click", function(){
			if($("#show").css("display") == "block"){
				$("#show").hide();
				
			}else{
				$("#show").show();
			}
				
			if(${ empty loginUser}){
				$("#show").html("");
				
				var $add = "<div style='padding:20px 10px 10px 10px'>"
    				+ "로그인 후 이용해주세요"
    				+ "</div>";
    		
    			$("#show").append($add);
			}
		});
		
		$("html").click(function(e){
			if($("#show").css("display") == "block"){
				if(!$("#display").has(e.target).length){
					$("#show").hide();
				}
			}
		});
		*/
		
	</script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"></script>
	<script type="text/javascript">
		var sock = null;
		var mno = ${loginUser.mno};
	    $(document).ready(function() {
	        sock = new SockJS("/styleblending/count");
	        
	        // 연결 성공
	        sock.onopen = function() {
	        	console.log("연결 성공");
	        	sock.send(mno);
	        }
	        // 연결 해제
	        sock.onclose = function() {
	        	console.log("연결 해제");
	        }
	        // 메세지 보내고 받을 때
	        sock.onmessage = function(evt) {
	        	var alarmCountNo = 0;
	            var json = evt.data;
	            
	            var obj = JSON.parse(json);
	            console.log(obj);
	            
	            if(obj != ""){
	            	for(var i=0; i<obj.length; i++){
		            	alarmCountNo = obj[i].alarmCount;
		            	console.log(alarmCountNo);
		            	
		            	var $add = "<a class='dropdown-item' href='#'>"
			    				+ "<div class='addAlarm1'>"
			    				+ "<div class='addAlarmImg1'>"
			    				+ "<img src='resources/upload/member/" + obj[i].renameImg + "'>"
			    				+ "</div>"
			    				+ "<div class='addAlarmNick1'>"
			    				+ "<p>" + obj[i].nickName + "</p>"
			    				+ "</div>"
			    				+ "<div class='addAlarmDate1'>"
			    				+ "<p>" + obj[i].enrollDate + "</p>"
			    				+ "</div>"
			    				+ "<div class='addAlarmCon1'>"
			    				+ "<p>" + obj[i].nickName + "님이 팬이 되었습니다.</p>"
			    				+ "</div>"
			    				+ "</div>"
			    				+ "</a>";
		    		
		    			$("#contentPlus").append($add);
		    			
		            }
	            }else{
	            	$("#show").html("");
					
					var $add = "<div style='padding:20px 10px 10px 10px' align='center'>"
	    				+ "<p><span class='text-danger'><i class='far fa-frown-open'></i></span> 알림이 없습니다.</p>"
	    				+ "</div>";
	    		
	    			$("#show").append($add);
	            }
	            
	            
	            if(alarmCountNo != 0){
	            	$("#count").css("display", "block");
					$("#count").html("");
					$("#count").append(alarmCountNo);
	            }
	            
	        }
		    
		});
	    
	    $("#down").on("click", function(){
			if($("#show").css("display") == "block"){
				$("#show").hide();
				
			}else{
				$("#show").show();
			}
				
			if(${ empty loginUser}){
				$("#show").html("");
				
				var $add = "<div style='padding:20px 10px 10px 10px' align='center'>"
					+ "<p><span class='text-danger'></span>로그인 후 이용해주세요.</p>"
    				+ "<button class='btn btn-dark' id='alarmLogin'>로그인</button>"
    				+ "</div>";
    		
    			$("#show").append($add);
			}
		});
		
		$("html").click(function(e){
			if($("#show").css("display") == "block"){
				if(!$("#display").has(e.target).length){
					$("#show").hide();
				}
			}
		});
		
		$(document).on("click", "#alarmLogin", function(){
			location.href="loginForm.do";
		});
	
		
	</script>
	
	
</body>
</html>