<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<META HTTP-EQUIV="EXPIRES" CONTENT="Mon, 22 Jul 2002 11:12:01 GMT">
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
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


	<script src="https://code.jquery.com/jquery-3.6.1.js"
			integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
			crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3/dist/chart.min.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@500&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Readex+Pro:wght@300&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Baloo+Da+2&display=swap" rel="stylesheet">


</head>

<style>
	::-webkit-scrollbar {
		width: 5px;
		height: 5px;
	}

	/* ???????????? ?????? ??????*/
	::-webkit-scrollbar-thumb {
		width: 5px;
		height: 5px;
		background-color: rgba(255, 141, 50, 1);
		border-radius: 10px;
	}

	/* ???????????? ??? ?????? ??????*/
	::-webkit-scrollbar-track {
		background-color: rgba(33, 133, 133, 1);
	}

	body{
		font-family: 'Play', sans-serif!important;
		background: #222!important;
	}


	.ahover1:hover {
		color: #f74e3b!important;
		transition: all .5s!important;
		text-decoration:none!important;
	}

	img {
		width:250px !important;
		height: 250px !important;
	}

	@keyframes disappear {
		from{
			opacity: 0.1;
		}
		to{
			opacity: 1;
		}
	}

	@keyframes disappear2 {
		from{
			opacity: 1;
		}
		to{
			opacity: 0.1;
		}
	}

	.animation1{
		opacity: 0;
	}
	.animation2{
		opacity: 0;
	}
	.animation3{
		opacity: 0;
	}
	.animation4{
		opacity: 0;
	}
	.card{
		background-color: rgba(242, 242, 242, 0);
		border: 1px solid rgba(242, 242, 242, 0);
		height:150px;
	}

	body {
		background-color: rgba(242, 242, 242, 1);
		/*background-size: 100%;*/
		background-position: center top;
		background-attachment:fixed;
		top: 10px;


		/*	transform: rotateX(360deg);*/
		/*	transition-property: all;*/
		/*	transition-duration: 1s;*/
		/*	transition-timing-function: ease;*/
		/*	transition-delay: 1s;*/
	}

	/*slider*/
	*:focus, *:active, *:visited {
		outline: none; }

	.tarkikComandSlider {
		width: 1300px;
		height: 380px;
		background: #222;
		position: relative;
		color: white;
		display: flex;
		justify-content:center;
	}



	.comandSlider__item {
		margin: 0 5px;
		padding: 0px;
	}

	.slick-dots {
		position: absolute;
		bottom: -45px;
		display: block;
		width: 100%;
		padding: 0;
		list-style: none;
		text-align: center; }
	.slick-dots li {
		position: relative;
		display: inline-block;
		width: 6px;
		height: 6px;
		margin: 0 5px;
		padding: 0;
		cursor: pointer; }
	.slick-dots li button {
		display: none; }
	.slick-dots li:before {
		top: 1px;
		transition: all .5s;
		content: '';
		width: 6px;
		height: 6px;
		background-color: #ffffff;
		position: absolute; }
	.slick-dots li.slick-active:before {
		top: 0;
		width: 8px;
		height: 8px;
		margin-left: -2px;
		background-color: #964848; }

	.slick-prev {
		left: 0;
		transform: rotate(180deg); }

	.slick-next {
		right: 0; }

	.slick-arrow {
		top: 50%;
		height: 26px;
		width: 14px;
		margin-top: -13px;
		padding: 20px;
		position: absolute;
		font-size: 0;
		cursor: pointer;
		background-color: transparent;
		border: none;
		background-image: url(https://i.ibb.co/wyRK0cn/baseline-arrow-forward-ios-black-24dp.png);
		background-repeat: no-repeat;
		outline: none!important;
	}



	.col-span {
		cursor: pointer;
		heigth: 100%;
	}


	.start-btn,
	.reset-btn {
		margin: 0px auto 20px;
		cursor: pointer;
		padding: 5px 15px;
		border-radius: 5px;
	}
	.start-btn:hover,
	.reset-btn:hover {
		color: #ffb76b;
	}

	.copy {
		color: #ff8505;
		font-size: 0.8em;
	}
	.copy a {
		color: #9e5100;
	}
	/*	END TIMER STYLE*/

	/*????????? ???*/
	* {
		box-sizing: border-box;
	}
	h1 {
		color: #ECF0F1;
		font-size: 16px;
		letter-spacing: 3px;
		text-transform: uppercase;
	}
	.navbar4 {
		width: 400px;
		margin: 0 auto;
		text-align: center;
	}
	.pomoOptions {
		float: left;
		width: 200px;
	}
	.pomoOptions .btn {
		float: left;
	}
	.pomoText {
		color: #ECF0F1;
		font-size: 12px;
		text-transform: uppercase;
	}
	.pomoButtons {
		width: 100px;
		margin: 0 auto;
	}
	.pomoOpt {
		float: left;
		width: 30px;
		text-align: center;
		padding-top: .5em;
		color: #ECF0F1;
	}
	.timer {
		clear: both;
		width: 100%;
	}
	.timerClock {
		color: #ECF0F1;
		font-size: 88px;
		text-align: center;
	}
	.timerStatus {
		width: 400px;
		height: 20px;
		text-align: center;
		margin: 0 auto;
	}
	.timerBar {
		width: 100%;
		height: 15px;
		margin: 0 auto;
		background: #FFFFFF;
	}
	.instructions {
		color: #ECF0F1;
		width: 400px;
		margin: 20px auto;
		text-align: center;
	}


	/*?????? ???*/
	#timedate {
		font: small-caps lighter 38px/120% "Segoe UI", Frutiger, "Frutiger Linotype", "Dejavu Sans", "Helvetica Neue", Arial, sans-serif;
		text-align:left;
		width: 70%;
		color:white;
		padding: 25px;
		border-left: 1px solid white;
	}

	:root{
		--text-light: rgba(255,255,255,0.6);
		--text-lighter: rgba(255,255,255,0.9);
		--spacing-s: 8px;
		--spacing-m: 16px;
		--spacing-l: 24px;
		--spacing-xl: 32px;
		--spacing-xxl: 64px;
		--width-container: 1200px;
	}

	@keyframes opacity3 {
		from{
			opacity: 0.1;
		}
		to{
			opacity: 1;
		}
	}

	.nava {
		color: floralwhite !important;
		font-family: sans-serif;
		font-size: 14px;
	}

	input::placeholder {
		color: white;
		width:100%;
	}

	select {
		width: 200px; /* ????????? ???????????? */
		padding: .8em .5em; /* ???????????? ?????? ?????? */
		font-family: inherit; /* ?????? ?????? */
		background:
				url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
				no-repeat 95% 50%; /* ???????????? ????????? ?????? */
		border: 1px solid #999;
		border-radius: 4px;
		/* iOS ??????????????? ?????? */
		-webkit-appearance: none;
		/* ???????????? ?????? ????????? */
		-moz-appearance: none;
		appearance: none;
	}

	.hero-section{
		margin-right: auto;
		margin-left: auto;
		background-color: rgba(242, 242, 242, 1);

	}

	.card-grid{
		display: grid;
		background-color: #0005;
		background-blend-mode: darken;
		grid-template-columns: repeat(1, 1fr);
		grid-column-gap: var(--spacing-l);
		grid-row-gap: var(--spacing-l);
		max-width: var(--width-container);
		width: 100%;
	}

	@media(min-width: 540px){
		.card-grid{
			grid-template-columns: repeat(2, 1fr);
		}
	}

	@media(min-width: 960px){
		.card-grid{
			grid-template-columns: repeat(4, 1fr);
		}
	}

	.card{
		list-style: none;
		position: relative;
	}


	.card__background{
		background-size: cover;
		background-position: center;
		border-radius: var(--spacing-l);
		bottom: 0;
		filter: brightness(0.75) saturate(1.2) contrast(0.85);
		left: 0;
		position: absolute;
		right: 0;
		top: 0;
		transform-origin: center;
		trsnsform: scale(1) translateZ(0);
		transition:
				filter 200ms linear,
				transform 200ms linear;
	}

	.card:hover .card__background{
		transform: scale(1.05) translateZ(0);
	}

	.card-grid:hover > .card:not(:hover) .card__background{
		filter: brightness(0.5) saturate(0) contrast(1.2) blur(10px);
	}

	.card__content{
		left: 0;
		padding: var(--spacing-l);
		position: absolute;
		top: 0;
	}

	.card__category{
		color: var(--text-light);
		font-size: 12px;
		font-family: sans-serif;
	}

	.card__heading{
		color: var(--text-lighter);
		font-size: 1.9rem;
		text-shadow: 2px 2px 20px rgba(0,0,0,0.2);
		line-height: 1.4;
		font-family: sans-serif;
	}


	.select-hidden {
		display: none;
		visibility: hidden;
		padding-right: 10px;
	}

	.select {
		cursor: pointer;
		display: inline-block;
		position: relative;
		font-size: 16px;
		color: #1a1a1a;
		width: 220px;
		height: 41px;
	}

	.select-styled {
		background-color: azure;
		border-radius: 3px;
		padding: 8px 15px;
		-webkit-transition: all 0.2s ease-in;
		-moz-transition: all 0.2s ease-in;
		-o-transition: all 0.2s ease-in;
		transition: all 0.2s ease-in;

	}
	.select-styled:after {
		content: "";
		width: 0;
		height: 0;
		border: 1px solid transparent;
		border-color: azure transparent transparent transparent;
		position: absolute;
		top: 16px;
		right: 10px;
	}
	.select-styled:hover {
		background-color: #f74e3b;
	}
	.select-styled:active, .select-styled.active {
		background-color: #f74e3b;
	}
	.select-styled:active:after, .select-styled.active:after {
		top: 9px;
		border-color: transparent transparent #fff transparent;
	}

	.select-options {
		display: none;
		position: absolute;
		top: 100%;
		right: 0;
		left: 0;
		z-index: 999;
		margin: 0;
		padding: 0;
		list-style: none;
		background-color: #f74e3b;
	}
	.select-options li {
		margin: 0;
		padding: 12px 0;
		text-indent: 15px;
		border-top: 1px solid #f74e3b;
		-webkit-transition: all 0.15s ease-in;
		-moz-transition: all 0.15s ease-in;
		-o-transition: all 0.15s ease-in;
		transition: all 0.15s ease-in;
	}
	.select-options li:hover, .select-options li.is-selected {
		color: #c0392b;
		background: #fff;
	}
	.select-options li[rel=hide] {
		display: none;
	}

	.input2{
		background-color: azure;
		width: 600px;
		height: 41px;
		color: rgba(17, 23, 24, 0.7);
		border-radius: 3px;
		border:1px solid rgba(247, 78, 59, 0);
	}

	.input2:hover{
		background-color: rgba(247, 78, 59, 0.8);
		color: azure;
		transition-property: background-color;
		transition-duration: .5s;
	}

	.input2:focus{
		background-color: rgba(247, 78, 59, 0.8);
		color: whitesmoke;
		transition-property: background-color;
		transition-duration: .5s;

	}


	.sbutton{
		border: none;
		color: rgba(17, 23, 24, 0.7);
		outline: none;
		border-radius: 3px;
		margin-left: 1px;
		width: 80px;
		height: 41px;
		background-color: azure;
	}

	.sbutton:hover{
		background-color: rgba(247, 78, 59, 0.8);
		color: azure;
		transition-property: background-color;
		transition-duration: .5s;
	}

	@font-face {
		font-family: 'BMHANNAAir';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}

	/*animation*/
	@import url('https://fonts.googleapis.com/css?family=Exo:400,700');

	*{
		margin: 0px;
		padding: 0px;
	}



	.context {
		width: 100%;
		position: absolute;
		top:50vh;

	}

	.context h1{
		text-align: center;
		color: #fff;
		font-size: 50px;
	}


	.area{
		background: #252b37;
		background: -webkit-linear-gradient(to left, #8f94fb, #4e54c8);
		width: 100%;
		height:100%;


	}


	@keyframes animate {

		0%{
			transform: translateY(0) rotate(0deg);
			opacity: 1;
			border-radius: 0;
		}

		100%{
			transform: translateY(-1000px) rotate(720deg);
			opacity: 0;
			border-radius: 50%;
		}

	}

	#calendar{
		width: 320px;
		margin-left: 56px;
		font-family: 'Lato', sans-serif;
	}
	#calendar_weekdays div{
		display:inline-block;
		vertical-align:top;
	}
	#calendar_content, #calendar_weekdays, #calendar_header{
		position: relative;
		width: 320px;
		overflow: hidden;
		float: left;
		z-index: 10;
	}
	#calendar_weekdays div, #calendar_content div{
		width:40px;
		height: 40px;
		overflow: hidden;
		text-align: center;
		color: #FFFFFF;
	}
	#calendar_content{
		-webkit-border-radius: 0px 0px 12px 12px;
		-moz-border-radius: 0px 0px 12px 12px;
		border-radius: 0px 0px 12px 12px;
	}
	#calendar_content div{
		float: left;
	}
	#calendar_content div:hover{
	}
	#calendar_content div.blank{
	}
	#calendar_header, #calendar_content div.today{
		zoom: 1;
		filter: alpha(opacity=70);
		opacity: 0.7;
	}
	#calendar_content div.today{
		color: #FFFFFF;
	}
	#calendar_header{
		width: 100%;
		height: 37px;
		text-align: center;
		padding: 18px 0;
		-webkit-border-radius: 12px 12px 0px 0px;
		-moz-border-radius: 12px 12px 0px 0px;
		border-radius: 12px 12px 0px 0px;
	}
	#calendar_header h1{
		font-size: 1.5em;
		color: #FFFFFF;
		float:left;
		width:70%;
	}
	i[class^=icon-chevron]{
		color: #FFFFFF;
		float: left;
		width:15%;
		border-radius: 50%;
	}

/*??????????????? ??????*/
	.bgBlur{
		background-color: #0005;
		background-blend-mode: darken;
	}

</style>

<body>
<div class="d-flex justify-content-between p-1" style="background-color: #0005;  background-blend-mode: darken;">
	<div class="ml-2">
	<c:if test="${'ADMIN' eq principal.user.USER_ROLE}">
		<a class="mr-3 ahover1" style="color: azure; font-size: 14px; position:relative; " href="/user/Admin">
			ADMIN
		</a>
	</c:if>

	<a class="mr-3 ahover1" style="color: azure; font-size: 14px; position:relative; " href="/">
		MAIN
	</a>

	</div>

	<div class="">

		<c:choose>
			<c:when test="${empty principal}">
				<a class="nava ahover1 mr-3" style="margin-right:31px!important; color: azure; font-size: 14px;" href="/auth/loginForm">?????????</a>
				<a class="nava ahover1 mr-3" style="color: azure; font-size: 14px;" href="/auth/joinForm">????????????</a>

			</c:when>
			<c:otherwise>
				<a class="nava ahover1 mr-3" style="color: azure; font-size: 14px;" href="/auth/joinForm">????????????</a>
				<a class="nava ahover1 mr-3" style="color: azure; font-size: 14px;" href="/logout">????????????</a>

				<button type="button" class="btn nava ahover1" style="color: azure; font-size: 14px;" data-toggle="modal" data-target="#exampleModal2" data-whatever="@mdo">????????????</button>
				<button type="button" class="btn nava ahover1" style="color: azure; font-size: 14px;" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">????????????</button>


				<div class="modal" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
					 aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content bg-dark">
							<div class="modal-header bg-dark">
								<h5 class="modal-title text-white" style="position:absolute; left:43%;" id="exampleModalLabel">Report</h5>

								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span class="text-white" aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body bg-white">
								<form action="" method="post">
									<div class="form-group">

										<label class="col-form-label">Title:</label>
										<i class='fas fa-mail-bulk' style="position:absolute; left:20px; top:-25px; color:#f74e3b;  font-size:36px"></i>
										<textarea class="form-control" rows="5" id="TITLE"></textarea>
									</div>
									<div class="form-group">
										<label for="message-text" class="col-form-label">Message:</label>
										<textarea class="form-control" rows="5" id="CONTENTS"></textarea>
									</div>
									<div class="form-group">
										<input type="hidden" class="form-control" value="1" id="HVAL">
									</div>
									<div class="form-group">
										<input type="hidden" class="form-control" value="1" id="TYPE">
									</div>
									<div class="form-group">
<%--										????????? ??????--%>
										<input type="hidden" class="form-control" value="${principal.user.username}" id="username" readonly/>
									</div>
								</form>
							</div>
							<div class="modal-footer bg-white">
								<button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
								<button id="btn-declaration" class="btn btn-outline-primary">Send message</button>
							</div>
						</div>
					</div>
				</div>


				<div class="modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
					 aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content bg-warning">
							<div class="modal-header  text-light" style="background-color: tomato">
								<h5 class="modal-title" style="position:absolute; left:43%;"  id="exampleModalLabel">Inquiry</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span class="text-white" aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body bg-white">
								<form action="" method="post">
									<div class="form-group">
										<i class='fas fa-location-arrow' style="position:absolute; left:20px; top:-20px; color:#222222;  font-size:36px"></i>
										<label class="col-form-label">Title:</label>
										<textarea class="form-control" rows="5" id="TITLE2"></textarea>
									</div>
									<div class="form-group">
										<label  class="col-form-label">Message:</label>
										<textarea class="form-control" rows="5" id="CONTENTS2"></textarea>
									</div>
									<div class="form-group">
										<input type="hidden" class="form-control" value="1" id="HVAL2">
									</div>
									<div class="form-group">
										<input type="hidden" class="form-control" value="2" id="TYPE2">
									</div>
									<div class="form-group">
										<input type="hidden" class="form-control" value="${principal.user.username}" id="username2" readonly/>
									</div>
								</form>
							</div>
							<div class="modal-footer bg-white">
								<button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
								<button id="btn-declaration2" type="btn-declaration" class="btn btn-outline-warning">Send message</button>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>


<div style="background-color: #0005; background-blend-mode: darken; height: 45px; color:azure;" class="p-2 d-flex justify-content-end">
	<svg style="margin-top: 3px;" xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-chat-right-dots-fill" viewBox="0 0 16 16">
		<path d="M16 2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h9.586a1 1 0 0 1 .707.293l2.853 2.853a.5.5 0 0 0 .854-.353V2zM5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
	</svg>
<c:choose>
	<c:when test="${empty principal}">
		&nbsp;&nbsp;???????????? ????????????
	</c:when>
	<c:otherwise>
	    &nbsp;&nbsp;???????????????<c:if test="${principal.user.USER_ROLE eq 'ADMIN'}">&nbsp;?????????&nbsp;</c:if> ${principal.user.username}???&nbsp;
	</c:otherwise>
</c:choose>
</div>

<div style="background-size: cover; background-repeat: no-repeat; background-position: center; background-image: url('https://images.wallpaperscraft.com/image/single/sand_traces_veins_177453_3000x4000.jpg');">

</div>

<nav style="top:-1px!important; width:100%; height:50px; background-color: #0005; background-blend-mode: darken; opacity: 1;" class="navbar navbar-expand-sm navbar-dark sticky-top">
	<ul class="navbar-nav">
		<c:choose>
			<c:when test="${empty principal}">
				<li class="nav-item"><a class="nava nav-link" href="/">????????????</a></li>
				<li class="nav-item"><a class="nava nav-link" href="/auth/loginForm">?????????</a></li>
				<li class="nav-item"><a class="nava nav-link" href="/auth/joinForm">????????????</a></li>

			</c:when>

			<c:otherwise>
				<li class="nav-item"><a class="nava nav-link ahover1"></a></li>
				<li class="nav-item"><a class="nava nav-link ahover1" href="/">??????</a></li>
				<li class="nav-item"><a class="nava nav-link active ahover1" href="/board/APIForm?style=2">API</a></li>
				<li class="nav-item"><a class="nava nav-link ahover1" href="/user/updateForm">????????????</a></li>
				<li class="nav-item"><a class="nava nav-link ahover1" href="/logout">????????????</a></li>
				<li class="nav-item"><a class="nava nav-link ahover1" href="/board">????????? ?????????</a></li>
				<li class="nav-item"><a class="nava nav-link ahover1" href="/board/Calendar">?????? ??????</a></li>
				<li class="nav-item"><a class="nava nav-link ahover1" href="/search/Naver">????????? ??????</a></li>
				<li class="nav-item dropdown">
					<a class="nava nav-link dropdown-toggle ahover1" data-toggle="dropdown" href="#">?????????</a>
					<div class="dropdown-menu">
						<a class="dropdown-item ahover1" href="/board/saveForm">?????????</a>
						<a class="dropdown-item ahover1" href="/board/RsaveForm">????????? ?????????</a>
						<c:if test="${pricipal.user.USER_ROLE eq 'ADMIN'}">
							<a style="color: blue; " class="dropdown-item linkc" href="/board/AsaveForm">?????? ?????????</a>
						</c:if>
					</div>
				</li>

			</c:otherwise>
		</c:choose>
	</ul>
</nav>


<div class="container-fluid bgBlur area d-flex justify-content-cetner" style="height: 200px;  background-size: cover; background-repeat: no-repeat; background-position: center; background-attachment:fixed; transition: all .1s ease 0s;">



	<section class="hero-section align-self-end" style="background-color: rgba(51,51,51,0); width: 1200px;">

		<%--		<div id="calendar">--%>
		<%--			<div id="calendar_header">--%>
		<%--				<i style="cursor: pointer;" class="icon-chevron-left">--%>
		<%--					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-arrow-left-square" viewBox="0 0 16 16">--%>
		<%--						<path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>--%>
		<%--					</svg>--%>
		<%--				</i>--%>

		<%--				<h1></h1>--%>
		<%--				<i style="cursor: pointer;" class="icon-chevron-right">--%>
		<%--					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-arrow-right-square" viewBox="0 0 16 16">--%>
		<%--						<path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm4.5 5.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>--%>
		<%--					</svg>--%>
		<%--				</i>--%>
		<%--			</div>--%>
		<%--			<div id="calendar_weekdays"></div>--%>
		<%--			<div id="calendar_content"></div>--%>
		<%--		</div>--%>

		<div class="container d-flex justify-content-center" style="">




			<%--??????????????? ??????????????? ?????????--%>
			<%--
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 322.74 78.25">
                        <defs>
                            <style>
                                .cls-1 {
                                    fill: none;
                                    stroke: none;
                                    stroke-miterlimit: 3;
                                    stroke-width: 34px;
                                }

                                .cls-2 {
                                    stroke: #f74e3b;
                                    animation: path var(--duration) ease forwards;
                                    animation-delay: var(--delay);
                                    stroke-width: 2.5px;
                                }

                                .cls-3 {
                                }
                                svg {
                                    fill: none;
                                    height: 100px;
                                    stroke-width: 53px;
                                }

                                path {
                                    stroke-dasharray: var(--length);
                                    stroke-dashoffset: var(--length);
                                }

                                .svg-bg > path {
                                    animation: path var(--duration) ease forwards;
                                    animation-delay: var(--delay);
                                }

                                .svg-main > path {
                                    stroke: #ffffff;
                                    animation: path var(--duration) ease-in forwards;
                                    animation-delay: var(--delay);
                                    stroke-width: 3px;
                                }

                                @keyframes path {
                                    100% { stroke-dashoffset: 0; }
                                }
                            </style>
                        </defs>
                            <text/>
                            <g class="svg-bg">
                                <path class="cls-2" d="M9.13,7.2c-.54,.32-7.65,4.75-7.02,12.29,.58,6.95,7.2,10.21,7.9,10.54,6.89,3.25,13.47-.69,14.49-1.32,1.43-.89,6.76-4.2,7.02-10.1,.26-5.67-4.37-9.38-5.27-10.1-4.51-3.62-11.55-4.66-17.12-1.32Z"/>
                                <path class="cls-2" d="M42.06,36.32c.2-10.24,.39-20.49,.59-30.73"/>
                                <path class="cls-2" d="M42.35,20.83c3.02,0,6.05-.01,9.07-.02"/>
                                <path class="cls-2" d="M25.08,36.32c1.17,4.98,2.34,9.95,3.51,14.93"/>
                                <path class="cls-2" d="M28.59,51.25c7.41-1.17,14.83-2.34,22.24-3.51"/>
                                <path class="cls-2" d="M66.93,8.22c1.07,7.12,2.15,14.24,3.22,21.37"/>
                                <path class="cls-2" d="M70.15,29.59c9.56-1.17,19.12-2.34,28.68-3.51"/>
                                <path class="cls-2" d="M88.88,9.1c6.34,.39,12.68,.78,19.02,1.17"/>
                                <path class="cls-2" d="M90.35,19.05l15.8,.59"/>
                                <path class="cls-2" d="M108.2,5.3c-.88,10.05-1.76,20.1-2.63,30.15"/>
                                <path class="cls-2" d="M105.57,35.44c1.53,.52,4.48,1.51,5.85,4.39,1.57,3.29-.03,6.72-.59,7.9-1.8,3.84-5.19,5.44-6.15,5.85-.97,.41-5.78,2.48-10.24-.29-.4-.25-4.32-2.78-4.68-7.61-.35-4.68,2.92-7.73,3.8-8.49,4.75-4.07,10.99-2.1,12-1.76Z"/>
                                <path class="cls-2" d="M141.86,7.05c2.34,2.63,4.68,5.27,7.02,7.9"/>
                                <path class="cls-2" d="M128.98,13.49c7.51,.29,15.02,.59,22.54,.88"/>
                                <path class="cls-2" d="M146.54,17.3c2.47,.22,5.49,.5,7.9,2.93,3.52,3.55,2.71,8.64,2.63,9.07-.82,4.65-4.53,7.05-5.85,7.9-.61,.39-8.3,5.19-14.63,.88-3.07-2.09-5.16-5.87-4.98-9.95,.22-4.73,3.4-7.6,4.1-8.2,3.82-3.27,8.46-2.85,10.83-2.63Z"/>
                                <path class="cls-2" d="M168.79,9.98c-.39,10.54-.78,21.07-1.17,31.61"/>
                                <path class="cls-2" d="M168.21,25.53c2.92,.09,5.85,.17,8.77,.26"/>
                                <path class="cls-2" d="M201.86,10.57l-9.66,28.98"/>
                                <path class="cls-2" d="M197.65,23.21c6.28,4.37,12.57,8.74,18.85,13.11"/>
                                <path class="cls-2" d="M215.62,23.15l14.05,.29"/>
                                <path class="cls-2" d="M229.37,10.27v31.61"/>
                                <path class="cls-2" d="M239.62,11.15c-.49,9.66-.98,19.32-1.46,28.98"/>
                                <path class="cls-2" d="M277.66,2.96c-1.04,.07-7.5,.54-11.12,6.15-2.49,3.86-3.06,9.26-.59,13.46,1.84,3.13,4.71,4.46,5.85,4.98,4.91,2.2,9.6,.8,12.29,0,3.15-.94,6.07-1.81,8.2-4.68,2.43-3.28,2.92-7.98,1.17-11.71-1.61-3.43-4.61-4.93-7.02-6.15-1.59-.8-4.67-2.34-8.78-2.05Z"/>
                                <path class="cls-2" d="M270.24,26.74c.04,5.14,.07,10.29,.11,15.43"/>
                                <path class="cls-2" d="M286.4,26.82c.21,4.73,.42,9.46,.63,14.18"/>
                                <path class="cls-2" d="M255.71,42.18c15.32-.39,30.63-.78,45.95-1.17"/>
                                <path class="cls-2" d="M318.64,45.4c-.9,.01-1.59,.75-1.57,1.57,.03,.78,.71,1.38,1.43,1.43,.91,.06,1.79-.77,1.68-1.68-.08-.69-.73-1.28-1.54-1.32Z"/>

                            </g>
                        <g class="svg-main" data-name="svg-bg">
                            <path class="cls-1" d="M9.13,7.2c-.54,.32-7.65,4.75-7.02,12.29,.58,6.95,7.2,10.21,7.9,10.54,6.89,3.25,13.47-.69,14.49-1.32,1.43-.89,6.76-4.2,7.02-10.1,.26-5.67-4.37-9.38-5.27-10.1-4.51-3.62-11.55-4.66-17.12-1.32Z"/>
                            <path class="cls-1" d="M42.06,36.32c.2-10.24,.39-20.49,.59-30.73"/>
                            <path class="cls-1" d="M42.35,20.83c3.02,0,6.05-.01,9.07-.02"/>
                            <path class="cls-1" d="M25.08,36.32c1.17,4.98,2.34,9.95,3.51,14.93"/>
                            <path class="cls-1" d="M28.59,51.25c7.41-1.17,14.83-2.34,22.24-3.51"/>
                            <path class="cls-1" d="M66.93,8.22c1.07,7.12,2.15,14.24,3.22,21.37"/>
                            <path class="cls-1" d="M70.15,29.59c9.56-1.17,19.12-2.34,28.68-3.51"/>
                            <path class="cls-1" d="M88.88,9.1c6.34,.39,12.68,.78,19.02,1.17"/>
                            <path class="cls-1" d="M90.35,19.05l15.8,.59"/>
                            <path class="cls-1" d="M108.2,5.3c-.88,10.05-1.76,20.1-2.63,30.15"/>
                            <path class="cls-1" d="M105.57,35.44c1.53,.52,4.48,1.51,5.85,4.39,1.57,3.29-.03,6.72-.59,7.9-1.8,3.84-5.19,5.44-6.15,5.85-.97,.41-5.78,2.48-10.24-.29-.4-.25-4.32-2.78-4.68-7.61-.35-4.68,2.92-7.73,3.8-8.49,4.75-4.07,10.99-2.1,12-1.76Z"/>
                            <path class="cls-1" d="M141.86,7.05c2.34,2.63,4.68,5.27,7.02,7.9"/>
                            <path class="cls-1" d="M128.98,13.49c7.51,.29,15.02,.59,22.54,.88"/>
                            <path class="cls-1" d="M146.54,17.3c2.47,.22,5.49,.5,7.9,2.93,3.52,3.55,2.71,8.64,2.63,9.07-.82,4.65-4.53,7.05-5.85,7.9-.61,.39-8.3,5.19-14.63,.88-3.07-2.09-5.16-5.87-4.98-9.95,.22-4.73,3.4-7.6,4.1-8.2,3.82-3.27,8.46-2.85,10.83-2.63Z"/>
                            <path class="cls-1" d="M168.79,9.98c-.39,10.54-.78,21.07-1.17,31.61"/>
                            <path class="cls-1" d="M168.21,25.53c2.92,.09,5.85,.17,8.77,.26"/>
                            <path class="cls-1" d="M201.86,10.57l-9.66,28.98"/>
                            <path class="cls-1" d="M197.65,23.21c6.28,4.37,12.57,8.74,18.85,13.11"/>
                            <path class="cls-1" d="M215.62,23.15l14.05,.29"/>
                            <path class="cls-1" d="M229.37,10.27v31.61"/>
                            <path class="cls-1" d="M239.62,11.15c-.49,9.66-.98,19.32-1.46,28.98"/>
                            <path class="cls-1" d="M277.66,2.96c-1.04,.07-7.5,.54-11.12,6.15-2.49,3.86-3.06,9.26-.59,13.46,1.84,3.13,4.71,4.46,5.85,4.98,4.91,2.2,9.6,.8,12.29,0,3.15-.94,6.07-1.81,8.2-4.68,2.43-3.28,2.92-7.98,1.17-11.71-1.61-3.43-4.61-4.93-7.02-6.15-1.59-.8-4.67-2.34-8.78-2.05Z"/>
                            <path class="cls-1" d="M270.24,26.74c.04,5.14,.07,10.29,.11,15.43"/>
                            <path class="cls-1" d="M286.4,26.82c.21,4.73,.42,9.46,.63,14.18"/>
                            <path class="cls-1" d="M255.71,42.18c15.32-.39,30.63-.78,45.95-1.17"/>
                            <path class="cls-1" d="M318.64,45.4c-.9,.01-1.59,.75-1.57,1.57,.03,.78,.71,1.38,1.43,1.43,.91,.06,1.79-.77,1.68-1.68-.08-.69-.73-1.28-1.54-1.32Z"/>
                        </g>
                    </svg>
            --%>



		</div>


		<div class="ml-5 card-grid mb-1" style="background-color: rgba(51,51,51,0)">
			<a class="card" href="/user/updateForm">
				<div class="card__background"></div>
				<div class="card__content">
					<p class="card__category ahover1">My Page</p>
					<h3 class="card__heading ahover1"><i class='fas fa-child' style='font-size:48px;'></i></h3>
				</div>
			</a>
			<a class="card" href="/board">
				<div class="card__background" ></div>
				<div class="card__content">
					<p class="card__category ahover1">Gallery</p>
					<h3 class="card__heading ahover1"><i class='fas fa-list' style='font-size:48px'></i></h3>
				</div>
			</a>
			<a class="card" href="/board/APIForm?style=2">
				<div class="card__background" ></div>
				<div class="card__content">
					<p class="card__category ahover1">Recipe</p>
					<h3 class="card__heading ahover1"><i class='fas fa-cocktail' style='font-size:48px'></i></h3>
				</div>
			</a>
			<a class="card" href="/user/updateForm">
				<div class="card__background" ></div>
				<div class="card__content">
					<p class="card__category ahover1">Profile</p>
					<h3 class="card__heading ahover1"><i class='far fa-address-card' style='font-size:48px;'></i></h3>
				</div>
			</a>
			<div>
	</section>
</div>



	</div>

</body>

<body onLoad="initClock()">
</body>


<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="/js/board2.js"></script>

</html>

