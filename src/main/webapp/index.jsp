<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH대학교</title>
</head>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=Raleway:500' rel='stylesheet' type='text/css'/>
<link href="${path}/resources/css/login.css" rel="stylesheet" type='text/css'/>
<script src="${path }/resources/js/jquery-3.4.1.min.js"></script>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Haxa Direct</title>
  <link rel="stylesheet" href="${path }/resources/assets/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${path }/resources/assets/vendors/base/vendor.bundle.base.css">
  <link rel="stylesheet" href="${path }/resources/css/modal.css">
<script>

function clickStu() {
	var emparr="";
	
	$(".login_stu").css("backgroundColor","rgba(34,174,216)");
    $(".login_pro").css("backgroundColor","rgba(222,99,91,0.5)");
    $(".login_emp").css("backgroundColor","rgba(49,196,26,0.5)");

    emparr="<form class='form-horizontal' action='${path }/login.hd' method='post'>";
    emparr+="<input type='hidden' name='loginNo' value='s'/>"
    emparr+="<input type='text' name='loginId' placeholder='학번을 입력해주세요' class='form-control input-md'>";
    emparr+="<input type='password' name=loginPwd placeholder='비밀번호를 입력해주세요' class='form-control input-md input_pwd'>";
    emparr+="<div class='spacing'>";
    emparr+="<span><a href='#' onclick='idSearchModal();' style='color:rgba(34,174,216); font-weight:bold;'>학번 찾기</a></span> / ";
    emparr+="<span><a href='#' onclick='pwSearchModal();' style='color:rgba(34,174,216); font-weight:bold;'>비밀번호 찾기</a></span><br/></div>";
    emparr+="<label><input type='checkbox' name='idSave' /> <small>아이디 저장</small></label>";
    emparr+="<input type='submit' class='btn btn-info btn-sm pull-right' style='font-weight:bold;' value='로그인'>";
    emparr+="<button type='button' id='enrollBtn' class='btn btn-info btn-sm pull-right adm_btn' style='font-weight:bold;'>입학신청</button></form>"
    $(".panel-heading").html("<h3 class='panel-title'>학생 로그인</h3>");
    $("#panel-heading").css("backgroundColor", "rgba(34,174,216)");
    $(".col-md-7").html(emparr);
}

function clickProf() {
	var emparr="";
	
	$(".login_pro").css("backgroundColor","rgba(222,99,91)");
    $(".login_stu").css("backgroundColor","rgba(91,192,222,0.7)");
    $(".login_emp").css("backgroundColor","rgba(49,196,26,0.5)");
    
    emparr="<form class='form-horizontal' action='${path }/login.hd' method='post'>";
    emparr+="<input type='hidden' name='loginNo'value='p'/>"
    emparr+="<input type='text' name='loginId' placeholder='사번을 입력해주세요' class='form-control input-md'>";
    emparr+="<input type='password' name=loginPwd placeholder='비밀번호를 입력해주세요' class='form-control input-md input_pwd'>";
    emparr+="<div class='spacing'>";
    emparr+="<span><a href='#' onclick='empIdSearchModal();' style='color:rgba(222,99,91); font-weight:bold;'>교번 찾기 </a></span><br/></div>";
    emparr+="<label><input type='checkbox' name='idSave' /> <small>아이디 저장</small></label>";
    emparr+="<input id='loginProf' type='submit' class='btn btn-info_prof btn-sm pull-right' style='font-weight:bold;' value='로그인'></form>";
    $("#panel-heading").html("<h3 class='panel-title'>교수 로그인</h3>");
    $("#panel-heading").css("backgroundColor", "rgba(222,99,91)");
    $("#empIdSearchclose").next().html("교번 찾기").css("color", "rgba(222,99,91)");
    $("#empSendBtn").removeClass("btn-info_emp");
    $("#empSendBtn").addClass("btn-info_prof");
    $("#empIdSearchclose1").removeClass("btn-info_emp");
    $("#empIdSearchclose1").addClass("btn-info_prof");
    $(".col-md-7").html(emparr);
}

function clickEmp() {
	var emparr="";
	
	$(".login_emp").css("backgroundColor","rgba(49,196,26)");
    $(".login_stu").css("backgroundColor","rgba(91,192,222,0.7)");
    $(".login_pro").css("backgroundColor","rgba(222,99,91,0.7)");

    emparr="<form class='form-horizontal' action='${path }/login.hd' method='post'>";
    emparr+="<input type='hidden' name='loginNo'value='e'/>"
    emparr+="<input type='text' name='loginId' placeholder='사번을 입력해주세요' class='form-control input-md'>";
    emparr+="<input type='password' name=loginPwd placeholder='비밀번호를 입력해주세요' class='form-control input-md input_pwd'>";
    emparr+="<div class='spacing'>";
    emparr+="<span><a href='#' onclick='empIdSearchModal();' style='color:rgba(49,196,26); font-weight:bold;'>사번 찾기 </a></span><br/></div>";
    emparr+="<label><input type='checkbox' name='idSave' /> <small>아이디 저장</small></label>";
    emparr+="<input type='submit' class='btn btn-info_emp btn-sm pull-right' style='font-weight:bold;' value='로그인'></form>";
    $(".panel-heading").html("<h3 class='panel-title'>교직원 로그인</h3>");
    $("#panel-heading").css("backgroundColor", "rgba(49,196,26)");
    $("#empIdSearchclose").next().html("사번 찾기").css("color", "rgba(49,196,26)");
    $("#empSendBtn").removeClass("btn-info_prof");
    $("#empSendBtn").addClass("btn-info_emp");
    $("#empIdSearchclose1").removeClass("btn-info_prof");
    $("#empIdSearchclose1").addClass("btn-info_emp");
    $(".col-md-7").html(emparr);
}


function loginTypeCookie(loginType) {
	$.ajax({
  	  url:"${path}/loginCookieByAjax.hd",
  	  type: 'POST',
  	  data:{"loginType": loginType},
  	  success:function(data) {
  		  // console.log("쿠키 등록됨:"+data);
  	  }
    });
}


$(function(){ // html 페이지가 로드되면
	<%
		Cookie[] cookies=request.getCookies();
		String loginType="";
		String idSave=null;
		if(cookies!=null) {
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("loginType")) {
					loginType=cookies[i].getValue();
				}else if(cookies[i].getName().equals("idSave")) {
					idSave=cookies[i].getValue();
				}
			}
		}
	
		if(loginType.equals("stu")) { %>
		 clickStu();
	<%	}else if(loginType.equals("prof")) { %>
		 clickProf();
	<%	}else if(loginType.equals("emp")) { %>
	     clickEmp();
	<%	} 
		
		if(idSave!=null) { %>
		$("input:checkbox[name='idSave']").prop("checked", true);
		$("input[name=loginId]").val("<%=idSave%>");
		// console.log("idsave:<%=idSave%>");
	<%	}
	%>
	
   $(".login_stu").click(function(){
	   clickStu();
	   loginTypeCookie("stu");
   });
   
   
   $(".login_pro").click(function(){
	   clickProf();
	   loginTypeCookie("prof");
   });
   
   $(".login_emp").click(function(){
	   clickEmp();
	   loginTypeCookie("emp");
   });
});


</script>

<style>
	/* div {
		border:1px solid black;	
	} */
   .modal{
      display: none;
      position : fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height:100%;
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        
        .btn-info_stu {
        	color: #fff;
		    background-color: #22aed8;
		    border-color: #46b8da;
        }
      
   
</style>

<body>
   <div class="middlePage">
   	  <%-- <div class="page-haeder" style="text-align:center;">
   	   <img width="70%" src="${path }/resources/images/image/khlogo.jpg">
   	  </div> --%>
      <div class="page-header">
         <h3 class="logo" style="font-weight:bold;">
            	안녕하세요 KH대학교 종합정보 시스템입니다.
         </h3>
      </div>
      <div class="panel panel-info">
         <div id="panel-heading" class="panel-heading" style="background-color:rgba(34,174,216);">
            <h3 class="panel-title">학생 로그인</h3>
         </div>
         <div class="panel-body" id="12">
            <div class="row">
               <div class="col-md-5">
                  <div id="login_stu" class="login_stu hvr-bounce-to-right_stu">
                     <p>학생</p>
                  </div>
                  <div id="login_prof" class="login_pro hvr-bounce-to-right_prof">
                     <p>교수</p>
                  </div>
                  <div id="login_emp" class="login_emp hvr-bounce-to-right_emp">
                     <p>교직원</p>
                  </div>
               </div>
               <div class="col-md-7" style="border-left: 1px solid #ccc; height: 160px">
               
                  <form class="form-horizontal" action="${path }/login.hd" method='post'>
                  	 <input type="hidden" name="loginNo" value="s"/>
                     <input type="text" name="loginId" placeholder="학번을 입력해주세요" class="form-control input-md">
                     <input type="password" name="loginPwd" placeholder="비밀번호를 입력해주세요" class="form-control input-md input_pwd">
                     <div class="spacing">
                        <span><a href="#" id="idSearchBtn" onclick='idSearchModal();' style='color:rgba(34,174,216); font-weight:bold;'>학번 찾기</a></span> /
                        <span><a href="#" id="pwSearchBtn" onclick="pwSearchModal();" style='color:rgba(34,174,216); font-weight:bold;'>비밀번호 찾기</a></span>
                         <br />
                     </div>
                     <label>
                        <input type="checkbox" name="checkboxes" id="checkboxes-0" value="1" /> 
                        <small>아이디 저장</small>
                     </label>
                     <input type="submit" class="btn btn-info btn-sm pull-right" style="font-weight:bold;" value="로그인"/>
                     <button type="button" id="adm_btn" class="btn btn-info btn-sm pull-right adm_btn" style="font-weight:bold;" onclick="enrollStudent();">입학신청</button>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
   
   <!-- 모달창  -->
   <div id="enrollModal" class="modal">
      <div class="modal-content">
         <form action="${path}/beforeStudent/enroll.hd" method="POST">
         <span class="close" id="enrollClose">&times;</span>
         <p>입학 신청</p>
         <div class="form-group">
         <hr>
            <label class="control-label">이름</label>
               <input type="text" id="beforeName" name="beforeName" placeholder="이름을 입력하세요" class="form-control" required />
         <hr>
         <label class="control-label">입학 유형</label>
         <select class="form-control" name="beforeType">            <option value="정시" class="enrollType" >정시</option>
            <option value="수시" class="enrollType">수시</option>
            <option value="편입" class="enrollType">편입</option>            
         </select>      
            <hr>
         <label class="control-label">연락처</label>
               <input type="tel" id="beforePhone" name="beforePhone" placeholder=" '-' 제외 입력" autocomplete=off class="form-control" />
               <input type="hidden" class="saveEmail" id="saveEmail" name="beforeEmail" value="">
               <input type="hidden" class="flagEmail" id="flagEmail" name="flagEmail" value="false">
               <br>
               <label class="control-label">E-mail</label>               
               <div class="emailCheck">
               <input type="email" id="email" name="email" placeholder="이메일을 입력하세요" class="form-control" required >
               <button type="button" class="btn btn-info" id="emailBtn">이메일 발송</button>
               </div>
   
               <br>
         
            
         <label class="control-label">학과 코드</label>            
            
                  <select class="form-control selectCol" name ='beforeColCode'>                        
                  </select>
                  <!-- 여기에 학과 선택 넣어야함 .selectCol -->
                  <select class="form-control selectdep"  name='beforeDeptCode' required>
                  </select>
                  <br>
                  <label class="control-label">주민 등록 번호</label>   
                  <input type="text" id="jumin" name="jumin" placeholder="주민등록번호 13자리를 입력하세요" class="form-control" onblur="setJumin(this)" />
               <input type="hidden" id="beforeNo" value="" name="beforeNo">
               <br>                                          
               <br>
         <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
         <fieldset style="board:1px black">
         <legend><label class="control-label">주소 / 상세 주소</label></legend>
               <div class="inputAddress ">
                  <input type="text" id="sample6_postcode" name="zipcode" class="myI-1-add form-control" placeholder="우편번호 " readonly>
                  <input type="button" onclick="sample6_execDaumPostcode();"  class="myI-1-add btn-address btn btn-info" value="우편번호 찾기 "/>
                  <input type="text" id="sample6_address" name="address1" class="myI-1 form-control" placeholder="주소 " readonly>
                  <input type="text" id="sample6_detailAddress" name="address2" class="myI-1 form-control" placeholder="상세주소 ">
               </div>
         </fieldset>


         </div>
         <input type="hidden" path="random" id="random" name="random1" value="${random}" />
         <input type="button"  class="btn btn-info btn_close" id="enrollClose1" value="취소" style="float: right; margin: 7px;">
         <input type="submit" class="btn btn-info" id="enrollBtn" value="입학 신청" style="float: right; margin: 7px;">
         <br>
         <br>
      </form>
      </div>
   </div>   
</body>

      <div id="idSearchModal" class="modal">
            <div class="modal-content" style="width:400px;">
               <form action="${path }/stuIdSearch.hd">
                     <span class="close" id="idSearchclose">&times;</span>
                     <p style="font-weight:bold; color:rgba(34,174,216);">학번 찾기</p>
                     <div class="form-group"><br/>
                     <input type="hidden" name="loginNo" value="s"/>
                     <input type="text" id="reqTitle" name="stuName" placeholder="이름을 입력해주세요" class="form-control" autocomplete="off"/><br/>
                     <input type="text" id="reqTitle" name="stuEmail" placeholder="등록된 이메일을 입력해주세요" class="form-control" autocomplete="off"/><br/>
                     <input type="hidden" value="s" />
                     </div>
                     <input type="button" class="btn btn-info btn-sm pull-right" id="idSearchclose1" value="취소" style="float: right; margin: 7px; font-weight:bold;">
                     <input type="submit" class="btn btn-info btn-sm pull-right" value="전송" style="float: right; margin: 7px; font-weight:bold;">
                     <br>
                     <br>
               </form>   
            </div>
          </div>
          
          <div id="pwSearchModal" class="modal">
            <div class="modal-content" style="width:400px;">
              <form>
                     <span class="close" id="pwSearchclose">&times;</span>
                     <p style="font-weight:bold; color:rgba(34,174,216);">비밀번호 찾기</p>
                     <div class="form-group pwUpDiv"><br/>
                     <input type="hidden" name="loginNo" id="loginNo" value="s"/>
                     <input type="hidden" id="pwRandom" name="pwRandom" value=""/>
                     <input type="text" id="stuNo" name="stuNo" placeholder="학번을 입력해주세요" class="form-control" autocomplete="off"/><br/>
                     <input type="text" id="stuEmail" name="stuEmail" placeholder="등록된 이메일을 입력해주세요" class="form-control" autocomplete="off"/><br/>
                     </div>
                     <div id="pwP">
                     </div>
                     <input type="button" class="btn btn-info btn-sm pull-right" id="pwSearchclose1" value="취소" style="float: right; margin: 7px; font-weight:bold;">
                     <div id="pwDiv">
                     <!-- <input type="submit" class="btn btn-inverse-info btn-fw" value="인증번호 발송" style="float: right; margin: 7px;">
                     <p>안녕</p> -->
                     </div>
                     <br>
                     <br>
               </form>
            </div>
          </div>
          
          <div id="empPwSearchModal" class="modal">
            <div class="modal-content" style="width:400px;">
               <%-- <form action="${path }/stuIdSearch.hd"> --%>
                     <span class="close" id="empPwSearchclose">&times;</span>
                     <p>비밀번호 찾기</p>
                     <div class="form-group"><br/>
                     <input type="hidden" name="loginNo" id="loginNo1" value="e"/>
                     <input type="hidden" id="emPwRandom" name="empPwRandom" value=""/>
                     <input type="text" id="empNo" name="searchNo" placeholder="사번을 입력해주세요" class="form-control" autocomplete="off"/><br/>
                     <input type="text" id="empEmail" name="searchEmail" placeholder="등록된 이메일을 입력해주세요" class="form-control" autocomplete="off"/><br/>
                     </div>
                     <div id="empPwP">
                     </div>
                     <input type="button" id="" class="btn btn-info btn-sm pull-right" id="empPwSearchclose1" value="취소" style="float: right; margin: 7px;">
                     <div id="empPwDiv">
                     </div>
                     <br>
                     <br>
               <!-- </form>    -->
            </div>
          </div>
          
          <div id="empIdSearchModal" class="modal">
            <div class="modal-content" style="width:400px;">
               <form action="${path }/stuIdSearch.hd">
                     <span class="close" id="empIdSearchclose">&times;</span>
                     <p style="color:rgb(222, 99, 91); font-weight:bold;">교번 찾기</p>
                     <div class="form-group"><br/>
                     <input type="hidden" name="loginNo" value="e"/>
                     <input type="text" id="searchName" placeholder="이름을 입력해주세요" class="form-control" autocomplete="off" required="required"/><br/>
                     <input type="text" id="searchEmail" placeholder="등록된 이메일을 입력해주세요" class="form-control" autocomplete="off"/><br/>
                     <input type="hidden" value="s" />
                     </div>
                     <input type="button" class="btn btn-info_prof btn-sm pull-right" id="empIdSearchclose1" value="취소" style="float: right; margin: 7px; font-weight:bold;">
                     <input id="empSendBtn" type="submit" class="btn btn-info_prof btn-sm pull-right" value="전송" style="float: right; margin: 7px; font-weight:bold;">
                     <br>
                     <br>
               </form>   
            </div>
          </div>

<script>
   $(function(){
      $("#stuEmail").keyup(function(){
         var stuNo=$("#stuNo").val();
         var stuEmail=$("#stuEmail").val();
         var loginNo=$("#loginNo").val();
         $.ajax({
            url:"${path}/stuPwSearch.hd",
            data:{"stuNo":stuNo,"stuEmail":stuEmail,"loginNo":loginNo},
            success:function(data){
               var pwArr="";
               var pwArrP="";
               if(data!=null&&data!=""){
                  pwArr+="<input type='button' id='stuPwRandomBtn' class='btn btn-info btn-sm pull-right' onclick='stuPw();' value='인증번호 발송' style='float: right; margin: 7px'>";
                  pwArrP+="<p style='color:blue;'>인증번호 발송버튼을 눌러주세요</p>"
               }else{
                  pwArrP="<p style='color:red;'>학번 / 등록된 이메일을 입력해주세요</p>"
               }
               $("#pwDiv").html(pwArr);
               $("#pwP").html(pwArrP);
            }
         });
      });
   });
   
  
   
   
   function stuPw(){
	   var pwRandom=$("#pwRandom").val();
	   var loginNo=$("#loginNo").val();
	   var stuEmail=$("#stuEmail").val();
	   var stuNo=$("#stuNo").val();
	   $.ajax({
		  url:"${path}/stuPwRandom.hd",
		  data:{"pwRandom":pwRandom,"loginNo":loginNo,"stuEmail":stuEmail},
		  success:function(data){
			  var stuRandom="";
			  var stuRandomBtn="";
			  stuRandom+="<input type='text' class='form-control' value='' id='stuRandomCheck' placeholder='인증번호를 입력해주세요.'/>";
			  stuRandomBtn+="<button id='stuRandomCheckBtn' type='button' class='btn btn-info btn-sm pull-right'>인증번호 확인</button>";
			  var stuRanP="<p style='color:red;'>인증번호를 타인에게 노출하지마세요</p>";
		  $(".pwUpDiv").html(stuRandom);
          $("#pwDiv").html(stuRandomBtn);
          $("#pwP").html(stuRanP);
          $("#pwSearchclose1").remove();
          
			  $("#stuRandomCheckBtn").click(function(){
				  var stuRandomCheck=$("#stuRandomCheck").val();
			   	   $.ajax({
			   		   url:"${path}/stuRandomCheck.hd",
			   	   	   data:{"stuRandomCheck":stuRandomCheck},
			   	   	   success:function(data){
			   	   		   console.log(data);
			   	   		   var ranCheckArr="";
			   	   		   var ranCheckBtnArr="";
			   	   		   var pwArrP="";
			   	   		   if(data==true){
			   	   			ranCheckArr+="<br><input type='password' class='form-control' value='' id='changeStuPw' placeholder='변경할 비밀번호 입력'/><br>";
			   	   			ranCheckArr+="<input type='password' class='form-control' value='' id='changeStuPwCk' placeholder='비밀번호 재입력'/>";
			   	   			ranCheckBtnArr="<button id='stuPwSuccess' type='button' class='btn btn-info btn-sm pull-right'>변경 완료</button>";
				   	   		$(".pwUpDiv").html(ranCheckArr);
				            $("#pwDiv").html(ranCheckBtnArr);
				            $("#pwP").html("");
			   	   		   }else if(data==false){
			   	   			pwArrP="<p style='color:red;'>인증번호가 일치하지 않습니다.</p>";
			   	   			$("#pwP").html(pwArrP);
			   	   		   }
			   	   		   $("#stuPwSuccess").click(function(){
			   	   			   var changeStuPw=$("#changeStuPw").val();
			   	   			   var changeStuPwCk=$("#changeStuPwCk").val();
			   	   			   
			   	   			   location.href="${path}/stuPwChange.hd?stuPw="+changeStuPw+"&stuPwCk="+changeStuPwCk+"&stuNo="+stuNo;
			   	   		   });

			   	   	   }
			   	   });
			  });
		  }
	   });
   }
   
   
   
   
   
   $(function(){
	      $("#empEmail").keyup(function(){
	         var searchNo=$("#empNo").val();
	         var searchEmail=$("#empEmail").val();
	         var loginNo=$("#loginNo1").val();
	         $.ajax({
	            url:"${path}/stuPwSearch.hd",
	            data:{"searchNo":searchNo,"searchEmail":searchEmail,"loginNo":loginNo},
	            success:function(data){
	               var pwArr="";
	               var pwArrP="";
	               if(data!=null&&data!=""){
	                  pwArr+="<input type='submit' class='btn btn-info btn-sm pull-right' value='인증번호 발송' style='float: right; margin: 7px'>";
	                  pwArrP+="<p style='color:blue;'>인증번호 발송버튼을 눌러주세요</p>"
	               }else{
	                  pwArrP="<p style='color:red;'>사번 / 등록된 이메일을 입력해주세요</p>"
	               }
	               $("#empPwDiv").html(pwArr);
	               $("#empPwP").html(pwArrP);
	            }
	         });
	      });
	   });
   


   function idSearchModal(){
      var idSearchModal = document.getElementById('idSearchModal');
      var idSearchclose = document.getElementById("idSearchclose");                                          
      var idSearchclose1 = document.getElementById("idSearchclose1"); 
         idSearchModal.style.display = "block";
         idSearchModal.style.display = "block";
      idSearchclose.onclick = function() {
         idSearchModal.style.display = "none";
      }
      idSearchclose1.onclick = function() {
         idSearchModal.style.display = "none";
      }
   }
   
   function pwSearchModal(){
      pwSearchModal1();
      var pwSearchModal = document.getElementById('pwSearchModal');
      var pwSearchclose = document.getElementById("pwSearchclose");                                          
      var pwSearchclose1 = document.getElementById("pwSearchclose1"); 
         pwSearchModal.style.display = "block";
         pwSearchModal.style.display = "block";
      pwSearchclose.onclick = function() {
         pwSearchModal.style.display = "none";
      }
      pwSearchclose1.onclick = function() {
         pwSearchModal.style.display = "none";
      }
   }
   
   function empPwSearchModal(){
	      pwSearchModal1();
	      var empPwSearchModal = document.getElementById('empPwSearchModal');
	      var empPwSearchclose = document.getElementById("empPwSearchclose");                                          
	      var empPwSearchclose1 = document.getElementById("empPwSearchclose1"); 
	      empPwSearchModal.style.display = "block";
	      empPwSearchModal.style.display = "block";
	      empPwSearchclose.onclick = function() {
	    	  empPwSearchModal.style.display = "none";
	      }
	      empPwSearchclose1.onclick = function() {
	    	  empPwSearchModal.style.display = "none";
	      }
	   }
   
   function pwSearchModal1() {
         $.ajax({
            url :"${path}/email.do",
            success : function(data) {
          $("#pwRandom").attr('value',data.random);
          $("#emPwRandom").attr('value',data.random);
            }
         });
      }
   
   function empIdSearchModal(){
      var empIdSearchModal = document.getElementById('empIdSearchModal');
      var empIdSearchclose = document.getElementById("empIdSearchclose");                                          
      var empIdSearchclose1 = document.getElementById("empIdSearchclose1"); 
         empIdSearchModal.style.display = "block";
         empIdSearchModal.style.display = "block";
      idSearchclose.onclick = function() {
         empIdSearchModal.style.display = "none";
      }
      empIdSearchclose1.onclick = function() {
         empIdSearchModal.style.display = "none";
      }
   }




   // 입학 신청 완료할때 유효성 검사해야함 함수 쓰기
$(function(){
   $('#enrollBtn').click(function() {

      //이름
      let name = $("#beforeName").val();
      if(name == null || name == '') {
         alert("이름을 입력해 주세요.");
      }
      
      
      
      // //전화번호 정규표현식
     let regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
      // let regPhone = /^\d{3}\d{3,4}\d{4}$/;
      
      let phone = $('#beforePhone');
              if (!phone.val()) {
                  alert('전화번호를 입력해주세요.');
                  phone.focus();
                  return false;
              } else {
                  if (!regPhone.test(phone.val().trim())) {
                      alert('전화번호 형식이 유효하지 않습니다.');
                      phone.focus();
                      return false;
                  }
              }

     // //이메일 인증을 완료했는지 확인

           let checkEmail = $('#email').val();
           if(checkEmail == null) {
              alert("이메일 인증을 완료해주세요.");
                 return false;
           }

         // 학과 선택
         let chooseDept = $(".selectdep").val();
         if(chooseDept == 'select') {
            alert("학과를 선택해 주세요.");
            return false;
         }
           //주민등록 번호
           let juminCk = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
           let jumin = document.getElementById('jumin').value;
           if(jumin == "") {
            alert("주민번호를 입력해주세요");
            return false;
         }else if(jumin.length < 13){
            alert("정확한 주민번호를 입력해 주세요.");
            return false;
         }

   // //주소
   let postcode = $('#sample6_postcode');
            //상세주소
            let detailAddress = $('#sample6_detailAddress');
            if (!postcode.val()) {
                alert('주소를 입력해주세요.');
                postcode.focus();
                return false;
            }
            if (!detailAddress.val()) {
                alert('상세주소를 입력해주세요.');
                detailAddress.focus();
                return false;
            }


            let postCode = document.getElementById('sample6_postcode').value;
            let addrCode = document.getElementById("sample6_address").value;
            let detailAddr = document.getElementById("sample6_detailAddress").value;
         let beforeAddr = "<input type='hidden' name='beforeAddr' value='"+postCode+" PSTD "+addrCode+" "+detailAddr+"'/>"; 
         document.getElementsByClassName("inputAddress")[0].innerHTML += beforeAddr;
         console.log("주소값 :"+beforeAddr);
            
            

   })
});




function setJumin(obj) {
   let ju = obj.value;
   console.log("ju : "+ju);
   console.log("ck" + ju.indexOf("*") != -1);
   if(ju.indexOf("*") == -1) {
      console.log("if문 내부")
    document.getElementById('beforeNo').value = ju;
   }
   console.log("ckjumin :" + document.getElementById('beforeNo').value);
   console.log(ju);
   ju = ju.replace("-","");
      if(ju.length > 6) {
         ju1 = ju.substring(0,6);
         ju2 = ju.substring(6,7);
      for(i=1; i<ju.substring(6).length && i < 7; i++) {
         ju2 = ju2 + "*";
      }
      
      obj.value = ju1+"-"+ju2;
      $('#jumin').prop("readonly", true);
      }
   
   }



function enrollStudent() {
   $("#enrollModal").css("display","block");
   
   $.ajax({
      url : "<c:url value='/email.do'/>",
      success : function(data) {

    $('input[name=random1]').attr('value',data.random);
    $("#pwRandom").attr('value',data.random);
      }
   });
}

$(function(){
   $("#enrollClose").click(function(){
      $("#enrollModal").css("display","none");
   });
});

$(function(){
   $("#enrollClose1").click(function(){
      $("#enrollModal").css("display","none");
   });
});

// 로딩이 되엇을때 db에서 대학의 정보를 가져와 만들어줌
$(function() {
   $(document).ready(function(){

      $.ajax({
         type : "post",
         url: "${pageContext.request.contextPath}/selectColList.do",
         success: function(data) {
   
            let colListHtml = "";
            
            colListHtml = "<option value='select' id='selCol'>대학 선택</option>";
            for(let i = 0; i < data.list.length; i++) {
               let cols = data.list[i];
               console.log(cols['COL_CODE']);

               colListHtml += "<option value='"+cols['COL_CODE']+"'  class='colList'>"+cols['COL_NAME']+"</option>";
            }
            
            $('.selectCol').html(colListHtml);
               $('.selectCol').change(function(){
               $("#selCol").attr('disabled',true);
   			})
         
         }
      })
   })
});



//대학이 선택 되었을때 해당 대학에 포함되어 있는 학과를 리스트로 가져옴
 $(function(){
    $('.selectCol').change(function(){
       let val = $('.selectCol').val();
      $.ajax({
         type : "post",
         url: "${pageContext.request.contextPath}/selectDeptList.do",
         data: {"result" : $('.selectCol').val()},
         success: function(data) {
            let deptListHtml = "<option value='select' id='selDept'>학과 선택</option>";
            for(let i = 0; i < data.list.length; i++) {
               let depts = data.list[i];

               deptListHtml += "<option value='"+depts['DEPT_CODE']+"'  class='deptList'>"+depts['DEPT_NAME']+"</option>";
            }
            
            $('.selectdep').html(deptListHtml);
               $('.selectdep').change(function(){
               $("#selDept").attr('disabled',true);
      });
    }
 });
    });
 });





$(function(){
   /*이메일 인증 버튼 클릭시 발생하는 이벤트   */
   $(document).on("click", "#emailBtn", function(){
      var emailVal = $("#email").val();

      // 검증에 사용할 정규식 변수 regExp에 저장
      var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

if (emailVal.match(regExp) != null) {
  //정규식 통과했을경우 비동기 통신
   $.ajax({
      /* beforeSend: function(){
      loadingBarStart();
      }, */
         type:"post",
         url : "${pageContext.request.contextPath}/login/createEmailCheck.do",
         data : {"userEmail":$("#email").val(),"random":$("#random").val()},
         /*//data: "userEmail="+encodeURIComponent($('#userEmail').val()),
             encodeURIComponent
            예를들어, http://a.com?name=egoing&job=programmer 에서 &job=programmer
            중 '&'는 하나의 파라미터가 끝나고 다음 파라미터가 온다는 의미이다.
            그런데 다음과 같이 job의 값에 &가 포함된다면 시스템은 job의 값을 제대로 인식할수 없게 된다. */
            success : function(data){
               
               console.log(data);
               alert("사용가능한 이메일입니다. 인증번호를 입력해주세요.");

               let emailHtml = "<input type='text' id='authCode' name='authCode' placeholder='인증번호를 입력하세요' class='form-control' />"+"<button type='button' class='btn btn-info' id='emailAuthBtn'>이메일 인증</button>";
               document.getElementById('saveEmail').value = $('#email').val(); 
               
                $('.emailCheck').children().remove();
                $('.emailCheck').append(emailHtml);
            },
            error: function(e,s,a){
               alert("에러가 발생하였습니다.");
            
               return false;
            }
         })
}else {
               alert("정확한 이메일을 입력해 주세요.");
}
         })
   /*
   이메일 인증번호 입력 후 인증 버튼 클릭 이벤트
   */
   $(document).on("click", "#emailAuthBtn", function(){
      $.ajax({
         /* beforeSend: function(){
         loadingBarStart();
         }, */
            type:"post",
            url:"${pageContext.request.contextPath}/emailAuth.do",
            data:{"authCode":$('#authCode').val(),"random":$("#random").val()},
            success:function(data){
               if(data == "complete"){
               alert("인증이 완료되었습니다.");
                  let checkEmail = document.getElementById('saveEmail').value;
                  let emailHtml = "<input type='text' id='email' name='email' value="+checkEmail+" class='form-control' readonly >";
               $('.emailCheck').children().remove();
                $('.emailCheck').append(emailHtml);

                $('input[name=flagEmail]').attr('value','true'); 
      
               }else if(data == "false"){
               alert("인증번호를 잘못 입력하셨습니다.")
               }
               },
            complete: function(){
               /* loadingBarEnd(); */
               console.log("완료");
               },
            error:function(data){
               alert("에러가 발생했습니다.");
               }
               });
         });
         })
         
         
      //주소api스크립트
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가 "로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        //document.getElementById("sample6_extraAddress ").value = extraAddr;

                    } else {
                        // document.getElementById("sample6_extraAddress ").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
         
         
         
</script>



</html>