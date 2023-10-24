<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>관리자모드</title>
	<link href = "${conPath }/css/style2.css" rel = "stylesheet">
	<link href = "${conPath }/css/admin.css" rel = "stylesheet">
	<link rel="icon" type="image/x-icon" href="${conPath }/img/logo4.gif" sizes="144x144">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>	
	<script>
	function displayImg(input){
		if (input.files && input.files[0]){
			var reader = new FileReader();			
			reader.onload = function(e){
				$('#preview').attr('src', e.target.result);
				$('#preview').css('display', 'inline');
			};				
			reader.readAsDataURL(input.files[0]);
		}
	}
	</script>
	<script>
		$(function() {
			var idx = Number('${param.idx}');
		  $( "#tabs" ).tabs({active: idx});
		});
	</script>
	<script>
	 $(function() {
		    $( "#datepicker" ).datepicker({
		    	dateFormat: "yy-mm-dd",
		    	monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
		    	monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
		    	showMonthAfterYear: true, 
		    	yearSuffix: "년", 
		    	changeMonth: true, 
		    	changeYear: true, 
		    	yearRange: "c-100:c+10", 
		    });
		  });
	</script>	
	<c:if test = "${not empty result }">	
	<script>
		alert('${result}');
	</script>	
	</c:if>
	<script>
	$(document).ready(function(){
		$('input[name="gid"]').keyup(function(){
			var gid = $(this).val();
			$.ajax({
				url: '${conPath}/gameExistCheck.do',
				type : 'post',
				data: {gid : gid },
				dataType : 'html',
				success : function(data){
					$('.existChk').html(data);
				},				
			});
		});
	});
	
	</script>
</head>
<body>	
	<div class = "controller">
          <ul>          	
            <li><a class = "control" href = "${conPath }/main.do">메인페이지</a></li>
          	<li><a class = "control" href = "${conPath }/admin.do?idx=0">관리자모드</a></li>			          
            <li><a class = "control" href = "${conPath }/logout.do">로그아웃</a></li>            
          </ul>
    </div>
	<div id="tabs">
		<ul>
	    	<li><a href="#tabs-1">회원 리스트 출력</a></li>
	    	<li><a href="#tabs-2">신규 게임 추가</a></li>
	    	<li><a href="#tabs-3">게임정보 변경</a></li>
	    	<li><a href="#tabs-4">관리자 추가/제거</a></li>
	    	<li><a href="#tabs-5">상단메뉴 관리</a></li>
	  </ul>
	  <div id="tabs-1">
	    <p>
			회원리스트 (총 <b style = "color:red;">${totCnt }</b>명)
		</p>	
		<table>
			<tr style = "border-bottom: 1px solid gray;">
				<th> ID </th><th> 닉네임 </th><th>이메일</th><th>휴대폰번호</th><th>프로필사진</th><th>멤버등급</th><th>차단</th>
			</tr>
			<c:forEach var = "list" items = "${memberList }">
			<tr>
				<td> ${list.mid }</td><td>${list.mnickname }</td><td>${list.memail }</td><td>${list.mphone }</td>
				<td><img src = "${conPath}/memberPhotoUp/${list.mphoto }" height= "25px"></td>
				<td>${list.mlevel }</td>
				<c:if test = "${list.mlevel eq 0 }">
				<td><button class = "blockUser" data-id = "${list.mid }" onclick = "location.href='${conPath}/adminBlockUser.do?mlevel=${list.mlevel }&mid=${list.mid }'" > 차단</button></td>
				</c:if>
				<c:if test = "${list.mlevel eq -2 }">
				<td><button class = "blockUser" data-id = "${list.mid }" onclick = "location.href='${conPath}/adminBlockUser.do?mlevel=${list.mlevel }&mid=${list.mid }'"> 차단해제</button></td>
				</c:if>
				<c:if test = "${list.mlevel eq -1 }">
				<td>(탈퇴유저)</td>
				</c:if>
			</tr>	
			</c:forEach>
		</table>
			<div class = "paging" style = "padding-left: 100px;"> 
				<c:if test="${startPage >BLOCKSIZE }">
					<a href = "${conPath }/admin.do?idx=0&pageNum=${startPage-1 }">[이전]</a>
				</c:if>
				<c:forEach var = "i" begin = "${startPage }" end = "${endPage }">
					<c:if test = "${i eq pageNum }">
						[<b style = "color: red;"> ${i }</b>]
					</c:if>
					<c:if test = "${i != pageNum }">
						<a href = "${conPath }/admin.do?idx=0&pageNum=${i }">[${i }]</a>
					</c:if>
				</c:forEach>
				<c:if test = "${endPage < pageCnt }">
					<a href = "${conPath }/admin.do?&idx=0&pageNum=${endPage+1 }">[다음]</a>
				</c:if>		
			</div>	
	  </div>
	  
	  <!--  두번째 탭 영역 -->
	  <div id="tabs-2">
	     <form action = "${conPath }/adminAddGame.do" method = "post" enctype = "multipart/form-data">
	    	<table>	   
	    		<tr>
	    			<th>게시판아이디</th>
	    			<td><input type = "text" name = "gid"><br><br>
	    			<p style = "color: red; font-size: 0.9em;" class = "existChk">&nbsp; &nbsp; &nbsp;</p>
	    			</td>
	    		</tr>		
	    		<tr>
	    			<th>게임명</th>
	    			<td><input type = "text" name = "gname"></td>
	    		</tr>
	    		<tr>
	    			<th>장르</th>
	    			<td><input type = "text" name = "ggenre"></td>
	    		<tr>
	    			<th>개발사</th> 
	    			<td><input type = "text" name = "gpub"></td>
	    		</tr>
	    		<tr>	
	    			<th>출시일</th>
	    			<td><input type = "text" name = "gpdate" id = "datepicker" placeholder = "클릭해 달력 열기"></td>
	    		</tr>
	    		<tr>	
	    			<th>게임아이콘 <br>(1:1 비율, 100x100 권장)</th>
	    			<td><input type = "file" name ="gicon" onchange = "displayImg(this)" style = "margin-top:20px;"><img id = "preview" height = "45px"></td>
	    			
	    		</tr>
	    		<tr>	    			
	    			<th>게임설명 </th>
	    			<td>
	    			<textarea cols="20" rows="3" name = "gdesc"></textarea>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td><input type = "submit" value = "게임추가" style = "width: 200px;">	
	    	</table>
	    </form>	    	    	    		
	  </div>  
	  <div id="tabs-3">
	   	<form action = "${conPath }/modifyGame.do">
	   	<input type = "hidden" id = "gid">
	    	<table>	   
	    		<tr>
	    			<th>게시판아이디</th>
	    			<td><input type = "text" id = "gidSearch"></td><td><input type = "button" value = "검색" class = "gameSearch"></td> 	
	    		<tr>
	    			<th>게임명</th>
	    			<td><input type = "text" id = "gname"></td>
	    		</tr>
	    		<tr>
	    			<th>개발사</th> 
	    			<td><input type = "text" id = "gpub"></td>
	    		</tr>
	    		<tr>	
	    			<th>출시일</th>
	    			<td><input type = "text" id = "grel"></td>
	    		</tr>
	    		<tr>	
	    			<th>게임아이콘</th>
	    			<td><input type = "file" id ="gicon" onchange = "displayImg(this)" style = "margin-top:20px;"><img id = "preview" height = "100"></td>
	    			
	    		</tr>
	    		<tr>	    			
	    			<th>게임설명 </th>
	    			<td>
	    			<textarea cols="20" rows="3" id = "gdes"></textarea>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td><input type = "submit" value = "정보변경">	
	    	</table>
	    </form>	    
	  </div>
	   <div id="tabs-4">	   		
	    	<table>	   
	    		<tr>
	    			<th>아이디 검색</th>
	    			<td><input type = "text" id = "gid"></td><td><input type = "button" value = "검색" class = "gameSearch"></td>	    				    			
	    		</tr>	    		
	    		<tr>
	    			<td><!-- 각 버튼마다 location.href = ~do 로 보냄. -->
	    			<input type = "button" value = "관리자추가" id = "addAdmin" style = "width:150px;">
	    			&nbsp;	    					    			
	    			<input type = "button" value = "관리자삭제" id = "removeAdmin" style = "width:150px;">
	    			</td>	    		
	    			<td><span class = "searchResult"></span></td>	
	    		</tr>			    			
	    	</table>	    
	  </div>
	   <div id="tabs-5">
	   	<form action = "">	   		
	    	<table>	   
	    		<tr>
	    			<th>상단메뉴 관리</th>
	    		</tr>
	    		<tr>
	    			<td> 1. ㅇㅇㅇ</td> <td> 2. ㄴㄴㄴ </td><td> 3. ㅋㅋㅋ </td> <td> 4. ㄹㅇㄴㅁㄹㅇㄴㅁ</td> <td> 5. gfdaggg</td>
	    		</tr>					    			
	    		<tr>
	    			<td> 1. ㅇㅇㅇ</td> <td> 2. ㄴㄴㄴ </td><td> 3. ㅋㅋㅋ </td> <td> 4. ㄹㅇㄴㅁㄹㅇㄴㅁ</td> <td> 5. gfdaggg</td>
	    		</tr>
	    		<tr>
	    			<td> 1. ㅇㅇㅇ</td> <td> 2. ㄴㄴㄴ </td><td> 3. ㅋㅋㅋ </td> <td> 4. ㄹㅇㄴㅁㄹㅇㄴㅁ</td> <td> 5. gfdaggg</td>
	    		</tr>
	    		<tr>
	    			<th> 내릴 게임을 선택 (선택한 것은 제출시 ghit을 0으로 만듦)</th>
	    		</tr>	
	    		<tr>	
	    			<td>
	    				<input type = "text" id= "removeMenu">
	    			</td>
	    		</tr>	
	    		<tr>
	    			<th> 올릴 게임을 선택 (선택한 것은 제출시 ghit를 1로 변경)</th>
	    		</tr>
	    		<tr>	    			
	    			<td>
	    				<input type = "text" id = "addMenu">
	    			</td>
	    		</tr>
	    		<tr>
	    			<td><input type = "submit">
	    		<tr>	
	    	</table>	
	    </form>    
	    <form action = "">
	    	<table>
	    		<tr>
	    			<th>
	    			상단 이미지 영역 설정
	    			</th>
	    		</tr>
	    		<tr>	    		
	    			<td> 1번 이미지 : <input type = "file" name = "article1Img"></td>
	    			<td> 1번 주소링크 : <input type = "text" name = "article1Text"></td>
	    		</tr>	  
	    		<tr>	    		
	    			<td> 2번 이미지 : <input type = "file" name = "article2Img"></td>
	    			<td> 2번 주소링크 : <input type = "text" name = "article2Text"></td>
	    		</tr>
	    		<tr>	    		
	    			<td> 3번 이미지 : <input type = "file" name = "article3Img"></td>
	    			<td> 3번 주소링크 : <input type = "text" name = "article3Text"></td>
	    		</tr>
	    		<tr>	    		
	    			<td> 4번 이미지 : <input type = "file" name = "article4Img"></td>
	    			<td> 4번 주소링크 : <input type = "text" name = "article4Text"></td>
	    		</tr>
	    	</table>
	    </form>
	  </div>
	</div>
</body>
</html>