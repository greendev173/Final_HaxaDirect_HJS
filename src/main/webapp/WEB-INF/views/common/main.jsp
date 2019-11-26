<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
	<link  rel='stylesheet'  href='${path}/resources/css/fullcalendar.css'  />  
	<link  rel='stylesheet'  href='${path}/resources/css/daygrid.css'  />  
	<link  rel='stylesheet'  href='${path}/resources/css/timegrid.css'  />  
	<script src='${path}/resources/js/moment.min.js'></script>  
	<script src='${path}/resources/js/fullcalendar.min.js'></script>
	<script src='${path}/resources/js/interaction.js'></script>
	<script src='${path}/resources/js/daygrid.js'></script>
	<script src='${path}/resources/js/timegrid.js'></script>
	<script src='${path}/resources/js/ko.js'></script>
<jsp:include page="header.jsp" />

            
 
  <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
    	  var Calendar = FullCalendar.Calendar;
    	  // var Draggable = FullCalendarInteraction.Draggable;
    	 
    	  var containerEl = document.getElementById('external-events');
    	  var calendarEl = document.getElementById('calendar');
    	  var checkbox = document.getElementById('drop-remove');


        
        
        var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: ['interaction', 'dayGrid', 'timeGrid'],
        defaultView: 'dayGridMonth',
        defaultDate: new Date(),
        header: {
            left: 'prev,next today',
            center: 'title',
            right: ''
        },
         editable: true,
          locale: 'ko',

    });//calendar종료
 $(function(){
    calendar.render();
    $.ajax({
            url: '${pageContext.request.contextPath}/getCalendar.hd',
            type: 'post',
            //인포 찾기
            data: {"start": moment(new Date(calendar.state.dateProfile.activeRange.start)).format('YYYY-01-01'),
                   "end": moment(new Date(calendar.state.dateProfile.activeRange.end)).add(1,'year').format('YYYY-03-01')},
            success: function(data) {
              if(data != null) {
                  $.each(data, function(key, items) {
                    $.each(items,function(index, item) {
                      let depCode = "${sessionScope.loginMember.deptCode }";
                      let flag = moment(new Date()).format('YYYY-MM-DD') > moment(new Date(item['enDate'])).format('YYYY-MM-DD')?'rgba(0, 0, 0, 0.2)':depCode == item['deptCode']?"rgba(235, 160, 160, 0.3)":"rgba(104, 175, 255, 0.2)";
                      let title = depCode == item['deptCode']?item['planName']:item['deptCode'].substring(0,1) == '0'?"[대학 일정] " + item['planName']: "[" +item['deptName'] +"] " + item['planName'];
                      let end = moment(new Date(item['stDate'])).format('YYYY-MM-DD') == moment(new Date(item['enDate'])).format('YYYY-MM-DD')?moment(new Date(item['enDate'])).format('YYYY-MM-DD'):moment(new Date(item['enDate'])).add(1,'day').format('YYYY-MM-DD');
                          let setData = {
                              "title" : title,
                              "start" : moment(new Date(item['stDate'])).format('YYYY-MM-DD'),
                              "end" : end,
                              "groupId":item['deptCode'],
                              "color" : flag
                          };
                          calendar.addEvent(setData);
                    })
                  }) 
              }
            },
            error: function(jqXHR, textStatus, errorThrown)
            {
            }
        });
   
      });
        });  

     
</script>
<style>
 
  html, body {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
 
  #external-events {
    position: fixed;
    /* z-index: 2; */
    top: 300px;
    left: 240px;
    width: 150px;
    padding: 0 10px;
    border: 1px solid #ccc;
    background: #eee;
  }
 
  .demo-topbar + #external-events { /* will get stripped out */
    top: 60px;
  }
 
  #external-events .fc-event {
    margin: 1em 0;
    cursor: move;
  }
 
  #calendar-container {
    position: relative;
    /* z-index: 1; */
    margin-left: 200px;
  }
 
  #calendar {
    max-width: 900px;
    margin: 20px auto;
  }

  /* 여기부터 모달 */
  #wrap {
  width: 1100px;
  margin: 0 auto;
}


/* input {
  width: 50%;
} */

input[type="text"][readonly] {
  border: 2px solid rgba(0, 0, 0, 0);
}

/*info btn*//* 
.dropbtn {
  background-color: #4CAF50;
  background-color: #eee;
  margin: 10px;
  padding: 8px 16px 8px 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  left: 50%;
  background-color: #f1f1f1;
  min-width: 200px;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  z-index: 5;
  margin-left: 100px;
  margin-top: -300px;
}


.dropdown-content p {
  color: black;
  padding: 4px 4px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}

.dropdown:hover .dropbtn {
  background-color: grey;
}

.dropdown:hover .dropbtn span {
  color: white;
} */
/* 
.modal-content {
  display: none;
  position: absolute !important;
  width: 400px !important;
  top: -700px !important;
  left: 11.5% !important;
  z-index: 9999 !important;
}

.form-control{
  display: inline-block !important;
  width: 250px !important;
  /* float: left; */
} */

.col-xs-4 {
  margin-left: 25px;
  width: 80px;
}

/* closrCal */
.closeCal {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            border-radius: 5px;
            position: absolute;
            top: 5%;
            right: 5%;
        }
        .closeCal:hover,
        .closeCal:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        
       th,td{
       	text-align:center;
       }
       
       

</style>

		<div class="main-panel">
      <div class="content-wrapper">
      <!-- <div class="row">
              		<div class="col-lg-4 grid-margin stretch-card">
				 <div class="card card-body">
				        	<button type="button" class="btn btn-outline-danger btn-icon-text" style="font-size:15px">
                          <i class="ti-tag btn-icon-prepend" style="font-size:15px"></i>                                                    
                          취업률 1위
                        </button>
                    </div>
                 </div>   
                    <div class="col-lg-4 grid-margin stretch-card">
                 <div class="card card-body">
                        <button type="button" class="btn btn-outline-primary btn-icon-text"  style="font-size:15px">
                          대학평가 1위
                          <i class="ti-medall-alt btn-icon-append"  style="font-size:15px"></i>                                                                              
                        </button>
                        </div>
                 </div>   
                    <div class="col-lg-4 grid-margin stretch-card">
                 <div class="card card-body">
                        <button type="button" class="btn btn-outline-success btn-icon-text" style="font-size:15px">
                          교수평가 1위
                          <i class="ti-medall btn-icon-append" style="font-size:15px"></i>                                                                              
                        </button>
			        </div>
				</div>
	</div> -->
      <div class="row">
        <div class="col-lg-6 grid-margin stretch-card">
        <div class='card card-body'>
          <h4 class="card-title">KH University</h4>
                  <p class="card-description">
                    일정 안내 <code>-</code>
                  </p>
         
    <!-- 이건 행사 신청을 위한 drop event 
      <div id="external-events">
        <p>
          <strong>Draggable Events</strong>
        </p>
        신청한 이벤트들 for문으로 집어 넣기 
    <div class="fc-event">My Event 1</div>
    <input type='hidden' value = ''>
    <div class="fc-event">My Event 2</div>
    <div class="fc-event">My Event 3</div>
    <div class="fc-event">My Event 4</div>
    <p>
      <input type="checkbox" id="drop-remove">
      <label for="drop-remove">remove after drop</label>
    </p>
  </div> -->
<div id='calendar'></div>
</div></div>

<div id='calendar'></div>

<!-- 도움말 설정하는 div 
<div class="dropdown">
  <div class="dropdown-content">
    <p>Click a calendar date to invoke a Bootstrap Modal Box.</p>
    <p>Add event title/description, start date, and end date.</p>
    <p>Click "Save" to save event.</p>
    <p>Click event again to re-open in Bootstrap Modal Box (Event is non-editable).
      <p>
        <p>Click "x" to delete event.</p>
  </div>
  <button class="fa dropbtn" style="font-size:24px; margin-left: 75%; color: black"><span>&#xf128;</span></button>
</div> -->

<div id='datepicker'></div>

			
			
			
				<div class="col-lg-6 grid-margin stretch-card">
				<div class='card card-body'>
                  <h4 class="card-title">KH University</h4>
                  <p class="card-description">
                    공지 게시판 <code>-</code>
                  </p>
                  <div class="table-responsive"  style="overflow-y:hidden;">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>번호</th>
                          <th>제목</th>
                          <th>날짜</th>
                          <th>조회수</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="l" items="${list}">
                        <tr onclick='location.href="/notice/viewContent.hd?boardNo=${l.boardNo}"'>
                         	<td style="width:10%;">${l.boardNo }</td>
	                        <td style="width:60%;">${l.boardTitle}</td>
	                        <td style="width:20%;">${l.regDate }</td>
	                        <td style="width:10%;">${l.hitCount }</td>
                        </tr>
                       </c:forEach>
                        
                      </tbody>
                    </table>
                    ${pageBar }
                  </div>
                </div>
              </div>
			</div>
			
			<style>
				h2{
			       	font-size:20px;
			       }
			
			</style>


			<jsp:include page="footer.jsp" />