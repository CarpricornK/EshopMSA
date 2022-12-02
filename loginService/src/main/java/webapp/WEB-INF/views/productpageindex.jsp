<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="layout/Productheader.jsp"%>

<link rel="stylesheet" href="/css/lightbox.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=DM+Sans&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto+Mono&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Caladea&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.3/jquery.mobile-1.4.3.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular.min.js"></script>

<script>
	$(document).keydown(function(e){
		key = (e)?e.keyCode:event.keyCode;
		//alert(key);
		if(key == 116 || (event.ctrlKey && event.keyCode == 82)) {
			history.replaceState({}, null, location.pathname);
		}
	})
</script>



<!-- ------- 라이트 박스 css ------- -->
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#hovertext:hover {
	color: #5882FA;
	transition: 0.1s; /*서서히 나타내기*/
}

#hovertext {
	color: #e74c3c;
	transition: 0.1s; /*서서히 나타내기*/
}

/* 리모컨 ↓ */
#remote {
	position: sticky;
	top: 70px;
	left: 92%;
	transition: 0.5s; /*서서히 나타내기*/
	z-index: 2;
}

.slick-sample {
	width: 1400px;;
	height: 550px;
}

.slick-sample .slick-list {
	height: 100%;
}

.slick-sample1 {
	width: 1400px;;
	height: 550px;
}

.slick-sample1 .slick-list1 {
	height: 100%;
}

#hoverbox1:hover {
	background-color: rgb(255, 255, 255, 0.3);
	/*     border: 2.5px solid #FFFFFF; /*테두리 두께, 선스타일, 색상*/ */
	transition: 0.5s; /*서서히 나타내기*/
}

/* ===== 필터 박스 디자인 ===== */
.custom-review-badge {
	display: inline-block;
}

.custom-review-badge .star-ratings-css {
	unicode-bidi: bidi-override;
	color: #c5c5c5;
	font-size: 20px;
	height: 20px;
	width: 83px;
	margin: 0 auto;
	position: relative;
	padding: 0;
}

.custom-review-badge .star-ratings-css-top {
	color: red;
	padding: 0;
	position: absolute;
	z-index: 1;
	display: block;
	top: 0;
	left: 0;
	overflow: hidden;
}

.custom-review-badge .star-ratings-css-bottom {
	padding: 0;
	display: block;
	z-index: 0;
}

.custom-review-badge-1 {
	background: #ed556f;
	display: inline-block;
	padding: 2px 5px;
	color: white;
	border-radius: 2px;
	font-size: small;
}

.custom-review-badge-2 {
	background: #2B99F8;
	display: inline-block;
	padding: 2px 5px;
	color: white;
	border-radius: 2px;
	font-size: small;
}

.custom-review-badge-1 .review-star-symbol {
	vertical-align: middle;
}

.custom-review-badge-1 .review-label {
	vertical-align: middle;
}
/* =============== 별찍기 =============== */
.starpoint_wrap {
	display: inline-block;
}

.starpoint_box {
	position: relative;
	background: url(https://i.ibb.co/dPGRQzn/new-star.png) 0 0 no-repeat;
	font-size: 0;
}

.starpoint_box .starpoint_bg {
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	height: 18px;
	background: url(https://i.ibb.co/dPGRQzn/new-star.png) 0 -20px no-repeat;
	pointer-events: none;
}

.starpoint_box .label_star {
	display: inline-block;
	width: 10px;
	height: 16px;
	box-sizing: border-box;
}

.starpoint_box .star_radio {
	opacity: 0;
	width: 0;
	height: 0;
	position: absolute;
}

.starpoint_box .star_radio:nth-of-type(1):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(1):checked ~ .starpoint_bg {
	width: 10%;
}

.starpoint_box .star_radio:nth-of-type(2):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(2):checked ~ .starpoint_bg {
	width: 20%;
}

.starpoint_box .star_radio:nth-of-type(3):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(3):checked ~ .starpoint_bg {
	width: 30%;
}

.starpoint_box .star_radio:nth-of-type(4):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(4):checked ~ .starpoint_bg {
	width: 40%;
}

.starpoint_box .star_radio:nth-of-type(5):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(5):checked ~ .starpoint_bg {
	width: 50%;
}

.starpoint_box .star_radio:nth-of-type(6):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(6):checked ~ .starpoint_bg {
	width: 60%;
}

.starpoint_box .star_radio:nth-of-type(7):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(7):checked ~ .starpoint_bg {
	width: 70%;
}

.starpoint_box .star_radio:nth-of-type(8):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(8):checked ~ .starpoint_bg {
	width: 80%;
}

.starpoint_box .star_radio:nth-of-type(9):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(9):checked ~ .starpoint_bg {
	width: 90%;
}

.starpoint_box .star_radio:nth-of-type(10):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(10):checked ~ .starpoint_bg {
	width: 100%;
}

.blind {
	position: absolute;
	clip: rect(0, 0, 0, 0);
	margin: -1px;
	width: 1px;
	height: 1px;
	overflow: hidden;
}

/* =============== 별찍기 =============== */
#hoverme:hover {
	border: 1.9px solid #FB0000; /*테두리 두께, 선스타일, 색상*/
	border-color: #FA9C32 #FA9C32 #FA9C32;
	transition: 0.6s; /*서서히 나타내기*/
	border-radius: 3px;
}

#hoverme {
	border: 1.9px solid #FFFFFF; /*테두리 두께, 선스타일, 색상*/
}

.zoom1:hover {
	border: 1.9px solid #FB0000; /*테두리 두께, 선스타일, 색상*/
	border-color: #FA9C32 #FA9C32 #FA9C32;
	transition: 0.6s; /*서서히 나타내기*/
	border-radius: 3px;
}

/* ------SEARCH 버튼 옆에------- */
* {
	margin: 0;
	padding: 0;
	-webkit-transition: all .2s;
	-moz-transition: all .2s;
	-ms-transition: all .2s;
	-o-transition: all .2s;
	transition: all .2s;
}

#header-container {
	display: block;
}

select {
	margin: 0 auto;
	border: 1.5px solid #000000; /*테두리 두께, 선스타일, 색상*/
	border-color: #ffffff #ffffff #4A70ED;
	color: #535452;
	width: 150px;
	height: 27px;
	cursor: default;
}

select:hover {
	border-color: #ffffff #ffffff #DD304E;
	background-color: transparent;
	color: #F77C1E;
	padding: 0px 15px 0px 5px;
}

select option {
	background-color: white;
	color: gray;
	padding: 10px 15px;
	height: 20px;
	cursor: default;
}

select option:hover {
	padding-left: 25px;
	color: #EC6F66;
}

#searchbox:hover {
	box-shadow: 0px 0 3px 0 #ffffff;
	color: #F77C1E;
	padding: 2px 2px 2px 13px;
}

#searchbox {
	text-align: center;
	width: 250px; /*가로크기*/
	/*height: 50px; 세로크기*/
	background-color: #fafafa; /*배경색*/
	border: 1.5px solid #151823; /*테두리 두께, 선스타일, 색상*/
	/* border-color: #151823 #151823 blue; */
	box-shadow: 0px 0 3px 0 #151823;
	border-color: #151823 #151823 #151823;
	border-radius: 1px; /*테두리 둥글게*/
	outline: none; /*기본테두리안보이게*/
	padding: 3px 3px 2px 7px; /*안쪽여백*/
	box-sizing: border-box; /*테두리를 기준으로 박스크기 설정*/
	transition: .3s; /*서서히 나타내기*/
	color: #9D9C9A;
	cursor: default;
}

#searchbox::-webkit-input-placeholder {
	text-align: center;
}

#searchbox2::-webkit-input-placeholder {
	text-align: center;
}

/*포커스 되었을 때*/
#searchbox:focus {
	width: 300px;;
	border: 1.5px solid #4285f4;
	border-color: #151823 #151823 #ed8b4a;
	box-shadow: 0px 0 3px 0 #151823;
	background-color: #ffffff;
	color: #FFFFFF; /*글자색*/
}

#searchbox2 {
	text-align: center;
	width: 40px; /*가로크기*/
	/*height: 50px; 세로크기*/
	background-color: #fafafa; /*배경색*/
	border: 1.5px solid #151823; /*테두리 두께, 선스타일, 색상*/
	/* 	border-color: #151823 #151823 blue; */
	border-color: #151823 #151823 #151823;
	box-shadow: 0px 0 3px 0 #151823;
	border-radius: 1px; /*테두리 둥글게*/
	outline: none; /*기본테두리안보이게*/
	padding: 3px 3px 2px 7px; /*안쪽여백*/
	box-sizing: border-box; /*테두리를 기준으로 박스크기 설정*/
	transition: .3s; /*서서히 나타내기*/
	color: #9D9C9A;
	cursor: default;
}

/*포커스 되었을 때*/
#searchbox2:focus {
	width: 100px;;
	border: 1.5px solid #4285f4;
	border-color: #151823 #151823 #ed8b4a;
	box-shadow: 0px 0 3px 0 #151823;
	background-color: #ffffff;
	color: #FFFFFF; /*글자색*/
}

#searchbox2:hover {
	box-shadow: 0px 0 3px 0 #ffffff;
	color: #F77C1E;
	padding: 2px 2px 2px 13px;
}

/* ---==================---SEARCH 버튼 옆에------================- */

button, button::after {
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

button {
	width: 180px;
	height: 44px;
	background: none;
	border: 2px solid #1c3b58;
	border-radius: 5px;
	color: rgb(32, 32, 32, 0.7);
	display: block;
	font-size: 0.9em;
	font-weight: bold;
	padding: 0.5em 1em;
	position: relative;
	text-transform: uppercase;
	font-family: 'Nanum Gothic', sans-serif;
}

button::before, button::after {
	background: #1c3b58;
	border-radius: 5px;
	content: '';
	position: absolute;
	z-index: -1;
}

button:hover {
	color: #F2F2F2;
}

/* BUTTON 1 */
.btn-1::after {
	height: 0;
	left: 0;
	top: 0;
	width: 100%;
}

.btn-1:hover:after {
	height: 100%;
}

/* BUTTON 2 */
.btn-2::after {
	height: 100%;
	left: 0;
	top: 0;
	width: 0;
}

.btn-2:hover:after {
	width: 100%;
}

/* BUTTON 3 */
.btn-3::after {
	height: 0;
	left: 50%;
	top: 50%;
	width: 0;
}

.btn-3:hover:after {
	height: 100%;
	left: 0;
	top: 0;
	width: 100%;
	border-radius: 5px;
}

/* BUTTON 4 */
.btn-4::before {
	height: 100%;
	left: 0;
	top: 0;
	width: 100%;
}

.btn-4::after {
	background: #2ecc71;
	height: 100%;
	left: 0;
	top: 0;
	width: 100%;
}

.btn-4:hover:after {
	height: 0;
	left: 50%;
	top: 50%;
	width: 0;
}

/* BUTTON 5 */
.btn-5 {
	overflow: hidden;
}

.btn-5::after {
	/*background-color: #f00;*/
	height: 100%;
	left: -35%;
	top: 0;
	transform: skew(50deg);
	transition-duration: 0.6s;
	transform-origin: top left;
	width: 0;
}

.btn-5:hover:after {
	height: 100%;
	width: 135%;
}

/* ====================== 아코디언 ========================= */
.accordian {
	width: 100%;
	transition: all 0.2s cubic-bezier(0.25, 0.8, 0.25, 1);
	font-weight: 100;
	letter-spacing: 0.035em;
	margin: 0 auto;
}

.accordian ul>li {
	margin-bottom: 8px;
}

.accordian ul>li:first-child h3 {
	border-top: 1px solid rgba(0, 0, 0, 0.1);
}

.accordian h3 {
	cursor: pointer;
	background-color: none;
	padding: 1.2rem 1rem 1rem 1.2rem;
	margin: 0;
	border-bottom: 1px solid rgba(0, 0, 0, 0.07);
	display: block;
	font-weight: 100;
	letter-spacing: 0.035em;
	position: relative;
	font-size: 18px;
	transition: all 0.2s cubic-bezier(0.25, 0.8, 0.25, 1);
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.24);
	border-radius: 3px;
}

.accordian h3:hover, .accordian h3.closed {
	color: var(- -dark-gray);
	background-color: none;
}

.accordian h3:hover .arrow {
	border-top: 2px solid var(- -dark-gray);
	border-right: 2px solid var(- -dark-gray);
}

.accordian ul ul {
	display: none;
	height: 100%;
	margin-bottom: -7px;
}

.accordian ul ul li {
	background-color: none;
	padding: 1rem 1.8rem;
	color: var(- -dark-gray);
	box-shadow: none;
}

.accordian ul ul li p {
	opacity: 0;
	transition: all 0.5s;
	transform: translatey(-20px);
}

.accordian ul ul.open p {
	opacity: 1;
	transform: translatey(0px);
}

.accordian .arrow {
	display: inline-block;
	width: 8px;
	height: 8px;
	border-top: 2px solid var(- -light-gray);
	border-right: 2px solid var(- -light-gray);
	transform: rotate(135deg);
	transform-origin: center;
	float: right;
	margin-right: 8px;
	transition: transform 600ms cubic-bezier(0.175, 0.885, 0.32, 1);
}

.accordian .arrow.closed {
	margin-top: 4px;
	transform: rotate(-45deg);
	border-top: 2px solid var(- -dark-gray);
	border-right: 2px solid var(- -dark-gray);
}

.sidebarNav {
	max-width: 300px;
	border: 1px solid #9999993b;
}

.sidebarNav ul>li {
	margin: 0;
}

.sidebarNav ul ul li {
	padding: 0;
	background: none;
	border: 0;
}

.sidebarNav ul ul li a {
	color: var(- -darkgray);
	padding: 1rem 0 1rem 3em;
	display: block;
	text-decoration: none;
}

.sidebarNav ul ul li a:hover {
	text-decoration: underline;
}

.carousel-inner {
	width: 1450px;
}

.sliderboxa > img {
	height: 200px!important;
}

.carousel-item active{
	height: 400px!important;
}
.carousel-item{
	height: 400px!important;
}
.carousel-inner{
	width: 100%!important;
	min-width: 1400px!important;
	height: 400px!important;
	justify-content: center;
}

/*버튼 코드*/

/* CSS */
.button-39 {
	background-color: #FFFFFF;
	border: 1px solid rgb(209,213,219);
	border-radius: .5rem;
	box-sizing: border-box;
	color: #111827;
	font-family: "Inter var",ui-sans-serif,system-ui,-apple-system,system-ui,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
	font-size: .875rem;
	font-weight: 600;
	line-height: 1.25rem;
	padding: .75rem 1rem;
	text-align: center;
	text-decoration: none #D1D5DB solid;
	text-decoration-thickness: auto;
	box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
	cursor: pointer;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
}

.button-39:hover {
	background-color: rgb(249,250,251);
}

.button-39:focus {
	outline: 2px solid transparent;
	outline-offset: 2px;
}

.button-39:focus-visible {
	box-shadow: none;
}

/*무한 스크롤*/
@import url("https://fonts.googleapis.com/css?family=Bebas+Neue&display=swap");


/* Loader */
.loader {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background: rgba(255, 255, 255, 0.8);
}

.loader img {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

/* Image Container */
.image-container {
	margin: 10px 30%;
}

.image-container img {
	width: 100%;
	margin-top: 5px;
}

/* Media Query: Large Smartphone Vertical */
@media screen and (max-width: 600px) {
	h1 {
		font-size: 20px;
	}

	.image-container {
		margin: 10px;
	}
}
.searchboxa{
	border-bottom: 1px solid #cccccc;
	border-top: 1px solid #cccccc;
	border-left: 1px solid #cccccc;
	border-right: 1px solid #cccccc;
	border-radius: 5px;
	outline: 0;
}

</style>

<%@ include file="layout/util/loading.jsp"%>


		<div id="demo" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner" style="height: 400px;">
				<div class="carousel-item active " style="height: 400px;">
					<img class="img100" src="https://img-cf.kurly.com/banner/main/pc/img/db2126bd-f103-4a3a-a94d-0feb9705e7f1">
				</div>
				<div class="carousel-item">
					<img class="img100" src="https://img-cf.kurly.com/banner/main/pc/img/ab2389bf-5bef-4886-b1f8-8696ddd309b3">
				</div>
				<div class="carousel-item">
					<img class="img100" src="https://img-cf.kurly.com/banner/main/pc/img/0f4296ac-8cd5-4895-b390-a3f1c195003a">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next"> <span class="carousel-control-next-icon"></span>
			</a>
		</div>

<div class="container d-flex justify-content-around mt-5" style="width: 900px; margin-top: 100px">
	<a class="col" href="../productfavorite">
		<div class="mx-1 d-flex justify-content-center" style="width: 200px;">
			<img style="width: 70px; height: 70px" src="https://cdn-icons-png.flaticon.com/512/68/68921.png">
		</div>
		<h5 style="color:#EF8719;" class="text-center mt-1 ml-1">Cart</h5>
	</a>

	<a class="col" href="../board/ProductsaveForm">
		<div class="mx-1 d-flex justify-content-center" style="width: 200px;">
			<img style="width: 70px; height: 70px" src="https://cdn-icons-png.flaticon.com/512/195/195141.png">
		</div>
		<h5 style="color:#EF8719;" class="text-center mt-1 ml-1">Product registration</h5>
	</a>

	<a class="col" href="../productfavorite?type=3">
	<div class="mx-1 d-flex justify-content-center" style="width: 200px;">
		<img style="width: 70px; height: 70px" src="https://cdn-icons-png.flaticon.com/512/5530/5530145.png">
	</div>
		<h5 style="color:#EF8719;" class="text-center mt-1 ml-1">Management</h5>
	</a>


	<a href="/auth/user/updateForm">
		<div class="mx-1 d-flex justify-content-center" style="width: 200px;">
			<img style="width: 70px; height: 70px" src="https://cdn-icons-png.flaticon.com/512/4310/4310155.png">
		</div>
		<h5 style="color:#EF8719;" class="text-center mt-1 ml-1">Profile</h5>
	</a>
</div>

<div class="container d-flex justify-content-around mt-5" style="width: 900px">
	<a href="../productfavorite">

	</a>

	<a href="/board/ProductsaveForm">
	</a>

	<a href="/board/ProductsaveForm">
	</a>

	<a href="/auth/user/updateForm">
	</a>
</div>

<h5 class="d-flex justify-content-center">Product List</h5>

<div style="margin-top: -38px;" class="container d-flex justify-content-end mb-4">
	<form class="row" method="get" action="/">
		<input style="width: 300px; margin-right: -60px!important;" class="searchboxa" name="search">
		<button class="mr-3 mb-1" style="border: 1px solid rgba(0, 0, 0, 0); width: 80px; height: 30px; outline: 0!important; font-size: 12px!important;" type="submit">
			<img style="width: 20px; height: 20px" src="https://cdn-icons-png.flaticon.com/512/4475/4475396.png">
		</button>
	</form>
</div>


<%--무한스크롤할 상품--%>
<div id="divReloadLayer" class="d-flex justify-content-center">
	<div class="row container" style="">

		<c:forEach var="i" begin="0" end="${param.pageval+2}">

			<c:if test="${productboards.content[i].title ne null}">
			<div class="d-flex justify-content-center mb-2 mx-3">
				<div style="width: 330px; height: 400px; overflow: auto;" class="scroll type2 zoom1 m-1 mb-4">
					<div class="card-body">

						<div class="card-header d-flex justify-content-center">${productboards.content[i].title}</div>

						<h4 class="mt-2 card-title d-flex justify-content-center">
							<c:if test="${productboards.content[i].username==principal.user.username}">
								<a class="d-flex justify-content-center" style="color: #FE642E; font-size: 6px;">-내가쓴글-</a>
							</c:if>

							<c:if test="${productboards.content[i].username==principal.user.username && productboards.content[i].mcount==0}">
								&nbsp;
							</c:if>

							<c:if test="${productboards.content[i].mcount==0}">
								<a style="color: #3997F4; font-size: 6px;"> ※ 재고 없음 ※ </a>
							</c:if>
						</h4>

						<a href="/productboard/${productboards.content[i].id}?nickname=${principal.user.username}?roomname=${productboards.content[i].id}">
						<div class="btn mb-1 image-box scroll type2  d-flex justify-content-center">
								 	${productboards.content[i].img1}

						</div>
						</a>

						<div id="font1" class="pt-1 pb-1 d-flex justify-content-center" style="background-color: #E6E6E6;">${productboards.content[i].info}</div>
						<small>
							<div class="row mt-1 ml-2">
								<div class="mt-2">
									<a style="color: #FF0000; font-size: 21px;">-${productboards.content[i].discountpercentage}%</a>
								</div>
								<div class="col mt-1">
									<span style="color: #D8D8D8; font-size: 12px; text-decoration: line-through;">${productboards.content[i].price}원</span>
									<c:if test="${productboards.content[i].discountpercentage!=0}">
										<p style="font-size: 13px;">
											<fmt:formatNumber value="${productboards.content[i].price-(productboards.content[i].price/100*productboards.content[i].discountpercentage-(productboards.content[i].price/100*productboard.discountpercentage)%1)-productboard.fee}"
															  pattern="#,###" />
											원
										</p>
									</c:if>
									<c:if test="${productboards.content[i].discountpercentage==0}">
										<p>${productboards.content[i].price}￦</p>
									</c:if>
								</div>


								<div class="col">
									<!--  =============================== 별표시 =============================== -->
									<c:set var="totalstar1" value="0" />
									<c:set var="totalstar2" value="0" />
									<c:forEach var="star" items="${productboards.content[i].productreplys}" varStatus="status">
										<c:if test="${null ne star.starpoint1}">
											<c:set var="totalstar1" value="${totalstar1 + 1}" />
											<c:set var="totalstar2" value="${totalstar2 + star.starpoint1/2}" />
										</c:if>
									</c:forEach>

									<div class="custom-review-badge-2 d-flex justify-content-end mb-1">
										<span style="text-align: center; width: 100%; font-family: 'DM Sans', sans-serif;">Reviews:${totalstar1 }</span>
									</div>
									<div class="custom-review-badge-1 d-flex justify-content-end">
												<span style="text-align: center; width: 100%; margin-left: 15px;" class=review-label> <c:if test="${totalstar1 != 0}">
													<fmt:formatNumber value="${(totalstar2/totalstar1)}" pattern="0.00" />

												</c:if> <c:if test="${totalstar1 == 0}">
													0.00
												</c:if>
												</span> <span style="margin-right: 15px;" class=review-star-symbol>&#9733;</span>
									</div>

									<!--  =============================== 별표시 =============================== -->

								</div>
							</div>
						</small>

						<div class="container d-flex justify-content-center">
							<form action="" method="post" class="d-flex justify-content-center">
								<div class="form-group">
									<input style="width: 50px;" type="hidden" id="id" value="${productboards.content[i].id}" /> <input style="width: 50px;" type="hidden" class="form-control" value="${productboard.count+1}" id="count">
								</div>

							</form>


							<!-- HTML !-->
							<button onClick="location.href='/productboard/${productboards.content[i].id}?nickname=${principal.user.username}?roomname=${productboards.content[i].id}'"  class="button-39" role="button">상품 보기</button>
						</div>

					</div>
				</div>
			</div>
			</c:if>
		</c:forEach>
	</div>

</div>

	<div class="d-flex justify-content-center mb-5">
	<button style="font-weight: 600" class="btn btn-outline-dark" onclick="scrollEvent(${param.pageval+3}, '${param.search}')">ShowMore</button>
	</div>

</div>


<script>

	let value = window.scrollY+9999;


	console.log("scrollY", value);

	function scrollEvent(params ,search) {

		console.log("search:"+search);

		console.log("location.href start");

		location.href = "http://localhost:13000/?pageval="+params+"&search="+search;


		console.log("location.href end");

		console.log("scrollTo start");


		console.log("scrollTo end");
	}


	<c:if test="${param.pageval ne null}">

	$(document).ready( window.scrollTo({top:value, behavior:'auto'}) );

	</c:if>


</script>


<script>
//Favorite Button - Heart
$('.favme').click(function() {
	$(this).toggleClass('active');
});

/* when a user clicks, toggle the 'is-animating' class */
$(".favme").on('click touchstart', function(){
  $(this).toggleClass('is_animating');
});

/*when the animation is over, remove the class*/
$(".favme").on('animationend', function(){
  $(this).toggleClass('is_animating');
});
</script>

<script>
const favoriteButton = document.querySelector(".favorite-button");
favoriteButton.addEventListener("click", (event) => {
  const button = event.currentTarget;
  button.classList.toggle("is-favorite");
});

</script>



<!-- ============================= 아코디언 ============================= -->
<script>
$(function() { 
  $('.accordian li').on('click', function() {
    if ($(this).find('ul').hasClass('open')) {
      $('ul.open').slideToggle().removeClass('open');
      $('.accordian h3 span').removeClass('closed');
      $('.accordian h3').removeClass('closed');
    } else {
      $('ul.open').slideToggle().removeClass('open');
      $(this).find('ul').slideToggle().addClass('open');
      $('.accordian h3, .accordian h3 span').removeClass('closed');
      $(this).find('h3, h3 span').addClass('closed')
    }
  });
  // Active class starts one open
  $('.accordian li.active ul').slideDown().addClass('open');
});
</script>

<!-- 원본 -->
<script src="https://cdn.jsdelivr.net/gh/marshallku/infinite-scroll/dist/infiniteScroll.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/select.js"></script>
<script src="/js/board.js"></script>
<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
