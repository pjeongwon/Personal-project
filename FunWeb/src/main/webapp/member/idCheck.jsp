<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function ok(){
		// join .jsp 아이디 상자 <= 찾은 아이디(document.wfr.id.value)
		opener.fr.id.value = document.wfr.id.value
		// 창 닫기
		window.close();
	}
</script>


</head>
<body>
	<h1>member/idCheck.jsp</h1>
<%
// http://localhost:8080/FunWeb/member/idCheck.jsp?id=aaaa
// id파라미터 서버 request에 저장 => 가져오기
String id = request.getParameter("id");
// 리턴할 형 MemberDTO getMember(String)
MemberDAO memberDAO = new MemberDAO();
MemberDTO memberDTO = memberDAO.getMember(id);

if(memberDTO == null){
	// 같은 아이디 없음(아이디 중복 아님) - 사용 가능
	%> 아이디 사용가능 <input type = "button" value = "아이디 선택" onclick = "ok()"><%
} else{
	// 같은 아이디 존재(중복) - 사용 불가능
	%> 아이디 중복 <%
}

%>
<form action="idCheck.jsp" method = "get" name = "wfr">
	아이디 : <input type = "text" name = "id" value = "<%= id%>">
	<input type = "submit" value = "아이디 찾기">
</form>

</body>
</html>