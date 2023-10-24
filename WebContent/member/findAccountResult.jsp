<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var ="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호찾기</title>
<link href="${conPath }/css/login.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="${conPath }/img/logo4.gif" sizes="144x144">
</head>
<jsp:include page="../main/header.jsp"/>
<body>
	<div id="contents">
		<div class="article">
			<div class="icon">
				<h2 class="rd25_right">
					<img src="${conPath }/img/logo4.gif"
						alt="로고" height = "40">&nbsp;&nbsp;&nbsp; 아이디 / 비밀번호 찾기 결과
				</h2>
			</div>			
			<div class="gray_frame">	
					<div>
						<table class="table01">							
							<tbody>
								<tr>
								<c:if test = "${not empty findAccountResult }">
									<th><h5> ${findAccountResult } </h5></th>	
								</c:if>
								<c:if test = "${not empty findPasswordResult}">
									<th><h5> ${findPasswordResult } </h5></th>
								</c:if>		
								</tr>
							</tbody>
						</table>
					</div>													
					<div class="check" style = "width: 250px;">
						<input type = "button" class = "btn" onclick = "location.href='${conPath}/findAccountView.do'" value = "뒤로가기">
						<input type = "button" class = "btn" onclick = "location.href='${conPath }/loginView.do'" value = "로그인">
					</div>
				</div>
			</div>		
		</div>					
<jsp:include page="../main/footer.jsp"/>
</body>
</html>