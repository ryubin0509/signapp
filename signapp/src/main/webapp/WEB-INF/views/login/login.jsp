<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
  body {
    font-family: 'Arial', sans-serif;
    background-color: #f9f9f9;
  }

  .signup-container {
    width: 400px;
    margin: 50px auto;
    padding: 25px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
  }

  h2 {
    text-align: center;
    margin-bottom: 20px;
  }

  .form-group {
    margin-bottom: 15px;
  }

  label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
  }

  input[type="text"],
  input[type="password"] {
    width: 100%;
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
  }

  .submit-btn {
    width: 100%;
    padding: 10px;
    background-color: #3478f6;
    border: none;
    color: white;
    font-size: 16px;
    border-radius: 4px;
    cursor: pointer;
    margin-top: 10px;
  }

  .submit-btn:hover {
    background-color: #255dc1;
  }

  .register-link {
    margin-top: 15px;
    text-align: center;
    font-size: 14px;
    color: #666;
  }

  .register-link a {
    color: #3478f6;
    text-decoration: none;
    font-weight: bold;
  }

  .register-link a:hover {
    text-decoration: underline;
  }
</style>

<script type="text/javascript">
$(document).ready(function(){

  $('#loginBtn').click(function() {
	  const id =  $('#id').val().trim();
	  const password = $('#password').val().trim();
	
	  if(id.length == 0 || password.length == 0){
		  alert("아이디 또는 비밀번호에 값이 비었습니다.");
		  return;
	  }
	  // 유효성 통과
	  
	  $('#loginForm').submit();  // 컨트롤러에 전송  
	  
  });
  
 
  
  // 회원가입 페이지 이동
  $('#goRegisterLink').click(function() {
    location.href = '/signupForm'; // 회원가입 경로
  });
});
</script>
</head>
<body>
  <div class="signup-container">
    <h2>로그인</h2>
    <form method="post" id="loginForm" action="/loginForm">
      <div class="form-group">
        <label for="id">ID</label>
        <input type="text" name="id" id="id" required>
      </div>

      <div class="form-group">
        <label for="password">비밀번호</label>
        <input type="password" name="password" id="password" required>
      </div>

      <button type="button" id="loginBtn" class="submit-btn">로그인</button>
    </form>

    <div class="register-link">
      아직 계정이 없으신가요?
      <a href="javascript:void(0);" id="goRegisterLink">회원가입</a>
    </div>
  </div>
</body>
</html>
