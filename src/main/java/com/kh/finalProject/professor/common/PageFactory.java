package com.kh.finalProject.professor.common;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.finalProject.professor.model.vo.SelectInClass;
import com.kh.finalProject.professor.model.vo.SelectInMajor;

public class PageFactory {

	public static String getPageBar(int totalCount, int cPage, int numPerPage, String url) {

		String pageBar = "";
		int pageBarSize = 5;

		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		int totalPage = (int) Math.ceil((double) totalCount / numPerPage);

		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";

		if (pageNo == 1) {

			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar += "</li>";

		} else {

			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo - 1) + ")'>이전</a>";
			pageBar += "</li>";

		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {

			if (cPage == pageNo) {

				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>" + pageNo + "</a>";
				pageBar += "</li>";

			} else {

				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo) + ")'>" + pageNo + "</a>";
				pageBar += "</li>";

			}
			pageNo++; // 이 구문을 빼먹으면 무한루트임 (페이지가 안나옴)
		} // while문 끝

		if (pageNo > totalPage) {

			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar += "</li>";

		} else {

			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo) + ")'>다음</a>";
			pageBar += "</li>";

		}

		pageBar += "</ul>";

		pageBar += "<script>function fn_paging(cPage){";
		pageBar += "location.href='" + url + "?cPage='+cPage";
//		pageBar += "location.href='"+url+"?cPage='+cPage"; <-- function안에 있는 매개변수는 현재 페이지를 보내야함
//		'"+url+"?cPage='+cPage"; 로 보낸 value값은 변수로 인식한다.
		pageBar += "} </script>";

		return pageBar;

	}

	public static String getAjaxPageBar(int index, int totalCount, int cPage, int numPerPage, String url) {

		String pageBar = "";
		int pageBarSize = 5;

		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		int totalPage = (int) Math.ceil((double) totalCount / numPerPage);

		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";

		if (pageNo == 1) {

			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar += "</li>";

		} else {

			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:ajaxData(" + index + "," + (pageNo - 1) + ")'>이전</a>";
			pageBar += "</li>";

		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {

			if (cPage == pageNo) {

				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>" + pageNo + "</a>";
				pageBar += "</li>";

			} else {

				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:ajaxData(" + index + "," + pageNo + ")'>" + pageNo
						+ "</a>";
				pageBar += "</li>";

			}
			pageNo++; // 이 구문을 빼먹으면 무한루트임 (페이지가 안나옴)
		} // while문 끝

		if (pageNo > totalPage) {

			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar += "</li>";

		} else {

			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:ajaxData(" + index + "," + (pageNo) + ")'>다음</a>";
			pageBar += "</li>";

		}

		pageBar += "</ul>";

		return pageBar;

	}

	

	public static String getInMajorPageBar(int totalCount, int cPage, int numPerPage, String url,SelectInMajor sim) throws JsonProcessingException {

		String pageBar = "";
		int pageBarSize = 5;

		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		int totalPage = (int) Math.ceil((double) totalCount / numPerPage);

		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";

		if (pageNo == 1) {

			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar += "</li>";

		} else {

			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo - 1+","+new ObjectMapper().writeValueAsString(sim)) + ")'>이전</a>";
			pageBar += "</li>";

		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {

			if (cPage == pageNo) {

				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>" + pageNo + "</a>";
				pageBar += "</li>";

			} else {

				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo+","+new ObjectMapper().writeValueAsString(sim)) + ")'>" + pageNo + "</a>";
				pageBar += "</li>";

			}
			pageNo++; // 이 구문을 빼먹으면 무한루트임 (페이지가 안나옴)
		} // while문 끝

		if (pageNo > totalPage) {

			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar += "</li>";

		} else {

			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo+","+new ObjectMapper().writeValueAsString(sim)) + ")'>다음</a>";
			pageBar += "</li>";

		}

		pageBar += "</ul>";
		pageBar += "<script>function fn_paging(cPage,where){";
		pageBar += "var data=where;";
		pageBar += "console.log(data);";
		pageBar += "console.log(data.stuNo);";
		pageBar += "console.log(data[\"grade\"]);";
		pageBar += "location.href='" + url + "?cPage='+cPage+'&deptCode='+data[\"deptCode\"]+'&"
				+ "stuNo='+data[\"stuNo\"]+'&stuName='+data[\"stuName\"]+'&grade='+data[\"grade\"];";
		pageBar += "} ";
		pageBar += "</script>";
//		pageBar += "if(${sim} != null) {";
//		pageBar += "location.href='"+url+"?cPage='+cPage"; <-- function안에 있는 매개변수는 현재 페이지를 보내야함
//		'"+url+"?cPage='+cPage"; 로 보낸 value값은 변수로 인식한다.
//		pageBar += "}}else { ";
//		pageBar += "location.href='" + url + "?cPage='+cPage";

		return pageBar;

	}
	
	public static String getInClassPageBar(int totalCount, int cPage, int numPerPage, String url,SelectInClass sic) throws JsonProcessingException {

		String pageBar = "";
		int pageBarSize = 5;

		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		int totalPage = (int) Math.ceil((double) totalCount / numPerPage);

		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";

		if (pageNo == 1) {

			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar += "</li>";

		} else {

			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo - 1+","+new ObjectMapper().writeValueAsString(sic)) + ")'>이전</a>";
			pageBar += "</li>";

		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {

			if (cPage == pageNo) {

				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>" + pageNo + "</a>";
				pageBar += "</li>";

			} else {

				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo+","+new ObjectMapper().writeValueAsString(sic)) + ")'>" + pageNo + "</a>";
				pageBar += "</li>";

			}
			pageNo++; // 이 구문을 빼먹으면 무한루트임 (페이지가 안나옴)
		} // while문 끝

		if (pageNo > totalPage) {

			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar += "</li>";

		} else {

			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo+","+ new ObjectMapper().writeValueAsString(sic)) + ")'>다음</a>";
			pageBar += "</li>";

		}

		pageBar += "</ul>";
		pageBar += "<script>function fn_paging(cPage,where){";
		pageBar += "var data=where;";
		pageBar += "console.log(data);";
		pageBar += "console.log(data.stuNo);";
		pageBar += "console.log(data[\"grade\"]);";
		pageBar += "location.href='" + url + "?cPage='+cPage+'&subCode='+data[\"subCode\"]+'&"
				+ "subYear='+data[\"subYear\"]+'&subName='+data[\"subName\"]+'&grade='+data[\"grade\"]"
				+ "&stuNo=[\"stuNo\"]&stuName=[\"stuName\"];";
		pageBar += "} ";
		pageBar += "</script>";
//		pageBar += "if(${sim} != null) {";
//		pageBar += "location.href='"+url+"?cPage='+cPage"; <-- function안에 있는 매개변수는 현재 페이지를 보내야함
//		'"+url+"?cPage='+cPage"; 로 보낸 value값은 변수로 인식한다.
//		pageBar += "}}else { ";
//		pageBar += "location.href='" + url + "?cPage='+cPage";

		return pageBar;

	}
	
	
	public static String getSearchPageBar(int totalCount, int cPage, int numPerPage, String url) {

		String pageBar = "";
		int pageBarSize = 5;

		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		int totalPage = (int) Math.ceil((double) totalCount / numPerPage);

		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";

		if (pageNo == 1) {

			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar += "</li>";

		} else {

			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:getSearchList(" + (pageNo - 1) + ")'>이전</a>";
			pageBar += "</li>";

		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {

			if (cPage == pageNo) {

				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>" + pageNo + "</a>";
				pageBar += "</li>";

			} else {

				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:getSearchList(" + (pageNo) + ")'>" + pageNo + "</a>";
				pageBar += "</li>";

			}
			pageNo++; // 이 구문을 빼먹으면 무한루트임 (페이지가 안나옴)
		} // while문 끝

		if (pageNo > totalPage) {

			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar += "</li>";

		} else {

			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:getSearchList(" + (pageNo) + ")'>다음</a>";
			pageBar += "</li>";

		}
		pageBar += "</ul>";


		return pageBar;


	}
	
	
	public static String getReqListPageBar(int totalCount, int cPage, int numPerPage, String url,SelectInClass sic) throws JsonProcessingException {

		String pageBar = "";
		int pageBarSize = 5;

		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		int totalPage = (int) Math.ceil((double) totalCount / numPerPage);

		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";

		if (pageNo == 1) {

			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar += "</li>";

		} else {

			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo - 1+","+new ObjectMapper().writeValueAsString(sic)) + ")'>이전</a>";
			pageBar += "</li>";

		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {

			if (cPage == pageNo) {

				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>" + pageNo + "</a>";
				pageBar += "</li>";

			} else {

				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo+","+new ObjectMapper().writeValueAsString(sic)) + ")'>" + pageNo + "</a>";
				pageBar += "</li>";

			}
			pageNo++; // 이 구문을 빼먹으면 무한루트임 (페이지가 안나옴)
		} // while문 끝

		if (pageNo > totalPage) {

			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar += "</li>";

		} else {

			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo+","+new ObjectMapper().writeValueAsString(sic)) + ")'>다음</a>";
			pageBar += "</li>";

		}

		pageBar += "</ul>";
		pageBar += "<script>function fn_paging(cPage,where){";
		pageBar += "var data=where;";
		pageBar += "location.href='" + url + "?cPage='+cPage+'&subCode='+data[\"subCode\"]+'&"
				+ "subYear='+data[\"subYear\"]+'&profId='+data[\"profId\"]+'&subSemester='+data[\"subSemester\"];";
		pageBar += "} ";
		pageBar += "</script>";
//		pageBar += "if(${sim} != null) {";
//		pageBar += "location.href='"+url+"?cPage='+cPage"; <-- function안에 있는 매개변수는 현재 페이지를 보내야함
//		'"+url+"?cPage='+cPage"; 로 보낸 value값은 변수로 인식한다.
//		pageBar += "}}else { ";
//		pageBar += "location.href='" + url + "?cPage='+cPage";

		return pageBar;

	}
	
	public static String getSearchNavPageBar(int index, int totalCount, int cPage, int numPerPage, String url) {


		String pageBar = "";
		int pageBarSize = 5;

		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		int totalPage = (int) Math.ceil((double) totalCount / numPerPage);

		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";

		if (pageNo == 1) {

			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar += "</li>";

		} else {

			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:getSearchListA(" + index + "," + (pageNo - 1) + ")'>이전</a>";
			pageBar += "</li>";

		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {

			if (cPage == pageNo) {

				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>" + pageNo + "</a>";
				pageBar += "</li>";

			} else {

				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:getSearchListA(" + index + "," + pageNo + ")'>" + pageNo
						+ "</a>";
				pageBar += "</li>";

			}
			pageNo++; // 이 구문을 빼먹으면 무한루트임 (페이지가 안나옴)
		} // while문 끝

		if (pageNo > totalPage) {

			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar += "</li>";

		} else {

			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:getSearchListA(" + index + "," + (pageNo) + ")'>다음</a>";
			pageBar += "</li>";

		}

		pageBar += "</ul>";

		return pageBar;

	}
	
	public static String getPageBarAsgmt(int totalCount, int cPage, int numPerPage, String url, String subSeq) {

		String pageBar = "";
		int pageBarSize = 5;

		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;

		int totalPage = (int) Math.ceil((double) totalCount / numPerPage);

		pageBar += "<ul class='pagination justify-content-center pagination-sm'>";

		if (pageNo == 1) {

			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>이전</a>";
			pageBar += "</li>";

		} else {

			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo - 1) + ", "+subSeq+")'>이전</a>";
			pageBar += "</li>";

		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {

			if (cPage == pageNo) {

				pageBar += "<li class='page-item active'>";
				pageBar += "<a class='page-link'>" + pageNo + "</a>";
				pageBar += "</li>";

			} else {

				pageBar += "<li class='page-item'>";
				pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo) + ", "+subSeq+")'>" + pageNo + "</a>";
				pageBar += "</li>";

			}
			pageNo++; // 이 구문을 빼먹으면 무한루트임 (페이지가 안나옴)
		} // while문 끝

		if (pageNo > totalPage) {

			pageBar += "<li class='page-item disabled'>";
			pageBar += "<a class='page-link' href='#' tabindex='-1'>다음</a>";
			pageBar += "</li>";

		} else {

			pageBar += "<li class='page-item'>";
			pageBar += "<a class='page-link' href='javascript:fn_paging(" + (pageNo) + ", "+subSeq+ ")'>다음</a>";
			pageBar += "</li>";

		}

		pageBar += "</ul>";

		pageBar += "<script>function fn_paging(cPage, subSeq){";
		pageBar += "location.href='" + url + "?cPage='+cPage+'&subSeq='+subSeq";
//		pageBar += "location.href='"+url+"?cPage='+cPage"; <-- function안에 있는 매개변수는 현재 페이지를 보내야함
//		'"+url+"?cPage='+cPage"; 로 보낸 value값은 변수로 인식한다.
		pageBar += "} </script>";

		return pageBar;

	}


	
}
