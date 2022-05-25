<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/fupdatePro.jsp</title>
</head>
<body>
	
	<%
		// 한글
// 		request.setCharacterEncoding("utf-8");
	
		// request파라미터 num name subject content 가져오기 -> num에 대해 subject, content 수정
		int maxSize=10*1024*1024;
		String uploadPath = request.getRealPath("/upload");
		System.out.println(uploadPath);
		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		int num = Integer.parseInt(multi.getParameter("num"));
		String name = multi.getParameter("name");
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		
		
		
		
		String file = multi.getFilesystemName("file");
		

		// BoardDTO 객체생성
		BoardDTO boardDTO = new BoardDTO();
		
		// set메서드 파라미터 저장
		boardDTO.setNum(num);
		boardDTO.setName(name);
		boardDTO.setSubject(subject);
		boardDTO.setContent(content);
		
		boardDTO.setFile(file);
		
		// BoardDAO 객체생성
		BoardDAO boardDAO = new BoardDAO();
		// 리턴 없음 /  updateBoard(BoardDTO boardDTO)
	
		// updateBoard(boardDTO) 메서드 호출
		boardDAO.fupdateBoard(boardDTO);
		// notice.jsp 이동
		%> 
		<script>
			alert("수정 완료!");
			location.href = "fnotice.jsp"
		</script>
	
</body>
</html>