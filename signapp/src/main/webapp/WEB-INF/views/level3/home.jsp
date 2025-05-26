<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Level 3 홈</title>
<style>
  body {
    font-family: 'Arial', sans-serif;
    background-color: #f0f2f5;
    margin: 0;
    padding: 0;
  }

  .header {
    background-color: #3478f6;
    color: white;
    padding: 20px;
    text-align: center;
  }

  .container {
    max-width: 600px;
    margin: 50px auto;
    padding: 30px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    text-align: center;
  }

  .username {
    font-size: 20px;
    margin-bottom: 15px;
  }

  .role-label {
    color: gray;
    font-size: 14px;
    margin-bottom: 30px;
  }

  .logout-btn {
    padding: 10px 20px;
    background-color: #ff5555;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
  }

  .logout-btn:hover {
    background-color: #cc4444;
  }
</style>
</head>
<body>

<div class="header">
  <h1>레벨 3 사용자 홈</h1>
</div>

<div class="container">
  <div class="username">
    안녕하세요, <strong>${sessionScope.loginUser.name}</strong> 님!
  </div>
  <div class="role-label">
    (사원 계정 - ${sessionScope.loginUser.level})
  </div>

  <button class="logout-btn" onclick="location.href='/logout'">로그아웃</button>
</div>

</body>
</html>
