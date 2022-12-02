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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="./style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.6.1.js"
			integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
			crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/css/hbutton.css">
</head>

<style>

* {
			-webkit-user-select: none;
			-moz-user-select: none;
			-ms-user-select: none;
			user-select: none;
			box-sizing: border-box;
		}
	
		.ctrl {
			-webkit-box-flex: 0;
			-ms-flex: 0 0 auto;
			flex: 0 0 auto;
			display: -webkit-box;
			display: -ms-flexbox;
			display: flex;
			-webkit-box-align: center;
			-ms-flex-align: center;
			align-items: center;
			border-bottom: 1px solid #D5DCE6;
			background-color: #fff;
			border-radius: 5px;
			font-size: 15px;
		}
		.ctrl-counter {
			position: relative;
			width: 35px;
			height: 20px;
			color: #333C48;
			text-align: center;
			overflow: hidden;
		}
		.ctrl-counter.is-input .ctrl-counter-num {
			visability: hidden;
			opacity: 0;
			-webkit-transition: opacity 100ms ease-in;
			transition: opacity 100ms ease-in;
		}
		.ctrl-counter.is-input .ctrl-counter-input {
			visability: visible;
			opacity: 1;
			-webkit-transition: opacity 100ms ease-in;
			transition: opacity 100ms ease-in;
		}
		.ctrl-counter-input {
			width: 100%;
			margin: 0;
			padding: 0;
			position: relative;
			z-index: 2;
			box-shadow: none;
			outline: none;
			border: none;
			color: #333C48;
			font-size: 20px;
			line-height: 50px;
			text-align: center;
			visability: hidden;
			opacity: 0;
			-webkit-transition: opacity 100ms ease-in;
			transition: opacity 100ms ease-in;
		}
		.ctrl-counter-num {
			position: absolute;
			z-index: 1;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			line-height: 20px;
			visability: visible;
			opacity: 1;
			-webkit-transition: opacity 100ms ease-in;
			transition: opacity 100ms ease-in;
		}

		.ctrl-counter-num.is-increment-hide {
			opacity: 0;
			-webkit-transform: translateY(-50px);
			transform: translateY(-50px);
			-webkit-animation: increment-prev 100ms ease-in;
			animation: increment-prev 100ms ease-in;
		}
		.ctrl-counter-num.is-increment-visible {
			opacity: 1;
			-webkit-transform: translateY(0);
			transform: translateY(0);
			-webkit-animation: increment-next 100ms ease-out;
			animation: increment-next 100ms ease-out;
		}
		.ctrl-counter-num.is-decrement-hide {
			opacity: 0;
			-webkit-transform: translateY(50px);
			transform: translateY(50px);
			-webkit-animation: decrement-prev 100ms ease-in;
			animation: decrement-prev 100ms ease-in;
		}
		.ctrl-counter-num.is-decrement-visible {
			opacity: 1;
			-webkit-transform: translateY(0);
			transform: translateY(0);
			-webkit-animation: decrement-next 100ms ease-out;
			animation: decrement-next 100ms ease-out;
		}
		.ctrl-button {
			width: 30px;
			line-height: 30px;
			text-align: center;
			color: #fff;
			cursor: pointer;
			background-color: #8498a7;
			-webkit-transition: background-color 100ms ease-in;
			transition: background-color 100ms ease-in;
		}
		.ctrl-button:hover {
			background-color: #90a2b0;
			-webkit-transition: background-color 100ms ease-in;
			transition: background-color 100ms ease-in;
		}
		.ctrl-button:active {
			background-color: #778996;
			-webkit-transition: background-color 100ms ease-in;
			transition: background-color 100ms ease-in;
		}
		.ctrl-button-decrement {
			border-radius: 5px 0 0 5px;
		}
		.ctrl-button-increment {
			border-radius: 0 5px 5px 0;
		}
		@-webkit-keyframes decrement-prev {
			from {
			opacity: 1;
			-webkit-transform: translateY(0);
			transform: translateY(0);
		}
		}	@keyframes decrement-prev {
			from {
			opacity: 1;
			-webkit-transform: translateY(0);
			transform: translateY(0);
		}
		}	@-webkit-keyframes decrement-next {
			from {
			opacity: 0;
			-webkit-transform: translateY(-50px);
			transform: translateY(-50px);
		}
		}	@keyframes decrement-next {
			from {
			opacity: 0;
			-webkit-transform: translateY(-50px);
			transform: translateY(-50px);
		}
		}	@-webkit-keyframes increment-prev {
			from {
			opacity: 1;
			-webkit-transform: translateY(0);
			transform: translateY(0);
		}
		}	@keyframes increment-prev {
			from {
			opacity: 1;
			-webkit-transform: translateY(0);
			transform: translateY(0);
		}
		}	@-webkit-keyframes increment-next {
			from {
			opacity: 0;
			-webkit-transform: translateY(50px);
			transform: translateY(50px);
		}
		}	@keyframes increment-next {
			from {
			opacity: 0;
			-webkit-transform: translateY(50px);
			transform: translateY(50px);
		}
		}

/* =================체크박스================== */
.carousel-inner img {
	width: 100%;
	height: 100%;
}

hr {
	
}

.image-box {
	width: 100%;
	height: 250px;
	overflow: auto;
	object-fit: contain;
}

img {
	max-width: 100%;
	height: auto;
}

#font1 {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 10px;
}

#card1 {
	border-top: solid #848484 1px;
	border-right: solid #FFFFFF 1px;
	border-bottom: solid #848484 1px;
	border-left: solid #FFFFFF 1px;
	border-radius: 3px;
}

/* 스크롤바 설정*/
.type2::-webkit-scrollbar {
	width: 4px;
}

/* 스크롤바 막대 설정*/
.type2::-webkit-scrollbar-thumb {
	height: 4px;
	background-color: rgba(255, 141, 50, 1);
	border-radius: 10px;
}

/* 스크롤바 뒷 배경 설정*/
.type2::-webkit-scrollbar-track {
	background-color: rgba(33, 133, 133, 0.33);
}

/* ================== 슬라이더 =================== */
@import
	url(https://fonts.googleapis.com/css?family=Josefin+Sans:400,700);

@import
	url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css)
	;

*, *:before, *:after {
	box-sizing: border-box;
}

.slider {
	height: 500px;
	position: relative;
	overflow: hidden;
	display: flex;
	flex-flow: row nowrap;
	align-items: flex-end;
	justify-content: center;
}

.slider__dot {
	width: 16px;
	height: 16px;
	margin: 2rem 16px;
	border-radius: 50%;
	z-index: 10;
	background-color: #ccc;
	outline: 8px solid #ccc;
	outline-offset: -8px;
	box-shadow: 0 0 0 0 #333, 0 0 0 0 rgba(51, 51, 51, 0);
	cursor: pointer;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
}

.slider__dot:checked {
	background-color: #333;
	-webkit-animation: check 0.5s linear forwards;
	animation: check 0.5s linear forwards;
}

.slider__dot:checked:nth-of-type(1) ~ .slider__inner {
	transform: translateX(0%);
}

.slider__dot:checked:nth-of-type(2) ~ .slider__inner {
	transform: translateX(-25%);
}

.slider__dot:checked:nth-of-type(3) ~ .slider__inner {
	transform: translateX(-50%);
}

.slider__dot:checked:nth-of-type(4) ~ .slider__inner {
	transform: translateX(-75%);
}

.slider__inner {
	position: absolute;
	top: 0;
	left: 0;
	width: 400%;
	height: 500px!important;
	transition: all 1s ease-out;
	display: flex;
	flex-flow: row nowrap;
}

.slider__body {
	display: flex;
	flex: 1;
	flex-flow: column nowrap;
	align-items: center;
	justify-content: center;
	padding: 2rem;
	text-align: center;
	height: 400px;
}

.slider__image {
	font-size: 2.7rem;
	margin-bottom: 2rem;
}

.slider__caption {
	font-weight: bold;
	margin-bottom: 1rem;
	text-transform: uppercase;
}

.slider__text {
	color: #999;
	margin-bottom: 3rem;
	max-width: 300px;
}

.nav-item {
	height: 40px;
}
.nav-link {3
	font-size: 14px;
	color: black!important;
}
/* ================== 슬라이더 =================== */
</style>

<body>
<!-- auth 는 인증없이 들어갈수있다는 뜻 -->
			<c:choose>
				<c:when test="${empty principal}">

					<nav class="navbar navbar-expand-sm bg-light navbar-light">
						<ul class="navbar-nav">
							<li class="nav-item active">
								<a class="nav-link" href="/index">
									<img style="width:80px; height: 40px; margin-top: -7px;" src="https://i.ibb.co/QKnB8Wv/Esshop-Logo.png">
								</a>
							</li>

							</li>
							<li class="nav-item d-flex align-items-center" style="position: absolute; right: 75px">
								<a class="nav-link" href="/auth/joinForm">회원가입</a>
							</li>
							<li class="nav-item d-flex align-items-center" style="position: absolute; right: 5px">
								<a class="nav-link" href="/auth/loginForm">로그인</a>
							</li>

						</ul>
					</nav>

				</c:when>


				<c:otherwise>

					<nav class="navbar navbar-expand-sm bg-light navbar-light">
						<ul class="navbar-nav">
							<li class="nav-item active">
								<a class="nav-link" href="/">
									<img style="width:80px; height: 40px; margin-top: -7px;" src="https://i.ibb.co/QKnB8Wv/Esshop-Logo.png">
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

				</c:otherwise>
			</c:choose>




		</div>
	</nav>
	<br>

</body>
</html>