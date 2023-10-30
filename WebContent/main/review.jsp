<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<script>
	$(document).ready(function(){
		$("button.notLogin").click(function(){
			alert('먼저 로그인해야 합니다.');
			location.href = "loginView.do?gid=${param.gid }&next=review.do";
			return false;			
		});		
		$("button.reviewSubmit").click(function(){					
			var textArea = $("textarea[name='rtext']").val().trim();
			if (textArea == ""){
				alert('리뷰를 입력해주세요.');
				return false;
			} else {
				$("#reviewForm").submit();
			}
		});
	});
	</script>
</head>
<c:if test = "${not empty reviewWriteResult }">
	<script>
		alert('${reviewWriteResult }');
	</script>
</c:if>
<c:if test = "${not empty reviewDeleteResult }">
	<script>
		alert('${reviewDeleteResult }');
	</script>
</c:if>	
<c:if test = "${not empty loginResult }">	
	<script>
		alert('${loginResult }');
	</script>
</c:if>
<c:if test = "${not empty reviewWriteErrorMsg }">
	<script>
		alert('${reviewWriteErrorMsg}');
	</script>	
</c:if>	
<body>    	
	<jsp:include page="header.jsp"/>
	<jsp:include page="rightArea.jsp"/>
    <div class="content text">
    	<div class="game-header">
        	<div class="summary_new">
				<div class="icon_new">
				<c:set var = "gameInfo" value="${gameData }"/>
					<img src="img/${gameInfo.gicon }"
					onerror='noImage(this)' alt="${gameInfo.gname } 아이콘">
				</div>
				<div class="game_info">
    				<p class="game_name" style = "color:aqua;">
        			${gameInfo.gname }
	    			</p>
					<p class="game_genre">
	    			장르 : [${gameInfo.ggenre }] / 개발사 : ${gameInfo.gpub }</p>				
					<c:set var = "currentDate" value = "<%=new Date()%>"/>
              		<c:set var = "timeGap" value = "${gameInfo.gpdate.time - currentDate.time }"/>
              		<c:choose>              
              			<c:when test = "${timeGap >= 0}">
              			<p class="game_open">				
    					출시일 : ${gameInfo.gpdate } <span>(출시까지 ${timeGap/86400000}일 남음)</span>
						</p>             	               
              			</c:when> 
              			<c:when test = "${timeGap < 0}">
              			<p class="game_open">				
    					출시일 : ${gameInfo.gpdate } <span>(출시됨)</span>
						</p>             	               
              			</c:when>
              		</c:choose>				
				</div>
				<div class="point_new">
					<div class="star_new">
					<c:forEach begin="1" end="${fn:substringBefore(gameInfo.avg, '.')}">
        		        <img src = "${conPath }/img/point_star_on.png">
               		</c:forEach> 
              		<c:forEach begin="1" end ="${5 - fn:substringBefore(gameInfo.avg, '.')}">
						<img src = "${conPath }/img/point_star_out.png">
			  		</c:forEach>    			
					</div>
					<div class="user_score">평점 <fmt:formatNumber value = "${gameInfo.avg }" pattern = "#,##0.0;#0"/>점</div>					
						<div class="community_bt">
							<div class="board_link">
								<a href="${conPath }/boardList.do?gid=${gameInfo.gid }" style = "text-decoration: none;">
									게시판 바로가기
								</a>
							</div>
						</div>	
    				</div>				
				</div>
			</div>		
        </div>
        <!-- 리뷰 데이터 영역 -->
        <c:set var = "countData" value="${scoreCount }"/>
		<div id="star_in_DIV" style="padding:0px;margin:10px 0px 0px 0px; width:1000px; height:200px; margin-left: 150px;">
			<div style="float:left; width:262px; height:180px; background:#FFFFFF; margin:0px 40px 0px 30px; border:1px solid #dfdfdf;">
				<div class="user_new2">총 <span>${scoreCount.allCount }</span>명 참여</div>
				<ul class="star">
					<li>
						<div class="star_num_new">5</div>
							<div style="position:relative;float:left;width:180px; height:14px;margin:0px 0px 0px 10px;background:#f6f6f6;">
    							<img src="img/score_per.gif" width="${scoreCount.score5 / scoreCount.allCount * 100 }%" height="100%">
    							<span style="position:absolute;left:3px;top:0px;font-size:8pt;color:#fff;">
				         		${scoreCount.score5 }</span>
							</div>
							<div style="clear:left;"></div>
					</li>
					<li>
						<div class="star_num_new">4</div>
							<div style="position:relative;float:left;width:180px; height:14px;margin:0px 0px 0px 10px;background:#f6f6f6;">
    							<img src="img/score_per.gif" width="${scoreCount.score4 / scoreCount.allCount * 100 }%" height="100%">
    							<span style="position:absolute;left:3px;top:0px;font-size:8pt;color:#fff;">
         						${scoreCount.score4 }</span>
							</div>
							<div style="clear:left;"></div>
					</li>
					<li>
						<div class="star_num_new">3</div>
							<div style="position:relative;float:left;width:180px; height:14px;margin:0px 0px 0px 10px;background:#f6f6f6;">
    							<img src="img/score_per.gif" width="${scoreCount.score3 / scoreCount.allCount * 100 }%" height="100%">
    							<span style="position:absolute;left:3px;top:0px;font-size:8pt;color:#fff;">
         						${scoreCount.score3 }</span>
							</div>
							<div style="clear:left;"></div>
					</li>
					<li>
						<div class="star_num_new">2</div>
							<div style="position:relative;float:left;width:180px; height:14px;margin:0px 0px 0px 10px;background:#f6f6f6;">
    							<img src="img/score_per.gif" width="${scoreCount.score2 / scoreCount.allCount * 100 }%" height="100%">
    							<span style="position:absolute;left:3px;top:0px;font-size:8pt;color:#fff;">
         						${scoreCount.score2 }</span>
							</div>
							<div style="clear:left;"></div>
					</li>
					<li>
						<div class="star_num_new">1</div>
							<div style="position:relative;float:left;width:180px; height:14px;margin:0px 0px 0px 10px;background:#f6f6f6;">
    							<img src="img/score_per.gif" width="${scoreCount.score1 / scoreCount.allCount * 100}%" height="100%">
    							<span style="position:absolute;left:3px;top:0px;font-size:8pt;color:#fff;">
         						${scoreCount.score1 }</span>
							</div>
						<div style="clear:left;"></div>
					</li>
				</ul>
			</div>
			<div style="float:left;width:600px;height:180px;background:#fff;border:1px solid #dfdfdf;">
				<form name="reviewForm" id="reviewForm" method="post" action="${conPath }/reviewWrite.do" style="margin:0px;" class="star-point">
        		<div class="user_new2">        			
        			<input type = "hidden" name = "mid" value = "${member.mid }">
        			<input type="hidden" name="gid" value="${param.gid }">
        			<input type="hidden" name="rscore" value="5">
        				<div style="float:left;width:120px;height:47px; line-height: 30px; padding:10px 0 0 18px;margin:0;">
        				<img src = "img/star_on.png" starNum="1" starCheck/><img src = "img/star_on.png" starNum="2" starCheck/><img src = "img/star_on.png" starNum="3" starCheck/><img src = "img/star_on.png" starNum="4" starCheck/><img src = "img/star_on.png" starNum="5" starCheck/>   
        				</div>
        				<div style="float:left;width:120px;margin:0;font-weight:bold;font-size:15pt;">
        				<div class="user_new2">평점<span id="starNumber">5.0</span></div>
    					</div>
					</div>
					<div class="write">
						<textarea name="rtext" style="height: 65px;" cols="6"  maxlength="80" label="평가글"></textarea>
						<c:if test = "${empty member }">
						<button class = "notLogin">평가하기</button>
						</c:if>
						<c:if test = "${not empty member }">
						<button class = "reviewSubmit">평가하기</button>
						</c:if>
					</div>
					</form>
				</div>
			</div>		
<%-- 별점 매기기 jquery. "모두 off 별 이미지로 변경한 후, 클릭한 부분까지 별이미지가 on으로 변경. --%>
<script>
	$("img[starCheck]").click(function () {
		var sNum = $(this).attr("starNum"); 
		$("img[starCheck]").attr("src","img/star_out.png");	
		for (idx = 1; idx <= sNum; idx++) {
			$("img[starNum=" + idx + "]").attr("src", "img/star_on.png");
		}
<%-- form과 hidden input창의 value값을 클릭한 값으로 변경. --%>
		$("#reviewForm input[name=rscore]").attr("value", sNum);				
		$("#starNumber").html(sNum + ".0");
	});
</script>

	<!-- 유저 리뷰 데이터 영역  -->
	<div class="review-list">
		<form action ="${conPath }/review.do" method = "get" class = "sort">
			<input type="hidden" name = "gid" value = "${param.gid }">
			<select name = "sortBy" class = "sortBy">    
    			<option value = "">정렬방식</option>
    			<option value = "new">최신순</option>
    			<option value = "score">별점순</option>
			</select>
			<input type = "submit" value = "적용">
		</form>
총 리뷰 수 : <strong id="totalReviewCnt">${scoreCount.allCount }</strong>개 / 페이지: (<strong>${pageNum }</strong>/ ${pageCnt })
        	<ul class = "review">
			<c:forEach var="reviewInfo" items="${reviewList }">
				<li><img src = "${conPath }/memberPhotoUp/${reviewInfo.mphoto }" height= "20"><strong>${reviewInfo.mnickname }</strong> | &nbsp;등록일: <fmt:formatDate value= "${reviewInfo.rrdate }" pattern="yyyy-MM-dd HH:mm:ss"/></li>			
				<li style = "font-size:0.75em;">평점 <strong>${reviewInfo.rscore }</strong>
					<span class = "star">
						<c:forEach begin="1" end="${reviewInfo.rscore }">
							<img src = "img/point_star_on.png">
						</c:forEach>
						<c:forEach begin="1" end="${5-reviewInfo.rscore }">
							<img src = "img/point_star_out.png">
						</c:forEach>
					</span>
				</li>			
				<li class = "text" style = "font-size: 0.9em;"> ${reviewInfo.rtext }&nbsp;&nbsp;
				<c:if test = "${member.mid eq reviewInfo.mid or member.mlevel eq 1}">
					<br>
					<a href = "${conPath }/deleteReview.do?rid=${reviewInfo.rid }&gid=${gameInfo.gid }" style = "font-size:13px;">[삭제]</a>
				</c:if>
				</li>
			</c:forEach>		
			</ul>
	</div>
	<div class = "review_paging">
	<table>
		<tr>
			<c:if test = "${startPage > BLOCKSIZE }">
				<td>
					<a href = "${conPath }/review.do?sortBy=${sortBy }&pageNum=${startPage-1 }">[이전]</a>
				<td>
			</c:if>
			<c:forEach var = "i" begin = "${startPage }" end = "${endPage }">
				<c:if test = "${i eq pageNum }">
					<td><b style = "color:red;">${i }</b></td>
				</c:if>	
				<c:if test = "${i != pageNum }">
    				<td>
    					<a href = "${conPath }/review.do?gid=${param.gid }&sortBy=${sortBy }&pageNum=${i }" style = "color: #212529; padding-left: 10px; padding-right: 10px;">${i }</a>
    				</td>
   				</c:if> 				
    		</c:forEach>
    		<c:if test = "${endPage < pageCnt }">
    			<td>
    				<a href = "${conPath }/review.do?sortBy=${sortBy }&pageNum=${endPage +1 }">[다음]</a>
    			</td>			
			</c:if>
		</tr>
	</table>
	</div>
<jsp:include page="footer.jsp"/>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>