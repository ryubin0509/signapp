<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Level 3 홈</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- ✅ 상단 네비게이션 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <span class="navbar-brand">레벨 3 사용자 홈</span>
    <div class="collapse navbar-collapse justify-content-end">
      <ul class="navbar-nav">
        <!-- 🔗 문서 목록 보기 -->
        <li class="nav-item">
          <a class="nav-link" href="/level3/board/boardList">📂 문서 목록</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-danger" href="/logout">로그아웃</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- ✅ 본문 -->
<div class="container mt-5">
  <div class="card shadow-sm">
    <div class="card-body text-center">
      <h4 class="card-title">안녕하세요, <strong>${sessionScope.loginUser.name}</strong> 님!</h4>
      <p class="card-text text-muted">
        (팀장 계정 - ${sessionScope.loginUser.level})
      </p>
    </div>
  </div>
</div>

<!-- ✅ Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
