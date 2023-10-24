<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> ${gameInfo.gname } 게시글보기</title>
<link rel="icon" type="image/x-icon" href="${conPath }/img/logo4.gif" sizes="144x144">
<link href = "${conPath }/css/style2.css" rel = "stylesheet">
<link href = "${conPath }/css/boardList.css" rel = "stylesheet">
</head>
<script>
	function noImage(imageElement) {
	 	imageElement.src = "${conPath }/img/noimg.jpg";
	}
</script>
<body>
<jsp:include page="../main/header.jsp"/>
<jsp:include page="../main/rightArea.jsp"/>
<c:if test="${not empty boardWriteResult }">
	<script>
	alert('${boardWriteResult }');
	</script>
</c:if>
<c:if test="${not empty boardDeleteResult }">
	<script>
	alert('${boardDeleteResult}');
	</script>
</c:if>
<c:if test = "${not empty boardReplyResult }">
	<script>
	alert('${boardReplyResult }');
	</script>
</c:if>	
	<script>
	function blockUserAlert(){
		alert('차단된 유저는 게시글을 작성할 수 없습니다.');
	}
	</script>
</body>		
<section class="notice">
  <div class="page-title">
        <div class="board_title">        	
        			<h2 class="title_bar">
					<img src = "${conPath }/img/${gameInfo.gicon }" height = "44px" onerror = "noImage(this)">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${gameInfo.gname } 게시판
					</h2>
		</div>
    </div>          
    <div id="board-list">
        <div class="board_container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-date">등록일</th>
                    <th scope="col" class="th-name">닉네임</th>
                    <th scope="col" class="th-hit">조회수</th>
                </tr>
                </thead>
                <tbody>
                <c:if test = "${boardList.size() eq 0 }">
                	<tr>
                		<td colspan = "5"> 현재 게시판에 게시글이 없습니다. </td>
                	</tr>	
                </c:if>                             
                <c:forEach var="boarditem" items="${boardList }">
                	<tr>
                    	<td>${boarditem.bno }</td>
                    <th>                    	
                    	<c:forEach var="i" begin="1" end="${boarditem.bindent }">
							<c:if test="${i eq boarditem.bindent }">
								<b>└─</b>
							</c:if>
							<c:if test="${i!=boarditem.bindent }"> 
							&nbsp; &nbsp; 
							</c:if>
						</c:forEach>
						<c:if test = "${boarditem.bhit >=10 }">                    		
                    		<a href="${conPath }/boardContent.do?gid=${gid }&bno=${boarditem.bno }&pageNum=${param.pageNum }">${boarditem.btitle }</a>
                    		<img src = "${conPath }/img/hot.png">
                    	</c:if>
                    	<c:if test = "${boarditem.bhit <10 }">
                    		<a href="${conPath }/boardContent.do?gid=${gid }&bno=${boarditem.bno }&pageNum=${param.pageNum }">${boarditem.btitle }</a>
                    	</c:if>	                                            
                    	</th>
                    	<td>
                    		<fmt:formatDate value= "${boarditem.brdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
                    	</td>
                    	<td>${boarditem.mnickname }</td>
                    	<td>${boarditem.bhit }</td>
                	</tr>
				</c:forEach>
                	<tr>
                    	<td>2</td>
                    	<th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
                    	<td>2017.06.15</td>
                     	<td>아이조아</td>
                    	<td>10</td>
                	</tr>
                	<tr>
                    	<td>1</td>
                    	<th><a href="#!">공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
                    	<td>2017.06.15</td>
                     	<td>아이조아</td>
                    	<td>10</td>
                	</tr>
                </tbody>
            </table>            
        </div>
        <div class = "button-container">
        	<c:if test = "${not empty member and member.mlevel eq -2 }">
        		<button onclick = "blockUserAlert()" style = "margin-top: 5px; margin-left:900px; position: absolute;"> 글작성</button>
        	</c:if>
        	<c:if test="${not empty member }">
        		<button onclick = "location.href='${conPath}/boardWriteView.do?gid=${gid }'" style = "margin-top: 5px; margin-left:900px; position: absolute;"> 글작성 </button>
        	</c:if>
			<c:if test="${empty member }">
				<button onclick = "location.href='${conPath}/loginView.do?next=boardWriteView.do?gid=${gid }'" style = "margin-top: 5px; margin-left:900px; position: absolute;"> 글작성 </button>
			</c:if>        	        
        	<button onclick = "location.href='${conPath}/boardList.do?gid=${gid }'" style = "margin-top: 5px; margin-left:980px; position: absolute;"> 전체글 </button>
        </div>
    </div>
	<div id="board-search">
        <div class="container" style = "margin-left: 10%; margin-top: 5px;">               
                <form action="${conPath }/boardList.do" method= "get">
                <input type = "hidden" name = "gid" value = "${gid }"> 
                	<table>
                		<tr>
                        	<td><select id = "query" name = "query">
             		            <option value = "btitle" selected="selected">제목</option>                        
                     		    <option value = "mname">작성자</option>
                        		</select></td>
                        	<td><input type="text" name="searchWord" placeholder="검색어를 입력해주세요."></td>                        
                        	<td><button>검색</button></td>
                        </tr>
                	</table>                            
                </form>            
        </div>
    </div>    	
</section>
<div id = "paging" style = "padding-left: 100px; display: block;"> 
		<c:if test="${startPage >BLOCKSIZE }">
			<a href = "${conPath }/boardList.do?gid=${gid }&pageNum=${startPage-1 }">[이전]</a>
		</c:if>
		<c:forEach var = "i" begin = "${startPage }" end = "${endPage }">
			<c:if test = "${i eq pageNum }">
			[<b style = "color: red;"> ${i }</b>]
			</c:if>
			<c:if test = "${i != pageNum }">
				<a href = "${conPath }/boardList.do?gid=${gid }&pageNum=${i }">[${i }]</a>
			</c:if>
		</c:forEach>
		<c:if test = "${endPage < pageCnt }">
			<a href = "${conPath }/boardList.do?gid=${gid }&pageNum=${endPage+1 }">[다음]</a>
		</c:if>		
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>