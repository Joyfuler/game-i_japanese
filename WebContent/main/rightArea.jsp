<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="${conPath }/css/style2.css" rel = "stylesheet">
<link rel="icon" type="image/x-icon" href="${conPath }/main/img/logo4.gif" sizes="144x144">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>   
<script>
	$(document).ready(function(){
		$('.tab-content[data-tab="b1"]').show('fast');
		$('.tab-content[data-tab="b2"]').hide('fast');
		
		$('.b1').click(function(){
			$('.tab-content[data-tab="b1"]').show('fast');
			$('.tab-content[data-tab="b2"]').hide('fast');
		});
		
		$('.b2').click(function(){
			$('.tab-content[data-tab="b1"]').hide('fast');
			$('.tab-content[data-tab="b2"]').show('fast');
		});
	});
</script>
	<div class = "content">
       <!-- 우측 게임순위 목록 -->			        
       <div class="m-right_gameRank">
        <div class = "Ranktitle">
        <b class = "b1" style = "cursor:pointer;">방문TOP</b>&nbsp;&nbsp;|&nbsp;&nbsp;<b class = "b2" style = "cursor:pointer;">최근리뷰</b><br>
        </div>
        
        <!--  방문TOP 목록 -->
        <c:set var="idx" value = "1"/>	 	
        <c:forEach var = "viewTop10" items = "${rightAreaViewTop10 }">	
          	<ul class ="tab-content" data-tab= "b1" onclick="location.href='${conPath }/review.do?gid=${viewTop10.gid }'">          
          		<li class="rank-gameNum"><strong>${idx }</strong></li>
          		<li class="rank-appicon"><a href = "${conPath }/review.do?gid=${viewTop10.gid }"><img src="${conPath }/img/${viewTop10.gicon }" alt="" onerror="noImage(this)" /></a></li>
          		<li class="rank-gameName">          			
            		<a href = "${conPath }/review.do?gid=${viewTop10.gid }"><strong>${viewTop10.gname }</strong></a>
            		<a href = "${conPath }/review.do?gid=${viewTop10.gid }"><span> ${viewTop10.gpub }</span></a>
          		</li>            
        	</ul>
        <c:set var = "idx" value = "${idx +1}"/>	
        </c:forEach>
     
        <!--  최근리뷰 목록 -->
        <c:set var = "idx2" value = "1"/>
        <c:forEach var = "newReview" items = "${rightAreaNewReview }">
         	<ul class = "tab-content" data-tab= "b2" onclick="location.href='${conPath}/review.do?gid=${newReview.gid }'">
          		<li class="rank-gameNum"><strong>${idx2 }</strong></li>
          		<li class="rank-appicon"><a href = "${conPath }/review.do?gid=${newReview.gid }"><img src="${conPath }/img/${newReview.gicon }" alt="" onerror="noImage(this)" /></a></li>
          		<li class="rank-gameName">
            		<a href = "${conPath }/review.do?gid=${newReview.gid }"><strong>${newReview.gname }</strong></a>
            		<a href = "${conPath }/review.do?gid=${newReview.gid }"><span>${newReview.gpub }</span></a>
          		</li>            
        	</ul>
        <c:set var = "idx2" value = "${idx2 +1 }"/>	
        </c:forEach>        
    </div>       
  <!-- 우측 즐겨찾기 영역-->  
  <div class="m-right_favorite"  style="z-index:1000">
    <p class="favorite_title">&nbsp;&nbsp;내 즐겨찾기</p>
    <table>
                <tr>
          <td class="td01"><img src="${conPath }/img/thum10.jpg" alt="" onerror="noImage(this)"/> <a href="#favorite1">즐겨찾기1</a></td>
        </tr>
                <tr>
          <td class="td01"><img src="${conPath }/img/thum11.jpg" alt="" onerror="noImage(this)"/> <a href="#favorite2">즐겨찾기2</a></td>
        </tr>
                <tr>
          <td class="td01"><img src="${conPath }/img/thum12.jpg" alt="" onerror="noImage(this)"/> <a href="#favorite3">즐겨찾기3즐겨찾기3</a></td>
        </tr>
                <tr>
          <td class="td01"><img src="${conPath }/img/thum13.jpg" alt="" onerror="noImage(this)"/> <a href="#favorite4">즐겨찾기4즐겨찾기4즐겨찾기4</a></td>
        </tr>
                <tr>
          <td class="td01"><img src="${conPath }/img/thum14.jpg" alt="" onerror="noImage(this)"/> <a href="#favorite5">즐겨찾기5즐겨찾기5즐겨찾기5즐겨찾기5</a></td>
        </tr>
        <tr><td></td></tr>
        <tr>
        <td><a href ="#" onclick = "window.open('/1st_project/main/favorite_modify.jsp','즐겨찾기수정','resizable=no width=450 height=550');return false" id = "favorite_a">즐겨찾기 관리</a></td>
        </tr>
        <tr><td></td></tr>       
    </table>        
	</div>
</div>	
</body>
</html>