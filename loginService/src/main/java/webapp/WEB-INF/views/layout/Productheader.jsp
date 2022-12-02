<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/animation.css">
</head>

<style>

header nav a {
  color: #fff;
  display: inline-block;
  padding: 10px 15px;
  line-height: 1;
  text-decoration: none;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  -ms-border-radius: 2px;
  -o-border-radius: 2px;
  border-radius: 2px;
}

/* Sticky Header Style */
/* ---------------------------------------- */
body.sticky-header {
  padding-top: 100px;
}
body.sticky-header header {
  height: 60px;
  background-color: rgba(249, 152, 62, 0.77);
}
body.sticky-header header h1 {
  -webkit-transform: scale(0, 0);
  -moz-transform: scale(0, 0);
  -ms-transform: scale(0, 0);
  -o-transform: scale(0, 0);
  transform: scale(0, 0);
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

.image-box3 {
	width: 100%;
	height: 200px;
	overflow: auto;
	object-fit: contain;
}

.image-box4 {
	width: 100%;
	height: 330px;
	overflow: auto;
	object-fit: contain;
}

img {
	max-width: 100%;
	height: auto;
}

/* 스크롤바 설정*/
.type2::-webkit-scrollbar {
	width: 6px;
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
	height: 100vh;
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
	height: 100%;
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

</body>
</html>