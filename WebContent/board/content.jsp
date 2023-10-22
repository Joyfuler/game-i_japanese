<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> ${boardContent.gname } 게시글 상세보기</title>
<link rel="icon" type="image/x-icon" href="${conPath }/img/logo4.gif" sizes="144x144">
<link href = "${conPath }/css/style2.css" rel = "stylesheet">
<link href = "${conPath }/css/boardContent.css" rel = "stylesheet">
</head>
<script>
	function noImage(imageElement) {
	 	imageElement.src = "${conPath }/img/noimg.jpg";
	}
</script>
<script>
	document.addEventListener("DOMContentLoaded", function() {	  
	  const bimg = '${boardContent.bimg}';
	  const imageElement = document.getElementById("uploadedImg");
	  if (bimg) {
	    imageElement.src = '${conPath}/memberPhotoUp/${boardContent.bimg}';
	    imageElement.style.display = "block";
	  } else {
	    // 이미지 파일이 존재하지 않는 경우
	    imageElement.style.display = "none";
	  }
	});
</script>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="../main/rightArea.jsp"/>
<section class="notice">
  <div class="page-title">
        <div class="board_title">        	
        			<h2 class="title_bar">
					<img src = "${conPath }/img/${boardContent.gicon }" height = "44px" onerror = "noImg(this)">&nbsp;${boardContent.gname } 게시글 상세보기					
					</h2>
		</div>
  </div>          
    <div id="board-list">
        <div class="board_container">
            <table class="board-table">               
                <tbody>
                <tr>                   
                    <td class = "profile-cell" width = "250px">
                      <img src = "${conPath }/img/${boardContent.mphoto }" height="75" alt="${boardContent.mnickname }프로필사진" onerror="noImage(this)"><br>
                       <span class = "nickNamespan"><b>${boardContent.mnickname }</b></span>
                    </td>
                    <td class="title-cell">
                       	<b>작성일: ${boardContent.brdate }</b><br>
                       	<b>IP : ${boardContent.bip }</b>
                    </td>
                    <td class = "title-cell">
                    	<b>조회수: ${boardContent.bhit } </b><br>
                    	<b>댓글  (0) </b>
                </tr>
                <tr>
                	<td>
                	글제목
                	</td>
                    <td colspan="2" class="content-cell">                                                
                        	<b>${boardContent.btitle }</b>
                    </td>
                </tr>
                <tr>
                	<td>
                	글내용
                	</td>
                    <td colspan="3" class="content-cell" height="200px">
                    	<img src = "${conPath }/img/${boardContent.bimg }" id = "uploadedImg" width = "500px"><br>
                        <span style = "font-size: 15px;">${boardContent.bcontent }</span>
                    </td>
                </tr>
               </table>                          
               		<table style = "border: 1px solid gray;">
               		<tr>
               		 	<td>
               		 		<b>댓글 <span style = color:red;>5건</span></b>
               		 	</td>	
               		</tr>
               		<tr>               			
                    	<td class="comment-cell">                    	
                        	<img src="path_to_commenter_profile_image.jpg" alt="Profile Image" height = "72px" onerror="noImage(this)">
                        	<br><span>작성자닉네임</span><br>
                        	<a href = "" style = "padding-left: 25px;">답글</a>
                    	</td>
                    	<td colspan = "2" class="comment-content-cell">
                        			댓글 내용
                    	</td>
                	</tr>
                		<tr>
                    	<td class="comment-cell">
                        	└<img src="path_to_commenter_profile_image.jpg" alt="Profile Image" height = "72px" onerror="noImage(this)" style = "padding-left: 25px;">
                        	<br><span style = "padding-left: 25px;">댓글작성자</span><br>
                        	<a href = "" style = "padding-left: 35px;">답글</a>
                    	</td>
                    	<td colspan = "2" class="comment-content-cell">
                        			댓글 내용
                    	</td>
                	</tr>
                		<tr>
                    	<td class="comment-cell">
                        	<img src="path_to_commenter_profile_image.jpg" alt="Profile Image" height = "72px" onerror="noImage(this)">
                        	<br><span>댓작성자임:</span><br>
                        	<a href = "" style = "padding-left: 25px;">답글</a>
                    	</td>
                    	<td colspan = "2" class="comment-content-cell">
                        			댓글 내용
                    	</td>
                	</tr>
                		<tr>
                    	<td class="comment-cell">
                        	<img src="path_to_commenter_profile_image.jpg" alt="Profile Image" height = "72px" onerror="noImage(this)">
                        	<br><span>댓글작성자</span><br>
                        	<a href = "" style = "padding-left: 25px;">답글</a>
                    	</td>
                    	<td colspan = "2" class="comment-content-cell">
                        			댓글 내용
                    	</td>
                	</tr>
                		<tr>
                    	<td class="comment-cell">
                        	<img src="path_to_commenter_profile_image.jpg" alt="Profile Image" height = "72px" onerror="noImage(this)">
                        	<br><span>댓글작성자임</span><br>
                        	<a href = "" style = "padding-left: 25px;">답글</a>
                    	</td>
                    	<td colspan = "2" class="comment-content-cell"> 
                        	댓글 내용입니다.댓글 내용입니다. 댓글 내용입니다. 댓글 내용입니다. 댓글 내용입니다. 댓글 내용입니다. 댓글 내용입니다. 댓글 내용입니다. 댓글 내용입니다. 댓글 내용입니다. 댓글 내용입니다. 댓글 내용입니다. 댓글 내용입니다. 댓글 내용입니다. 댓글 내용입니다.  		
                    	</td>
                	</tr>                
            </table>
            <form action = "">
            <table>            	
            	<tr>
            		<td> <b>&nbsp;&nbsp;댓글 작성</b> </td>
            	</tr>
            	<tr>	
            		<td>
            		<textarea id = "comment" cols= "70" rows = "4" maxlength= "300"></textarea>
            		</td>
            		<td>
            		<input type = "submit" value = "댓글작성">
            </table>
            </form>
          </div>
       </div>
       <div class = "button-container"> 
        <button style="margin-top: 5px; margin-left: 750px; position: absolute;" onclick = "location.href='${conPath}/boardList.do?gid=${param.gid }&pageNum=${pageNum }'">게시글목록</button>
        <button style="margin-top: 5px; margin-left: 860px; position: absolute;">답변글쓰기</button>
        <c:if test = "${member.mid eq boardContent.mid or member.mlevel eq 1}">
        <button style="margin-top: 5px; margin-left: 970px; position: absolute;" onclick = "location.href='${conPath}/boardModifyView.do?gid=${param.gid }&bno=${param.bno }&pageNum=${pageNum }'">게시글수정</button>        
        </c:if>
        </div>

</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>