<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
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
					<img src="${conPath }/main/img/logo4.gif"
						alt="noimg" height = "40">&nbsp;&nbsp;&nbsp;아이디 찾기
				</h2>
			</div>			
			<div class="gray_frame">				
					<form action = "" method="post">					
					<div>
						<table class="table01">							
							<tbody>
								<tr>
									<th>가입시 입력했던 본인확인 질문에 답변해주세요.</th>	
								</tr>
								<tr>								
									<td>									
										<select name = "identify" style = "width:290px;">
										<option value = "1"> 어렸을 적 고향은? </option>
										<option value = "2"> 나온 초등학교 이름은? </option>
										<option value = "3"> 어릴적 키우던 애완동물 이름은? </option>
										</select>
									</td>
								</tr>
								<tr>	
									<td>
										<input type = "text" name = "identify_answer">										
									</td>
								</tr>
								<tr>
									<th> 이메일 </th>
								</tr>
								<tr>
									<td><input type = "text" name = "email"></td>
								</tr>
								<c:if test="${not empty findidResult }">
								<tr>
									<td>
										<span>요청하신 ID는 ${result }</span>
									</td>
								</tr>
								</c:if>
							</tbody>
						</table>		
					</div>								
					<div class="check" style = "width:250px;">
						<button class = "btn"> &nbsp;계정찾기 </button>
						<button class = "btn" tabindex="4" onclick = "location.href='${conPath }/main/'loginForm.jsp"> &nbsp;로그인 </button>
						
					</div>
				</form>
			</div>
		</div>	
		<div class="article">
			<div class="icon">
				<h2 class="rd25_right">
					<img src="${conPath }/main/img/logo4.gif"
						alt="noimg" height = "40">&nbsp;&nbsp;&nbsp;비밀번호 찾기
				</h2>
			</div>			
			<div class="gray_frame">				
					<form action = "" method="post">					
					<div>
						<table class="table01">							
							<tbody>
								<tr>
									<th>ID</th>
								</tr>
								<tr>	
									<td><input type = "text" name = "id"></td>
								</tr>
								<tr>		
									<th>가입시 입력했던 본인확인 질문에 답변해주세요.</th>	
								</tr>
								<tr>								
									<td>									
										<select name = "identify" style = "width:290px;">
										<option value = "1"> 어렸을 적 고향은? </option>
										<option value = "2"> 나온 초등학교 이름은? </option>
										<option value = "3"> 어릴적 키우던 애완동물 이름은? </option>
										</select>
									</td>
								</tr>
								<tr>	
									<td>
										<input type = "text" name = "identify_answer">										
									</td>
								</tr>
								<c:if test="${not empty findidResult }">
								<tr>
									<td>
										<span>요청하신 ID는 ${result }</span>
									</td>
								</tr>
								</c:if>
							</tbody>
						</table>		
					</div>								
					<div class="check" style = "width: 250px;">
						<button class = "btn"> &nbsp;비번변경 </button>
						<button class = "btn" tabindex="4" onclick = "location.href='${conPath }/main/loginForm.jsp'"> &nbsp;로그인 </button>
					</div>
				</form>
			</div>
		</div>			
	</div>
<jsp:include page="../main/footer.jsp"/>	
</body>
</html>