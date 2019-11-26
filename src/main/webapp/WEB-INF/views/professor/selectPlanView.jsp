<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="{$pageContext.request.contextPath}"/>

	<jsp:include page = "/WEB-INF/views/common/header.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"> <!-- 구글 i태그 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" /> <!-- 폰트어썸 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script> <!-- jsPDF -->
<script src="${pageContext.request.contextPath }/resources/js/html2canvas.js"></script> <!-- html2canvas -->

<div class="main-panel">
	<div class="content-wrapper">
<!-- Body section Start -->	
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
				</div>
			</div>
			</div>
<!-- Main Content start -->	

<div class="row">
<div class="col-10"></div>
<div class="col-2">
	<i class="material-icons"><input type='button' style="border:0;background-color:rgba(255,255,255,0.3);" id="pdfschedule" value="picture_as_pdf"/></i>
	<i class="material-icons"><input type='button' style="border:0;background-color:rgba(255,255,255,0.3);" value='print' onclick='printSchedule();'></i>
</div>
</div>

<div class="row">
	<div id="printme" class="col-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body" style="margin:30px;">
				<!-- <div class="row"><p style="font-size:25px;">글작성</p></div> -->
				
				<div class="col-12">
				<div class="row" style="height:50px;"></div>
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4" style="text-align:center;"><h3 style="border-bottom:2px solid black;">강&nbsp; 의&nbsp; 계&nbsp; 획&nbsp; 서</h3></div>
						<div class="col-4"></div>
					</div>
				</div>
				
				<br/><br/>
				
				
				<input type='hidden' name="profName" value="${loginMember.profName }" />
				<input type='hidden' name="planTitle" />
				<input type='hidden' name="planNo" value="${plan.planNo }"/>
				
					<div class="row">
						<div class="col-9" style="text-align:left;">
							학년도 / 학기 : <input type='text' name="planYear" value="${plan.planYear }년도" style="width:80px;text-align:center;border:none;" readonly/>&nbsp; / &nbsp;<input type='text' name="planSemester" value="${plan.planSemester}학기" style="width:50px;text-align:center;border:none;" readonly/>
						</div>
						<div class="col-3" style="text-align:right;">
							${plan.profName } 수업계획서
						</div>
					</div>
					
					<div class="row" style="height:10px;"></div>
					
					<div class="row">
						<div class="col-6" style="text-align:left;">
							교 과 목 명 : <input name="planSubName" value="${plan.planSubName}" type='text' style="border:none;" readonly/>
						</div>
						<!-- <div class="col-6" style="text-align:right;">
							교 과 목 명 : 국어국문
						</div> -->
					</div>
					<br/>
					<div class="row" style="height:120px;">
						<div class="col-2" style="text-align:center;border:1px solid black;">
						<div style="height:50px;"></div>수업 진행 정보
						</div>
						
						<div class="col-2">
							<div class="row" style="height:60px;">
								<div class="col-12" style="text-align:center;border-top:1px solid black;"><br/>수업시간</div>
							</div>
							<div class="row" style="height:60px;">
								<div class="col-12" style="text-align:center;border-top:1px solid black;border-bottom:1px solid black;"><br/>강의실</div>
							</div>
						</div>
						
						<div class="col-8">
							<div class="row" style="height:60px;">
								<div class="col-12" style="text-align:left;border:1px solid black;border-bottom:none;"><br/>
									<input class="col-12" name="planSubTime" value="${plan.planSubTime}" style="border:none;" type='text' readonly/>
								</div>
							</div>
							<div class="row" style="height:60px;">
								<div class="col-12" style="text-align:left;border:1px solid black;"><br/>
									<input class="col-12" name="planSubRoom" value="${plan.planSubRoom}" style="border:none;" type='text' readonly/>
								</div>
							</div>
						</div>
						
					</div>
					
					<br/>
					
					<div class="row"  style="height:40px;text-align:center;">
						<div class="col-12" style="border:1px solid black;border-bottom:none;font-weight:lightbold;font-size:25px;">교재</div>
					</div>
					<div class="row" style="text-align:center;">
						<div class="col-2" style="border:1px solid black;border-right:none;">
							<table>
								<tr>
									<th>구분</th>
								</tr>
							</table>
						</div>
						<div class="col-3" style="text-align:center;border:1px solid black;border-right:none;">
							<table>
								<tr>
									<th>제목</th>
								</tr>
							</table>
						</div>
						<div class="col-2" style="border:1px solid black;border-right:none;">
							<table>
								<tr>
									<th>저자</th>
								</tr>
							</table>
						</div>
						<div class="col-2" style="border:1px solid black;border-right:none;">
							<table>
								<tr>
									<th>발행년도</th>
								</tr>
							</table>
						</div>
						<div class="col-3" style="border:1px solid black;">
							<table>
								<tr>
									<th>출판사</th>
								</tr>
							</table>
						</div>
					</div>
					
					
					<div class="row" style="height:63px;">
						<div class="col-2" style="border:1px solid black;border-top:none;border-right:none;">
							<table>
								<tr>
									<th><br/>교재</th>
								</tr>
							</table>
						</div>
						<div class="col-3" style="border:1px solid black;border-top:none;border-right:none;">
							<table>
								<tr>
									<td><br/><input type='text' name="planBookName" value="${plan.planBookName}" class='col-12' style="border:none;" readonly/></td>
								</tr>
							</table>
						</div>
						<div class="col-2" style="border:1px solid black;border-top:none;border-right:none;">
							<table>
								<tr>
									<td><br/><input type='text' name="planBookAuthor" value="${plan.planBookAuthor}" class='col-12' style="border:none;" readonly/></td>
								</tr>
							</table>
						</div>
						<div class="col-2" style="border:1px solid black;border-top:none;border-right:none;">
							<table>
								<tr>
									<td><br/><input type='text' name="planBookYear" value="${plan.planBookYear}" class='col-12' style="border:none;" readonly/></td>
								</tr>
							</table>
						</div>
						<div class="col-3" style="border:1px solid black;border-top:none;">
							<table>
								<tr>
									<td><br/><input type='text' name="planBookWhere" value="${plan.planBookWhere}" class='col-12' style="border:none;" readonly/></td>
								</tr>
							</table>
						</div>
					</div>
					
					<br/>
					
					<div class="row" style="height:60px;">
						<div class="col-2" style="border:1px solid black;text-align:center;"><br/>강좌 진행 방법</div>
						<div class="col-10" style="border:1px solid black;border-left:none;"><div style="height:5px;"></div>
							<input type='text' name="planWay" value="${plan.planWay}" class='btn btn-default col-10' style="text-align:left;" readonly/>
						</div>
					</div>
					
					<br/>
					
					<div class="row" style="height:65px;">
						<div class="col-2" style="text-align:center;border:1px solid black;"><br/>교과목 목표</div>
						<div class="col-10" style="border:1px solid black;border-left:none;"><div style="height:10px;"></div>
							<input type='text' name="planGoal" value="${plan.planGoal}" class="btn btn-default col-10" style="text-align:left;" readonly/>
						</div>
					</div>

					<br/>
					
					<div class="row" style="height:60px;text-align:center;border:1px solid black;">
						<div class="col-12" style="font-weight:bold;"><br/>
							수&nbsp; 업&nbsp; 내&nbsp; 용
						</div>
					</div>
					<div class="row">
						<textarea class="col-12 form-control" name="planContent" rows='40' style="border:1px solid black;border-top:none;" readonly>${plan.planContent}</textarea>
					</div>
					
					<br/>
					<br/>
					
					<div class="row" style="height:80px;">
						<div class="col-12">
							<table class="col-12" style="text-align:left;margin:auto;border:1px solid black;height:40px;">
								<tr style="border:1px solid black;">
									<th style="width:100px;border:1px solid black;text-align:center;border-bottom:none;">평가방식</th>
									<td style="border:1px solid black;text-align:center;">출석</td>
									<td style="border:1px solid black;text-align:center;">과제</td>
									<td style="border:1px solid black;text-align:center;">중간</td>
									<td style="border:1px solid black;text-align:center;">기말</td>
								</tr>
							</table>
							
							<table class="col-12" style="text-align:left;margin:auto;border:1px solid black;height:40px;">
								<tr>
									<th style="width:100px;border:1px solid black;text-align:center;">비율</th>
									<td style="border:1px solid black;text-align:center;">
										<input type='text' name="planStatus" value="${plan.planStatus}" class='col-12' style="border:none;text-align:center;" readonly/>
									</td>
									<td style="border:1px solid black;text-align:center;">
										<input type='text' name="planAssign" value="${plan.planAssign}" class='col-12' style="border:none;text-align:center;" readonly/>
									</td>
									<td style="border:1px solid black;text-align:center;">
										<input type='text' name="planMterm" value="${plan.planMterm}" class='col-12' style="border:none;text-align:center;" readonly/>
									</td>
									<td style="border:1px solid black;text-align:center;">
										<input type='text' name="planFterm" value="${plan.planFterm}" class='col-12' style="border:none;text-align:center;" readonly/>
									</td>
								</tr>
							</table>
						</div>
					</div>

<br/><br/>

					<div class="row">
						<div class="col-4"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${loginMember.profId != null && loginMember.profName==plan.profName}">
						<div class="col-4">
							<input id="updatePlan" class="btn btn-dark" type='button' value=" 글 수정 "/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input id="deletePlan" type='button' id="boardView" class="btn btn-dark" value=" 글 삭제">
						</div>
						</c:if>
						<div class="col-4"></div>
					</div>
				
				
			</div>
		</div>
	</div>
</div>

<script>

//프린트 버튼
function printSchedule(){
	var printme = document.getElementById("printme");
	var pt=window.open('','Print-Window');
	pt.document.open();
	pt.document.write('<html>'
			+'<head>'
			+'<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">'
			+'</head>'
			+'<body onload="window.print()">'
			+printme.innerHTML
			+'</body></html>');
	pt.document.body.innerHTML+='<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js">'+'</'+'script>';
	pt.document.body.innerHTML+='<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js">'+'</'+'script>';
	pt.document.body.innerHTML+='<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js">'+'</'+'script>';
	pt.document.close();
	pt.location.reload();
	pt.print();
	pt.close();
}


//PDF로 저장
$('#pdfschedule').click((e) => {
	html2canvas(document.querySelector("#printme")).then(canvas => { // jsPDF 객체 생성 생성자에는 가로, 세로 설정, 페이지 크기 등등 설정할 수 있다.
		// 현재 파라미터는 기본값이다 굳이 쓰지 않아도 되는데 저것이 기본값이라고 보여준다.
		var imgData = canvas.toDataURL('image/png'); //이미지 코드뽑기
		var imgWidth = 210; //이미지 width값 설정
		var pageHeight = 295; // 페이지 height값 설정
		var imgHeight = canvas.height * imgWidth / canvas.width; //이미지 height값 설정
		var heightLeft = imgHeight;
		var doc = new jsPDF('p', 'mm');
		var position = 0;
		doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
		heightLeft -= pageHeight;
		while (heightLeft >= 0) {
			position = heightLeft - imgHeight; doc.addPage();
			doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
			heightLeft -= pageHeight; 
		}
		doc.save('강의 시간표.pdf');

	});
});


$("#updatePlan").click(function(){
	location.href="${pageContext.request.contextPath}/professor/updatePlan?planNo=${plan.planNo}";
});

$("#deletePlan").click(function(){
	if(confirm("삭제하시겠습니까?")==true){
		location.href="${pageContext.request.contextPath}/professor/deletePlan?planNo=${plan.planNo}";
	}else{
		return false;
	}
});

</script>

<style>
	table{
		margin:auto;
		text-align:center;
	}
/* 	div{
		border:1px solid coral;
	}
 */
	.spacing{
		border-spacing:4px;
	    border-collapse: separate;
	}
</style>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>