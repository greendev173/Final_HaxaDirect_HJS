<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<style>
#choiceClass select, #choiceYear select, #choiceSeme select {
	color: black;
}
</style>

<div class="main-panel">
	<div class="content-wrapper">
	
		<!-- Body section Start -->
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">공지 게시판</h4>
					</div>
				</div>
			</div>
		</div>
		<!-- Main Content start -->
		
		<div class="row" style="text-align : center;">
			<div class="col-md-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-header">
	    <form id="noticeForm" name="noticeForm" method="post">
	        <table class="table table-striped table-hover table-sm">
	            <thead>
	                <tr>
	                    <th style="width : 16.66%;">번호</th>
	                    <th style="width : 50%;">제목</th>
	                    <th style="width : 25%;">날짜</th>
	                    <th style="width : 8.33%;">조회수</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach var="l" items="${list }" varStatus="status">
	                    <tr>
	                        <td style="width : 16.66%;"><c:out value="${l.boardNo }"/></td>
	                        <td style="width : 50%;"><a href="${path }/notice/viewNoticeDetail.hd?boardNo=${l.boardNo}" class="btn btn-dark" style="width : 100%;" href='#'"><c:out value="${l.boardTitle}"/></a></td>
	                        <td style="width : 25%;"><c:out value="${l.regDate }"/></td>
	                        <td style="width : 8.33%"><c:out value="${l.hitCount }"/></td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
    				</form>
    	<div class="card-body">
    		${pageBar }
    	</div>
    	<div class="card-footer" style="text-align : left;">
            <a href='#' onClick='fn_write()' class="btn btn-success">공지사항 작성</a>            
    	</div>
      </div>
   </div> 
<script>
//공지쓰기
function fn_write(){
    
    var form = document.getElementById("noticeForm");
    
    form.action = "<c:url value='/notice/noticeForm.hd'/>";
    form.submit();
    
}
 
//공지조회
/* function fn_view(boardNo){
    
    var form = document.getElementById("noticeForm");
    var url = "<c:url value='/notice/viewNoticeDetail.hd'/>";
    url = url + "?boardNo=" + boardNo;
    
    form.action = url;    
    form.submit(); 
} */
</script>
					<div class="card-footer">
					</div>
				</div>
			</div>
		</div>
		<!-- 본문 끝 -->
		<!-- 게시판 내용 모달 시작  -->
		
		<!-- 게시판 내용 모달 끝  -->



	<!-- Main-content End -->

	<!-- Body section End -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />