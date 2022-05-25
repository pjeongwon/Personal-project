<%@page import="board.BoardDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/writePro.jsp</title>
</head>
<body>

	<%
	// 한글처리
	request.setCharacterEncoding("utf-8");
	// 파라미터 가져오기 name/pass/subject/content
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	// 글쓴날짜 date
	Timestamp date = new Timestamp(System.currentTimeMillis());
	int readcount = 0;
	// BoardDTO 객체 생성
	BoardDTO boardDTO = new BoardDTO();
	boardDTO.setName(name);
	boardDTO.setPass(pass);
	boardDTO.setSubject(subject);
	boardDTO.setContent(content);
	boardDTO.setDate(date);
	boardDTO.setReadcount(readcount);
	// 멤버변수 <= 파라미터 저장

	// BoardDAO 객체 생성
	BoardDAO boardDAO = new BoardDAO();
	// 리턴할형 없음 / insertBoard(BoardDTO boardDTO)
	// SELECT MAX(num) FROM board / MAX(num)+1 => num 구하기
	// insertBoard(boardDTO) 메서드 호출
	boardDAO.insertBoard(boardDTO);
	// notice.jsp이동
	%>
	<script>
		alert("글 작성 완료");
		location.href = "notice.jsp";
	</script>
	<%

	%>
</body>
</html>