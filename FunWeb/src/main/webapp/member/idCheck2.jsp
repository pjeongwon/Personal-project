<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// jQuery/idCheck2.jsp
String id = request.getParameter("id");

// 리턴할 형 MemberDTO getMember(String)
MemberDAO memberDAO = new MemberDAO();
MemberDTO memberDTO = memberDAO.getMember(id);

if (memberDTO == null) {
	// 같은 아이디 없음(아이디 중복 아님) - 사용 가능
	%> 아이디 사용가능 <%
} else {
// 같은 아이디 존재(중복) - 사용 불가능 %> 아이디 중복 <%
}
%>
