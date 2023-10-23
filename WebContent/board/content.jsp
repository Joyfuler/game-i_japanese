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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
<script>
	function removeConfirm(){
		var removeConfirm = confirm('정말 삭제하시겠습니까?');
		if (removeConfirm){
			location.href = "${conPath }/boardDelete.do?gid=${boardContent.gid }&bno=${boardContent.bno }";
		}
	}
</script>
<script>
		$(document).ready(function(){
			$('.replyComment').click(function(){
				var bcno = $(this).attr('id');
				$.ajax({
					url : '${conPath}/commentReply.do?gid=${boardContent.gid }&bno=${boardContent.bno }',
					type : 'post',
					data : 'bcno='+bcno,
					dataType : 'html',
					success : function(data){
						$('#ccontent'+bcno).html(data);
					}
				});
			});
		});
	</script>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="../main/rightArea.jsp"/>
<c:if test="${not empty boardModifyResult }">
		<script>
		alert('${boardModifyResult }');
		</script>
</c:if>
<c:if test="${not empty commentDeleteResult }">
		<script>
		alert('${commentDeleteResult }');
		</script>
</c:if>
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
                       	<b>작성일: <fmt:formatDate value= "${boardContent.brdate }" pattern="yyyy-MM-dd HH:mm:ss"/></b><br>
                       	<b>IP : ${boardContent.bip }</b>
                    </td>
                    <td class = "title-cell">
                    	<b>조회수: ${boardContent.bhit } </b><br>
                    	<b>댓글  (${totCnt }) </b>
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
               		<table>
               		<tr>
               		 	<td>
               		 		<b>댓글 <span style = color:red;>${totCnt }건</span></b>
               		 	</td>	
               		</tr>
               		<c:forEach var = "boardComments" items = "${boardComment }">               		
               		<tr>
               		    <c:if test = "${not empty boardComments }">
                    		<td class="comment-cell">                    	
                        		<img src="${conPath }/memberPhotoUp/${boardComments.mphoto }" alt="${boardComments.mnickname } 프로필사진" height = "72px" onerror="noImage(this)">
	                        	<br><span>${boardComments.mnickname }</span><br>
    	                    	<a id = "${boardComments.bcno }" class = "replyComment" style = "padding-left: 25px;">답글</a>
    	                    	<c:if test= "${member.mid eq boardComments.mid }">
    	                    	<a href = "${conPath }/commentDelete.do?gid=${boardContent.gid }&bno=${boardContent.bno }&bcno=${boardComments.bcno }" style = "padding-left: 25px;">삭제</a>
    	                    	</c:if>
        	            	</td>
            	        	<td class="comment-content-cell ">
                	        	<p id = "ccontent${boardCommets.bcno }">${boardComments.bctext }</p> &nbsp; &nbsp; &nbsp; &nbsp;   
                    		</td>                    		
	                    	<td class = "comment-cell">
    	                	<fmt:formatDate value= "${boardComments.bcrdate }" pattern="yyyy-MM-dd HH:mm:ss"/> <br>
        	            	${boardComments.bcip }
            	        	</td>
                    	</c:if>
                    </tr>	
                    </c:forEach>	
                </table>
                <div id = "paging" style = "padding-left: 100px; display: block;"> 
					<c:if test="${startPage >BLOCKSIZE }">
						<a href = "${conPath }/boardContent.do?gid=${boardContent.gid }&bno=${boardContent.bno }&commentPageNum=${startPage-1 }">[이전]</a>
					</c:if>
					<c:forEach var = "i" begin = "${startPage }" end = "${endPage }">
						<c:if test = "${i eq commentPageNum }">
							[<b style = "color: red;"> ${i }</b>]
						</c:if>
						<c:if test = "${i != commentPageNum }">
						<a href = "${conPath }/boardContent.do?gid=${boardContent.gid }&bno=${boardContent.bno }&commentPageNum=${i }">[${i }]</a>
						</c:if>
					</c:forEach>
					<c:if test = "${endPage < pageCnt }">
						<a href = "${conPath }/boardContent.do?gid=${boardContent.gid }&bno=${boardContent.bno }&commentPageNum=${endPage+1 }">[다음]</a>
					</c:if>		
				</div>
            <form action = "${conPath }/commentWrite.do" method = "post">
            	<input type = "text" name = "gid" value = "${boardContent.gid }">
	    		<input type = "text" name = "bno" value = "${boardContent.bno }">
    	        <input type = "text" name = "mid" value = "${member.mid }">    	   
    	        <input type = "text" name = "commentPageNum" value = "${boardComments.commentPageNum }">    
            	<table>            	
            		<tr>
	            		<td> <b>&nbsp;&nbsp;댓글 작성</b> </td>
    	        	</tr>
            		<tr>	
            			<td>
            				<textarea id = "bctext" name = "bctext" cols= "70" rows = "4" maxlength= "300"></textarea>
            			</td>
            			<td>
            			<c:if test = "${empty member }">
            				<input type = "button" value = "댓글작성" onclick = "location.href='${conPath}/loginView.do?next=boardList.do?gid=${boardContent.gid }'">
            			</c:if>
            			<c:if test = "${not empty member }">
            				<input type = "submit" value = "댓글작성">
            			</c:if>
            	</table>
            </form>
          </div>
       </div>
       <div class = "button-container"> 
        <button style="margin-top: 5px; margin-left: 640px; position: absolute;" onclick = "location.href='${conPath}/boardList.do?gid=${boardContent.gid }&pageNum=${pageNum }'">게시글목록</button>
        <button style="margin-top: 5px; margin-left: 750px; position: absolute;" onclick = "location.href='${conPath}/boardReplyView.do?gid=${boardContent.gid }&bno=${boardContent.bno }&pageNum=${pageNum }'">답변글쓰기</button>
        <c:if test = "${member.mid eq boardContent.mid or member.mlevel eq 1}">
        <button style="margin-top: 5px; margin-left: 860px; position: absolute;" onclick = "location.href='${conPath}/boardModifyView.do?gid=${boardContent.gid }&bno=${boardContent.bno }&pageNum=${pageNum }'">게시글수정</button>
        <button style="margin-top: 5px; margin-left: 970px; position: absolute;" onclick = "removeConfirm()">게시글삭제</button>                
        </c:if>
        </div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>