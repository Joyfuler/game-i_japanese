<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰페이지</title>        
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href = "${conPath }/css/review.css" rel = "stylesheet">
    <link rel="icon" type="image/x-icon" href="${conPath }/img/logo4.gif" sizes="144x144">
    <script src = "${conPath }/main/js/main.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js">        
    </script>
	<script>	
	function noImage(imageElement) {
	 	imageElement.src = "${conPath }/img/noimg.jpg";
	}
	</script>
</head>
<body>    	
	<jsp:include page="header.jsp"/>
	<jsp:include page="rightArea.jsp"/>
    <div class="content text">
    	<div class="game-header">
        	<div class="summary_new">
				<div class="icon_new">
					<img src="img/thum1.jpg"
					onerror='noImage(this)' alt="게임타이틀">
				</div>
				<div class="game_info">
    			<p class="game_name" style = "color:aqua;">
        		세븐나이츠 키우기
	    		</p>
				<p class="game_genre">
	    		장르 : [RPG] / 개발사 : 넷마블</p>
				<p class="game_open">
    			출시일 : 2017.11.21 <span>(출시됨)</span>
				</p>
			</div>
			<div class="point_new">
				<div class="star_new">
    			<img src='img/point_star_on.png'><img src='img/point_star_on.png'><img src='img/point_star_on.png'><img src='img/point_star_on.png'><img src='img/point_star_out.png'>
				</div>
				<div class="user_score">평점 4.5점</div>					
					<div class="community_bt">
						<div class="board_link">
							<a href="" style = "text-decoration: none;">
							게시판 바로가기
							</a>
						</div>
					</div>	
    			</div>				
			</div>
		</div>		
        </div>
		<div id="star_in_DIV" style="padding:0px;margin:10px 0px 0px 0px; width:1000px; height:200px; margin-left: 150px;">
			<div style="float:left; width:262px; height:180px; background:#FFFFFF; margin:0px 40px 0px 30px; border:1px solid #dfdfdf;">
				<div class="user_new2">총 <span>30</span>명 참여</div>
				<ul class="star">
					<li>
						<div class="star_num_new">5</div>
							<div style="position:relative;float:left;width:180px; height:14px;margin:0px 0px 0px 10px;background:#f6f6f6;">
    							<img src="img/score_per.gif" width="66%" height="100%">
    							<span style="position:absolute;left:3px;top:0px;font-size:8pt;color:#fff;">
				         		21</span>
							</div>
							<div style="clear:left;"></div>
					</li>
					<li>
						<div class="star_num_new">4</div>
							<div style="position:relative;float:left;width:180px; height:14px;margin:0px 0px 0px 10px;background:#f6f6f6;">
    							<img src="img/score_per.gif" width="5%" height="100%">
    							<span style="position:absolute;left:3px;top:0px;font-size:8pt;color:#fff;">
         						2</span>
							</div>
							<div style="clear:left;"></div>
					</li>
					<li>
						<div class="star_num_new">3</div>
							<div style="position:relative;float:left;width:180px; height:14px;margin:0px 0px 0px 10px;background:#f6f6f6;">
    							<img src="img/score_per.gif" width="13%" height="100%">
    							<span style="position:absolute;left:3px;top:0px;font-size:8pt;color:#fff;">
         						4</span>
							</div>
							<div style="clear:left;"></div>
					</li>
					<li>
						<div class="star_num_new">2</div>
							<div style="position:relative;float:left;width:180px; height:14px;margin:0px 0px 0px 10px;background:#f6f6f6;">
    							<img src="img/score_per.gif" width="1.28949065119%" height="100%">
    							<span style="position:absolute;left:3px;top:0px;font-size:8pt;color:#fff;">
         						1</span>
							</div>
							<div style="clear:left;"></div>
					</li>
					<li>
						<div class="star_num_new">1</div>
						<div style="position:relative;float:left;width:180px; height:14px;margin:0px 0px 0px 10px;background:#f6f6f6;">
    					<img src="img/score_per.gif" width="6.86847195358%" height="100%">
    					<span style="position:absolute;left:3px;top:0px;font-size:8pt;color:#fff;">
         						3</span>
							</div>
						<div style="clear:left;"></div>
					</li>
				</ul>
			</div>
			<div style="float:left;width:600px;height:180px;background:#fff;border:1px solid #dfdfdf;">
        		<div class="user_new2">
        			<form name="evalFrm" id="evalFrm" method="get" action="" style="margin:0px;" class="star-point">
        			<input type="hidden" name="gcode" value="1">
        			<input type="hidden" name="score" value="5">
        				<div style="float:left;width:120px;height:47px; line-height: 30px; padding:10px 0 0 18px;margin:0;">
        				<img src = "img/star_on.png" starNum="1" starCheck/><img src = "img/star_on.png" starNum="2" starCheck/><img src = "img/star_on.png" starNum="3" starCheck/><img src = "img/star_on.png" starNum="4" starCheck/><img src = "img/star_on.png" starNum="5" starCheck/>   
        				</div>
        				<div style="float:left;width:120px;margin:0;font-weight:bold;font-size:15pt;">
        				<div class="user_new2">평점<span id="starNumber">5.0</span></div>
    					</div>
					</div>
					<div class="write">
						<textarea name="comment" style="height: 65px;" cols="6"  maxlength="80" label="평가글"></textarea>
						<button onclick = "emptyChk()">평가하기</button>
					</div>
					</form>
				</div>
			</div>
		</div>
<%-- 별점 매기기 jquery. 클릭한 부분까지 별점이 칠해짐. --%>
<script>
	$("img[starCheck]").click(function () {
		var sNum = $(this).attr("starNum"); 
		$("img[starCheck]").attr("src","img/star_out.png");	
		for (s = 1; s <= sNum; s++) {
			$("img[starNum=" + s + "]").attr("src", "img/star_on.png");
		}
<%-- form과 hidden input창의 value값을 클릭한 값으로 변경. --%>
		$("#evalFrm input[name=score]").attr("value", sNum);				
		$("#starNumber").html(sNum + ".0");
	});
</script>
	<div class="review-list">
		<form action ="" method = "get" class = "sort">
			<select name = "sortBy" class = "sortBy">    
    			<option value = "new">최신순</option>
    			<option value = "score">별점순</option>
			</select>
			<input type = "submit" value = "적용">
		</form>
총 리뷰 수 : <strong id="totalReviewCnt">5</strong>개 / 페이지 수: (<strong>1</strong>/1)
		<ul class = "review">
			<li><img src = "img/1610523129.jpg" height= "20"><strong>닉네임1</strong></li>			
			<li>평점 <strong>5</strong><span class = "star"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"></span></li>
			<li class = "text"> 재미있습니다 애정의 끝판왕&nbsp;&nbsp;<br><a href = ""><u>수정</u></a>&nbsp;<a href = ""><u>삭제</u></a></li>
			<li><img src = "img/1610523129.jpg" height= "20"><strong>닉네임1</strong></li>
			<li>평점 <strong>5</strong><span class = "star"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"></span></li>
			<li class = "text"> 재미있습니다 애정의 끝판왕</li>
			<li><img src = "img/1610523129.jpg" height= "20"><strong>닉네임1</strong></li>
			<li>평점 <strong>5</strong><span class = "star"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"></span></li>
			<li class = "text"> 재미있습니다 애정의 끝판왕</li>
			<li><img src = "img/1610523129.jpg" height= "20"><strong>닉네임1</strong></li>
			<li>평점 <strong>5</strong><span class = "star"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"></span></li>
			<li class = "text"> 재미있습니다 애정의 끝판왕</li>
			<li><img src = "img/1610523129.jpg" height= "20"><strong>닉네임1</strong></li>
			<li>평점 <strong>5</strong><span class = "star"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"><img src = "img/point_star_on.png"></span></li>
			<li class = "text"> 재미있습니다 애정의 끝판왕</li>
		</ul>
	</div>
	<div class = "review_paging">
	<table>
		<tr>
			<td>[이전]<td>1</td><td>2</td><td>3</td><td>4</td><td></td><td>[다음]</td>
		</tr>
	</table>
	</div>
<jsp:include page="footer.html"/>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>