<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>qnaDefaultMain</title>
</head>
<body>
	<%@include file="/resources/header.jsp" %>
		
	<!-- 중간 슬라이더 부분 -->
	<section class="sub-banner sub-banner-course">
        <div class="awe-static bg-sub-banner-course"></div>
        <div class="container">
            <div class="sub-banner-content">
                <h2 class="text-center">JAVATree</h2>
            </div>
        </div>
    </section>
    
    <!-- COURSE -->
    <section class="course-top">
        <div class="container">
            <div class="row">
                <div class="qna-detail">
                
                <div class="tab-pane fade in active" id="discussion">
                                <h3 style="color: green;">About JAVATree</h3>
                                <div class="form-discussion">
                                    <form>
                                        
                                    </form>
                                </div>
                                
                                    <!-- PROFILE -->
    
    <section class="profile2">
        <div class="container">
        
        <h3 class="md black">Field</h3>
			<div>${question.typeno}</div>
        
                <h3 class="md black">Question-title</h3>
            <div class="row">
                <div class="col-md-9">
                    <div class="avatar-acount2">
                        <div class="info-acount">
                            <p>ad ma commodo consequat.</p>
                        </div>
                    </div>    
                </div>
                </div>
            
            <h3 class="md black">Question</h3>
            <div class="row">
                <div class="col-md-9">
                    <div class="avatar-acount">
                        <div class="info-acount">
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. 
                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>
                            <div class="profile-email-address">
                                <div class="profile-email">
                                    <h5>ID</h5>
                                    <p>${question.id}</p>
                                </div>
                                <div class="profile-address">
                                    <h5>DATE</h5>
                                    <p>${question.regdate}</p>
                                </div>
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                 <div class="profile-address">
                                    <h5>GUNGGUMDO</h5>
                                    <p>${question.curious}</p>
                                </div>
                                 &nbsp; &nbsp;
                                
                                 <div class="profile-address">
                                   <input type="button" value="궁금해요" class="mc-btn-8">
                                </div>
                                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                                   <div class="profile-address">
                                   <input type="button" value="답변달기" class="mc-btn-8">
                                </div>
                            </div>
                        </div>
                    </div>    
                </div>
            </div>    
        </div>
    </section>


    <!-- END / PROFILE -->
    <hr class="hr2">
    <section class="profil2">
                                <ul class="list-discussion">
    
                                    <!-- LIST ITEM -->
                                    <li>
                                        <div class="list-body">

                                        
                                            <div class="answer_bg">
                    							<div class="avatar-acount">
                                                <cite class="xsm black bold">IDIDIDID</cite>
                                                <h4 class="md black">Title of topic shown only. When user click on topic it show full content and discussion below</h4>
                                                <div class="comment-meta">
                                                   <a href="#">YYYY/MM/DD</a>
                                                   <a href="#"><i class="icon md-arrow-up"></i>추천&nbsp;0</a>                                             
                                                   <a href=""><i class="icon md-back"></i>REPLY</a>
                                                </div>
                                           		 </div>
                                           		 </div>
                                        </div>
                                    </li>
                                    <!-- END / LIST ITEM -->                             
                                </ul>
                            </div>
                            </section>
                            <!-- END / DISCUSSION -->
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