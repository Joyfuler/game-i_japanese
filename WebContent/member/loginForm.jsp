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
<jsp:include page="../main/header.jsp"/>
<body>
<c:if test="${not empty joinResult  }">
		<script>
		alert('${joinResult}');
		</script>
	</c:if>
	<c:if test="${not empty joinErrorMsg }"> <!--  회원가입 실패시. -->
		<script>
		alert('${joinErrorMsg}');
		history.back();
		</script>
	</c:if>	
	<div id="contents">
		<div class="article">
			<div class="icon">
				<h2 class="rd25_right">
					<img src="${conPath }/main/img/logo4.gif"
						alt="noimg" height = "40">&nbsp;&nbsp;&nbsp;로그인 페이지
				</h2>
			</div>			
			<div class="gray_frame">
				<div class = "login_background">
				<p>가입시 입력한 ID와 비밀번호를 입력해주세요. </p>
					<form action = "${conPath }/login.do" method="post" class = "loginForm">
					<input type = "hidden" name = "gid" value = "${param.gid }">	
					<input type = "hidden" name = "next" value = "${param.next }">				
						<div>
							<table class="table01">
								<colgroup>
									<col width="26%" />
									<col width="74%" />
								</colgroup>
								<tbody>
									<tr>
										<th>ID: </th>
										<td><input id="id" name="mid" type="text" maxlength="20" tabindex="1" autofocus="autofocus">																					
										</td>
									</tr>
									<tr>
										<th>PW: </th>
										<td><input id="password" name="mpw" maxlength="20" tabindex="2"
											type="password">										
										</td>
									</tr>
									<tr>
										<td><br><a href="${conPath }/findAccount.do" target="_blank">&nbsp;&nbsp;ID·비밀번호 찾기</a></td>
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
							<input class = "btn" type = "button" onclick = "location.href='${conPath}/joinView.do'" value = "회원가입"> 
							</td>
							<td>
							<input class = "btn" type = "button" onclick = "location.href='${conPath}/main.do'" value = "메인">
						</tr>	
					</table>
					</div>	
				</form>			
				</div>	
			</div>									
		</div>
	</div>	
<jsp:include page="../main/footer.jsp"/>	
</body>
</html>