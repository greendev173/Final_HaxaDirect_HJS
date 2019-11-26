<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="main-panel">
	<div class="content-wrapper">
		<!-- Body section Start -->
		<!-- Main Content start -->
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<table class="table table-bordered table-hover table-condensed"
							style="text-align: center;">
							<thead class="thead-dark">
								<tr>
									<th>
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="sizing-addon3">대학명
												&nbsp;&nbsp;&nbsp;</span> <input type="text" class="form-control"
												aria-describedby="sizing-addon3" value="인문대학" readonly>
										</div>
									</th>
									<th>
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="sizing-addon3">학과명
												&nbsp;&nbsp;&nbsp;</span> <input type="text" class="form-control"
												aria-describedby="sizing-addon3" value="철학과" readonly>
										</div>
									</th>
									<th>
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="sizing-addon3">학과생
												총원 &nbsp;&nbsp;&nbsp;</span> <input type="text"
												class="form-control" aria-describedby="sizing-addon3"
												value="486명" readonly>
										</div>
									</th>
									<th>
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="sizing-addon3">학과
												사무실위치 &nbsp;&nbsp;&nbsp;</span> <input type="text"
												class="form-control" aria-describedby="sizing-addon3"
												value="A-108" readonly>
										</div>
									</th>
									<th>
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="sizing-addon3">교직원
												총원&nbsp;&nbsp;&nbsp;</span> <input type="text" class="form-control"
												aria-describedby="sizing-addon3" value="49명" readonly>
										</div>
									</th>
									<th>
										<div class="input-group input-group-sm">
											<span class="input-group-addon" id="sizing-addon3">사무실
												번호 &nbsp;&nbsp;&nbsp;</span> <input type="text"
												class="form-control" aria-describedby="sizing-addon3"
												value="02-850-2884" readonly>
										</div>
									</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<h3>검색 입력</h3>
						<form action="${path }/prof/viewInMajor.hd" method="post">
							<table class="table table-bordered table-hover col-md-6 table-condensed">
								<thead class="thead-dark">
									<tr>
										<th>학번</th>
										<th>이름</th>
										<th>학년</th>
										<th>학적상태</th>
										<th>검색하기</th>
									</tr>
								</thead>
								<tbody>

									<tr> 
										<td><input type="text" placeholder="학번검색" value="" class="form-control"
											name="stuNo"></td>
										<td><input type="text" placeholder="이름검색" value="" class="form-control"
											name="stuName"></td>
										<td><select name="grade" class="form-control">
												<option value="" selected>학년검색</option>
												<option value="1">1학년</option>
												<option value="2">2학년</option>
												<option value="3">3학년</option>
												<option value="4">4학년</option>
										</select></td>
										<td><select name="regStatus" class="form-control">
												<option value="" selected>학적구분</option>
												<option value="1">재학</option>
												<option value="2">휴학</option>
												<option value="3">재적</option>
												<option value="4">졸업</option>
												<option value="4">중퇴</option>
										</select></td>
										<td><input type="submit" value="검색" class="form-control btn btn-warning"></td>

									</tr>

								</tbody>

							</table>
						</form>
					</div>


				</div>




			</div>
		</div>

		<div class="row">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-header">
						<h4>학생정보</h4>
					</div>
					<div class="card-body">
						<div class="row col-md-12">
							<!-- 학생 정보 출력 테이블 시작 -->
							<table class="table table-bordered table-hover table-condensed"
								style="text-align: center;">
								<thead class="thead-dark">
									<tr>
										<th>학번</th>
										<th>이름</th>
										<th>성별</th>
										<th>학년</th>
										<th>휴대폰번호</th>
										<th>메일주소</th>
										<th>주소</th>
										<th>학적상태</th>
										<th>상세정보조회</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${list }" var='l'>
									<tr>
										<td>${l.stuNo }</td>
										<td>${l.stuName }</td>
										<td>${l.gender }</td>
										<td>
										<c:set var="grade2" value="${l.stuYearSem }"/>
										${fn:substring(grade2,0,1) }학년
										</td>
										<td>${l.stuTel }</td>
										<td>${l.stuEmail }</td>
										<td>${l.stuAddr }</td>
										<td>${l.regStatus }</td>
										<td><button type="button" class="btn btn-primary" onclick="#">조회</button>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer">
						${pageBar }
						<!-- <ul class="pagination" style="justify-content: center;">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul> -->
					</div>
				</div>

			</div>
		</div>



		<!-- Main-content End -->

		<!-- Body section End -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />