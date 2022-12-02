
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="kopo.poly.util.SHA256" %>
<%@ page import="kopo.poly.model.User" %>
<%@page import="kopo.poly.util.Gmail"%>
<%@ page import="kopo.poly.util.UserDAO" %>

<%@ include file="../layout/joinFormheader.jsp"%>



<style>
	@import url(https://fonts.googleapis.com/css?family=Roboto:300);

	.login-page {
		width: 360px;
		padding: 8% 0 0;
		margin: auto;
	}
	.form {
		position: relative;
		z-index: 1;
		background: whitesmoke;
		max-width: 360px;
		margin: 0 auto 100px;
		padding: 45px;
		text-align: center;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	}
	.form input {
		font-family: "Roboto", sans-serif;
		outline: 0;
		background: #c5c5c5;
		width: 100%;
		color: #151823;
		border: 0;
		margin: 0 0 15px;
		padding: 15px;
		box-sizing: border-box;
		font-size: 14px;
	}
	button {
		font-family: "Roboto", sans-serif;
		text-transform: uppercase;
		outline: 0;
		background: #4CAF50;
		width: 100%;
		border: 0;
		padding: 15px;
		color: #FFFFFF;
		font-size: 14px;
		-webkit-transition: all 0.3 ease;
		transition: all 0.3 ease;
		cursor: pointer;
	}

	#button3 {
		font-family: "Roboto", sans-serif;
		text-transform: uppercase;
		outline: 0;
		background: #4CAF50;
		color: #FFFFFF;
		font-size: 14px;
		-webkit-transition: all 0.3 ease;
		transition: all 0.3 ease;
		cursor: pointer;
	}
	.form button:hover,.form button:active,.form button:focus {
		background: #43A047;
	}
	.form .message {
		margin: 15px 0 0;
		color: #b3b3b3;
		font-size: 12px;
	}
	.form .message a {
		color: #4CAF50;
		text-decoration: none;
	}
	.form .register-form {
		display: none;
	}
	.container {
		position: relative;
		z-index: 1;
		max-width: 300px;
		margin: 0 auto;
	}
	.container:before, .container:after {
		content: "";
		display: block;
		clear: both;
	}
	.container .info {
		margin: 50px auto;
		text-align: center;
	}
	.container .info h1 {
		margin: 0 0 15px;
		padding: 0;
		font-size: 36px;
		font-weight: 300;
		color: #1a1a1a;
	}
	.container .info span {
		color: #4d4d4d;
		font-size: 12px;
	}
	.container .info span a {
		color: #000000;
		text-decoration: none;
	}
	.container .info span .fa {
		color: #EF3B3A;
	}
	body {
		font-family: "Roboto", sans-serif;
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
	}
</style>


<%

%>


<div class="form" style="margin-top:100px;">

	<form >
		<div>

			<div class="">
				<h3 style="margin-top: -20px; margin-bottom: 20px;">Sign Up</h3>

				<div class="form-group">
					<c:if test="${null eq check1 && null ne param.name}">
						<input type="text" name="username" class="form-control" value="${param.name}" id="username">
					</c:if>
					<c:if test="${null eq param.name}">
						<input type="text" name="username" class="form-control" placeholder="Username" id="username">
					</c:if>
				</div>


				<div class="form-group">
					<input type="password" name="password" class="form-control" placeholder="password" id="password">
				</div>

				<div class="form-group">
					<input type="password" name="password" class="form-control" placeholder="password" id="passwordre">
				</div>

				<div class="form-group">
					<input type="email" class="form-control" placeholder="email" id="email">
				</div>

				<div class="d-flex justify-content-between">
					<form ACTION="joinForm.jsp" METHOD=POST>

						<input style="width:50%;" class="form-control mr-2" TYPE="text" NAME="name" placeholder='아이디 입력'> <br>

						<input id="button3" style="width:40%; line-height:10px;" class="form-control" TYPE="submit" VALUE="중복체크">

					</form>
				</div>
				<c:forEach var="User" items="${Users}">
					<c:set var="title" value="${User.username}" />
					<c:set var="check" value="아이디 사용가능!" />
					<c:if test="${User.username eq param.name}">
						<c:set var="check1" value="아이디 중복!" />
					</c:if>
				</c:forEach>
				<c:if test="${null eq check1 && null ne param.name}">
					<a style="color:blue;">${check}</a>
				</c:if>
				<a style="color:blue;">${check1}</a>

			</div>

		</div>

		<button id="btn-save" class="btn-3 mb-3">회원가입</button>
		<p class="message">Already  registered? <a href="/auth/loginForm">LogIn an account</a></p>


	<%--		<div class="login-page">--%>
<%--			<div class="form">--%>
<%--				<button id="btn-save" class="btn-3 mb-3">회원가입</button>--%>
<%--				<p class="message">Not registered? <a href="/auth/joinForm">Create an account</a></p>--%>
<%--				<p class="message">Find password? <a href="http://localhost:8000/auth/PW_FIND">비밀번호 찾기</a></p>--%>
<%--			</div>--%>
<%--		</div>--%>





	<%--		<div style="margin-top: 150px; width: 100%;" class="container d-flex justify-content-center pt-1">--%>
<%--			<div style="border: 2px solid; border-color:#1c3b58 #ffffff #1c3b58 ; padding-right: 10%; padding-left: 10%;"--%>
<%--				 class="pt-2">--%>
<%--				<div class="form-group">--%>
<%--					<label for="username">🗨 Username</label>--%>
<%--					<c:if test="${null eq check1 && null ne param.name}">--%>
<%--						<input style="border: 2px solid #1c3b58;  border-radius: 5px;" type="text" name="username"--%>
<%--							   class="form-control zoomm" value="${param.name}" id="username">--%>
<%--					</c:if>--%>
<%--					<c:if test="${null eq param.name}">--%>
<%--						<input style="border: 2px solid #1c3b58;  border-radius: 5px;" type="text" name="username"--%>
<%--							   class="form-control zoomm" placeholder="🗨 Enter Username" id="username">--%>
<%--					</c:if>--%>
<%--				</div>--%>

<%--				<div class="ml-1 row">--%>
<%--					<form ACTION="joinForm.jsp" METHOD=POST>--%>

<%--						<input TYPE="text" NAME="name" SIZE=20 value=''> <br>--%>

<%--						<input TYPE="submit" VALUE="아이디중복체크">--%>

<%--					</form>--%>
<%--				</div>--%>

<%--				<c:forEach var="User" items="${Users}">--%>
<%--					<c:set var="title" value="${User.username}"/>--%>
<%--					<c:set var="check" value="아이디 사용가능!"/>--%>
<%--					<c:if test="${User.username eq param.name}">--%>
<%--						<c:set var="check1" value="아이디 중복!"/>--%>
<%--					</c:if>--%>
<%--				</c:forEach>--%>
<%--				<c:if test="${null eq check1 && null ne param.name}">--%>
<%--					<a style="color:blue;">${check}</a>--%>
<%--				</c:if>--%>
<%--				<a style="color:blue;">${check1}</a>--%>

<%--				<div class="form-group">--%>
<%--					<label for="password">🔑 Password</label> <input--%>
<%--						style="border: 2px solid #1c3b58;  border-radius: 5px;" type="password" name="password"--%>
<%--						class="form-control zoomm"--%>
<%--						placeholder="🔑 Enter password" id="password">--%>
<%--				</div>--%>

<%--				<div class="form-group">--%>
<%--					<label for="password">🔑 Password Re</label>--%>
<%--					<input style="border: 2px solid #1c3b58;  border-radius: 5px;" type="password" name="password"--%>
<%--						   class="form-control zoomm" placeholder="Re password" id="passwordre">--%>
<%--				</div>--%>

<%--				<div class="form-group">--%>
<%--					<label for="email"><span style="color: #35497F;">📧 Email</span></label> <input--%>
<%--						style="border: 2px solid #1c3b58;" type="email" class="form-control zoomm"--%>
<%--						placeholder="📧 Enter email" id="email">--%>
<%--				</div>--%>

<%--			</div>--%>

<%--		</div>--%>

	</form>



</div>





<script src="/js/user.js"></script>


