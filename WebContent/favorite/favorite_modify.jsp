<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ブックマーク管理 - Game-i</title>
<link href = "${conPath }/css/style2.css" rel = "stylesheet">
<link rel="icon" type="image/x-icon" href="${conPath }/img/logo4.gif" sizes="144x144">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script>
		function deleteConfirm(num){
			if (confirm('정말 삭제하시겠습니까?')){
				location.href="favoriteDelete.do?num="+num;	
			}
		}
	</script>
	<script>
	function hideImage(img) {
    	img.style.display = 'none';
	}
	</script>
	<script>
	function displayImage(img){
		img.style.display = 'inline';	
	}
	</script>
	<script>
	$(document).ready(function(){	
		$('.gnameInput').keyup(function(){
			let gname = $(this).val();			
			$.ajax({
				url: '${conPath }/modifyGameSearch.do',
				type : 'get',
				data: 'gname='+gname,
				dataType : 'json',
				success : function(data){
					if (data.length > 0){
						$('input.gidInput').val(data[0].gid);
						$('.searchGname').text(data[0].gname + "  ");												
						$('img.preview').attr('src','${conPath }/img/'+data[0].gicon);
					} else {
						$('input.gidInput').val('');
						$('.searchGname').text('');
						$('.searchGgenre').text('');						
						$('img.preview').attr('src','');
					}
				},				
			});
		});
		
		$('td.favoriteLists').click(function(){
			var gid = $(this).data('id');			
			$('input.gidInput').val(gid);
			$('input.gnameInput').val($(this).find('span.gameName').text());
			$('.searchGname').text($(this).find('span.gameName').text());
			$('.searGgenre').text($(this).find('span.gameGenre').text());
			$('img.preview').attr('src',$(this).find('img.favoriteGicon').attr('src'));
		});	
		
		$('.addFavorite').click(function(){
			var gid = $('.gidInput').val();
			location.href = '${conPath}/modifyFavorite.do?method=add&gid='+gid+'&mid=${member.mid}';
		});
	
		$('.deleteFavorite').click(function(){
			var gid = $('.gidInput').val();
			location.href = '${conPath}/modifyFavorite.do?method=remove&gid='+gid+'&mid=${member.mid}';
		});
	});	
	
	</script>
</head>
<body>
<c:if test = "${not empty modifyResult }">
	<script>
		alert('${modifyResult}');
	</script>
</c:if>
	ゲーム名を検索してください <br>
	（削除の場合、下のリストをクリックしても選択できます。）<br>	
	<hr>
	<input type = "hidden" name = "gid" class = "gidInput">
	<input type = "text" name = "gname" class = "gnameInput">	
	<br>
	<!-- gameName으로 검색버튼을 누르면 해당  game의 dto를 가져옴. gid에는 dto.gid를 추가한다-->
	検索結果: <b><span class = "searchGid"> &nbsp; </span><span class = "searchGname"> &nbsp; </span> <span class = "searchGgenre"> &nbsp; </span></b><img class = "searchGicon preview" height = "40px" onerror = "hideImage(this)" onload = "displayImage(this)">
	<br><br>		
	<input type = "button" value = "追加" class = "addFavorite">&nbsp; &nbsp; <input type = "button" value = "削除" class = "deleteFavorite">
	<br><br>
	<hr>
	 <p class="favorite_title" style = "background-color: #212529; color: aqua; padding-left: 5px;">ブックマークのリスト</p>
    <table>
    	<c:forEach var="lists" items = "${favoriteList }">
		<tr>
			<td data-id = "${lists.gid }" class = "favoriteLists">
				<img src = "${conPath }/img/${lists.gicon }" height = "44px" class = "favoriteGicon"> &nbsp; &nbsp; <span style = "color: #212529; font-weight: bold; cursor:pointer;" class = "gameName">${lists.gname }</span> / <span class = "gameGenre">${lists.ggenre }</span>
			</td>	
		</tr>
		</c:forEach>		
    </table>        
    <hr>
</body>
</html>