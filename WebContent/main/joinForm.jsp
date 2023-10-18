<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
			$('#preview').css('display', 'inline');
		};	
		
		reader.readAsDataURL(input.files[0]);
	}
}
</script>

</head>
<jsp:include page="header.jsp"/>
<body>	
	<div id="contents">
		<div class="article">
			<div class="icon">
				<h2 class="rd25_right">
					<img src="${conPath }/main/img/logo4.gif"
						alt="noimg" height = "40">&nbsp;&nbsp;&nbsp;회원가입 페이지
				</h2>
			</div>			
			<div class="gray_frame">				
					<form action = "" method="get">					
					<div>
						<table class="table01">							
							<tbody>
								<tr>
									<th>ID </th>
									<td><input id="mid" name="mid" type="text" maxlength="20" tabindex="1" autofocus="autofocus">&nbsp;&nbsp;<button class = "idChk">중복검사</button>																		
									<br><br></td>
								</tr>
								<tr>
									<th>닉네임 </th>
									<td><input id="mnickname" name="mnickname" type="text" maxlength = "20" tabindex="2">&nbsp;&nbsp;<button class = "nickChk">중복검사</button> 																		
									<br><br></td>
								</tr>								
								<tr>
									<th>비밀번호 </th>
									<td><input id="mpw" name="mpw" maxlength="20" tabindex="3"
										type="password">										
									</td>
								</tr>								
								<tr>
									<th>비밀번호확인 </th>
									<td><input id="mpwChk" name="mpwChk" maxlength="20" tabindex="4"
										type="password">										
									</td>
								</tr>
								<tr>
									<th>프로필사진 </th>
									<td><input id="mphoto" name="mphoto" type="file" onchange = "displayImg(this)" style = "margin-top:20px;"><img id = "preview" height="100"> 																		
									<br><br></td>
								</tr>
								<tr>
									<th>본인확인질문</th>
								</tr>
								<tr>										
										<td colspan="2"><select name = "mquest" style = "width:290px;">
										<option value = "1"> 어렸을 적 고향은? </option>
										<option value = "2"> 나온 초등학교 이름은? </option>
										<option value = "3"> 어릴적 키우던 애완동물 이름은? </option>
										</select>
									</td>
								</tr>	
								<tr>
									<th>본인확인 답 </th> 
									<td><input type = "text" name = "manswer" tabindex= "5"></td>
								</tr>	
									
										
								<tr>
									<th>이메일 </th>
									<td><input id="memail" name="memail" maxlength="20" tabindex="6"
										type="text">										
									</td>									
								</tr>
								<tr>
									<th>휴대폰번호 </th>
									<td><input id="mphone" name="mphone" maxlength="13" tabindex="7" 
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
							<input type = "submit" class = "btn" value = "회원가입">
							</td>
							<td>
							<input type = "reset" class = "btn" value = " 초기화"> 
							<td>					
							<input type = "button" class = "btn" onclick = "location = '${conPath }/index.jsp'" value = "메인">
							</td>
							
					</table>											
					</div>
				</form>
			</div>
		</div>	
	</div>
<jsp:include page="footer.html"/>	
</body>
</html>