<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript"></script>
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

  .radio-group {
    margin-top: 10px;
  }

  .radio-group label {
    font-weight: normal;
    margin-right: 15px;
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
  }

  .submit-btn:hover {
    background-color: #255dc1;
  }

  .id-check-container {
    display: flex;
    gap: 10px;
    align-items: center;
  }

  .id-check-btn {
    padding: 7px 12px;
    font-size: 14px;
    cursor: pointer;
    border-radius: 4px;
    background-color: #ddd;
    border: none;
    min-width: 90px; 
  }

  .id-check-result {
    margin-top: 5px;
    font-size: 14px;
  }
  
</style>

<script type="text/javascript">
$(document).ready(function (){




}
</script>
</head>
<body>
  <div class="signup-container">
    <h2>회원가입</h2>
    <form action="/register" method="post">
      <div class="form-group">
        <label for="id">ID</label>
        <div class="id-check-container">
          <input type="text" name="id" id="id" required>
          <button type="button" id="checkIdBtn" class="id-check-btn">중복확인</button>
        </div>
        <div id="idCheckResult" class="id-check-result"></div>
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" name="password" id="password" required>
      </div>

      <div class="form-group">
        <label for="name">이름</label>
        <input type="text" name="name" id="name" required>
      </div>

      <div class="form-group">
        <label>직급</label>
        <div class="radio-group">
          <label><input type="radio" name="level" value="1" required> 사원</label>
          <label><input type="radio" name="level" value="2"> 과장</label>
          <label><input type="radio" name="level" value="3"> 팀장</label>
        </div>
      </div>

      <button type="submit" class="submit-btn">회원가입</button>
    </form>
  </div>
</body>
</html>
