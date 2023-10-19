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
	const autoHyphen2 = (target) => {
	 target.value = target.value.replace(/[^0-9]/g, '')
	 .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}	
</script>
<script>
function displayImg(input){
	if (input.files && input.files[0]){
		var reader = new FileReader();		
		reader.onload = function(e){
			$('#preview').attr('src', e.target.result);			
		};	
		
		reader.readAsDataURL(input.files[0]);
	}
}
</script>
<script>
function withDrawalChk(){
	var question = confirm ('정말 회원탈퇴 하시겠습니까?');
	if (question){
	location.href = '${conPath }/withDrawal.do';
	}
}
</script>
</head>
<jsp:include page="../main/header.jsp"/>
<body>
<!-- modifyChk.jsp에서 identifyOk 패러미터가 왔을 때에만 가능하도록, 아니면 location.href으로 메인으로 보낸다 -->	
	<div id="contents">
		<div class="article">
			<div class="icon">
				<h2 class="rd25_right">
					<img src="${conPath }/main/img/logo4.gif"
						alt="noimg" height = "40">&nbsp;&nbsp;&nbsp;회원정보수정
				</h2>
			</div>			
			<div class="gray_frame">				
					<form action = "modify.do" method="get" class = "modifyForm">					
					<div>
						<table class="table01">							
							<tbody>
								<tr>
									<th>ID </th>
									<td><input id="id" name="id" type="text" maxlength="20" tabindex="1" disabled="disabled">																		
									<br><br></td>
								</tr>
								<tr>
									<th>프로필사진 </th>
									<td><input id="profile" name="profile" type="file" onchange = "displayImg(this)" style = "margin-top: 25px;"><img id = "preview" height = "100">																		
									<br><br></td>
								</tr>		
								<tr>
									<th>새비밀번호 </th>
									<td><input id="pw" name="pw" maxlength="20" tabindex="3"
										type="password">										
									</td>
								</tr>
								<tr>
									<th>새비밀번호확인</th>
									<td><input id = "pwChk" name = "pwChk" maxlength="20" tabindex="4" type = "password">
								<tr>
									<th>본인확인질문</th>
								</tr>
								<tr>										
										<td colspan="2"><select name = "identify" style = "width:290px;">
										<option value = "1"> 어렸을 적 고향은? </option>
										<option value = "2"> 나온 초등학교 이름은? </option>
										<option value = "3"> 어릴적 키우던 애완동물 이름은? </option>
										</select>
									</td>
								</tr>	
								<tr>
									<th>본인확인 답 </th> 
									<td><input type = "text" name = "identify_answer"></td>
								</tr>	
									
										
								<tr>
									<th>이메일 </th>
									<td><input id="email" name="email" maxlength="20" tabindex="4"
										type="text">										
									</td>									
								</tr>
								<tr>
									<th>휴대폰번호 </th>
									<td><input id="phone" name="email" maxlength="13" tabindex="5" 
										oninput="autoHyphen2(this)" type="text">										
									</td>									
								</tr>
							</tbody>
						</table>
					</div>					
					<div class="check">
					<table>
						<tr>
							<td>
							<input type = "submit" class = "btn" value = "회원정보수정">
							</td>
							<td>
							<input type = "button" class = "btn" onclick = "location = '../index.jsp'" value = "메인"> 
							<td>					
							<input type = "button" class = "btn" onclick = "withDrawalChk()" value = "회원탈퇴">
							</td>
							
					</table>											
					</div>
				</form>
			</div>
		</div>	
	</div>
<jsp:include page="../main/footer.jsp"/>	
</body>
</html>