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
			$('#preview').css('display', 'inline');
		};			
		reader.readAsDataURL(input.files[0]);
	}
}
</script>
<script>
$(document).ready(function(){
	$('.idChk').click(function(){
		var mid = $('input#mid').val();
		let pattern = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		if(mid.length < 4){
			$('span#idConfirmResult').text('id는 4글자 이상이어야 합니다.');
		} else if (mid.match(pattern)){
			$('span#idConfirmResult').text('id는 영문/숫자로만 입력해주세요');		
		} else {
			$.ajax({
				url : '${conPath}/midConfirm.do',
				type : 'post',
				data: {mid : mid},
				dataType : 'html',
				success : function(data){
					$('#idConfirmResult').css('color','#212529');
					$('#idConfirmResult').html(data);
				},
				error : function(code){
					$('#idConfirmResult').html(code.statusText);
				},
			});
		}
	});
	
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
	
	$('#memail').keyup(function(){
		var memail = $(this).val();
		var patternEmail = "^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";
		if (!memail.match(patternEmail)){
			$('span#emailChkResult').text('메일 주소 형식이 맞지 않습니다.');				
		} else {
			$('span#emailChkResult').text('이메일 중복 체크를 진행해 주세요.');
			$('input.emailChk').click(function(){
				var memail = $('#memail').val();
				$.ajax({
					url : '${conPath}/memailConfirm.do',
					type : 'post',
					data: {memail : memail},
					dataType : 'html',
					success : function(data){
						$('span#emailChkResult').css('color','#212529');
						$('span#emailChkResult').html(data);
					},
					error : function(code){
						$('span#emailChkResult').html(code.statusText);
					},
				});
			});	
		}
	});	
});
	
</script>
<script>
function submitChk(){
	var idConfirmResult = $('span#idConfirmResult').text().trim();
	var mnickName = $('input#mnickname').val().trim();
	var pwChkResult = $('#pwChkResult').text().trim();
	var manswer = $('input#manswer').val().trim();
	var memailChkResult = $('span#emailChkResult').text().trim();
	var agreeChecked = $('#ruleAgree').is(':checked');
	if (idConfirmResult != '사용 가능한 ID입니다.'){
		alert('아이디 중복체크를 해 주세요');
		return false;
	} else if (mnickName == ''){
		alert('닉네임을 입력해주세요');
		return false;	
	} else if (pwChkResult != '비밀번호가 일치합니다.'){
		alert('비밀번호 형식을 체크하세요');
		return false;
	} else if (manswer == ''){
		alert('본인확인 답변을 입력해주세요');
		return false;	
	} else if (memailChkResult != '사용 가능한 이메일입니다.'){
		alert('메일 형식을 체크하세요.');
		return false;
	} else if (!agreeChecked){
		alert('약관에 동의해야 가입할 수 있습니다.');
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
						alt="noimg" height = "40">&nbsp;&nbsp;&nbsp;회원가입 페이지
				</h2>
			</div>			
			<div class="gray_frame">				
					<form action = "${conPath }/join.do" method="post" class = "loginForm" enctype = "multipart/form-data">					
					<div class = "join_background">
						<table class="table01">							
							<tbody>
								<tr>
									<th>ID <span style = "color:red;">*</span> </th>
									<td><input id="mid" name="mid" type="text" maxlength="12" tabindex="1" autofocus="autofocus">&nbsp;&nbsp;<input type = "button" class = "idChk" value = "중복검사"></td>																																			
								</tr>
								<tr>
									<td></td><td><span id = "idConfirmResult"> &nbsp; &nbsp; &nbsp; </span></td>
								<tr>
									<th>닉네임 <span style = "color:red;">*</span></th>
									<td><input id="mnickname" name="mnickname" type="text" maxlength = "12" tabindex="2"> 																		
									<br><br></td>
								</tr>								
								<tr>
									<th>비밀번호 <span style = "color:red;">*</span></th>
									<td><input id="mpw" name="mpw" maxlength="20" tabindex="3"
										type="password">										
									</td>
								</tr>								
								<tr>
									<th>비밀번호확인 <span style = "color:red;">*</span></th>
									<td><input id="mpwChk" name="mpwChk" maxlength="20" tabindex="4"
										type="password">										
									</td>
								</tr>								
								<tr>
									<td></td><td><span id = "pwChkResult">&nbsp;</span></td>
								</tr>
								<tr>
									<th>이메일 <span style = "color:red;">*</span></th>
									<td><input id="memail" name="memail" maxlength="20" tabindex="5"
										type="text">&nbsp;&nbsp;<input type = "button" class = "emailChk" value = "중복검사">										
									</td>									
								</tr>
								<tr>
									<td></td><td><span id = "emailChkResult">&nbsp; &nbsp; &nbsp;</span> 
								</tr>										
								<tr>
									<th>프로필사진 </th>
									<td><input id="mphoto" name="mphoto" type="file" onchange = "displayImg(this)" style = "margin-top:20px;"><img id = "preview" height="144px"> 																		
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
									<th>본인확인 답<span style = "color:red;">*</span> </th> 
									<td><input type = "text" name = "manswer" id = "manswer" tabindex= "6" maxlength= "15"></td>
								</tr>
								<tr>
									<th>휴대폰번호 </th>
									<td><input id="mphone" name="mphone" maxlength="13" tabindex="7" 
										oninput="autoHyphen2(this)" type="text">										
									</td>									
								</tr>																	 
							</tbody>
						</table>
						<b>&nbsp;약관동의</b>
						<jsp:include page="terms.jsp"/>
						<input type = "checkbox" id = "ruleAgree" style = "margin-top: 5px;"> <label for = "ruleAgree">약관에 동의합니다.</label>
					</div>					
					<div class="check">
					<table>
						<tr>
							<td>
							<input type = "submit" class = "btn" value = "회원가입" onclick = "return submitChk()">
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
<jsp:include page="../main/footer.jsp"/>	
</body>
</html>