<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/joinPro.jsp</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address") + ", " + request.getParameter("address1") + ", " + request.getParameter("address2") + ", " + request.getParameter("address3");
	String phone = request.getParameter("phone");
	String mobile = request.getParameter("mobile");
	Timestamp date = new Timestamp(System.currentTimeMillis());
	
	MemberDTO memberDTO = new MemberDTO();
	memberDTO.setId(id);
	memberDTO.setPass(pass);
	memberDTO.setName(name);
	memberDTO.setEmail(email);
	memberDTO.setAddress(address);
	memberDTO.setPhone(phone);
	memberDTO.setMobile(mobile);
	memberDTO.setDate(date);
	
	MemberDAO memberDAO = new MemberDAO();
	memberDAO.insertMember(memberDTO);
	%>
	
	<script type="text/javascript">
		alert("회원가입 완료!");
		location.href = "login.jsp";
	</script>
	
	
	
</body>
</html>