<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main/main.jsp</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">

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
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>

								<!-- 메인이미지 바꾸기 크기 맞춰서 -->

<div id="main_img"><img src="../images/main_img4.png"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<div id="hosting">
<h3>Web Hosting Solution</h3>
<p>Lorem impsun</p>
</div>
<div id="security">
<h3>Web Security Solution</h3>
<p>Lorem impsun</p>
</div>
<div id="payment">
<h3>Web Payment Solution</h3>
<p>Lorem impsun</p>
</div>
</div>
<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">Security</span> News</h3>
<dl>
<dt>Vivamus id ligula....</dt>
<dd>Proin quis ante Proin quis anteProin 
quis anteProin quis anteProin quis anteProin 
quis ante......</dd>
</dl>
<dl>
<dt>Vivamus id ligula....</dt>
<dd>Proin quis ante Proin quis anteProin 
quis anteProin quis anteProin quis anteProin 
quis ante......</dd>
</dl>
</div>



<div id="news_notice">
<h3 class="brown">News &amp; Notice</h3>
<table>

	<%
	// BoardDAO 객체 생성
	BoardDAO boardDAO = new BoardDAO();
	int startRow = 1;
	int pageSize = 5;
	// List<BoardDTO> boardList = getBoardList(startRow, pageSize) 메서드 호출
	List<BoardDTO> boardList = boardDAO.getBoardList(startRow, pageSize);
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
	for(int i = 0; i < boardList.size(); i++){
		BoardDTO boardDTO = boardList.get(i);
		%>
		<tr><td class="contxt"><a href="#"><%=boardDTO.getSubject() %></a></td>
    	<td><%=dateFormat.format(boardDTO.getDate())%></td></tr>
		<%
	}
	%>

</table>

</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>








