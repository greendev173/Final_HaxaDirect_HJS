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
			<div class="col-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div id="assignmentTitle">
						<h4 class="font-weight-bold mb-0">
							[<c:out value=""/>]&nbsp;공지사항 작성
						</h4>
					</div>
				</div>
			</div>
		</div>
		<!-- Main Content start -->
		<div class="row">
			<div class="col-12 grid-margin stretch-card">
				<div class="card">
					<form class="forms" name="boardFrm" action="${path}/notice/insertNotice.hd" method="post" onsubmit="return validate();"  enctype="multipart/form-data" >
						<div class="card-body">
							<div class="row">
								<div class="form-group col-5">
									<label for="exampleInputName1">제목</label>
									<input type="text" class="form-control" name="boardTitle" id="boardTitle" placeholder="공지사항 제목을 입력해주세요.">
								</div>
								<div class="form-group col-7">
			                      <label>첨부파일</label>
			                      <input type="file" name="upFile" class="file-upload-default">
			                      <div class="input-group col-12">
			                        <input type="text" class="form-control file-upload-info" disabled="" placeholder="업로드할 파일을 선택해주세요.">
			                        <span class="input-group-append">
			                          <button class="file-upload-browse btn btn-primary" type="button">첨부파일 선택</button>
			                        </span>
			                      </div>
			                    </div>
							</div>

							<div class="form-group">
								<label for="boardContent">공지 내용</label>
								<textarea class="form-control"  name="boardContent" id="boardContent" rows="25"></textarea>
							</div>
						</div>

						<div class="card-footer" style="text-align:center;">
							<button type="submit" class="btn btn-primary mr-2">등록</button>
							<button type="button" class="btn btn-inverse-dark btn-fw" onclick="cancel();">취소</button>
							

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

<script>
	
	function cancel() {
		history.back();
	}

</script>


	<!-- Main-content End -->
	<!-- Body section End -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />