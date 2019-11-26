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
					<div>
						<h4 class="font-weight-bold mb-0">수정</h4>
					</div>
				</div>
			</div>
			</div>
<!-- Main Content start -->	
<div class="row">
	<div class="col-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<!-- <div class="row"><p style="font-size:25px;">글작성</p></div> -->
				<form action="${pageContext.request.contextPath }/profBoard/updateBoardEnd?profBoardNo=${prof.profBoardNo}" method="post" enctype="multipart/form-data">
					<div class="row" style="margin:5px;">
						<div class="col-12">
						<input type='hidden' value="${prof.profBoardNo }"/>
							<table class="spacing">
								<tr>
									<th>글쓴이</th>
									<td><input class="btn btn-default" name="profName" style="text-align:left;" type='text' value="${prof.profName }" readonly/></td>
								</tr>
								<tr>
									<th>옵션</th>
									<td>
										<select id="selectContext" name="profBoardType" class="btn">
											<option style="background-color:red;" id="AllNotice" value="전체 공지">전체 공지</option>
											<option value="학과 공지">학과 공지</option>
											<option value="강의 자료">강의 자료</option>
											<option value="기타 자료">기타 자료</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>입력일</th>
									<td><input class="btn btn-default" style="width:800px;text-align:left;" type='text' value='<fmt:formatDate value="${prof.profBoardDate }" pattern="yyyy-MM-dd"/>' readonly/></td>
								</tr>
								<tr>
									<th>제목</th>
									<td><input id="selectTitle" name="profBoardTitle" class="btn btn-default" style="width:800px;border:1px solid black;text-align:left;" type='text' value="${prof.profBoardTitle }"/></td>
								</tr>
								<tr><td><br/></td></tr>
								<tr>
									<th>첨부파일</th>
									<c:forEach items="${profAttachment }" var="file">
									<td>
										<input id="upFile" name="upFile" class="" type="file" value="${file.boardOrifilename }"/>
									</td>
									</c:forEach>
								</tr>
								<tr><td><br/></td></tr>
								<tr>
									<th>내용</th>
									<td><textarea id="context" class="btn btn-default" name="profBoardContent" style="height:400px;width:800px;border:1px solid black;text-align:left;">${prof.profBoardContent }</textarea></td>
								</tr>
							</table>
						</div>
					</div><br/>
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4"></div>
						<div class="col-4">&nbsp;
							<input id="updateBoardCk" class="btn btn-dark" type='submit' value=" 글 수정 "/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type='button' id="boardView" class="btn btn-dark" value=" 글 목록 ">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
	$("#updateBoardCk").click(function(){
		if(confirm("수정하시겠습니까?")==true){
			document.from.submit();
		}else{
			return false;
		}
	});

/* 	$(document).ready(function() {
	    
	    $(document).on("click","input[id=notice]",function(){
	        var checkYn = $("input[id=notice]").is(":checked")?"Y":"N"; //3항연산자, checkbox 체크 여부
	        console.log(checkYn);
	        if(checkYn=='Y'){
		        $("#selectContext").attr("disabled","true");
	        }else if(checkYn=='N'){
	        	$("#selectContext").attr("disabled","false");
	        }
	    });
	}); */

	
	$(function(){
		$("#creBtn").one("click",function(){
			var input=$("<input>").attr({"type":"file","name":"upFile"});
			$(this).prev().after(input);
		});
		$("#delBtn").one("click",function(){
			$("#upFile").remove();
			return false;
		});
	});
	
	$(function(){
		$("#selectContext").change(function(){
			console.log($("#selectContext").val());
			if($("#selectContext").val()=="전체 공지"){
				$("#AllNotice").css("background-color","red");
			}
		})
	});
	$(function(){
		$("#selectContext").change(function(){
			console.log($("#selectContext").val());
			if($("#selectContext").val()=="학과 자료"){
				$("#selectTitle").text("[학과자료]");
			}
			else if($("#selectContext").val()=="강의 자료"){
				$("#selectTitle").text("[강의자료]");
			}
			else if($("#selectContext").val()=="기타 자료"){
				$("#selectTitle").text("[기타자료]");
			}
		})
	});
	
	$(function(){
		$("#boardView").click(function(){
			history.back();
		});
	});

</script>

<style>
	.spacing{
		border-spacing:4px;
	    border-collapse: separate;
	}
</style>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>