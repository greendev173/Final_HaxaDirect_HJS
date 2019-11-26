<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
<style>
	.btnSize{
		width:30%;
		height:130%;
	}
	.modal-content{
		width:30%;
	}
	th, td{
		text-align:center;
	}
	/* .sul>div{
		float:left;
	} */
</style>
<div class="main-panel">
	<div class="content-wrapper">
			<div class="card">
                <div class="card-body">
					<br>
                 		<div class="row">
                 			<div class="col-sm-12" style="text-align:center">
	                  		<button class="btn btn-outline-dark btn-icon-text btnSize" id="colBtn">
	                          <i class="ti-settings btn-icon-prepend" style="font-size:18px;"></i>
	                          <span class="d-inline-block text-left" style="font-size:18px;">
	                            	학부 개설
	                          </span><br>
	                            <small class="font-weight-light d-block" style="margin-top:10px; font-size:14px">현재 개설 학부 : ${colCount }</small>
	                        </button>
	                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	                        <button class="btn btn-outline-dark btn-icon-text btnSize" id="deptBtn">
	                          <i class="ti-settings btn-icon-prepend" style="font-size:18px;"></i>
	                          <span class="d-inline-block text-left" style="font-size:18px;">
	                            	학과 개설
	                          </span>
	                            <small class="font-weight-light d-block" style="margin-top:10px; font-size:14px" >현재 개설 학과 : ${deptCount }</small>
	                        </button>
	                        </div>
                        </div>
                </div><br><br>
              </div>
            <br><br>
            
          
          <div class="row">
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">학부 조회</h4>
                  <div class="table-responsive" style="height:500px; overflow:auto">
                    <table class="table" style="border:0; cellspacing=0; cellpadding:0">
                      <thead>
                        <tr>
                       	  <th style="width:20%">번호</th>
                          <th style="width:40%">학부 명</th>
                          <th style="width:20%">학부명 수정</th>
                          <th style="width:20%">학부 폐설</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="c" items="${colList }" varStatus="v">
                        <tr class="colTr">
                          <td>${v.count }</td>
                          <form action="${path }/updateCol.hd">
                          <input type="hidden" value="${c.colCode }" class="hiCol" name="colCode"/>
                          <td><input type="text" value="${c.colName }" name="colName" class="form-control teCol" style="text-align: center;"/></td>
                          <td><input type="submit" class="btn btn-inverse-info btn-fw" value="수정"/></td>
                          </form>
                          <td><button class="btn btn-inverse-info btn-fw deleteCol">폐설</button></td>
                        </tr>
                       </c:forEach>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">학과 조회</h4>
                  			<select class="form-control selectColleage" id="tbCollege" name='colCode'>
                            </select><br>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
	                       <tr>
	                         <th style="width:20%">학부명</th>
	                         <th style="width:40%">학과명</th>
	                         <th style="width:20%">학과명 수정</th>
	                         <th style="width:20%">학과 폐설</th>
	                       </tr>
                      </thead>
                      <tbody id="tbody">
                       <c:forEach var="d" items="${deptList }" varStatus="v">
                        <tr>
                          <td>${d.COL_NAME }</td>
                          <form action="${path }/updateDept.hd">
                          <input type="hidden" value="${d.DEPT_CODE }" name="deptCode" class="hiDept" />
                          <td><input type="text" value="${d.DEPT_NAME }" name="deptName" class="form-control" style="text-align: center;"/></td>
                          <td><button class="btn btn-inverse-info btn-fw">수정</button></td>
                          </form>
                          <td><button class="btn btn-inverse-info btn-fw deleteDept">폐설</button></td>
                        </tr>
                       </c:forEach>
                      </tbody>
                    </table>
                    <div id="pageBar">
                     ${pageBar }
                    </div>
                  </div>
                </div>
              </div>
            </div>
              </div>
            
           <div id="colModal" class="modal">
 
		      <div class="modal-content">
		      	<form action="${path }/colInsert.hd">
				         <span class="close" id="colModalclose">&times;</span>
				         <p>학부개설</p>
				         <div class="form-group">
				         <input type="text" id="reqTitle" name="colName" placeholder="개설할 학부명을 입력해주세요" class="form-control" autocomplete="off"/>
				         </div>
				         <input type="button" class="btn btn-inverse-info btn-fw" id="colModalclose1" value="취소" style="float: right; margin: 7px;">
				         <input type="submit" class="btn btn-inverse-info btn-fw" value="저장" style="float: right; margin: 7px;">
				         <br>
				         <br>
		      	</form>	
		      </div>
		    </div>
   
		    
		    <div id="deptModal" class="modal">
 
		      <div class="modal-content">
		      	<form action="${path }/deptInsert.hd">
				         <span class="close" id="deptModalclose">&times;</span>
				         <p>학부개설</p>
				         <div class="form-group">
                            <select class="form-control selectColleage" name='colCode' required>
                            </select><br>
				         <input type="text" id="reqTitle" name="deptName" placeholder="개설할 학과명을 입력해주세요" class="form-control" autocomplete="off"/>
				         </div>
				         <input type="button" class="btn btn-inverse-info btn-fw" id="deptModalclose1" value="취소" style="float: right; margin: 7px;">
				         <input type="submit" class="btn btn-inverse-info btn-fw" value="저장" style="float: right; margin: 7px;">
				         <br>
				         <br>
		      	</form>	
		      </div>
		    </div>
		    
		    <script>
		    
		   
		    $(".deleteCol").click(function(){
		    		var con=confirm("폐설후 복구 불가합니다. 다시한번 확인해주세요.");
		    		var hiCol=$($(this).parent().siblings(".hiCol")).val();
		    		if(con==true){
		    			location.href='${path}/deleteCol.hd?colCode='+hiCol;	    			
		    		} 
		    });
		    
		    
		    $(function(){
	             $("#tbCollege").change(function(){
	                var tbCol=$("#tbCollege").val();
	                $.ajax({
	                   url:"${path}/selectColSerch.hd",
	                   data:{"colCode":tbCol},
	                   success: function(data){
	                      var colArr="";
	                      let re=JSON.parse(data);
	                      for(var i=0; i<re.length;i++){
	                         colArr+="<tr><td>"+re[i]["COL_NAME"]+"</td>";
	                         colArr+="<form action='${path }/updateDept.hd'>";
	                         colArr+="<input type='hidden' value='"+re[i]["DEPT_CODE"]+"' name='deptCode' class='hiDept' />";
	                         colArr+="<td><input type='text' value='"+re[i]["DEPT_NAME"]+"' name='deptName' class='form-control hiDeptName' style='text-align: center;'/></td>";
	                         colArr+="<td><button class='btn btn-inverse-info btn-fw updateDept'>수정</button></td>";
	                         colArr+="</form>";
	                         colArr+="<td><button class='btn btn-inverse-info btn-fw deleteDept'>폐설</button></td></tr>";
	                      }
	                      $("#tbody").html(colArr);
	                      $("#pageBar").html("");

	                      $(".updateDept").click(function(){
	                          var con=confirm("수정하시겠습니까?");
	                          var hiDept=$($(this).parent().siblings(".hiDept")).val();
	                          var hiDeptName=$($(this).parent().prev().children(".hiDeptName")).val();
	                          if(con==true){
	                             location.href='${path}/updateDept.hd?deptCode='+hiDept+'&deptName='+hiDeptName;    
	                          } 
	                       });

	                      $(".deleteDept").click(function(){
	                          var con=confirm("폐설후 복구 불가합니다. 다시한번 확인해주세요.");
	                          var hiDept=$($(this).parent().siblings(".hiDept")).val();
	                          if(con==true){
	                             location.href='${path}/deleteDept.hd?deptCode='+hiDept;                
	                          } 
	                       });
	                   }
	                });
	             });
	          });
		    
		    $(".deleteDept").click(function(){
	    		var con=confirm("폐설후 복구 불가합니다. 다시한번 확인해주세요.");
	    		var hiDept=$($(this).parent().siblings(".hiDept")).val();
	    		if(con==true){
	    			location.href='${path}/deleteDept.hd?deptCode='+hiDept;	    			
	    		} 
	    	});
		    
		    $(function() {
        		$(document).ready(function(){
        			$.ajax({
        				type : "post",
        				url: "${pageContext.request.contextPath}/selectColList.do",
        				success: function(data) {
        					let colListHtml = "";
        					colListHtml = "<option value='select' id='selColleage'>학부 선택</option>";
        					for(let i = 0; i < data.list.length; i++) {
        						let cols = data.list[i];
        						colListHtml += "<option value='"+cols['COL_CODE']+"'  class='colList'>"+cols['COL_NAME']+"</option>";
        					}
        					
        					$('.selectColleage').html(colListHtml);
        						$('.selectColleage').change(function(){
        							$("#selColleage").attr('disabled',true);
        						})
        				}
        			})
        		})
        	});
		    
     // Get the modal
        var colModal = document.getElementById('colModal');
        var deptModal = document.getElementById('deptModal');
        // Get the button that opens the modal
        var colBtn = document.getElementById("colBtn");
        var deptBtn = document.getElementById("deptBtn");
        // Get the <span> element that closes the modal
        var colModalclose = document.getElementById("colModalclose");                                          
        var colModalclose1 = document.getElementById("colModalclose1"); 
        var deptModalclose = document.getElementById("deptModalclose");                                          
        var deptModalclose1 = document.getElementById("deptModalclose1"); 
        // When the user clicks on the button, open the modal 
        colBtn.onclick = function() {
        	colModal.style.display = "block";
        }
        deptBtn.onclick = function() {
        	deptModal.style.display = "block";
        }
 
        // When the user clicks on <span> (x), close the modal
        colModalclose.onclick = function() {
        	colModal.style.display = "none";
        }
        colModalclose1.onclick = function() {
        	colModal.style.display = "none";
        }
        deptModalclose.onclick = function() {
        	deptModal.style.display = "none";
        }
        deptModalclose1.onclick = function() {
        	deptModal.style.display = "none";
        }
 
    
        
        $(document).ready(function() { 
	    	   $('input').attr('required', true); 
	       });

        </script>
      

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>
