<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <link rel="stylesheet" href="${path }/resources/assets/css/style.css">
  <link rel="stylesheet" href="${path }/resources/css/modal.css">
  <link rel="shortcut icon" href="${path }/resources/assets/images/favicon.png" />
<script src="${path }/resources/js/jquery-3.4.1.min.js"></script>



  
<c:set var="path" value="${pageContext.request.contextPath }" />



    
<style>
.content-wrapper, .footer{
		background-color:#e9ecef !important;
	}
@import url('https://fonts.googleapis.com/css?family=Jua&display=swap');
table{
	font-size:18px;
}


.buttonFont {
	font-size:15px;
}

.btn.btn-sm, .btn-group-sm > .btn {
    font-size:15px;
}

div p {
	font-size:15px;
}
.table td {
    /* font-size: 0.875rem; */
    font-size:15px;
   
}
tr, td{
	text-align: left;
	/* font-size: 16px; */
	cursor: auto;
	border:1px solid lightgray;
	text-align:center;
	vertical-align: middle;
}

	th{
		text-align:center;
		/* font-size: 13px; */
		cursor: auto;
	border:1px solid lightgray;
		vertical-align: middle;
	}

input {
	width: 100px;
}

table {
	width: 100%;
}



.content-wrapper{
	
	padding:20px;
}

.form-control{

	width:70px;
	height:30px;
	/* font-size:13px; */
}
.main-panel{
	width:100%;
	height:100%;
}


	#Progress_Loading{
	 position: absolute;
	 left: 50%;
	 top: 50%;
	 background: #ffffff;
	  background-color: rgba( 255, 255, 255, 0.2 );
		}


</style>


<div class="main-panel">
	<div class="content-wrapper">
		<!-- 시작 -->
		<div class="row">
			<div class="col-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
					<div class="table-responsive">
						<table class="table table-default table-striped">
							
							
							    <tr >
							        <td class="thead-dark" colspan="5" style="font-family:arial">학생성적입력</th><br/>
						    	<tr>
					    
					    <tr>
							
						</tr>
							
					   
								<td rowspan="5" style="width:200px;height:200px;text-align: center;">
								<c:if test="${result.STU_IMG_RENAME eq null }">
								<image style="border-radius:0px; width:100%; height:100%;" src="${path }/resources/images/image/default.jpg"/>
							</c:if>
								<c:if test="${result.STU_IMG_RENAME ne null }">
								<image style="border-radius:0px; width:100%; height:100%;" src="${path }/resources/images/image/${result.STU_IMG_RENAME}"/>
								</c:if>
								</td>
							
							<tr style="height:30px;text-align:center;">
								<th style="width:200px;">학생이름</th>
								<th style="width:300px;">학과</th>
								<th style="width:300px;">과목</th>
								<th style="width:300px;">성별</th>
							<tr>
								<td>${result.STU_NAME}</td>
								<td>${result.DEPT_NAME}</td>
								<td>${result.SUB_NAME}</td>
								<td>${result.GENDER}</td>
							</tr>
							<tr style="height:20px;text-align:center;">
								<th>학년</th>
								<th>학적상태</th>
								<th>이메일주소</th>
								<th>연락처</th>
							<tr>
								<td>${fn:substring(result.STU_YEAR_SEM,0,1)}학년</td>
								<td>${result.REG_STATUS }</td>
								<td>${result.STU_EMAIL}</td>
								<td>${result.STU_TEL}</td>
							</tr>
					</table>
					<br>
					<br>
					<br>
					<br>
	
					<table class="table table-default table-striped">
						<tr>
						<th>과제1</th>
						<th>과제2</th>
						<th>과제3</th>
						<th>과제4</th>
						</tr>
			
				<tr>
						
					<td>
						<c:if test="${result.ASSIGN_1_1 eq '0' }">
						<input id="ASSIGN_1" value=0 disabled> 평가없음
						</c:if>
						
						<c:if test="${result.ASSIGN_1_1 > '0' or result.ASSIGN_1_1 ne null }">
						<c:if test="${result.ASSIGN_1 ne null}">
						<input id="ASSIGN_1" value="${result.ASSIGN_1}" disabled>평가완료 /배점 : ${result.ASSIGN_1_1}%
						</c:if>
						
						<c:if test="${result.ASSIGN_1 eq null}">
						<input id="ASSIGN_1" value="${result.ASSIGN_1}"> /배점 : ${result.ASSIGN_1_1}%
						<button class="btn btn-primary btn-sm buttonFont" value="ASSIGN_1,${result.SUB_SEQ},${result.STU_NO}," onclick="updatePoint(value)">입력</button>
						</c:if>
						</c:if>
					</td>
					
					
					<td>
						<c:if test="${result.ASSIGN_2_1 eq '0' }">
						<input id=ASSIGN_2 value=0 disabled>평가없음
						</c:if>
						
						<c:if test="${result.ASSIGN_2_1 > '0' or result.ASSIGN_2_1 ne null }">
						<c:if test="${result.ASSIGN_2 ne null}">
						<input id=ASSIGN_2 value="${result.ASSIGN_2}" disabled> 평가완료 /배점 : ${result.ASSIGN_2_1}%
						</c:if>
						
						<c:if test="${result.ASSIGN_2 eq null}">
						<input id=ASSIGN_2 value="${result.ASSIGN_2}"> /배점 : ${result.ASSIGN_2_1}%
						<button class="btn btn-primary btn-sm buttonFont" value="ASSIGN_2,${result.SUB_SEQ},${result.STU_NO}," onclick="updatePoint(value)">입력</button>
						</c:if>
						</c:if>
					</td>
					
					
					<td>
						<c:if test="${result.ASSIGN_3_1 eq '0' }">
						<input id=ASSIGN_3 value=0 disabled>평가없음
						</c:if>
						
						<c:if test="${result.ASSIGN_3_1 > '0' or result.ASSIGN_3_1 ne null }">
						<c:if test="${result.ASSIGN_3 ne null}">
						<input id=ASSIGN_3 value="${result.ASSIGN_3}" disabled> 평가완료 /배점 : ${result.ASSIGN_3_1}%
						</c:if>
						
						<c:if test="${result.ASSIGN_3 eq null}">
						<input id=ASSIGN_3 value="${result.ASSIGN_3}"> /배점 : ${result.ASSIGN_3_1}%
						<button class="btn btn-primary btn-sm buttonFont" value="ASSIGN_3,${result.SUB_SEQ},${result.STU_NO}," onclick="updatePoint(value)">입력</button>
						</c:if>
						</c:if>
					</td>
					
					
					<td>
						<c:if test="${result.ASSIGN_4_1 eq '0' }">
						<input id=ASSIGN_4 value=0 disabled>평가없음
						</c:if>
						
						<c:if test="${result.ASSIGN_4_1 > '0' or result.ASSIGN_4_1 ne null }">
						<c:if test="${result.ASSIGN_4 ne null}">
						<input id=ASSIGN_4 value="${result.ASSIGN_4}" disabled> 평가완료 /배점 : ${result.ASSIGN_4_1}%
						</c:if>
						
						<c:if test="${result.ASSIGN_4 eq null}">
						<input id=ASSIGN_4 value="${result.ASSIGN_4}"> /배점 : ${result.ASSIGN_4_1}%
						<button class="btn btn-primary btn-sm buttonFont" value="ASSIGN_4,${result.SUB_SEQ},${result.STU_NO}," onclick="updatePoint(value)">입력</button>
						</c:if>
						</c:if>
					</td>
						
						<tr>
						<th>중간</th>
						<th>기말</th>
						<th>출석</th>
						<th>평가학점</th>
						</tr>
					<tr>
						<td>
						<c:if test="${result.MTERM_1 eq '0' }">
						평가없음
						</c:if>
						
						<c:if test="${result.MTERM_1 > '0' or result.MTERM_1 ne null }">
						<c:if test="${result.MTERM ne null}">
						<input id=MTERM value="${result.MTERM}" disabled> 평가완료  /배점 : ${result.MTERM_1}%
						</c:if>
						
						<c:if test="${result.MTERM eq null}">
						<input id=MTERM value="${result.MTERM}"> /배점 : ${result.MTERM_1}%
						<button class="btn btn-primary btn-sm buttonFont" value="MTERM,${result.SUB_SEQ},${result.STU_NO}," onclick="updatePoint(value)">입력</button>
						</c:if>
						</c:if>
					</td>
					
					<td>
						<c:if test="${result.FTERM_1 eq '0' }">
						평가없음
						</c:if>
						
						<c:if test="${result.FTERM_1 > '0' or result.FTERM_1 ne null }">
						<c:if test="${result.FTERM ne null}">
						<input id=FTERM value="${result.FTERM}" disabled> 평가완료  /배점 : ${result.FTERM_1}%
						</c:if>
						
						<c:if test="${result.FTERM eq null}">
						<input id=FTERM value="${result.FTERM}"> /배점 : ${result.FTERM_1}%
						<button class="btn btn-primary btn-sm buttonFont" value="FTERM,${result.SUB_SEQ},${result.STU_NO}," onclick="updatePoint(value)">입력</button>
						</c:if>
						</c:if>
					</td>
					
					<td>
						<c:if test="${result.STATUS_GRADE_1 eq '0' }">
						평가없음
						</c:if>
						
						<c:if test="${result.STATUS_GRADE_1 > '0' or result.STATUS_GRADE_1 ne null }">
						<c:if test="${result.STATUS_GRADE ne null}">
						<input id=STATUS_GRADE value="${result.STATUS_GRADE}" disabled> 평가완료 / 배점 : ${result.STATUS_GRADE_1}%
						</c:if>
						
						<c:if test="${result.STATUS_GRADE eq null}">
						<input id=STATUS_GRADE value="${result.STATUS_GRADE}"> / 배점 : ${result.STATUS_GRADE_1}%
						<button class="btn btn-primary btn-sm buttonFont" value="STATUS_GRADE,${result.SUB_SEQ},${result.STU_NO}," onclick="updatePoint(value)">입력</button>
						</c:if>
						</c:if>
					</td>
					
					
					<td>
					
						<c:if test="${result.TOTAL_GRADE eq '0' or result.TOTAL_GRADE eq null}">
						<input id=TOTAL_GRADE value="${result.TOTAL_GRADE}">
						<button class="btn btn-Success btn-sm buttonFont" id="autoCacul">학점자동계산</button>
						<button class="btn btn-primary btn-sm buttonFont" value="TOTAL_GRADE,${result.SUB_SEQ},${result.STU_NO}," onclick="updatePoint(value)">입력</button>
						</c:if>
						
				
						<c:if test="${result.TOTAL_GRADE ne null}">
						<input id=TOTAL_GRADE value="${result.TOTAL_GRADE}" disabled> 평가완료 
						</c:if>
					</td>				
						</tr>
						<tr>
						<th colspan="4" style="text-align:center;font-size:30px">
						최종학점
						</th>
						</tr>
						<tr>
						<td colspan="4" style="text-align:center;">
					
					
					<c:if test="${result.TOTAL_GRADE eq null}">
					아직 평가가 끝나지않은 학생이있습니다 학생의 모든 점수가 결정된 이후 입력 가능합니다.
					</c:if>
					
					<c:if test="${result.TOTAL_GRADE ne null}">
					
					<c:if test="${totalGradeNull eq 0}">
						 ${gradeNow.ROWNUM}/${howManyStudent.COUNT} (석차/현재수강인원) 상위 백분율 ( <fmt:formatNumber pattern="###.##">${((gradeNow.ROWNUM+0.01)/(howManyStudent.COUNT+0.01))*100}</fmt:formatNumber>  %)<p style="color:red;font-size:10">상위백분율이란 현재석차/현재수강인원*100(예:50명중 1등 0% / 50명중 50등 100%)</p>
						
						<c:if test="${result.GRADE eq '0'}">
						<input id=GRADE value="${result.GRADE}">
						<button class="btn btn-primary btn-sm buttonFont" value="GRADE,${result.SUB_SEQ},${result.STU_NO}," onclick="updatePoint(value)">입력</button>
						</c:if>
				
						<c:if test="${result.GRADE ne '0'}">
						<input id=GRADE value="${result.GRADE}" disabled> 평가완료 
						</c:if>
					</c:if>
						</c:if>
					
					</td>
					</tr>
					</table>
					
					
	 <div id="pwChangeModal" class="modal">

      <div class="modal-content" style="width:900px;height:600px;">
         <p style="font-family:jua;text-align:center;font-size:30px">비밀번호가 필요한페이지 입니다</p>
         <div class="form-group">
         <hr>
      <div style="text-align:center;padding:20px;">
         <p style="font-family:jua; vertical-align:middle;padding:20px">비밀번호를 입력하세요</p>
         <input  type="password" id="pwNow" name="pwNow" style="width:200px;padding:20px" required />
         <div id="pwTrueFalse" style="height:30px;">
         <p id="pwTrue" style="font-family:jua;color:green">비밀번호가 일치합니다</p>
         <p id="pwFalse" style="font-family:jua;color:red">비밀번호가 일치하지 않습니다</p>
         </div>
         
         <button id="pwConfirm" class="btn btn-primary buttonFont" style="font-family:jua;padding:20px" disabled>확인</button>
      </div>
       	</div>
         </div>
      </div> 
					
					
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


	<div id = "Progress_Loading"><!-- 로딩바 -->
	<img id="LoadImg" height="50px" width="50px" src="${path }/resources/images/image/prograssLoading.gif"/>
</div>


 	
 	






<script>


$(document).ready(function(){
		
	   $('#Progress_Loading').hide(); //첫 시작시 로딩바를 숨겨준다.
	})
	.ajaxStart(function(){
		$('#Progress_Loading').show(); //ajax실행시 로딩바를 보여준다.
	})
	.ajaxStop(function(){
		$('#Progress_Loading').hide(); //ajax종료시 로딩바를 숨겨준다.
	});
	
//점수 0~100 유효성 검사
$("#ASSIGN_1").keyup(function(){
	
		if($("#ASSIGN_1").val()<0||$("#ASSIGN_1").val()>100){
			alert("점수는 0~100점까지만 입력가능합니다")
			$("#ASSIGN_1").val("");
			$("#ASSIGN_1").focus;
		}
}); 
$("#ASSIGN_2").keyup(function(){
	
	if($("#ASSIGN_2").val()<0||$("#ASSIGN_2").val()>100){
		alert("점수는 0~100점까지만 입력가능합니다")
		$("#ASSIGN_2").val("");
		$("#ASSIGN_2").focus;
	}
}); 

$("#ASSIGN_3").keyup(function(){
	
	if($("#ASSIGN_3").val()<0||$("#ASSIGN_3").val()>100){
		alert("점수는 0~100점까지만 입력가능합니다")
		$("#ASSIGN_3").val("");
		$("#ASSIGN_3").focus;
	}
}); 

$("#ASSIGN_4").keyup(function(){
	
	if($("#ASSIGN_4").val()<0||$("#ASSIGN_4").val()>100){
		alert("점수는 0~100점까지만 입력가능합니다")
		$("#ASSIGN_4").val("");
		$("#ASSIGN_4").focus;
	}
}); 

$("#MTERM").keyup(function(){
	
	if($("#MTERM").val()<0||$("#MTERM").val()>100){
		alert("점수는 0~100점까지만 입력가능합니다")
		$("#MTERM").val("");
		$("#MTERM").focus;
	}
}); 

$("#FTERM").keyup(function(){
	
	if($("#FTERM").val()<0||$("#FTERM").val()>100){
		alert("점수는 0~100점까지만 입력가능합니다")
		$("#FTERM").val("");
		$("#FTERM").focus;
	}
}); 

$("#STATUS_GRADE").keyup(function(){
	
	if($("#STATUS_GRADE").val()<0||$("#STATUS_GRADE").val()>100){
		alert("점수는 0~100점까지만 입력가능합니다")
		$("#STATUS_GRADE").val("");
		$("#STATUS_GRADE").focus;
	}
}); 



var viewflag="";


$("#pwTrue").hide();
$("#pwFalse").hide();

$("#closePw").click(function(){
	$("#pwNow").val("");
	$("#pwTrue").hide();
	$("#pwFalse").hide();
})


var headerModal1 = document.getElementById('pwChangeModal');

// Get the button that opens the modal
var headerBtn1 = document.getElementById("pwChange");

// Get the <span> element that closes the modal
var closePw = document.getElementById("closePw");      

// When the user clicks on the button, open the modal 






if(typeof sessionStorage.getItem('pwCheck')== 'string'){
	headerModal1.style.display = "none";
	
}else{
	headerModal1.style.display = "block";
}




function updatePoint(value){
		
	
		var asdff = value.split(",");
		var id=asdff[0];
		value+=document.getElementById(id).value;

		if (confirm("한번입력된 점수는 수정이 불가합니다 입력하시겠습니까??") == true){    //확인
			
			 	$.post({
				 
		            url: "${path}/prof/updatePoint.hd",
		            type: "post",
		            data: {"value":value},
		            success: function(data){
		            		alert("성공")
		            		location.reload();
			               

		            },
		            error: function(){
		                alert("에러발생 관리자에게 문의하세요");
		            }
		        });
			
			
		 }else{   //취소

		     return false;

		 }
		

		
}
	    // When the user clicks on <span> (x), close the modal
		$("#stuAddrDt").hide(); 
		$("#regStatus").val('${student.regStatus}');
		$("#gender").val('${student.gender}');
		$("#imgAttach").hide();
		
		
		$("#pwConfirm").click(function() {	
			if(viewflag === "true"){
          	  $("#pwTrue").show();
          	   $("#pwFalse").hide();
          	   $("#pwConfirm").attr("disabled",false);
          		headerModal1.style.display = "none";
          		alert("신원확인됐습니다")
          		$("#pwNow").val("");
          	 }else{
          	  alert("비밀번호를 확인하세요")
          	 }
		});
		


		$("#pwNow").keyup(function(){
			pwNow=$("#pwNow").val();
			if(pwNow.length>1){
			
			$.ajax({
	            url: "${path}/prof/checkInPw.hd",
	            type: "post",
	            data: {"pwNow":pwNow},
	            success: function(flag){
	            pwcheck=true;
	   			viewflag=flag;
	            	 if(flag === "true"){
	            	  $("#pwTrue").show();
	            	   $("#pwFalse").hide();
	            	   $("#pwConfirm").attr("disabled",false);
	            	   sessionStorage.setItem('pwCheck', true);
	            	 }else{
	            		 viewflag=flag;
	            	  $("#pwFalse").show(); 
	            	  $("#pwTrue").hide();
	            	  $("#pwConfirm").attr("disabled",true);
	           
	            	  

	            	 }
	            },
	            error: function(){
	                alert("관리자에게 문의바랍니다 1588-5588");
	             
	                
	            }
	        });
			}else{$("#pwTrue").hide();
			$("#pwFalse").hide();}
			
		});
		
		
		
		$("#autoCacul").click(function autoCacul(){
			
			
			
		if($("#ASSIGN_1").val()==null){
			var assign1=0;	
		}else{
			var assign1=($("#ASSIGN_1").val()*${result.ASSIGN_1_1})/100;
		}
		
		if($("#ASSIGN_2").val()==null){
			var assign2=0;	
		}else{
			var assign2=($("#ASSIGN_2").val()*${result.ASSIGN_2_1})/100;
		}
		
		if($("#ASSIGN_3").val()==null){
			var assign3=0;	
		}else{
			var assign3=($("#ASSIGN_3").val()*${result.ASSIGN_3_1})/100;
		}
		
		if($("#ASSIGN_4").val()==null){
			var assign4=0;	
		}else{
			var assign4=($("#ASSIGN_4").val()*${result.ASSIGN_4_1})/100;
		}
		
		if($("#MTERM").val()==null){
			var mterm=0;	
		}else{
			var mterm=($("#MTERM").val()*${result.MTERM_1})/100;
		}
		
		if($("#FTERM").val()==null){
			var fterm=0;	
		}else{
			var fterm=($("#FTERM").val()*${result.FTERM_1})/100;
		}
		
		if($("#STATUS_GRADE").val()==null){
			var statusgrade=0;	
		}else{
			var statusgrade=($("#STATUS_GRADE").val()*${result.STATUS_GRADE_1})/100;
		}
		
			var totalPoint=assign1+assign2+assign3+assign4+mterm+fterm+statusgrade;
			var totalgrade=totalPoint*0.045;
			
			$("#TOTAL_GRADE").val(totalgrade.toFixed(1));
			
			

		});
		
		
		
		
		
	
	


</script>




	