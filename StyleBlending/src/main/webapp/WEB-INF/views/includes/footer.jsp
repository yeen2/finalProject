<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


	<footer class="footer-1 bg-light text-dark" style="margin-top: 100px;">
		<div class="container">
			<div class="d-flex flex-column flex-md-row justify-content-between align-items-center">
				<div class="links">
					<ul class="footer-menu list-unstyled d-flex flex-row text-center text-md-left">
						<li><a href="${pageContext.request.contextPath}/WEB-INF/views/includes/notice.jsp" target="_blank">공지사항</a></li>
						<li><a href="https://bootstrapbay.com/about" target="_blank">사이트소개</a></li>
						<li><a href="https://bootstrapbay.com/blog/" target="_blank">광고문의</a></li>
						<li><a href="https://bootstrapbay.com/terms" target="_blank">비즈니스</a></li>
						
					</ul>
				</div>
				<div class="social mt-4 mt-md-0">
					<a class="twitter btn btn-outline-primary btn-icon"
						href="https://twitter.com/bootstrapbay" target="_blank"> 
						<i class="fab fa-twitter"></i> 
						<span class="sr-only">
						View our Twitter Profile</span>
					</a> 
					<a class="facebook btn btn-outline-primary btn-icon"
							href="https://www.facebook.com/bootstrapbayofficial/"
							target="_blank"> 
						<i class="fab fa-facebook"></i> 
						<span class="sr-only">View our Facebook Profile <span>
					</a> 
					<a class="github btn btn-outline-primary btn-icon"
							href="https://github.com/bootstrapbay" target="_blank"> 
						<i class="fab fa-github"></i> 
						<span class="sr-only">View our GitHub Profile</span>
					</a>
				</div>
			</div>
			<div class="copyright text-center">
				<hr/>
				<p class="small"> &copy; 2019, made with 
					<span class="text-danger">
					<i class="fas fa-heart"></i></span> 
					by styleblending
				</p>
			</div>
		</div>
	</footer>
<!-- 	<script>
	var page = 2;

	$(window).scroll(function() {
	    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	      console.log(++page);
	      //$("#ddd").append("<div class='row mt-3' style='border:1px solid black;'>");
	      var dlendud=$('#ttt').clone();
	   //   dlendud.find('img').eq(0).attr('src','~~~"')
	      $('.eee').append('<div class="row mt-3">'+dlendud.html()+'</div>');
	      $('.eee').append("<i class='ddd fa fa-spinner fa-pulse fa-fw fa-5x'></i> ");
			
	      //$('.eee').append(dlendud.html());

	    }else{
	    	$('.ddd').removeAttr('class')
	    }
	});</script>
 -->
 </body>
</html>