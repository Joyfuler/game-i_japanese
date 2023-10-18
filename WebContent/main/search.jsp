<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src = "${conPath }/main/js/main.js"></script>
<link rel="icon" type="image/x-icon" href="${conPath }/img/logo4.gif" sizes="144x144">
<link href = "${conPath }/main/css/search.css" rel = "stylesheet">
<script>
function noImage(imageElement) {
 	imageElement.src = "${conPath }/img/noimg.jpg";
}
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="rightArea.jsp"/>
<div id = "left_content">
  <div class = "mainTitle">
  	<h5>검색결과: 총 <strong>2</strong>건 검색</h5> 	
  </div>
      <div class="card mb-1 bg-dark container card1 card-container" style="max-width: 1000px;">
        <div class="row g-0">
          <div class="col-md-3">
            <img class = "rank" src = "img/rank1.png" alt = "rank">
            <img src="img/thum1.jpg" class="img-fluid rounded-start" alt="thumnail" onerror="noImage(this)">
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title" style = "color:aqua;">&nbsp;&nbsp;세븐나이츠 키우기</h5>
              <h6 style = "color:white;">&nbsp;&nbsp;(평점: 4.89점 <img src = "img/star_on.png" height="15px"><img src = "img/star_on.png" height="15px"><img src = "img/star_on.png" height="15px"><img src = "img/star_on.png" height="15px"><img src = "img/star_out.png" height="15px">)</h6>
              <p class="card-text1 card-text" style = "color:white;">장르: 액션/RPG / 개발사: Netmarble Corporation</p>
              <p class="card-text2 card-text" style = "color:white;">출시일: 2022-01-01</p>
              <p class="card-text3 card-text card-intro" style = "color:white;">세븐나이츠 또 하나의 이야기, 새로운 캐릭터들의 유쾌한 반란! 새로운 주인공, 그리고 세븐나이츠 영웅들과 함께 떠나는 왁자지껄 모험 이야기!</p>
              &nbsp;&nbsp;<a href="#" class="btn btn-primary">리뷰/평가</a> <a href="#" class="btn btn-primary">게시판</a>
            </div>
          </div>
        </div>
      </div>      
      <div class="card mb-1 bg-dark container card-container" style="max-width: 1000px;">
        <div class="row g-0">
          <div class="col-md-3">
            <img class = "rank" src = "img/rank2.png" alt = "rank">
            <img src="img/thum2.jpg" class="img-fluid rounded-start" alt="thumnail" onerror="noImage(this)">
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title" style = "color:aqua;">&nbsp;&nbsp;EA SPORTS FC Online M</h5>
              <p class="card-text1 card-text" style = "color:white;">장르: 스포츠 / 개발사: NEXON Company</p>
              <h6 style = "color:white;">&nbsp;&nbsp;(평점: 4.74점 <img src = "img/star_on.png" height="15px"><img src = "img/star_on.png" height="15px"><img src = "img/star_on.png" height="15px"><img src = "img/star_on.png" height="15px"><img src = "img/star_out.png" height="15px">)</h6>
              <p class="card-text2 card-text" style = "color:white;">출시일: 2022-01-01</p>
              <p class="card-text3 card-text card-intro" style = "color:white;">전세계 최고의 리그와 유명 구단 및 월드클래스의 선수가 모바일로!
- 전세계 40여개의 리그, 600여개의 클럽, 18,000여명 실제 선수들을 모바일에서도 만나보세요!
- 이제 모바일에서도 구단주가 되어 나만의 구단을 만들어 세계 정상에 도전해보세요!</p>                
              &nbsp;&nbsp;<a href="#" class="btn btn-primary">리뷰/평가</a> <a href="#" class="btn btn-primary">게시판</a>
            </div>
          </div>
        </div>
      </div>
      <div class="card mb-1 bg-dark container card-container" style="max-width: 1000px;">
        <div class="row g-0">
          <div class="col-md-3">
            <img class = "rank" src = "img/rank3.png" alt = "rank">
            <img src="img/thum333.jpg" class="img-fluid rounded-start" alt="thumnail" onerror="noImage(this)">
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title" style = "color:aqua;">&nbsp;&nbsp;WOS: 화이트 아웃 서바이벌</h5>
              <p class="card-text1 card-text" style = "color:white;">서바이벌/전략 / 개발사: KING Games</p>
              <h6 style = "color:white;">&nbsp;&nbsp;(평점: 4.33점 <img src = "img/star_on.png" height="15px"><img src = "img/star_on.png" height="15px"><img src = "img/star_on.png" height="15px"><img src = "img/star_on.png" height="15px"><img src = "img/star_out.png" height="15px">)</h6>
              <p class="card-text2 card-text" style = "color:white;">출시일: 2022-01-01</p>
              <p class="card-text3 card-text card-intro" style = "color:white;">화이트 아웃 서바이벌은 빙하 종말 서바이벌 전략 게임입니다. 매혹적인 기계와 복잡한 사안들이 여러분을 기다리고 있습니다.
급격하게 하락한 지구의 기온으로 인간 사회에 대혼란이 일어났습니다. 무너져가는 집에서 탈출한 사람들은 이제 혹독한 눈보라, 공격적인 짐승들, 그들의 절망을 먹이로 삼는 기회주의적인 악당들과 같은 새로운 난관에 부딪히게 되었습니다.</p>
              &nbsp;&nbsp;<a href="#" class="btn btn-primary">리뷰/평가</a> <a href="#" class="btn btn-primary">게시판</a>
            </div>
          </div>
        </div>
      </div>
      <div class="card mb-1 bg-dark container card-container" style="max-width: 1000px;" onerror="noImage(this)">
        <div class="row g-0">
          <div class="col-md-3">
            <img class = "rank" src = "img/rank4.png" alt = "rank">
            <img src="img/thum4.jpg" class="img-fluid rounded-start" alt="thumnail">
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title" style = "color:aqua;">&nbsp;&nbsp;FC Mobile</h5>
              <p class="card-text1 card-text" style = "color:white;">장르: 스포츠 / 개발사: EA Sports</p>
              <h6 style = "color:white;">&nbsp;&nbsp;(평점: 4.32점 <img src = "img/star_on.png" height="15px"><img src = "img/star_on.png" height="15px"><img src = "img/star_on.png" height="15px"><img src = "img/star_on.png" height="15px"><img src = "img/star_out.png" height="15px">)</h6>
              <p class="card-text2 card-text" style = "color:white;">출시일: 2022-01-01</p>
              <p class="card-text3 card-text card-intro" style = "color:white;">새로운 Look&Feel로 더욱 세련되게!
게임 플레이 템포와 체감 개선을 통해 더욱 현실감 있게!
파워슛, 하드태클, 녹온 드리블로 더욱 다양하게!
모든 것이 새로워진 FC 모바일에서, 나만의 팀을 완성하세요!
                </p>
              &nbsp;&nbsp;<a href="#" class="btn btn-primary">리뷰/평가</a> <a href="#" class="btn btn-primary">게시판</a>
            </div>
          </div>
        </div>
      </div>
      <div class="card mb-1 bg-dark container card-container" style="max-width: 1000px;">
        <div class="row g-0">
          <div class="col-md-3">
            <img class = "rank" src = "img/rank5.png" alt = "rank">
            <img src="img/thum5.jpg" class="img-fluid rounded-start" alt="thumnail" onerror="noImage(this)">
          </div>
          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title" style = "color:aqua;">&nbsp;&nbsp;나이트 크로우</h5>
              <p class="card-text1 card-text" style = "color:white;">RPG/시뮬레이션 / 개발사: 위메이드</p>
              <h6 style = "color:white;">&nbsp;&nbsp;(평점: 3.90점 <img src = "img/star_on.png" height="15px"><img src = "img/star_on.png" height="15px"><img src = "img/star_on.png" height="15px"><img src = "img/star_out.png" height="15px"><img src = "img/star_out.png" height="15px">)</h6>
              <p class="card-text2 card-text" style = "color:white;">출시일: 2022-01-01</p>
              <p class="card-text3 card-text card-intro" style = "color:white;">깊어 가는 가을밤의 달빛이 나이트 크로우 세계에 쏟아집니다.
더욱 커진 스케일의 전투가 펼쳐지는 월드 격전지와 월드 특수 던전.
새롭게 시작되는 출석 이벤트와 다양한 미션 달성을 통한 보상 획득의 기회는 물론
가을 맞이 특별 던전에서 가을의 풍요로움을 마음껏 즐기세요.</p>
              &nbsp;&nbsp;<a href="#" class="btn btn-primary">리뷰/평가</a> <a href="#" class="btn btn-primary">게시판</a>
            </div>            
          </div>          
        </div>        
      </div>
   </div>       
<div id = "bottom">      
  <div class = "paging">
    <table>
    <tr>
    <td>[이전]</td><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>[다음]</td>
    </tr>
  </table>  
  </div>   
</div>   

      <script>                
        window.addEventListener('DOMContentLoaded', function() {                    
            var cardText3Elements = document.querySelectorAll('p[class="card-intro"]');                            
            cardText3Elements.forEach(function(element) {                
                element.textContent = element.textContent.trim();
            });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <jsp:include page="footer.html"></jsp:include>   


</body>
</html>