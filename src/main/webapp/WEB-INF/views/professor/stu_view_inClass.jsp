<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="main-panel">
	<div class="content-wrapper">
		<!-- Body section Start -->
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">수강생 조회</h4>
					</div>
				</div>
			</div>
		</div>
		<!-- Main Content start -->
		
		
		
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-header">
						<form action="${path }/prof/viewInClass.hd" method="post" id="inClassForm" class="table-responsive">
							<table class="table table-bordered table-hover " style="text-align: center;">
								<thead class="thead-dark">
									<tr>
										<th >개설년도</th>
										<th >강의명</th>
										<th >학년</th>
										<th >이름</th>
										<th >학과</th>
										<th >학번</th>
										<th >검색하기</th>
									</tr>
								</thead>

								<tbody>
									<tr><!-- 개설연도 -->
										<td><select name="subYear" class="form-control"  required>
												<option value="" selected>개설기간 선택</option>
												<c:forEach items="${preSubjectList }" var='yearList'>
												
												<option value="${yearList }">${yearList }</option>
												</c:forEach>
										</select></td>
										<!-- 강의명 -->
										<td><select name="subCode" class="form-control" required>
												<option value="" selected>강의선택</option>
												<c:forEach items="${nameCodeList }" var="ncList">
												<option value="${ncList.subCode }">${ncList.subName}</option>
												</c:forEach>
										</select></td>
										<!-- 학년 -->
								
										<td><select name="grade" class="form-control" >
												<option value="" selected>학년검색</option>
												<option value="1">1학년</option>
												<option value="2">2학년</option>
												<option value="3">3학년</option>
												<option value="4">4학년</option>
										</select></td>
										<!-- 이름 -->
										<td><input type="text" placeholder="이름검색(미입력시 전체)" class="form-control"
											value="" name="stuName" /></td>
										<!-- 학과 -->
										<td><input type="text" placeholder="학과검색" value="" class="form-control"
											name="deptName" /></td>
										<!-- 학번 -->
										<td><input type="text" placeholder="학번검색(미입력시 전체)" class="form-control"
											value="" name="stuNo" /></td>
										<td>
											<button type="submit" class="btn btn-outline-primary">검색</button>
										</td>

									</tr>

								</tbody>

							</table>
						</form>
					</div>
					<div class="card-body">
						<table class="table table-bordered table-hover"
							style="text-align: center;">
							<thead class="thead-dark">
							
							<!-- 강의 정보 변수 생성 -->
							<c:set value="${classInfo }" var="info"/>
								<tr>
									<th>
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="sizing-addon3">과목코드
												&nbsp;&nbsp;&nbsp;</span> <input type="text" class="form-control"
												aria-describedby="sizing-addon3" value='<c:if test="${info ne null }">${info.subCode }</c:if>' readonly>
										</div>
									</th>
									<th>
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="sizing-addon3">개설년도
												&nbsp;&nbsp;&nbsp;</span> <input type="text" class="form-control"
												aria-describedby="sizing-addon3" value='<c:if test="${info ne null }">${info.subYear }</c:if>' readonly>
										</div>
									</th>
									<th>
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="sizing-addon3">개설학기
												&nbsp;&nbsp;&nbsp;</span> <input type="text" class="form-control"
												aria-describedby="sizing-addon3" value='<c:if test="${info ne null }">${info.subSeme }</c:if>' readonly>
										</div>
									</th>
									<th>
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="sizing-addon3">교수이름
												&nbsp;&nbsp;&nbsp;</span> <input type="text" class="form-control"
												aria-describedby="sizing-addon3" value='<c:if test="${info ne null }">${info.profName }</c:if>' readonly>
										</div>
									</th>
									<th>
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="sizing-addon3">교수 연락처
												&nbsp;&nbsp;&nbsp;</span> <input type="text" class="form-control"
												aria-describedby="sizing-addon3" value='<c:if test="${info ne null }">${info.phone }</c:if>'
												readonly>
										</div>
									</th>
								</tr>
								<tr>
									<th>
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="sizing-addon3">강의시간
												&nbsp;&nbsp;&nbsp;</span> <input type="text" class="form-control"
												aria-describedby="sizing-addon3" value='<c:if test="${info ne null }">${info.subTime }</c:if>'
												readonly>
										</div>
									</th>
									<th>
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="sizing-addon3">강의장
												&nbsp;&nbsp;&nbsp;</span> <input type="text" class="form-control"
												aria-describedby="sizing-addon3" value='<c:if test="${info ne null }">${info.subRoom }</c:if>' readonly>
										</div>
									</th>
									<th>
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="sizing-addon3">강의요일&nbsp;&nbsp;&nbsp;</span>
											<input type="text" class="form-control"
												aria-describedby="sizing-addon3" value='<c:if test="${info ne null }">${info.subDate }</c:if>' readonly>
										</div>
									</th>
									<th>
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="sizing-addon3">교재-이름&nbsp;&nbsp;&nbsp;</span>
											<input type="text" class="form-control"
												aria-describedby="sizing-addon3" value='<c:if test="${info ne null }">${info.bookName }</c:if>' readonly>
										</div>
									</th>
									<th>
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="sizing-addon3">총원
												&nbsp;&nbsp;&nbsp;</span> <input type="text" class="form-control"
												aria-describedby="sizing-addon1" value='<c:if test="${info ne null }">${info.capacity }</c:if>' readonly>
										</div>
									</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="form-group row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<table class="table table-bordered table-hover table-responsive"
							style="text-align: center;">
							<thead class="thead-dark">
								<tr>
									<th>학번</th>
									<th>이름</th>
									<th>성별</th>
									<th>학과</th>
									<th>학년</th>
									<th>휴대폰번호</th>
									<th>메일주소</th>
									<th>주소</th>
									<th>과제A</th>
									<th>과제B</th>
									<th>과제C</th>
									<th>과제D</th>
									<th>중간고사</th>
									<th>기말고사</th>
								</tr>
							</thead>
							<tbody id="#stuListBody">
							
							<c:if test="${stuList ne null && not empty stuList}">
							<c:forEach items="${stuList }" var="stuList">
								<tr>
									<td>${stuList.stuNo }</td>
									<td>${stuList.stuName }</td>
									<td>${stuList.gender }</td>
									<td>${stuList.deptName }</td>
									<td>${stuList.grade }학년</td>
									<td>${stuList.stuTel }</td>
									<td>${stuList.stuEmail }</td>
									<td>${stuList.stuAddr }</td>
									<td>제출</td>
									<td>제출</td>
									<td>미제출</td>
									<td>미제출</td>
									<td>중간점수</td>
									<td>기말점수</td>
									<%-- <td>${stuList.assign1 }</td>
									<td>${stuList.assign2 }</td>
									<td>${stuList.assign3 }</td>
									<td>${stuList.assign4 }</td>
									<td>${stuList.mTerm }</td>
									<td>${stuList.fTerm }</td> --%>
								</tr>
							</c:forEach>
							</c:if>
							
							</tbody>
						</table>

					</div>
					<div class="card-footer">
						<c:if test="${pageBar ne null}">	
						${pageBar }
						</c:if>
					</div>
				</div>
			</div>
		</div>

		<!-- Main-content End -->

		<!-- Body section End -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />