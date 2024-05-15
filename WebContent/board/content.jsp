<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> ${boardContent.gname } 投稿の詳細</title>
<link rel="icon" type="image/x-icon" href="${conPath }/img/logo4.gif" sizes="144x144">
<link href = "${conPath }/css/style2.css" rel = "stylesheet">
<link href = "${conPath }/css/boardContent.css" rel = "stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
					url : '${conPath }/commentReplyView.do?gid=${boardContent.gid }&bno=${boardContent.bno }&bcno='+bcno,
					type : 'get',
					data : {'gid' : '${boardContent.gid}', 'bno' : '${boardContent.bno}', 'bcno' : bcno},
					dataType : 'text',
					success : function(data, status){						
						$('.replySpace'+bcno).html(data);
					}
				});
			});
			
			$('.reportButton').click(function(){
				$('.reportForm').css('display', 'block');
			});						
		});
	</script>
	<script>
	function blockUserAlert(){
		alert('차단된 유저는 게시글을 작성할 수 없습니다.');
	}
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
<c:if test = "${not empty commentReplyResult }">
	<script>
		alert('${commentReplyResult}');
	</script>
</c:if>		
<c:if test = "${not empty reportResult }">
	<script>
		alert('${reportResult}');
	</script>
</c:if>
<section class="notice">
  <div class="page-title">
        <div class="board_title">        	
        	<h2 class="title_bar" onclick = 'location.href="${conPath}/boardList.do?gid=${boardContent.gid }"' style = "cursor: pointer;">
				<img src = "${conPath }/img/${boardContent.gicon }" height = "44px" onerror = "noImage(this)">&nbsp;${boardContent.gname } ー 投稿の詳細					
			</h2>
		</div>
  </div>          
    <div id="board-list">
        <div class="board_container">
            <table class="board-table">               
                <tbody>
           		     <tr>                   
                	    <td class = "profile-cell" width = "250px">
                    	  	<img src = "${conPath }/memberPhotoUp/${boardContent.mphoto }" height="75" alt="${boardContent.mnickname }프로필사진" onerror="noImage(this)"><br>
                       	  	<span class = "nickNamespan"><b>${boardContent.mnickname }</b></span>
                    	</td>
                    	<td class="title-cell">
                       		<b>作成日付: <fmt:formatDate value= "${boardContent.brdate }" pattern="yyyy-MM-dd HH:mm:ss"/></b><br>
                       		<b>IP : ${boardContent.bip }</b>
                    	</td>
                    	<td class = "title-cell">
	                    	<b>閲覧数: ${boardContent.bhit } </b><br>
    	                	<b>コメント  (${totCnt }) </b>
    	                </td>	
        	        </tr>
            	    <tr>
                		<td>
	                		タイトル
    	            	</td>
                    	<td colspan="2" class="content-cell">                                                
                        	<b>${boardContent.btitle }</b>
                    	</td>
                	</tr>
                	<tr>
                		<td>
                			内容
                		</td>
                    	<td colspan="3" class="content-cell" height="200px">
                    		<img src = "${conPath }/img/${boardContent.bimg }" id = "uploadedImg" width = "500px"><br>
                        	<pre><span style = "font-size: 15px;">${boardContent.bcontent }</span></pre>
                    	</td>
                	</tr>
               	</table>
               	<!--  댓글 영역     -->                          
               	<table>
               		<tr>
               		 	<td>
               		 		<b>コメント <span style = color:red;>${totCnt }件</span></b>
               		 	</td>	
               		</tr>
               		<c:forEach var = "boardComments" items = "${boardComment }">
               		    <c:if test = "${not empty boardComments }">
               		    <tr>
                    		<td class="comment-cell">
                    			<c:forEach var="i" begin="1" end="${boardComments.bcindent }">
									<c:if test="${i eq boardComments.bcindent }">
										└─
									</c:if>
									<c:if test="${i!= boardComments.bcindent }"> 
									&nbsp; &nbsp; 
									</c:if>
								</c:forEach>                    	
                        		<img src="${conPath }/memberPhotoUp/${boardComments.mphoto }" alt="${boardComments.mnickname } 프로필사진" height = "72px" onerror="noImage(this)">                        		
	                        	<br>
	                        	<c:forEach var="i" begin="1" end="${boardComments.bcindent }">									 
									&nbsp; &nbsp; 
								</c:forEach>
								<c:if test = "${boardComments.mlevel eq 0}">	
	                        		<span>${boardComments.mnickname }</span><br>
	                        	</c:if>
	                        	<c:if test = "${boardComments.mlevel eq 1}">	
	                        		<span style = "color: red;">${boardComments.mnickname }</span><br>
	                        	</c:if>	                        	
	                        	<c:if test = "${empty member }">
    	                    		<a href = "${conPath }/loginView.do?next=boardList.do?gid=${boardContent.gid}" class = "replyComment" style = "padding-left: 25px;">リプライ</a>
    	                    	</c:if>
    	                    	<c:if test = "${not empty member and member.mlevel eq -2 }">
    	                    		<a style = "padding-left: 25px;" onclick = "blockUserAlert()" >リプライ</a>
    	                    	</c:if>
	                        	<c:if test = "${not empty member }">
    	                    		<a id = "${boardComments.bcno }" class = "replyComment" style = "padding-left: 25px;">リプライ</a>
    	                    	</c:if>
    	                    	<c:if test= "${member.mid eq boardComments.mid or member.mlevel eq 1}">
    	        	            	<a href = "${conPath }/commentDelete.do?gid=${boardContent.gid }&bno=${boardContent.bno }&bcno=${boardComments.bcno }" style = "padding-left: 25px;">削除</a>
    	                    	</c:if>
        	            	</td>
            	        	<td class="comment-content-cell ">
                	        	<p id = "ccontent${boardComments.bcno }">${boardComments.bctext }</p> &nbsp; &nbsp; &nbsp; &nbsp;   
                    		</td>                    		
	                    	<td class = "comment-cell">
    	            	    	<fmt:formatDate value= "${boardComments.bcrdate }" pattern="yyyy-MM-dd HH:mm:ss"/> <br>
        	            		${boardComments.bcip }
            	        	</td>
            	     </tr>
            	     <tr>            	     
            	     <%-- 댓글의 댓글 부분 --%>  	
            	        	<td class = "replySpace${boardComments.bcno }" colspan="3">            	        	
            	        	</td>
            	     </tr>   	
            	        </c:if>	  
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
            	<input type = "hidden" name = "gid" value = "${boardContent.gid }">
	    		<input type = "hidden" name = "bno" value = "${boardContent.bno }">
    	        <input type = "hidden" name = "mid" value = "${member.mid }">    	   
    	        <input type = "hidden" name = "commentPageNum" value = "${boardComments.commentPageNum }">    
            	<table>            	
            		<tr>
	            		<td> <b>&nbsp;&nbsp;コメントをどうぞ</b> </td>
    	        	</tr>
            		<tr>	
            			<td>
            				<textarea id = "bctext" name = "bctext" cols= "70" rows = "4" maxlength= "300"></textarea>
            			</td>
            			<td>
            				<c:if test = "${empty member }">
            					<input type = "button" value = "作成" onclick = "location.href='${conPath}/loginView.do?next=boardList.do?gid=${boardContent.gid }'">
            				</c:if>
            				<c:if test = "${not empty member and member.mlevel eq -2 }">
            					<input type = "button" value = "(차단유저)">
            				</c:if>
            				<c:if test = "${not empty member and member.mlevel != -2}">
            					<input type = "submit" value = "댓글작성">
            				</c:if>
            			</td>
            		</tr>		
            	</table>
            </form>
          </div>
       </div>
       <div class = "button-container"> 
        	<button style="margin-top: 5px; margin-left: 640px; position: absolute;" onclick = "location.href='${conPath}/boardList.do?gid=${boardContent.gid }&pageNum=${pageNum }'">リスト</button>
        	<c:if test = "${empty member and param.gid != 'notice'}">
        		<button style="margin-top: 5px; margin-left: 750px; position: absolute;" onclick = "location.href='${conPath}/loginView.do?next=boardReplyView.do?gid=${boardContent.gid }&bno=${boardContent.bno }&pageNum=${pageNum }'">リプライ</button>
        	</c:if>        	
        	<c:if test = "${not empty member and member.mlevel != -2 and param.gid != 'notice'}">
        		<button style="margin-top: 5px; margin-left: 750px; position: absolute;" onclick = "location.href='${conPath}/boardReplyView.do?gid=${boardContent.gid }&bno=${boardContent.bno }&pageNum=${pageNum }'">リプライ</button>
        	</c:if>
        	<c:if test = "${not empty member and param.gid eq 'notice' and member.mlevel eq 1 }">
        		<button style="margin-top: 5px; margin-left: 750px; position: absolute;" onclick = "location.href='${conPath}/boardReplyView.do?gid=${boardContent.gid }&bno=${boardContent.bno }&pageNum=${pageNum }'">リプライ</button>
        	</c:if>
        	<c:if test = "${member.mid eq boardContent.mid or member.mlevel eq 1}">
        		<button style="margin-top: 5px; margin-left: 860px; position: absolute;" onclick = "location.href='${conPath}/boardModifyView.do?gid=${boardContent.gid }&bno=${boardContent.bno }&pageNum=${pageNum }'">投稿の修正</button>
        		<button style="margin-top: 5px; margin-left: 970px; position: absolute;" onclick = "removeConfirm()">게시글삭제</button>                
        	</c:if>
        	<c:if test = "${member.mid != boardContent.mid }">
        		<button style="margin-top: 5px; margin-left: 860px; position: absolute;" class = "reportButton">通報する</button>
        	</c:if>
        </div>
        <br><br>
        <div class = "reportForm" style = "display: none; margin-left: 860px;">
        	<form action = "${conPath }/reportBoard.do">
        	<input type = "hidden" name = "bno" value = "${param.bno }">
        	<input type = "hidden" name = "gid" value = "${param.gid }">
         	<input type = "hidden" name = "reportermid" value = "${empty member ? 'nonmember' : member.mid }">       
        	<table style = "border : 1px solid gray;">        	
        		<tr>
	        		<td> 通報の理由を選択してください </td>
    	    	</tr>
        		<tr>	 
        			<td>
        				<input type = "radio" value = "1" class = "reason1" name = "rreason" id = "reason1">
        				<label for = "reason1">罵倒</label>
        			</td>
        		</tr>
        		<tr>
	        		<td>		
        				<input type = "radio" value = "2" class = "reason2" name = "rreason" id = "reason2">
        				<label for = "reason2">連投</label>
        			</td>
        		</tr>
        		<tr>		
	        		<td>
        				<input type = "radio" value = "3" class = "reason3" name = "rreason" id = "reason3">
        				<label for = "reason3">広告など</label>
        			</td>
        		</tr>
        		<tr>
	        		<td>		
        				<input type = "radio" value = "4" class = "reason4" name = "rreason" id = "reason4">
        				<label for = "reason4">その他</label>
        			</td>
        		</tr> 	   		
 	   			<tr>
	 	   			<td>
 	   					<input type = "submit" class = "reportSubmit" value = "通報"> 	   				
 	   				</td>	
 	   			</tr>	
 	   		</table>
 	   	</form>
        </div>
</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>