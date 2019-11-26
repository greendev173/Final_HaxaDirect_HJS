<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 페이지</title>
</head>
<body>
	<script>
		alert("${msg}");
		if("${function}" != null & "${function}" != ""){
		${function}
		}
		location.href="${pageContext.request.contextPath}${loc}";
	</script>
</body>
</html>