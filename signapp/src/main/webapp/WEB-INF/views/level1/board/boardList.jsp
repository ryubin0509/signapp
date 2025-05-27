<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>게시판 목록</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f9f9f9;
    }

    .board-container {
      max-width: 900px;
      margin: 50px auto;
      background-color: white;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      padding: 12px;
      border-bottom: 1px solid #ddd;
      text-align: left;
    }

    th {
      background-color: #f1f1f1;
    }

    tr:hover {
      background-color: #f9f9f9;
    }

    .write-btn {
      display: inline-block;
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #3478f6;
      color: white;
      text-decoration: none;
      border-radius: 4px;
      float: right;
    }

    .write-btn:hover {
      background-color: #245dc1;
    }

    .pagination {
      margin-top: 40px;
      text-align: center;
    }

    .pagination a, .pagination span {
      display: inline-block;
      margin: 0 5px;
      padding: 8px 14px;
      border-radius: 4px;
      text-decoration: none;
      background-color: #e9ecef;
      color: #333;
      font-weight: bold;
    }

    .pagination a:hover {
      background-color: #ced4da;
    }

    .pagination .current {
      background-color: #3478f6;
      color: white;
    }
  </style>
</head>
<body>

<div class="board-container">
  <h2>📋 게시판</h2>

  <table>
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
		<th>작성일</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="doc" items="${docList}">
        <tr>
          <td>${doc.documentId}</td>
          <td><a href="/level1/board/boardOne?id=${doc.documentId}">${doc.title}</a></td>
          <td>${doc.uploaderName}</td>
 		  <td>${fn:substring(doc.uploadedTime,0,16)}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>

  <a href="/level1/write" class="write-btn">글쓰기</a>

  <!-- ✅ 페이징 영역 -->
  <div class="pagination">
    <c:if test="${page.currentPage > 1}">
      <a href="/level1/board/boardList?currentPage=${page.currentPage - 1}">이전</a>
    </c:if>

    <span class="current">${page.currentPage}</span>

    <c:if test="${page.currentPage < page.lastPage}">
      <a href="/level1/board/boardList?currentPage=${page.currentPage + 1}">다음</a>
    </c:if>
  </div>
</div>

</body>
</html>
