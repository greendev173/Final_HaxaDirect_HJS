<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>

<div class="main-panel">
        <div class="content-wrapper">
        
         <div class="container">
          <div class="row">
            <div class="col">
                <ul class="nav nav-tabs">
                  <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab">학생</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="tab">교수</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="tab">교직원</a>
                  </li>
                </ul>
                
                <div class="tab-content tab-pane fade show">
                  <div class="card">
                    <div class="card-body">
                      <div class="nav-item nav-search d-none d-lg-block">
                          <div class="input-group as">
                            <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                              <span class="input-group-text" id="search">
                              <i class="ti-search" onclick="getSearchData();"></i>
                              </span>
                            </div>
                            <input type="text" class="form-control" id="searchStu" placeholder="학번 / 이름으로 검색" aria-label="search" aria-describedby="search">
                          </div>
                        </div>	
                      <div class="table-responsive">
                          <!-- <input type="button" onclick="fn_search($('eveIndex').val());" value="검색"/> -->
                        <table class="table table-hover">
                          <thead>
                            <tr>
                              <th>학과</th>
                              <th>개인 번호</th>
                              <th> 이름</th>
                              <th>전화 번호</th>
                              <th>이메일</th>
                              <th> 주소</th>
                                  </tr>
                          </thead>
                          <tbody id="tbody">
                
                        </tbody>
                        </table>
                        <div id="pageConainer">

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                
    
            </div>
          </div>
        </div>
                   


<script>

  $("#searchStu").keyup(function(e){if(e.keyCode == 13)  getSearchData(); });

     $(function(){
            	   $(".nav-tabs>li").first().trigger("click");
               })
               
	             $(".nav-tabs>li").on("click",function(){ 
	             ajaxData($(this).index());  
	             });

     function ajaxData(index,cPage){
	               $.ajax({
	          		 url:'${path}/col/changeColList.hd',
	          		 data:{'index': index,'cPage':cPage},
	          		 success:function(data){
                         var arr="";
	          			 for(var i=0;i<data['list'].length;i++){
	          				 arr+="<tr class='memList'>";
	          				 arr+="<td>" + data['list'][i].DEPT_NAME +"</td>";
	          				 arr+="<td>" + data['list'][i].PROF_ID +"<input type='hidden' value='"+ data['list'][i].PROF_ID +"' class='num'/></td>";
	          				 arr+="<td>" + data['list'][i].PROF_NAME +"</td>";
	          				 arr+="<td>" + data['list'][i].PHONE +"</td>";
	          				 arr+="<td>" + data['list'][i].EMAIL +"</td>";
	          				 arr+="<td>" + data['list'][i].ADDRESS +"</td></tr>";
	          			 }
                     arr+="<input type='hidden' id='eveIndex' value='"+index+"'/>";
                     $('#searchStu').val("");
                         $("#tbody").html(arr);
	          			 $("#pageConainer").html(data['pageBar']);

	          		 }
	          	 	});
               };
  
       function getSearchData() {
          let search = $('#searchStu').val().toUpperCase();
          let index = $('#eveIndex').val();
          $.ajax({
            type:'post',
            url:"${path}/col/searchColList.hd",
            data:{'search':search, "index": index},
            success: function(data){
              let profList = "";
              for(let i = 0; i < data['list'].length; i++) {

              profList += "<tr><td class='mName'>"+data['list'][i].DEPT_NAME+"</td><td class='mId'>"+data['list'][i].PROF_ID+"</td><td>"+data['list'][i].PROF_NAME+"</td>";
              profList += "<td>"+data['list'][i].PHONE+"</td><td>"+data['list'][i].EMAIL+"</td><td>"+data['list'][i].ADDRESS+"</td>";
              profList += "<td><input type='button' class='btn btn-outline-success btn-fw' onclick='detailProf("+data['list'][i].PROF_ID+");' value='상세 정보'/></td>";				
              profList += "</tr>";
              }
              profList+="<input type='hidden' id='eveIndex' value='"+index+"'/>";

              $('#tbody').html(profList);
              $('#pageConainer').html(data['pageBar']);
             }
          })
        };
       

          function getSearchListA(index, pageNo) {
          let search = $('#searchStu').val().toUpperCase();
          $.ajax({
              type:'post',
              url:"${path}/col/searchColList.hd",
              data:{'search':search,'index':index,
                  'cPage':pageNo},
              success: function(data){
                let profList = "";
                for(let i = 0; i < data['list'].length; i++) {

                profList += "<tr><td class='mName'>"+data['list'][i].DEPT_NAME+"</td><td class='mId'>"+data['list'][i].PROF_ID+"</td><td>"+data['list'][i].PROF_NAME+"</td>";
                profList += "<td>"+data['list'][i].PHONE+"</td><td>"+data['list'][i].EMAIL+"</td><td>"+data['list'][i].ADDRESS+"</td>";
                profList += "<td><input type='button' class='btn btn-outline-success btn-fw' onclick='detailProf("+data['list'][i].PROF_ID+");' value='상세 정보'/></td>";				
                profList += '</tr>';
                }
                profList+="<input type='hidden' id='eveIndex' value='"+index+"'/>";

                $('#tbody').html(profList);
                $('#pageConainer').html(data['pageBar']);
              }
            })
        }

</script>

<style>
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
            
        ul.tabs{
        margin: 0px;
        padding: 0px;
        list-style: none;
        }
        ul.tabs li{
        background: none;
        color: #222;
        display: inline-block;
        padding: 10px 15px;
        cursor: pointer;
        }
        
        ul.tabs li.current{
        background: #ededed;
        color: #222;
        }
        
        .tab-content{
        
        background: #ededed;
        padding: 15px;
        }
        
        .tab-content.current{
        display: inherit;
        }

</style>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>