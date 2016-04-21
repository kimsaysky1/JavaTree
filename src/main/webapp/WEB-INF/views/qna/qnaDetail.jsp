<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>QNA Detail</title>
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
                                   <input type="button" value="궁금해요" id="addCurious" class="mc-btn-8">
                                </div>
                                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                                   <div class="profile-address">
                                   <form action=""></form>
                                   <input type="button" value="답변달기" data-toggle="modal" data-target="#writeReply" id="insertReplyReday" class="mc-btn-8">
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
                                                   <a href="#"><i class="icon md-back"></i>REPLY</a>
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
    			  <form action="writeReply" name="writeReply" method="get">
                    			<div class="container">
									<div class="modal fade" id="writeReply" role="dialog">
								    	<div class="modal-dialog modal-lg">
									      <div class="modal-content">
									        <div class="modal-header">
									          <button type="button" class="close" data-dismiss="modal">&times;</button>
									          <h4 class="modal-title">Reply</h4>
									        </div>
									        <div class="modal-body">
									            <table style='width: 800px;'>
													<tr>
														<td style='width: 100px; text-align:center;'><b>FIELD</b></td>
														<td>${question.typeno}</td>
													</tr>
													<tr>
														<td style='height: 20px;'></td>
														<td></td>
													</tr>
													<tr>
														<td style='width: 100px; text-align:center;'><b>QUESTION TITLE</b></td>
														<td><textarea style="height: 60px;" readonly="readonly">${question.title}</textarea></td>
													</tr>
													<tr>
														<td style='height: 20px;'></td>
														<td></td>
													</tr>
													<tr>
														<td style='width: 100px; text-align:center;'><b>QUESTION CONTENT</b></td>
														<td><textarea style="height: 180px; backgroun" readonly="readonly">${question.content}</textarea></td>
													</tr>
														<tr>
														<td style='height: 20px;'></td>
														<td></td>
													</tr>
													<tr>
														<td style='width: 100px; text-align:center;'><b>ANSWER CONTENT</b></td>
														<td><textarea name="reply.content" style="height: 280px;"></textarea></td>
													</tr>
														<tr>
														<td style='height: 20px;'></td>
														<td></td>
													</tr>
														<tr>
														<td ></td>
															<input type ="hidden" value="${question.questionno}" name="reply.questionno" />
														</tr>
												</table>
									        </div>
									        <div class="modal-footer">
									        	<input type="submit" value="등록" class="mc-btn-5">&nbsp;&nbsp;&nbsp;
												<input type="reset" value="취소" class="mc-btn-5">
									          <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
									        </div>
									      </div>
								  	   </div>
								  </div>
                    		</div>
                    		</form>

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
	
	<script type="text/javascript">
	</script>
</body>
</html>