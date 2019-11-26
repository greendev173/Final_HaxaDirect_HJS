<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>



		<div class="main-panel">
   		<div class="content-wrapper">
<div class="container-fluid">
<div class="row">
	<div class="card">
		<div ckass="card-body">
			<div class="col-sm-12">
					<div class="table-responsive">
			<table class="table">
				<tr>
					<th>번호</th>
					<th>학생 이름</th>
					<th>모집 구분</th>
					<th>전화 번호</th>
					<th>이메일</th>
					<th> 주소</th>
					<th>학부 명</th>
					<th>학과 명</th>
					
				</tr>
				<c:forEach var="stu" items="${list}" varStatus="v">
					<tr class="${stu.beforeStu}">
					<td>${v.index +1}</td>
					<td>${stu.beforeName }</td>
					<td>${stu.beforeType }</td>
					<td>${stu.beforePhone }</td>
					<td>${stu.beforeEmail }</td>
					<td>${stu.beforeAddr }</td>
					<td>${stu.beforeColName }</td>
					<td>${stu.beforeDeptName }</td>
					<td>
					<input type="button" class="btn btn-outline-success btn-fw" onclick="insertNewStu(${stu.beforeStu});" value="승인"/>
<%-- 					<input type="button" class="btn btn-outline-danger btn-fw" onclick="deleteBeforeStu(${stu.beforeStu});" value="거절"/> --%>	
					</td>					
				</tr>
				</c:forEach>
			</table>
			</div>
		</div>
	</div>
	</div>
</div>
</div>

<script>

function insertNewStu(result) {
	$.ajax({
		type : 'post',
		url: "${pageContext.request.contextPath}/insertNewStu.do",
		data : {"beforeStu" : result},
		success : function(data) {
			location.href="${path}/enrollStudent.hd";
		}

	});
}


function deleteBeforeStu() {

}

</script>
	
	
</script>

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
	/* div{
		border:0.3px solid coral;
	} */
</style>

	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>