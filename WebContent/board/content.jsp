<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<link rel="icon" type="image/x-icon" href="${conPath }/img/logo4.gif" sizes="144x144">
<link href = "${conPath }/css/style2.css" rel = "stylesheet">
<link href = "${conPath }/css/boardContent.css" rel = "stylesheet">
</head>
<script>
	function noImage(imageElement) {
	 	imageElement.src = "${conPath }/img/noimg.jpg";
	}
</script>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="../main/rightArea.jsp"/>
<section class="notice">
  <div class="page-title">
        <div class="container">
            <h3 style = "text-align:left;"><img src = "../img/thum10.jpg" height = "44px"><b>&nbsp;드래곤플라이 게시글 상세보기</b></h3>         
        </div>
  </div>          
    <div id="board-list">
        <div class="board_container">
            <table class="board-table">               
                <tbody>
                <tr>                   
                    <td class = "profile-cell" width = "250px">
                      <img src = "${conPath }/img/noimg.jpg" height="75" alt="프로필사진" onerror="noImage(this)"><br>
                       <span class = "nickNamespan"><b>호니후</b></span>
                    </td>
                    <td class="title-cell">
                       	<b>작성일: 2022/03/20 01:00:35</b>
                       	<b>수정일: 2022/03/21 03:00:00</b>
                    </td>
                    <td class = "title-cell">
                    	<b>조회수: 10</b>
                </tr>
                <tr>
                	<td>
                	글제목
                	</td>
                    <td colspan="2" class="content-cell">                                                
                        	<span>오늘 날씨가 좋군요...^^</span>
                    </td>
                </tr>
                <tr>
                	<td>
                	글내용
                	</td>
                    <td colspan="3" class="content-cell" height="200px">
                    	<img src = "${conPath }/main/img/sky.jpg" width = "600px"><br>
                        <span style = "font-size: 15px;">10월 중순 날씨가 정말 선선해졌습니다. 곧 11월이 되는데 회원 여러분들도 감기 조심하세요...ㅎㅎ</span>
                    </td>
                </tr>
               </table>                          
               		<table style = "border: 1px solid gray;">
               		<tr>
               		 	<td>
               		 		<b>댓글 <span style = color:red;>5건</span></b> </caption>
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
        <button style="margin-top: 5px; margin-left: 750px; position: absolute;" onclick = "location.href='${conPath}/board/list.jsp'">게시글목록</button>
        <button style="margin-top: 5px; margin-left: 860px; position: absolute;">답변글쓰기</button>
        <button style="margin-top: 5px; margin-left: 970px; position: absolute;">게시글 수정</button>
        </div>

</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>