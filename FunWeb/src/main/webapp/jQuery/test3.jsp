<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery/test3.jsp</title>
<script src="../script/jquery-3.6.0.js"></script>
<script type="text/javascript">


	$(document).ready(function(){
		// id = "btn" 버튼 클릭시
		$('#btn').click(function(){
			// id = "id" 텍스트 대상의 내용 value값 가져오기
// 			alert($('#id').val());
			// 아이디가 비어있으면 "아이디 입력하세요" - focus() - 되돌아감
			if($('#id').val() == ""){
				alert("아이디 입력하세요");
				$('#id').focus();
				return;
			}
			
			// ajax
			// idCheck2.jsp 페이지에 id값을 들고 가서 아이디 중복 체크를 해서 
			// 출력결과(아이디 중복, 아이디 사용 가능) 가져오기
			$.ajax('idCheck2.jsp', {
				data : {'id' : $('#id').val()},
				success : function(rdata){
					alert(rdata);
					// id = "dupdiv" 대상에 "아이디 중복" 메시지 출력
					$('#dupdiv').html(rdata)
				}
			});
		}); // 클릭
		
		// 회원가입 버튼을 클릭하면 form태그 submit()진행
		$('#fr').submit(function(){
			alert("회원가입 완료");
			
			if($('#id').val() == ""){
				alert("아이디 입력하세요");
				$('#id').focus();

				// false 원기능 submit()기능을 막음
				return false;
			}
			// 비밀번호 제어 $('#pass').val() == ""
			if($('#pass').val() == ""){
				alert("비밀번호 입력하세요");
				$('#pass').focus();
				// false원기능 submit() 기능을 막음
				return false;
			}
			
			// 성별 제어
			// id = "gender1"
			// $('#gender1').is(":checked") 라디오박스 체크 여부 => true/false
			if($('#gender1').is(":checked") == false && $("#gender2").is(":checked") == false){
				alert("성별 체크하세요");
				$('#gender1').focus();
				return false;
				
			}
			
			// 취미 제어
			// id = "hobby1"
			if($('#hobby1').is(":checked")==false && $('#hobby2').is(":checked")==false && $('#hobby3').is(":checked")==false ){
				alert("취미를 선택하세요");
				$('#hobby1').focus();
				return false;
			}
			
			
			
			
			
			// 등급 제어 $('#grade').val() == ""
			if($('#grade').val() == ""){
				alert("등급을 선택하세요");
				$('#grade').focus();
				// false원기능 submit() 기능을 막음
				return false;
				}
		
		});
	});
	
	</script>
	
</head>
<body>

<form action="a.jsp" method = "post" id = "fr">
	아이디 : 	<input type = "text" name = "id" id = "id">
			 	<input type = "button" value = "아이디 중복 체크" id = "btn">
			 	<div id = "dupdiv">아이디 중복 체크하세요</div>
	비밀번호 : 	<input type = "password" name = "pass" id = "pass"><br>
	성별 : 		<input type = "radio" name = "gender" id = "gender1" value = "남">남
		   		<input type = "radio" name = "gender" id = "gender2" value = "여">여<br>
	취미 : 		<input type = "checkbox" name = "hobby" id = "hobby1" value = "여행">여행
		   		<input type = "checkbox" name = "hobby" id = "hobby2" value = "게임">게임<br>
	등급 : 		<select name = "grade" id="grade">
					<option value = "">선택하세요</option>
					<option value = "1">1등급</option>
					<option value = "2">2등급</option>
					<option value = "3">3등급</option>
				</select><br>
		   <input type = "submit" value = "회원가입">
</form>


</body>
</html>