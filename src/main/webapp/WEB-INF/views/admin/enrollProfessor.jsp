<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>



		<div class="main-panel">
   		<div class="content-wrapper">
<div class="card">
	<div class="card-body">
	<div class="row">
	<div class="col-md-6">
		<select class="form-control selectCol col-sm-5" style="display: inline-block; margin-right: 5px;" name ='beforeColCode'>								
			</select>
			<!-- 여기에 학과 선택 넣어야함 .selectCol -->
			<select class="form-control selectdep col-sm-5"  style="display: inline-block; margin-left: 5px;" name='beforeDeptCode' required>
				</select>
			</div>
			</div>
			<div class="row">	
					<div class="table-responsive">		
				<table class="table">
					<tr>
						<!-- <th>번 호</th> -->
						<th>학과 명</th>
						<th>교수 번호</th>
						<th>교수 이름</th>
						<th>전화 번호</th>
						<th>이메일</th>
						<th> 주소</th>
						<th><input type="button" class="btn btn-outline-success btn-fw" onclick="insertNewProf();" value="등록"/></th>
					</tr>
			<c:forEach var="pro" items="${list}" varStatus="v">
						
					<tr class="listFor">
						<!-- <td>${v.count}</td> -->
						<td>${pro['DEPT_NAME'] }</td>
						<td>${pro['PROF_ID'] }</td>
						<td>${pro['PROF_NAME']}</td>
						<td>${pro['PHONE'] }</td>
						<td>${pro['EMAIL'] }</td>
						<td>${pro['ADDRESS'] }</td>
						<td>
					<input type="button" class="btn btn-outline-danger btn-fw" onclick="deleteProf('${pro['PROF_ID']}');" value="삭제"/>
				</td>					
			</tr>
		</c:forEach>
	</table>
	
	</div>
	</div>
	<div class="card-footer">
			${pageBar }
		</div>
	</div>
</div>



<div id="myModal" class="modal">
		<div class="modal-content">
			<form action="${path}/professor/insertProf.hd" method="POST">
			<span class="close">&times;</span>
			<p>교수 등록</p>
			<div class="form-group">
			<hr>
				<label class="control-label">이름</label>
				<input type="text" id="profName" name="profName" placeholder="이름 을 입력하세요" class="form-control" required />

			<label class="control-label">연락처</label>
					<input type="tel" id="phone" name="phone" placeholder=" '-' 제외 입력" autocomplete=off class="form-control" />
					<br>
					<label class="control-label">E-mail</label>					
					<div class="emailCheck">
					<input type="email" id="email" name="email" placeholder="이메일을 입력하세요" class="form-control" required >
					</div>
	
					<br>
			
				
			<label class="control-label">학과 코드</label>				
				
						
						<select class="form-control selectColModal" name ='colCode'>								
						</select>
						<!-- 여기에 학과 선택 넣어야함 .selectCol -->
						<select class="form-control selectdepModal"  name='deptCode' readonly>
						</select>
						<br>
						<label class="control-label">주민 등록 번호</label>	
						<input type="text" id="jumin" name="jumin" placeholder="주민등록번호 13자리를 입력하세요" class="form-control" onblur="setJumin(this)" />
					<input type="hidden" id="profSsn" value="" name="profSsn">
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
						<input type='hidden' name='address' id='addr'/> 
					</div>
			</fieldset>
	
	
			</div>
			<input type="button"  class="btn btn-info btn_close" value="취소" style="float: right; margin: 7px;">
			<input type="submit" class="btn btn-info" id="enrollBtn" value="등록" style="float: right; margin: 7px;">
			<br>
			<br>
		</form>
		</div>
	</div>	
	



<script>


$(function() {
	$('#enrollBtn').click(function() {
		//이름
		let name = $("#profName").val();
		if(name == null || name == '') {
			alert("이름을 입력해 주세요.");
		}
		
		
    // //전화번호 정규표현식
	let regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
    // let regPhone = /^\d{3}\d{3,4}\d{4}$/;
    
 	let phone = $('#phone');
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

            let postCode = $('#sample6_postcode').val();
            let addrCode = $("#sample6_address").val();
            let detailAddr = $("#sample6_detailAddress").val();
			$('#addr').val(postCode + " / " + addrCode + " / " + detailAddr);
	});
});





function setJumin(obj) {
	let ju = obj.value;
	if(ju.indexOf("*") == -1) {
		 $("#profSsn").val(ju);
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





function insertNewProf() {
   $("#myModal").css("display","block");

}

function deleteProf(result) {
	location.href="${pageContext.request.contextPath}/deleteEmployee.hd?num="+result+"";
}

$(function(){
	$(".btn_close").click(function(){
		$("#myModal").css("display","none");
	});
});

$(function(){
	$(".close").click(function(){
		$("#myModal").css("display","none");
	});
});

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
	


$(function() {
	$(document).ready(function(){

		$.ajax({
			type : "post",
			url: "${pageContext.request.contextPath}/selectColList.do",
			success: function(data) {
				let colListHtml = "";
				let colListHtmlModal = "";
				
				colListHtml = "<option value='select' id='selCol'>대학 선택</option>";
				for(let i = 0; i < data.list.length; i++) {
					let cols = data.list[i];
					colListHtml += "<option value='"+cols['COL_CODE']+"'  class='colList'>"+cols['COL_NAME']+"</option>";
					colListHtmlModal += "<option value='"+cols['COL_CODE']+"'  class='colListModal'>"+cols['COL_NAME']+"</option>";
				}
				 	
				$('.selectCol').html(colListHtml);
					$('.selectCol').change(function(){
						$('.titleCol').val($('.selectCol').val());
					$("#selCol").attr('disabled',true);
			
	}),
					$('.selectColModal').html(colListHtmlModal);
					$('.selectColModal').change(function(){
						$('.titleCol').val($('.selectColModal').val());
					$("#selColModal").attr('disabled',true);
			
			
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
					chahgeProf();
		});
 	}
 });
	 });
 });


 			function chahgeProf() {
						location.href="${pageContext.request.contextPath}/changeProfessor.hd?deptCode="+$('.selectdep').val()+"";
			 }



			 $(function(){
 	$('.selectColModal').change(function(){
 		let val = $('.selectColModal').val();
		$.ajax({
			type : "post",
			url: "${pageContext.request.contextPath}/selectDeptList.do",
			data: {"result" : $('.selectColModal').val()},
			success: function(data) {
				let deptListHtml = "<option value='select' id='selDeptModal'>학과 선택</option>";
				for(let i = 0; i < data.list.length; i++) {
					let depts = data.list[i];

					deptListHtml += "<option value='"+depts['DEPT_CODE']+"'  class='deptList'>"+depts['DEPT_NAME']+"</option>";
				}
				
				$('.selectdepModal').html(deptListHtml);
					$('.selectdepModal').change(function(){
					$("#selDeptModal").attr('disabled',true);
		});
 	}
 });
	 });
 });



</script>
	

<style>

	.listFor > td {
		font-size: 13px;
		
	}
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

	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>