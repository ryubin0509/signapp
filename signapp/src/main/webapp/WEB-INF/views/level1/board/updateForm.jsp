<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>게시글 작성</title>
  <!-- ✅ Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f4f6f9;
    }
    .form-container {
      max-width: 800px;
      margin: 60px auto;
      background-color: #fff;
      border: 1px solid #dee2e6;
      border-radius: 8px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
      padding: 40px;
    }
    .form-title {
      font-weight: 600;
      font-size: 24px;
      text-align: center;
      margin-bottom: 30px;
      color: #343a40;
    }
    .form-label {
      font-weight: 500;
    }
    .btn-primary {
      width: 200px;
    }
  </style>
</head>
<body>

<div class="form-container">
  <div class="form-title">📄 게시글 작성</div>
  <form action="/level1/board/update?documentId=${doc.documentId}" method="post">
   	
   	<div class="mb-4">
      <label for="title" class="form-label">제목</label>
      <input type="text" class="form-control" id="title" name="title" value="${doc.title}" placeholder="문서 제목을 입력하세요" required>
    </div>
    <div class="mb-4">
      <label for="content" class="form-label">내용</label>
      <textarea class="form-control"    id="content" name="content" rows="10" placeholder="문서 내용을 입력하세요" required>${doc.content}</textarea>
    </div>
    <div class="text-center">
      <button type="submit" class="btn btn-primary">🖊 작성 완료</button>
    </div>
  </form>
</div>

<!-- ✅ Bootstrap JS (선택 사항) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
