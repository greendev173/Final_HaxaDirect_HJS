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
						<h4 class="font-weight-bold mb-0">비밀번호 변경</h4>
					</div>
				</div>
			</div>
			</div>
<!-- Main Content start -->	
<div class="row">
	<div class="col-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<div class="row" style="height:180px;"></div>
				<div class='row' style="height:400px;">
					<div class='col-2'></div>
					<div class='col-8'>
						<form id="formAction" action="${pageContext.request.contextPath }/professor/profUpdatePwdEnd?profId=${profId}" method="post">
							<table class="table spacing" style="text-align:center;">
								<tr>
									<th style="color:red;">* 현재 비밀번호 : </th>
									<td><input style="background-color:lightgray;" class="btn form-control" type='password' name="profPw" required/></td>
							    </tr>
							    <tr>
							    	<th style="color:blue;">변경할 비밀번호 : </th>
							    	<td><input id="checkPwd" style="background-color:lightgray;" class="btn form-control" type='password' name="profPwdUpdate" required/></td>
							    	<td id="checkPwdOn" style="display:none;"></td>
							    </tr>
							    <tr>
							    	<th style="color:blue;">비밀번호 확인 : </th>
							    	<td id="checkPwdOn1_"><input id="checkPwd_" style="background-color:lightgray;" class="btn form-control" type='password' name="profPwdReUpdate" required/></td>
							    </tr>
							 </table>
									<p id="checkPwdOn_" style="display:none;text-align:center;"></p>
							 <span style="float:right;">
								 <input id="upAlert" class="btn btn-dark" type='submit' value="수정"/>
								 <input id="back_" class="btn btn-dark" type='reset' value="취소"/>
							 </span>
						 </form>
					</div>
					<div class='col-2'></div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
/* 	$(function(){
		$("#upAlert").click(function(){
			if(confirm("수정하시겠습니까?")==true){
				document.from.submit();
			}else{
				return false;
			}
		});
	}); */
	
	$("#upAlert").click(function(e){
		if(confirm("수정하시겠습니까?")==true){
			if($("#checkPwd").val()!=$("#checkPwd_").val()){
				alert("변경할 비밀번호를 확인해주세요.");
				e.preventDefault();
			    e.stopPropagation();
			}else{
				document.from.submit();
			}
		}else{
			return false;
		}
	});
	
	$(function(){
		$("#back_").click(function(){
			history.back();
		});
	});
	$("#checkPwd").blur(function(){
		var value=$(this).val().trim();
		if(value.length<4){
			$("#checkPwdOn_").text("비밀번호는 4글자 이상").css({display:"block",color:"red"});
		}else{
			if($("#checkPwd_").val()==$(this).val() && $("#checkPwd_").val().trim()!=""){
				console.log("맞음");
				$("#checkPwdOn_").text("비밀번호가 일치합니다").css({display:"block",color:"blue"});
				return true;
			}else{
				console.log("틀림");
				$("#checkPwdOn_").text("비밀번호가 일치하지 않습니다!").css({display:"block",color:"red"});
				return false;
			}
		}
	});
	$("#checkPwd_").blur(function(){
		var value=$(this).val().trim();
		if(value.length<4){
			console.log("글자수");
			$("#checkPwdOn_").text("비밀번호는 4글자 이상").css({display:"block",color:"red"});
		}else{
			
			if($("#checkPwd").val()==$(this).val() && $("#checkPwd").val().trim()!=""){
				console.log("맞음");
				$("#checkPwdOn_").text("비밀번호가 일치합니다").css({display:"block",color:"blue"});
				return true;
			}else{
				console.log("틀림");
				$("#checkPwdOn_").text("비밀번호가 일치하지 않습니다!").css({display:"block",color:"red"});
				return false;
			}
		}
	});

	
</script>

<style>
	.spacing{
		border-spacing:4px;
	    border-collapse: separate;
	}
</style>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>