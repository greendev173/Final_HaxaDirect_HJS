<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@  taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	<jsp:include page = "/WEB-INF/views/common/header.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>


<style>
	.gap0{
		height:50px;
	}
	.gap1{
		height:100px;
	}
	.gap2{
		height:200px;
	}
	.gap3{
		height:300px;
	}
</style>

<div class="main-panel">
	<div class="content-wrapper">
<!-- Body section Start -->	
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">강의 내역</h4>
					</div>
				</div>
			</div>
			</div>
<!-- Main Content start -->	

<div class="col-12" style="top:5px;">

	<button id="myPlanResult" class="btn" style="background-color:white;height:10px;width:100px;position:relative;">
		<span style="font-size:9px;font-weight:bold;top:-10px;position:relative;">내 강의</span>
	</button>
	<button id="allPlanResult" class="btn" style="background-color:lightgray;height:10px;width:100px;position:relative;">
		<span style="font-size:9px;font-weight:bold;top:-10px;position:relative;">전체 강의</span>
	</button>
</div>
<input id="profId" type='hidden' value="${loginMember.profId }">
<div class="row">
	<div class="col-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-12">
						<table class="table table-hover" style="text-align:center;">
						<thead>
							<tr style="background-color:lightgray;">
								<th>교수명</th>
								<th>과목명</th>
								<th>강의실</th>
								<th>강의시간</th>
								<th>연락처</th>
								<th>이메일</th>
							</tr>
						</thead>
						<tbody id="tbody">
							<c:forEach items="${planResult }" var="planResult">
							
							<c:set var="loginProfId" value="${loginMember.profId}"/>
							
							<c:choose>
							<c:when test="${loginProfId eq planResult.PROF_ID }">
								<tr style="background-color:skyblue;"><!-- #ececec -->
									<th><c:out value="${planResult.PROF_NAME}" /></th>
									<td>
										<a href="javascript:void(window.open('${pageContext.request.contextPath }/professor/subjectView?subCode=${planResult.SUB_CODE}&profId=${planResult.PROF_ID}&subTime=${planResult.SUB_TIME}','개설과목 조회','width=660,height=635,top=50,left=400,resizable=no'))">
											<c:out value="${planResult.SUB_NAME }"/>
										</a>
									</td>
									<td><c:out value="${planResult.SUB_ROOM }"/></td>
									
									
									
									<td>
										<c:set var="subTime" value="${planResult.SUB_TIME }"/>
										
										<c:if test="${fn:length(subTime) == 11}">
										<c:out value="${fn:substring(subTime,0,5) }"/> ~ <c:out value="${fn:substring(subTime,6,11) }"/>
										</c:if>
										<c:if test="${fn:length(subTime) == 17}">
										<c:out value="${fn:substring(subTime,0,5) }"/> ~ <c:out value="${fn:substring(subTime,12,17) }"/>
										</c:if>
										<%-- <c:out value="${planResult.SUB_TIME }"/> --%>
									</td>
									
									
									
									<td><c:out value="${planResult.PHONE }"/></td>
									<td><c:out value="${planResult.EMAIL }"/></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<th><c:out value="${planResult.PROF_NAME}" /></th>
									<td>
										<a href="javascript:void(window.open('${pageContext.request.contextPath }/professor/subjectView?subCode=${planResult.SUB_CODE}&profId=${planResult.PROF_ID}&subTime=${planResult.SUB_TIME}','개설과목 조회','width=660,height=635,top=50,left=400,resizable=no'))">
											<c:out value="${planResult.SUB_NAME }"/>
										</a>
									</td>
									<td><c:out value="${planResult.SUB_ROOM }"/></td>
									<td>
									
									
										<c:set var="subTime" value="${planResult.SUB_TIME }"/>
										
										<c:if test="${fn:length(subTime) == 11}">
										<c:out value="${fn:substring(subTime,0,5) }"/> ~ <c:out value="${fn:substring(subTime,6,11) }"/>
										</c:if>
										<c:if test="${fn:length(subTime) == 17}">
										<c:out value="${fn:substring(subTime,0,5) }"/> ~ <c:out value="${fn:substring(subTime,12,17) }"/>
										</c:if>
										
										
									</td>
									<td><c:out value="${planResult.PHONE }"/></td>
									<td><c:out value="${planResult.EMAIL }"/></td>
								</tr>
							</c:otherwise>
							</c:choose>
							</c:forEach>
						</tbody>
						</table>
				
					</div>
				</div>
				
					<div class="row" style="height:40px;"></div>
					<div class="row">
						<div class="col-4"></div>
						<div id="pageBar" class="col-4">${pageBar }</div>
						<div class="col-4"></div>
					</div>
					
			</div>
		</div>
	</div>
</div>


<script>
	$("#myPlanResult").click(function(){
		$(this).css({"background-color":"lightgray"});
		$("#allPlanResult").css({"background-color":"white"});
		
		var profId = $("#profId").val();
		console.log(profId);
		
		$.ajax({
			url:"${pageContext.request.contextPath}/professor/myPlanResult",
			data:{profId:profId},
			success:function(data){
				var myData = JSON.parse(data);
				var gimoring = "";
				console.log(myData);
				
				for(var i =0; i<myData.length;i++){
					console.log(""+myData[i].PROF_ID);
					console.log(""+myData[i].SUB_NAME);
					console.log(""+myData[i].SUB_ROOM);
					
					gimoring += "<tr>";
					gimoring += "<th>"+myData[i].PROF_NAME+"</th>";
					gimoring += "<td><a href=";
					gimoring += "'javascript:void(0)' onclick=openSubject(\'"+myData[i].PROF_ID+"\',\'"+myData[i].SUB_CODE+"\',\'"+myData[i].SUB_TIME+"\');>"+myData[i].SUB_NAME;
					gimoring += "</a></td>";
					gimoring += "<td>"+myData[i].SUB_ROOM+"</td>";
					gimoring += "<td>"+myData[i].SUB_TIME+"</td>";
					gimoring += "<td>"+myData[i].PHONE+"</td>";
					gimoring += "<td>"+myData[i].EMAIL+"</td>";
					gimoring += "</tr>";
					
				}
				
				$("#tbody").html(gimoring);
				$("#pageBar").css({"display":"none"});
			}
		});
		
	});
	$("#allPlanResult").click(function(){
		$(this).css({"background-color":"lightgray"});
		$("#myPlanResult").css({"background-color":"white"});
		location.href="${pageContext.request.contextPath}/professor/profPlanResult";
	});
	function openSubject(prof_id,sub_code,sub_time){
		window.open('${pageContext.request.contextPath }/professor/subjectView?subCode='+sub_code+'&profId='+prof_id+'&subTime='+sub_time,'개설과목 조회','width=660,height=635,top=50,left=400,resizable=no');
	}
	
</script>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>