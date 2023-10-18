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
        window.onload = function() {
        document.getElementById('searchForm').addEventListener('submit', function (event) {
            event.preventDefault();
            var searchInput = document.getElementById('searchInput');
            if (searchInput.value.trim() === '') {                
                searchInput.value = '세나키우기';
            }            
            this.submit();
        });
      }
</script>
</head>
<body>
	 <div class = "controller">
          <ul>
          	<li><a class = "control" href = "${conPath }/admin/admin.jsp">관리자모드</a></li>
			<li><a class = "control" href = "${conPath }/main/modifyChk.jsp">회원정보수정</a></li>          
            <li><a class = "control" href = "${conPath }/main/loginForm.jsp">로그인</a></li>            
            <li><a class = "control" href = "${conPath }/main/findAccount.jsp">아이디/비밀번호찾기</a></li>            
            <li><a class = "control" href = "${conPath }/main/joinForm.jsp">회원가입</a></li>
          </ul>
        </div>
        <nav class="navbar navbar-expand-lg navbar-light bg-dark navbar-dark">
            <div class="container-fluid">
              <a class="navbar-brand" href="${conPath }/index.jsp"><img src = "${conPath }/main/img/logo6.png" height = "35"> &nbsp;Game-i</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav me-auto">
                  <li class="nav-item item1">
                    <a class="nav-link" aria-current="page" href="${conPath }/index.jsp">메인페이지</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#notice">공지사항</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${conPath }/main/intro.jsp">Game-i소개</a>
                  </li>      
                     <li class="nav-item">
                      <a class="nav-link" href="#qna">문의게시판</a>
                    </li>    
                    <li class="nav-item">
                      <a class="nav-link" href="${conPath }/main/favorite_modify.jsp" onclick = "window.open(this.href,'즐겨찾기수정','resizable=no width=450 height=550');return false">즐겨찾기</a>
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
            <form action ="${conPath }/main/search.jsp" method = "get" id="searchForm">                
                <input style="padding-left: 10px;" id = "searchInput" class = "searchBox" type="text" name="query" placeholder="요즘핫한 신작, 세나키우기 평가하러 Go!"/>
                <button type = "submit" style = "border:0; background: transparent">
                <img src="${conPath }/main/img/searchbutton.png" width="30" height="30" alt ="submit" class = "searchButton">
                </button><br><br>
             </form>               
          </div>           
          <div class="text-center">          	
            <div class="row row1 bg-dark text-white" style = "margin:0 5px 0 5px;">
              <c:forEach var = "dto" items = "${lists }" begin="0" end="5">
              	<div class="col-2"><a href = "${conPath }/review.do?gid=${dto.gid }"><img src = "${conPath }/img/${dto.gicon }" height="25" class = "thum">${dto.gname }</a></div>              
              </c:forEach>
            </div>
            <div class="row row2 bg-dark text-white" style = "margin:0 5px 0 5px;">
              <c:forEach var = "dto" items = "${lists }" begin = "6" end = "11">                            
              	<div class="col-2"><a href = "${conPath }/review.do?gid=${dto.gid }"><img src = "${conPath }/img/${dto.gicon }" height="25" class = "thum">${dto.gname }</a></div>
              </c:forEach>                            
            </div>
            <div class="row row3 bg-dark text-white" style = "margin:0 5px 0 5px;">
              <c:forEach var = "dto" items = "${lists }" begin = "12" end = "17">
              	<div class="col-2"><a href = "${conPath }/review.do?gid=${dto.gid }"><img src = "${conPath }/img/${dto.gicon }" height="25" class = "thum">${dto.gname }</a></div>
              </c:forEach> 
            </div>
          </div>    
          <hr>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>