<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<!-- Google font -->
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700'rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:300,400,700,900' rel='stylesheet' type='text/css'>
<!-- Css -->
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/library/bootstrap.min.css">
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/library/font-awesome.min.css">
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/library/owl.carousel.css">
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/md-font.css">
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/style.css">
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
<title>insertLecture</title>
<script>
function insertLectureForm(){
	alert("강의등록폼옴>>");
	var form = document.getElementById("insertLectureForm");
	/* var lecturename= document.getElementById("lecturename").value;
	var regdate= document.getElementById("regdate").value;
	
	if(lecturename==""){
		alert("강의명을 입력해 주세요.");
		return false;
	}
	if(regdate=""){
		alert("강의시작 날짜를 입력해 주세요.");
		return false;
	}
	 */
	form.submit();
}

/* function questionBox(){
	window.open('codingForm.action','pop','resizable=no scrollbars=yes top=300 left=500 width=300 height=180');	
} */

function stgoback(){
	alert("등록을 그만하시겠습니까");
	location.href="/javatree/course/selectAllCourseListForTeach.action";
}

</script>

</head>
<body>
<!-- HEADER -->
		<header id="header" class="header">
			<div class="container">

				<!-- LOGO -->
				<div class="logo">
					<a href="index.html"><img
						src="resources/javatree_view/html/images/logo.png" alt=""></a>
				</div>
				<!-- END / LOGO -->

				<!-- NAVIGATION -->
				<nav class="navigation">

					<div class="open-menu">
						<span class="item item-1"></span> <span class="item item-2"></span>
						<span class="item item-3"></span>
					</div>

					<!-- MENU -->
					<ul class="menu">
						<li class="current-menu-item"><a href="index.html">HOME</a></li>
						<li class="menu-item-has-children megamenu col-4"><a href="#">COURSE</a>
							<ul class="sub-menu">
								<li class="menu-item-has-children"><a href="#">Account
										1</a>
									<ul class="sub-menu">
										<li><a href="account-assignment.html">Account
												Assignment</a></li>
										<li><a href="account-inbox.html">Account Inbox</a></li>
										<li><a href="account-learning.html">Account Learning</a></li>
										<li><a href="account-profile-owner-view.html">Account
												Profile Owner</a></li>
										<li><a href="account-profile-guest-view.html">Account
												Profile Guest</a></li>
										<li><a href="account-teaching.html">Account Teaching</a></li>
										<li><a href="setting.html">Setting</a></li>
									</ul></li>

								<li class="menu-item-has-children"><a href="#">Asignment
										2</a>
									<ul class="sub-menu">
										<li><a href="asignment-after-submit.html">Asignment
												After Submit</a></li>
										<li><a href="asignment-list.html">Asignment List</a></li>
										<li><a href="asignment-marking.html">Asignment
												Marking</a></li>
										<li><a href="asignment-received.html">Asignment
												Received</a></li>
										<li><a href="asignment-submit.html">Asignment Submit</a></li>
										<li><a href="become-teacher.html">Become Teacher</a></li>
										<li><a href="categories.html">Categories</a></li>
									</ul></li>
								<li class="menu-item-has-children"><a href="#">Course 3</a>
									<ul class="sub-menu">
										<li><a href="course-intro.html">Course Intro</a></li>
										<li><a href="course-learn.html">Course Learn</a></li>
										<li><a href="create-basic-information.html">Create
												Basic Information</a></li>
										<li><a href="create-design-course.html">Create Design
												Course</a></li>
										<li><a href="create-publish-course.html">Create
												Publish Course</a></li>
										<li><a href="request-teacher.html">Request Teacher</a></li>
										<li><a href="search-result-found.html">Search Result
												Found</a></li>
										<li><a href="search-result-not-found.html">Search
												Result Found</a></li>
									</ul></li>
								<li class="menu-item-has-children"><a href="#">Learn 3</a>
									<ul class="sub-menu">
										<li><a href="learning.html">Learning</a></li>
										<li><a href="quizz-1.html">Quizz 1</a></li>
										<li><a href="quizz-2.html">Quizz 2</a></li>
										<li><a href="quizz-3.html">Quizz 3</a></li>
										<li><a href="quizz-5.html">Quizz 5</a></li>
										<li><a href="quizz-20.html">Quizz 20</a></li>
										<li><a href="quizz-finish.html">Quizz Finish</a></li>
										<li><a href="quizz-intro.html">Quizz Intro</a></li>
									</ul></li>
							</ul></li>
						<li class="menu-item-has-children"><a href="blog-list.html"
							id="jt">JAVATree</a>
							<ul class="sub-menu">
								<li><a href="blog-list.html">Blog list</a></li>
								<li><a href="blog-single.html">Blog single</a></li>
							</ul></li>
						<li class="menu-item-has-children"><a href="WEB-INF/views/login.jsp">LOGIN</a>
						</li>
						<li><a href="register.html">JOIN IN</a></li>
					</ul>
					<!-- END / MENU -->

					<!-- SEARCH BOX -->
					<div class="search-box">
						<i class="icon md-search"></i>
						<div class="search-inner">
							<form>
								<input type="text" placeholder="key words">
							</form>
						</div>
					</div>
					<!-- END / SEARCH BOX -->

					<!-- LIST ACCOUNT INFO -->
					<ul class="list-account-info">
					
					<!-- accout 사진 및 로그아웃 -->
					<li class="list-item account">
							<div class="account-info item-click">
								<img src="resources/javatree_view/html/images/team-13.jpg"
									alt="">
							</div>
							<div class="toggle-account toggle-list">
								<ul class="list-account">
									<li><a href="login.html"><i
											class="icon md-arrow-right"></i>Log Out</a></li>
								</ul>
							</div>
						</li>

						<!-- NOTIFICATION -->
						<li class="list-item notification">
							<div class="notification-info item-click">
								<i class="icon md-bell"></i> <span class="itemnew"></span>
							</div>
							<div class="toggle-notification toggle-list">
								<div class="list-profile-title">
									<h4>Notification</h4>
									<span class="count-value">2</span>
								</div>

								<ul class="list-notification">

									<!-- LIST ITEM -->
									<li class="ac-new"><a href="#">
											<div class="list-body">
												<div class="author">
													<span>Megacourse</span>
													<div class="div-x"></div>
												</div>
												<p>attend Salary for newbie course</p>
											
												<div class="time">
													<span>5 minutes ago</span>
												</div>
											</div>
									</a></li>
									<!-- END / LIST ITEM -->

									<!-- LIST ITEM -->
									<li class="ac-new"><a href="#">
											<div class="list-body">
												<div class="author">
													<span>Megacourse</span>
													<div class="div-x"></div>
												</div>
												<p>attend Salary for newbie course</p>
												
												<div class="time">
													<span>5 minutes ago</span>
												</div>
											</div>
									</a></li>
									<!-- END / LIST ITEM -->

									<!-- LIST ITEM -->
									<li><a href="#">
											<div class="list-body">
												<div class="author">
													<span>Megacourse</span>
													<div class="div-x"></div>
												</div>
												<p>attend Salary for newbie course</p>
												
												<div class="time">
													<span>5 minutes ago</span>
												</div>
											</div>
									</a></li>
									<!-- END / LIST ITEM -->

									<!-- LIST ITEM -->
									<li><a href="#">
											<div class="list-body">
												<div class="author">
													<span>Megacourse</span>
													<div class="div-x"></div>
												</div>
												<p>attend Salary for newbie course</p>
												
												<div class="time">
													<span>5 minutes ago</span>
												</div>
											</div>
									</a></li>
									<!-- END / LIST ITEM -->

									<!-- LIST ITEM -->
									<li><a href="#">
											<div class="list-body">
												<div class="author">
													<span>Megacourse</span>
													<div class="div-x"></div>
												</div>
												<p>attend Salary for newbie course</p>
												
												<div class="time">
													<span>5 minutes ago</span>
												</div>
											</div>
									</a></li>
									<!-- END / LIST ITEM -->

									<!-- LIST ITEM -->
									<li><a href="#">
											<div class="list-body">
												<div class="author">
													<span>Megacourse</span>
													<div class="div-x"></div>
												</div>
												<p>attend Salary for newbie course</p>
											
												<div class="time">
													<span>5 minutes ago</span>
												</div>
											</div>
									</a></li>
									<!-- END / LIST ITEM -->

								</ul>
							</div>
						</li>
						<!-- END / NOTIFICATION -->
					</ul>
					<!-- END / LIST ACCOUNT INFO -->
					<ul class="menu">
						<li class="menu-item-has-children"><a href="blog-list.html" id="jt">MY PAGE</a>
							<ul class="sub-menu">
								<li><a href="/javatree/course/teachMainView.action">Course MYPAGE</a></li>
								<li><a href="/javatree/course/studyMainView.action">Course MYPAGE2</a></li>
							</ul>
						</li>
					</ul>
				</nav>
				<!-- END / NAVIGATION -->

			</div>
		</header>
		<!-- END / HEADER -->
		
		<!-- PROFILE FEATURE 프로필!!!!-->
		    <section class="profile-feature">
		        <div class="awe-parallax bg-profile-feature"></div>
		        <div class="awe-overlay overlay-color-3"></div>
		        <div class="container">
		            <div class="info-author">  
		                <div class="name-author">
		                    <h2 class="big">USER NAME</h2>
		                </div>     
		            </div>
		            <div class="info-follow">
		                <div class="trophies">
		                    <span>JAVA KONG</span>
		                    <p>5000P</p>
		                </div>
		            </div>
		        </div>
		    </section>
        <!-- END / PROFILE FEATURE -->
        
       <section id="create-course-section" class="create-course-section">
        <div class="container">
    
		 <div class="mid-insert-lecture">
		 
		    <h2>insert LECTURE</h2>
<form action="insertLecture" method="post" id="insertLectureForm" enctype="multipart/form-data"> 	
<input type="hidden" name="courseno" value='<s:property value="courseno"/>'>	
                    <div class="create-course-content">

                        <!-- PROMO VIDEO -->
                        <div class="promo-video create-item">
                            <div class="row">
                                <div class="create-course-1">
                                    <h4>Title</h4>
                                </div>
                                <div class="create-course-2">
                                    <div class="form-item" >
                                        <input type="text" placeholder="title" name="lecture.lecturename" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END / PROMO VIDEO -->

                        <!-- DESCRIPTION -->
                        <!-- <div class="description create-item">
                            <div class="row">
                                <div class="create-course-1">
                                    <h4>Description</h4>
                                </div>
                                <div class="create-course-2">
                                    <div class="description-editor text-form-editor">
                                        <textarea placeholder="Discription"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        <!-- END / DESCRIPTION -->
                        
                        <!-- PROMO VIDEO -->
                        <div class="promo-video create-item">
                            <div class="row">
                                <div class="create-course-1">
                                    <h4>Upload Video</h4><%-- <s:property value="courseno"/> --%>
                                </div>
                                <div class="create-course-2">
                                    <div class="upload-video up-file">                                      
                                        <a href="#"><i class="icon md-upload"></i>Upload video</a>
                                        <input type="file" name ="upload"/>
                                        <%-- <s:file name="uploads" /> --%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END / PROMO VIDEO -->
                        
                         <!-- PROMO PAPER -->
                        <div class="promo-video create-item">
                            <div class="row">
                                <div class="create-course-1">
                                    <h4>Upload Paper</h4>
                                </div>
                                <div class="create-course-2">
                                    <div class="upload-video up-file">                                      
                                        <a href="#"><i class="icon md-upload"></i>Upload paper</a>
                                        <input type="file" name ="upload"/>
                                        <%-- <s:file name="uploads" /> --%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END / PROMO VIDEO -->

                        <!-- CATEGORIES -->
                       <!--  <div class="categories-item create-item">
                            <div class="row">
                                <div class="create-course-1">
                                    <h4 class="err">Categories</h4>
                                    <span class="text-err">choose at least one</span>
                                </div>
                                <div class="create-course-2">
                                    <table class="table-categories">
                                        <tr>
                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="business">
                                                    <label for="business">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                        PUREJAVA
                                                    </label>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="lifestyle">
                                                    <label for="lifestyle">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                        WEB
                                                    </label>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="game">
                                                    <label for="game">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                        MOBILE
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="design">
                                                    <label for="design">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                        IOT
                                                    </label>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="math-and-science">
                                                    <label for="math-and-science">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                       SWING
                                                    </label>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="crafts-and-hobbies">
                                                    <label for="crafts-and-hobbies">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                        JDBC
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="photography">
                                                    <label for="photography">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                        API
                                                    </label>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="education">
                                                    <label for="education">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                        SPRING
                                                    </label>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="music">
                                                    <label for="music">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                        STRUTS
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="health">
                                                    <label for="health">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                        etcFramework
                                                    </label>
                                                </div>
                                            </td>

                                            <td>
                                                <div class="form-item form-checkbox checkbox-style">
                                                    <input type="checkbox" id="social-science">
                                                    <label for="social-science">
                                                        <i class="icon-checkbox icon md-check-1"></i>
                                                       ETC
                                                    </label>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>                            
                        </div> -->
                        <!-- END / CATEGORIES -->
                        
                        <!-- OPEN DATE -->
                        <div class="open-date create-item">
                            <div class="row">
                                <div class="create-course-1">
                                    <h4>Open date</h4>
                                </div>
                                <div class="create-course-2">
                                    <div class='input-group date' id='datetimepicker'>
                                        <div class="form-item">
                                            <input type="date" placeholder="Select date" name="lecture.regdate" />
                                        </div>
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <!-- END / OPEN DATE -->
                        
                           <!-- OPEN DATE -->
<!--                         <div class="open-date create-item">
                            <div class="row">
                                <div class="create-course-1">
                                    <h4>Upload Question</h4>
                                </div>
                                <div class="create-course-2">
                                   <a href="/javatree/course/codingForm.action"><input type="button" value="Qesstion BOX" class="submit mc-btn-4 btn-style-1"></a>
                                	<a href="javascript:questionBox();"><input type="button" value="Qesstion BOX" class="submit mc-btn-4 btn-style-1"></a>
                                </div>
                            </div>
                            
                        </div> -->
                        <!-- END / OPEN DATE -->
                        
                       
  						<div class="form-action">
                            <input type="submit" value="Save and Next" onclick="javascript:insertLectureForm()" class="submit mc-btn-3 btn-style-1">
                             <input type="submit" value="Cancel" onclick="javascript:stgoback()" class="submit mc-btn-3 btn-style-1">
                        </div>

                     
                    </div>
</form>
                </div>			  
            </div>

    </section>
    <!-- END / CREATE COURSE CONTENT -->
        
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
						<i class="fa fa-map-marker"></i> <span>Maecenas sodales,nisl eget</span>
					</div>
				</div>
				<p class="copyright">Copyright © 2014 Megadrupal. All rights reserved.</p>
			</div>
		</div>
	</footer>
	<!-- END / FOOTER -->

	
	<!-- Load jQuery -->
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
</body>
</html>