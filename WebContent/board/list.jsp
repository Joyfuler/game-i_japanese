<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드래곤플라이 게시판</title>
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
<section class="notice">
  <div class="page-title">
        <div class="container">
            <h3 style = "text-align:left; color: #212529;"><img src = "../img/thum10.jpg" height = "44px"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;드래곤플라이 게시판</b></h3>           
          
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
                <tr>
                    <td>3</td>
                    <th>
                      <a href="#!">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
                      <p>테스트</p>
                    </th>
                    <td>2017.07.13</td>
                    <td>아이조아</td>
                    <td>10</td>
                </tr>

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
        	<button style = "margin-top: 5px; margin-left:900px; position: absolute;"> 글작성 </button>        
        	<button style = "margin-top: 5px; margin-left:980px; position: absolute;"> 전체글 </button>
        </div>
    </div>
	<div id="board-search">
        <div class="container" style = "margin-left: 10%; margin-top: 5px;">               
                <form action="">        
                	<table>
                		<tr>
                        	<td><select id = "searchQuery" name = "searchQuery">
                        <option value = "btitle" selected="selected">제목</option>
                        <option value = "bcontent">내용</option>
                        <option value = "bwriter">작성자</option>
                        </select></td>
                        <td><input type="text" name="searchWord" placeholder="검색어를 입력해주세요." value=""></td>                        
                        <td><button>검색</button></td>
                	</table>                            
                </form>            
        </div>
    </div>    	
</section>
<div id = "paging" style = "padding-left: 100px; display: block;"> 
		[이전 ] 1 2 3 4 5 [다음]
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>