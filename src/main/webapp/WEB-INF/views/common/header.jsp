<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page import="com.kh.finalProject.student.model.vo.Student" %>
<%@ page import="com.kh.finalProject.employee.model.vo.Employee" %>
<%@ page import="com.kh.finalProject.professor.model.vo.Professor" %>
<!DOCTYPE html>
<html lang="en">
<% if(session.getAttribute("loginMember") instanceof Professor){%>
<c:set var="userId" value="${loginMember.profId }"/>
<%} else if(session.getAttribute("loginMember") instanceof Student){%>
<c:set var="userId" value="${loginMember.stuNo }"/>
<%} else if(session.getAttribute("loginMember") instanceof Employee){%> 
<c:set var="userId" value="${loginMember.empId }"/>
<%} %>
<style>
	.content-wrapper, .footer{
		background-color:#e9ecef !important;
	}
</style>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Haxa Direct</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${path }/resources/assets/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${path }/resources/assets/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${path }/resources/assets/css/style.css">
  <link rel="stylesheet" href="${path }/resources/css/modal.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${path }/resources/assets/images/favicon.png" />
  
  <script src="${path }/resources/js/jquery-3.4.1.min.js"></script>
  
    <!-- 웹소켓 js파일 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"></script>
  <style>
  	.sidebar{
  		width:180px;
  	}
  	.nav-link{
  		font-size:13px !important;
  	}
  </style>
  
</head>
<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
      <%--  <a class="navbar-brand brand-logo mr-5" href="${path }/main.hd"><img src="${path }/resources/images/image/khlogo.png" class="mr-2" alt="logo"/></a>--%>
        <a class="navbar-brand brand-logo-mini" href="${path }/main.hd"><img src="${path }/resources/images/image/khminilogo.png" style="height:60%;" alt="logo"/></a> 
        <a class="navbar-brand brand-logo mr-5" href="${path }/main.hd"><img src="${path }/resources/images/image/khlogo.jpg" style="width:70%; height:53%;"/></a> 
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <a class="navbar-toggler navbar-toggler align-self-center" data-toggle="minimize">
          <!-- <span class="ti-view-list"></span> -->
          <i class="ti-menu-alt" style="font-size:25px; margin-left:-35px; color:#185c9c"></i>
        </a>
        <!-- 헤더 검색창
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
            <div class="input-group">
              <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                <span class="input-group-text" id="search">
                  <i class="ti-search"></i>
                </span>
              </div>
              <input type="text" class="form-control" id="navbar-search-input" placeholder="Search now" aria-label="search" aria-describedby="search">
            </div>
            </li>
        </ul>
         -->
        <ul class="navbar-nav navbar-nav-right">
        
        <li class="nav-item dropdown mr-1">
           <button id="reqBtn" class="btn btn-inverse-info btn-fw">
               	건의 등록
            </button>
        </li>
        
        <li class="nav-item dropdown mr-1">
           <button id="" class="btn btn-inverse-info btn-fw" onclick="location.href='${path}/reqAnswer.hd?userId=${userId }'" >
               	건의/답변 내역
            </button>
        </li>
        <li class="nav-item dropdown mr-1"></li>
          <%-- <li class="nav-item dropdown mr-1">
            <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" id="messageDropdown" href="#" data-toggle="dropdown">
              <i class="ti-email mx-0"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="messageDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Messages</p>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                    <img src="${path }/resources/assets/images/faces/face4.jpg" alt="image" class="profile-pic">
                </div>
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal">David Grey
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    The meeting is cancelled
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                    <img src="${path }/resources/assets/images/faces/face2.jpg" alt="image" class="profile-pic">
                </div>
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal">Tim Cook
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    New product launch
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                    <img src="${path }/resources/assets/images/faces/face3.jpg" alt="image" class="profile-pic">
                </div>
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal"> Johnson
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    Upcoming board meeting
                  </p>
                </div>
              </a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
              <i class="ti-bell mx-0"></i>
              <span class="count"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="notificationDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                  <div class="item-icon bg-success">
                    <i class="ti-info-alt mx-0"></i>
                  </div>
                </div>
                <div class="item-content">
                  <h6 class="font-weight-normal">Application Error</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    Just now
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                  <div class="item-icon bg-warning">
                    <i class="ti-settings mx-0"></i>
                  </div>
                </div>
                <div class="item-content">
                  <h6 class="font-weight-normal">Settings</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    Private message
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                  <div class="item-icon bg-info">
                    <i class="ti-user mx-0"></i>
                  </div>
                </div>
                <div class="item-content">
                  <h6 class="font-weight-normal">New user registration</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    2 days ago
                  </p>
                </div>
              </a>
            </div>
          </li> --%>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img src="${path }/resources/assets/images/faces/face28.jpg" alt="profile"/>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <!-- <a class="dropdown-item">
                <i class="ti-settings text-primary"></i>
                Settings
              </a> -->
              <a class="dropdown-item" href="${path }/login">
                <i class="ti-settings text-primary"></i>
                Login
              </a>
              <a class="dropdown-item" href="${path }/logout.hd">
                <i class="ti-power-off text-primary"></i>
                Logout
              </a>
            </div>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="ti-view-list"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas sidebar1" id="sidebar">
        <ul class="nav">
        <% if(session.getAttribute("loginMember") instanceof Professor){%>
            <div class="sidebar-heading">
             교수
         </div>
            <!-- 강의정보 -->
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#class_info" aria-expanded="false" aria-controls="ui-basic">
              <i class="ti-palette menu-icon"></i>
              <span class="menu-title">강의정보</span>
              <i class="menu-arrow"></i>
            </a>
            
            
            <div class="collapse" id="class_info">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/professor/insertSubject">개설과목 입력</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/professor/lecturePlan">강의 계획서</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/professor/lectureData">강의자료 업로드</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/professor/profPlanResult">강의내역</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/professor/deptProfSchedule?deptCode=${loginMember.deptCode}">학과별 강의시간표</a></li>
              </ul>
            </div>
          </li>
          <script>
            function popupSubject(){
               var url="${pageContext.request.contextPath }/professor/subjectView";
               var name="subject";
               var option="width=660,height=635,top=50,left=400,resizable=no";
               window.open(url,name,option);
            }
          </script>
          
          <!-- 학생정보 -->
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#stu_info" aria-expanded="false" aria-controls="stu_info">
              <i class="ti-user menu-icon"></i>
              <span class="menu-title">학생정보</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="stu_info">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path }/prof/viewInMajor.hd">학과생 조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/prof/viewInClass.hd">수강생 조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/prof/viewClassAttend.hd">수강생 출결관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/prof/editClassPoint.hd">수강생 성적관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/prof/view_evaluation.hd">강의 평가 조회</a></li>
              </ul>
            </div>
          </li>
          
           <!-- 교수정보 -->
              <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#prof_info" aria-expanded="false" aria-controls="auth">
              <i class="ti-user menu-icon"></i>
              <span class="menu-title">교수정보</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="prof_info">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/professor/professorView?profId=${loginMember.profId}">교수정보 조회</a></li>
              </ul>
            </div>
          </li>
          
          
          
        <!-- 이의신청 처리 -->
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#appeal" aria-expanded="false" aria-controls="appeal">
              <i class="ti-user menu-icon"></i>
              <span class="menu-title">이의신청 처리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="appeal">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path }/prof/viewObjection.hd">성적 이의신청 조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/prof/resultObjection.hd">처리 결과 조회</a></li>
              </ul>
            </div>
          </li>
          
          
          
          
             <!-- 과제관리-->
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#assign" aria-expanded="false" aria-controls="assign">
              <i class="ti-user menu-icon"></i>
              <span class="menu-title">과제 관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="assign">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path }/prof/assignmentBoard.hd">과제 등록 게시판</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/prof/viewAssignment.hd">과제 제출현황 조회</a></li>
              </ul>
            </div>
          </li>
          <%} else if(session.getAttribute("loginMember") instanceof Student){%>
          <div class="sidebar-heading">
             학생
         </div>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic4" aria-expanded="false" aria-controls="ui-basic4">
              <i class="ti-layout-list-post menu-icon"></i>
              <span class="menu-title">학생 정보</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic4">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path}/student/studentInfo.hd">기본 정보</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
         <a class="nav-link" data-toggle="collapse" href="#ui-basic5" aria-expanded="false" aria-controls="ui-basic5">
              <i class="ti-layout-list-post menu-icon"></i>
              <span class="menu-title">성적 정보</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic5">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path }/student/gradeSearchAll.hd">전체 성적조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/student/gradeSearchNow.hd">현재학기 성적조회</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="ti-user menu-icon"></i>
              <span class="menu-title">수업 정보</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path }/student/applyClass.hd"> 강의조회/수강신청 </a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/student/myClassInfo.hd"> 수강신청 내역 </a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/student/mySchedule.hd"> 시간표 조회 </a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/student/classBoard.hd"> 강의게시판 </a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth1" aria-expanded="false" aria-controls="auth1">
              <i class="ti-write menu-icon"></i>
              <span class="menu-title">등록금 정보</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth1">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path }/student/tuitionBill.hd">등록금 고지서</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/student/tuitionCert.hd">등록금 납입 증명서</a></li>
              </ul>
            </div>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth2" aria-expanded="false" aria-controls="auth2">
              <i class="ti-write menu-icon"></i>
              <span class="menu-title">졸업 정보</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth2">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path }/student/myGraduation.hd">졸업인정 학점조회</a></li>
               </ul>
            </div>
          </li>
          <%} else if(session.getAttribute("loginMember") instanceof Employee){%>
          <div class="sidebar-heading">
             관리자
         </div>
         <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth5" aria-expanded="false" aria-controls="auth5">
              <i class="ti-write menu-icon"></i>
              <span class="menu-title">총괄 관리자</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth5">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path }/enrollStudent.hd">입학 관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/enrollprofessor.hd">교수 관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/enrollemployee.hd">직원 관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/reqList.hd">건의사항 관리</a></li>
               </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth3" aria-expanded="false" aria-controls="auth3">
              <i class="ti-write menu-icon"></i>
              <span class="menu-title">대학 관리자</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth3">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path}/schedule.hd">일정 관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/school.hd">대학 관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/col/colList.hd">전체 인원 조회</a></li>
                <!-- <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html">기자재</a></li> -->
                <li class="nav-item"> <a class="nav-link" href="${path }/tuition.hd">등록금 관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/curriculum.hd">커리큘럼 관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/subRoom.hd">강의장 사용현황</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/notice.hd">공지 게시판</a></li>
               </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth4" aria-expanded="false" aria-controls="auth4">
              <i class="ti-write menu-icon"></i>
              <span class="menu-title">학과 관리자</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth4">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path }/deptSchedule.hd">학과 일정</a></li>
				<!-- <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html">기자재 신청</a></li> -->
                <li class="nav-item"> <a class="nav-link" href="${path }/deptPro.hd">교수 조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/deptEmp.hd">교직원 조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/deptStu.hd">학생 조회</a></li>
               </ul>
            </div>
          </li>
        </ul>
        <%} %>
      </nav>
      
      <div id="reqModal" class="modal" style="z-index:9999">
 
      <!-- Modal content -->
      <div class="modal-content">
        <form action="${path}/req.hd">
         <span class="close" id="close">&times;</span>
         <p>건의사항</p>
         <div class="form-group">
         <hr>
         <label class="control-label">제목</label>
         <input type="text" id="reqTitle" name="reqTitle" placeholder="제목을 입력하세요" class="form-control" required />
         <hr>
         <input type="hidden" id="toName" name="toName" value="${userId }"/>
         <label class="control-label">받는사람</label>
         <input type="hidden" id="fromName" name="fromName" value="EA000000000"/>
         <input type="text" class="form-control" value="관리자" readonly/>
         
         <hr>
         <label class="control-label">내용</label>
         <textarea name="reqContents" cols="40" rows="8" class="form-control" placeholder="내용을 입력하세요" ></textarea>
         </div>
         <input type="button" class="btn btn-inverse-info btn-fw" id="close1" value="취소" style="float: right; margin: 7px;">
         <input type="submit" class="btn btn-inverse-info btn-fw" value="보내기" style="float: right; margin: 7px;">
         <br>
         <br>
      </form>
      </div>
 
    </div>
    
    <script>
     // Get the modal
        var headerModal = document.getElementById('reqModal');
 
        // Get the button that opens the modal
        var headerBtn = document.getElementById("reqBtn");
 
        // Get the <span> element that closes the modal
        var close = document.getElementById("close");                                          
        var close1 = document.getElementById("close1");  
        // When the user clicks on the button, open the modal 
        headerBtn.onclick = function() {
           headerModal.style.display = "block";
        }
 
        // When the user clicks on <span> (x), close the modal
        close.onclick = function() {
           headerModal.style.display = "none";
        }
        close1.onclick = function() {
           headerModal.style.display = "none";
        }
 
        // When the user clicks anywhere outside of the modal, close it
        /* window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        } */
        
        	

        </script>
      