<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link href="${conPath }/css/login.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="${conPath }/img/logo4.gif" sizes="144x144">
</head>
<jsp:include page="header.jsp"/>
<body>
	<div id="contents">
		<div class="article">
			<div class="icon">
				<h2 class="rd25_right">
					<img src="${conPath }/main/img/logo4.gif"
						alt="noimg" height = "40">&nbsp;&nbsp;&nbsp;로그인 페이지
				</h2>
			</div>			
			<div class="gray_frame">
				<p>가입시 입력한 ID와 비밀번호를 입력해주세요</p>
					<form action = "" method="get">					
					<div>
						<table class="table01">
							<colgroup>
								<col width="26%" />
								<col width="74%" />
							</colgroup>
							<tbody>
								<tr>
									<th>ID: </th>
									<td><input id="id" name="id" type="text" maxlength="20" tabindex="1" autofocus="autofocus">
										<a href="" target="_blank">&nbsp;&nbsp;ID·비밀번호 찾기</a>										
									</td>
								</tr>
								<tr>
									<th>PW: </th>
									<td><input id="password" name="password" maxlength="20" tabindex="2"
										type="password">										
									</td>
								</tr>
							</tbody>
						</table>
					</div>					
					<div class="check">
					<table>
						<tr>
							<td>
							<button class = "btn" type = "submit"> &nbsp;로그인 </button>							
							</td>							
							<td>
							<button class = "btn" type = "button" onclick = "location.href='${conPath}/main/joinForm.jsp'"> &nbsp; 회원가입</button> 
							</td>
							<td>
							<button class = "btn" type = "button" onclick = "location.href='${conPath}/main/main3.jsp'">메인으로</button>
						</tr>	
					</table>					
					</div>
				</form>					
			</div>
		</div>	
	</div>
<jsp:include page="footer.html"/>	
</body>
</html>