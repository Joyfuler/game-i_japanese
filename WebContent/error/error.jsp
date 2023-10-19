<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지를 찾지 못했습니다</title>
<link href = "${conPath }/css/style2.css" rel = "stylesheet">
<link rel="icon" type="image/x-icon" href="${conPath }/main/img/logo4.gif" sizes="144x144">
<link href = "${conPath }/css/error.css" rel = "stylesheet">
</head>
<style>
div.errorImg{
text-align: center;
}
</style>
<body>
	<jsp:include page="../main/header.jsp"/>
	<h1 class = "errorTitle" style = "border-bottom: 1px solid gray;"> 요청하신 페이지를 찾을 수 없습니다.</h1>
	<br>
	<div class = "errorImg">
	<img src = "${conPath }/img/error.png" height="300">
	</div>
	<br>	
	<h5 class = "errorContent">웹 브라우저에서 새로고침하거나, 새로고침 후에도 표시되지 않는 경우
	URL를 확인해 주세요.</h5> <br>
	<div class = "linkButton">
	<button class = "errorButton" onclick = "location.href='${conPath }/index.jsp'">▶HOME</button>
	<button class = "errorButton" onclick = "history.back()">▶뒤로가기</button>
	</div> 
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>