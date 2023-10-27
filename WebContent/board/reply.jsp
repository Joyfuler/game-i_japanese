<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>댓글 작성 페이지</title>
    <link rel="icon" type="image/x-icon" href="${conPath}/img/logo4.gif" sizes="144x144">    
    <link href="${conPath}/css/boardWrite.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>    
	function noImage(imageElement) {
	 	imageElement.src = "${conPath }/img/noimg.jpg";
	}
    </script>
    <script>
        function checkFileType(inputElement) {        
            var file = inputElement.files[0];       
            var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i; // 이미지 확장자 목록
            if (!allowedExtensions.exec(file.name)) {
                alert("이미지 파일만 업로드 가능합니다.");
                inputElement.value = ''; // 입력 필드 비우기
            }
        }   
    </script>
    <script>	
    $(document).ready(function() {      
      var inputFile = $("input[name='bimg']");
      var image = $("#uploadedImg"); 
      inputFile.change(function(){
    	 var file = inputFile[0].files[0];
    	 if (file){
    		 var reader = new FileReader();
    		 reader.onload = function(e){
    			image.attr('src', e.target.result);
    		 };
    		 reader.readAsDataURL(file);
    	 }
      });      
    });
    </script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="../main/rightArea.jsp"/>
<section class="notice">
  <div class="page-title">
        <div class="write_title">
            <h3 style = "text-align:left;">
            	<img src = "${conPath }/img/${replyFormInfo.gicon }" height = "44px"><b> ${replyFormInfo.gname } - 답변글 작성</b>
            </h3>         
        </div>
  </div>
  <div id="contents">
		<div class="article">						
			<div class="gray_frame">				
				<form action = "${conPath }/boardReply.do" method="post" enctype = "multipart/form-data">
					<input type = "text" name = "gid"	value = "${replyFormInfo.gid }">
					<input type = "text" name = "mid" value = "${member.mid }">
					<input type = "text" name = "bno" value = "${originInfo.bno }">
					<input type = "text" name = "bgroup" value = "${originInfo.bgroup }">
					<input type = "text" name = "bstep" value = "${originInfo.bstep }">
					<input type = "text" name = "bindent" value = "${originInfo.bindent }">
					<input type = "text" name = "pageNum" value = "${param.pageNum }">	
					<div class = "writeForm">
						<table class="board-table">							
							<tbody>
								<tr>
									<td rowspan="2" style = "text-align: center;"> <img src = "${conPath }/memberPhotoUp/${member.mphoto }" height = "45px">																																									
										<b>&nbsp;&nbsp;글제목 &nbsp;</b>
									</td>
									<td rowspan="2">
										<input id="btitle" name="btitle" class = "writeInput" maxlength="100" tabindex="2"
										type="text" value = "re: ${originInfo.btitle }">										
									</td>
								</tr>
								<tr>
								</tr>
								<tr>
									<th>글내용 </th>
									<td>
										<textarea cols="30" rows="15" maxlength="4000" name = "bcontent"></textarea>										
									</td>
								</tr>								
								<tr>
									<th>사진추가</th>
									<td>
										<input type = "file" name = "bimg" onchange = "checkFileType(this)"><img id = "uploadedImg" height = "44px">
									</td>
								</tr>
								<tr>
									<td colspan= "3">
										<input type = "submit" name = "writeButton" value = "글작성" style = "margin-left: 400px;"> 
										<input type = "button" value = "뒤로가기" style = "margin-left: 10px;" onclick = "history.back()"> 
										<input type = "button" value = "글목록" onclick = "location.href='${conPath }/board/list.do?gid=${replyForminfo.gid }'" style = "margin-left: 10px;"> 
									</td>
							</tbody>
						</table>
					</div>	
				</form>
			</div>
		</div>
	</div>								
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>