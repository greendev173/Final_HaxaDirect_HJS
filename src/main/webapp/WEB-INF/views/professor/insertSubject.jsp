<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@  taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	<jsp:include page = "/WEB-INF/views/common/header.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>
	
<div class="main-panel">
	<div class="content-wrapper">
<!-- Body section Start -->	
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">강의 개설</h4>
					</div>
				</div>
			</div>
			</div>
<!-- Main Content start -->	

<div class="col-6">
	<button type="button" id="subjectGo" style="background-color:skyblue;color:black;border:none;">개설강좌</button>
	<button type="button" id="subjectTime" style="background-color:lightgray;border:none;">시간표</button>
</div>

<div id="ajaxContent" class="row">
	<div class="col-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<div class="row gap1">
					<div class="col-6">
						<table id="noGaekang" class="scrolltable" style="text-align:center;overflow-y:scroll;height:270px;">
							<tr style="background-color:lightgray;">
								<th style="text-align:center;">이수구분</th>
								<th style="text-align:center;">과목명</th>
								<th style="text-align:center;">강의시간</th>
								<th style="text-align:center;">학과코드</th>
								<th style="text-align:center;">수강학년</th>
								<th style="text-align:center;">수강학과</th>
								<th style="text-align:center;">정원</th>
								<th style="text-align:center;">개설여부</th>
							</tr>
							<c:forEach items="${iClassView }" var="cv">
							<c:if test="${loginMember.profId eq cv.PROF_ID }">
								<c:set value="${cv.OPEN_YN }" var="yn"/> <!-- 개설여부가 N만 보이게하는 if문 -->
								<c:if test="${yn eq 'N' }">
									<tr style="height:20px;">
										<td style="text-align:center;">${cv.SUB_TYPE }</td>
										<input class="subCodeYn" type='hidden' value="${cv.SUB_CODE }" name='subCode'/>
										<td style="text-align:center;font-size:8px;">
											<a href="javascript:void(window.open('${pageContext.request.contextPath }/professor/subjectView?subCode=${cv.SUB_CODE }&profId=${loginMember.profId }&subTime=${cv.SUB_TIME }','개설과목 조회','width=660,height=635,top=50,left=400,resizable=no'))">
											${cv.SUB_NAME }
											</a>
										</td>
										<td style="text-align:center;width:150px;">
										
											<%-- ${cv.SUB_TIME } --%>
											<c:set var="subTime" value="${cv.SUB_TIME }"/>
					
											<c:if test="${fn:length(subTime) == 11}">
											<c:out value="${fn:substring(subTime,0,5) }"/> ~ <c:out value="${fn:substring(subTime,6,11) }"/>
											</c:if>
											<c:if test="${fn:length(subTime) == 17}">
											<c:out value="${fn:substring(subTime,0,5) }"/> ~ <c:out value="${fn:substring(subTime,12,17) }"/>
											</c:if>
										
										</td>
										<td style="text-align:center;">${cv.DEPT_CODE }</td>
										<td style="text-align:center;">${cv.TARGET_GRADE }</td>
										<td style="text-align:center;">${cv.SUB_SEMESTER }</td>
										<td style="text-align:center;">${cv.CAPACITY }</td>
										<td style="text-align:center;">
											<select class="ynCheck" id="ynCheck" name="openYn">
												<option value="Y">Y</option>
												<option value="N" selected="selected">N</option>
											</select>
										</td>
									</tr>
								</c:if>
							</c:if>
							</c:forEach>
						</table>
					</div>
					<div class="col-6">
						<table class="scrolltable" style="text-align:center;overflow-y:scroll;height:270px;">
							<tr style="background-color:lightgray;">
								<th style="text-align:center;">이수구분</th>
								<th style="text-align:center;">과목명</th>
								<th style="text-align:center;">강의시간</th>
								<th style="text-align:center;">학과코드</th>
								<th style="text-align:center;">수강학년</th>
								<th style="text-align:center;">수강학과</th>
								<th style="text-align:center;">정원</th>
								<th style="text-align:center;">개설여부</th>
							</tr>
							<c:forEach items="${iClassView }" var="cv">
							<c:if test="${loginMember.profId eq cv.PROF_ID }">
								<c:set value="${cv.OPEN_YN }" var="yn"/> <!-- 개설여부가 Y만 보이게하는 if문 -->
								<c:if test="${yn eq 'Y' }">
									<tr style="height:20px;">
										<td style="text-align:center;">${cv.SUB_TYPE }</td>
										<input class="subCodeYn" type='hidden' value="${cv.SUB_CODE }" name='subCode'/>
										<td style="text-align:center;font-size:8px;">
											<a href="javascript:void(window.open('${pageContext.request.contextPath }/professor/subjectView?subCode=${cv.SUB_CODE }&profId=${loginMember.profId }&subTime=${cv.SUB_TIME }','개설과목 조회','width=660,height=635,top=50,left=400,resizable=no'))">
											${cv.SUB_NAME }
											</a>
										</td>
										
										<td style="text-align:center;width:150px;">
										
											<%-- ${cv.SUB_TIME } --%>
											<c:set var="subTime" value="${cv.SUB_TIME }"/>
					
											<c:if test="${fn:length(subTime) == 11}">
											<c:out value="${fn:substring(subTime,0,5) }"/> ~ <c:out value="${fn:substring(subTime,6,11) }"/>
											</c:if>
											<c:if test="${fn:length(subTime) == 17}">
											<c:out value="${fn:substring(subTime,0,5) }"/> ~ <c:out value="${fn:substring(subTime,12,17) }"/>
											</c:if>
										
										</td>
										
										<td style="text-align:center;">${cv.DEPT_CODE }</td>
										<td style="text-align:center;">${cv.TARGET_GRADE }</td>
										<td style="text-align:center;">${cv.SUB_SEMESTER }</td>
										<td style="text-align:center;">${cv.CAPACITY }</td>
										<td style="text-align:center;">${cv.OPEN_YN }</td>
									</tr>
								</c:if>
							</c:if>
							</c:forEach>
						</table>
					</div>
				</div>
				
				<form action="" method="post" id="insertSubject">
				<%-- <input type='hidden' value="${profId }" name="profId"/> --%>
				<div class="row" style="height:7px;border-top:0.5px solid black;"></div>
				<div class="row">
					<div class="col-6">
						
					</div>
					<div class="col-6">
						<input id="insertButton" type='button' style="float:right;" value="강의 등록"/>
						<input id="subjectSeq" name="subSeq" type='hidden'/>
					</div>
				</div>
					<div class="row" style="height:5px;"></div>
					<div class="row" style="height:5px;"></div>
					<div class="row" style="">
						<div class="col-4">
							<table class="">
								<tr>
									<th>개설학기</th>
									<td><input name="subYear" id="subYear" type='number' min="2019" max="2050" style="width:100px;" readonly /> 년도 </td>
									<td><input type='text' id="subSemester" name="subSemester" style="width:15px;text-align:center;" readonly/> 학기</td>
								</tr>
								<tr>
									<th>교수명</th>
									<input id="profId" type='hidden' name="profId" value="${loginMember.profId }"/>
									<td><input name="profName" type='text' value="${loginMember.profName }" readonly/></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><input name="phone" type='tel' value="${loginMember.phone }"/></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><input name="email" type='email' value="${loginMember.email }"/></td>
								</tr>
								<tr>
									<th>과목명</th>
									<td><input id="subName" name="subName" type='text' readonly/></td>
									<td>
										<input id="fn_subjectCode" name="subCode" style="width:70px;text-align:center;" type='button' value="과목 코드" readonly/>
									</td>
								</tr>
								<tr>
									<th>수강학년</th>
									<td><input type='text' id="tGrade" name="targetGrade" style="width:15px;text-align:center;" readonly/> 학년</td>
								</tr>
								<tr>
									<th>수강학과</th>
									<td><input id="tDept" name="deptName" type='text' readonly/></td>
								</tr>
							</table>
						</div>
						<div class="col-4">
							<table class="">
								<tr>
									<th>강의실</th>
									<td><input id="classRoom" name="classRoom" type='text' readonly/></td>
								</tr>
								<tr>
									<th>강의시간</th>
									<td><input id="classTime" name="classTime" type='text' readonly/></td>
								</tr>
								<tr>
									<th>강의요일</th>
									<td><input id="classDate" name="classDate" type="text" readonly/></td>
								</tr>
								<tr>
									<th>강의목표</th>
									<td><input id="tSubject" name="targetSubject" type='text' readonly/></td>
								</tr>
								<tr>
									<th>학과코드</th>
									<td><input id="deptCode" name="deptCode" type='text' readonly/></td>
								</tr>
								<tr>
									<th>단위</th>
									<td><input id="completePt" name="completePt" style="width:60px;" type='number' readonly/> &nbsp; 학점</td>
								</tr>
								<tr>
									<th>이수구분</th>
									<td><input type='text' id="subType" name="subType" class="selectBox" readonly/></td>
								</tr>
							</table>
						</div>
						<div class="col-4">
							<table class="">
<!-- 								<tr>
									<th>전공</th>
									<td><input name="deptName" type='text'/></td>
								</tr> -->
								<tr>
									<th>정원</th>
									<td><input name="capacity" type='number' style="width:60px;" min="25" max="30"/> 명 </td>
								</tr>
								<tr>
									<th>교재 사용</th>
									<td><select id="noBook" name="useBook" class="selectBox">
										<option value="Y" selected="selected">사용</option>
										<option value="N">미사용</option>
									</select></td>
								</tr>
								<tr>
									<th>교재 제목 입력</th>
									<td><input id="noBookName" name="bookName" type='text'/></td>
								</tr>
								<tr>
									<th>평가 기준</th>
									<td><select name="evaStan" class="selectBox">
										<option value="상대평가" selected>상대</option>
										<option value="절대평가">절대</option>
									</select></td>
								</tr>
								<tr>
									<th>재수강여부</th>
									<td><select name="" class="selectBox">
										<option value="가능" selected>가능</option>
										<option value="불가능">불가능</option>
									</select></td>
								</tr>
								<tr>
									<th>타교생 허용</th>
									<td><select name="openOther" class="selectBox">
										<option value="가능">가능</option>
										<option value="불가능">불가능</option>
									</select></td>
								</tr>
								<tr>
									<th>개설여부</th>
									<td><select name="openYn" class="selectBox">
										<option value="Y" disabled>Y</option>
										<option value="N" selected>N</option>
									</select></td>
								</tr>
								<tr>
									<th style="width:150px;">강의계획서 첨부파일</th>
									<td><input name="upfile" type='file'/></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="row" style="height:50px;border-bottom:0.5px solid black;">
						<div class="col-12">
							<table class="">
								<tr>
									<th>평가기준</th>
									<th style="width:50px;">중간</th><td><input name="mTerm" style="width:70px;background-color:snow" type='text'/></td>
									<th style="width:50px;">&nbsp;&nbsp;기말</th><td><input name="fTerm" style="width:70px;background-color:snow" type='text'/></td>
									<!-- <th style="width:50px;">&nbsp;&nbsp;과제</th><td><input name="assign" style="width:70px;background-color:snow" type='text'/></td> -->
									<th style="width:50px;">&nbsp;&nbsp;출석</th><td><input name="statusGrade" style="width:70px;background-color:snow" type='text'/></td>
								</tr>
								<tr>
									<th>과제기준</th>
									<th style="width:50px;">과제A</th><td><input name="assignA" style="width:70px;background-color:snow" type='text'/></td>
									<th style="width:50px;">&nbsp;&nbsp;과제B</th><td><input name="assignB" style="width:70px;background-color:snow" type='text'/></td>
									<th style="width:50px;">&nbsp;&nbsp;과제C</th><td><input name="assignC" style="width:70px;background-color:snow" type='text'/></td>
									<th style="width:50px;">&nbsp;&nbsp;과제D</th><td><input name="assignD" style="width:70px;background-color:snow" type='text'/></td>
								</tr>
							</table>
						</div>
					</div>
				</form>
			</div>
			</div>
		</div>
	</div>
</div>


<!-- <div class="container-fluid"> -->
	


<script>

$("#subjectGo").click(function(){
	$("#subjectGo").css({"background-color":"skyblue","color":"black"});
	location.href="${pageContext.request.contextPath}/professor/insertSubject";
});
$("#subjectTime").click(function(){
	var profId = $("#profId").val();
	$("#subjectTime").css({"background-color":"skyblue","color":"black"});
	$("#subjectGo").css({"background-color":"lightgray","color":"black"});
	$.ajax({
		url:"${pageContext.request.contextPath}/professor/profSchedule",
		data:{profId:profId},
		success:function(data){
			$("#ajaxContent").html(data);
		}
	});
	
	/* window.open("${pageContext.request.contextPath}/professor/profSchedule?profId="+profId, "시간표", "width=400, height=300, left=100, top=50");	 */
	
});

//yn check
/* $(function(){
	$(".openYnCheck").change(function(){
		console.log($(this).val());
		if($(this).val()=='Y'){
			if(confirm("등록하시겠습니까?")==true){
				$(this).val('Y');
				var subCode = $(".subCode").val();
				console.log(subCode);
				
				
			}else{
				$(this).val('N');
				return false;
			}
		}
	});
}); */
$(function(){
	$(".ynCheck").change(function(){
		var code = $(this).parent().parent().find('.subCodeYn').val();
		console.log(code);
		if($(this).val()=='Y'){
			if(confirm("등록하시겠습니까?")==true){
				console.log($(this).val());
				$(this).val('Y');
				
				location.href="${pageContext.request.contextPath}/professor/subjectYn?subCode="+code;
				
			}else{
				$(this).val('N');
				return false;
			}
		}
	});
});

//교재 사용안함
$(function(){
	$("#noBook").change(function(){
		console.log($("#noBook").val());
		if($("#noBook").val()=="N"){
			$("#noBookName").attr("readonly",true).css("color","red").val("교재 사용 안함");
		}else if($("#noBook").val()=="Y"){
			$("#noBookName").attr("readonly",false).css("color","black").val("");
		}
	})
});
//과목코드 팝업창
$(function(){
	$("#fn_subjectCode").click(function(){
		var url="${pageContext.request.contextPath }/professor/subjectCodeView?profId=${loginMember.profId}";
    	var name="subject";
    	var option="width=1250,height=500,top=100,left=140,resizable=no";
    	window.open(url,name,option);
	});
});

function selectSubject(subCode,subTime,subYear,targetGrade,subSemester){
	$.ajax({
		url:"${pageContext.request.contextPath}/professor/selectSubject",
		data:{"subCode":subCode,"subTime":subTime,"subYear":subYear,"targetGrade":targetGrade,"subSemester":subSemester},
		async:false,
		success:function(data){
			console.log("성공");
			console.log(subCode);
			console.log(data);
			//var subject = new Array();
			var subject = JSON.parse(data);
			$("#subYear").val(subject.SUB_YEAR);
			$("#deptCode").val(subject.DEPT_CODE);
			$("#fn_subjectCode").val(subject.SUB_CODE);
			$("#tDept").val(subject.DEPT_NAME);
			$("#tGrade").val(subject.TARGET_GRADE);
			$("#completePt").val(subject.COMPLETE_PT);
			$("#subSemester").val(subject.SUB_SEMESTER);
			$("#subType").val(subject.SUB_TYPE);
			$("#subName").val(subject.SUB_NAME);
			$("#tSubject").val(subject.TARGET_SUBJECT);
			$("#classDate").val(subject.SUB_DATE);
			$("#classTime").val(subject.SUB_TIME);
			$("#classRoom").val(subject.SUB_ROOM);
			$("#subjectSeq").val(subject.SUB_SEQ);

   	 	}
	});
	
}
//textarea 글자수 제한
$(function(){
	$('.textsize').on('keyup', function() {
		if($(this).val().length > 200) {
			alert("글자수는 200자로 이내로 제한됩니다.");
			$(this).val($(this).val().substring(0, 200));
		}
	});
});

$(function(){
	$("#subYear").on('blur', function(){
		if($(this).val()<'2019'){
			alert("이전 년도는 불가능합니다.");
			$(this).val('');
		}return;
	});
});

$(function(){
	$("#insertButton").click(function(){
		if(confirm("등록 하시겠습니까?")==true){
			console.log($("#insertSubject input,#insertSubject select"));
			var data=new FormData();
				$.each($("#insertSubject input,#insertSubject select"),function(i,item){
					var name=$(item).attr("name");
					var value=$(item).val();
					if(name=='upfile'){
						data.append(name,$(item)[0].files[0])
					}else{
						data.append(name,value);
					}
			});
			console.log(data);

		$.ajax({
			url:"${path}/professor/insertSubjectEnd",
			data:data,
			type:"post",
			processData:false,
			contentType:false,
			success:function(data){
				var d=JSON.parse(data);
				console.log(d[1]);
					var tr= $("<tr>");
					var td="<td>"+d[0]["SUB_TYPE"]+"</td>";
					td+="<td style='text-align:center;font-size:5px;'>"+"<a href='javascript:void(window.open('${pageContext.request.contextPath }/professor/subjectView?subCode='+d[0]['SUB_CODE'],'개설과목 조회','width=660,height=635,top=50,left=400,resizable=no'))'>"+d[0]["SUB_NAME"]+"</a>"+"</td>";
					td+="<td style='width:150px;'>"+d[0]["SUB_TIME"]+"</td>";
					td+="<td>"+d[0]["DEPT_CODE"]+"</td>";
					td+="<td>"+d[0]["TARGET_GRADE"]+"</td>";
					//td+="<td>"+d[0]["T_DEPT"]+"</td>";
					td+="<td>"+d[0]["SUB_SEMESTER"]+"</td>";
					td+="<td>"+d[0]["CAPACITY"]+"</td>";
					td+="<td>"+"<select class='ynCheck' id='ynCheck' name='openYn'><option value='Y'>"+'Y'+"</option><option value='N' selected>"+d[0]["OPEN_YN"]+"</option></select>"+"</td>";
					tr.append(td);
					console.log(tr);
					$("#noGaekang").children().last().after(tr);
			}
		});
		}else{
			return false;
		}
	});
});
</script>
<style>
	.scrolltable {
	    display: block;
	    overflow: auto;
	}
	select{
		font-size:10px;
		width:auto;
	}
	input{
		width:150px;
		font-size:10px;
	}
	div{
/* 		border:0.5px solid coral; */
		font-size:10px;
	}
	.gap1{
		height:300px;
	}
	table tr th{
		width:120px;
		text-align:left;
		padding:4px;
 		font-size:10px;
	}
</style>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>