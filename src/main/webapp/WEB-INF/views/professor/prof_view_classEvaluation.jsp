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
						<h4 class="font-weight-bold mb-0">강의평가조회</h4>
					</div>
				</div>
			</div>
		</div>
<!-- Main Content start -->	
			<div class="row">
				<div class="col-md-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-header">
							<div class="col-md-3" id="choiceYear">
								<label for="choiceClass" class="text-warning">연도선택</label> <select
									class="form-control">
									<option>2019</option>
									<option>2018</option>
									<option>2017</option>
								</select>
							</div>
						</div>
						<div class="card-body">
								<table class="table table-striped table-hover table-condensed">
									<thead class="thead-dark">
										<tr>
											<th></th>
											<th></th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
										
										</tr>
									
									</tbody>
								
								</table>
						</div>
					</div>
				</div>
			</div>




<!-- Main-content End -->			

<!-- Body section End -->	
			<jsp:include page="/WEB-INF/views/common/footer.jsp" />