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
<script>
	function modifyChk(){
		var memberpw = '${memberInfo.mpw}';
		var memberanswer = '${memberInfo.manswer}';
		if (memberpw != $('#pwConfirm').val()){
			alert('비밀번호가 일치하지 않습니다.');
			return false;			
		} else if (memberanswer != $('#manswerConfirm').val()){
			alert('본인확인 답변이 틀렸습니다.');
			return false;
		}
	}
</script>		
</head>
<jsp:include page="../main/header.jsp"/>
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
					<form action = "${conPath }/modifyView.do" method="post">	
					<input type = "hidden" name = "mid" value = "${memberInfo.mid }">			
					<div>
						<table class="table01">
							<colgroup>
								<col width="26%" />
								<col width="74%" />
							</colgroup>
							<tbody>								
								<tr>
									<th>현재 비밀번호 </th>
									<td><input id="pwConfirm" name="pwConfirm" maxlength="20" tabindex="2"
										type="password">										
									</td>
								</tr>
								<tr>
								<th>본인확인 답변 입력 &nbsp; <br>
								<c:if test = "${memberInfo.mquest eq 1}">
								(Q. 어렸을 적 고향은?) &nbsp;
								</c:if>
								<c:if test = "${memberInfo.mquest eq 2 }">
								(Q. 나온 초등학교 이름은?) &nbsp;
								</c:if>
								<c:if test = "${memberInfo.mquest eq 3 }">
								(Q. 출신 초등학교 이름은?) &nbsp;
								</c:if>
								</th>								
								</tr>			
								<tr>															
									<td><input type = "text" name = "manswerConfirm" id = "manswerConfirm" maxlength="20" tabindex="3"></td>
								</tr>
							<tbody>
						</table>
					</div>					
					<div class="check">
					<table>
						<tr>
							<td>
							<button class = "btn" onclick = "return modifyChk()"> &nbsp;본인확인 </button>							
							</td>							
							<td>
							<button class = "btn" onclick = "history.back()"> &nbsp; 뒤로가기</button> 
							</td>
							<td>
							<button class = "btn" onclick = "location.href='${conPath}/main.do'">메인으로</button>
						</tr>	
					</table>					
					</div>
				</form>					
			</div>
		</div>	
	</div>
<jsp:include page="../main/footer.jsp"/>	
</body>
</html>