<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<script src="${path }/resources/js/jquery-3.4.1.min.js"></script>
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
  <!-- endinject -->
  <link rel="shortcut icon" href="${path }/resources/assets/images/favicon.png" />
</head>
<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="index.html"><img src="${path }/resources/assets/images/logo.svg" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="index.html"><img src="${path }/resources/assets/images/logo-mini.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="ti-view-list"></span>
        </button>
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
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown mr-1">
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
          </li>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img src="${path }/resources/assets/images/faces/face28.jpg" alt="profile"/>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item">
                <i class="ti-settings text-primary"></i>
                Settings
              </a>
              <a class="dropdown-item">
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
    
    <!-- 메뉴바 설정 시작 -->
    
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="index.html">
              <i class="ti-shield menu-icon"></i>
              <span class="menu-title">Main</span>
            </a>
          </li>
        
        
        <!-- 강의정보 -->
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#class_info" aria-expanded="false" aria-controls="ui-basic">
              <i class="ti-palette menu-icon"></i>
              <span class="menu-title">강의정보</span>
              <i class="menu-arrow"></i>
            </a>
            
            
            <div class="collapse" id="class_info">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/professor/insertSubject"">개설과목입력</a></li>
                <li class="nav-item"> <a class="nav-link" href="javascript:popupSubject()">개설과목조회</a></li>
             <script>
            function popupSubject(){
            	var url="${pageContext.request.contextPath }/professor/subjectView";
            	var name="subject";
            	var option="width=660,height=635,top=50,left=400,resizable=no";
            	window.open(url,name,option);
            }
            </script>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/professor/lecturePlan"">강의계획서</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">주별강의계획서</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/professor/lectureData">강의자료업로드</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">강의내역</a></li>
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/professor/profSchedule">담당교수별 강의시간표</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">결/보강 신청</a></li>
              </ul>
            </div>
          </li>
          
          <!-- 학생정보 -->
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#stu_info" aria-expanded="false" aria-controls="auth">
              <i class="ti-user menu-icon"></i>
              <span class="menu-title">학생정보</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="stu_info">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="#">학과생 조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">수강생 조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">수강생 출결관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">수강생 성적관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">강의 평가 조회</a></li>
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
                <li class="nav-item"> <a class="nav-link" href="${pageContext.request.contextPath }/professor/professorView">교수정보 조회</a></li>
              </ul>
            </div>
          </li>
          
          
          
        <!-- 이의신청 처리 -->
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#appeal" aria-expanded="false" aria-controls="auth">
              <i class="ti-user menu-icon"></i>
              <span class="menu-title">이의신청 처리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="appeal">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="#">성적 이의신청 조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="#">처리 결과 조회</a></li>
              </ul>
            </div>
          </li>
          
          
          
          
           <li class="nav-item">
            <a class="nav-link" href="pages/forms/basic_elements.html">
              <i class="ti-layout-list-post menu-icon"></i>
              <span class="menu-title">단일 메뉴바</span>
            </a>
          </li>
          <hr style="color : black"/>
          <li class="nav-item">
            <a class="nav-link" href="documentation/documentation.html">
              <i class="ti-write menu-icon"></i>
              <span class="menu-title">Documentation</span>
            </a>
          </li>
        </ul>
      </nav>