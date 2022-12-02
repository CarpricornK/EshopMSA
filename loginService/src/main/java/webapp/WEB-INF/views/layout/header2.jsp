<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>

<style>
input::placeholder {
  color: white;
  width:100%;
}

.image-box {
	height: 350px;
	overflow: auto;
	object-fit: contain;
}

img {
	max-width: 50%;
	height: auto;
}

select {
	width: 200px; /* 원하는 너비설정 */
	padding: .8em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%; /* 네이티브 화살표 대체 */
	border: 1px solid #999;
	border-radius: 4px;
	/* iOS 둥근모서리 제거 */
	-webkit-appearance: none;
	/* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}


.nav-item {
	height: 40px;
}
.nav-link {
	font-size: 14px;
	color: black!important;
}

/* ================== 슬라이더 =================== */
</style>

<body>

<nav class="navbar navbar-expand-sm bg-light navbar-light">
	<ul class="navbar-nav">
		<li class="nav-item active">
			<a class="nav-link" href="/">
				<img style="width:160px!important; height: 40px!important;; margin-top: -7px!important;;" src="https://i.ibb.co/QKnB8Wv/Esshop-Logo.png">
			</a>
		</li>

		<li class="nav-item d-flex align-items-center" style="position: absolute; right: 215px">
			<a class="nav-link" href="/">메인</a>
		</li>
		<li class="nav-item d-flex align-items-center" style="position: absolute; right: 152px">
			<a class="nav-link" href="/productfavorite">찜목록</a>
		</li>
		<li class="nav-item d-flex align-items-center" style="position: absolute; right: 75px">
			<a class="nav-link" href="/auth/joinForm">회원가입</a>
		</li>
		<li class="nav-item d-flex align-items-center" style="position: absolute; right: 5px">
			<a class="nav-link" href="/logout">로그아웃</a>
		</li>

	</ul>
</nav>


</body>
</html>