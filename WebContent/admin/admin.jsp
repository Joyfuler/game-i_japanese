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
	<title>管理者モード</title>
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
				$('.preview').attr('src', e.target.result);
				$('.preview').css('display', 'inline');
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
		    $( ".datepicker" ).datepicker({
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
			let gid = $(this).val();
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
		
		$('.gidSearch').click(function(){
			let gid = $('.modifyGid').val();			
			$.ajax({
				url: '${conPath }/getModifyGameInfo.do',
				type : 'get',
				data: 'gid='+gid,
				dataType : 'json',
				success : function(data){					
					$('.modifyGid').val(data[0].gid);
					$('.modifyGname').val(data[0].gname);
					$('.modifyGgenre').val(data[0].ggenre);
					$('.modifyGpub').val(data[0].gpub);
					$('.modifyGpdate').val(data[0].gpdate);
					$('input[name="dbGicon"]').val(data[0].gicon);
					$('img.preview').attr('src','${conPath }/img/'+data[0].gicon);
				},				
			});
		});	
		
		$('.midSearch').click(function(){
			let mid = $('.midInput').val();
			$.ajax({
				url : '${conPath }/getAccountInfo.do',
				type : 'get',
				data : 'mid='+mid,
				dataType : 'html',
				success : function(data){					
					$('.midSearchResult').html(data);
				},
			})
		});
		
		$('#addAdmin').click(function(){
			var mid = $('.midInput').val();
			location.href = '${conPath}/adminSetup.do?method=add&mid='+mid;
		});
		
		$('#removeAdmin').click(function(){
			var mid = $('.midInput').val();
			location.href = '${conPath}/adminSetup.do?method=remove&mid='+mid;
		});
		
		$('td.topGameList').click(function(){
			var gname = $(this).text().trim();
			var gid = $(this).data('id');			
			$('#removeMenuGname').val(gname);
			$('#removeMenuGid').val(gid);
		});		
		
		$('.searchGname').click(function(){
			var gid = $('#addMenu').val();
			$.ajax({
				url: '${conPath }/getModifyGameInfo.do',
				type : 'get',
				data: 'gid='+gid,
				dataType : 'json',
				success : function(data){					
					$('.gidSearchResult').text( '게임명:' + data[0].gname + ' / ' + '개발사:' + data[0].gpub);
				},	
			});
		});		
		
		$('.articleImg').click(function(){
			var artid = $(this).data('id');
			var link1 = $(this).siblings('span.articleId').data('id');
			var imgSrc = $(this).attr('src');
			$('.artid').val(artid);
			$('.link1').val(link1);
			$('.preview').attr('src', imgSrc);
			$('.dbimg1').val(imgSrc.split('/').pop());
		});
		
		$('.searchWordModify').click(function(){
			var sid = $(this).parent().find('input[name="sintro"]').data('id');
			var sintro = $(this).parent().find('input[name="sintro"]').val();
			var sword = $(this).parent().find('input[name="sword"]').val();
			$.ajax({
				url: '${conPath }/modifySearchWord.do',
				type : 'POST',
				data : {sid : sid, sintro : sintro, sword : sword},
				dataType : 'html',
				success : function(data){
					alert(data);
				},
			});
		});	
	});	
	</script>
</head>
<body>	
<c:if test = "${empty member and member.mlevel != 1}">
	<jsp:forward page="${conpath }/main.do"/>
</c:if>
	<div class = "controller">
          <ul>
            <li><a class = "control" href = "${conPath }/admin.do?idx=0" style = "color:red;">관리자모드</a></li>          	
            <li><a class = "control" href = "${conPath }/main.do">메인페이지</a></li>          				          
            <li><a class = "control" href = "${conPath }/logout.do">로그아웃</a></li>            
          </ul>
    </div>
	<div id="tabs">
		<ul>
	    	<li><a href="#tabs-1">会員リスト</a></li>
	    	<li><a href="#tabs-2">ゲーム追加</a></li>
	    	<li><a href="#tabs-3">ゲーム情報変更</a></li>
	    	<li><a href="#tabs-4">管理者を追加・解除</a></li>
	    	<li><a href="#tabs-5">上段メニュー管理</a></li>	
	    	<li><a href ="#tabs-6">通報管理</a></li>    	
	  </ul>
	  <div id="tabs-1">
	    <p>
			会員リスト (全部 <b style = "color:red;">${totCnt }</b>人)
		</p>	
		<table>
			<tr style = "border-bottom: 1px solid gray;">
				<th> ID </th><th> ハンドルネーム </th><th>メール</th><th>携帯番号</th><th>プロフィール写真</th><th>会員レベル</th><th>ブラックリスト</th>
			</tr>
			<c:forEach var = "list" items = "${memberList }">
			<tr>
				<td> ${list.mid }</td><td>${list.mnickname }</td><td>${list.memail }</td><td>${empty list.mphone? "携帯なし" : list.mphone }</td>
				<td><img src = "${conPath}/memberPhotoUp/${list.mphoto }" height= "25px"></td>
				<td>${list.mlevel eq 1 ? "管理者" : (list.mlevel eq 0? "일반회원": (list.mlevel eq -2 ? "ブラック会員" : "脱退会員"))}</td>
				<c:if test = "${list.mlevel eq 0 }">
					<td><button class = "blockUser" data-id = "${list.mid }" onclick = "location.href='${conPath}/adminBlockUser.do?mlevel=${list.mlevel }&mid=${list.mid }'" > 追加</button></td>
				</c:if>
				<c:if test = "${list.mlevel eq -2 }">
					<td><button class = "blockUser" data-id = "${list.mid }" onclick = "location.href='${conPath}/adminBlockUser.do?mlevel=${list.mlevel }&mid=${list.mid }'"> 차단해제</button></td>
				</c:if>
				<c:if test = "${list.mlevel eq -1 }">
					<td>(脱退会員)</td>
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
	  
	  <!--  두번째 탭 영역. 신규 게임 추가 -->
	  <div id="tabs-2">
	  <span> 新しく追加するゲームの情報を入力してください。追加すると掲示板が自動的に生成されます</span>
	     <form action = "${conPath }/adminAddGame.do" method = "post" enctype = "multipart/form-data">
	    	<table>	   
	    		<tr>
	    			<th>掲示板ID</th>
	    			<td><input type = "text" name = "gid"><br><br>
	    				<p style = "color: red; font-size: 0.9em;" class = "existChk">&nbsp; &nbsp; &nbsp;</p>
	    			</td>
	    		</tr>		
	    		<tr>
	    			<th>ゲーム名</th>
	    			<td><input type = "text" name = "gname"></td><td></td>
	    		</tr>
	    		<tr>
	    			<th>ジャンル</th>
	    			<td><input type = "text" name = "ggenre"></td>
	    		<tr>
	    			<th>開発社</th> 
	    			<td><input type = "text" name = "gpub"></td>
	    		</tr>
	    		<tr>	
	    			<th>リリース日付</th>
	    			<td><input type = "text" name = "gpdate" class = "datepicker" placeholder = "カレンダーを開く"></td>
	    		</tr>
	    		<tr>	
	    			<th>ゲームアイコン <br>(1:1 比率、 100x100サイズ推奨)</th>
	    			<td><input type = "file" name ="gicon" onchange = "displayImg(this)" style = "margin-top:20px;"><img class = "preview" height = "45px"></td>
	    			
	    		</tr>
	    		<tr>	    			
	    			<th>ゲーム説明 </th>
	    			<td>
	    				<textarea cols="20" rows="3" name = "gdesc"></textarea>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>
	    			<input type = "submit" value = "ゲーム追加" style = "width: 200px; padding: 5px;">
	    			</td>
	    		</tr>		
	    	</table>
	    </form>	    	    	    		
	  </div>  
	  
	  <!--  세 번째 탭 영역. 게임 정보 변경 -->
	  <div id="tabs-3">
	  掲示板IDを入力してください
	   	<form action = "${conPath }/adminModifyGame.do" method = "post" enctype = "multipart/form-data">	   
	   		<input type = "hidden" name = "dbGicon">	
	    	<table>	   
	    		<tr>
	    			<th>掲示板ID</th>
	    			<td>
	    				<input type = "text" id = "gid" name = "gid" class = "modifyGid"></td><td><input type = "button" value = "検索" class = "gidSearch">
	    			</td> 	
	    		<tr>
	    			<th>ゲーム名</th>
	    			<td>
	    				<input type = "text" id = "gname" name = "gname" class = "modifyGname"></td><td></td><td></td><td>
	    			</td>	
	    		</tr>
	    		<tr>
	    			<th>ジャンル</th>
	    			<td>
	    				<input type = "text" id = "ggenre" name = "ggenre" class = "modifyGgenre">
	    			</td>
	    		</tr>	
	    		<tr>
	    			<th>開発社</th> 
	    			<td>
	    				<input type = "text" id = "gpub" name = "gpub" class = "modifyGpub">
	    			</td>
	    		</tr>
	    		<tr>	
	    			<th>リリース日付</th>
	    			<td>
	    				<input type = "text" name = "gpdate" class = "modifyGpdate datepicker">
	    			</td>
	    		</tr>
	    		<tr>	
	    			<th>ゲームアイコン</th>
	    			<td>
	    				<input type = "file" id ="gicon" name = "gicon" class = "modifyGicon" onchange = "displayImg(this)" style = "margin-top:20px;"><img class = "preview" height = "100">
	    			</td>
	    		</tr>
	    		<tr>	
	    			<th>ゲーム説明 </th>
	    			<td>
	    				<textarea name = "gdesc" rows="3" cols="20" placeholder="修正しない場合、既存の説明が適用されます。"></textarea>
	    			</td>
	    		</tr>	    		
	    		<tr>
	    			<td><input type = "submit" value = "情報修正"></td>
	    		</tr>		
	    	</table>
	    </form>	    
	    <hr>
	    <!--  세 번째 탭 영역 하단, 게임 리스트 출력 -->
	    <span>掲示板リスト</span>
	    <table>	    	
			<tr style = "border-bottom: 1px solid gray;">
				<th> 掲示板ID </th><th> ゲーム名 </th><th>ジャンル</th><th>開発社</th><th>アイコン</th><th>リリース日</th><th>アクセス数</th>
			</tr>
			<c:forEach var = "gameLists" items = "${gameList }">
			<tr>
				<td> 
					${gameLists.gid }</td><td>${gameLists.gname }</td><td>${gameLists.ggenre }</td><td>${gameLists.gpub }
				</td>
				<td>
					<img src = "${conPath}/img/${gameLists.gicon }" height= "25px"></td><td>${gameLists.gpdate }</td><td>${gameLists.gviewCount }
				</td>
			</tr>
			</c:forEach>
		</table>		
			<div class = "paging" style = "padding-left: 100px;"> 
				<c:if test="${gameStartPage >GAMEBLOCKSIZE }">
					<a href = "${conPath }/admin.do?idx=2&pageNum=${gameStartPage-1 }">[이전]</a>
				</c:if>
				<c:forEach var = "i" begin = "${gameStartPage }" end = "${gameEndPage }">
					<c:if test = "${i eq pageNum }">
						[<b style = "color: red;"> ${i }</b>]
					</c:if>
					<c:if test = "${i != pageNum }">
						<a href = "${conPath }/admin.do?idx=2&pageNum=${i }">[${i }]</a>
					</c:if>
				</c:forEach>
				<c:if test = "${gameEndPage < gamePageCnt }">
					<a href = "${conPath }/admin.do?&idx=2&pageNum=${gameEndPage+1 }">[다음]</a>
				</c:if>		
			</div>	
	  </div>
	  <!--  네 번째 영역. 관리자 추가 / 제거 -->
	   <div id="tabs-4">	  
	   	<span>관리자를 추가하거나 삭제할 수 있습니다.</span> 	   		
	    	<table>	   
	    		<tr>
	    			<th>아이디 검색</th>
	    			<td>
	    				<input type = "text" name = "mid" class = "midInput"></td><td><input type = "button" value = "검색" class = "midSearch">
	    			</td>
	    		</tr>
	    		<tr>	
	    			<td></td>
	    			<td>
	    				<span class = "midSearchResult" style = "color: red;"></span>
	    			</td>	    				    				    			
	    		</tr>
	    		<tr>
	    			<td>
	    				<input type = "button" value = "관리자추가" id = "addAdmin" style = "width:150px;"> &nbsp; &nbsp; 
	    				<input type = "button" value = "관리자삭제" id = "removeAdmin" style = "width:150px;">
	    			</td>
	    		</tr>			    			
	    </table>	    
	  </div>
	   <div id="tabs-5">
	   <!--  다섯번째 영역. 게시판 상단 메뉴 관리 -->	   		   		
	    	<table>	   
	    		<tr>
	    			<th>おすすめリスト管理</th>
	    		</tr>
	    		<tr>
	    		<c:set var="idx" value="1"/>
	    		<c:forEach var = "dto" items = "${topGameList }" begin="0" end="5">	    		
	    			<td class = "topGameList" data-id = "${dto.gid }" style = "cursor:pointer;">
	    				${idx }) ${dto.gname }
	    			</td>
	    		<c:set var = "idx" value = "${idx +1 }"/>	
	    		</c:forEach>
	    		</tr>
	    		<tr>
	    		<c:forEach var = "dto" items = "${topGameList }" begin="6" end="11">	    		
	    			<td class = "topGameList" data-id= "${dto.gid }" style = "cursor:pointer;">
	    				${idx }) ${dto.gname }
	    			</td>	    		
	    		<c:set var = "idx" value = "${idx +1 }"/>
	    		</c:forEach>
	    		</tr>
	    		<tr>	    		
	    		<c:forEach var = "dto" items = "${topGameList }" begin="12" end="17">	    		
	    			<td class = "topGameList" data-id="${dto.gid }" style = "cursor:pointer;">
	    				${idx }) ${dto.gname }
	    			</td>
	    		<c:set var = "idx" value = "${idx +1 }"/>	
	    		</c:forEach>
	    		</tr>	    		
	    		<tr>
	    			<th>クリックしておすすめリストから削除</th>
	    		</tr>	
	    		<tr>	
	    			<td>
	    				<form action = "${conPath }/topMenuSetup.do">
	    				<input type = "hidden" name = "method" value = "remove">
	    				<input type = "text" id= "removeMenuGname">
	    				<input type = "text" id = "removeMenuGid" name = "gid" readonly="readonly"><input type = "submit" value = "削除">	    				
	    				</form>
	    			</td>
	    		</tr>	    		
	    		<tr>
	    			<th> おすすめリストに登録</th>
	    		</tr>
	    		<tr>	    			
	    			<td>
	    				<form action = "${conPath }/topMenuSetup.do">
	    				<input type = "text" id = "addMenu" name = "gid"><input type = "button" class = "searchGname" value = "ID検索">
	    				<input type = "hidden" name = "method" value = "add">
	    			</td>
	    			<td>	
	    				<span class = "gidSearchResult">&nbsp; &nbsp; </span><br>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>		
	    				<c:if test = "${topGameList.size() >= 18 }">
	    				<input type = "button" value = "登録" style = "color: gray;"><br><br>
	    				<b style = "color: red;">(おすすめリストは  <br>
	    				最大18個まで登録出来ます) </b>
	    				</c:if>
	    				<c:if test = "${topGameList.size() < 18 }">
	    				<input type = "submit" value = "登録">
	    				</c:if>
	    				</form>	    				
	    			</td>
	    		</tr>
	    		<tr>	    			
	    		<tr>	
	    	</table>	    
	    <!--  다섯 번째 메뉴 하단 기사 변경 메뉴  -->   
	    <form action = "${conPath }/articleModify.do" method = "post" enctype = "multipart/form-data">	    
	    	<table>
	    		<tr>
	    			<th>
	    				バナーイメージ変更 <br>(クリックして変更するイメージ選択ー<br>サイズは 265 x 400で統一してください)
	    			</th>
	    		</tr>
	    		<tr>
	    			<c:set var= "idx" value="1"/>
	    			<c:forEach var="articles" items="${articleList }">	    				    		
	    				<td>
	    					イメージ${idx }<br><img data-id= "${articles.artid }" src = "${conPath }/img/${articles.img1 }" class = "articleImg"><br>
	    					掲示板ID : <span data-id = "${articles.link1}" class = "articleId">${articles.link1 }</span>
	    				</td>
	    			<c:set var = "idx" value = "${idx +1 }"/>	 
	    			</c:forEach>	    			
	    		</tr>
	    		<tr>
	    			<td>
	    				選択イメージ: <input type = "text" name = "artid" class = "artid">
	    			</td>
	    			<td>	
	    				イメージアップロード<br>(しない場合、既存のイメージ適用) <input type = "file" name = "img1" onchange = "displayImg(this)">
	    			</td>
	    			<td>
	    				<img class = "preview" height = "100px">
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>	
	    				掲示板ID: <input type = "text" name = "link1" class = "link1">
	    				<input type = "hidden" name = "dbimg1" class = "dbimg1">
	    			</td>
	    			<td>	    			
	    				<input type = "submit" value = "イメージ変更">
	    			</td>
	    		</tr>		
	    	</table>
	    </form>	    
	    	<table>
	    		<tr>
	    			<th> 上段検索ワード編集 </th>
	    		</tr>	    		
	    			<c:set var= "idx" value="1"/>
	    			<c:forEach var="searchWord" items="${searchWordList }">
	    				<tr>	    				    		
	    					<td>
	    						${idx }번 문구 <br><input type = "text" name = "sintro" data-id="${idx }" value = "${searchWord.sintro }"><br><br>
	    						${idx }번 검색어<br><input type = "text" name = "sword" value = "${searchWord.sword }"><br><br>
	    						<input type = "button" value = "변경" style = "width: 250px;" class = "searchWordModify">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td><hr></td>
	    				</tr>		    				
	    			<c:set var = "idx" value = "${idx +1 }"/>	 
	    			</c:forEach>
	    	</table>
	  </div>
	  
	  <div id = "tabs-6">
	  <!-- 마지막 영역 - 신고 게시글 관리 -->
	  <span>신고된 게시글 리스트</span>
	    <table>	    	
			<tr style = "border-bottom: 1px solid gray;">
				<th> 게시글제목 </th><th> 게시글내용 </th><th>등록일</th><th>작성자ID</th><th>신고자아이디</th><th>신고사유</th><th>신고일</th><th>게시글삭제</th><th>링크</th>
			</tr>				
			<c:forEach var = "reportLists" items = "${reportList}">
			<tr>	
				<td>${reportLists.btitle }</td>
				<td class = "overflow-ellipsis">${reportLists.bcontent }</td>
				<td>${reportLists.brdate }</td>
				<td>${reportLists.mid }</td>
				<td>${empty reportLists.reportermid? "비회원" : reportLists.reportermid }</td>
				<td>${reportLists.rreason eq 1 ? '욕설' : (reportLists.rreason eq 2 ? '도배' : (reportLists.rreason eq 3 ? '광고:홍보' : '기타'))}
				<td>${reportLists.reportdate }</td>
				<td><button onclick = "location.href='${conPath}/adminReportDelete.do?bno=${reportLists.bno}'">삭제</button></td>
				<td><button onclick = "window.open('${conPath }/boardContent.do?gid=${reportLists.gid }&bno=${reportLists.bno }', '_blank')">글보기</button></td>				
			</tr>
			</c:forEach>
		</table>			
	  </div>
	</div>
</body>
</html>