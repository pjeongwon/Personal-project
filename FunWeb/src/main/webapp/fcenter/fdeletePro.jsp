<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/fdeletePro.jsp</title>
</head>
<body>
	<%
	// num파라미터 값 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	// BoardDAO객체생성
	BoardDAO boardDAO = new BoardDAO();
	// deleteBoard(num)메서드 호출
	boardDAO.deleteBoard(num);
	
	// notice.jsp 이동
	%>
	<script type="text/javascript">
		alert("삭제 완료!");
		location.href = "fnotice.jsp";
	</script>
	
</body>
</html>