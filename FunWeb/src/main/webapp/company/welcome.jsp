<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->

<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 
</head>
<body>
<div id="wrap">
<!-- 헤더가 들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더가 들어가는 곳 -->

<!-- 본문 들어가는 곳 -->
<!-- 서브페이지 메인이미지 -->
<div id="sub_img"></div>
<!-- 서브페이지 메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Welcome</a></li>
<li><a href="#">History</a></li>
<li><a href="#">Newsroom</a></li>
<li><a href="#">Public Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 내용 -->
<article>
<h1>Welcome</h1>
<figure class="ceo"><img src="../images/company/aa.jpg" width="196" height="226" 
alt="CEO"><figcaption></figcaption>
</figure>
<p>NASA는 미국 항공우주국의 약자로, 미국 정부의 우주기구이다. 본부는 대통령 직속 기관의 특성상 워싱턴 D.C.에 있고 미국 전역에 다양한 산하 시설이 있지만 우주 관련 영화에서 우주인들이 휴스턴이라고 부르는 관제센터가 텍사스 주 휴스턴 교외의 존슨 우주 센터에 위치해 있기에 NASA 하면 다들 휴스턴 내지 케이프 커내버럴만 생각하고, 휴스턴에서도 도시의 몇 안되는 관광자원으로 써먹고 있다.

덕업일치를 꿈꾸는 많은 우주덕들에게는 마음의 고향이다. 우주하면 제일 먼저 떠올리는 기관이지만, 미국 '항공'우주국이라는 이름에 걸맞게 항공 관련 연구도 충실하며, 다양한 항공기들을 보유하고 있다
</p>
</article>
<!-- 내용 -->
<!-- 본문 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>



