<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
보이나요?
---${principal.user.username}---<br/>
---${principal.user}---
<button id="btn-login-success">로그인 성공</button>
<a href="http://localhost:13000/index">
  <button>이동</button>
</a>
</body>
<script>

	let index = {
		init: function(){
			$("#btn-login-success").on("click", ()=>{ // function(){} , ()=>{} this를 바인딩하기 위해서!!
				this.save();
			});
		},

		save: function(){
			console.log("yy")
			var obj = ${principal.user}
					obj.desc = $("#desc").val();;
			$.ajax({
				url: "http://localhost:13000/index",
				type: "POST",
				dataType: "json",
				processData: true,
				contentType: "application/json; charset=UTF-8",
				data: JSON.stringify(obj),
				success: function(data) {
					if (data == 1) {
						alert("등록 성공");
						location.href = "http://localhost:13000/index";
					} else {
						alert("등록 실패!");
					}
				}
			});

		}
	}

	index.init();


</script>
</html>