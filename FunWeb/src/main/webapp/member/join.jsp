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




<!-- 아이디 체크  -->
 <script src="../script/jquery-3.6.0.js"></script>
 <script type="text/javascript">
 	$(document).ready(function(){
 		// class="dup" 클릭했을때
 		$('.dup').click(function(){
//  			alert("클릭");
//              아이디 입력여부체크
				if($('.id').val()==""){
					alert("아이디 입력하세요");
					$('.id').focus();
					return;
				}
//              idCheck2.jsp에 갈때 id=값을 들고 가서 id중복체크 한후 출력(아이디중복, 아이디사용가능)
//                                 출력결과를 받아서 id="dupdiv" 에 출력
				$.ajax('idCheck2.jsp',{
					data:{'id':$('.id').val()},
					success:function(rdata){
						$('#dupdiv').html(rdata);
					}
				});
 		});
 		
 		//화면제어
 		// id="join" 폼태그 submit()
 		$('#join').submit(function(){
//  			alert("메시지");
	// 비어있는 여부 id pass  name email   /   일치여부 pass2   email2  
	//  class="id"    id="pass" id="name"  id="email" 
			if($('.id').val()==""){
				alert("아이디 입력하세요");
				$('.id').focus();
				return false;
			}
			if($('.pass').val()==""){
				alert("비밀번호를 입력하세요");
				$('.pass').focus();
				return false;
			}
			
			if($('#pass').val()!=$('#pass2').val()){
				alert("비밀번호 틀립니다");
				$('#pass').focus();
				return false;
			}
			
			if($('#name').val()==""){
				alert("이름 입력하세요");
				$('#name').focus();
				return false;
			}
			
			if($('.email').val()==""){
				alert("에메일을 입력하세요");
				$('.email').focus();
				return false;
			}
			
			if($('#email').val()!=$('#email2').val()){
				alert("이메일 틀립니다");
				$('#email').focus();
				return false;
			}
			
	
 		});
 		
 		
 	});
	
</script>


</head>
<body>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- 헤더들어가는 곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 본문메인이미지 -->
		<div id="sub_img_member"></div>
		<!-- 본문메인이미지 -->
		<!-- 왼쪽메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="#">Join us</a></li>
				<li><a href="#">Privacy policy</a></li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->
		<!-- 본문내용 -->
		<article>
			<h1>Join Us</h1>
			<form action="joinPro.jsp" id="join" method="post" name="fr">
				<fieldset>
					<legend>Basic Info</legend>
					<label>User ID</label> <input type="text" name="id" class="id">
					<!-- 					<input type="button" value="dup. check" class="dup" onclick="idCheck()"><br> -->

					<input type="button" value="dup. check" class="dup"><br>
					<div id="dupdiv">아이디 중복체크하세요</div>
					<br> <label>Password</label> <input type="password"
						name="pass" id="pass" onchange="check_pw()" required><br>
					<label>Retype Password</label> <input type="password" name="pass2"
						id="pass2" onchange="check_pw()" required>&nbsp;<span
						id="check"></span><br> <label>Name</label> <input type="text"
						name="name" required><br> <label>E-Mail</label> <input
						type="email" name="email" required id="email"><br> <label>Retype
						E-Mail</label> <input type="email" name="email2" required id="email2"><br>

				</fieldset>

				<fieldset>
					<legend>Optional</legend>



					<label>Address</label><input type="text" id="sample6_postcode"
						placeholder="우편번호" name="address" readonly="readonly"> <input
						type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<label></label><input type="text" id="sample6_address"
						placeholder="주소" name="address1" readonly="readonly"><br>
					<label></label><input type="text" id="sample6_detailAddress"
						placeholder="상세주소" name="address2" required="required"> <input
						type="text" id="sample6_extraAddress" placeholder="참고항목"
						name="address3" readonly="readonly"><br>
					<script
						src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script>
						function sample6_execDaumPostcode() {
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 각 주소의 노출 규칙에 따라 주소를 조합한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var addr = ''; // 주소 변수
											var extraAddr = ''; // 참고항목 변수

											//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
											if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
												addr = data.roadAddress;
											} else { // 사용자가 지번 주소를 선택했을 경우(J)
												addr = data.jibunAddress;
											}

											// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
											if (data.userSelectedType === 'R') {
												// 법정동명이 있을 경우 추가한다. (법정리는 제외)
												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
												if (data.bname !== ''
														&& /[동|로|가]$/g
																.test(data.bname)) {
													extraAddr += data.bname;
												}
												// 건물명이 있고, 공동주택일 경우 추가한다.
												if (data.buildingName !== ''
														&& data.apartment === 'Y') {
													extraAddr += (extraAddr !== '' ? ', '
															+ data.buildingName
															: data.buildingName);
												}
												// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
												if (extraAddr !== '') {
													extraAddr = ' ('
															+ extraAddr + ')';
												}
												// 조합된 참고항목을 해당 필드에 넣는다.
												document
														.getElementById("sample6_extraAddress").value = extraAddr;

											} else {
												document
														.getElementById("sample6_extraAddress").value = '';
											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document
													.getElementById('sample6_postcode').value = data.zonecode;
											document
													.getElementById("sample6_address").value = addr;
											// 커서를 상세주소 필드로 이동한다.
											document.getElementById(
													"sample6_detailAddress")
													.focus();
										}
									}).open();
						}
					</script>





					<label>Phone Number</label> <input type="text" name="phone"><br>
					<label>Mobile Phone Number</label> <input type="text" name="mobile"><br>
				</fieldset>
				<div class="clear"></div>
				<div id="buttons">
					<input type="submit" value="Submit" class="submit"> <input
						type="reset" value="Cancel" class="cancel">
				</div>
			</form>
		</article>
		<!-- 본문내용 -->
		<!-- 본문들어가는 곳 -->

		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>