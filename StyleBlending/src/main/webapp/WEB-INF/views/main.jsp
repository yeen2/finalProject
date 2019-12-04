<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
 <!--  -->
<head>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script async src="https://www.youtube.com/iframe_api"></script>

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
@media ( min-aspect-ratio : 16/9) {
   .video-foreground {
      height: 300%;
      top: -100%;
   }
}

@media ( max-aspect-ratio : 16/9) {
   .video-foreground {
      width: 300%;
      left: -100%;
   }
}

border:none;

}
h1 {
   color: white;
}

@charset "EUC-KR";

@import url(https://fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(https://fonts.googleapis.com/earlyaccess/nanumgothic.css);
/* /* p{
      font-family: 'Jeju Gothic';
   } */
p {
   font-family: 'Jeju Gothic';
   font-size: 18px;
}

body {
   font-family: 'Nanum Gothic';
}

p {
   margin: 0px;
}

li {
   font-weight: bold;
}

#aDrop:hover {
   cursor: pointer;
}

.imggg {
   background-size: cover;
   background-position: center center;
}

.card-caption {
   display: block;
   position: absolute;
   bottom: 0;
   left: 5px;
   right: 5px;
   color: #fff;
   background-color: rgba(0, 0, 0, .5);
}

.pop-user-card .pop-rank {
   line-height: 41px;
   font-size: 30px;
   padding: 7px 12px 6px;
}

.pop-user-card .photographer {
   padding-top: 7px;
   padding-bottom: 7px;
   line-height: 20px;
   font-size: 14px;
}

.card-body img:hover {
   transform: scale(1.5);
   transition: transform .5s;
}

.card-body img {
   transform: scale(1.0);
   transition: transform .5s;
}

.block {
   border: 0px solid #d81f25;
   padding: 0 5px;
   height: 20px;
   overflow: hidden;
   background: #fff;
   width: 100px;
   font-family: Gulim;
   font-size: 12px;
}
	
.block, #ticker, #ticker2, .block li {
   margin: 0;
   padding: 0;
   list-style: none;
}

.block li a {
   display: block;
   height: 20px;
   line-height: 20px;
   color: #555;
   text-decoration: none;
   font-size: large;
}

.block li span {
   padding: 3px 5px;
   background: black;
   color: #fff;
   font-weight: bold;
   margin-right: 3px;
}

#player:hover {
   width: 1000px;
   height: 1000px;
}
a{
 cursor:pointer;
}
</style>
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<script type="text/javascript" src="resources/js/typeit.min.js"></script>
   
<body class="index">
   <jsp:include page="includes/header.jsp" />
   
   
   
   <div id="filter-drop"
      style="width: 100%; height: 50px; margin-top: 90px;"></div>
   <div class="container eee" style="margin-top: 18px;">


      <!-- <figure id="banner" style="margin-top: 0px; height:230px;">
       -->
      <div style="padding: 0px; height: 230px;" class="form-inline">
         <div class="form-group col-9" style="padding: 0px;">
            <img style="width: 820px; height: 230px;"
               src="${pageContext.request.contextPath}/resources/assets/img/배너삼.jpg">
         </div>
         <div class="form-group col-2 block"
            style="margin-bottom: 191px; position: relative;">
            <ul id="ticker" style="height: 230px">

            </ul>
            <ul id="ticker2" style="height: 230px">
               <li
                  style="font-family: Gulim; font-size: large; margin-bottom: 10px;"><i
                  class="fa fa-search"></i>&nbsp;급상승 검색어</li>
            </ul>


         </div>
         
          <div id="player"
            style="z-index:1; position:absolute;margin-left: 840px; width:270px; height: 190px; margin-top: 15px;">
         </div> 
         
         <div class="form-group col-1" style="margin-bottom: 191px">
            <a href="" id="aDrop"><i class="fa fa-chevron-down"
               style="color: black;"></i></a>
         </div>

      </div>

<script>
   

   $(function(){
      topFour();
   });
   function topFour(){
      
      var $fourWrap = $("#fourWrap");
      
      $.ajax({
         url:"mainFourWrap.do",
         dataType:"json",
         async:false,	
         success:function(data){
            console.log("성공 topFour");
            $.each(data,function(index, value){
               
               var $input =
                        "<div class='col-3'>" +
                        "<div class='component'>" +
                        "<div class='card' style='overflow:hidden;'>" +
                        "<div class='card-body' style='height: 400px; padding: 0px;'>" +
                        "<a class='btn' href='pInfo.do?id="+value.pno+"' style='margin:0px; padding:0px; width:100%;'>"+
                        "<img class='card-img' src='${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' style='height:100%'>"+
                        "</a>"+
                        "<div>"+
                        "<div class='card-footer' style='padding:0px;'>" +
                        "<figcaption class='card-caption form-inline' style='left:0px; right:0px;'>"+
                        "<b class='pop-rank pull-left'style='line-height: 41px; font-size: 30px; padding: 7px 12px 6px;'>"+(index+1)+"st"+"</b>" +
                        "<div class='photographer'style='padding-top: 7px; padding-bottom: 7px; line-height: 20px; font-size: 14px;'>"+
                        "Inspired by"+
                        "<b>StyleBlending</b>"+
                        "</div>"+
                        "</figcaption>"+
                        "</div>"+
                        "</div>"+
                        "</div>"+
                        "</div>";
                        
                        $fourWrap.append($input);
            
            });
         //   $fourWrap.append($inputWrap);
         },
         error:function(){
            console.log("실패");
         
         }
         
      });
   }
   //좋아요 카운트 증가 script
    function like(a){
      var likePno = $(a).children().eq(1).val();
      var likeMno = $(a).children().eq(2).val();
      var likeColor = $(a).children().eq(0);
      //console.log(likePno);
      var mno = "${loginUser.mno}";
      console.log(mno);
      console.log(likeColor);
      console.log(likeColor.css('color'));
      if(likeColor.css('color') == 'rgb(128, 128, 128)'){
         $.ajax({
            url:"pLikeInsert.do",
            data:{pno:likePno, mno:mno},
            type:"get",
            success:function(data){
               
               if(data == 'success'){
               console.log("좋아요성공");
               sock.send(likePno);
               postList();
                  
               }else{
                  console.log("실패");
               }
               
            },
            error:function(){
               console.log("좋아요실패");   
            }
         });         
      }else{
         $.ajax({
            url:"pLikeDelete.do",
            data:{pno:likePno, mno:mno},
            type:"get",
            success:function(data){
               if(data == 'success'){
                  console.log("좋아요삭제 성공");
                  postList();
                  
               }
            },
            error:function(){
               console.log("실패")
            }
         });
         
      }

   }
    function filterLike(a){
      var likePno = $(a).children().eq(1).val();
      var likeMno = $(a).children().eq(2).val();
      var likeColor = $(a).children().eq(0);
      //console.log(likePno);
      var mno = "${loginUser.mno}";
      console.log(mno);
      console.log(likeColor);
      console.log(likeColor.css('color'));
      if(likeColor.css('color') == 'rgb(128, 128, 128)'){
         $.ajax({
            url:"pLikeInsert.do",
            data:{pno:likePno, mno:mno},
            type:"get",
            success:function(data){
               
               if(data == 'success'){
               console.log("좋아요성공");
               select(); 
               sock.send(likePno);
                  
               }else{
                  console.log("실패");
               }
               
            },
            error:function(){
               console.log("좋아요실패");   
            }
         });         
      }else{
         $.ajax({
            url:"pLikeDelete.do",
            data:{pno:likePno, mno:mno},
            type:"get",
            success:function(data){
               if(data == 'success'){
                  console.log("좋아요삭제 성공");
                   select(); 
				   console.log('push');
                  
               }
            },
            error:function(){
               console.log("실패")
            }
         });
         
      }

   }
    //친구 삭제
    function deleteFan(a){
    	 console.log(a);
         var youNo = $(a).children().eq(1).val(); // 하는 사람이 youNo
         var meNo = $(a).children().eq(0).val(); //당하는 사람이 meNo
        
           $.ajax({
              url:"mpDeleteFan.do",
              data:{meNo:meNo, youNo:youNo},
              type:"get",
              success:function(data){
                 
                 if(data == 1){
                 console.log("친구삭제 성공");
                 postList(); 
                    
                 }else{
                    console.log("실패");
                 }
                 
              },
              error:function(){
                 console.log("좋아요실패");   
              }
           });
        
        
      }
    //친구 추가
    function insertFan(a){
       
       console.log(a);
       var youNo = $(a).children().eq(1).val(); // 하는 사람이 youNo
       var meNo = $(a).children().eq(0).val(); //당하는 사람이 meNo
      if($(a).attr('class','btn btn-light')){
         $.ajax({
            url:"mpInsertFan.do",
            data:{meNo:meNo, youNo:youNo},
            type:"get",
            success:function(data){
               
               if(data == 1){
               console.log("친구추가 성공");
               postList(); 
               sock.send(meNo);
               
                  
               }else{
                  console.log("실패");
               }
               
            },
            error:function(){
               console.log("좋아요실패");   
            }
         });
      
      }
    }
    
    function filterDeleteFan(a){
    	 console.log(a);
         var youNo = $(a).children().eq(1).val(); // 하는 사람이 youNo
         var meNo = $(a).children().eq(0).val(); //당하는 사람이 meNo
        
           $.ajax({
              url:"mpDeleteFan.do",
              data:{meNo:meNo, youNo:youNo},
              type:"get",
              success:function(data){
                 
                 if(data == 1){
                 console.log("친구삭제 성공");
                 select(); 
                    
                 }else{
                    console.log("실패");
                 }
                 
              },
              error:function(){
                 console.log("좋아요실패");   
              }
           });
        
        
      }
    //친구 추가
    function filterInsertFan(a){
       
       console.log(a);
       var youNo = $(a).children().eq(1).val(); // 하는 사람이 youNo
       var meNo = $(a).children().eq(0).val(); //당하는 사람이 meNo
      if($(a).attr('class','btn btn-light')){
         $.ajax({
            url:"mpInsertFan.do",
            data:{meNo:meNo, youNo:youNo},
            type:"get",
            success:function(data){
               
               if(data == 1){
               console.log("친구추가 성공");
               select(); 
               sock.send(meNo);
               }else{
                  console.log("실패");
               }
               
            },
            error:function(){
               console.log("좋아요실패");   
            }
         });
      
      }
    }
    
    function deleteFan(a){
    	 console.log(a);
         var youNo = $(a).children().eq(1).val(); // 하는 사람이 youNo
         var meNo = $(a).children().eq(0).val(); //당하는 사람이 meNo
        
           $.ajax({
              url:"mpDeleteFan.do",
              data:{meNo:meNo, youNo:youNo},
              type:"get",
              success:function(data){
                 
                 if(data == 1){
                 console.log("친구삭제 성공");
                 postList(); 
                    
                 }else{
                    console.log("실패");
                 }
                 
              },
              error:function(){
                 console.log("좋아요실패");   
              }
           });
        
        
      }
    //친구 추가
    function insertFan(a){
       
       console.log(a);
       var youNo = $(a).children().eq(1).val(); // 하는 사람이 youNo
       var meNo = $(a).children().eq(0).val(); //당하는 사람이 meNo
      if($(a).attr('class','btn btn-light')){
         $.ajax({
            url:"mpInsertFan.do",
            data:{meNo:meNo, youNo:youNo},
            type:"get",
            success:function(data){
               
               if(data == 1){
               console.log("친구추가 성공");
               postList(); 
               sock.send(meNo);
               }else{
                  console.log("실패");
               }
               
            },
            error:function(){
               console.log("좋아요실패");   
            }
         });
      
      }
    }
    
    //비로그인 좋아요 클릭할경우
   function unLike(){
      alert('로그인 후 좋아요 클릭 가능합니다.');
      return;
   }
    
   function unFan(){
	      alert('로그인 후 친구추가 클릭 가능합니다.');
	      return;
	   }
    //메인 고정 9개 포스팅 불러오는 ajax
   $(function(){
      postList();
   })
   
   function postList(){
      
      var $inputWrap = $("#inputWrap");
      //$("#fourWrap").append($inputWrap);
      
      $.ajax({
         url:"mainPostList.do",
         dataType:"json",
         success:function(data){
            console.log("성공 PostList");
            $inputWrap.children().remove();
            $.each(data,function(index, value){
               var $input;
               var loginUser = "${loginUser.mno}";
               if(loginUser == null || loginUser == ""){
                  $input = "<div class='col-md-4 mt-3'>"+
                   "<div class='component'>"+ 
                   "<div class='card' style='overflow:hidden;'>"+
                   "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                   "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                   "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                   "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                   "</a>"+
                   "</div>"+
                   "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                   "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                   "</div>"+
                   "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                   "<a class='btn btn-light' onclick=unFan(); style='cursor:pointer;'>"+
                    "<span style='font-size: 1.2em'>+Fan</span>"+
                   "</a>"+
                   "</div>"+
                   "</div>"+
                   "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                   "<a href='pInfo.do?id="+value.pno+" 'style='border-bottom: 0px !important; text-decoration: none black;'>"+
                   "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                   "</a>"+
                   "</div>"+
                   "<div class='card-footer row'>"+
                   "<div class='col-3 form-inline' style='padding:0px; margin-left:10px;'>"+
                   "<a onclick=unLike(); style='cursor:pointer;'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i></a>"+
                   "<p style='margin: 0px;margin-left:9px;'>"+value.likeCount+"</p>"+
                   "</div>"+
                   "<div class='col-3 form-inline' style='padding: 0px;'>"+
                   "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                   "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                   "</div>"+
                   "</div>"+
                   "</div>"+
                   "</div>"+
                   "</div>"; 
                  
               }else {
            	   if((value.loginLike == 0 && value.fanCheck == 0) && ("${loginUser.mno}" == value.mno)){
                  	 $input = "<div class='col-md-4 mt-3'>"+
                       "<div class='component'>"+ 
                       "<div class='card' style='overflow:hidden;'>"+
                       "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                       "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                       "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                       "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                       "</a>"+
                       "</div>"+
                       "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                       "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                       "</div>"+
                       "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                       "<a class='btn btn-dark'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                       "<span style='font-size: 1.2em;color:white;'>My</span>"+
                      "</a>"+
                      "</div>"+
                       "</div>"+
                       "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                       "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                       "<img class='card-img' src='${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                       "</a>"+
                       "</div>"+
                       "<div class='card-footer row'>"+
                       "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                       "<a onclick='like(this);'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                       "<p style='margin: 0px; margin-left:9px;'value="+value.pno+">"+value.likeCount+"</p>"+
                       "</div>"+
                       "<div class='col-3 form-inline' style='padding: 0px;'>"+
                       "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                       "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                       "</div>"+
                       "</div>"+
                       "</div>"+
                       "</div>"+
                       "</div>";
                       
                  }else if((value.loginLike == 1 && value.fanCheck == 0) && ("${loginUser.mno}" == value.mno)){
                  
                  	$input = "<div class='col-md-4 mt-3'>"+
                      "<div class='component'>"+ 
                      "<div class='card' style='overflow:hidden;'>"+
                      "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                      "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                      "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                      "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                      "</a>"+
                      "</div>"+
                      "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                      "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                      "</div>"+
                      "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                      "<a class='btn btn-dark'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                      "<span style='font-size: 1.2em;color:white;'>My</span>"+
                     "</a>"+
                     "</div>"+
                      "</div>"+
                      "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                      "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                      "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                      "</a>"+
                      "</div>"+
                      "<div class='card-footer row'>"+
                      "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                      "<a onclick='like(this);'><i class='fa fa-heart'style='color: red; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                      "<p style='margin: 0px; margin-left:9px;'value="+value.pno+">"+value.likeCount+"</p>"+
                      "</div>"+
                      "<div class='col-3 form-inline' style='padding: 0px;'>"+
                      "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                      "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                      "</div>"+
                      "</div>"+
                      "</div>"+
                      "</div>"+
                      "</div>";
               
                  }else if(value.loginLike == 0 && value.fanCheck == 0){ //조아요 안함 //펜x 
                	   console.log("좋X팬X");
                      $input = "<div class='col-md-4 mt-3'>"+
                      "<div class='component'>"+ 
                      "<div class='card' style='overflow:hidden;'>"+
                      "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                      "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                      "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                      "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                      "</a>"+
                      "</div>"+
                      "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                      "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                      "</div>"+
                      "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                      "<a class='btn btn-light' onclick='insertFan(this);'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                       "<span style='font-size: 1.2em'>+Fan</span>"+
                      "</a>"+
                      "</div>"+
                      "</div>"+
                      "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                      "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                      "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                       "</a>"+
                      "</div>"+
                      "<div class='card-footer row'>"+
                      "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                      "<a onclick='like(this);'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                      "<p style='margin: 0px; margin-left:9px;'value="+value.pno+">"+value.likeCount+"</p>"+
                      "</div>"+
                      "<div class='col-3 form-inline' style='padding: 0px;'>"+
                      "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                      "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                      "</div>"+
                      "</div>"+
                      "</div>"+
                      "</div>"+
                      "</div>";
                      
                   }else if(value.loginLike == 1 && value.fanCheck == 0){
                	   console.log("좋O팬X");
                      $input = "<div class='col-md-4 mt-3'>"+
                      "<div class='component'>"+ 
                      "<div class='card' style='overflow:hidden;'>"+
                      "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                      "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                      "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                      "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                      "</a>"+
                      "</div>"+
                      "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                      "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                      "</div>"+
                      "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                      "<a class='btn btn-light' onclick='insertFan(this);'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                      "<span style='font-size: 1.2em'>+Fan</span>"+
                      "</a>"+
                      "</div>"+
                      "</div>"+
                      "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                      "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                      "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                      "</a>"+
                      "</div>"+
                      "<div class='card-footer row'>"+
                      "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                      "<a onclick='like(this);'><i class='fa fa-heart'style='color: red; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                      "<p style='margin: 0px; margin-left:9px;'value="+value.pno+">"+value.likeCount+"</p>"+
                      "</div>"+
                      "<div class='col-3 form-inline' style='padding: 0px;'>"+
                      "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                      "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                      "</div>"+
                      "</div>"+
                      "</div>"+
                      "</div>"+
                      "</div>";
                   }else if(value.loginLike == 0 && value.fanCheck == 1){
                	   console.log("좋X팬O");
                       $input = "<div class='col-md-4 mt-3'>"+
                       "<div class='component'>"+ 
                       "<div class='card' style='overflow:hidden;'>"+
                       "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                       "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                       "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                       "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                       "</a>"+
                       "</div>"+
                       "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                       "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                       "</div>"+
                       "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                       "<a class='btn' onclick='deleteFan(this);' style='cursor:pointer;'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                       "<i class='fa fa-check'style='font-size:30px;'></i>"+
                       "</a>"+
                       "</div>"+
                       "</div>"+
                       "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                       "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                       "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                       "</a>"+
                       "</div>"+
                       "<div class='card-footer row'>"+
                       "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                       "<a onclick='like(this);'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                       "<p style='margin: 0px; margin-left:9px;'value="+value.pno+">"+value.likeCount+"</p>"+
                       "</div>"+
                       "<div class='col-3 form-inline' style='padding: 0px;'>"+
                       "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                       "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                       "</div>"+
                       "</div>"+
                       "</div>"+
                       "</div>"+
                       "</div>";
                   }else{
                	   console.log("좋O팬O");
                       $input = "<div class='col-md-4 mt-3'>"+
                       "<div class='component'>"+ 
                       "<div class='card' style='overflow:hidden;'>"+
                       "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                       "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                       "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                       "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                       "</a>"+
                       "</div>"+
                       "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                       "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                       "</div>"+
                       "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                       "<a class='btn btn-black' onclick='deleteFan(this);'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                       "<i class='fa fa-check'style='font-size:30px;'></i>"+
                       "</a>"+
                       "</div>"+
                       "</div>"+
                       "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                       "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                       "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                       "</a>"+
                       "</div>"+
                       "<div class='card-footer row'>"+
                       "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                       "<a onclick='like(this);'><i class='fa fa-heart'style='color: red; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                       "<p style='margin: 0px; margin-left:9px;'value="+value.pno+">"+value.likeCount+"</p>"+
                       "</div>"+
                       "<div class='col-3 form-inline' style='padding: 0px;'>"+
                       "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                       "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                       "</div>"+
                       "</div>"+
                       "</div>"+
                       "</div>"+
                       "</div>";
                   }

                
               
               }
               
                   $inputWrap.append($input);
                   //$("#fourWrap").append($inputWrap);
                   //$("#fourWrap").append($input);
            });
            $("#fourWrap").append($inputWrap);
         },
         error:function(){
            console.log("실패");
         
         }
         
      });
   }
    
         
</script>

		<div class="row" style="margin-top: 1rem !important" id="fourWrap">
			<div class="row mt-3" id="inputWrap">
			</div>
		</div>
	</div>
   <script>
      var page = 2;
      var flag = 0;

      $(window).scroll(
            function() {
               console.log(sel);
               console.log($(window).scrollTop());
               console.log($(document).height());
               console.log($(window).height());

               
               var height = $(window).height() - 702;
               if ($(window).scrollTop() == height&& sel == null && $(document).height() != 5073){
                  
                  console.log(++page);
                  
                  var $inputWrap = $("#inputWrap");
                  
                  var $input;
                  $.ajax({   
                     url:"mainInfinityScroll.do",
                     dataType:"json",
                     success:function(data){
                        console.log("성공 infinitylist");
                        $.each(data,function(index, value){
                           var $input;
                           var loginUser = "${loginUser.mno}";
                           if(loginUser == null || loginUser == ""){
                               $input = "<div class='col-md-4 mt-3'>"+
                                "<div class='component'>"+ 
                                "<div class='card' style='overflow:hidden;'>"+
                                "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                                "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                                "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                                "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                                "</a>"+
                                "</div>"+
                                "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                                "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                                "</div>"+
                                "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                                "<a class='btn btn-light' onclick=unFan(); style='cursor:pointer;'>"+
                                 "<span style='font-size: 1.2em'>+Fan</span>"+
                                "</a>"+
                                "</div>"+
                                "</div>"+
                                "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                                "<a href='pInfo.do?id="+value.pno+" 'style='border-bottom: 0px !important; text-decoration: none black;'>"+
                                "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                                "</a>"+
                                "</div>"+
                                "<div class='card-footer row'>"+
                                "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                                "<a onclick=unLike(); style='cursor:pointer;'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i></a>"+
                                "<p style='margin: 0px;margin-left:9px;'>"+value.likeCount+"</p>"+
                                "</div>"+
                                "<div class='col-3 form-inline' style='padding: 0px;'>"+
                                "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                                "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                                "</div>"+
                                "</div>"+
                                "</div>"+
                                "</div>"+
                                "</div>"; 
                               
                            }else{
                            	   if((value.loginLike == 0 && value.fanCheck == 0) && ("${loginUser.mno}" == value.mno)){
                                    	 $input = "<div class='col-md-4 mt-3'>"+
                                         "<div class='component'>"+ 
                                         "<div class='card' style='overflow:hidden;'>"+
                                         "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                                         "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                                         "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                                         "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                                         "</a>"+
                                         "</div>"+
                                         "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                                         "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                                         "</div>"+
                                         "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                                         "<a class='btn btn-dark'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                                         "<span style='font-size: 1.2em;color:white;' >My</span>"+
                                        "</a>"+
                                        "</div>"+
                                         "</div>"+
                                         "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                                         "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                                         "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                                         "</a>"+
                                         "</div>"+
                                         "<div class='card-footer row'>"+
                                         "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                                         "<a onclick='like(this);'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                                         "<p style='margin: 0px; margin-left:9px;'value="+value.pno+">"+value.likeCount+"</p>"+
                                         "</div>"+
                                         "<div class='col-3 form-inline' style='padding: 0px;'>"+
                                         "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                                         "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                                         "</div>"+
                                         "</div>"+
                                         "</div>"+
                                         "</div>"+
                                         "</div>";
                                    	     
                                    }else if((value.loginLike == 1 && value.fanCheck == 0) && ("${loginUser.mno}" == value.mno)){
                                    
                                    	$input = "<div class='col-md-4 mt-3'>"+
                                        "<div class='component'>"+ 
                                        "<div class='card' style='overflow:hidden;'>"+
                                        "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                                        "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                                        "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                                        "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                                        "</a>"+
                                        "</div>"+
                                        "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                                        "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                                        "</div>"+
                                        "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                                        "<a class='btn btn-dark'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                                        "<span style='font-size: 1.2em;color:white;' >My</span>"+
                                       "</a>"+
                                        "</div>"+
                                        "</div>"+
                                        "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                                        "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                                        "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                                        "</a>"+
                                        "</div>"+
                                        "<div class='card-footer row'>"+
                                        "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                                        "<a onclick='like(this);'><i class='fa fa-heart'style='color: red; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                                        "<p style='margin: 0px;margin-left:9px;'>"+value.likeCount+"</p>"+
                                        "</div>"+
                                        "<div class='col-3 form-inline' style='padding: 0px;'>"+
                                        "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                                        "<p style='margin-left:9px;margin: 0px;'>"+value.replyCount+"</p>"+
                                        "</div>"+
                                        "</div>"+
                                        "</div>"+
                                        "</div>"+
                                        "</div>";
                                 
                                    }
                            
                            else if(value.loginLike == 0 && value.fanCheck == 0){ //조아요 안함 //펜x 
                             	   console.log("좋X팬X");
                                   $input = "<div class='col-md-4 mt-3'>"+
                                   "<div class='component'>"+ 
                                   "<div class='card' style='overflow:hidden;'>"+
                                   "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                                   "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                                   "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                                   "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                                   "</a>"+
                                   "</div>"+
                                   "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                                   "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                                   "</div>"+
                                   "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                                   "<a class='btn btn-light' onclick='insertFan(this);'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                                    "<span style='font-size: 1.2em'>+Fan</span>"+
                                   "</a>"+
                                   "</div>"+
                                   "</div>"+
                                   "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                                   "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                                   "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                                   "</a>"+
                                   "</div>"+
                                   "<div class='card-footer row'>"+
                                   "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                                   "<a onclick='like(this);'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                                   "<p style='margin: 0px; margin-left:9px;'value="+value.pno+">"+value.likeCount+"</p>"+
                                   "</div>"+
                                   "<div class='col-3 form-inline' style='padding: 0px;'>"+
                                   "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                                   "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                                   "</div>"+
                                   "</div>"+
                                   "</div>"+
                                   "</div>"+
                                   "</div>";
                                   
                                }else if(value.loginLike == 1 && value.fanCheck == 0){
                             	   console.log("좋O팬X");
                                   $input = "<div class='col-md-4 mt-3'>"+
                                   "<div class='component'>"+ 
                                   "<div class='card' style='overflow:hidden;'>"+
                                   "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                                   "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                                   "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                                   "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                                   "</a>"+
                                   "</div>"+
                                   "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                                   "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                                   "</div>"+
                                   "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                                   "<a class='btn btn-light' onclick='insertFan(this);'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                                   "<span style='font-size: 1.2em'>+Fan</span>"+
                                  "</a>"+
                                   "</div>"+
                                   "</div>"+
                                   "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                                   "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                                   "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                                   "</a>"+
                                   "</div>"+
                                   "<div class='card-footer row'>"+
                                   "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                                   "<a onclick='like(this);'><i class='fa fa-heart'style='color: red; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                                   "<p style='margin: 0px;margin-left:9px;'>"+value.likeCount+"</p>"+
                                   "</div>"+
                                   "<div class='col-3 form-inline' style='padding: 0px;'>"+
                                   "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                                   "<p style='margin-left:9px;margin: 0px;'>"+value.replyCount+"</p>"+
                                   "</div>"+
                                   "</div>"+
                                   "</div>"+
                                   "</div>"+
                                   "</div>";
                                }else if(value.loginLike == 0 && value.fanCheck == 1){
                             	   console.log("좋X팬O");
                                    $input = "<div class='col-md-4 mt-3'>"+
                                    "<div class='component'>"+ 
                                    "<div class='card' style='overflow:hidden;'>"+
                                    "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                                    "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                                    "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                                    "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                                     "</a>"+
                                    "</div>"+
                                    "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                                    "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                                    "</div>"+
                                    "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                                    "<a class='btn' onclick='deleteFan(this);' style='cursor:pointer;'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                                    "<i class='fa fa-check'style='font-size:30px;'></i>"+
                                    "</a>"+
                                    "</div>"+
                                    "</div>"+
                                    "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                                    "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                                    "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                                    "</a>"+
                                    "</div>"+
                                    "<div class='card-footer row'>"+
                                    "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                                    "<a onclick='like(this);'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                                    "<p style='margin: 0px; margin-left:9px;'value="+value.pno+">"+value.likeCount+"</p>"+
                                    "</div>"+
                                    "<div class='col-3 form-inline' style='padding: 0px;'>"+
                                    "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                                    "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                                    "</div>"+
                                    "</div>"+
                                    "</div>"+
                                    "</div>"+
                                    "</div>";
                                }else{
                             	   console.log("좋O팬O");
                                    $input = "<div class='col-md-4 mt-3'>"+
                                    "<div class='component'>"+ 
                                    "<div class='card' style='overflow:hidden;'>"+
                                    "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                                    "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                                    "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                                    "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                                    "</a>"+
                                    "</div>"+
                                    "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                                    "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                                    "</div>"+
                                    "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                                    "<a class='btn btn-black' onclick='deleteFan(this);'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                                    "<i class='fa fa-check'style='font-size:30px;'></i>"+
                                    "</a>"+
                                    "</div>"+
                                    "</div>"+
                                    "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                                    "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                                    "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                                    "</a>"+
                                    "</div>"+
                                    "<div class='card-footer row'>"+
                                    "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                                    "<a onclick='like(this);'><i class='fa fa-heart'style='color: red; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                                    "<p style='margin: 0px; margin-left:9px;'value="+value.pno+">"+value.likeCount+"</p>"+
                                    "</div>"+
                                    "<div class='col-3 form-inline' style='padding: 0px;'>"+
                                    "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                                    "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                                    "</div>"+
                                    "</div>"+
                                    "</div>"+
                                    "</div>"+
                                    "</div>";
                                }

                             
                            
                            }
                            
                                $inputWrap.append($input);
                                //$("#fourWrap").append($inputWrap);
                                //$("#fourWrap").append($input);
                         });
                         $("#fourWrap").append($inputWrap);
                      },
                     error:function(){
                        console.log("실패");
                     
                     }
                     
                  });
               $("#loading").children().remove();
               }
            });          
         
      var sel;
      $(document).on("click", ".b", function() {
         console.log("ddd");

         $(".b").children().removeAttr('style');
         $(this).children().css('color', 'white');
         sel = $(this).attr('id');
      });

      var selectC
      $(document).on("click", ".bb", function() {

         var color = $("#selectColor");

         console.log(color);
         //   $(color).css("background",$(this).children().attr("id"))

         selectC = $(this).children().attr("id");
         //$(".bb").children().removeAttr('style');

         $(".bb").children().attr('class', 'fa fa-circle fa-5x');

         $(this).children().attr('class', 'fa fa-check fa-5x');

         // style="height:30px; width:500px; margin-bottom:10px; background:black;"
         color.css({
            "height" : "15px",
            "width" : "500px",
            "margin-top" : "30px",
            "background" : $(this).children().attr("id")
         });

      });

      function reset() {
         $(".b").children().removeAttr('style');
         $(".bb").children().attr('class', 'fa fa-circle fa-5x');
         $("#selectColor").removeAttr('style');
      }
      //AJAX 기능구현 할때사

      function select() {
         $(".b").children().removeAttr('style');
         $(".bb").children().attr('class', 'fa fa-circle fa-5x');
         $("#selectColor").removeAttr('style');
         var category = $("#category").val();
         console.log(sel);
         console.log(selectC);


         	
         var $inputWrap = $("#inputWrap");
         
         $.ajax({
            url:"selectFilter.do",
            data:{gender:sel, color:selectC, category:category},
            dataType:"json",
            success : function(data) {
               //console.log(data[0])
               //console.log(data[0].nickName)
               $("#loading").remove();
               $("#inputWrap").children().remove();
               var $input
			   if(data.length == 0){
				   if(sel == 'M'){
					   sel='남자';
				   }else if(sel == 'W'){
					   sel='여자';
				   }
				   
				   $inputWrap.append("<div class='col-md-12 mt-5' style='margin-left:300px;'><h5>"+sel+" | "+selectC.toUpperCase()+" | "+category+" 의 검색결과가 존재하지 않습니다.</h5></div>")
			   }
               
               if(data.length == 1){
            	  console.log(data);
                  var loginUser = "${loginUser.mno}";
                  if(loginUser == null || loginUser == ""){

                     $input = "<div class='col-md-4 mt-3'>"+
                     "<div class='component' style='width:360px;'>"+ 
                     "<div class='card' style='overflow:hidden;'>"+
                     "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                     "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                     "<a class='btn' href='mpViewProfile.do?mno="+data[0].mno+"' style='margin:0px; padding:0px;'>"+
                     "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+data[0].profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                     "</a>"+
                     "</div>"+
                     "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                     "<span style='margin-bottom: 0px; margin-top: 23px;'>"+data[0].nickName+"<br>"+data[0].enrollDate+"</span>"+
                     "</div>"+
                     "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                     "<a class='btn btn-light' onclick=unFan(); style='cursor:pointer;'>"+
                      "<span style='font-size: 1.2em'>+Fan</span>"+
                     "</a>"+
                     "</div>"+
                     "</div>"+
                     "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                     "<a href='pInfo.do?id="+data[0].pno+" 'style='border-bottom: 0px !important; text-decoration: none black;'>"+
                     "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+data[0].renameImg+"' alt='dog' style='height: 100%;'>"+
                     "</a>"+
                     "</div>"+
                     "<div class='card-footer row'>"+
                     "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                     "<a onclick=unLike(); style='cursor:pointer;'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i></a>"+
                     "<p style='margin: 0px;margin-left:9px;'>"+data[0].likeCount+"</p>"+	
                     "</div>"+
                     "<div class='col-3 form-inline' style='padding: 0px;'>"+
                     "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                     "<p style='margin: 0px;margin-left:9px;'>"+data[0].replyCount+"</p>"+
                     "</div>"+
                     "</div>"+
                     "</div>"+
                     "</div>"+
                     "</div>"; 
                    	
                 }else{
                	   if((data[0].loginLike == 0 && data[0].fanCheck == 0) && ("${loginUser.mno}" == data[0].mno)){
                        	 $input = "<div class='col-md-4 mt-3'>"+
                             "<div class='component' style='width:360px;'>"+ 
                             "<div class='card' style='overflow:hidden;'>"+
                             "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                             "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                             "<a class='btn' href='mpViewProfile.do?mno="+data[0].mno+"' style='margin:0px; padding:0px;'>"+
                             "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+data[0].profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                             "</a>"+
                             "</div>"+
                             "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                             "<span style='margin-bottom: 0px; margin-top: 23px;'>"+data[0].nickName+"<br>"+data[0].enrollDate+"</span>"+
                             "</div>"+
                             "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                             "<a class='btn btn-dark'><input type='hidden' value="+data[0].mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                             "<span style='font-size: 1.2em; color:white;' >My</span>"+
                            "</a>"+
                            "</div>"+
                             "</div>"+
                             "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                             "<a href='pInfo.do?id="+data[0].pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                             "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+data[0].renameImg+"' alt='dog' style='height: 100%;'>"+
                             "</a>"+
                             "</div>"+
                             "<div class='card-footer row'>"+
                             "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                             "<a onclick='filterLike(this);'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i><input type='hidden' value="+data[0].pno+" id='hiddenpno'/><input type='hidden' value="+data[0].mno+" id='hiddenmno'/></a>"+
                             "<p style='margin: 0px; margin-left:9px;'value="+data[0].pno+">"+data[0].likeCount+"</p>"+
                             "</div>"+
                             "<div class='col-3 form-inline' style='padding: 0px;'>"+
                             "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                             "<p style='margin: 0px;margin-left:9px;'>"+data[0].replyCount+"</p>"+
                              "</div>"+
                             "</div>"+
                             "</div>"+
                             "</div>"+
                             "</div>";
                             
                        }else if((data[0].loginLike == 1 && data[0].fanCheck == 0) && ("${loginUser.mno}" == data[0].mno)){
                        	
                        	$input = "<div class='col-md-4 mt-3'>"+
                            "<div class='component'style='width:360px;'>"+ 
                            "<div class='card' style='overflow:hidden;'>"+
                            "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                            "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                            "<a class='btn' href='mpViewProfile.do?mno="+data[0].mno+"' style='margin:0px; padding:0px;'>"+
                            "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+data[0].profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                            "</a>"+
                            "</div>"+
                            "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                            "<span style='margin-bottom: 0px; margin-top: 23px;'>"+data[0].nickName+"<br>"+data[0].enrollDate+"</span>"+
                            "</div>"+
                            "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                            "<a class='btn btn-dark'><input type='hidden' value="+data[0].mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                            "<span style='font-size: 1.2em; color:white;' >My</span>"+
                           "</a>"+
                           "</div>"+
                            "</div>"+
                            "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                            "<a href='pInfo.do?id="+data[0].pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                            "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+data[0].renameImg+"' alt='dog' style='height: 100%;'>"+
                             "</a>"+
                            "</div>"+
                            "<div class='card-footer row'>"+
                            "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                            "<a onclick='filterLike(this);'><i class='fa fa-heart'style='color: red; font-size: 30px;'></i><input type='hidden' value="+data[0].pno+" id='hiddenpno'/><input type='hidden' value="+data[0].mno+" id='hiddenmno'/></a>"+
                            "<p style='margin: 0px; margin-left:9px;'value="+data[0].pno+">"+data[0].likeCount+"</p>"+
                            "</div>"+
                            "<div class='col-3 form-inline' style='padding: 0px;'>"+
                            "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                            "<p style='margin: 0px;margin-left:9px;'>"+data[0].replyCount+"</p>"+
                            "</div>"+
                            "</div>"+
                            "</div>"+
                            "</div>"+
                            "</div>";
                     
                        }
                 
                 else if(data[0].loginLike == 0 && data[0].fanCheck == 0){ //조아요 안함 //펜x 
                  	   console.log("좋X팬X");
                        $input = "<div class='col-md-4 mt-3'>"+
                        "<div class='component' style='width:360px;'>"+ 
						"<div class='card' style='overflow:hidden;'>"+
                        "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                        "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                        "<a class='btn' href='mpViewProfile.do?mno="+data[0].mno+"' style='margin:0px; padding:0px;'>"+
                        "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+data[0].profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                        "</a>"+
                        "</div>"+
                        "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                        "<span style='margin-bottom: 0px; margin-top: 23px;'>"+data[0].nickName+"<br>"+data[0].enrollDate+"</span>"+
                        "</div>"+
                        "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                        "<a class='btn btn-light' onclick='filterInsertFan(this);'><input type='hidden' value="+data[0].mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                         "<span style='font-size: 1.2em'>+Fan</span>"+
                        "</a>"+
                        "</div>"+
                        "</div>"+
                        "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                        "<a href='pInfo.do?id="+data[0].pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                        "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+data[0].renameImg+"' alt='dog' style='height: 100%;'>"+
                        "</a>"+
                        "</div>"+
                        "<div class='card-footer row'>"+
                        "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                        "<a onclick='filterLike(this);'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i><input type='hidden' value="+data[0].pno+" id='hiddenpno'/><input type='hidden' value="+data[0].mno+" id='hiddenmno'/></a>"+
                        "<p style='margin: 0px; margin-left:9px;'value="+data[0].pno+">"+data[0].likeCount+"</p>"+
                        "</div>"+
                        "<div class='col-3 form-inline' style='padding: 0px;'>"+
                        "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                        "<p style='margin: 0px;margin-left:9px;'>"+data[0].replyCount+"</p>"+
                        "</div>"+
                        "</div>"+
                        "</div>"+
                        "</div>"+
                        "</div>";
                        
                     }else if(data[0].loginLike == 1 && data[0].fanCheck == 0){
                  	   console.log("좋O팬X");
                        $input = "<div class='col-md-4 mt-3'>"+
                        "<div class='component' style='width:360px;'>"+ 
                        "<div class='card' style='overflow:hidden;'>"+
                        "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                        "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                        "<a class='btn' href='mpViewProfile.do?mno="+data[0].mno+"' style='margin:0px; padding:0px;'>"+
                        "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+data[0].profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                        "</a>"+
                        "</div>"+
                        "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                        "<span style='margin-bottom: 0px; margin-top: 23px;'>"+data[0].nickName+"<br>"+data[0].enrollDate+"</span>"+
                        "</div>"+
                        "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                        "<a class='btn btn-light' onclick='filterInsertFan(this);'><input type='hidden' value="+data[0].mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                        "<span style='font-size: 1.2em'>+Fan</span>"+
                       "</a>"+
                        "</div>"+
                        "</div>"+
                        "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                        "<a href='pInfo.do?id="+data[0].pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                        "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+data[0].renameImg+"' alt='dog' style='height: 100%;'>"+
                        "</a>"+
                        "</div>"+
                        "<div class='card-footer row'>"+
                        "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                        "<a onclick='filterLike(this);'><i class='fa fa-heart'style='color: red; font-size: 30px;'></i><input type='hidden' value="+data[0].pno+" id='hiddenpno'/><input type='hidden' value="+data[0].mno+" id='hiddenmno'/></a>"+
                        "<p style='margin: 0px; margin-left:9px;'value="+data[0].pno+">"+data[0].likeCount+"</p>"+
                        "</div>"+
                        "<div class='col-3 form-inline' style='padding: 0px;'>"+
                        "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                        "<p style='margin: 0px;margin-left:9px;'>"+data[0].replyCount+"</p>"+
                        "</div>"+
                        "</div>"+
                        "</div>"+
                        "</div>"+
                        "</div>";
                     }else if(data[0].loginLike == 0 && data[0].fanCheck == 1){
                  	   console.log("좋X팬O");
                         $input = "<div class='col-md-4 mt-3'>"+
                         "<div class='component' style='width:360px;'>"+ 
                         "<div class='card' style='overflow:hidden;'>"+
                         "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                         "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                         "<a class='btn' href='mpViewProfile.do?mno="+data[0].mno+"' style='margin:0px; padding:0px;'>"+
                         "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+data[0].profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                         "</a>"+
                         "</div>"+
                         "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                         "<span style='margin-bottom: 0px; margin-top: 23px;'>"+data[0].nickName+"<br>"+data[0].enrollDate+"</span>"+
                         "</div>"+
                         "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                         "<a class='btn' onclick='filterDeleteFan(this);' style='cursor:pointer;'><input type='hidden' value="+data[0].mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                         "<i class='fa fa-check' style='font-size:30px;'></i>"+
                         "</a>"+
                         "</div>"+
                         "</div>"+
                         "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                         "<a href='pInfo.do?id="+data[0].pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                         "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+data[0].renameImg+"' alt='dog' style='height: 100%;'>"+
                         "</a>"+
                         "</div>"+
                         "<div class='card-footer row'>"+
                         "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                         "<a onclick='filterLike(this);'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i><input type='hidden' value="+data[0].pno+" id='hiddenpno'/><input type='hidden' value="+data[0].mno+" id='hiddenmno'/></a>"+
                         "<p style='margin: 0px; margin-left:9px;'value="+data[0].pno+">"+data[0].likeCount+"</p>"+
                         "</div>"+
                         "<div class='col-3 form-inline' style='padding: 0px;'>"+
                         "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                         "<p style='margin: 0px;margin-left:9px;'>"+data[0].replyCount+"</p>"+
                         "</div>"+
                         "</div>"+
                         "</div>"+
                         "</div>"+
                         "</div>";
                     }else{
                  	   console.log("좋O팬O");
                         $input = "<div class='col-md-4 mt-3'>"+
                         "<div class='component' style='width:360px;'>"+ 
                         "<div class='card' style='overflow:hidden;'>"+
                         "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                         "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                         "<a class='btn' href='mpViewProfile.do?mno="+data[0].mno+"' style='margin:0px; padding:0px;'>"+
                         "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+data[0].profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                         "</a>"+
                         "</div>"+
                         "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                         "<span style='margin-bottom: 0px; margin-top: 23px;'>"+data[0].nickName+"<br>"+data[0].enrollDate+"</span>"+
                         "</div>"+
                         "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                         "<a class='btn btn-black' onclick='filterDeleteFan(this);'><input type='hidden' value="+data[0].mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                         "<i class='fa fa-check'style='font-size:30px;'></i>"+
                         "</a>"+
                         "</div>"+
                         "</div>"+
                         "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                         "<a href='pInfo.do?id="+data[0].pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                         "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+data[0].renameImg+"' alt='dog' style='height: 100%;'>"+
                         "</a>"+
                         "</div>"+
                         "<div class='card-footer row'>"+
                         "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                         "<a onclick='filterLike(this);'><i class='fa fa-heart'style='color: red; font-size: 30px;'></i><input type='hidden' value="+data[0].pno+" id='hiddenpno'/><input type='hidden' value="+data[0].mno+" id='hiddenmno'/></a>"+
                         "<p style='margin: 0px; margin-left:9px;'value="+data[0].pno+">"+data[0].likeCount+"</p>"+
                         "</div>"+
                         "<div class='col-3 form-inline' style='padding: 0px;'>"+
                         "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                         "<p style='margin: 0px;margin-left:9px;'>"+data[0].replyCount+"</p>"+
                         "</div>"+
                         "</div>"+
                         "</div>"+
                         "</div>"+
                         "</div>";
                      }

                  }
                  $inputWrap.append($input);
                  $("#fourWrap").append($inputWrap);
                  man(category);
               }else{ //데이터가 여러개
                  $.each(data,function(index, value){
                     var $input;
                     var loginUser = "${loginUser.mno}";
                     if(loginUser == null || loginUser == ""){
                    	 $input = "<div class='col-md-4 mt-3'>"+
                         "<div class='component'>"+ 
                         "<div class='card' style='overflow:hidden;'>"+
                         "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                         "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                         "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                         "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                         "</a>"+
                         "</div>"+
                         "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                         "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                         "</div>"+
                         "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                         "<a class='btn btn-light' onclick=unFan(); style='cursor:pointer;'>"+
                          "<span style='font-size: 1.2em'>+Fan</span>"+
                         "</a>"+
                         "</div>"+
                         "</div>"+
                         "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                         "<a href='pInfo.do?id="+value.pno+" 'style='border-bottom: 0px !important; text-decoration: none black;'>"+
                         "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                         "</a>"+
                         "</div>"+
                         "<div class='card-footer row'>"+
                         "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                         "<a onclick=unLike(); style='cursor:pointer;'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i></a>"+
                         "<p style='margin: 0px;margin-left:9px;'>"+value.likeCount+"</p>"+
                         "</div>"+
                         "<div class='col-3 form-inline' style='padding: 0px;'>"+
                         "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                         "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                         "</div>"+
                         "</div>"+
                         "</div>"+
                         "</div>"+
                         "</div>"; 
                        
                     }else{
					
                    if((value.loginLike == 0 && value.fanCheck == 0) && ("${loginUser.mno}" == value.mno)){
                    	 $input = "<div class='col-md-4 mt-3'>"+
                         "<div class='component'>"+ 
                         "<div class='card' style='overflow:hidden;'>"+
                         "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                         "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                         "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                         "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                         "</a>"+
                         "</div>"+
                         "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                         "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                         "</div>"+
                         "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                         "<a class='btn btn-dark'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                          "<span style='font-size: 1.2em; color:white'>My</span>"+
                         "</a>"+
                         "</div>"+
                         "</div>"+
                         "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                         "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                         "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                         
                         "</a>"+
                         "</div>"+
                         "<div class='card-footer row'>"+
                         "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                         "<a onclick='filterLike(this);'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                         "<p style='margin: 0px; margin-left:9px;'value="+value.pno+">"+value.likeCount+"</p>"+
                         "</div>"+
                         "<div class='col-3 form-inline' style='padding: 0px;'>"+
                         "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                         "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                         "</div>"+
                         "</div>"+
                         "</div>"+
                         "</div>"+
                         "</div>";
                         
                    }else if((value.loginLike == 1 && value.fanCheck == 0) && ("${loginUser.mno}" == value.mno)){
                    
                    	$input = "<div class='col-md-4 mt-3'>"+
                        "<div class='component'>"+ 
                        "<div class='card' style='overflow:hidden;'>"+
                        "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                        "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                        "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                        "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                        "</a>"+
                        "</div>"+
                        "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                        "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                        "</div>"+
                        "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                        "<a class='btn btn-dark'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                        "<span style='font-size: 1.2em; color:white;'>My</span>"+
                       "</a>"+
                        "</div>"+
                        "</div>"+
                        "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                        "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                        "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                        "</a>"+
                        "</div>"+
                        "<div class='card-footer row'>"+
                        "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                        "<a onclick='filterLike(this);'><i class='fa fa-heart'style='color: red; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                        "<p style='margin: 0px; margin-left:9px;'value="+value.pno+">"+value.likeCount+"</p>"+
                        "</div>"+
                        "<div class='col-3 form-inline' style='padding: 0px;'>"+
                        "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                        "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                        "</div>"+
                        "</div>"+
                        "</div>"+
                        "</div>"+
                        "</div>";
                    }else if(value.loginLike == 0 && value.fanCheck == 0){ //조아요 안함 //펜x 
                      	   console.log("좋X팬X");
                      	   console.log("${loginUser.mno}");
                            $input = "<div class='col-md-4 mt-3'>"+
                            "<div class='component'>"+ 
                            "<div class='card' style='overflow:hidden;'>"+
                            "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                            "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                            "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                            "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                            "</a>"+
                            "</div>"+
                            "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                            "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                            "</div>"+
                            "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                            "<a class='btn btn-light' onclick='filterInsertFan(this);'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                             "<span style='font-size: 1.2em'>+Fan</span>"+
                            "</a>"+
                            "</div>"+
                            "</div>"+
                            "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                            "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                            "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                            "</a>"+
                            "</div>"+
                            "<div class='card-footer row'>"+
                            "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                            "<a onclick='filterLike(this);'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                            "<p style='margin: 0px; margin-left:9px;'value="+value.pno+">"+value.likeCount+"</p>"+
                            "</div>"+
                            "<div class='col-3 form-inline' style='padding: 0px;'>"+
                            "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                            "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                            "</div>"+
                            "</div>"+
                            "</div>"+
                            "</div>"+
                            "</div>";
                            
                         }else if(value.loginLike == 1 && value.fanCheck == 0){
                      	   console.log("좋O팬X");
                            $input = "<div class='col-md-4 mt-3'>"+
                            "<div class='component'>"+ 
                            "<div class='card' style='overflow:hidden;'>"+
                            "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                            "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                            "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                            "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                            "</a>"+
                            "</div>"+
                            "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                            "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                            "</div>"+
                            "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                            "<a class='btn btn-light' onclick='filterInsertFan(this);'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                            "<span style='font-size: 1.2em'>+Fan</span>"+
                           "</a>"+
                            "</div>"+
                            "</div>"+
                            "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                            "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                            "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                            "</a>"+
                            "</div>"+
                            "<div class='card-footer row'>"+
                            "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                            "<a onclick='filterLike(this);'><i class='fa fa-heart'style='color: red; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                            "<p style='margin: 0px; margin-left:9px;'value="+value.pno+">"+value.likeCount+"</p>"+
                            "</div>"+
                            "<div class='col-3 form-inline' style='padding: 0px;'>"+
                            "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                            "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                            "</div>"+
                            "</div>"+
                            "</div>"+
                            "</div>"+
                            "</div>";
                         }else if(value.loginLike == 0 && value.fanCheck == 1){
                      	   console.log("좋X팬O");
                             $input = "<div class='col-md-4 mt-3'>"+
                             "<div class='component'>"+ 
                             "<div class='card' style='overflow:hidden;'>"+
                             "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                             "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                             "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                             "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                             "</a>"+
                             "</div>"+
                             "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                             "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                             "</div>"+
                             "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                             "<a class='btn' onclick='filterDeleteFan(this);' style='cursor:pointer;'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                             "<i class='fa fa-check'style='font-size:30px;'></i>"+
                             "</a>"+
                             "</div>"+
                             "</div>"+
                             "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                             "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                             "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                             "</a>"+
                             "</div>"+
                             "<div class='card-footer row'>"+
                             "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                             "<a onclick='filterLike(this);'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                             "<p style='margin: 0px; margin-left:9px;'value="+value.pno+">"+value.likeCount+"</p>"+
                             "</div>"+
                             "<div class='col-3 form-inline' style='padding: 0px;'>"+
                             "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                             "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                             "</div>"+
                             "</div>"+
                             "</div>"+
                             "</div>"+
                             "</div>";
                         }else{
                      	   console.log("좋O팬O");
                             $input = "<div class='col-md-4 mt-3'>"+
                             "<div class='component'>"+ 
                             "<div class='card' style='overflow:hidden;'>"+
                             "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                             "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                             "<a class='btn' href='mpViewProfile.do?mno="+value.mno+"' style='margin:0px; padding:0px;'onfocus='blur()'>"+
                             "<img src='${ pageContext.servletContext.contextPath }/resources/upload/member/"+value.profileImg+"' style='width: 50px; height: 50px; margin-left: 20px; border-radius:50px;' />" +
                             "</a>"+
                             "</div>"+
                             "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                             "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                             "</div>"+
                             "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                             "<a class='btn btn-black' onclick='filterDeleteFan(this);'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                             "<i class='fa fa-check'style='font-size:30px;'></i>"+
                             "</a>"+
                             "</div>"+
                             "</div>"+
                             "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                             "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                             "<img class='card-img' src= '${ pageContext.servletContext.contextPath }/resources/upload/posting/"+value.renameImg+"' alt='dog' style='height: 100%;'>"+
                             "</a>"+
                             "</div>"+
                             "<div class='card-footer row'>"+
                             "<div class='col-3 form-inline'style='padding:0px; margin-left:10px;'>"+
                             "<a onclick='filterLike(this);'><i class='fa fa-heart'style='color: red; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                             "<p style='margin: 0px; margin-left:9px;'value="+value.pno+">"+value.likeCount+"</p>"+
                             "</div>"+
                             "<div class='col-3 form-inline' style='padding: 0px;'>"+
                             "<i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i>"+
                             "<p style='margin: 0px;margin-left:9px;'>"+value.replyCount+"</p>"+
                             "</div>"+
                             "</div>"+
                             "</div>"+
                             "</div>"+
                             "</div>";
                        }
                     
                  }
                         $inputWrap.append($input);
                  });
                  $("#fourWrap").append($inputWrap);
                  man(category);
                  console.log("성공"); 
                  
                  
               }
            },
               error : function() {
                  console.log("실패");
               }
         });
            
      }

      function man(category) {
         
         console.log("안녕하e");

         var filter = $("#filter-drop");
         filter.children().remove();
         /*filter.css("border: 1px solid black; width: 100%; height: 50px; margin-top: 50px") */
         filter
               .append("<i class='fa fa-sliders fa-md' style='color:white; margin-top:13px; margin-left:399px;'>"
                     + "<span style='margin-left:20px;'>"
                     + '필터 - '
                     + sel
                     + '   |   <i class="fa fa-circle" style="color:'+selectC+'"></i>   |   '
                     + category
                     + " </span>"
                     + "<a class='btn' onclick='on();' style='margin-left:960px;'><i class='fa fa-times fa-md'></i></a>"
                     + "</i>");
         filter.css({
            "border" : "1px solid black",
            "background" : "black"
         });

      }
      function on() {

         $("#filter-drop").html("");
         $("#filter-drop").css('background', 'white').css('border', '0px');

      }

      $(document)
            .ready(
                  function() {
                     $('#loading')
                           .append(
                                 "<i class='loading fa fa-spinner fa-pulse fa-fw fa-5x' id='pulse'></i>");
                  });
   </script>

   <script>
      $(function() {
         $("#ticker2").css("display", "none");
         console.log("ddd");
         topSearch();
      });

      function topSearch() {

         var $ul = $("#ticker");

         $
               .ajax({
                  url : "topSearch.do",
                  dataType : "json",
                  success : function(data) {
                     console.log("성공");
                     $
                           .each(
                                 data,
                                 function(index, value) {

                                    $ul
	                                          .append("<li class='ddd'><a onclick='Stype(this);'><span style='font-size:15px;margin-right:9px;'><input type='hidden' value="+value.type+"><input type='hidden' value="+value.keyword+">"
	       	                                         + (index+1)
	                                                + "</span>"
	                                                + value.keyword
	                                                + "</a></li>");

                                 });
                  },
                  error : function() {
                     console.log("서버통신실패");
                  }
               });

      }
	function Stype(a){
		var type = $(a).children().children().eq(0).val();
		var keyword = $(a).children().children().eq(1).val();
		console.log(type);
		console.log(keyword.substr(0,1));
		if(keyword.substr(0,1) == '#'){
			keyword = keyword.substr(1, keyword.length-1);
	    	
		}
	    /* if(keyword.indexOf(0) == '#'){
	    	keyword = keyword.substr(1, keyword.length-1);
	    	console.log(keyword);
	    } */
	 location.href='pNavSearch.do?type='+type+'&keyword='+keyword;
		 
	}
      function topSearch2() {

         var $ul = $("#ticker2");

            $
               .ajax({
                  url : "topSearch.do",
                  dataType : "json",
                  success : function(data) {
                     $
                           .each(
                                 data,
                                 function(index, value) {

                                    $ul
                                          .append("<li class='ddd' style='margin-bottom:10px;'><a href='#'><span style='font-size:15px;margin-right:9px;'>"
                                                + (index+1)
                                                + "</span>"
                                                + value.keyword
                                                + "</a></li>");

                                 });
                  },
                  error : function() {
                     console.log("서버통신실패");
                  }
               });

      }

      $(function() {
         var ticker = function() {
            setTimeout(function() {
               $('#ticker li:first').animate(
                     {
                        marginTop : '-20px'
                     },
                     400,
                     function() {
                        $(this).detach().appendTo('ul#ticker')
                              .removeAttr('style');
                     });
               ticker();
            }, 3000);
         };
         ticker();
      });
   </script>
   <script>
      $('#aDrop').mouseenter(function() {
         console.log("asdasdasd");
         
         //$(".ddd").remove();
         $("#ticker").css("display", "none");
         $("#ticker2").css("display", "block");
         $(".block").css("overflow", "visible");
         $("#player").css("display", "none");
         $(".ddd").remove();
         
         topSearch2();
      });
      $('#aDrop').mouseleave(function() {
         $("#ticker").css("display", "block");
         $("#ticker2").css("display", "none");
         $(".block").css("overflow", "hidden");
         $("#player").css("display", "block");
         
         topSearch();
         

      });
      // 2. This code loads the IFrame Player API code asynchronously.
      var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
      var player;
      function onYouTubeIframeAPIReady( ) {
         console.log("onyoutube");
            $.ajax({
              url:"youtubeUrl.do",
              success:function(data){
                var url = data.url;
                var idx1 = url.indexOf("=");
                var idx2 = url.indexOf("&");
                if(idx2 == -1){
                	var result = url.substring(idx1+1);
                }else{
                	var result = url.substring(idx1+1,idx2);
              	
                }
                
                console.log("dkdkdkdk"+data.imgPath);
                window.open("${pageContext.request.contextPath}/resources/assets/ad.jsp?img="+data.imgPath+"&originalImg="+data.renameImg,'','width=270px, height=239px, left=700px, top=300px, toolbar=0, status=yes, menubars=0, scrollbars=0, resizable=0, location=0, directories=0');
             
         player = new YT.Player('player', {
          height: '1000',
          width: '1000',
          videoId: result,
          events: {
            'onReady': onPlayerReady
          }
        }); 
              },
              error:function(){
                 
              }
            });
      }

      function onPlayerReady(event) {
        event.target.playVideo();
      }


      var done = false;
      function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
          setTimeout(stopVideo, 6000);
          done = true;
        }
      }
      
      function stopVideo() {
        player.stopVideo();
      }
    </script>

   <div id="loading"
      style="width: 100%; height: 50px; margin-left: 900px;"></div>

   <jsp:include page="includes/footer.jsp" />
</body>
</html>