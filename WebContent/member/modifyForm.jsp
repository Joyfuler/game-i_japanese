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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
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
		var question = confirm('정말 회원탈퇴 하시겠습니까?');
			if (question){
			location.href = '${conPath }/withdrawal.do?mid=${member.mid }';
			}
	}
</script>
<script>
	$(document).ready(function(){
		$('#mpw, #mpwChk').keyup(function(){
			var pw = $('#mpw').val();
			var pwChk = $('#mpwChk').val();
			var patternNum = /[0-9]/;
	        var patternEng = /[a-zA-Z]/;        
	        var patternSpc = /[~`!@#$%^&*()_\-+={}\[\]\\|:;<>,.?\/]/;        
			if(!pw && !pwChk){
				$('#pwChkResult').text('비밀번호를 입력하세요.');
			} else if (pw.length <4 || !pw.match(patternNum) || !pw.match(patternEng) || !pw.match(patternSpc)){
				$('#pwChkResult').text('비밀번호는 4자리 이상, 영문과 숫자·특수문자를 포함하여 입력해야 합니다.');
			} else if (pw != pwChk) {
				$('#pwChkResult').text('비밀번호가 일치하지 않습니다.');			
			} else if(pw == pwChk) {
				$('#pwChkResult').css('color','#212529');
				$('#pwChkResult').text('비밀번호가 일치합니다.');
			}
		});	
	});
</script>
<script>
function submitChk(){	
	var mnickName = $('input#mnickname').val().trim();
	var pwChkResult = $('#pwChkResult').text().trim();
	var manswer = $('input#manswer').val().trim();		
	if (mnickName == ''){
		alert('닉네임을 입력해주세요');
		return false;	
	} else if (pwChkResult != '비밀번호가 일치합니다.'){
		alert('비밀번호 형식을 체크하세요');
		return false;
	} else if (manswer == ''){
		alert('본인확인 답변을 입력해주세요');
		return false;		
	}
}
</script>
</head>
<jsp:include page="../main/header.jsp"/>
<body>
	<c:if test = "${empty member }">
		<script>
		location.href = '${conPath}/loginView.do?next=modifyView.do';
		</script>
	</c:if>	
	<div id="contents">
		<div class="article">
			<div class="icon">
				<h2 class="rd25_right">
					<img src="${conPath }/main/img/logo4.gif"
						alt="noimg" height = "40">&nbsp;&nbsp;&nbsp;회원정보수정
				</h2>
			</div>			
			<div class="gray_frame">				
					<form action = "${conPath }/modify.do" method="post" class = "modifyForm" enctype = "multipart/form-data">
					<input type="hidden" name="dbMphoto" value="${member.mphoto }">
					<input type="hidden" name = "mlevel" value= "${member.mlevel }">					
					<div>
						<table class="table01">							
							<tbody>
								<tr>
									<th>ID </th>
									<td><input id="mid" name="mid" type="text" maxlength="20" tabindex="1" readonly = "readonly" value = "${member.mid }">																		
									<br><br></td>
								</tr>
								<tr>
									<th>프로필사진 </th>
									<td><input id="mphoto" name="mphoto" type="file" onchange = "displayImg(this)" style = "margin-top: 25px;"><img id = "preview" height="144px" src = "${conPath }/memberPhotoUp/${member.mphoto }">																		
									<br><br></td>
								</tr>
								<tr>		
									<th>닉네임</th>
									<td><input id = "mnickname" name = "mnickname" maxlength="20" tabindex="3" type = "text" value = "${member.mnickname }">
								<tr>
									<th>새비밀번호 <span style = "color:red;">*</span></th>
									<td><input id="mpw" name="mpw" maxlength="20" tabindex="4" type="password">										
									</td>
								</tr>
								<tr>
									<th>새비밀번호확인<span style = "color:red;">*</span></th>
									<td><input id = "mpwChk" name = "mpwChk" maxlength="20" tabindex="5" type = "password"></td>
								</tr>
								<tr>
									<td></td><td><span id = "pwChkResult">&nbsp;&nbsp;&nbsp;</span></td>
								</tr>	
								<tr>
									<th>본인확인질문</th>
								</tr>
								<tr>										
									<td colspan="2">
										<select name = "mquest" id = "mquest" style = "width:290px;">
										<option value = "1"> 어렸을 적 고향은? </option>
										<option value = "2"> 나온 초등학교 이름은? </option>
										<option value = "3"> 어릴적 키우던 애완동물 이름은? </option>
										</select>
									</td>
								</tr>	
								<tr>
									<th>본인확인 답<span style = "color:red;">*</span> </th> 
									<td><input type = "text" name = "manswer" id = "manswer" tabindex = "6"></td>
								</tr>	
									
										
								<tr>
									<th>이메일 <span style = "color:red;">*</span></th>
									<td><input id="memail" name="memail" maxlength="20" tabindex="7"
										type="text" value = "${member.memail }" readonly = "readonly">										
									</td>									
								</tr>								
								<tr>
									<td></td><td><span id = "emailChkResult">&nbsp; &nbsp; &nbsp;</span> 
								</tr>										
								<tr>
									<th>휴대폰번호 </th>
									<td><input id="mphone" name="mphone" maxlength="13" tabindex="8" 
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
							<input type = "submit" class = "btn" value = "정보수정" onclick = "return submitChk()">
							</td>
							<td>
							<input type = "button" class = "btn" onclick = "location ='${conPath}/main.do'" value = "메인"> 
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