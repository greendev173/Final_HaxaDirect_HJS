<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH 대학교</title>
</head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=Raleway:500' rel='stylesheet' type='text/css'/>
<link href="${path}/resources/css/login.css" rel="stylesheet" type='text/css'/>
<script src="${path }/resources/js/jquery-3.4.1.min.js"></script>
<script>
$(function(){
	var emparr="";
	$(".login_stu").click(function(){
		$(".login_stu").removeClass(".hvr-bounce-to-right");
		$(".login_stu").css("backgroundColor","#46b8ff");
		$(".login_pro").css("backgroundColor","#abdbff");
		$(".login_emp").css("backgroundColor","#abdbff");
		$.ajax({
		    success:function(){
		    emparr="<form class='form-horizontal' action='${path }/login.hd'>";
		    emparr+="<input type='hidden' name='loginNo'value='s'/>"
		    emparr+="<input type='text' name='loginId' placeholder='학번을 입력해주세요' class='form-control input-md'>";
		    emparr+="<input type='password' name=loginPwd placeholder='비밀번호를 입력해주세요' class='form-control input-md input_pwd'>";
		    emparr+="<div class='spacing'>";
		    emparr+="<a href='#'>학번 / 비밀번호 찾기 </a><br/></div>";
		    emparr+="<label><input type='checkbox' name='idSave' /><small>아이디 저장</small></label>";
		    emparr+="<input type='submit' class='btn btn-info btn-sm pull-right' value='로그인'>";
		    emparr+="<button type='button' id='adm_btn' class='btn btn-info btn-sm pull-right adm_btn' onclick='enrollStudent();'>입학신청</button></form>"
			$(".panel-heading").html("<h3 class='panel-title'>학생 로그인</h3>");
		    $(".col-md-7").html(emparr);
		    }
		});
	});
	$(".login_pro").click(function(){
		$(".login_pro").removeClass(".hvr-bounce-to-right");
		$(".login_pro").css("backgroundColor","#46b8ff");
		$(".login_stu").css("backgroundColor","#abdbff");
		$(".login_emp").css("backgroundColor","#abdbff");
		$.ajax({
		    success:function(){
		    emparr="<form class='form-horizontal' action='${path }/login.hd'>";
		    emparr+="<input type='hidden' name='loginNo'value='p'/>"
		    emparr+="<input type='text' name='loginId' placeholder='사번을 입력해주세요' class='form-control input-md'>";
		    emparr+="<input type='password' name=loginPwd placeholder='비밀번호를 입력해주세요' class='form-control input-md input_pwd'>";
		    emparr+="<div class='spacing'>";
		    emparr+="<a href='#'>사번 / 비밀번호 찾기 </a><br/></div>";
		    emparr+="<label><input type='checkbox' name='idSave' /><small>아이디 저장</small></label>";
		    emparr+="<input type='submit' class='btn btn-info btn-sm pull-right' value='로그인'></form>";
			$(".panel-heading").html("<h3 class='panel-title'>교수 로그인</h3>");
		    $(".col-md-7").html(emparr);
		    }
		});
	});
	$(".login_emp").click(function(){
		$(".login_emp").removeClass(".hvr-bounce-to-right");
		$(".login_emp").css("backgroundColor","#46b8ff");
		$(".login_stu").css("backgroundColor","#abdbff");
		$(".login_pro").css("backgroundColor","#abdbff");
		$.ajax({
		    success:function(){
		    emparr="<form class='form-horizontal' action='${path }/login.hd'>";
		    emparr+="<input type='hidden' name='loginNo'value='e'/>"
		    emparr+="<input type='text' name='loginId' placeholder='사번을 입력해주세요' class='form-control input-md'>";
		    emparr+="<input type='password' name=loginPwd placeholder='비밀번호를 입력해주세요' class='form-control input-md input_pwd'>";
		    emparr+="<div class='spacing'>";
		    emparr+="<a href='#'>사번 / 비밀번호 찾기 </a><br/></div>";
		    emparr+="<label><input type='checkbox' name='idSave' /><small>아이디 저장</small></label>";
		    emparr+="<input type='submit' class='btn btn-info btn-sm pull-right' value='로그인'></form>";
			$(".panel-heading").html("<h3 class='panel-title'>교직원 로그인</h3>");
		    $(".col-md-7").html(emparr);
		    }
		});
	});
});


</script>

<style>
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
		
	
</style>

<body>
	<div class="middlePage">
		<div class="page-header">
			<h3 class="logo">
				안녕하세요 서울대학교 종합정보 시스템입니다.
			</h3>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">학생 로그인</h3>
			</div>
			<div class="panel-body" id="12">
				<div class="row">
					<div class="col-md-5">
						<div class="login_stu hvr-bounce-to-right">
							<p>학생</p>
						</div>
						<div class="login_pro hvr-bounce-to-right">
							<p>교수</p>
						</div>
						<div class="login_emp hvr-bounce-to-right">
							<p>교직원</p>
						</div>
					</div>
					<div class="col-md-7" style="border-left: 1px solid #ccc; height: 160px">
					
						<form class="form-horizontal" action="${path }/login.hd">
							<input type="hidden" name="loginNo" value="s"/>
							<input type="text" name="loginId" placeholder="학번을 입력해주세요" class="form-control input-md">
							<input type="password" name="loginPwd" placeholder="비밀번호를 입력해주세요" class="form-control input-md input_pwd">
							<div class="spacing">
								<a href="#">학번 / 비밀번호 찾기</a> <br />
							</div>
							<label>
								<input type="checkbox" name="checkboxes" id="checkboxes-0" value="1" /> 
								<small>아이디 저장</small>
							</label>
							<input type="submit" class="btn btn-info btn-sm pull-right" value="로그인"/>
							<button type="button" id="adm_btn" class="btn btn-info btn-sm pull-right adm_btn" onclick="enrollStudent();">입학신청</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 모달창  -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<form action="${path}/beforeStudent/enroll.hd" method="POST">
			<span class="close">&times;</span>
			<p>입학 신청</p>
			<div class="form-group">
			<hr>
				<label class="control-label">이름</label>
					<input type="text" id="beforeName" name="beforeName" placeholder="이름 을 입력하세요" class="form-control" required />
			<hr>
			<label class="control-label">입학 유형</label>
			<select class="form-control" name="beforeType">				<option value="정시" class="enrollType" >정시</option>
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
			<input type="button"  class="btn btn-info btn_close" value="취소" style="float: right; margin: 7px;">
			<input type="submit" class="btn btn-info" id="enrollBtn" value="입학 신청" style="float: right; margin: 7px;">
			<br>
			<br>
		</form>
		</div>
	</div>	
	
	
	
	
</body>

<script>


	// 입학 신청 완료할때 유효성 검사해야함 함수 쓰기
$(function(){
	$('#enrollBtn').click(function() {

		//이름
		let name = $("#beforeName").val();
		if(name == null || name == '') {
			alert("이름을 입력해 주세요.");
		}
		
		
    // //전화번호 정규표현식
    let regPhone = /^\d{3}\d{3,4}\d{4}$/;
    
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

			let checkEmail = $('.flagEmail').val();
			if(checkEmail == 'false') {
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
			let beforeAddr = "<input type='hidden' name='beforeAddr' value='"+postCode+" / "+addrCode+" / "+detailAddr+"'/>"; 
			document.getElementsByClassName("inputAddress")[0].innerHTML += beforeAddr;
	        
            

	})
});




function setJumin(obj) {
	let ju = obj.value;
	if(ju.indexOf("*") == -1) {
	document.getElementById('beforeNo').value = ju;
	}
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
   $(".modal").css("display","block");
   
   $.ajax({
	   url : "<c:url value='/email.do'/>",
		success : function(data) {

	 $('input[name=random1]').attr('value',data.random); 
		}
   });
}

$(function(){
	$(".btn_close").click(function(){
		$(".modal").css("display","none");
	});
});

$(function(){
	$(".close").click(function(){
		$(".modal").css("display","none");
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
	/*이메일 인증 버튼 클릭시 발생하는 이벤트	*/
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
						// 인증 완료후 다시 입력한 이메일을 readOnly로 띄워서 확인할수 있게 함
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