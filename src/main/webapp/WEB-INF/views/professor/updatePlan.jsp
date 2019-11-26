<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="{$pageContext.request.contextPath}"/>

	<jsp:include page = "/WEB-INF/views/common/header.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>

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
	<div class="col-12 grid-margin stretch-card">
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
				<form action="${pageContext.request.contextPath}/professor/updatePlanEnd?planNo=${plan.planNo}" method="post">
				
				<input type='hidden' name="profName" value="${loginMember.profName }" />
				<input type='hidden' name="planTitle" value="${plan.planSubName }" />


				
					<div class="row">
						<div class="col-9" style="text-align:left;">
							학년도 / 학기 : <input type='text' name="planYear" value="${plan.planYear }" style="width:80px;text-align:center;border:none;"  />&nbsp; / &nbsp;<input type='text' name="planSemester" value="${plan.planSemester}" style="width:50px;text-align:center;border:none;"  />
						</div>
						<div class="col-3" style="text-align:right;">
							${plan.profName } 수업계획서
						</div>
					</div>
					
					<div class="row" style="height:10px;"></div>
					
					<div class="row">
						<div class="col-6" style="text-align:left;">
							교 과 목 명 : <input name="planSubName" value="${plan.planSubName}" type='text' style="border:none;"  />
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
									<input class="col-12" name="planSubTime" value="${plan.planSubTime}" style="border:none;" type='text'  />
								</div>
							</div>
							<div class="row" style="height:60px;">
								<div class="col-12" style="text-align:left;border:1px solid black;"><br/>
									<input class="col-12" name="planSubRoom" value="${plan.planSubRoom}" style="border:none;" type='text'  />
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
									<td><br/><input type='text' name="planBookName" value="${plan.planBookName}" class='col-12' style="border:none;"  /></td>
								</tr>
							</table>
						</div>
						<div class="col-2" style="border:1px solid black;border-top:none;border-right:none;">
							<table>
								<tr>
									<td><br/><input type='text' name="planBookAuthor" value="${plan.planBookAuthor}" class='col-12' style="border:none;"  /></td>
								</tr>
							</table>
						</div>
						<div class="col-2" style="border:1px solid black;border-top:none;border-right:none;">
							<table>
								<tr>
									<td><br/><input type='text' name="planBookYear" value="${plan.planBookYear}" class='col-12' style="border:none;"  /></td>
								</tr>
							</table>
						</div>
						<div class="col-3" style="border:1px solid black;border-top:none;">
							<table>
								<tr>
									<td><br/><input type='text' name="planBookWhere" value="${plan.planBookWhere}" class='col-12' style="border:none;"  /></td>
								</tr>
							</table>
						</div>
					</div>
					
					<br/>
					
					<div class="row" style="height:60px;">
						<div class="col-2" style="border:1px solid black;text-align:center;"><br/>강좌 진행 방법</div>
						<div class="col-10" style="border:1px solid black;border-left:none;"><div style="height:5px;"></div>
							<input type='text' name="planWay" value="${plan.planWay}" class='btn btn-default col-10' style="text-align:left;"  />
						</div>
					</div>
					
					<br/>
					
					<div class="row" style="height:65px;">
						<div class="col-2" style="text-align:center;border:1px solid black;"><br/>교과목 목표</div>
						<div class="col-10" style="border:1px solid black;border-left:none;"><div style="height:10px;"></div>
							<input type='text' name="planGoal" value="${plan.planGoal}" class="btn btn-default col-10" style="text-align:left;"  />
						</div>
					</div>

					<br/>
					
					<div class="row" style="height:60px;text-align:center;border:1px solid black;">
						<div class="col-12" style="font-weight:bold;"><br/>
							수&nbsp; 업&nbsp; 내&nbsp; 용
						</div>
					</div>
					<div class="row">
						<textarea class="col-12 form-control" name="planContent" rows='40' style="border:1px solid black;border-top:none;"  >${plan.planContent}</textarea>
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
										<input type='text' name="planStatus" value="${plan.planStatus}" class='col-12' style="border:none;text-align:center;"  />
									</td>
									<td style="border:1px solid black;text-align:center;">
										<input type='text' name="planAssign" value="${plan.planAssign}" class='col-12' style="border:none;text-align:center;"  />
									</td>
									<td style="border:1px solid black;text-align:center;">
										<input type='text' name="planMterm" value="${plan.planMterm}" class='col-12' style="border:none;text-align:center;"  />
									</td>
									<td style="border:1px solid black;text-align:center;">
										<input type='text' name="planFterm" value="${plan.planFterm}" class='col-12' style="border:none;text-align:center;"  />
									</td>
								</tr>
							</table>
						</div>
					</div>

<br/><br/>

					<div class="row">
						<div class="col-4"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="col-4">
							<input id="updatePlan" class="btn btn-dark" type='submit' value=" 글 수정 "/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input id="backPlan" type='button' class="btn btn-dark" value=" 글 목록">
						</div>
						<div class="col-4"></div>
					</div>
				</form>
				
			</div>
		</div>
	</div>
</div>

<script>

$("#updatePlan").click(function(){
	if(confirm("수정하시겠습니까?")==true){
		document.from.submit();
	}else{
		return false;
	}
});

$("#backPlan").click(function(){
	history.back();
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