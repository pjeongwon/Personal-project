<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
// 	request.setCharacterEncoding("utf-8");
	
	// upload폴더에 파일 업로드
	// 프로그램 설치 www.servlets.com - cos file upload library - cos-20.08.zip - cos.jar(web-inf - lib에 넣기)
	
	String uploadPath = request.getRealPath("/upload");
	System.out.println(uploadPath);
	
	// 파일 최대 크기
	int maxSize=10*1024*1024;
	
// 	MultipartRequest multi = new MultipartRequest(request, upload폴더 물리적경로, 파일최대크기, 한글처리, 파일이름 중복일때 변경);
	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());	
	
	
	
	// 파라미터 가져오기 name/pass/subject/content
	String name = multi.getParameter("name");
	String pass = multi.getParameter("pass");
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	// 글쓴날짜 date
	Timestamp date = new Timestamp(System.currentTimeMillis());
	int readcount = 0;
	
	// 첨부파일 이름
	String file = multi.getFilesystemName("file");
	
	// BoardDTO 객체 생성
	BoardDTO boardDTO = new BoardDTO();
	// 멤버변수 <= 파라미터 저장
	boardDTO.setName(name);
	boardDTO.setPass(pass);
	boardDTO.setSubject(subject);
	boardDTO.setContent(content);
	boardDTO.setDate(date);
	boardDTO.setReadcount(readcount);
	// 첨부파일
	boardDTO.setFile(file);

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
		location.href = "fnotice.jsp";
	</script>
	<%

	%>
</body>
</html>