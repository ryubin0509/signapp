<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>지출결의서</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
    background-color: #f8f9fa;
    font-family: 'Malgun Gothic', sans-serif;
    margin: 0;
    padding: 30px;
  }

  .container {
    max-width: 800px;  /* ✅ 이 값만 조절하면 폭이 적당히 제한됨 */
    width: 100%;
    margin: auto;
    background-color: #fff;
    padding: 40px;
    border-radius: 6px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
  }

    .approval-box {
      display: flex;
      justify-content: end;
      gap: 10px;
      margin-bottom: 20px;
    }

    .approval-box div {
      border: 1px solid #333;
      width: 60px;
      height: 60px;
      text-align: center;
      line-height: 60px;
      font-weight: bold;
    }

    table tr, table td, table th {
      text-align: center;
      vertical-align: middle;
    }

    .table-bordered th, .table-bordered td {
      border: 1px solid #000;
    }

    .title {
      font-size: 24px;
      font-weight: bold;
      text-align: center;
      margin-bottom: 30px;
    }

    .signature-line {
      margin-top: 40px;
      text-align: center;
    }

    .text-end {
      text-align: end;
    }

    .btn-box {
      margin-top: 30px;
      text-align: right;
    }

    .btn-box .btn {
      margin-left: 10px;
    }
  </style>
</head>
<body>

<div class="container">
  <div class="title">지출결의서</div>

  <div class="text-end mb-3">작성일자 : ${doc.uploadedTime}</div>

  <div class="approval-box">
    <div>결재</div>
    <c:choose>
    <c:when test="${loginUser.level == 2 && signL2 == 0}">
    <div><a href="/signLevel3?documentId=${doc.documentId}&employeeId=${loginUser.id}&signOrder=2">과장</a></div>
    </c:when>
   <c:when test="${signL2 eq 1}">
    <div>
        <img src="/upload/${file}" alt="과장사인" style="width: 60px; height: 60px;">
      </div>
    </c:when>
    <c:otherwise>
    <div>&nbsp;</div>
    </c:otherwise>
    </c:choose>
 
    <c:choose>
    <c:when test="${loginUser.level == 3 && signL2 == 1 && signL3 == 0}">
    <div><a href="/signLevel3?documentId=${doc.documentId}&employeeId=${loginUser.id}&signOrder=3">팀장</a></div>
    </c:when>
    <c:when test="${signL3 eq 1}">
     <div>
        <img src="/upload/${file2}" alt="팀장사인" style="width: 60px; height: 60px;">
      </div>
    </c:when>
    <c:otherwise>
    <div>팀장</div>
    </c:otherwise>
    </c:choose>
  </div>
	
  <table class="table table-bordered mb-4">
 
    <tr>
      <th>작성자</th>
      <td colspan="3">${doc.uploaderName}</td>
    </tr>
    <tr>
      <th>문서 제목</th>
      <td colspan="3">${doc.title}</td>
    </tr>
    <tr>
      <th>문서 ID</th>
      <td>${doc.documentId}</td>
      <th>작성자 ID</th>
      <td>${doc.uploaderId}</td>
    </tr>
  </table>

  <h5 class="mb-2">내역</h5>
  <table class="table table-bordered">
    <thead class="table-light">
      <tr>
        <th style="width: 20%">적요</th>
        <th>내역</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>요청사항</td>
        <td class="text-start">${doc.content}</td>
      </tr>
    </tbody>
  </table>

  <div class="signature-line">
    위 내용을 확인하고 결재 요청합니다. <br><br>
    ${doc.uploadedTime}
  </div>


<a href="/level3/board/boardList"
   class="btn btn-outline-secondary btn-sm"
   style="font-size: 14px; padding: 4px 10px;">
  ← 목록
</a>


  
  <c:if test="${loginUser.id.toString()== doc.uploaderId.toString()}">
  <div class="btn-box">
    <a href="/level1/board/update?id=${doc.documentId}" class="btn btn-warning">수정</a>
    <a href="/level1/board/delete?id=${doc.documentId}" class="btn btn-danger"
       onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
  </div>
  </c:if>
  
</div>

</body>
</html>
