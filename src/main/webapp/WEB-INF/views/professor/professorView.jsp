<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@  taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	<jsp:include page = "/WEB-INF/views/common/header.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>

<script>
	function fn_updateProf(){
		location.href="${pageContext.request.contextPath}/professor/updateProf?profId=${loginMember.profId}";
	}
	function fn_pwdUpdate(){
		location.href="${pageContext.request.contextPath}/professor/updatePwd?profId=${loginMember.profId}";
	}
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
</style>

<div class="main-panel">
	<div class="content-wrapper">
<!-- Body section Start -->	
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">교수 정보</h4>
					</div>
				</div>
			</div>
			</div>
<!-- Main Content start -->	
<div class="row">
	<div class="col-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
					<div class="row">
						<div class="col-10">
							<table class="table">
								<tr>
									<th>교번</th>
									<td><c:out value="${loginMember.profId }"/></td>
								</tr>
								<tr>
									<th>이름</th>
									<td><c:out value="${loginMember.profName }"/></td>
								</tr>
								<tr>
									<th>입사일</th>
									<td><fmt:formatDate value="${loginMember.profEnroll }" pattern="yyyy년 MM월 dd일"/></td>
								</tr>
								<tr>
									<th>주민번호</th>
									<td>
										
										<c:out value="${fn:substring(jumin,0,6) }"/> - <c:out value="${fn:substring(jumin,6,14) }"/>
										
									</td>
								</tr>
								<tr>
									<th>학과명 [학과번호]</th>
									<td>${deptName } [<c:out value="${loginMember.deptCode }"/>]</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><c:out value="${loginMember.email }"/></td>
								</tr>
								<tr>	
									<th>전화번호</th>
									<td><c:out value="${loginMember.phone }"/></td>
								</tr>
								<tr>	
									<th>주소</th>
									<td><c:out value="${loginMember.address }"/></td>
								</tr>
								<tr>	
									<th>성별</th>
									<td><c:out value="${loginMember.gender }"/></td>
								</tr>
								<%-- <tr>
									<th>주/야</th>
									<td><c:out value=""/></td>
								</tr> --%>
							</table>
							<div class="row"  style="height:100px;"></div>
							<div class="row">
								<div class="col-4"></div>
								<div class="col-6" style="text-align:center;">
									<button style="border:1px solid lightgray;" class="btn btn-dark" onclick="fn_updateProf();">
									정보수정
									</button>
									&nbsp;
									<button style="border:1px solid lightgray;" class="btn btn-dark" onclick="fn_pwdUpdate();">
									비밀번호 변경
									</button>
								</div>
								<div class="col-2"></div>
							</div>
						</div>
						<div class="col-2">
							<div class="gap2">
								<img style="height:100%;width:100%;border:6px solid snow;" src="data:image/jpeg;base64,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"/>
							</div>
							<div class="gap0" style="font-weight:bold;text-align:center;"></div>
							
							<div style="border-bottom:1px solid black;height:2px;"></div>
							<div style="border-bottom:1px solid black;height:2px;"></div>
														
							<div style="text-align:center;font-weight:bold;border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">개설한 강의</div>
							<div style="border-bottom:1px solid black;height:2px;"></div>

							<br/>
							
							<div style="font-weight:bold;text-align:center;">
								<c:forEach items="${prof }" var="p" varStatus="v">
									<div style="border-bottom:1px solid lightgray;"><span style="color:royalblue;">${v.count}번째 - ${p.subCode }</span><br><span style="font-size:13px;">[${p.subName}]<br>(${p.subDate},${p.subTime})</span></div><br/>
								</c:forEach>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>