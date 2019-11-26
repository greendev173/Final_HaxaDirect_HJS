<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.finalProject.student.model.vo.Grade"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>
<style>
th, td, .my-header {
	text-align: center;
	cursor: auto;
}

pre {
	padding: 0px;
	background-color: white;
}
.row{
	margin:-1px 0;
}
.form-check{
	margin-top:15px;
}

</style>
<div class="main-panel">
	<div class="content-wrapper">

		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="card">
					<div class="card-header" style="height: 50px;">
						<h4>현재학기 성적</h4>
					</div>
					<div class="card-body">
						<!-- 부트스트랩에서는 화면 폭이 좁을 때(768px 이하) 하단에 스크롤바가 나타나며 수평으로 스크롤해서 테이블을 볼 수 있게 했습니다. 
						<table> 태그 외곽에 <div> 태그로 감싸서 .table-responsive 클래스를 추가하면 반응형 테이블로 사용할 수 있습니다. -->
						<div class="table-responsive">
							<pre class="pre-scrollable" style="max-height: 300px;">
							<table
									class="table table-striped table-bordered table-hover table-condensed">
								<thead class="thead-dark" style="position: fiexd">
									<tr class="my-header">
										<th scope="col">순번</th>
										<th scope="col">학년도</th>
										<th scope="col">학기</th>
										<th scope="col">교과목코드</th>
										<th scope="col">교과목명</th>
										<th scope="col">이수구분</th>
										<th scope="col">이수학점</th>
										<th scope="col">취득등급</th>
										<th scope="col">재수강여부</th>
										<th scope="col">이의신청</th>
										<th scope="col">답변</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${gradeNow}" var="l" varStatus="s">
											<c:set var="seme" value="${l.acaYearSem}" />
												<tr id="select">
													<td scope="row"><c:out value="${s.count}" /></td>
													<td><c:out value="${fn:substring(seme,0,4)}" /></td>
													<td><c:out value="${fn:substring(seme,5,6)}" /></td>
													<td><c:out value="${l.subCode}" /></td>
													<td><c:out value="${l.subName}" /></td>
													<td><c:out value="${l.subType}" /></td>
													<td><c:out value="${l.rcvCredits}" /></td>
												
												<c:if test="${l.evalPoint eq null and l.evalComment eq null}">
													<td colspan="4"><button type="button" id="profassess${s.count}" class="btn btn-warning btn-xs" style="font-size:13px; font-weight:bold; width:300px;">강 의 평 가</button></td>
												</c:if>	
												<c:if test="${l.evalPoint ne null and l.evalComment ne null}">
													<td><c:out value="${l.grade}" /></td>
													<td><c:out value="${l.retake}" /></td>
													<c:if test="${l.reqDate eq null }">
														<td><button type="button" id="appeal${s.count}" class="btn btn-danger btn-xs" style="font-size:11px; font-weight:bold;">이의 신청</button></td>
														<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													</c:if>
													<c:if test="${l.reqDate ne null and l.reqAwswer eq null}">
														<td><button type="button" id="appeal${s.count}" class="btn btn-danger btn-xs" style="font-size:11px; font-weight:bold;">이의 신청중</button></td>
													</c:if>
													<c:if test="${l.reqDate ne null and l.reqAwswer eq null }">
														<td><button type="button" id="answer${s.count}" class="btn btn-primary btn-xs" style="font-size:11px; font-weight:bold;">답변 대기중</button></td>
													</c:if>
													<c:if test="${l.reqDate ne null and l.reqAwswer ne null }">
														<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
														<td><button type="button" id="answer${s.count}" class="btn btn-primary btn-xs" style="font-size:11px; font-weight:bold;">답변 확인</button></td>
													</c:if>
												</c:if>
												</tr>									
									</c:forEach>
								</tbody>
							</table>
							</pre>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 성적이의신청 모달 -->
		<div id="appealModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content" style="width: 800px">
				<div id="topCloseBotton" style="text-align: right">
					<span class="close" id="closeTopAppeal" Style="width: 50px;">&times;</span>
				</div>
				<form name="myAppealFrm" action="${path}/myAppeal.hd" method="post" onsubmit="return checkreqContent();">
					<p style="font-family: jua; font-size: 30px; font-style:">성적이의신청</p>
					<p style="font-family: jua; font-size: 15px; color:red; font-style:">이의신청기간은 학기 종료 후 3일</p>
					<hr>
					<div class="form-group">
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">교과목명 : </label>
								<div class="col-sm-10" style="width:10px;">
									<input type="text" class="form-control" name="subName" id="subName_s" readonly="readonly" />
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">담당교수 : </label>
								<div class="col-sm-5">
								<input type="text" class="form-control" name="profName" id="profName_s" readonly="readonly"/>
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">취득등급 : </label>
								<div class="col-sm-5">
								<input type="text" class="form-control" name="grade" id="grade_s" readonly="readonly"/>
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">신청일자 : </label>
								<div class="col-sm-5">
								<input type="text" class="form-control" name="reqDate" id="reqDate_s" readonly="readonly"/>
								</div>
								</div>
							</div>
						</div>
						
						<p style="font-family: jua; font-size: 15px; font-style:">이의신청제목</p>
						<input type="text" name="reqTitle" id="reqTitle_s" class="form-control"  placeholder="이의신청 제목을 작성하세요."/>
						<hr>
						<p style="font-family: jua; font-size: 15px; font-style:">이의신청내용</p>
						<textarea class="form-control" rows="5" cols="90" name="reqContent" id="reqContent_s" placeholder="이의신청 내용을 작성하세요." ></textarea>
						<hr>
						
						<input type="hidden" name="stuNo" id="stuNo_s" value="${loginMember.stuNo}" readonly="readonly"/>
						<input type="hidden" name="acaYearSem" id="acaYearSem_s" value="acaYearSem" readonly="readonly"/>
						<input type="hidden" name="subCode" id="subCode_s" value="subCode" readonly="readonly"/>
						<input type="hidden" name="profId" id="profId_s" value="profId" readonly="readonly"/>
						
						
					</div>
					<div style="text-align: center">
						<input type="reset" class="btn btn-inverse-info btn-fw" id="resetAppeal" value="취소" style="float: right; margin: 7px;">
						<input type="submit" class="btn btn-inverse-info btn-fw" id="submitAppeal" value="제출" style="float: right; margin: 7px;">
					</div>
				</form>
			</div>
		</div>

		<!-- 답변보기 모달 -->
		<div id="answerModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content" style="width: 800px">
				<div id="topCloseAnswerBotton" style="text-align: right">
					<span class="close" id="closeTopAnswer" Style="width: 50px;">&times;</span>
				</div>
				<div>
					<p style="font-family: jua; font-size: 30px; font-style:">성적이의신청결과</p>
					<hr>
				</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">교과목명 : </label>
								<div class="col-sm-10" style="width:10px;">
									<input type="text" class="form-control" name="subName" id="subName_p" readonly="readonly" />
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">담당교수 : </label>
								<div class="col-sm-5">
								<input type="text" class="form-control" name="profName" id="profName_p" readonly="readonly"/>
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">취득등급 : </label>
								<div class="col-sm-5">
								<input type="text" class="form-control" name="grade" id="grade_p" readonly="readonly"/>
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">신청일자 : </label>
								<div class="col-sm-5">
								<input type="text" class="form-control" name="reqDate" id="reqDate_p" readonly="readonly"/>
								</div>
								</div>
							</div>
						</div>
						
						<p style="font-family: jua; font-size: 15px;">이의신청제목</p>
						<input type="text" name="reqTitle" id="reqTitle_p" class="form-control" readonly="readonly"/>
						<hr>
						<p style="font-family: jua; font-size: 15px;">이의신청내용</p>
						<textarea class="form-control" rows="5" cols="90" name="reqContent" id="reqContent_p" readonly="readonly"></textarea>			
						<p style="font-family: jua; font-size: 15px;">이의신청결과</p>
						<textarea class="form-control" rows="5" cols="90" name="reqAnswer" id="reqAnswer_p" readonly="readonly"></textarea>
					</div>
			</div>
		</div>
		
		<!-- 수강평가 모달 -->
		<div id="profassessModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content" style="width: 800px">
				<div id="topCloseProfAssessBotton" style="text-align: right">
					<span class="close" id="closeTopProfAssess" Style="width: 50px;">&times;</span>
				</div>
				<form name="myProfAssessFrm" action="${path}/myProfAssess.hd" method="post" onsubmit="return checkContent();">
				<div>
					<p style="font-family: jua; font-size: 30px; font-style:">수강평가</p>
					<hr>
				</div>
					<div class="form-group">
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">교과목명 : </label>
								<div class="col-sm-10" style="width:10px;">
 									<input type="text" class="form-control" name="subName" id="subName_pfa" readonly="readonly" />
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">담당교수 : </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" name="profName" id="profName_pfa" readonly="readonly"/>
								</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
								<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">평가일자 : </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" name="evalDate" id="evalDate_pfa" readonly="readonly"/>
								</div>
								</div>
							</div>
						</div>
						
						<!-- 평가 하는 로직    평가는 점수와 내용을 적으면 됨. -->
						<div class="row">
							<div class="col-md-12">
							<div class="form-group row">
	                        	<label class="col-sm-2 col-form-label" style="font-family: jua; text-align:center; letter-spacing:2px; font-size: 15px;">평가점수 : </label>
		                            <div class="col-sm-1 form-check" >
		                              <label class="form-check-label">
		                                <input type="radio" class="form-check-input" name="evalPoint" value="0">
		                                0 </label>
		                            </div>
		                            <div class="col-sm-1 form-check">
		                              <label class="form-check-label">
		                                <input type="radio" class="form-check-input" name="evalPoint" value="2">
		                                2 </label>
		                            </div>
		                            <div class="col-sm-1 form-check">
		                              <label class="form-check-label">
		                                <input type="radio" class="form-check-input" name="evalPoint" value="4">
		                                4 </label>
		                            </div>
		                            <div class="col-sm-1 form-check">
		                              <label class="form-check-label">
		                                <input type="radio" class="form-check-input" name="evalPoint" value="6">
		                                6 </label>
		                            </div>
		                            <div class="col-sm-1 form-check">
		                              <label class="form-check-label">
		                                <input type="radio" class="form-check-input" name="evalPoint" value="8">
		                                8 </label>
		                            </div>
		                            <div class="col-sm-1 form-check">
		                              <label class="form-check-label">
		                                <input type="radio" class="form-check-input" name="evalPoint" value="10">
		                                10 </label>
		                            </div>
							</div>
							</div>
                        </div>
						<hr>
						<p style="font-family: jua; font-size: 15px;">강의평가</p>
						<textarea class="form-control" rows="5" cols="90" name="evalComment" id="evalConmment" placeholder="강의평가에 대해 작성하여 주세요."></textarea>	
						
						<input type="hidden" name="stuNo" id="stuNo_pfa" value="${loginMember.stuNo}" readonly="readonly"/>
						<input type="hidden" name="acaYearSem" id="acaYearSem_pfa" value="acaYearSem" readonly="readonly"/>
						<input type="hidden" name="subCode" id="subCode_pfa" value="subCode" readonly="readonly"/>
						<input type="hidden" name="profId" id="profId_pfa" value="profId" readonly="readonly"/>		
					</div>
					<div style="text-align: center">
						<input type="reset" class="btn btn-inverse-info btn-fw" id="resetProfassess" value="취소" style="float: right; margin: 7px;">
						<input type="submit" class="btn btn-inverse-info btn-fw" id="submitProfassess" value="제출" style="float: right; margin: 7px;">						
					</div>
				</form>
			</div>
		</div>
		
		
<style>
.modal {
	z-index: 9999;
}
</style>

<script>
function checkContent(){
	var flag=false;
	$.each($(".form-check-input"),function(i,items){
		if($(items).is(":checked")){
			flag=true;
		}
	});
	if(!flag){
		alert("평점을 입력해주세요.");
		return false;
	}
	var content=$("#evalConmment").val();

	if(content.trim().length<1){
		alert("평가내용을 작성하세요.");
		$("#evalConmment").focus();
		return false;
	}	
}

function checkreqContent(){
	
	var reqcontent=$("#reqTitle_s").val();
	var reqcontent=$("#reqContent_s").val();

	if(reqcontent.trim().length<1){
		alert("제목을 입력하세요.");
		$("#reqTitle_s").focus();
		return false;
	}
	
	if(reqcontent.trim().length<1){
		alert("내용을 입력하세요.");
		$("#reqContent_s").focus();
		return false;
	}
}

/* function taeyoug1(event) {
	console.log("taeyoung1");
	alert('Hello world, '+this.value);
	AppealModal.style.display = "block";
} */

	//이의신청 모달 script
	var AppealModal = document.getElementById('appealModal');
	//답변보기 모달
	var AnswerModal = document.getElementById('answerModal');
	//수강평가 모달
	var ProfassessModal = document.getElementById('profassessModal');
	
    // Get the <span> element that closes the modal
    var closeTopAppeal = document.getElementById("closeTopAppeal");                                          
    var closeTopAnswer = document.getElementById("closeTopAnswer");  
    var closeTopProfAssess = document.getElementById("closeTopProfAssess");  
    
    var submitAppeal = document.getElementById("submitAppeal");
    var resetAppeal = document.getElementById("resetAppeal");
    
    //교수평가 닫기 버튼
    var submitProfassess = document.getElementById("submitProfassess");
    var resetProfassess = document.getElementById("resetProfassess");
    
    // When the user clicks on <span> (x), close the modal
    closeTopAppeal.onclick = function() {
    	AppealModal.style.display = "none";
    }
    
    closeTopProfAssess.onclick = function() {
    	ProfassessModal.style.display = "none";
    }
    
    closeTopAnswer.onclick = function() {
    	AnswerModal.style.display = "none";
    }
    resetAppeal.onclick = function() {
    	AppealModal.style.display = "none";
    }
    resetProfassess.onclick = function() {
    	ProfassessModal.style.display = "none";
    }
    
    
 	//현재시간
 	var today = new Date();
 	var year = today.getFullYear();
 	var month = today.getMonth() + 1;
 	var date = today.getDate();
 	
 <%-- 	var ProfassessBtn<%=(i+1)%> = document.getElementById("profassess<%=(i+1)%>"); --%>
    
    <%
    	List<Grade> gradeList = null;
    	if(request.getAttribute("gradeNow")!=null) {
	    	gradeList = (ArrayList)request.getAttribute("gradeNow");
    	}
    %>
     <%if(gradeList!=null) { 
    	for(int i=0; i<gradeList.size(); i++) { %>
    	<% if(gradeList.get(i).getEvalPoint()!=null) { // 수강 평가를 했으면  %>
     	// Get the button that opens the modal
        var AppealheaderBtn<%=(i+1)%> = document.getElementById("appeal<%=(i+1)%>");
        var AnswerheaderBtn<%=(i+1)%> = document.getElementById("answer<%=(i+1)%>");
        
     	// When the user clicks on the button, open the modal 
        <%-- AppealheaderBtn<%=(i+1)%>.onclick = function() {
        	AppealModal.style.display = "block";
        } --%>
        <% if(gradeList.get(i).getReqAwswer()==null) { %>
	        AppealheaderBtn<%=(i+1)%>.addEventListener('click', function(e){
	        	/* alert(this.id); */
	        	<% if(gradeList.get(i).getReqDate()==null) { %>
	        	alert("유의사항 : 시스템을 통한 성적이의신청 및 회신은 한 과목당 1회에 한합니다.");
	            AppealModal.style.display = "block";
	            $("#subName_s").val(""); // 초기화
	            $("#subName_s").val("<%=gradeList.get(i).getSubName()%>");
	            $("#profName_s").val("");
	            $("#profName_s").val("<%=gradeList.get(i).getProfName()%>"+"교수");
	            $("#grade_s").val("");
	            $("#grade_s").val("<%=gradeList.get(i).getGrade()%>");
	            $("#reqDate_s").val("");
	            $("#reqDate_s").val(year+"/"+month+"/"+date);
	            
	            $("#acaYearSem_s").val("");
	            $("#acaYearSem_s").val("<%=gradeList.get(i).getAcaYearSem()%>");
	            $("#subCode_s").val("");
	            $("#subCode_s").val("<%=gradeList.get(i).getSubCode()%>");
	            $("#profId_s").val("");
	            $("#profId_s").val("<%=gradeList.get(i).getProfId()%>");
	            <% }else if(gradeList.get(i).getReqDate()==null){ %>
	            	alert("이미 이의신청 되었습니다.");
	            <% } %>
	        });
        <% } %>
        
        <% if(gradeList.get(i).getReqDate()==null) { %>
		$("AnswerheaderBtn<%=(i+1)%>").html("");
 		<%} else { %>
        AnswerheaderBtn<%=(i+1)%>.addEventListener('click', function(e){
        	/* alert(this.id); */
        	
        	<% if(gradeList.get(i).getReqAwswer()!=null) { %>
            AnswerModal.style.display = "block";
            $("#subName_p").val(""); // 초기화
            $("#subName_p").val("<%=gradeList.get(i).getSubName()%>");
            $("#profName_p").val("");
            $("#profName_p").val("<%=gradeList.get(i).getProfName()%>"+"교수");
            $("#grade_p").val("");
            $("#grade_p").val("<%=gradeList.get(i).getGrade()%>");
            $("#reqDate_p").val("");
            $("#reqDate_p").val(year+"/"+month+"/"+date);
			
            $("#reqTitle_p").val("");
	        $("#reqTitle_p").val("re: "+"<%=gradeList.get(i).getReqTitle()%>");
	        $("#reqContent_p").val("");
	        $("#reqContent_p").val("<%=gradeList.get(i).getReqContent()%>");
	        $("#reqAnswer_p").val("");
	        $("#reqAnswer_p").val("<%=gradeList.get(i).getReqAwswer()%>");
	        
			<% } else if(gradeList.get(i).getReqAwswer() == null){ %>
				alert("답변 대기중 입니다.");
			<% } %>
        });
        <%} // else문 끝 %>
   		<%
    		}else if(gradeList.get(i).getEvalPoint()==null){ // 수강 평가를 안했으면 
    			%>
    			var ProfassessheaderBtn<%=(i+1)%> = document.getElementById("profassess<%=(i+1)%>");
    			
    			ProfassessheaderBtn<%=(i+1)%>.addEventListener('click', function(e){
    		            ProfassessModal.style.display = "block";
    		            $("#subName_pfa").val(""); // 초기화
    		            $("#subName_pfa").val("<%=gradeList.get(i).getSubName()%>");
    		            $("#profName_pfa").val("");
    		            $("#profName_pfa").val("<%=gradeList.get(i).getProfName()%>"+"교수");
    		            $("#evalDate_pfa").val("");
    		            $("#evalDate_pfa").val(year+"/"+month+"/"+date);
    		            $("#acaYearSem_pfa").val("");
			            $("#acaYearSem_pfa").val("<%=gradeList.get(i).getAcaYearSem()%>");
			            $("#subCode_pfa").val("");
			            $("#subCode_pfa").val("<%=gradeList.get(i).getSubCode()%>");
			            $("#profId_pfa").val("");
			            $("#profId_pfa").val("<%=gradeList.get(i).getProfId()%>");
    		   });
    	<%} // for문 끝 %>
    <%}%>
    <%}%>
</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />