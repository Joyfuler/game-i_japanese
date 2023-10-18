<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
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
						alt="noimg" height = "40">&nbsp;&nbsp;&nbsp;회원수정 확인페이지
				</h2>
			</div>			
			<div class="gray_frame">
				<p>현재 ID의 비밀번호 및 본인확인 답변을 다시 한 번 입력해주세요</p>
					<form action = "" method="post">	
					<input type = "hidden" name = "identifyOk">				
					<div>
						<table class="table01">
							<colgroup>
								<col width="26%" />
								<col width="74%" />
							</colgroup>
							<tbody>								
								<tr>
									<th>PW: </th>
									<td><input id="pw" name="pw" maxlength="20" tabindex="2"
										type="password">										
									</td>
								</tr>
								<tr>
								<th>본인확인 답변 입력 &nbsp; <br>
								(Q. ???????????????) &nbsp;</th>																		
									<td><input type = "text" name = "identify" maxlength="20" tabindex="3"> 
							</tbody>
						</table>
					</div>					
					<div class="check">
					<table>
						<tr>
							<td>
							<button class = "btn" type = "submit"> &nbsp;본인확인 </button>							
							</td>							
							<td>
							<button class = "btn" type = "button" onclick = "history.back()'"> &nbsp; 뒤로가기</button> 
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