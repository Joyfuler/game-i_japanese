<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script> -->
<link href="${conPath }/css/style2.css" rel = "stylesheet">
<link rel="icon" type="image/x-icon" href="${conPath }/img/logo4.gif" sizes="144x144">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>             
<script> 
        $(document).ready(function() {
        	$('#searchForm').on('submit', function (event) {
            	event.preventDefault();
            	var searchInput = $('#searchInput');
            if (searchInput.val().trim() === '') {                
                searchInput.val('${searchWord.sword}');
            }            
            this.submit();
        });
      });
</script>
<script>	
	function noImage(imageElement) {
	 	imageElement.src = "${conPath }/img/noimg.jpg";
	}
	</script>
</head>
<body>
	 <div class = "controller">
          <ul>
          	<c:if test = "${empty member }">			          
            	<li><a class = "control" href = "${conPath }/loginView.do">로그인</a></li>            
            	<li><a class = "control" href = "${conPath }/findAccountView.do">아이디/비밀번호찾기</a></li>            
            	<li><a class = "control" href = "${conPath }/joinView.do">회원가입</a></li>
            </c:if>
            <c:if test = "${not empty member }">
            	<li><a class = "control" href = "${conPath }/modifyChk.do?mid=${member.mid }">회원정보수정</a></li>
            	<li><a class = "control" href = "${conPath }/logout.do">로그아웃</a></li>
            	<li><img src = "${conPath }/memberPhotoUp/${member.mphoto }" height = "25"><a class = "control" href = "#"><b>${member.mnickname } </b>님</a></li>            
            </c:if>
            <c:if test = "${not empty member and member.mlevel eq 1 }">
           		 <li><a class = "control" href = "${conPath }/admin.do?idx=0" style = "color: red;">관리자모드</a></li>
            </c:if>
          </ul>
        </div>
        <nav class="navbar navbar-expand-lg navbar-light bg-dark navbar-dark">
            <div class="container-fluid">
              <a class="navbar-brand" href="${conPath }/index.jsp"><img src = "${conPath }/main/img/logo6.png" height = "35"> &nbsp;Game - i</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
              	 <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav me-auto">
                  <li class="nav-item item1">
              	      <a class="nav-link" aria-current="page" href="${conPath }/index.jsp">평점목록</a>
                  </li>
                  <li class="nav-item">
                	  <a class="nav-link" href="${conPath }/boardList.do?gid=notice">공지사항</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="${conPath }/intro.do">Game-i소개</a>
                  </li>      
                  <li class="nav-item">
                      <a class="nav-link" href="${conPath }/boardList.do?gid=qna">문의게시판</a>
                  </li>    
                  <li class="nav-item">
                      <a class="nav-link" href="${conPath }/modifyFavoriteView.do" onclick = "window.open(this.href,'즐겨찾기수정','resizable=no width=450 height=550');return false">즐겨찾기</a>
                  </li>                                                         
                </ul>
                <button class="navbar-toggler" type="button" id="closeMenuButton">▲닫기</button>
                <script>
  $(document).ready(function() {    
    $('#closeMenuButton').click(function() {
      $('.navbar-collapse').collapse('hide');
    });
  });
</script>
              </div>
            </div>
          </nav>    
          <div class="search">          
            <form action ="${conPath }/main.do" method = "get" id="searchForm">
            	<c:if test = "${empty param.query }">                
                	<input style="padding-left: 10px;" id = "searchInput" class = "searchBox" type="text" name="query" placeholder="${searchWord.sintro }" style = "margin:auto;"/>
                </c:if>
                <c:if test = "${not empty param.query }">
                	<input style="padding-left: 10px;" id = "searchInput" class = "searchBox" type="text" name="query" placeholder="${param.query }" style = "margin:auto;"/>
                </c:if>
                <button type = "submit" style = "border:0; background: transparent">
                <img src="${conPath }/main/img/searchbutton.png" width="30" height="30" alt ="submit" class = "searchButton">
                </button><br><br>
             </form>               
          </div>           
          <div class="text-center">          	
            <div class="row row1 bg-dark text-white" style = "margin:0 5px 0 5px;">
              <c:forEach var = "dto" items = "${lists }" begin="0" end="5">
              	<div class="col-2"><a href = "${conPath }/review.do?gid=${dto.gid }"><img src = "${conPath }/img/${dto.gicon }" height="25" class = "thum" onerror="noImage(this)">${dto.gname }</a></div>              
              </c:forEach>
            </div>
            <div class="row row2 bg-dark text-white" style = "margin:0 5px 0 5px;">
              <c:forEach var = "dto" items = "${lists }" begin = "6" end = "11">                            
              	<div class="col-2"><a href = "${conPath }/review.do?gid=${dto.gid }"><img src = "${conPath }/img/${dto.gicon }" height="25" class = "thum" onerror="noImage(this)">${dto.gname }</a></div>
              </c:forEach>                            
            </div>
            <div class="row row3 bg-dark text-white" style = "margin:0 5px 0 5px;">
              <c:forEach var = "dto" items = "${lists }" begin = "12" end = "17">
              	<div class="col-2"><a href = "${conPath }/review.do?gid=${dto.gid }"><img src = "${conPath }/img/${dto.gicon }" height="25" class = "thum" onerror="noImage(this)">${dto.gname }</a></div>
              </c:forEach> 
            </div>
          </div>    
          <hr>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>