<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set value='${requestVo}' var='r'/>
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- plugins:css -->
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=Raleway:500' rel='stylesheet' type='text/css'/>
  <link rel="stylesheet" href="${path }/resources/assets/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${path }/resources/assets/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${path }/resources/assets/css/style.css">
  <link rel="stylesheet" href="${path }/resources/css/modal.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${path }/resources/assets/images/favicon.png" />
  
  <script src="${path }/resources/js/jquery-3.4.1.min.js"></script>
  
    <!-- 웹소켓 js파일 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"></script>
  <title>${r.stuName } : ${r.reqTitle } / 작성일  : ${r.reqDate }</title>
</head>

<!-- Body section Start -->	
<!-- Main Content start -->
	
<section>
			<div class="row" style="height : 100%;">
				<div class="col-md-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-header">
						<div class="alert alert-primary" style="text-align : center;">
						  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						  	<h3>${r.reqTitle }</h3>
						</div>
						</div>
						<div class="card-body" style="text-align : center;">
						<hr/>
						<textarea rows=20 style="resize : none; width : 70em;"  readonly>${r.reqContent }</textarea>
						</div>
						<div class="card-footer" style="text-align : right;">
						<h6><span>작성자 : ${r.stuName }</span> / <span>작성일 : ${r.reqDate }</span></h6>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  
              	   <c:if test="${r.reqAnswer eq null or r.reqAnswer eq ''}">	
                  <h4 class="card-title">아래에 답변을 입력 할 수 있습니다.</h4>
                  <p class="card-description">
                    <hr/>
                  </p>
                  <form action="${path }/prof/updateAnswer.hd" method="post" class="forms-sample">
                    <div class="form-group">
                      <label for="exampleTextarea1">답변 내용</label>
                      <textarea name="reqAnswer" class="form-control" id="exampleTextarea1" rows="4"></textarea>
                    </div>
                    <input type="hidden" name="profId" value="${r.profId }"/>
                    <input type="hidden" name="subCode" value="${r.subCode }"/>
                    <input type="hidden" name="stuNo" value="${r.stuNo }"/>
                    <input type="hidden" name="acaYearSem" value="${r.acaYearSem }"/>
                    <button type="submit" class="btn btn-primary mr-2">답변등록</button>
                    <button type="reset" class="btn btn-danger">취소</button>
                  </form>
                  </c:if>
                  
                  <!--  답변이 이미 등록된 경우 -->
                  <c:if test="${r.reqAnswer ne null and r.reqAnswer ne ''}">
                  <h4 class="card-title">아래에 답변을 수정 할 수 있습니다.</h4>
                  <p class="card-description">
                    <hr/>
                  </p>
                  <form action="${path }/prof/updateAnswer.hd" method="post" class="forms-sample">
                  <div class="form-group">
                      <label for="exampleTextarea1">답변 내용</label>
                     <textarea name="reqAnswer" class="form-control" id="admitTextArea" rows="4" readonly>${r.reqAnswer }</textarea>
                    </div>
                    <input type="hidden" name="profId" value="${r.profId }"/>
                    <input type="hidden" name="subCode" value="${r.subCode }"/>
                    <input type="hidden" name="stuNo" value="${r.stuNo }"/>
                    <input type="hidden" name="acaYearSem" value="${r.acaYearSem }"/>
                    <button type="button" id="admitBtn" class="btn btn-warning mr-2" >답변수정</button>
                    <button type="reset" class="btn btn-danger">취소</button>
                    </form>
                  </c:if>
                </div>
              </div>
            </div>
</section>
	<script>
		$('#admitBtn').mouseup(function(){
			$('#admitBtn').attr("class", "btn btn-primary mr-2 admitBtnAfter");
			$('#admitBtn').html("답변등록");
			$('#admitTextArea').removeAttr("readonly");
			$(document).ready(function(){
			 $('#admitBtn').attr("type", "submit");
			})
		});
		
		
	</script>
  <!-- plugins:js -->
 <script src="${path }/resources/assets/vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <script src="${path }/resources/assets/vendors/chart.js/Chart.min.js"></script>
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="${path }/resources/assets/js/off-canvas.js"></script>
  <script src="${path }/resources/assets/js/hoverable-collapse.js"></script>
  <script src="${path }/resources/assets/js/template.js"></script>
  <script src="${path }/resources/assets/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="${path }/resources/assets/js/dashboard.js"></script>
  <script src="${path }/resources/assets/js/file-upload.js"></script>
  <!-- End custom js for this page-->
</body>

</html>