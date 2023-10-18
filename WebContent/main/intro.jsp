<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사소개</title>
<link href = "${conPath }/css/intro.css" rel = "stylesheet">
<link rel="icon" type="image/x-icon" href="${conPath }/img/logo4.gif" sizes="144x144">
</head>
<body>
<jsp:include page="header.jsp"/>
	<div class = "top_title">
		<h1 class = "title"> 
		<br><br><br><br><br>
		More Fun, More Games 
		</h1>
	</div>
	<br><br>
	<h3 style = "text-align:center; font-weight: bold;"> 게임을 더욱 즐겁게 하는 세상을 만듭니다</h3>
	<br>
	<h5 style = "text-align:center;"> 국내 최대급의 게임 종합정보 웹 서비스, <br>
	Game-i는 "게임을 더 즐겁게 만든다"는 컨셉으로 시작한 게임 유저 지향형 팬사이트입니다. <br>
	게임에 대한 정보와 유저들의 생생한 리뷰, 그리고 커뮤니티를 제공하고 있습니다. </h5>
	<br><br>
	<div class = "bottom">
	<section>
		<h2>CONTACT
		<span>-문의사항-</span>
		</h2>		
	</section>	
	<p> 사이트에 대한 문의사항은 아래 문의 페이지를 통해 문의해주세요. 빠른 시일 내로 답변해 드리겠습니다. </p> 
		<div class = "bottom_btn"><a href="${conPath }/board/list.jsp?bid=qna"> ▶문의게시판</a>
		</div>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>