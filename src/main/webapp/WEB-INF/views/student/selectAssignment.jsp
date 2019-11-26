<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- 달력 import start -->
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
	type="text/javascript"></script>
<!-- 달력 import end -->

<style>
	/* div {
		border: 1px solid black;
	} */
	input textarea {
		font-weight:bold;
	}
	.table td {
    	font-size: 1rem;
    	font-weight: bold;
	}
	.table th, .table td {
	    padding: 5px;
	}
	th {
		text-align:center;
	}
	.divGreen {
		 color:black; 
		 background-color:#e2dddd;
	}
	table {
		border: 2px solid #e2dddd;
	}
</style>
<div class="main-panel">
	<div class="content-wrapper">
		<!-- Body section Start -->
		<div class="row">
			<div class="col-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div id="assignmentTitle">
						<h3 class="font-weight-bold mb-0">
							<c:if test="${ar ne null}">
								<c:out value="${ar.subName }"/>&nbsp;과제 <c:out value="${ar.asgmtNo }"/>
							</c:if>
						</h3>
					</div>
				</div>
			</div>
		</div>
		<!-- Main Content start -->
		<div class="row">
			<div class="col-12 grid-margin stretch-card">
				<div class="card">
					<!-- <form class="forms"> -->
						<div class="card-body">
							<div class="row">
								<div class="col-12">
									<div class="table-responsive">
								<table class="table">
									<tr>
										<th class="divGreen">제목</th>
										<td class="divGreen"><div id="asgmtTitle">
										<c:if test="${ar ne null}">
											<c:out value="${ar.asgmtRegdTitle }"/>
										</c:if>
										</div></td>
									</tr>
									<tr>
										<th>작성자</th>
										<td>
											<div id="asgmtWriter">
												<c:if test="${ar ne null}">
													<c:out value="${ar.profName }"/> 교수
												</c:if>
											</div>
										</td>
									</tr>
									<tr>
										<th class="divGreen">작성일시</th>
										<td class="divGreen">
										<div id="writeDate">
											<c:if test="${ar ne null}">
												<fmt:formatDate value="${ar.asgmtRegdDate }" pattern="yyyy/MM/dd HH:mm:ss"/>
											</c:if>
										</div>
										</td>
									</tr>
									<tr>
										<th>첨부파일</th>
										<td>
										<div id="attachFile">
											<c:if test="${ar ne null}">
												<c:if test="${ar.asgmtRegdOrifileName ne null}">
												<i class="ti-file" style="cursor:pointer; color:#ac6969; font-weight:bold;" onclick="fileDownload('${ar.asgmtRegdOrifileName}','${ar.asgmtRegdRefileName }', '${subSeq }', '${asgmtNo }');">
												${ar.asgmtRegdOrifileName }
												</i>
												</c:if>
												<c:if test="${ar.asgmtRegdOrifileName eq null}">
													첨부파일 없음
												</c:if>
											</c:if>
										</div>
										</td>
									</tr>
								</table>
								</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12" style="height:20px;"></div>
							</div>
							<div class="form-group">
								<textarea class="form-control" id="exampleTextarea1" rows="25" style="font-weight:bold; color:black; background-color:#cef1da;" readonly><c:if test="${ar ne null}"><c:out value="${ar.asgmtRegdContent }"/></c:if></textarea>
							</div>
						</div>

						<div class="card-footer" style="text-align:center;">
							<button class="btn btn-inverse-dark btn-fw" onclick="moveBoard();">목록으로</button>
						</div>
					<!-- </form> -->
				</div>
			</div>
		</div>
	</div>

<script>
		
		function fileDownload(oName, rName, subSeq, asgmtNo)
		{
			oName=encodeURIComponent(oName);
			location.href="${path}/student/asgmtFiledownLoad.do?oName="+oName+"&rName="+rName+"&subSeq="+subSeq+"&asgmtNo="+asgmtNo+"&acaYear=${acaYear}&acaSemester=${acaSemester}&cPage=${cPage}";
		}
	
		
		function moveBoard() {
			location.href="${path}/student/classBoard.hd?subSeq=${subSeq}&cPage=${cPage}";
		}

</script>


	<!-- Main-content End -->
	<!-- Body section End -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />