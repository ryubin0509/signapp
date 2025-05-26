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
let idCheckPassed = false;

$(document).ready(function (){
	$('#checkIdBtn').click(function(){
		const idValue = $('#id').val().trim(); 
		
		if(idValue.length > 4){
		$.ajax({
			asyn : true //  비동기요청
		   , url : '/checkId'
		   , type : 'get'
		   , data : {
			   id: idValue
			   
			   
		   }
		}).done(function (res) {
	        // ✅ 서버에서 받은 JSON 응답(res)에서 status 체크
	        if (res.status === 'success') {
	          $('#idCheckResult').text(res.message);
	          idCheckPassed = true;
	        } else {
	          $('#idCheckResult').text(res.message);
	          idCheckPassed = false;
	        }
	      }).fail(function () {
	        $('#idCheckResult').text('서버 오류로 중복 확인 실패');
	        idCheckPassed = false;
	      });
	    } else {
	      $('#idCheckResult').text('아이디는 5자 이상이어야 합니다.');
	      idCheckPassed = false;
	    }
		
	});

	$('#submitBtn').click(function(){
		
		
		if (!idCheckPassed){
			alert("ID 중복 확인을 통과해야 합니다.");
			return;
		}
		
		
			 const id = $('#id').val().trim();    
			 const password = $('#password').val().trim();  
			 const name =  $('#name').val().trim();
			 const level = $('input[name="level"]:checked').val();
		// formData 에 넘길 데이터 저장
		
		if(!id || !password || !name || !level){
			alert("모든 항목을 입력해 주세요.");
			return;
		}
		
		$.ajax({
			
			url:'/register',
			type: 'post',
			data: {id: id, 
			 	   password: password,
			 	   name: name,
			 	   level: level 
			}
		})
		.done(function (res){
			alert('회원가입 성공');
			location.href = '/login';
		})
		.fail(function (){
			alert('회원가입 실패:');
			return; 
		})
	})


});
</script>
</head>
<body>
  <div class="signup-container">
    <h2>회원가입</h2>
	<form method="post" id="register" >
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

      <button type="button" id="submitBtn" class="submit-btn">회원가입</button>
    </form>
  </div>
</body>
</html>
