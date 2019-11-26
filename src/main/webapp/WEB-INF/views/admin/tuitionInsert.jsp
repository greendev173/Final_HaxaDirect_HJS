<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>
<style>
	.form-control{
		text-align:center;
	}
	.col-sm-9{
		margin-left:-30px;
	}
	td{
		text-align:center;
	}
	th{
		text-align:center;
		letter-spacing:3px;
	}
	.col-sm-12{
		margin:0 auto;
		text-align:center;
	}

</style>
<div class="main-panel">
	<div class="content-wrapper">
			   <div class="card">
                <div class="card-body">
                  <h4 class="card-title">등록금 등록</h4>
                  <form class="form-sample" action="${path }/tuitonInsert.hd">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">년도 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="year">
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-5">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">학기 선택</label>
                          <div class="col-sm-4">
                            <div class="form-check">
                              <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="membershipRadios" value="-01">
                                1학기
                              <i class="input-helper"></i></label>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="form-check">
                              <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="membershipRadios" value="-02">
                               	
                                2학기
                              <i class="input-helper"></i></label>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    <input type="hidden" id="hidDate" name="tuiYear"/>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">학부 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control selectColleage">
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">학과 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control selectDepartment" name="deptCode">
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">등록금 금액</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" name="tuiPay" id="tuition" placeholder="0,000,000" onkeyup="inputNumberFormat(this)">
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">납부 기한</label>
                          <div class="col-sm-9">
                            <input class="form-control" type="text" id="payDay" name="tuiPayDate" placeholder="20191121" readonly/>
                          </div>
                        </div>
                      </div>
                    </div>
	                    <div class="col-sm-12">
	                    	<input type="submit" value="저장" class="btn btn-inverse-info btn-fw" id="insBtn"/>&nbsp&nbsp
	                    	<input type="reset" value="초기화" class="btn btn-inverse-info btn-fw"/>
	                    </div>
                  </form>
                </div>
              </div>
              
              
              <div class="card" style="margin-top:30px">
                <div class="card-body">
                  <div class="table-responsive" style="overflow-x:hidden">
                  <h4 class="card-title">등록금 조회</h4>
                  <br>
                  <div class="row">
                      <div class="col-md-5">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">년도 선택</label>
                          <div class="col-sm-9">
                            <select class="form-control" id="year1">
                            </select>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label">학기 선택</label>
                          <div class="col-sm-4">
                            <div class="form-check">
                              <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="membershipRadios1" value="-01">
                                1학기
                              <i class="input-helper"></i></label>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="form-check">
                              <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="membershipRadios1" value="-02">
                               	
                                2학기
                              <i class="input-helper"></i></label>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-2">
                     	<input type="hidden" id="hidDate1" name="tuiYear1"/>
                    	<!-- <input type="submit" value="조회" > -->
                    	<button class="btn btn-inverse-info btn-fw" id="insBtn1">조회</button>
                      </div>
                    </div>
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>년도</th>
                          <th>학기</th>
                          <th>학부</th>
                          <th>학과</th>
                          <th style="width:200px">등록금</th>
                          <th>등록금 수정</th>
                        </tr>
                      </thead>
                      <tbody id="tuiList">
                      <c:forEach var="l" items="${list }">
                      <c:set var="year" value="${l.TUI_YEAR }" />
                        <tr>
                          <td>${fn:substring(year,0,4)}년</td>
                          <td>${fn:substring(year,6,8)}학기</td>
                          <td>${l.COL_NAME }</td>
                          <td>${l.DEPT_NAME }</td>
                          <td><input type="text" class="form-control payUpdate tuipay tP" value="${l.TUI_PAY }" onkeyup='inputNumberFormat(this)'/></td>
                          <td><input type="button" class="btn btn-inverse-info btn-fw" value="수정완료" onclick="tuiUpdateBtn('${l.TUI_YEAR }','${l.DEPT_CODE }')"/></td>
                        </tr>
                          <input type="hidden" class="tpHidden" value="" />
					  </c:forEach>  
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>

		<script>
		
		/* $(".tP").keyup(function(){
			var a=$(".tpHidden").val($(".tP").val());		
			console.log($(".tpHidden").val($(".tP").val()));
		}); */
		
		
		function tuiUpdateBtn(year,deCo){
			
			console.log(year + " / " + deCo);
			var tp=$(".tP").val();
			var newParam = tp.replace(/[^0-9]/g,"");
			console.log("tp >> " + tp);
			var tpHidden=$(".tpHidden").val(tp);
			var as=encodeURI(tpHidden);
			console.log(as);
			console.log(JSON.stringify(as))
			console.log("${path}/tuitionUpdate.hd?tuiYear="+year+"&deptCode="+deCo+"&tuiPay="+newParam);
			location.href="${path}/tuitionUpdate.hd?tuiYear="+year+"&deptCode="+deCo+"&tuiPay="+newParam;
		}
		
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
              
               $(function(){
            	 	$('.selectColleage').change(function(){
            			$.ajax({
            				type : "post",
            				url: "${pageContext.request.contextPath}/selectDeptList.do",
            				data: {"result" : $('.selectColleage').val()},
            				success: function(data) {
            					let deptListHtml = "<option value='select' id='selectDepartment'>학과 선택</option>";
            					for(let i = 0; i < data.list.length; i++) {
            						let depts = data.list[i];

            						deptListHtml += "<option value='"+depts['DEPT_CODE']+"'  class='deptList'>"+depts['DEPT_NAME']+"</option>";
            					}
            					
            					$('.selectDepartment').html(deptListHtml);
            						$('.selectDepartment').change(function(){
            						$("#selectDepartment").attr('disabled',true);
            			});
            	 	}
            	 });
            		 });
            	 }); 
              
               
              $("#insBtn").click(function(){
            	  var st = $(":input:radio[name=membershipRadios]:checked").val();
		    	  var year=$("#year option:selected").val();
		    	  
		    	  $("#hidDate").val(year+st);
              });
              
              $("#insBtn1").click(function(){
            	  var st = $(":input:radio[name=membershipRadios1]:checked").val();
		    	  var year=$("#year1 option:selected").val();
		    	  
		    	  $("#hidDate1").val(year+st);
              });
              
              function inputNumberFormat(obj) {
              obj.value = comma(uncomma(obj.value));
	          }
	
	          function comma(str) {
	              str = String(str);
	              return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	          }
	
	          function uncomma(str) {
	              str = String(str);
	              return str.replace(/[^\d]+/g, '');
	          }
	          
	          window.onload = function (){
	        	  appendYear();
	          }
	          
		      function appendYear(){
		        		var date = new Date();
		        		var year = date.getFullYear();
		        		var selectValue = document.getElementById("year");
		        		var selectValue1 = document.getElementById("year1");
		        		var optionIndex = 0;
	
		        		for(var i=year;i<=year+10;i++){
		        				selectValue.add(new Option(i,i),optionIndex++);
		        		}
		        		for(var i=year-2;i<=year+2;i++){
	        					selectValue1.add(new Option(i,i),optionIndex++);
	        			}
		        }

		       
		       
		       $(document).ready(function(){
		    	   $("input:radio[name=membershipRadios]").click(function(){
			    	   var st = $(":input:radio[name=membershipRadios]:checked").val();
			    	   var year=$("#year option:selected").val();
					   if(st=='-01'){
						   $("#payDay").val(year+"0201");
					   }else{
						   $("#payDay").val((year)+"0810");
					   }
			   		});
		       });
		       
		       $("#insBtn1").click(function(){
		    	  $.ajax({
		    		  url:"${path}/tuitionList.hd",
		    		  data:{"tuiYear":$("#hidDate1").val()},
		    		  success:function(result){
		    			  let re=JSON.parse(result);
		    			  var tuitionArr="";
		    			  var tuiUpdateBtn=new Array();
		    			  for(var i=0; i<re.length; i++){
		    				 tuitionArr+="<tr><td>"+re[i]["TUI_YEAR"].substring(0,4)+"</td>";
		    			     tuitionArr+="<td>"+re[i]["TUI_YEAR"].substr(6,2)+"학기</td>";
		    			     tuitionArr+="<td>"+re[i]["COL_NAME"]+"</td>";
		    			     tuitionArr+="<td>"+re[i]["DEPT_NAME"]+"</td>";
		    			     tuitionArr+="<td><input type='text' id='tuiPay"+i+"' class='form-control payUpdate' value='"+re[i]["TUI_PAY"]+"' id='tuiPay1' onkeyup='inputNumberFormat(this)'></td>";
		    			     tuitionArr+="<td><input type='button' id='tuiUpdateBtn"+i+"' class='btn btn-inverse-info btn-fw' value='수정 완료'/></td>";
		    			     tuitionArr+="</tr>";
		    			     tuitionArr+="<input type='hidden' id='tuiYear"+i+"' value='"+re[i]["TUI_YEAR"]+"'>";
		    			     tuitionArr+="<input type='hidden' id='deptCode"+i+"' value='"+re[i]["DEPT_CODE"]+"'>";
		    			  }
		    			  $("#tuiList").html(tuitionArr);


		    		        for(var i=0; i<re.length; i++){
		    		            tuiUpdateBtn[i]=document.getElementById("tuiUpdateBtn"+i); // 해당 요소 받아오기
		    		            tuiUpdateBtn[i].addEventListener('click', function(event){
		    		                var tuiUpdateBtnNo=this.id.substr(this.id.length-1);
		    		                var tuiYear=$("#tuiYear"+tuiUpdateBtnNo).val();
		    		                var deptCode=$("#deptCode"+tuiUpdateBtnNo).val();
		    		                tuiPay=$("#tuiPay"+tuiUpdateBtnNo).val();
		    		                location.href='${path}/tuitionUpdate.hd?tuiYear='+tuiYear+'&deptCode='+deptCode+'&tuiPay='+tuiPay;
		    		            }); // 이벤트 등록

		    		            $("#tuiPay"+i).keyup(function(e) {
		    		                $("#tuiPay"+i).val($(this).val());
		    		        });
		    		  } 
		    		 }
		    	  }); 
		       });
		       
		       $(document).ready(function() { 
		    	   $('input').attr('required', true); 
		       });


              </script>



       





		<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>