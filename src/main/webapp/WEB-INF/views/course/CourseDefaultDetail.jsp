<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<!-- Google font -->
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Raleway:300,400,700,900'
	rel='stylesheet' type='text/css'>
<!-- Css -->
<<<<<<< HEAD
<link rel="stylesheet" type="text/css" href="resources/javatree_view/html/css/library/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/javatree_view/html/css/library/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/javatree_view/html/css/library/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="resources/javatree_view/html/css/md-font.css">
<link rel="stylesheet" type="text/css" href="resources/javatree_view/html/css/style.css">
=======
<link rel="stylesheet" type="text/css"
	href="../resources/javatree_view/html/css/library/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/javatree_view/html/css/library/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/javatree_view/html/css/library/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="../resources/javatree_view/html/css/md-font.css">
<link rel="stylesheet" type="text/css"
	href="../resources/javatree_view/html/css/style.css">
>>>>>>> a7afe6f4d17944dcdecf9cc0bceaa0946778f254
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
    
<title>CourseDefaultDetail</title>
</head>
<body>
<%@include file="/resources/header.jsp" %>
	
		<!-- 가운데 영역 -->
	<section class="blog2">

		<div class="mid-detail-course">
			<div class="container">
			 <h3>About Course</h3>
			<div class="coursedetail-bg">
				<div class="create-course-content2">

					<!-- PROMO VIDEO -->
					<div class="promo-video create-item">
						
							<div class="create-course-1">
								<h4>Title</h4>
							</div>
							<div class="create-course-4">
								<div class="form-item">
									<input type="text" placeholder="title" value="<s:property value="coursename" />" readonly="readonly">
								</div>
							</div>
						
					</div>
					<!-- END / PROMO VIDEO -->
				</div>
				<br>
				<div class="create-course-content2">
				
							<!-- PROMO VIDEO -->
					<div class="promo-video create-item">
						
							<div class="create-course-1">
								<h4>Introduction</h4>
							</div>
							<div class="create-course-4">
								<div class="description-editor text-form-editor">
									<textarea placeholder="Discription" readonly="readonly"><s:property value="introdution" /></textarea>
								</div>
							</div>
						
						
					</div>
					<!-- END / PROMO VIDEO -->		
				</div>
				</div>
			</div>
		</div>
		<div id="courseDetail" class="courseDetail learn-section">
			<div class="container">

				<div class="table-student-submission" >
					<table class="mc-table" >
						<thead>
							<tr>
								<th class="submissions2">Lecture List</th>
								<th class="author"></th>
								<th class="score"></th>
								<th class="submit-date"></th>
								<th class=""></th>
							</tr>
						</thead>

						<tbody>
						
						<s:iterator value="lectureList" status="counter">
							<tr class="new">
								<td class="submissions"><a href="#"><s:property value="#counter.index + 1" />.&nbsp;&nbsp;&nbsp;<s:property value="lecturename" /></a></td>
								<td class="author"></td>
								<td class="score"></td>
								<td class="submit-date"></td>
								<td class="submit-date"><s:property value="regdate" /></td>
								
								<s:if test="studying != null">
									<td class="submit-date"><a href="watchLecture.action?lectureno="<s:property value="lectureno" />>Watch</a></td>
								</s:if>
								<s:else>
									<td class="submit-date"><a href='insertLectureForStudy.action?lectureno=<s:property value="lectureno" />&courseno=<s:property value="courseno" />
									&coursename=<s:property value="coursename" />&teacherid=<s:property value="teacherid" />'>Apply</a></td>
								</s:else>
								
							</tr>
						</s:iterator>
							

						</tbody>
					</table>
				</div>



				<div class="paging" align="center">
					<ul class="pager">
						
						 
            <s:if test="#session.currentPage == 1 & #session.endPageGroup == 1">
             <li><a href = "#"> <s:property value="#session.currentPage"/> </a></li>
             </s:if>
            
            <s:elseif test="#session.currentPage == 1 & #session.endPageGroup != 1">
            <li><a href = "#"> <s:property value="#session.currentPage"/>/<s:property value="#session.endPageGroup"/> </a></li>
             <li><a href = "plusCourseDefaultDetail.action?currentPage=<s:property value="#session.currentPage + 1"/>&courseno=<s:property value="courseno"/>">next &gt</a></li>
            </s:elseif>
			
			<s:elseif test="#session.currentPage == #session.endPageGroup & #session.endPageGroup != 1">
             <li><a href = "plusCourseDefaultDetail.action?currentPage=<s:property value="#session.currentPage - 1"/>&courseno=<s:property value="courseno"/>">&lt prev</a></li>
            <li><a href = "#"> <s:property value="#session.currentPage"/>/<s:property value="#session.endPageGroup"/>  </a></li>
            </s:elseif>
			
			<s:else>
             <li><a href = "plusCourseDefaultDetail.action?currentPage=<s:property value="#session.currentPage - 1"/>&courseno=<s:property value="courseno"/>">&lt prev</a></li>
             <li><a href = "#"> <s:property value="#session.currentPage"/>/<s:property value="#session.endPageGroup"/>  </a></li>
             <li><a href = "plusCourseDefaultDetail.action?currentPage=<s:property value="#session.currentPage + 1"/>&courseno=<s:property value="courseno"/>">next &gt</a></li>
            </s:else>
						
				<!-- 		<li class="pager-current">1</li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">next ›</a></li>
						<li><a href="#">last »</a></li> -->
					</ul>
				</div>

			</div>
		</div>





	</section>
	
	<!-- FOOTER -->
	<footer id="footer" class="footer">
		<div class="second-footer">
			<div class="container">
				<div class="contact">
					<div class="email">
						<i class="icon md-email"></i> <a href="#">course@megadrupal.com</a>
					</div>
					<div class="phone">
						<i class="fa fa-mobile"></i> <span>+84 989 999 888</span>
					</div>
					<div class="address">
						<i class="fa fa-map-marker"></i> <span>Maecenas
							sodales,nisl eget</span>
					</div>
				</div>
				<p class="copyright">Copyright © 2014 Megadrupal. All rights
					reserved.</p>
			</div>
		</div>
	</footer>
	<!-- END / FOOTER -->

<<<<<<< HEAD
</body>
=======
	<!-- Load jQuery -->
	<script src="../resources/jquery-2.2.3.min.js"></script>
	<script src="../resources/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/jquery-1.11.0.min.js"></script>
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/jquery.owl.carousel.js"></script>
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/jquery.appear.min.js"></script>
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/perfect-scrollbar.min.js"></script>
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/jquery.easing.min.js"></script>
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/scripts.js"></script>
	
	<s:if test="message != null">
  		<script type="text/javascript">
   		var result = "${message}";
   		alert(result);
	</script>
 </s:if>
	
	<script>
	
	$(document).ready(function() { 
		
		// BackSpace 키 방지 이벤트
	    $(document).keydown(function(e){   
	        if(e.target.nodeName != "INPUT" && e.target.nodeName != "TEXTAREA"){       
	            if(e.keyCode === 8){   
	            return false;
	            }
	        }
	    });
	 
	    window.history.forward(0);
	    
	    //뒤로가기 버튼 방지
	    history.pushState(null, null, "#noback");
	    $(window).bind("hashchange", function(){
	      history.pushState(null, null, "#noback");
	    });
	    
	  //우클릭방지
	    var cancel=function(e){
	    	  if (window.event) {
	    	   window.event.cancelBubble = true;
	    	   window.event.returnValue = false;
	    	  }
	    	  if (e && e.stopPropagation && e.preventDefault) {
	    	   e.stopPropagation();
	    	   e.preventDefault();
	    	  }
	    	  return false;
	    	 };
	    	 var block=function(e){
	    	  e = e || window.event;
	    	  var t=e.srcElement || e.target;
	    	  var tag=t.tagName;
	    	  if (e && tag==='HTML' || tag==='INPUT' || tag==='TEXTAREA' || tag==='BUTTON' || tag==='SELECT' || tag==='OPTION' || tag==='EMBED' || tag==='OBJECT') { return; }
	    	  if (e.type==='keydown' || e.type=='keyup') {
	    	   // keyboard event : only block ctrl-A, ctrl-a, ctrl-C, ctrl-c, meta-A, meta-a, meta-C, meta-c
	    	   if ((e.ctrlKey || e.metaKey) && (e.keyCode == 65 || e.keyCode == 97 || e.keyCode == 67 || e.keyCode == 99)) { return cancel(e); }
	    	  } else if(e.type == "contextmenu"){
	    	   alert('우클릭 금지!');
	    	   return cancel(e);
	    	  } else {
	    	   return cancel(e);
	    	  }
	    	 }
	    	 var addEvent = function(el, type, fn){
	    	     if (window.addEventListener) {
	    	         el.addEventListener(type, fn, false);
	    	     }
	    	     else if (window.attachEvent) {
	    	         el.attachEvent('on' + type, fn);
	    	     }
	    	     else {
	    	         el['on' + type] = fn;
	    	     }
	    	 }
	    	 var addBlockEvent = function(){
	    	  addEvent(document.body,'keydown',block);
	    	  addEvent(document.body,'keyup',block);
	    	  addEvent(document.body,'mouseup',block);
	    	  addEvent(document.body,'mousedown',block);
	    	  addEvent(document.body,'dragstart',block);
	    	  addEvent(document.body,'selectstart',block);
	    	  addEvent(document.body,'copy',block);
	    	  addEvent(document.body,'contextmenu', block);
	    	 }
	    	 addEvent(window,'load',addBlockEvent);
	    	})();
	    
	    
	/* }); */
	
	</script>
	
	</body>
>>>>>>> a7afe6f4d17944dcdecf9cc0bceaa0946778f254
</html>