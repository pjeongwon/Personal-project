<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updatePro.jsp</title>
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
	
	MemberDTO updateDTO = new MemberDTO();
	updateDTO.setId(id);
	updateDTO.setName(name);
	updateDTO.setEmail(email);
	updateDTO.setAddress(address);
	updateDTO.setPhone(phone);
	updateDTO.setMobile(mobile);
	
	MemberDAO memberDAO = new MemberDAO();
	MemberDTO memberDTO = memberDAO.userCheck(id, pass);
	
	if(memberDTO != null){
		memberDAO.updateMember(updateDTO);
		%> 
		<script type="text/javascript">
			alert("수정되었습니다!");
			location.href = "../main/main.jsp";
		</script>
		 <%
		
	} else{
		%> 
		<script type="text/javascript">
			alert("입력하신 정보가 틀렸습니다");
			history.back();
		</script>
	    <%
	}
	
	
	
	
	
	
	%>
</body>
</html>