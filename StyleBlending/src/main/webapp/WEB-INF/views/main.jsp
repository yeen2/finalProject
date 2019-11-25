<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

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
</style>
<link rel="stylesheet" type="text/css"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<script type="text/javascript" src="resources/js/typeit.min.js"></script>
   
<body class="index">
   <jsp:include page="includes/header.jsp" />
   
   
   
   <div id="filter-drop"
      style="width: 100%; height: 50px; margin-top: 70px;"></div>
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
                  class="fa fa-search"></i>&nbsp;급상승 겁색어</li>
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
         success:function(data){
            console.log("성공 topFour");
            $.each(data,function(index, value){
               
               var $input =
                        "<div class='col-3'>" +
                        "<div class='component'>" +
                        "<div class='card' style='overflow:hidden;'>" +
                        "<div class='card-body' style='height: 400px; padding: 0px;'>" +
                        "<img class='card-img' src="+value.imgPath+"/"+value.renameImg + " style='height:100%'>" +
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

                  
               }
            },
            error:function(){
               console.log("실패")
            }
         });
         
      }

   }
    function insertFan(a){
       
       console.log(a);
       var youNo = $(a).children().eq(0).val(); // 하는 사람이 youNo
       var meNo = $(a).children().eq(1).val(); //당하는 사람이 meNo
      if($(a).attr('class','btn btn-light')){
         $.ajax({
            url:"mpInsertFan.do",
            data:{meNo:meNo, youNo:youNo},
            type:"get",
            success:function(data){
               
               if(data == 1){
               console.log("친구추가 성공");
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
    }
    
    //비로그인 좋아요 클릭할경우
   function unLike(){
      alert('로그인 후 좋아요 클릭 가능합니다.');
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
                   "<img src='${pageContext.request.contextPath}/resources/assets/img/배너일.png' style='width: 80px; height: 50px; margin-left: 20px;' />" +
                   "</div>"+
                   "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                   "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                   "</div>"+
                   "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                   "<a class='btn btn-light'>"+
                    "<span style='font-size: 1.2em'>+Fan</span>"+
                   "</a>"+
                   "</div>"+
                   "</div>"+
                   "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                   "<a href='pInfo.do?id="+value.pno+" 'style='border-bottom: 0px !important; text-decoration: none black;'>"+
                   "<img class='card-img' src="+value.imgPath+"/"+value.renameImg+" alt='dog' style='height: 100%;'>"+
                   "</a>"+
                   "</div>"+
                   "<div class='card-footer row'>"+
                   "<div class='col-3 form-inline'>"+
                   "<a onclick=unLike(); style='cursor:pointer;'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i></a>"+
                   "<p style='margin: 0px;margin-left:5px;'>"+value.likeCount+"</p>"+
                   "</div>"+
                   "<div class='col-3 form-inline' style='padding: 0px;'>"+
                   "<a href=''><i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i></a>"+
                   "<p style='margin: 0px;margin-left:5px;'>"+value.replyCount+"</p>"+
                   "</div>"+
                   "</div>"+
                   "</div>"+
                   "</div>"+
                   "</div>"; 
                  
               }else{

               
                   if(value.loginLike == 0 && value.fanCheck == 0){ //조아요 안함 //펜x 
                      console.log("좋X팬X");
                      $input = "<div class='col-md-4 mt-3'>"+
                      "<div class='component'>"+ 
                      "<div class='card' style='overflow:hidden;'>"+
                      "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                      "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                      "<img src='${pageContext.request.contextPath}/resources/assets/img/배너일.png' style='width: 80px; height: 50px; margin-left: 20px;' />" +
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
                      "<img class='card-img' src="+value.imgPath+"/"+value.renameImg+" alt='dog' style='height: 100%;'>"+
                      "</a>"+
                      "</div>"+
                      "<div class='card-footer row'>"+
                      "<div class='col-3 form-inline'>"+
                      "<a onclick='like(this);'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                      "<p style='margin: 0px; margin-left:5px;'value="+value.pno+">"+value.likeCount+"</p>"+
                      "</div>"+
                      "<div class='col-3 form-inline' style='padding: 0px;'>"+
                      "<a href=''><i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i></a>"+
                      "<p style='margin-left:5px;margin: 0px;'>"+value.replyCount+"</p>"+
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
                      "<img src='${pageContext.request.contextPath}/resources/assets/img/배너일.png' style='width: 80px; height: 50px; margin-left: 20px;' />" +
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
                      "<img class='card-img' src="+value.imgPath+"/"+value.renameImg+" alt='dog' style='height: 100%;'>"+
                      "</a>"+
                      "</div>"+
                      "<div class='card-footer row'>"+
                      "<div class='col-3 form-inline'>"+
                      "<a onclick='like(this);'><i class='fa fa-heart'style='color: red; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                      "<p style='margin: 0px; margin-left:5px;'value="+value.pno+">"+value.likeCount+"</p>"+
                      "</div>"+
                      "<div class='col-3 form-inline' style='padding: 0px;'>"+
                      "<a href=''><i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i></a>"+
                      "<p style='margin-left:5px;margin: 0px;'>"+value.replyCount+"</p>"+
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
                       "<img src='${pageContext.request.contextPath}/resources/assets/img/배너일.png' style='width: 80px; height: 50px; margin-left: 20px;' />" +
                       "</div>"+
                       "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                       "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                       "</div>"+
                       "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                       "<a class='btn btn-black' onclick='insertFan(this);'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                       "<i class='fa fa-check'></i>"+
                       "</a>"+
                       "</div>"+
                       "</div>"+
                       "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                       "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                       "<img class='card-img' src="+value.imgPath+"/"+value.renameImg+" alt='dog' style='height: 100%;'>"+
                       "</a>"+
                       "</div>"+
                       "<div class='card-footer row'>"+
                       "<div class='col-3 form-inline'>"+
                       "<a onclick='like(this);'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                       "<p style='margin: 0px; margin-left:5px;'value="+value.pno+">"+value.likeCount+"</p>"+
                       "</div>"+
                       "<div class='col-3 form-inline' style='padding: 0px;'>"+
                       "<a href=''><i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i></a>"+
                       "<p style='margin-left:5px;margin: 0px;'>"+value.replyCount+"</p>"+
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
                       "<img src='${pageContext.request.contextPath}/resources/assets/img/배너일.png' style='width: 80px; height: 50px; margin-left: 20px;' />" +
                       "</div>"+
                       "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                       "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                       "</div>"+
                       "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                       "<a class='btn btn-black' onclick='insertFan(this);'><input type='hidden' value="+value.mno+" id='hiddenmno'/><input type='hidden' value="+"${loginUser.mno}"+" id='hiddenmno'/>"+
                       "<i class='fa fa-check'></i>"+
                       "</a>"+
                       "</div>"+
                       "</div>"+
                       "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                       "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                       "<img class='card-img' src="+value.imgPath+"/"+value.renameImg+" alt='dog' style='height: 100%;'>"+
                       "</a>"+
                       "</div>"+
                       "<div class='card-footer row'>"+
                       "<div class='col-3 form-inline'>"+
                       "<a onclick='like(this);'><i class='far fa-heart'style='color: red; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                       "<p style='margin: 0px; margin-left:5px;'value="+value.pno+">"+value.likeCount+"</p>"+
                       "</div>"+
                       "<div class='col-3 form-inline' style='padding: 0px;'>"+
                       "<a href=''><i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i></a>"+
                       "<p style='margin-left:5px;margin: 0px;'>"+value.replyCount+"</p>"+
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
      <%--   <div class="col-3">
             <div class="component">
               <div class="card" style="overflow: hidden;">

                  <div class="card-body" style="height: 400px; padding: 0px;">
                     <img class="card-img"
                        src="${pageContext.request.contextPath}/resources/assets/img/dog-2.jpg"
                        alt="dog" style="height: 100%;">
                  </div>
                  <div class="card-footer" style="padding: 0px">
                     <figcaption class="card-caption form-inline"
                        style="left: 0px; right: 0px;">
                        <b class="pop-rank pull-left"
                           style="line-height: 41px; font-size: 30px; padding: 7px 12px 6px;">1st</b>
                        <div class="photographer"
                           style="padding-top: 7px; padding-bottom: 7px; line-height: 20px; font-size: 14px;">
                           <!-- react-text: 1729 -->
                           Inspired by
                           <!-- /react-text -->
                           <b>StyleBlending</b>
                        </div>
                     </figcaption>
                  </div>
               </div>
            </div> 
         </div>
--%>
   <%--       <div class="col-3">
            <div class="component">
               <div class="card" style="overflow: hidden;">

                  <div class="card-body" style="height: 400px; padding: 0px;">
                     <img class="card-img"
                        src="${pageContext.request.contextPath}/resources/assets/img/dog-2.jpg"
                        alt="dog" style="height: 100%;">
                  </div>
                  <div class="card-footer" style="padding: 0px">
                     <figcaption class="card-caption form-inline"
                        style="left: 0px; right: 0px;">
                        <b class="pop-rank pull-left"
                           style="line-height: 41px; font-size: 30px; padding: 7px 12px 6px;">2nd</b>
                        <div class="photographer"
                           style="padding-top: 7px; padding-bottom: 7px; line-height: 20px; font-size: 14px;">
                           <!-- react-text: 1729 -->
                           Inspired by
                           <!-- /react-text -->
                           <b>StyleBlending</b>
                        </div>
                     </figcaption>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-3">
            <div class="component">
               <div class="card" style="overflow: hidden;">

                  <div class="card-body" style="height: 400px; padding: 0px;">
                     <img class="card-img"
                        src="${pageContext.request.contextPath}/resources/assets/img/dog-2.jpg"
                        alt="dog" style="height: 100%;">
                  </div>
                  <div class="card-footer" style="padding: 0px">
                     <figcaption class="card-caption form-inline"
                        style="left: 0px; right: 0px;">
                        <b class="pop-rank pull-left"
                           style="line-height: 41px; font-size: 30px; padding: 7px 12px 6px;">3rd</b>
                        <div class="photographer"
                           style="padding-top: 7px; padding-bottom: 7px; line-height: 20px; font-size: 14px;">
                           <!-- react-text: 1729 -->
                           Inspired by
                           <!-- /react-text -->
                           <b>StyleBlending</b>
                        </div>
                     </figcaption>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-3">
            <div class="component">
               <div class="card" style="overflow: hidden;">

                  <div class="card-body" style="height: 400px; padding: 0px;">
                     <img class="card-img"
                        src="${pageContext.request.contextPath}/resources/assets/img/dog-2.jpg"
                        alt="dog" style="height: 100%;">
                  </div>
                  <div class="card-footer" style="padding: 0px">
                     <figcaption class="card-caption form-inline"
                        style="left: 0px; right: 0px;">
                        <b class="pop-rank pull-left"
                           style="line-height: 41px; font-size: 30px; padding: 7px 12px 6px;">4th</b>
                        <div class="photographer"
                           style="padding-top: 7px; padding-bottom: 7px; line-height: 20px; font-size: 14px;">
                           <!-- react-text: 1729 -->
                           Inspired by
                           <!-- /react-text -->
                           <b>StyleBlending</b>
                        </div>
                     </figcaption>
                  </div>
               </div>
            </div>
         </div>
 --%>
 
 
 
       <div class="row mt-3" id="inputWrap">
       <%-- 
             <div class="col-md-4">
               <div class="component">
                  <div class="card" style="overflow: hidden;">
                     <div class="form-inline"
                        style="width: 100%; height: 80px; margin: 0px; color: black;">

                        <div class="col-2"
                           style="width: 30%; height: 50px; padding: 0px;">
                           <img
                              src="${pageContext.request.contextPath}/resources/assets/img/배너일.png"
                              alt="" style="width: 80px; height: 50px; margin-left: 20px;" />
                        </div>
                        <div class="col-6"
                           style="width: 50%; height: 50px; margin-left: 30px;">
                           <span style="margin-bottom: 0px; margin-top: 23px;">kimsh940607<br>30주전
                           </span>

                        </div>
                        <div class="col-3"
                           style="width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;">
                           <button class="btn btn-dark">
                              <span style="font-size: 1.2em">+Fan</span>
                           </button>

                        </div>
                     </div>

                     <div class="card-body" style="height: 400px; padding: 0px;">
                        <a href="pInfo.do?id=1"
                           style="border-bottom: 0px !important; text-decoration: none black;">
                           <img class="card-img"
                           src="${pageContext.request.contextPath}/resources/assets/img/dog-2.jpg"
                           alt="dog" style="height: 100%;">
                        </a>
                     </div>
                     <div class="card-footer row">
                        <div class="col-3 form-inline">
                           <a href=""><i class="far fa-heart"
                              style="color: black; font-size: 30px;"></i> </a>
                           <p style="margin: 0px;">30</p>
                        </div>
                        <div class="col-3 form-inline" style="padding: 0px;">
                           <a href=""><i class="far fa-comment" aria-hidden="true"
                              style="color: black; font-size: 30px;"></i></a>
                           <p style="margin: 0px;">30</p>
                        </div>


                     </div>
                  </div>
               </div>
            </div>
            <div class="col-md-4">
               <div class="component">
                  <div class="card" style="overflow: hidden;">
                     <div class="form-inline"
                        style="width: 100%; height: 80px; margin: 0px; color: black;">

                        <div class="col-2"
                           style="width: 30%; height: 50px; padding: 0px;">
                           <img
                              src="${pageContext.request.contextPath}/resources/assets/img/배너일.png"
                              alt="" style="width: 80px; height: 50px; margin-left: 20px;" />
                        </div>
                        <div class="col-6"
                           style="width: 50%; height: 50px; margin-left: 30px;">
                           <span style="margin-bottom: 0px; margin-top: 23px;">kimsh940607<br>30주전
                           </span>

                        </div>
                        <div class="col-3"
                           style="width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;">
                           <button class="btn btn-dark">
                              <span style="font-size: 1.2em">+Fan</span>
                           </button>

                        </div>
                     </div>

                     <div class="card-body" style="height: 400px; padding: 0px;">
                        <a href="pInfo.do?id=1"
                           style="border-bottom: 0px !important; text-decoration: none black;">
                           <img class="card-img"
                           src="${pageContext.request.contextPath}/resources/assets/img/dog-2.jpg"
                           alt="dog" style="height: 100%;">
                        </a>
                     </div>
                     <div class="card-footer row">
                        <div class="col-3 form-inline">
                           <a href=""><i class="far fa-heart"
                              style="color: black; font-size: 30px;"></i> </a>
                           <p style="margin: 0px;">30</p>
                        </div>
                        <div class="col-3 form-inline" style="padding: 0px;">
                           <a href=""><i class="far fa-comment" aria-hidden="true"
                              style="color: black; font-size: 30px;"></i></a>
                           <p style="margin: 0px;">30</p>
                        </div>


                     </div>
                  </div>
               </div>
            </div>
            <div class="col-md-4">
               <div class="component">
                  <div class="card" style="overflow: hidden;">
                     <div class="form-inline"
                        style="width: 100%; height: 80px; margin: 0px; color: black;">

                        <div class="col-2"
                           style="width: 30%; height: 50px; padding: 0px;">
                           <img
                              src="${pageContext.request.contextPath}/resources/assets/img/배너일.png"
                              alt="" style="width: 80px; height: 50px; margin-left: 20px;" />
                        </div>
                        <div class="col-6"
                           style="width: 50%; height: 50px; margin-left: 30px;">
                           <span style="margin-bottom: 0px; margin-top: 23px;">kimsh940607<br>30주전
                           </span>

                        </div>
                        <div class="col-3"
                           style="width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;">
                           <button class="btn btn-dark">
                              <span style="font-size: 1.2em">+Fan</span>
                           </button>

                        </div>
                     </div>

                     <div class="card-body" style="height: 400px; padding: 0px;">
                        <a href="pInfo.do?id=1"
                           style="border-bottom: 0px !important; text-decoration: none black;">
                           <img class="card-img"
                           src="${pageContext.request.contextPath}/resources/assets/img/dog-2.jpg"
                           alt="dog" style="height: 100%;">
                        </a>
                     </div>
                     <div class="card-footer row">
                        <div class="col-3 form-inline">
                           <a href=""><i class="far fa-heart"
                              style="color: black; font-size: 30px;"></i> </a>
                           <p style="margin: 0px;">30</p>
                        </div>
                        <div class="col-3 form-inline" style="padding: 0px;">
                           <a href=""><i class="far fa-comment" aria-hidden="true"
                              style="color: black; font-size: 30px;"></i></a>
                           <p style="margin: 0px;">30</p>
                        </div>


                     </div>
                  </div>
               </div>
            </div>
         <div class="row mt-3">
            <div class="col-md-4">
               <div class="component">
                  <div class="card">
                     <a href="pInfo.do">
                        <div class="card-header">
                           <img class="card-img"
                              src="${pageContext.request.contextPath}/resources/assets/img/dog-1.jpg"
                              alt="dog">
                        </div>
                     </a>
                     <div class="card-body">
                        <span class="badge badge-success mb-2">Pets</span>
                        <h4 class="card-title">How to look after and care for a dog</h4>
                        <p class="card-text">Owning a dog is great fun and immensely
                           rewarding. But, dogs have complex needs and each dog is unique.
                        </p>
                     </div>
                     <div class="card-footer">
                        <a href="#a" class="btn btn-primary">Read More</a>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-md-4">
               <div class="component">
                  <div class="card">
                     <div class="card-header">
                        <img class="card-img"
                           src="${pageContext.request.contextPath}/resources/assets/img/dog-2.jpg"
                           alt="dog">
                     </div>
                     <div class="card-body">
                        <span class="badge badge-warning mb-2">Vacation</span>
                        <h4 class="card-title">Woof! How to find dog-friendly
                           beaches in Spain</h4>
                        <p class="card-text">Considering Spain's abundant coastline,
                           beaches that do allow you to take your pooch to feel sand...</p>
                     </div>
                     <div class="card-footer">
                        <a href="#a" class="btn btn-outline-primary">Read More</a>
                     </div>
                  </div>
               </div>
            </div>

            <div class="col-md-4">
               <div class="component">
                  <div class="card">
                     <div class="card-header">
                        <img class="card-img"
                           src="${pageContext.request.contextPath}/resources/assets/img/dog-3.jpg"
                           alt="dog">
                     </div>
                     <div class="card-body">
                        <span class="badge badge-secondary mb-2">Hobby</span>
                        <h4 class="card-title">Getting Started With Your Puppy</h4>
                        <p class="card-text">This new addition to your family will
                           require lots of love, attention and plenty of supplies.</p>
                     </div>
                     <div class="card-footer">
                        <a href="#a" class="btn btn-outline-primary">Read More</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="row mt-3" id="ttt">
            <div class="col-md-4">
               <div class="component">
                  <div class="card">
                     <a href="pInfo">
                        <div class="card-header">
                           <img class="card-img"
                              src="${pageContext.request.contextPath}/resources/assets/img/dog-1.jpg"
                              alt="dog">
                        </div>
                     </a>
                     <div class="card-body">
                        <span class="badge badge-success mb-2">Pets</span>
                        <h4 class="card-title">How to look after and care for a dog</h4>
                        <p class="card-text">Owning a dog is great fun and immensely
                           rewarding. But, dogs have complex needs and each dog is unique.
                        </p>
                     </div>
                     <div class="card-footer">
                        <a href="#a" class="btn btn-primary">Read More</a>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-md-4">
               <div class="component">
                  <div class="card">
                     <div class="card-header">
                        <img class="card-img"
                           src="${pageContext.request.contextPath}/resources/assets/img/dog-2.jpg"
                           alt="dog">
                     </div>
                     <div class="card-body">
                        <span class="badge badge-warning mb-2">Vacation</span>
                        <h4 class="card-title">Woof! How to find dog-friendly
                           beaches in Spain</h4>
                        <p class="card-text">Considering Spain's abundant coastline,
                           beaches that do allow you to take your pooch to feel sand...</p>
                     </div>
                     <div class="card-footer">
                        <a href="#a" class="btn btn-outline-primary">Read More</a>
                     </div>
                  </div>
               </div>
            </div>

            <div class="col-md-4" id="ddd">
               <div class="component">
                  <div class="card">
                     <div class="card-header">
                        <img class="card-img"
                           src="${pageContext.request.contextPath}/resources/assets/img/dog-3.jpg"
                           alt="dog">
                     </div>
                     <div class="card-body">
                        <span class="badge badge-secondary mb-2">Hobby</span>
                        <h4 class="card-title">Getting Started With Your Puppy</h4>
                        <p class="card-text">This new addition to your family will
                           require lots of love, attention and plenty of supplies.</p>
                     </div>
                     <div class="card-footer">
                        <a href="#a" class="btn btn-outline-primary">Read More</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
 --%>
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
               
               var height = $(window).height() - 920;
               if ($(window).scrollTop() == height&& sel == null && $(document).height() != 5053) {
                  
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
                               "<img src='${pageContext.request.contextPath}/resources/assets/img/배너일.png' style='width: 80px; height: 50px; margin-left: 20px;' />" +
                               "</div>"+
                               "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                               "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                               "</div>"+
                               "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                               "<button class='btn btn-light'>"+
                                "<span style='font-size: 1.2em'>+Fan</span>"+
                               "</button>"+
                               "</div>"+
                               "</div>"+
                               "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                               "<a href='pInfo.do?id="+value.pno+" 'style='border-bottom: 0px !important; text-decoration: none black;'>"+
                               "<img class='card-img' src="+value.imgPath+"/"+value.renameImg+" alt='dog' style='height: 100%;'>"+
                               "</a>"+
                               "</div>"+
                               "<div class='card-footer row'>"+
                               "<div class='col-3 form-inline'>"+
                               "<a onclick=unLike();><i class='far fa-heart'style='color: gray; font-size: 30px;'></i></a>"+
                               "<p style='margin: 0px;margin-left:5px;'>"+value.likeCount+"</p>"+
                               "</div>"+
                               "<div class='col-3 form-inline' style='padding: 0px;'>"+
                               "<a href=''><i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i></a>"+
                               "<p style='margin: 0px;margin-left:5px;'>"+value.replyCount+"</p>"+
                               "</div>"+
                               "</div>"+
                               "</div>"+
                               "</div>"+
                               "</div>"; 
                              
                           }else{

                           
                               if(value.loginLike == 0){ //조아요 안함
                                  $input = "<div class='col-md-4 mt-3'>"+
                                  "<div class='component'>"+ 
                                  "<div class='card' style='overflow:hidden;'>"+
                                  "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                                  "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                                  "<img src='${pageContext.request.contextPath}/resources/assets/img/배너일.png' style='width: 80px; height: 50px; margin-left: 20px;' />" +
                                  "</div>"+
                                  "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                                  "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                                  "</div>"+
                                  "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                                  "<button class='btn btn-light'>"+
                                   "<span style='font-size: 1.2em'>+Fan</span>"+
                                  "</button>"+
                                  "</div>"+
                                  "</div>"+
                                  "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                                  "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                                  "<img class='card-img' src="+value.imgPath+"/"+value.renameImg+" alt='dog' style='height: 100%;'>"+
                                  "</a>"+
                                  "</div>"+
                                  "<div class='card-footer row'>"+
                                  "<div class='col-3 form-inline'>"+
                                  "<a onclick='like(this);'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                                  "<p style='margin: 0px; margin-left:5px;'value="+value.pno+">"+value.likeCount+"</p>"+
                                  "</div>"+
                                  "<div class='col-3 form-inline' style='padding: 0px;'>"+
                                  "<a href=''><i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i></a>"+
                                  "<p style='margin-left:5px;margin: 0px;'>"+value.replyCount+"</p>"+
                                  "</div>"+
                                  "</div>"+
                                  "</div>"+
                                  "</div>"+
                                  "</div>";
                               }else{
                                  $input = "<div class='col-md-4 mt-3'>"+
                                  "<div class='component'>"+ 
                                  "<div class='card' style='overflow:hidden;'>"+
                                  "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                                  "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                                  "<img src='${pageContext.request.contextPath}/resources/assets/img/배너일.png' style='width: 80px; height: 50px; margin-left: 20px;' />" +
                                  "</div>"+
                                  "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                                  "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                                  "</div>"+
                                  "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                                  "<button class='btn btn-light'>"+
                                   "<span style='font-size: 1.2em'>+Fan</span>"+
                                  "</button>"+
                                  "</div>"+
                                  "</div>"+
                                  "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                                  "<a href='pInfo.do?id="+value.pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                                  "<img class='card-img' src="+value.imgPath+"/"+value.renameImg+" alt='dog' style='height: 100%;'>"+
                                  "</a>"+
                                  "</div>"+
                                  "<div class='card-footer row'>"+
                                  "<div class='col-3 form-inline'>"+
                                  "<a onclick='like(this);'><i class='fa fa-heart'style='color: red; font-size: 30px;'></i><input type='hidden' value="+value.pno+" id='hiddenpno'/><input type='hidden' value="+value.mno+" id='hiddenmno'/></a>"+
                                  "<p style='margin: 0px; margin-left:5px;'value="+value.pno+">"+value.likeCount+"</p>"+
                                  "</div>"+
                                  "<div class='col-3 form-inline' style='padding: 0px;'>"+
                                  "<a href=''><i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i></a>"+
                                  "<p style='margin-left:5px;margin: 0px;'>"+value.replyCount+"</p>"+
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
                     //$("#loading").remove();
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
         console.log(category);
         
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
               if(data.length == 1){
                  var loginUser = "${loginUser.mno}";
                  if(loginUser == null || loginUser == ""){
                     $input = "<div class='col-md-4 mt-3'>"+
                      "<div class='component' style='width:360px;'>"+ 
                      "<div class='card' style='overflow:hidden;'>"+
                      "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                      "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                      "<img src='${pageContext.request.contextPath}/resources/assets/img/배너일.png' style='width: 80px; height: 50px; margin-left: 20px;' />" +
                      "</div>"+
                      "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                      "<span style='margin-bottom: 0px; margin-top: 23px;'>"+data[0].nickName+"<br>"+data[0].enrollDate+"</span>"+
                      "</div>"+
                      "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                      "<button class='btn btn-light'>"+
                       "<span style='font-size: 1.2em'>+Fan</span>"+
                      "</button>"+
                      "</div>"+
                      "</div>"+
                      "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                      "<a href='pInfo.do?id="+data[0].pno+" 'style='border-bottom: 0px !important; text-decoration: none black;'>"+
                      "<img class='card-img' src="+data[0].imgPath+"/"+data[0].renameImg+" alt='dog' style='height: 100%;'>"+
                      "</a>"+
                      "</div>"+
                      "<div class='card-footer row'>"+
                      "<div class='col-3 form-inline'>"+
                      "<a onclick=unLike();><i class='far fa-heart'style='color: gray; font-size: 30px;'></i></a>"+
                      "<p style='margin: 0px;margin-left:5px;'>"+data[0].likeCount+"</p>"+
                      "</div>"+
                      "<div class='col-3 form-inline' style='padding: 0px;'>"+
                      "<a href=''><i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i></a>"+
                      "<p style='margin: 0px;margin-left:5px;'>"+data[0].replyCount+"</p>"+
                      "</div>"+
                      "</div>"+
                      "</div>"+
                      "</div>"+
                      "</div>";    
                  }else{
                      if(data[0].loginLike == 0){ //조아요 안함
                         $input = "<div class='col-md-4 mt-3'>"+
                         "<div class='component' style='width:360px;'>"+ 
                         "<div class='card' style='overflow:hidden;'>"+
                         "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                         "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                         "<img src='${pageContext.request.contextPath}/resources/assets/img/배너일.png' style='width: 80px; height: 50px; margin-left: 20px;' />" +
                         "</div>"+
                         "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                         "<span style='margin-bottom: 0px; margin-top: 23px;'>"+data[0].nickName+"<br>"+data[0].enrollDate+"</span>"+
                         "</div>"+
                         "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                         "<button class='btn btn-light'>"+
                          "<span style='font-size: 1.2em'>+Fan</span>"+
                         "</button>"+
                         "</div>"+
                         "</div>"+
                         "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                         "<a href='pInfo.do?="+data[0].pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                         "<img class='card-img' src="+data[0].imgPath+"/"+data[0].renameImg+" alt='dog' style='height: 100%;'>"+
                         "</a>"+
                         "</div>"+
                         "<div class='card-footer row'>"+
                         "<div class='col-3 form-inline'>"+
                         "<a onclick='filterLike(this);'><i class='far fa-heart'style='color: gray; font-size: 30px;'></i><input type='hidden' value="+data[0].pno+" id='hiddenpno'/><input type='hidden' value="+data[0].mno+" id='hiddenmno'/></a>"+
                         "<p style='margin: 0px; margin-left:5px;'value="+data[0].pno+">"+data[0].likeCount+"</p>"+
                         "</div>"+
                         "<div class='col-3 form-inline' style='padding: 0px;'>"+
                         "<a href=''><i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i></a>"+
                         "<p style='margin-left:5px;margin: 0px;'>"+data[0].replyCount+"</p>"+
                         "</div>"+
                         "</div>"+
                         "</div>"+
                         "</div>"+
                         "</div>";
                      }else{
                         $input = "<div class='col-md-4 mt-3'>"+
                         "<div class='component' style='width:360px;'>"+ 
                         "<div class='card' style='overflow:hidden;'>"+
                         "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
                         "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
                         "<img src='${pageContext.request.contextPath}/resources/assets/img/배너일.png' style='width: 80px; height: 50px; margin-left: 20px;' />" +
                         "</div>"+
                         "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                         "<span style='margin-bottom: 0px; margin-top: 23px;'>"+data[0].nickName+"<br>"+data[0].enrollDate+"</span>"+
                         "</div>"+
                         "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
                         "<button class='btn btn-light'>"+
                          "<span style='font-size: 1.2em'>+Fan</span>"+
                         "</button>"+
                         "</div>"+
                         "</div>"+
                         "<div class='card-body' style='height: 400px; padding: 0px;'>"+
                         "<a href='pInfo.do?id="+data[0].pno+"' style='border-bottom: 0px !important; text-decoration: none black;'>"+
                         "<img class='card-img' src="+data[0].imgPath+"/"+data[0].renameImg+" alt='dog' style='height: 100%;'>"+
                         "</a>"+
                         "</div>"+
                         "<div class='card-footer row'>"+
                         "<div class='col-3 form-inline'>"+
                         "<a onclick='filterLike(this);'><i class='fa fa-heart'style='color: red; font-size: 30px;'></i><input type='hidden' value="+data[0].pno+" id='hiddenpno'/><input type='hidden' value="+data[0].mno+" id='hiddenmno'/></a>"+
                         "<p style='margin: 0px; margin-left:5px;'value="+data[0].pno+">"+data[0].likeCount+"</p>"+
                         "</div>"+
                         "<div class='col-3 form-inline' style='padding: 0px;'>"+
                         "<a href=''><i class='far fa-comment' aria-hidden='true' style='color: gray; font-size: 30px;'></i></a>"+
                         "<p style='margin-left:5px;margin: 0px;'>"+data[0].replyCount+"</p>"+
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
                         "<img src='${pageContext.request.contextPath}/resources/assets/img/배너일.png' style='width: 80px; height: 50px; margin-left: 20px;' />" +
                         "</div>"+
                         "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
                         "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
                         "</div>"+
                