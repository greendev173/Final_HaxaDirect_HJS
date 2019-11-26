<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>
<style>
	.but{
		text-align:center;
	}
	th, td{
		text-align:center;
	}
	.searchBtn{
		text-align:center;
	}
	.form-control{
		height:40px !important;
	}
	.row{
		height:65px !important;
	}
</style>
<div class="main-panel">
	<div class="content-wrapper">
		<div class="card">
                <div class="card-body">
                  <form class="form-sample" id="subForm">
                    <h4 class="card-title">커리큘럼 등록</h4>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">년도 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="year" name="subYear">
                            </select>
                          </div>
                        </div>
                      </div>
                      
                      <div class="col-md-4">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">학년 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control" name="targetGrade">
                            	<option value="1">1학년</option>
                            	<option value="2">2학년</option>
                            	<option value="3">3학년</option>
                            	<option value="4">4학년</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      
                      <div class="col-md-4">
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
                          <div class="col-sm-4">
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
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">학부 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control selectColleage">
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">학과 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control selectDepartment" name="deptCode">
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">과목 명</label>
                          <div class="col-sm-9">
                          	<select class="form-control" name="subName" id="subName">
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">강의 목표</label>
                          <div class="col-sm-9">
                          	<input type="text" class="form-control" name="targetSubject" id="targetSubject" readonly>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">이수 구분</label>
                          <div class="col-sm-9">
                            <select class="form-control" name="subType">
                            	<option value="전공필수">전공필수</option>
                            	<option value="전공선택">전공선택</option>
                            	<option value="교양필수">교양필수</option>
                            	<option value="교양선택">교양선택</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">이수 학점</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="comPt" name="completePt">
                            	<option value="2">2학점</option>
                            	<option value="3">3학점</option>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    <h4 class="card-title">강의상세 등록</h4>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">강의 요일</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="subDay" name="subDate">
                            	<option value="월">월</option>
                            	<option value="화">화</option>
                            	<option value="수">수</option>
                            	<option value="목">목</option>
                            	<option value="금">금</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-4">
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
                      <div class="col-md-4">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">강의실</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="classRoom" name="subRoom">
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                      
                    
                    
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">강의 시작시간</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="roomTime">
                            	<!-- <option id="roomTimec">시간선택</option> -->
                            	<option value="09:00" class="roomT">09:00</option>
                            	<option value="10:00" class="roomT">10:00</option>
                            	<option value="11:00" class="roomT">11:00</option>
                            	<option value="12:00" class="roomT">12:00</option>
                            	<option value="13:00" class="roomT">13:00</option>
                            	<option value="14:00" class="roomT">14:00</option>
                            	<option value="15:00" class="roomT">15:00</option>
                            	<option value="16:00" class="roomT">16:00</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">강의 종료시간</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" id="endTime" readonly>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div id="lastForm">
                    	
                    </div>
                    <div class="row">
                    	<div class="col-md-12 but">
                    		<input type="hidden" id="subTime" name="subTime"/>
	                    	<input type="submit" class="btn btn-inverse-info btn-fw" value="저장하기" id="submitBtn"/>&nbsp&nbsp&nbsp
	                    	<input type="reset" class="btn btn-inverse-info btn-fw" value="초기화"/>
	                    </div>
                    </div>
                  </form>
                </div>
              </div>
              <br/><br/>
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">커리큘럼 조회</h4>
                  <div class="row">
                      <div class="col-md-4">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">년도 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="year1" name="subYear">
                            </select>
                          </div>
                        </div>
                      </div>
                      
                      <div class="col-md-4">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">학년 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control" name="targetGrade" id="grade1">
                            	<option value="1">1학년</option>
                            	<option value="2">2학년</option>
                            	<option value="3">3학년</option>
                            	<option value="4">4학년</option>
                            </select>
                          </div>
                        </div>
                      </div>
                      
                      <div class="col-md-4">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">학기 선택</label>
                          <div class="col-sm-4">
                            <div class="form-check">
                              <label class="form-check-label">
                                <input type="radio" class="form-check-input seme" name="subSemester1" value="1">
                                1학기
                              <i class="input-helper"></i></label>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="form-check">
                              <label class="form-check-label">
                                <input type="radio" class="form-check-input seme" name="subSemester1" value="2">
                                2학기
                              <i class="input-helper"></i></label>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">학부 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control selectColleage1">
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">학과 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control selectDepartment1" name="deptCode" id="deptCode1">
                            </select>
                          </div>
                        </div>
                       </div>
                        <div class="col-md-4">
                          <div class="form-group row">
	                          <div class="col-sm-12 searchBtn">
	                            <button class="btn btn-inverse-info btn-fw btStyle" id="inquiry">조회</button>
	                          </div>
                          </div>
                      </div>
                    </div>
                    </form>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>년도</th>
                          <th>학년</th>
                          <th>학기</th>
                          <th>학과</th>
                          <th>과목명</th>
                          <th>요일</th>
                          <th>강의실</th>
                          <th>강의시간</th>
                        </tr>
                      </thead>
                      <tbody id="curTb">
                      	<h4 class="card-title">2019년 커리큘럼</h4>
                      	<c:forEach items="${list1 }" var="l">
	                        <tr>
	                          <td>${l.subYear }년</td>
	                          <td>${l.targetGrade }학년</td>
	                          <td>${l.subSemester }학기</td>
	                          <td>${l.deptCode }</td>
	                          <td>${l.subName }</td>
	                          <td>${l.subDate }</td>
	                          <td>${l.subRoom }</td>
	                          	<td>
	                          <c:forEach items="${l.subTime.split(',')}" var="subT" varStatus="v">
		                          	<c:if test="${v.first }">
		                          		${subT }~	
		                          	</c:if>
		                          	<c:if test="${v.last }">
		                          		<c:set var="seme" value="${subT } }" />
		                          		${fn:substring(seme,0,3)}50	
		                          	</c:if> 
	                          </c:forEach>
	                          	</td>                         
	                        </tr>
                        </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>

	<script>
	
		$("#submitBtn").click(function(){
			var a=$(".selectColleage").val();
			var b=$(".selectDepartment").val();
			var c=$("#targetSubject").val();
			var d=$("#roomTitle").val();
			var e=$("#classRoom").val();
			var f=$("#endTime").val();
			
			if(a==null || b==null || c==null || d==null || e==null || f==null){
				alert("빈칸없이 작성해주세요.");
			}else{
				var rt=$("#roomTime").val();
				var cp=$("#comPt").val();
				var intrt=parseInt(rt);
				
				if(cp==3){
					$("#subTime").val(rt+","+(intrt+1)+":00,"+(intrt+2)+":00");
				}
				else if(cp==2){
					$("#subTime").val(rt+","+(intrt+1)+":00");
				}
				
				$("#subForm").attr("action","${path }/subInsert.hd");
				
			}
			
		});
	
		$("#inquiry").click(function(){
			var year=$("#year1").val();
			var grade=$("#grade1").val();
			var seme=$("input:radio[name='subSemester1']:checked").val();
			var deptCode=$("#deptCode1").val();
			$.ajax({
				url:"${path}/curriSearch.hd",
				data:{"subYear":year,"targetGrade":grade,"subSemester":seme,"deptCode":deptCode},
				success:function(data){
					var re=JSON.parse(data);
					var currArr="";						
					var subT=new Array;;
					for(var i=0; i<re.length; i++){
						subT=re[i]["subTime"].split(",");
						currArr+="<tr><td>"+re[i]["subYear"]+"년</td>";
						currArr+="<td>"+re[i]["targetGrade"]+"학년</td>";
						currArr+="<td>"+re[i]["subSemester"]+"학기</td>";
						currArr+="<td>"+re[i]["deptCode"]+"</td>";
						currArr+="<td>"+re[i]["subName"]+"</td>";
						currArr+="<td>"+re[i]["subDate"]+"요일</td>";
						currArr+="<td>"+re[i]["subRoom"]+"</td>";
						currArr+="<td>"+subT[0]+"~"+subT[subT.length-1]+"</td></tr>";
					}
					if(re==""){
						currArr="<tr><td>커리큘럼 내역이 존재하지 않습니다.</td></tr>";
					}
					$("#curTb").html(currArr);
				}
			});
		});
	
		 $("#submitBtn").click(function(){
			/* var rt=$("#roomTime").val();
			var cp=$("#comPt").val();
			var intrt=parseInt(rt);
			
			if(cp==3){
				$("#subTime").val(rt+","+(intrt+1)+":00,"+(intrt+2)+":00");
			}
			else if(cp==2){
				$("#subTime").val(rt+","+(intrt+1)+":00");
			} */
			
			
		}); 
	
		window.onload = function (){
	  	  appendYear();
	    }
		
		
		function appendYear(){
			var date = new Date();
			var year = date.getFullYear();
			var selectValue = document.getElementById("year");
			var selectValue1 = document.getElementById("year1");
			var optionIndex = 0;
	
			for(var i=year;i<=year+5;i++){
					selectValue.add(new Option(i,i),optionIndex++);
					selectValue1.add(new Option(i,i),optionIndex++);
			}
		}
		 
		 $("#roomTitle").change(function(){
			$("#roomTitlec").attr('disabled',true);
		 });
		 

		 $("#comPt").change(function(){
			 timePlue();
		 });
		 
		 
		 
			 $("#roomTime").change(function(){
					/* $("#roomTimec").attr('disabled',true); */
					timePlue();
			 });
		 function timePlue(){
				var comPt=$("#comPt").val();
				var roomTime=$("#roomTime").val();

				var intcom=parseInt(comPt-1);
				var introomt=parseInt(roomTime);
				
				$("#endTime").val(intcom+introomt+":50");
				if($("#endTime").val()=="NaN:50"){
					$("#endTime").val("강의 시작시간 선택");
				}
		 }
		 
		 $(function() {
	     		$(document).ready(function(){
	     			$.ajax({
	     				type : "post",
	     				url : "${pageContext.request.contextPath}/selectColList.do",
	     				success: function(data) {
	     					let colListHtml = "";
	     					colListHtml = "<option value='select' id='selColleage'>학부 선택</option>";
	     					for(let i = 0; i < data.list.length; i++) {
	     						let cols = data.list[i];
	     						colListHtml += "<option value='"+cols['COL_CODE']+"' class='colList'>"+cols['COL_NAME']+"</option>";
	     					}
	     					
	     					$('.selectColleage').html(colListHtml);
	     						$('.selectColleage').change(function(){
	     							$("#selColleage").attr('disabled',true);
	     					});
	     				}
	     			})
	     		})
	     	});
       
        $(function(){
     	 	$('.selectColleage').change(function(){
     			$.ajax({
     				type : "post",
     				url: "${pageContext.request.contextPath}/selectDeptList.do",
     				data: {"result" : $('.selectColleage').val()},
     				success: function(data) {
     					let deptListHtml = "<option value='select' id='selectDepartment'>학과 선택</option>";
     					for(let i = 0; i < data.list.length; i++) {
     						let depts = data.list[i];
     						deptListHtml += "<option value='"+depts['DEPT_CODE']+"'  class='deptList'>"+depts['DEPT_NAME']+"</option>";
     					}
     					
     					$('.selectDepartment').html(deptListHtml);
     						$('.selectDepartment').change(function(){
     						$("#selectDepartment").attr('disabled',true);
     					
     			});
     	 	}
     	 });
     		 });
     	 });
        
        $(function() {
     		$(document).ready(function(){
     			$.ajax({
     				type : "post",
     				url : "${pageContext.request.contextPath}/selectColList.do",
     				success: function(data) {
     					let colListHtml = "";
     					colListHtml = "<option value='select' id='selColleage1'>학부 선택</option>";
     					for(let i = 0; i < data.list.length; i++) {
     						let cols = data.list[i];
     						colListHtml += "<option value='"+cols['COL_CODE']+"' class='colList'>"+cols['COL_NAME']+"</option>";
     					}
     					
     					$('.selectColleage1').html(colListHtml);
     						$('.selectColleage1').change(function(){
     							$("#selColleage1").attr('disabled',true);
     					});
     				}
     			})
     		})
     	});
   
    $(function(){
 	 	$('.selectColleage1').change(function(){
 			$.ajax({
 				type : "post",
 				url: "${pageContext.request.contextPath}/selectDeptList.do",
 				data: {"result" : $('.selectColleage1').val()},
 				success: function(data) {
 					let deptListHtml = "<option value='select' id='selectDepartment1'>학과 선택</option>";
 					for(let i = 0; i < data.list.length; i++) {
 						let depts = data.list[i];
 						deptListHtml += "<option value='"+depts['DEPT_CODE']+"'  class='deptList'>"+depts['DEPT_NAME']+"</option>";
 					}
 					
 					$('.selectDepartment1').html(deptListHtml);
 						$('.selectDepartment1').change(function(){
 						$("#selectDepartment1").attr('disabled',true);
 					
 			});
 	 	}
 	 });
 		 });
 	 }); 
        
        $(function(){
        	$(".selectDepartment").change(function(){
        		var dep=$(".selectDepartment").val();
        		$.ajax({
        			url:"${path}/selectCurri.hd",
        			data:{"deptCode":dep},
        			success:function(data){
        			var subNameArr="<option id='selectSubName'>과목명 선택</option>";
        			var subCodeArr="";
        					let re=JSON.parse(data);
        				for(let i = 0; i < re.length; i++) {
        					var dataDept=re[i];
	        				subNameArr+="<option value='"+dataDept['SUB_NAME']+"'  class='subName'>"+dataDept['SUB_NAME']+"</option>";
	        				subCodeArr="<input type='hidden' name='subCode' id='subCode' value=''>";
        				}
        				$('#subName').html(subNameArr);
    						$('#subName').change(function(){
    							$("#selectSubName").attr('disabled',true);
            				});
    					$("#lastForm").html(subCodeArr);
        			}
	        	});
	        });
        });
        
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
        

	        
	        	$("#classRoom").change(function(){
	        		roomTimeSet();
	        	});
	        	
	        	$("#subDay").change(function(){
	        		roomTimeSet();
	        	});
	        	
	        	function roomTimeSet(){
	        		 var day=$("#subDay").val();
	        		 var room=$("#classRoom").val();
	        		 var semester=$('input[name="subSemester"]:checked').val();
	        		 var year=$("#year").val();
	
	        		 $.ajax({
	        			 url:"${path}/selectTime.hd",
	        			 data:{"subYear":year,"subSemester":semester,"subDate":day,"subRoom":room},
	        			 success:function(data){
	        				 let re=JSON.parse(data);
	        				 
	        				 var arr = new Array;
	     			        $("#roomTime option").each ( function() {
	     			            arr.push ( $(this).val() );
	     			        });
	     			        
	     			        for(var i=0; i<arr.length; i++){
	     			        	var arrs=arr[i];
	     			        }
	     			        
	         				$("#roomTime option").prop("disabled", false); // 초기화
	        				 for(var i=0; i<re.length;i++){
	     			       		 var res = [];
	        					 var res=re[i]["subTime"].split(",");
	       						// roomTime 하위의 옵션 중 res에 있는것들을 disable
	        					for(var k=0; k < res.length; k++){
	          						// disable
	          						$("#roomTime option").each(function(){
	          							 if ( res[k] == $(this).val() ) {
	          								 $(this).attr("disabled", true);
	          								 var et=$("#endTime").val();
	          								 
	          							 }
	          						 });
	        					 }
	        				 }
	        			 }
	        		 });
	        	}
	      
	        
	        $("#subName").change(function(){
	        	var subName=$("#subName").val();
	        	$.ajax({
	        		url:"${path}/subTarget.hd",
	        		data:{"subName":subName},
	        		success:function(data){
	        			var re=JSON.parse(data);
	        			$("#targetSubject").val(re["targetSubject"]);
	        			$("#subCode").val(re["subCode"]);
	        		}
	        	});
	        });
	        
	        $(document).ready(function() { 
                $('input').attr('required', true); 
             });
       
        
	</script>

       





		<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>
