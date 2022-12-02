<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%--isAuthenticated 안에 Userdetail가 있음 Principal DetialService 참고--%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<%--<!-- 표현식이 지정한 권한에 맞을 때만 출력 -->--%>
<%-->> 권한 체크 태그는 다음과 같습니다. *
로그인 되지 않았다면 참입니다.<
sec:authorize--%>
<%--access="isAnonymous()">
</sec:authorize>*
로그인 했다면 참입니다.
<sec:authorize--%>
<%--access="isAuthenticated()">
</sec:authorize>*
인자로 주어진 롤을 가지고 있다면 참입니다.<
sec:authorize--%>
<%--access="hasRole('ROLE_ADMIN')">
</sec:authorize>*
인자로 주어진 롤을 가지고 있지 않다면 참입니다.<
sec:authorize--%>
<%--access="!hasRole('ROLE_ADMIN')">
</sec:authorize>*
인자로 주어진 롤들중 하나라도 가지고 있다면 참입니다.
<sec:authorize--%>
<%--access="hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')">
</sec:authorize>--%>

<%--hasRole('role')	해당 권한이 있을 경우--%>
<%--hasAnyRole('role1,'role2')	포함된 권한 중 하나라도 있을 경우--%>
<%--isAuthenticated()	권한에 관계없이 로그인 인증을 받은 경우--%>
<%--isFullyAuthenticated()	권한에 관계없이 인증에 성공했고, 자동 로그인이 비활성인 경우--%>
<%--isAnonymous()	권한이 없는 익명의 사용자일 경우--%>
<%--isRememberMe()	자동 로그인을 사용하는 경우--%>
<%--permitAll	모든 경우 출력함--%>
<%--denyAll	모든 경우 출력하지 않음--%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Admin page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/0.6.5/tailwind.min.css'>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js'></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3/dist/chart.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">

<style>

	.jumbotron{
		background: url("https://picsum.photos/2400/?random") center no-repeat;
		background-color: #0005;
		background-blend-mode: darken;
	}

	.linkc {
		color: #FFFFFF!important;
		text-decoration: none;
		font-family: 'Montserrat', sans-serif;
		font-size: 18px;
	}
	.linkc:hover{
		color: #EF3B3A!important;
	}

	.linkc2 {
		color: #2c2d2a!important;
		text-decoration: none;
		font-family: 'Montserrat', sans-serif;
		font-size: 18px;
	}
	.linkc2:hover{
		color: #EF3B3A!important;
	}


	<%--	--%>
	/* CSS */
	.button-13 {
		background-color: #fff;
		border: 1px solid #d5d9d9;
		border-radius: 8px;
		box-shadow: rgba(213, 217, 217, .5) 0 2px 5px 0;
		box-sizing: border-box;
		color: #0f1111;
		cursor: pointer;
		display: inline-block;
		font-family: "Amazon Ember",sans-serif;
		font-size: 13px;
		line-height: 29px;
		padding: 0 10px 0 11px;
		position: relative;
		text-align: center;
		text-decoration: none;
		user-select: none;
		-webkit-user-select: none;
		touch-action: manipulation;
		vertical-align: middle;
		width: 170px;
	}
	.button-13:hover {
		background-color: olivedrab;
		color: white;
		transition-duration: .5s;
	}
	.button-13:focus {
		border-color: #008296;
		box-shadow: rgba(213, 217, 217, .5) 0 2px 5px 0;
		outline: 0;
	}
	label{
		font-size: 14px!important;
	}
	select {
		-webkit-appearance:none;
		-moz-appearance:none;
		-ms-appearance:none;
		appearance:none;
		outline:0;
		box-shadow:none;
		border:0!important;
		background: #ffffff;
		background-image: none;
		flex: 1;
		padding: 0 .5em;
		color:#2a2a2a;
		cursor:pointer;
		font-size: 1em;
		font-family: 'Open Sans', sans-serif;
	}
	select::-ms-expand {
		display: none;
	}
	.select {
		position: relative;
		display: flex;
		width: 20em;
		height: 3em;
		line-height: 3;
		background: #ffffff;
		overflow: hidden;
		border-radius: .25em;
	}
	.select::after {
		content: '\25BC';
		position: absolute;
		top: 0;
		right: 0;
		padding: 0 1em;
		background: #ffffff;
		cursor:pointer;
		pointer-events:none;
		transition:.25s all ease;
	}
	.select:hover::after {
		color: #23b499;
	}
	/*	input 디자인*/
	.wrap-vertical{
		width: 100%;
		height: 390px;
		padding: 20px;
		overflow: scroll;
		color: none;
		background: none;
		/* 가로 스크롤 */
		overflow: auto;
		white-space: nowrap;
	}
	.wrap-vertical::-webkit-scrollbar {
		width: 6px;
	}
	/* 스크롤바 막대 설정*/
	.wrap-vertical::-webkit-scrollbar-thumb {
		height: 4px;
		background-color: rgba(255, 141, 50, 1);
		border-radius: 10px;
	}
	/* 스크롤바 뒷 배경 설정*/
	.wrap-vertical::-webkit-scrollbar-track {
		background-color: rgba(33, 133, 133, 0.33);
	}
	.divTable{
		display: table;
		width: 100%;
	}
	.divTableRow {
		display: table-row;
	}
	.divTableHeading {
		background-color: #EEE;
		color: #363435;
		display: table-header-group;
	}
	.divTableCell, .divTableHead {
		background-color: #EEE;
		color: #363435;
		display: table-cell;
		padding: 3px 10px;
	}
	.divTableHeading {
		background-color: #EEE;
		color: #363435;
		display: table-header-group;
		font-weight: bold;
	}
	.divTableFoot {
		background-color: #EEE;
		color: #363435;
		display: table-footer-group;
		font-weight: bold;
	}
	.divTableBody {
		display: table-row-group;
	}
	input{
		background-color: white!important;
		color: #363435!important;
	}
	input::-webkit-input-placeholder {
		color: white!important;
	}
	input:-ms-input-placeholder {
		color: white!important;
	}
	.darkbox{
		background-color: #363435; color: #FFFFFF; border-radius: 5px;
	}
	.nav2{
		width:150px;
		background-color:none;
		margin-top:30px;
		padding-bottom: 100%;
		border-right: 1px solid #848484;
	}
	.box-title:hover{
		background-color:#EFECEC;
	}
	.box {
		padding-left:25px;
		padding-right:10px;
	}
	@font-face {
		font-family: 'BMJUA';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
	@font-face {
		font-family: 'SeoulNamsanM';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulNamsanM.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}

	.button {
		width: 240px;
		height: 125px;
		font-family: 'Roboto', sans-serif;
		font-size: 15px;
		text-transform: uppercase;
		letter-spacing: 2.5px;
		font-weight: 500;
		color: seashell;
		background-color: #777575;
		border: none;
		border-radius: 7px;
		box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		transition: all 0.3s ease 0s;
		cursor: pointer;
		outline: none;
	}

	.button:hover {
		background-color: #1a1a1a;
		box-shadow: 0px 15px 20px rgba(51, 51, 51, 0.4);
		color: #fff;
		transform: translateY(-7px);
	}
	.wrap {
		padding-bottom: 100px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
</style>
</head>
<%
	Calendar cal = Calendar.getInstance();
	String format = "dd";
	SimpleDateFormat sdf = new SimpleDateFormat(format);
	cal.add(cal.DATE, +1); //날짜를 하루 더한다.
	String date = sdf.format(cal.getTime());
	Calendar cal2 = Calendar.getInstance();
	cal2.set(Calendar.DAY_OF_MONTH, cal2.getActualMaximum(Calendar.DAY_OF_MONTH));
	SimpleDateFormat sdf2 = new SimpleDateFormat("dd");
	String datelast = sdf2.format(cal2.getTime());
%>
<c:set var="lasdate" value="<%=cal.getMaximum(Calendar.DAY_OF_MONTH)%>" />

<c:set var="today" value="<%=new java.util.Date()%>" />

<!-- 현재날짜 -->
<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm:ss" /></c:set>
<!-- 현재년도 -->
<c:set var="year"><fmt:formatDate value="${today}" pattern="yyyy" /></c:set>
<!-- 현재월 -->
<c:set var="month"><fmt:formatDate value="${today}" pattern="MM" /></c:set>

<c:set var="day"><fmt:formatDate value="${today}" pattern="dd" /></c:set>

<%--로딩추가--%>


<body>
<%@ include file="../layout/Productheader.jsp"%>

<br/>

<%@ include file="../layout/util/loading.jsp"%>
<div class="row">


	<div class="container col">


		<div class="d-flex justify-content-center">
			<div class="container mb-5" style="max-width:1140px; padding-left:0px; height: 300px;">
				<div class="border" style="width: 100%; height: 50px; font-size: 20px;">
					<p class="ml-3 d-flex align-items-center" style="height: 100%; font-family: BMJUA">프로필</p>
				</div>

				<div class="border d-flex align-items-center"
					 style="width: 100%; height: 250px; font-size: 20px; background-color: #EEE">
					<div class="ml-5 border d-flex justify-content-center align-items-center"
						 style="width: 150px; height: 150px; background-color:salmon; border-radius: 100px;">
						<i class='fas fa-user-alt' style='font-size:60px; color: white'></i>
					</div>

					<div class="col ml-4">
						<p> ${principal.user.username} </p>
						<p> ${principal.user.USER_EMAIL} </p>
					</div>
				</div>

			</div>
		</div>




		<div class="d-flex justify-content-center">
			<div class="container mb-5" style="max-width:1140px; padding-left:0px; height: 300px;">
				<div class="border" style="width: 100%; height: 50px; font-size: 20px;">
					<p class="ml-3 d-flex align-items-center" style="height: 100%; font-family: BMJUA;">나의 정보</p>
				</div>

				<div class="border d-flex align-items-center justify-content-center"
					 style="width: 100%; height: 250px; font-size: 20px; background-color: white">


					<div class="col" style="width: 100%">
						<div class="d-flex align-items-center row px-2 mx-2 mb-2"
							 style="font-family: SeoulNamsanM; border-radius: 7px; width: 97%; height: 50px; background-color: #EEE; font-size:14px;">
							<div class="ml-2" style="width:20%">이메일</div>
							<div class="" style="width:70%;">
								${principal.user.USER_EMAIL}
							</div>
						</div>

						<div class="d-flex align-items-center row px-2 mx-2 mb-2"
							 style="font-family: SeoulNamsanM; border-radius: 7px; width: 97%; height: 50px; background-color: #EEE; font-size:14px;">
							<div class="ml-2" style="width:20%">권한</div>
							<div class="" style="width:70%;">
								${principal.user.USER_ROLE}
							</div>
						</div>

						<div class="d-flex align-items-center row px-2 mx-2 mb-2"
							 style="font-family: SeoulNamsanM; border-radius: 7px; width: 97%; height: 50px; background-color: #EEE; font-size:14px;">
							<div class="ml-2" style="width:20%">생성일자</div>
							<div class="" style="width:70%;">
								${principal.user.USER_CDATE}
							</div>
						</div>

						<div class="d-flex align-items-center row px-2 mx-2 mb-2"
							 style="font-family: SeoulNamsanM; border-radius: 7px; width: 97%; height: 50px; background-color: #EEE; font-size:14px;">
							<div class="ml-2" style="width:20%">이메일 인증</div>
							<div class="" style="width:70%;">
								<c:if test="${principal.user.USER_CHECK eq 'Y' || princiapl.user.USER_OAUTH ne null}">
									이메일 인증이 되었습니다
								</c:if>
								<c:if test="${principal.user.USER_CHECK eq 'N'}">
									이메일 인증을 해주세요
								</c:if>
							</div>
						</div>
					</div>

				</div>



			</div>
		</div>



		<div class="d-flex justify-content-center">
			<div class="container row d-flex justify-content-between mb-5" style="max-width:1140px; padding-left:0px; height: 400px;">

				<div class="border mb-5 mr-5" style="width:500px; height: 400px;">
					<div class="border" style="width: 100%; height: 50px; font-size: 20px;">
						<p class="ml-3 d-flex align-items-center" style="height: 100%; font-family: BMJUA">연동 정보</p>
					</div>

					<div class="border d-flex align-items-center justify-content-center"
						 style="width: 100%; height: 350px; font-size: 20px; background-color: #EEE">

						<c:if test="${principal.user.USER_OAUTH eq 'google'}">
							<img src="https://i.ibb.co/RSx0mvL/google-icon-146169.png" width="170" height="170">
						</c:if>
						<c:if test="${principal.user.USER_OAUTH eq 'kakao'}">
							<img src="https://i.ibb.co/xXT37gz/talk-icon-icons-com-53596.png" width="170" height="170">
						</c:if>
						<c:if test="${principal.user.USER_OAUTH eq 'naver'}">
							<img src="https://i.ibb.co/HFWSKsz/naver-icon-icons-com-59879.png" width="170" height="170">
						</c:if>
						<c:if test="${principal.user.USER_OAUTH eq null}">
							<div class="col">
								<div class="d-flex align-items-center justify-content-center"
									 style="width: 100%; height: 250px; font-size: 20px;">
									<div class="border d-flex justify-content-center align-items-center"
										 style="width: 150px; height: 150px; background-color:salmon; border-radius: 100px;">
										<i class='fas fa-user-alt' style='font-size:60px; color: white'></i>
									</div>
								</div>

								<p class="d-flex align-items-center justify-content-center" style="margin-top: -40px; margin-bottom: 20px;">일반 사용자 입니다</p>
							</div>

						</c:if>

					</div>
				</div>


				<div class="border mb-5" style="width:500px; height: 400px;">
					<div class="border" style="width: 100%; height: 50px; font-size: 20px;">
						<p class="ml-3 d-flex align-items-center" style="height: 100%; font-family: BMJUA">회원 탈퇴</p>
					</div>

					<div class="border d-flex align-items-center"
						 style="width: 100%; height: 350px; font-size: 20px; background-color: #EEE">


						<div class="container p-5" style="width: 100%">

							<form>

								<c:if test="${param.ROLE eq principal.user.USER_ROLE}">
									<div class="form-group">
										<label for="id">ID</label>
										<input class="form-control" type="text" id="id" value="${principal.user.id}"/>
									</div>
									<div class="form-group">
										<label for="username">Username</label>
										<input type="text" value="${principal.user.username}" class="form-control"
											   placeholder="Enter Username" id="username">
									</div>
								</c:if>
								<c:if test="${param.ROLE ne principal.user.USER_ROLE}">
									<input type="hidden" id="id" value="${principal.user.id}"/>
									<div class="form-group">
										<label for="username">Username</label>
										<input type="text" value="${principal.user.username}" class="form-control"
											   placeholder="Enter Username" id="username" readonly>
									</div>
								</c:if>


								<c:if test="${empty principal.user.USER_OAUTH}">
									<div class="form-group">
										<label for="password">Password</label>
										<input type="password" class="form-control" placeholder="Enter password" id="password">
									</div>
								</c:if>

								<c:if test="${principal.user.USER_OAUTH ne null && principal.user.USER_ROLE eq ADMIN}">
									<div class="form-group">
										<label for="password">Password</label>
										<input type="password" class="form-control" placeholder="Enter password" id="password">
									</div>
								</c:if>

							</form>

							<p style="font-size: 16px">이곳은 회원 정보를 수정하는곳 입니다.</p>
							<div class="d-flex justify-content-around">
								<div class="mb-4">
									<button id="btn-update" class="mr-4 button-13">회원수정완료</button>
									<button type="button" class="button-13" data-toggle="modal"
											data-target="#myModal">
										회원 탈퇴
									</button>
								</div>
							</div>
						</div>


					</div>
				</div>


			</div>
		</div>












		<div class="d-flex justify-content-center">
			<div class="container mb-5" style="max-width:1140px; padding-left:0px; height: 130px;">
				<div class="border" style="width: 100%; height: 50px; font-size: 20px;">
					<p class="ml-3 d-flex align-items-center" style="height: 100%; font-family: BMJUA">메일전송</p>
				</div>

				<div class="border d-flex align-items-center"
					 style="width: 100%; height: 80px; font-size: 20px; background-color: #EEE">
					<div class="container mt-3">
						<form>
							<input type="hidden" id="id1" value="${principal.user.id}"/>

							<input type="hidden" value="${principal.user.username}" class="form-control" placeholder="Enter Username"
								   id="username1" readonly>

							<input type="hidden" value="${principal.user.USER_PASSWORD}" class="form-control" placeholder=""
								   id="passwordhash1" readonly>

							<input type="hidden" value="${principal.user.USER_OAUTH}" class="form-control" placeholder=""
								   id="USER_OAUTH1" readonly>

							<div class="form-group p-5 d-flex justify-content-between"
								 style="border-radius: 5px;">
								<input style="width: 80%" type="email" value="${principal.user.USER_EMAIL}" class="form-control"
									   placeholder="Enter email" id="email1" readonly>
								<button id="btn-Mail" class="button-13">인증메일전송</button>
							</div>

						</form>
					</div>
				</div>

			</div>
		</div>

		<div class="container wrap d-flex justify-content-around mt-5">
			<button style="height: 250px;" type="button" class="button" onClick="location.href='/user/Favorite'">
				<h4>즐겨찾기 목록</h4> <br/>
				<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-box2-heart-fill" viewBox="0 0 16 16">
					<path d="M3.75 0a1 1 0 0 0-.8.4L.1 4.2a.5.5 0 0 0-.1.3V15a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1V4.5a.5.5 0 0 0-.1-.3L13.05.4a1 1 0 0 0-.8-.4h-8.5ZM8.5 4h6l.5.667V5H1v-.333L1.5 4h6V1h1v3ZM8 7.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
				</svg>
			</button>

			<div style="padding: 60px;"></div>

			<button style="height: 250px;" type="button" class="button" onClick="location.href='/user/Favorite2'">
				<h4>내 글</h4> <br/>
				<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-collection-fill" viewBox="0 0 16 16">
					<path d="M0 13a1.5 1.5 0 0 0 1.5 1.5h13A1.5 1.5 0 0 0 16 13V6a1.5 1.5 0 0 0-1.5-1.5h-13A1.5 1.5 0 0 0 0 6v7zM2 3a.5.5 0 0 0 .5.5h11a.5.5 0 0 0 0-1h-11A.5.5 0 0 0 2 3zm2-2a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 0-1h-7A.5.5 0 0 0 4 1z"/>
				</svg>

			</button>

			<div style="padding: 60px;"></div>

			<form method="get" action="/user/updateForm">
				<button class="mr-1 button" id="remoteb"
						style="border: none; height: 250px; color: black;" name="ROLE"
						type="submit" value="ADMIN">
					<svg xmlns="http://www.w3.org/2000/svg" width="44" height="44" fill="currentColor"
						 class="bi bi-tools" viewBox="0 0 16 16" style="color: white">
						<path d="M1 0 0 1l2.2 3.081a1 1 0 0 0 .815.419h.07a1 1 0 0 1 .708.293l2.675 2.675-2.617 2.654A3.003 3.003 0 0 0 0 13a3 3 0 1 0 5.878-.851l2.654-2.617.968.968-.305.914a1 1 0 0 0 .242 1.023l3.27 3.27a.997.997 0 0 0 1.414 0l1.586-1.586a.997.997 0 0 0 0-1.414l-3.27-3.27a1 1 0 0 0-1.023-.242L10.5 9.5l-.96-.96 2.68-2.643A3.005 3.005 0 0 0 16 3c0-.269-.035-.53-.102-.777l-2.14 2.141L12 4l-.364-1.757L13.777.102a3 3 0 0 0-3.675 3.68L7.462 6.46 4.793 3.793a1 1 0 0 1-.293-.707v-.071a1 1 0 0 0-.419-.814L1 0Zm9.646 10.646a.5.5 0 0 1 .708 0l2.914 2.915a.5.5 0 0 1-.707.707l-2.915-2.914a.5.5 0 0 1 0-.708ZM3 11l.471.242.529.026.287.445.445.287.026.529L5 13l-.242.471-.026.529-.445.287-.287.445-.529.026L3 15l-.471-.242L2 14.732l-.287-.445L1.268 14l-.026-.529L1 13l.242-.471.026-.529.445-.287.287-.445.529-.026L3 11Z"/>
					</svg>
				</button>
				<c:if test="${param.page ne null}">
					<input style="width: 50px;" type="hidden" name="page" value="${param.page}"/>
				</c:if>
				<c:if test="${param.board ne null}">
					<input style="width: 50px;" type="hidden" name="board" value="${param.board}"/>
				</c:if>
				<c:if test="${param.style ne null}">
					<input style="width: 50px;" type="hidden" name="style" value="${param.style}"/>
				</c:if>
			</form>


		</div>

		<c:if test="${param.ROLE eq principal.user.USER_ROLE && principal.user.USER_ROLE eq 'ADMIN'}">
			<div class="d-flex justify-content-center">
				<div class="container mb-5" style="max-width:1140px; padding-left:0px; height: 300px;">
					<div class="border" style="width: 100%; height: 50px; font-size: 20px;">
						<p class="ml-3 d-flex align-items-center" style="height: 100%; font-family: BMJUA">회원목록</p>
					</div>

					<div class="border d-flex align-items-center"
						 style="width: 100%; height: 250px; font-size: 20px; background-color: #EEE">

						<div class="container p-5 wrap-vertical"
							 style="border-radius: 5px; max-width: 1110px; height: 250px;">

							<br/>

							<div class="divTable">
								<div class="divTableHeading">
									<div class="divTableRow">
										<div class="divTableHead">ID</div>
										<div class="divTableHead">Username</div>
											<%--				<div class="divTableHead">Password</div>--%>
										<div class="divTableHead">ROLE</div>
										<div class="divTableHead">Email</div>
										<div class="divTableHead">CHECK?</div>
										<div class="divTableHead">Link</div>
									</div>
								</div>
								<c:forEach var="User" items="${Users}">
									<div class="divTableBody">
										<div class="divTableRow">
											<div class="divTableCell">${User.id}</div>
											<div class="divTableCell">${User.username}</div>
												<%--				<div class="divTableCell"><c:if test="${'cos1234' eq User.USER_PASSWORD2}">연동 로그인</c:if><c:if test="${'cos1234' ne User.USER_PASSWORD2}">${User.USER_PASSWORD2}</c:if></div>--%>
											<div class="divTableCell">${User.USER_ROLE}</div>
											<div class="divTableCell">${User.USER_EMAIL}</div>
											<div class="divTableCell">${User.USER_CHECK}</div>
											<div class="divTableCell">${User.USER_OAUTH}</div>
										</div>
									</div>
								</c:forEach>
							</div>


						</div>

					</div>

				</div>
			</div>
		</c:if>













<%--		<div class="container p-5 wrap-vertical"--%>
<%--			 style="border-radius: 5px; background-color: #363435; max-width: 1300px; height: 600px;">--%>
<%--			<a style="color: white">- 식단짜기 -</a>--%>
<%--			<br/>--%>

<%--			<div class="divTable">--%>
<%--				<div class="divTableHeading">--%>
<%--					<div class="divTableRow">--%>
<%--						<div class="divTableHead">Date</div>--%>
<%--						<div class="divTableHead text-center">아침</div>--%>
<%--						&lt;%&ndash;				<div class="divTableHead">Password</div>&ndash;%&gt;--%>
<%--						<div class="divTableHead text-center">점심</div>--%>
<%--						<div class="divTableHead text-center">저녁</div>--%>
<%--						<div class="divTableHead">영양성분</div>--%>
<%--						<div class="divTableHead text-center">Delete</div>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--				<c:set var="sysDate"><%= datelast %></c:set>--%>


<%--				&lt;%&ndash;			<!-- 데이터 뿌릴때 -->&ndash;%&gt;--%>
<%--				&lt;%&ndash;			<c:out value="${date}" />&ndash;%&gt;--%>
<%--				&lt;%&ndash;			<c:out value="${year}" />&ndash;%&gt;--%>
<%--				&lt;%&ndash;			<c:out value="${month}" />&ndash;%&gt;--%>



<%--				<c:forEach var="i" begin="1" end="${sysDate}">--%>
<%--					<c:if test="${i < 10}">--%>
<%--						<div class="divTableBody">--%>
<%--							<div class="divTableRow">--%>
<%--								<div class="divTableCell">${year+='-'+=month+='-'+='0'+=i}</div>--%>

<%--								<div class="divTableCell text-center">--%>
<%--									<c:forEach var="z" begin="1" end="30">--%>
<%--										<c:if test="${fn:contains(MpList[z].planTYPE, 'breakfast') && MpList[z].planDate eq year+='-'+=month+='-'+='0'+=i}">--%>
<%--											${MpList[z].planTITLE}&nbsp;&nbsp;--%>
<%--										</c:if>--%>
<%--									</c:forEach>--%>
<%--								</div>--%>
<%--									&lt;%&ndash;				<div class="divTableCell"><c:if test="${'cos1234' eq User.USER_PASSWORD2}">연동 로그인</c:if><c:if test="${'cos1234' ne User.USER_PASSWORD2}">${User.USER_PASSWORD2}</c:if></div>&ndash;%&gt;--%>
<%--								<div class="divTableCell text-center">--%>
<%--									<c:forEach var="l" begin="1" end="30">--%>
<%--										<c:if test="${fn:contains(MpList[l].planTYPE, 'lunch') && MpList[l].planDate eq year+='-'+=month+='-'+='0'+=i}">--%>
<%--											${MpList[l].planTITLE}&nbsp;&nbsp;--%>
<%--										</c:if>--%>
<%--									</c:forEach>--%>
<%--								</div>--%>

<%--								<div class="divTableCell text-center">--%>
<%--									<c:forEach var="d" begin="1" end="30">--%>
<%--										<c:if test="${fn:contains(MpList[d].planTYPE, 'dinner') && MpList[d].planDate eq year+='-'+=month+='-'+='0'+=i}">--%>
<%--											${MpList[d].planTITLE}&nbsp;&nbsp;--%>
<%--										</c:if>--%>
<%--									</c:forEach>--%>
<%--								</div>--%>

<%--								<div class="divTableCell">--%>
<%--									<c:set var="planCarb" value="0" />--%>
<%--									<c:set var="planKcal" value="0" />--%>
<%--									<c:set var="planNa" value="0" />--%>
<%--									<c:set var="planPro" value="0" />--%>
<%--									<c:forEach var="k" begin="1" end="30">--%>

<%--										<c:if test="${MpList[k].planDate eq year+='-'+=month+='-'+='0'+=i}">--%>
<%--											<c:set var="planCarb" value="${planCarb + MpList[k].planCarb}" />--%>
<%--											<c:set var="planKcal" value="${planKcal + MpList[k].planKcal}" />--%>
<%--											<c:set var="planNa" value="${planNa + MpList[k].planNa}" />--%>
<%--											<c:set var="planPro" value="${planPro + MpList[k].planPro}" />--%>

<%--										</c:if>--%>

<%--									</c:forEach>--%>

<%--									<c:if test="${planCarb != 0 && planKcal != 0 && planNa != 0 && planPro != 0}">--%>
<%--										Carb - <fmt:formatNumber value="${planCarb}" pattern=".00"/>&nbsp;--%>
<%--										Kcal - <fmt:formatNumber value="${planKcal}" pattern=".00"/>&nbsp;--%>
<%--										Na - <fmt:formatNumber value="${planNa}" pattern=".00"/>&nbsp;--%>
<%--										Pro - <fmt:formatNumber value="${planPro}" pattern=".00"/>&nbsp;--%>
<%--									</c:if>--%>
<%--								</div>--%>

<%--								<div class="divTableCell d-flex justify-content-center">--%>

<%--									<button onClick="index2.MDelete('${year}', '${month}', '0${i}')">--%>
<%--										<i class="material-icons no-underline text-grey-darker hover:text-red-dark">delete_forever</i>--%>
<%--									</button>--%>

<%--								</div>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--					</c:if>--%>

<%--					<c:if test="${i >= 10}">--%>
<%--						<div class="divTableBody">--%>
<%--							<div class="divTableRow">--%>
<%--								<div class="divTableCell">${year+='-'+=month+='-'+=i}</div>--%>

<%--								<div class="divTableCell text-center">--%>
<%--									<c:forEach var="z" begin="1" end="30">--%>
<%--										<c:if test="${fn:contains(MpList[z].planTYPE, 'breakfast') && MpList[z].planDate eq year+='-'+=month+='-'+=i}">--%>
<%--											${MpList[z].planTITLE}&nbsp;&nbsp;--%>
<%--										</c:if>--%>
<%--									</c:forEach>--%>
<%--								</div>--%>
<%--									&lt;%&ndash;				<div class="divTableCell"><c:if test="${'cos1234' eq User.USER_PASSWORD2}">연동 로그인</c:if><c:if test="${'cos1234' ne User.USER_PASSWORD2}">${User.USER_PASSWORD2}</c:if></div>&ndash;%&gt;--%>
<%--								<div class="divTableCell text-center">--%>
<%--									<c:forEach var="l" begin="1" end="30">--%>
<%--										<c:if test="${fn:contains(MpList[l].planTYPE, 'lunch') && MpList[l].planDate eq year+='-'+=month+='-'+=i}">--%>
<%--											${MpList[l].planTITLE}&nbsp;&nbsp;--%>
<%--										</c:if>--%>
<%--									</c:forEach>--%>
<%--								</div>--%>

<%--								<div class="divTableCell text-center">--%>
<%--									<c:forEach var="d" begin="1" end="30">--%>
<%--										<c:if test="${fn:contains(MpList[d].planTYPE, 'dinner') && MpList[d].planDate eq year+='-'+=month+='-'+=i}">--%>
<%--											${MpList[d].planTITLE}&nbsp;&nbsp;--%>
<%--										</c:if>--%>
<%--									</c:forEach>--%>
<%--								</div>--%>

<%--								<div class="divTableCell">--%>
<%--									<c:set var="planCarb" value="0" />--%>
<%--									<c:set var="planKcal" value="0" />--%>
<%--									<c:set var="planNa" value="0" />--%>
<%--									<c:set var="planPro" value="0" />--%>
<%--									<c:forEach var="k" begin="1" end="30">--%>

<%--										<c:if test="${MpList[k].planDate eq year+='-'+=month+='-'+=i}">--%>
<%--											<c:set var="planCarb" value="${planCarb + MpList[k].planCarb}" />--%>
<%--											<c:set var="planKcal" value="${planKcal + MpList[k].planKcal}" />--%>
<%--											<c:set var="planNa" value="${planNa + MpList[k].planNa}" />--%>
<%--											<c:set var="planPro" value="${planPro + MpList[k].planPro}" />--%>

<%--										</c:if>--%>

<%--									</c:forEach>--%>

<%--									<c:if test="${planCarb != 0 && planKcal != 0 && planNa != 0 && planPro != 0}">--%>
<%--										Carb - <fmt:formatNumber value="${planCarb}" pattern=".00"/>&nbsp;--%>
<%--										Kcal - <fmt:formatNumber value="${planKcal}" pattern=".00"/>&nbsp;--%>
<%--										Na - <fmt:formatNumber value="${planNa}" pattern=".00"/>&nbsp;--%>
<%--										Pro - <fmt:formatNumber value="${planPro}" pattern=".00"/>&nbsp;--%>
<%--									</c:if>--%>
<%--								</div>--%>

<%--								<div class="divTableCell d-flex justify-content-center">--%>


<%--									<button onClick="index2.MDelete('${year}', '${month}', '${i}')">--%>
<%--										<i class="material-icons no-underline text-grey-darker hover:text-red-dark">delete_forever</i>--%>
<%--									</button>--%>

<%--								</div>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--					</c:if>--%>
<%--				</c:forEach>--%>
<%--			</div>--%>

<%--		</div>--%>



	</div>
</div>















<!-- 회원탈퇴 모델창 -->
<div class="modal fade" id="myModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h1 class="modal-title">회원탈퇴</h1>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>

			<form>
				<!-- Modal body -->
				<div class="modal-body form-group">
					<h5 style="color:#f74e3b">※ 한번 회원 탈퇴를 진행하면 복구할 수 없습니다</h5>
					<p style="color:#f74e3b">※ 메일 인증이 되어있지 않으면 회원 탈퇴를 진행할 수 없습니다</p>
					<c:if test="${'ADMIN' eq principal.user.USER_ROLE && null ne param.ROLE}">
						<div class="row d-flex justify-content-center mb-2">
							<span class="mt-1">대상ID입력:&nbsp;&nbsp;</span>
							<input style="width:70% !important;" class="form-control" placeholder="삭제할 대상의 id"
								   type="text" id="userid" value="">
						</div>
					</c:if>
					<c:if test="${null eq param.ROLE}">
						<input style="width:70% !important;" type="hidden" class="form-control" id="userid"
							   value="${principal.user.id}">
					</c:if>

					<div class="row d-flex justify-content-center mb-3">
						<span class="mt-1">유저이름입력&nbsp;&nbsp;:&nbsp;&nbsp;</span>
						<c:if test="${'ADMIN' ne principal.user.USER_ROLE}">
							<input style="width:70% !important;" type="text" value="${principal.user.username}"
								   class="form-control" id="username2" readonly>
						</c:if>
						<c:if test="${'ADMIN' eq principal.user.USER_ROLE}">
							<input style="width:70% !important;" type="text" class="form-control" id="username2">
						</c:if>
					</div>


<%--					<div class="row d-flex justify-content-center mb-2">--%>
<%--						<span class="mt-1">password&nbsp;&nbsp;:&nbsp;&nbsp;</span>--%>
<%--						<input style="width:34% !important;" type="password" class="form-control mr-2" id="password2">--%>
<%--						<input style="width:34% !important;" type="password" class="form-control" id="repassword2">--%>
<%--					</div>--%>

					<div class="custom-control custom-switch ml-3">
						<input type="checkbox" name="switch1" class="custom-control-input" id="switch1" value="1">
						<label class="custom-control-label" for="switch1">회원 탈퇴를 신청하면 바로 로그아웃 됩니다.</label>
					</div>

					<div class="custom-control custom-switch ml-3">
						<input type="checkbox" name="switch2" class="custom-control-input" id="switch2" value="1">
						<label class="custom-control-label" for="switch2">탈퇴 후에는 작성된 글 삭제가 되지 않습니다.</label>
					</div>
				</div>
				<c:if test="${'ADMIN' ne principal.user.USER_ROLE}">
<%--					<input style="width:70% !important;" type="hidden" class="form-control" id="ckpassword2"--%>
<%--						   value="${principal.user.USER_PASSWORD2}">--%>
				</c:if>
				<input type="hidden" id="check" value="${principal.user.USER_CHECK}">


			</form>
			<c:if test="${'ADMIN' ne principal.user.USER_ROLE}">
				<button id="btn-delete" class="btn btn-outline-danger mr-5 ml-5 mb-3">회원 탈퇴</button>
			</c:if>
			<c:if test="${'ADMIN' eq principal.user.USER_ROLE}">
				<button id="btn-delete2" class="btn btn-outline-danger mr-5 ml-5 mb-3">관리자 회원 탈퇴</button>
			</c:if>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>



<script src="https://use.fontawesome.com/releases/v5.9.0/js/all.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

</body>
</html>


<script src="/js/user.js"></script>
<script src="/js/board2.js"></script>