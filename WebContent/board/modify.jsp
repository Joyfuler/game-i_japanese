<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${modifyFormInfo.gname }게시글수정</title>
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
<!-- 게임 정보 표시와 원글의 정보 표시를 위해 writeForminfo, boardContent를 각각 가져온다. -->
<section class="notice">
	<div class="page-title">
        <div class="write_title">
            <h4 style = "text-align:left;"><img src = "${conPath }/img/${modifyFormInfo.gicon }" height = "44px"><b>&nbsp;${modifyFormInfo.gname } - 게시글 수정</b></h4>         
        </div>
    </div>
  <div id="contents">
		<div class="article">						
			<div class="gray_frame">				
				<form action = "${conPath }/modify.do" method="post" enctype = "multipart/form-data">
				<input type = "hidden" name = "gid" value = "${param.gid }">
				<input type = "hidden" name = "mid" value = "${member.mid }">
				<input type = "hidden" name = "bno" value = "${boardContent.bno }">
				<input type = "hidden" name = "pageNum" value = "${param.pageNum }">
				<input type = "hidden" name = "next" value = "boardContent.do?gid=${param.gid }&bno=${param.bno }&pageNum=${param.pageNum }">					
					<div class = "writeForm">
						<table class="board-table">							
							<tbody>
								<tr>
									<td rowspan="2" style = "text-align: center;"> <img src = "${conPath }/img/${originInfo.mphoto }" height = "45px">																																									
									<b>&nbsp;&nbsp;글제목 &nbsp;</b>
									</td>
									<td rowspan="2">
									<input id="btitle" name="btitle" class = "writeInput" maxlength="100" tabindex="2"
										type="text" value = "${originInfo.btitle }">										
									</td>
								</tr>
								<tr>
								</tr>
								<tr>
									<th>글내용 </th>
									<td><textarea cols="30" rows="15" maxlength="4000">${originInfo.bcontent }</textarea>										
									</td>
								</tr>								
								<tr>
									<th>사진변경</th>
									<td>
									<input type = "file" name = "bimg" accept=".jpg, .jpeg, .png, .gif" onchange = "checkFileType(this)">
									<c:if test = "${not empty originInfo.bimg }">
									<img id = "uploadedImg" height = "44px" src = "${conPath }/memberPhotoUp/${originInfo.bimg }">
									</c:if>
									<c:if test = "${empty originInfo.bimg }">
									<img id = "uploadedImg" height = "44px">
									</c:if>
									</td>
								</tr>
								<tr>
									<td colspan= "3">
									<input type = "submit" name = "writeButton" value = "글작성" style = "margin-left: 400px;"> 
									<input type = "button" value = "뒤로가기" onclick = "history.back()" style = "margin-left: 10px;"> 
									<input type = "button" value = "글목록" onclick = "location.href='${conPath}/boardList.do?gid=${param.gid }&pageNum=${param.pageNum }'" style = "margin-left: 10px;"> 
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