<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script type="text/javascript"
  src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
  integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="${path }/resources/js/datepicker-ko.js"></script>

<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<style>
/* .modal-dialog {
	overflow-y: initial !important
}

.modal-body {
	height: 100%;
	overflow-y: auto;
} */
.modal{
    		z-index:9999;
    	}
</style>


<div class="main-panel">
	<div class="content-wrapper">
		<!-- Body section Start -->
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="display-4">학생 출결 관리</h4>
					</div>
				</div>
			</div>
		</div>
		<!-- Main Content start -->
		<div class="row ">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-header">
						<form action="${path }/prof/viewClassAttend.hd" method="post">
							<table class="table table-bordered table-hover col-md-10 table-condensed"
								style="text-align: center;">
								<thead class="thead-dark">
									<tr>
										<th>강의명</th>
										<th>일자별</th>
										<th>이름</th>
										<th>학년</th>
										<th>학과</th>
										<th>검색하기</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td>
											<select name="subCode" class="form-control form-control-sm" required>
													<option value="" selected>과목선택</option>
													<c:forEach items="${subNameCodeList }" var="subList">
														<option value="${subList.subCode }">${subList.subName }</option>
													</c:forEach>
											</select>
										</td>
										<td>
									        <input name="checkDate" style="text-align : center;" id="dateInput" type="text" class="form-control form-control-sm " required/>
									        
										    <script type="text/javascript" >
												$("#dateInput").datepicker();
												$.datepicker.setDefaults($.datepicker.regional["ko"]);
												uiLibrary: 'bootstrap4';
												
										    </script>
										</td>
										<td>
										<input type="text" name="stuName" class="form-control form-control-sm" id="inlineFormInputName2" placeholder="이름검색" />
											
										</td>
										<td><select name="grade" class="form-control form-control-sm">
												<option value="" selected>학년검색</option>
												<option value="1">1학년</option>
												<option value="2">2학년</option>
												<option value="3">3학년</option>
												<option value="4">4학년</option>
												<option value="5">5학년</option>
										</select></td>
										<td>
										<input type="text" class="form-control form-control-sm" id="inlineFormInputName2"
												name="deptName" placeholder="학과검색">											
											</td>
										<td><input type="submit" value="검색" class="btn btn-success"></td>
										
									</tr>
								</tbody>
							</table>
						</form>

					</div>

					<div class="card-body table-responsive">
						<div class="col-md-12">
							<table class="table table-bordered table-hover table-condensed"
								style="text-align: center;">
								<thead class="thead-dark">
									<tr>
										<th>학과</th>
										<th>학년</th>
										<th>이름</th>
										<th>출석</th>
										<th>결석</th>
										<th>지각</th>
										<th>조퇴</th>
										<th>${sal.checkDate }</th>
										<th>
											출석입력
										</th>
										<th>
											전체출석조회
										</th>
									</tr>
								</thead>
								<tbody>
								<form action="${path }/prof/insertStatus.hd" method="post" id="insertForm">
								<c:forEach items="${attendList }" var="list">
									<tr class="success">
										<td>${list.deptName }</td>
										<td>${list.grade }</td>
										<td>${list.stuName }</td>
										<td>${list.attend }</td>
										<td>${list.absent }</td>
										<td>${list.late }</td>
										<td>${list.ealryLeave}</td>
										<td>
											<c:choose>
												<c:when test="${list.status eq null }">미입력</c:when>
												<c:when test="${list.status ne null }">${list.status }</c:when>
											</c:choose>
										</td>
										<td><select name="insertStatus" class="form-control form-control-sm">
												<option value="" selected>출결입력</option>
												<option value="출석">출석</option>
												<option value="결석">결석</option>
												<option value="지각">지각</option>
												<option value="조퇴">조퇴</option>
										</select></td>
										<td>
										<!-- id='classViewBtn'  -->
											<button type="button" class="btn btn-success btn-toggle" 
												onclick="viewStuAttend('${list.stuNo}');">조회</button>
											<button type="button" style="display : none;" id="ajaxAttendBtn"></button>
										</td>
									</tr>
									<input type="hidden" value="${list.stuNo }" name="insertStuNo"/>
								</c:forEach>
									<button type='submit' id="runInsertBtn" style="display : none;"></button>
									<input type="hidden" value="${sal.subCode }" name="insertSubCode"/>
								</form>
								</tbody>
							</table>
							<br/>
								${pageBar }
						
					      <!-- 출석부 조회 스크립트 -->
					      <script>
					    	  
					      	function viewStuAttend(no){
					      		var a = no;
					      		console.log(a);
					      		var id = '${sal.profId}';
					      		var code = '${sal.subCode}';
					      		$.ajax({
					      			url : "${path}/prof/ajax_view_attend.hd", 
									type : "POST",
									data : {
				      					'stuNo' : no,
				      					'profId' : id,
				      					'subCode' : code
				      					},
									dataType : "json", // 데이터 타입을 제이슨 꼭해야한다, 다른방법도 2가지있다
									cache : false, // 이걸 안쓰거나 true하면 수정해도 값반영이 잘안된다
					      			
									success : function(data){
										//스크립트 시작
										var attendList2 = " <div class='modal-header ' >";
										attendList2 += "<table class='table table-bordered table-hover table-condensed ' >";
										attendList2 += "<thead class='thead-dark'>";
										//학생정보 시작
										attendList2 += "<tr><th>강의명 : "+data[1].subName+"</th><th>"+data[1].stuName+"</th><th>"+data[1].deptName+"</th><th>"+data[1].grade+"학년</th></tr>";
										//학생정보 끝 
										attendList2 += "</thead>";
										
										attendList2 += "</table></div>"; 
										//모달헤더 끝

										//모달 바디 시작
										attendList2 += "<div class='modal-body table-responsive' style='height : 400px;'><table class='table table-bordered table-hover table-condensed '><thead>";
										attendList2 += "<tr><td>강의날짜</td><td>출석여부</td></tr>"
										attendList2 += "</thead><tbody>";
										//상세정보 시작
										for(let i = 0; i < data.length; i++) {
										attendList2 += "<tr><th>"+data[i].atDate+"</th><th>"+data[i].status+"</th></tr>";
										}
										//상세정보 끝
										attendList2 += "</tbody></table></div><div class='modal-footer'></div>";
										
										$('#innerModal').html(attendList2);
										
										
										var attendScript = "<script>";
										
										
										
										attendScript += "(function ($) {$('#ajaxAttendBtn').trigger('click');})(jQuery);";
										attendScript += "<";
										attendScript += "/script>";
										
										//스크립트 끝
										$('#innerModal').append(attendScript);
			
										
										
									}
					      		});
					   	   }
					      
					      	
					      </script>
   <!-- @@출석부 Modal content Start@@ -->
    <div id="AttendModal" class="modal " >
      <!-- Modal content -->
      <div class="modal-content " >
         <span class="close" id="closeAttend">&times;</span>
         <div id="innerModal" >
         
         </div>
    
      </div>
 	<!-- Modal content End -->
    </div>	
<!-- Modal End -->	

		
						</div>
					</div>

				<div class="card-footer" style="text-align : center;">
					<button id="insertStatus" class="btn btn-info">등록</button>
					<button type="reset" class="btn btn-info">취소</button>
				</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Main-content End -->
  <script>
  		var insertBtn = document.getElementById('insertStatus');
  		insertBtn.onclick = function() {
  			var insertSubCodeVal = "${sal.subCode}";
  			var insertSubCode = "<input name='insertSubCode' type='hidden' value='"+insertSubCodeVal+"'/>";
  			$('#insertForm').append(insertSubCode);
  			
  			var checkDateVal = "${sal.checkDate}";
  			var insertDate = "<input name='insertDate' type='hidden' value='"+checkDateVal+"'/>";
  			$('#insertForm').append(insertDate);
  			
  			(function ($) {$('#runInsertBtn').trigger('click');})(jQuery);

  		};
  </script>	
	
	
  <script>
  
  		
     // Get the modal
    	 
    	var AttendModal = document.getElementById('AttendModal');

        // Get the button that opens the modal
        var viewAttend = document.getElementById("ajaxAttendBtn");
 
        // Get the <span> element that closes the modal
        var closeAttend = document.getElementById("closeAttend");                                          
        // When the user clicks on the button, open the modal 

       viewAttend.onclick = function() {
        	AttendModal.style.display = "block"; 
        }; 
 
        // When the user clicks on <span> (x), close the modal

       closeAttend.onclick = function() {
    	   AttendModal.style.display = "none"; 
        };
        </script> 
<!-- attendList +="$(document).ready(function(){";
				attendList +="$('#ajaxTriggerBtn').bind('click',function(){";
				attendList +="var classViewModal = document.getElementById('classViewModal');";
				attendList +="var classViewBtn = document.getElementById('ajaxTriggerBtn');";
				attendList +="var closeClassView = document.getElementById('closeClassView'); ";
				attendList +="$(document).on('click',classViewBtn,function(){";
				attendList +="$(classViewModal).css('display','block');";
				attendList +="});";
				attendList +="$(document).on('click',closeClassView,function(){";
				attendList +="$(classViewModal).css('display','none');";
						attendList +="});";
					attendList +="});";
				attendList +="});";
				
				attendList += "$('#ajaxTriggerBtn').trigger('click');";
				attendList += "<";
				
				    /*     $(document).on("click","#btn",function(){
        	$(classViewModal).css("display","block");
        }); */
				       /* $(document).on("click",closeClassView,function(){
    		$(classViewModal).css("display","none");
       }); */
				
				 ->

	<!-- Body section End -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />