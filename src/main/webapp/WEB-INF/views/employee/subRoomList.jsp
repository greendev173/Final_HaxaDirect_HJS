<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<style>
	.col2{
		background-color:rgba(104, 175, 255, 0.2);
	}
	.col3{
		background-color:rgba(235, 160, 160, 0.2);
	}
	th, td{
		text-align:center;
		width:17%;
	}
</style>
<div class="main-panel">
	<div class="content-wrapper">
	<div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">강의장 사용현황 조회</h4>
                <div class="row">
                  <div class="col-md-5">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">년도 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="year" name="subYear">
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-5">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">학기 선택</label>
                          <div class="col-sm-4">
                            <div class="form-check">
                              <label class="form-check-label">
                                <input type="radio" class="form-check-input seme" name="subSemester" value="1">
                                1학기
                              <i class="input-helper"></i></label>
                            </div>
                          </div>
                          <div class="col-sm-3">
                            <div class="form-check">
                              <label class="form-check-label">
                                <input type="radio" class="form-check-input seme" name="subSemester" value="2">
                                2학기
                              <i class="input-helper"></i></label>
                            </div>
                          </div>
                        </div>
                      </div>
                      </div>
                      <div class="row">
                     <div class="col-md-5">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">강의관</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="roomTitle">
                            	<option id="roomTitlec">강의관 선택</option>
                            	<option value="A">A관</option>
                            	<option value="B">B관</option>
                            	<option value="C">C관</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-5">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">강의실</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="classRoom" name="subRoom">
                            </select>
                          </div>
                        </div>
                      </div>
                        <div class="col-md-2">
                    <button class="btn btn-primary mb-2" id="roomUseBtn">조회</button>
                    </div>
                    </div>
                </div>
              </div>
            </div>
			

<div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <div class="table-responsive pt-3">
                    <table class="table table-bordered" id="roomTable">
                        <tr>
                        	<td>위의 조건으로 조회해주시기 바랍니다. </td>
                        </tr>
                    </table>
                  </div>
                </div>
              </div>
            </div>
			<script>
			$("#roomUseBtn").click(function(){
				var year=$("#year").val();
				var subSeme = $(":input:radio[name=subSemester]:checked").val();
				var classRoom=$("#classRoom").val();
				$.ajax({
					url:"${path}/subRoomUse.hd",
					data:{"subYear": year,"subSemester": subSeme,"subRoom": classRoom},
					success:function(data){
						var re=JSON.parse(data);
						var roomArr="";
						roomArr+="<tr><th>/</th><th>월요일</th><th>화요일</th><th>수요일</th><th>목요일</th><th>금요일</th></tr>";
						roomArr+="<tr><td>09:00~09:50 - (1교시)</td><td id='mon1'></td><td id='tue1'></td><td id='wed1'></td><td id='thu1'></td><td id='fri1'></td></tr>";
						roomArr+="<tr><td>10:00~10:50 - (2교시)</td><td id='mon2'></td><td id='tue2'></td><td id='wed2'></td><td id='thu2'></td><td id='fri2'></td></tr>";
						roomArr+="<tr><td>11:00~11:50 - (3교시)</td><td id='mon3'></td><td id='tue3'></td><td id='wed3'></td><td id='thu3'></td><td id='fri3'></td></tr>";
						roomArr+="<tr><td>12:00~12:50 - (4교시)</td><td id='mon4'></td><td id='tue4'></td><td id='wed4'></td><td id='thu4'></td><td id='fri4'></td></tr>";
						roomArr+="<tr><td>13:00~13:50 - (5교시)</td><td id='mon5'></td><td id='tue5'></td><td id='wed5'></td><td id='thu5'></td><td id='fri5'></td></tr>";
						roomArr+="<tr><td>14:00~14:50 - (6교시)</td><td id='mon6'></td><td id='tue6'></td><td id='wed6'></td><td id='thu6'></td><td id='fri6'></td></tr>";
						roomArr+="<tr><td>15:00~15:50 - (7교시)</td><td id='mon7'></td><td id='tue7'></td><td id='wed7'></td><td id='thu7'></td><td id='fri7'></td></tr>";
						roomArr+="<tr><td>16:00~16:50 - (8교시)</td><td id='mon8'></td><td id='tue8'></td><td id='wed8'></td><td id='thu8'></td><td id='fri8'></td></tr>";
						roomArr+="<tr><td>17:00~17:50 - (9교시)</td><td id='mon9'></td><td id='tue9'></td><td id='wed9'></td><td id='thu9'></td><td id='fri9'></td></tr>";
						
						if(re==""){
							$("#roomTable").html("<tr><td>등록된 강의장 사용내역이 없습니다.</td></tr>");
						}
						else{
						$("#roomTable").html(roomArr);
						re.forEach(function(item){
						
							 var subDate=item["SUB_DATE"];
							 var subTime=item["SUB_TIME"];
							 var subName=item["SUB_NAME"];
							 var profName=item["PROF_NAME"];
							 var subRoom=item["DEPT_NAME"];
							 var completePt=item["COMPLETE_PT"];
							 
			                     if(subDate=='월') {
			                        if(subTime.substr(0,2)=="09") {
			                           $("#mon1").html(subName+"<br><br>("+subRoom+", "+profName+")");
			                           if(completePt=='2'){
				                              $("#mon1").attr("rowspan",'2');
				                              $("#mon1").addClass("col2");
				                              $("#mon2").remove();
				                           }else{
				                              $("#mon1").attr("rowspan",'3');
				                              $("#mon1").addClass("col3");
				                              $("#mon2").remove();
				                              $("#mon3").remove();
				                           }
			                        }
			                        if(subTime.substr(0,2)=="10") {
			                           $("#mon2").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           if(completePt=='2'){
				                              $("#mon2").attr("rowspan",'2');
				                              $("#mon2").addClass("col2");
				                              $("#mon3").remove();
				                           }else{
				                              $("#mon2").attr("rowspan",'3');
				                              $("#mon2").addClass("col3");
				                              $("#mon3").remove();
				                              $("#mon4").remove();
				                           }
			                        }
			                        if(subTime.substr(0,2)=="11") {
			                           $("#mon3").html(subName+"<br><br>("+subRoom+", "+profName+")");
			                           	   if(completePt=='2'){
				                              $("#mon3").attr("rowspan",'2');
				                              $("#mon3").addClass("col2");
				                              $("#mon4").remove();
				                           }else{
				                              $("#mon3").attr("rowspan",'3');
				                              $("#mon3").addClass("col3");
				                              $("#mon4").remove();
				                              $("#mon5").remove();
				                           }
			                        }
			                        if(subTime.substr(0,2)=="12") {
			                           $("#mon4").html(subName+"<br><br>("+subRoom+", "+profName+")");
			                           	   if(completePt=='2'){
				                              $("#mon4").attr("rowspan",'2');
				                              $("#mon4").addClass("col2");
				                              $("#mon5").remove();
				                           }else{
				                              $("#mon4").attr("rowspan",'3');
				                              $("#mon4").addClass("col3");
				                              $("#mon5").remove();
				                              $("#mon6").remove();
				                           }
			                        }
			                        if(subTime.substr(0,2)=="13") {
			                           $("#mon5").html(subName+"<br><br>("+subRoom+", "+profName+")");
			                           	   if(completePt=='2'){
				                              $("#mon5").attr("rowspan",'2');
				                              $("#mon5").addClass("col2");
				                              $("#mon6").remove();
				                           }else{
				                              $("#mon5").attr("rowspan",'3');
				                              $("#mon5").addClass("col3");
				                              $("#mon6").remove();
				                              $("#mon7").remove();
				                           }
			                        }
			                        if(subTime.substr(0,2)=="14") {
			                           $("#mon6").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           if(completePt=='2'){
				                              $("#mon6").attr("rowspan",'2');
				                              $("#mon6").addClass("col2");
				                              $("#mon7").remove();
				                           }else{
				                              $("#mon6").attr("rowspan",'3');
				                              $("#mon6").addClass("col3");
				                              $("#mon7").remove();
				                              $("#mon8").remove();
				                           }
			                        }
			                        if(subTime.substr(0,2)=="15") {
			                           $("#mon7").html(subName+"<br><br>("+subRoom+", "+profName+")");
			                           	   if(completePt=='2'){
				                              $("#mon7").attr("rowspan",'2');
				                              $("#mon7").addClass("col2");
				                              $("#mon8").remove();
				                           }else{
				                              $("#mon7").attr("rowspan",'3');
				                              $("#mon7").addClass("col3");
				                              $("#mon8").remove();
				                              $("#mon9").remove();
				                           }
			                        }
			                        if(subTime.substr(0,2)=="16") {
			                           $("#mon8").html(subName+"<br><br>("+subRoom+", "+profName+")");
			                               if(completePt=='2'){
				                              $("#mon8").attr("rowspan",'2');
				                              $("#mon8").addClass("col2");
				                              $("#mon9").remove();
				                           }else{
				                              $("#mon8").attr("rowspan",'3');
				                              $("#mon8").addClass("col3");
				                              $("#mon9").remove();
				                           }
			                        }
			                        if(subTime.substr(0,2)=="17") {
			                           $("#mon9").html(subName+"<br><br>("+subRoom+", "+profName+")");
			                               if(completePt=='2'){
				                              $("#mon9").attr("rowspan",'2');
				                              $("#mon9").addClass("col2");
				                           }else{
				                              $("#mon9").attr("rowspan",'3');
				                              $("#mon9").addClass("col3");
				                           }
			                        }
			                     }
			                     if(subDate=='화') {
				                        if(subTime.substr(0,2)=="09") {
				                           $("#tue1").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           if(completePt=='2'){
					                              $("#tue1").attr("rowspan",'2');
					                              $("#tue1").addClass("col2");
					                              $("#tue2").remove();
					                           }else{
					                              $("#tue1").attr("rowspan",'3');
					                              $("#tue1").addClass("col3");
					                              $("#tue2").remove();
					                              $("#tue3").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="10") {
				                           $("#tue2").html(subName+"<br><br>("+subRoom+", "+profName+")");
					                           if(completePt=='2'){
					                              $("#tue2").attr("rowspan",'2');
					                              $("#tue2").addClass("col2");
					                              $("#tue3").remove();
					                           }else{
					                              $("#tue2").attr("rowspan",'3');
					                              $("#tue2").addClass("col3");
					                              $("#tue3").remove();
					                              $("#tue4").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="11") {
				                           $("#tue3").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           	   if(completePt=='2'){
					                              $("#tue3").attr("rowspan",'2');
					                              $("#tue3").addClass("col2");
					                              $("#tue4").remove();
					                           }else{
					                              $("#tue3").attr("rowspan",'3');
					                              $("#tue3").addClass("col3");
					                              $("#tue4").remove();
					                              $("#tue5").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="12") {
				                           $("#tue4").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           	   if(completePt=='2'){
					                              $("#tue4").attr("rowspan",'2');
					                              $("#tue4").addClass("col2");
					                              $("#tue5").remove();
					                           }else{
					                              $("#tue4").attr("rowspan",'3');
					                              $("#tue4").addClass("col3");
					                              $("#tue5").remove();
					                              $("#tue6").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="13") {
				                           $("#tue5").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           	   if(completePt=='2'){
					                              $("#tue5").attr("rowspan",'2');
					                              $("#tue5").addClass("col2");
					                              $("#tue6").remove();
					                           }else{
					                              $("#tue5").attr("rowspan",'3');
					                              $("#tue5").addClass("col3");
					                              $("#tue6").remove();
					                              $("#tue7").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="14") {
				                           $("#tue6").html(subName+"<br><br>("+subRoom+", "+profName+")");
					                           if(completePt=='2'){
					                              $("#tue6").attr("rowspan",'2');
					                              $("#tue6").addClass("col2");
					                              $("#tue7").remove();
					                           }else{
					                              $("#tue6").attr("rowspan",'3');
					                              $("#tue6").addClass("col3");
					                              $("#tue7").remove();
					                              $("#tue8").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="15") {
				                           $("#tue7").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           	   if(completePt=='2'){
					                              $("#tue7").attr("rowspan",'2');
					                              $("#tue7").addClass("col2");
					                              $("#tue8").remove();
					                           }else{
					                              $("#tue7").attr("rowspan",'3');
					                              $("#tue7").addClass("col3");
					                              $("#tue8").remove();
					                              $("#tue9").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="16") {
				                           $("#tue8").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                               if(completePt=='2'){
					                              $("#tue8").attr("rowspan",'2');
					                              $("#tue8").addClass("col2");
					                              $("#tue9").remove();
					                           }else{
					                              $("#tue8").attr("rowspan",'3');
					                              $("#tue8").addClass("col3");
					                              $("#tue9").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="17") {
				                           $("#tue9").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                               if(completePt=='2'){
					                              $("#tue9").attr("rowspan",'2');
					                              $("#tue9").addClass("col2");
					                           }else{
					                              $("#tue9").attr("rowspan",'3');
					                              $("#tue9").addClass("col3");
					                           }
				                        }
				                     }
			                     
			                     if(subDate=='수') {
				                        if(subTime.substr(0,2)=="09") {
				                           $("#wed1").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           if(completePt=='2'){
					                              $("#wed1").attr("rowspan",'2');
					                              $("#wed1").addClass("col2");
					                              $("#wed2").remove();
					                           }else{
					                              $("#wed1").attr("rowspan",'3');
					                              $("#wed1").addClass("col3");
					                              $("#wed2").remove();
					                              $("#wed3").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="10") {
				                           $("#wed2").html(subName+"<br><br>("+subRoom+", "+profName+")");
					                           if(completePt=='2'){
					                              $("#wed2").attr("rowspan",'2');
					                              $("#wed2").addClass("col2");
					                              $("#wed3").remove();
					                           }else{
					                              $("#wed2").attr("rowspan",'3');
					                              $("#wed2").addClass("col3");
					                              $("#wed3").remove();
					                              $("#wed4").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="11") {
				                           $("#wed3").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           	   if(completePt=='2'){
					                              $("#wed3").attr("rowspan",'2');
					                              $("#wed3").addClass("col2");
					                              $("#wed4").remove();
					                           }else{
					                              $("#wed3").attr("rowspan",'3');
					                              $("#wed3").addClass("col3");
					                              $("#wed4").remove();
					                              $("#wed5").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="12") {
				                           $("#wed4").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           	   if(completePt=='2'){
					                              $("#wed4").attr("rowspan",'2');
					                              $("#wed4").addClass("col2");
					                              $("#wed5").remove();
					                           }else{
					                              $("#wed4").attr("rowspan",'3');
					                              $("#wed4").addClass("col3");
					                              $("#wed5").remove();
					                              $("#wed6").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="13") {
				                           $("#wed5").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           	   if(completePt=='2'){
					                              $("#wed5").attr("rowspan",'2');
					                              $("#wed5").addClass("col2");
					                              $("#wed6").remove();
					                           }else{
					                              $("#wed5").attr("rowspan",'3');
					                              $("#wed5").addClass("col3");
					                              $("#wed6").remove();
					                              $("#wed7").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="14") {
				                           $("#wed6").html(subName+"<br><br>("+subRoom+", "+profName+")");
					                           if(completePt=='2'){
					                              $("#wed6").attr("rowspan",'2');
					                              $("#wed6").addClass("col2");
					                              $("#wed7").remove();
					                           }else{
					                              $("#wed6").attr("rowspan",'3');
					                              $("#wed6").addClass("col3");
					                              $("#wed7").remove();
					                              $("#wed8").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="15") {
				                           $("#wed7").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           	   if(completePt=='2'){
					                              $("#wed7").attr("rowspan",'2');
					                              $("#wed7").addClass("col2");
					                              $("#wed8").remove();
					                           }else{
					                              $("#wed7").attr("rowspan",'3');
					                              $("#wed7").addClass("col3");
					                              $("#wed8").remove();
					                              $("#wed9").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="16") {
				                           $("#tue8").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                               if(completePt=='2'){
					                              $("#wed8").attr("rowspan",'2');
					                              $("#wed8").addClass("col2");
					                              $("#wed9").remove();
					                           }else{
					                              $("#wed8").attr("rowspan",'3');
					                              $("#wed8").addClass("col3");
					                              $("#wed9").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="17") {
				                           $("#wed9").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                               if(completePt=='2'){
					                              $("#wed9").attr("rowspan",'2');
					                              $("#wed9").addClass("col2");
					                           }else{
					                              $("#wed9").attr("rowspan",'3');
					                              $("#wed9").addClass("col3");
					                           }
				                        }
				                     }
			                     
			                     if(subDate=='목') {
				                        if(subTime.substr(0,2)=="09") {
				                           $("#thu1").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           if(completePt=='2'){
					                              $("#thu1").attr("rowspan",'2');
					                              $("#thu1").addClass("col2");
					                              $("#thu2").remove();
					                           }else{
					                              $("#thu1").attr("rowspan",'3');
					                              $("#thu1").addClass("col3");
					                              $("#thu2").remove();
					                              $("#thu3").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="10") {
				                           $("#thu2").html(subName+"<br><br>("+subRoom+", "+profName+")");
					                           if(completePt=='2'){
					                              $("#thu2").attr("rowspan",'2');
					                              $("#thu2").addClass("col2");
					                              $("#thu3").remove();
					                           }else{
					                              $("#thu2").attr("rowspan",'3');
					                              $("#thu2").addClass("col3");
					                              $("#thu3").remove();
					                              $("#thu4").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="11") {
				                           $("#thu3").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           	   if(completePt=='2'){
					                              $("#thu3").attr("rowspan",'2');
					                              $("#thu3").addClass("col2");
					                              $("#thu4").remove();
					                           }else{
					                              $("#thu3").attr("rowspan",'3');
					                              $("#thu3").addClass("col3");
					                              $("#thu4").remove();
					                              $("#thu5").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="12") {
				                           $("#thu4").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           	   if(completePt=='2'){
					                              $("#thu4").attr("rowspan",'2');
					                              $("#thu4").addClass("col2");
					                              $("#thu5").remove();
					                           }else{
					                              $("#thu4").attr("rowspan",'3');
					                              $("#thu4").addClass("col3");
					                              $("#thu5").remove();
					                              $("#thu6").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="13") {
				                           $("#thu5").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           	   if(completePt=='2'){
					                              $("#thu5").attr("rowspan",'2');
					                              $("#thu5").addClass("col2");
					                              $("#thu6").remove();
					                           }else{
					                              $("#thu5").attr("rowspan",'3');
					                              $("#thu5").addClass("col3");
					                              $("#thu6").remove();
					                              $("#thu7").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="14") {
				                           $("#thu6").html(subName+"<br><br>("+subRoom+", "+profName+")");
					                           if(completePt=='2'){
					                              $("#thu6").attr("rowspan",'2');
					                              $("#thu6").addClass("col2");
					                              $("#thu7").remove();
					                           }else{
					                              $("#thu6").attr("rowspan",'3');
					                              $("#thu6").addClass("col3");
					                              $("#thu7").remove();
					                              $("#thu8").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="15") {
				                           $("#thu7").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           	   if(completePt=='2'){
					                              $("#thu7").attr("rowspan",'2');
					                              $("#thu7").addClass("col2");
					                              $("#thu8").remove();
					                           }else{
					                              $("#thu7").attr("rowspan",'3');
					                              $("#thu7").addClass("col3");
					                              $("#thu8").remove();
					                              $("#thu9").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="16") {
				                           $("#tue8").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                               if(completePt=='2'){
					                              $("#thu8").attr("rowspan",'2');
					                              $("#thu8").addClass("col2");
					                              $("#thu9").remove();
					                           }else{
					                              $("#thu8").attr("rowspan",'3');
					                              $("#thu8").addClass("col3");
					                              $("#thu9").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="17") {
				                           $("#thu9").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                               if(completePt=='2'){
					                              $("#thu9").attr("rowspan",'2');
					                              $("#thu9").addClass("col2");
					                           }else{
					                              $("#thu9").attr("rowspan",'3');
					                              $("#thu9").addClass("col3");
					                           }
				                        }
				                     }
			                     
			                     if(subDate=='금') {
				                        if(subTime.substr(0,2)=="09") {
				                           $("#fri1").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           if(completePt=='2'){
					                              $("#fri1").attr("rowspan",'2');
					                              $("#fri1").addClass("col2");
					                              $("#fri2").remove();
					                           }else{
					                              $("#fri1").attr("rowspan",'3');
					                              $("#fri1").addClass("col3");
					                              $("#fri2").remove();
					                              $("#fri3").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="10") {
				                           $("#fri2").html(subName+"<br><br>("+subRoom+", "+profName+")");
					                           if(completePt=='2'){
					                              $("#fri2").attr("rowspan",'2');
					                              $("#fri2").addClass("col2");
					                              $("#fri3").remove();
					                           }else{
					                              $("#fri2").attr("rowspan",'3');
					                              $("#fri2").addClass("col3");
					                              $("#fri3").remove();
					                              $("#fri4").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="11") {
				                           $("#fri3").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           	   if(completePt=='2'){
					                              $("#fri3").attr("rowspan",'2');
					                              $("#fri3").addClass("col2");
					                              $("#fri4").remove();
					                           }else{
					                              $("#fri3").attr("rowspan",'3');
					                              $("#fri3").addClass("col3");
					                              $("#fri4").remove();
					                              $("#fri5").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="12") {
				                           $("#fri4").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           	   if(completePt=='2'){
					                              $("#fri4").attr("rowspan",'2');
					                              $("#fri4").addClass("col2");
					                              $("#fri5").remove();
					                           }else{
					                              $("#fri4").attr("rowspan",'3');
					                              $("#fri4").addClass("col3");
					                              $("#fri5").remove();
					                              $("#fri6").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="13") {
				                           $("#fri5").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           	   if(completePt=='2'){
					                              $("#fri5").attr("rowspan",'2');
					                              $("#fri5").addClass("col2");
					                              $("#fri6").remove();
					                           }else{
					                              $("#fri5").attr("rowspan",'3');
					                              $("#fri5").addClass("col3");
					                              $("#fri6").remove();
					                              $("#fri7").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="14") {
				                           $("#fri6").html(subName+"<br><br>("+subRoom+", "+profName+")");
					                           if(completePt=='2'){
					                              $("#fri6").attr("rowspan",'2');
					                              $("#fri6").addClass("col2");
					                              $("#fri7").remove();
					                           }else{
					                              $("#fri6").attr("rowspan",'3');
					                              $("#fri6").addClass("col3");
					                              $("#fri7").remove();
					                              $("#fri8").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="15") {
				                           $("#fri7").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                           	   if(completePt=='2'){
					                              $("#fri7").attr("rowspan",'2');
					                              $("#fri7").addClass("col2");
					                              $("#fri8").remove();
					                           }else{
					                              $("#fri7").attr("rowspan",'3');
					                              $("#fri7").addClass("col3");
					                              $("#fri8").remove();
					                              $("#fri9").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="16") {
				                           $("#tue8").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                               if(completePt=='2'){
					                              $("#fri8").attr("rowspan",'2');
					                              $("#fri8").addClass("col2");
					                              $("#fri9").remove();
					                           }else{
					                              $("#fri8").attr("rowspan",'3');
					                              $("#fri8").addClass("col3");
					                              $("#fri9").remove();
					                           }
				                        }
				                        if(subTime.substr(0,2)=="17") {
				                           $("#fri9").html(subName+"<br><br>("+subRoom+", "+profName+")");
				                               if(completePt=='2'){
					                              $("#fri9").attr("rowspan",'2');
					                              $("#fri9").addClass("col2");
					                           }else{
					                              $("#fri9").attr("rowspan",'3');
					                              $("#fri9").addClass("col3");
					                           }
				                        }
				                     }
								
						})
						}
					}
				});
			});
			
			window.onload = function (){
			  	  appendYear();
			    }
				
				
				function appendYear(){
					var date = new Date();
					var year = date.getFullYear();
					var selectValue = document.getElementById("year");
					var optionIndex = 0;
			
					for(var i=year;i<=year+5;i++){
							selectValue.add(new Option(i,i),optionIndex++);
					}
				}
				
			$(function(){
	        	$("#roomTitle").change(function(){
	        		$.ajax({
	        			url:"${path}/selectRoom.hd",
	        			data:{"roomValue":$("#roomTitle").val()},
	        			success:function(data){
	        				let rooms=JSON.parse(data);
	        				let roomTitle = "<option value='select' id='selectDepartment'>강의실 선택</option>";
	        				for(let i = 0; i < rooms.length; i++) {
	        				roomTitle += "<option value='"+rooms[i]['SUB_ROOM']+"' id='selectRoom'>"+rooms[i]['SUB_ROOM']+"</option>";
	        				}
	        			
	        				$('#classRoom').html(roomTitle);
							$('#classRoom').change(function(){
								$("#selectDepartment").attr('disabled',true);
							});
	        			}
		            });
		        });
	        });
			
			$("#roomTitle").change(function(){
				$("#roomTitlec").attr('disabled',true);
			 });
			
			</script>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>
