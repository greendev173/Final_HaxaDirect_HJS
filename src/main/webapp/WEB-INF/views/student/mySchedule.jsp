<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.finalProject.student.model.vo.MySchedule"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<c:set var="path" value="${pageContext.request.contextPath }"/>

	<jsp:include page = "/WEB-INF/views/common/header.jsp">
		<jsp:param name="pageTitle" value="개인 시간표 조회"/>
	</jsp:include>


	<style>
		@import url('https://fonts.googleapis.com/css?family=Jua&display=swap');
		
		.nanumFont {
			/* font-family: 'Jua', sans-serif; */
			font-family: 'Nanum Gothic', sans-serif;
			font-weight:bold;
		}
		
		.topTable {
			background-color:#FAF4C0;
		}
		
		tr, td, th {
			text-align: center;
			font-size: 13px;
			border:1px solid lightgray;
			cursor: auto;
			/* font-family: 'Jua', sans-serif; */
			font-family: 'Nanum Gothic', sans-serif;
			font-weight:bold;
		}
		
		table#timeTable td { 
			width:120px;
			text-align:center;
		}
		
		h4, option {
		 	font-family: 'Nanum Gothic', sans-serif;
			font-weight:bold;
		}
		
		input{
			width:100px;
		}
	
		table {
			width: 100%;
		}

		.marginLeft {
			margin-left:10px;
		}
		.btn btn-outline-primary btn-sm{
			
		}
		#classInfo>tr{
			font-size:25px;
		}
		
		#classInfoTitle>th{
			border:1px solid Lightgray;
			font-size:16px;
			font-family:arial;
			text-align:center;
		}
		
		#classInfo>td{
			border:1px solid Lightgray;
			font-size:16px;
		}
		
	</style>
	
	
	<div class="main-panel">
	<div class="content-wrapper">
		<!-- 시작 -->
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
					<div class="table-responsive">
					<table class="table table-default table-striped nanumFont">
					<thead class="thead-dark">
					<tr>
					</tr>
				      <tr>
				        <th colspan="11" style="font-size:25px;" class="nanumFont">나의 시간표 조회</th>
				      </tr>
				    </thead>
				<tr>
				<td style="background-color:#D4F4FA;"><h4>개설년도</h4>
				<select id="chk_year" name="chk_year" class="form-control form-control-sm nanumFont" style="color:black;">
					<option value="">전체</option>
					<option id="thisYear" value=""></option>
					<option id="year2" value=""></option>
					<option id="year3" value=""></option>
					<option id="year4" value=""></option>
					<option id="year5" value=""></option>
				</select>
				</td>
				
				<td style="background-color:#D4F4FA;"><h4>개설학기</h4>
				<select id="chk_sem" name="chk_sem" class="form-control form-control-sm nanumFont" style="color:black;">
					<option value="">전체</option>
					<option value="1">1</option>
					<option value="2">2</option>
				</select>
				</td>
				<td colspan="2" style="border:0px;">
				<button type="button" style="font-size:17px;" class="btn btn-outline-primary btn-icon-text nanumFont">조회</button>
				</td>
				</tr>
				</table>
				<br><br>
				<table id="timeTable" class="table table-default table-striped" >
					<tr>
					<td class="topTable">교시</td>
					<td class="topTable">월</td>
					<td class="topTable">화</td>
					<td class="topTable">수</td>
					<td class="topTable">목</td>
					<td class="topTable">금</td>
					</tr>
					<tr>
					<td>1교시<br>(09:00~09:50)</td>
					<td><div id="mon1"></div></td>
					<td><div id="tue1"></div></td>
					<td><div id="wed1"></div></td>
					<td><div id="thu1"></div></td>
					<td><div id="fri1"></div></td>
					</tr>
					<tr>
					<td>2교시<br>(10:00~10:50)</td>
					<td><div id="mon2"></div></td>
					<td><div id="tue2"></div></td>
					<td><div id="wed2"></div></td>
					<td><div id="thu2"></div></td>
					<td><div id="fri2"></div></td>
					</tr>
					<tr>
					<td>3교시<br>(11:00~11:50)</td>
					<td><div id="mon3"></div></td>
					<td><div id="tue3"></div></td>
					<td><div id="wed3"></div></td>
					<td><div id="thu3"></div></td>
					<td><div id="fri3"></div></td>
					</tr>
					<tr>
					<td>4교시<br>(12:00~12:50)</td>
					<td><div id="mon4"></div></td>
					<td><div id="tue4"></div></td>
					<td><div id="wed4"></div></td>
					<td><div id="thu4"></div></td>
					<td><div id="fri4"></div></td>
					</tr>
					<tr>
					<td>5교시<br>(13:00~13:50)</td>
					<td><div id="mon5"></div></td>
					<td><div id="tue5"></div></td>
					<td><div id="wed5"></div></td>
					<td><div id="thu5"></div></td>
					<td><div id="fri5"></div></td>
					</tr>
					<tr>
					<td>6교시<br>(14:00~14:50)</td>
					<td><div id="mon6"></div></td>
					<td><div id="tue6"></div></td>
					<td><div id="wed6"></div></td>
					<td><div id="thu6"></div></td>
					<td><div id="fri6"></div></td>
					</tr>
					<tr>
					<td>7교시<br>(15:00~15:50)</td>
					<td><div id="mon7"></div></td>
					<td><div id="tue7"></div></td>
					<td><div id="wed7"></div></td>
					<td><div id="thu7"></div></td>
					<td><div id="fri7"></div></td>
					</tr>
					<tr>
					<td>8교시<br>(16:00~16:50)</td>
					<td><div id="mon8"></div></td>
					<td><div id="tue8"></div></td>
					<td><div id="wed8"></div></td>
					<td><div id="thu8"></div></td>
					<td><div id="fri8"></div></td>
					</tr>
					<tr>
					<td>9교시<br>(17:00~17:50)</td>
					<td><div id="mon9"></div></td>
					<td><div id="tue9"></div></td>
					<td><div id="wed9"></div></td>
					<td><div id="thu9"></div></td>
					<td><div id="fri9"></div></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>

	
	<script>

	function searchSchedule(subTime, subDate, subName, subRoom, profName) {
		
		console.log(subTime);
		console.log(subDate);
		console.log(subName);
		if(subDate=='월') {
			if(subTime.includes("09:00")) {
				$("#mon1").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("10:00")) {
				$("#mon2").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("11:00")) {
				$("#mon3").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("12:00")) {
				$("#mon4").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("13:00")) {
				$("#mon5").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("14:00")) {
				$("#mon6").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("15:00")) {
				$("#mon7").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("16:00")) {
				$("#mon8").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("17:00")) {
				$("#mon9").html(subName+"<br>("+subRoom+", "+profName+")");
			}
		}
		if(subDate=='화') {
			if(subTime.includes("09:00")) {
				$("#tue1").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("10:00")) {
				$("#tue2").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("11:00")) {
				$("#tue3").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("12:00")) {
				$("#tue4").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("13:00")) {
				$("#tue5").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("14:00")) {
				$("#tue6").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("15:00")) {
				$("#tue7").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("16:00")) {
				$("#tue8").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("17:00")) {
				$("#tue9").html(subName+"<br>("+subRoom+", "+profName+")");
			}
		}
		if(subDate=='수') {
			if(subTime.includes("09:00")) {
				$("#wed1").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("10:00")) {
				$("#wed2").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("11:00")) {
				$("#wed3").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("12:00")) {
				$("#wed4").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("13:00")) {
				$("#wed5").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("14:00")) {
				$("#wed6").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("15:00")) {
				$("#wed7").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("16:00")) {
				$("#wed8").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("17:00")) {
				$("#wed9").html(subName+"<br>("+subRoom+", "+profName+")");
			}
		}
		if(subDate=='목') {
			if(subTime.includes("09:00")) {
				$("#thu1").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("10:00")) {
				$("#thu2").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("11:00")) {
				$("#thu3").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("12:00")) {
				$("#thu4").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("13:00")) {
				$("#thu5").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("14:00")) {
				$("#thu6").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("15:00")) {
				$("#thu7").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("16:00")) {
				$("#thu8").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("17:00")) {
				$("#thu9").html(subName+"<br>("+subRoom+", "+profName+")");
			}
		}
		if(subDate=='금') {
			if(subTime.includes("09:00")) {
				$("#fri1").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("10:00")) {
				$("#fri2").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("11:00")) {
				$("#fri3").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("12:00")) {
				$("#fri4").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("13:00")) {
				$("#fri5").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("14:00")) {
				$("#fri6").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("15:00")) {
				$("#fri7").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("16:00")) {
				$("#fri8").html(subName+"<br>("+subRoom+", "+profName+")");
			}
			if(subTime.includes("17:00")) {
				$("#fri9").html(subName+"<br>("+subRoom+", "+profName+")");
			}
		}
	}
	/* 년도 띄워주기 */
		var today = new Date();
		var yyyy = today.getFullYear();
		console.log(yyyy);
		$("#thisYear").attr("value",yyyy);
		$("#thisYear").text(yyyy);
		$("#year2").attr("value",(yyyy-1));
		$("#year2").text((yyyy-1));
		
		$("#year3").attr("value",(yyyy-2));
		$("#year3").text((yyyy-2));
		
		$("#year4").attr("value",(yyyy-3));
		$("#year4").text((yyyy-3));
		
		$("#year5").attr("value",(yyyy-4));
		$("#year5").text((yyyy-4));
		
	
		
		<% 
		List<MySchedule> myScheduleList=null;
			if(request.getAttribute("myScheduleList")!=null) {
				myScheduleList=(ArrayList)request.getAttribute("myScheduleList");
				for(int i=0; i<myScheduleList.size(); i++) {
		%>
			
			var subTime<%=i%>="<%=myScheduleList.get(i).getSubTime()%>";
			var subDate<%=i%>="<%=myScheduleList.get(i).getSubDate()%>";
			var subName<%=i%>="<%=myScheduleList.get(i).getSubName()%>";
			var subRoom<%=i%>="<%=myScheduleList.get(i).getSubRoom()%>";
			var profName<%=i%>="<%=myScheduleList.get(i).getProfName()%>";

			searchSchedule(subTime<%=i%>, subDate<%=i%>, subName<%=i%>, subRoom<%=i%>, profName<%=i%>);
		
		<%
				}
			}
		%>
	</script>
	
	


	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>