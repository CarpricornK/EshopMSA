<%@page import="kopo.poly.model.Board"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/Productheader2.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100&display=swap" rel="stylesheet">
<%@ page import="kopo.poly.util.CmmUtil" %>
<%
	String roomname = CmmUtil.nvl(request.getParameter("roomname"));

	String nickname = CmmUtil.nvl(request.getParameter("nickname"));
%>



<style>
.body {
	font-family: "Montserrat", sans-serif;
	font-kerning: none;
	font-size: 14px;
	padding: 2em;
	text-align: center;
}

.body * {
	box-sizing: border-box;
	-webkit-box-sizing: border-box;				
}

.body h1 {
	font-size: 1.5em;
	font-weight: 500;
	line-height: 1.6;
	margin: 0 0 2em;
}

.body input[type=number] {
	-moz-appearance: textfield;
}

.body input[type=number]::-webkit-inner-spin-button, .body input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

.body .pt_Quantity {
	display: inline-block;
	margin: 0 0 10px;
	position: relative;
}

.body .pt_Quantity input {
	color: #443017;
	border-radius: 2px;
	background-color: #ffffff;
	border: solid 1px #b7b7b7;
	font-family: "Montserrat", sans-serif;
	font-size: 15px;
	font-weight: 300;
	min-width: 45px;
	height: 30px;
	float: left;
	display: block;
	padding: 0 15px 0 2px;
	margin: 0;
	text-align: center;
	width: 70px;
}

.body .pt_Quantity input:focus {
	outline: 0;
}

.body .pt_Quantity .pt_QuantityNav {
	float: left;
	position: relative;
	height: 30px;
}

.body .pt_Quantity .pt_QuantityNav .pt_QuantityButton {
	position: relative;
	cursor: pointer;
	border-left: 1px solid #b7b7b7;
	width: 15px;
	text-align: center;
	color: #333;
	font-size: 14px;
	font-family: "Trebuchet MS", Helvetica, sans-serif !important;
	line-height: 1.1;
	-webkit-transform: translateX(-100%);
	transform: translateX(-100%);
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.body .pt_Quantity .pt_QuantityNav .pt_QuantityButton:active {
	box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
	-webkit-box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
}

.body .pt_Quantity .pt_QuantityNav .pt_QuantityButton.pt_QuantityUp {
	position: absolute;
	height: 50%;
	top: 0;
	border-bottom: 1px solid #b7b7b7;
}

.body .pt_Quantity .pt_QuantityNav .pt_QuantityButton.pt_QuantityDown {
	position: absolute;
	bottom: 0px;
	height: 50%;
}

/* ===========================주문수량 버튼============================== */
.slick-sample {
	width: 1400px;;
	height: 250px;
}

.slick-sample .slick-list {
	height: 350px;
}

.custom-review-badge-2 {
	background: #2B99F8;
	display: inline-block;
	padding: 2px 5px;
	color: white;
	border-radius: 2px;
	font-size: small;
}

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
.favorite-button {
	cursor: pointer;
	border: 0;
	color: red;
}

.favorite-button .favorite__icon {
	top: 18px;
	right: 18px;
	height: 30px;
	width: 30px;
	opacity: 0;
	transition: opacity 0.3s, transform 0.3s;
	transform: scale(.6);
	position: fixed;
}

.favorite-button2.is-favorite2 .favorite--enable {
	opacity: 1;
	transform: scale(1);
	z-index: 1;
}

.favorite-button2:not(.is-favorite2) .favorite--not {
	opacity: 1;
	transform: scale(1);
	z-index: 1;
}

.favorite-button2 {
	cursor: pointer;
	border: 0;
	color: red;
}

.favorite-button2 .favorite__icon2 {
	bottom: 18px;
	right: 18px;
	height: 30px;
	width: 30px;
	opacity: 0;
	transition: opacity 0.3s, transform 0.3s;
	transform: scale(.6);
	position: fixed;
}

.favorite-button.is-favorite .favorite--not1 {
	opacity: 1;
	transform: scale(1);
	z-index: 1;
}

.favorite-button:not(.is-favorite) .favorite--enable1 {
	opacity: 1;
	transform: scale(1);
	z-index: 1;
}
.Modeldes{
	border-radius: 5px;
	border: 1px solid rgb(0, 0, 0, 0);
	background-color: #252b37;
}
/* =====================좋아요======================= */
</style>

<!-- =============좋아요버튼============ -->
<form action="" method="post">
	<div class="form-group mr-1">
		<input type="hidden" id="fid" value="${productboard.id}" />
		<c:forEach var="productboarda" items="${productboarda.content}">

		</c:forEach>
		<input type="hidden" class="form-control" value="${principal.user.username }" id="fname">
	</div>
	<div class="form-group mr-1">
		<input type="hidden" class="form-control" value="${productboard.title }" id="ftitle">
	</div>
	<c:set var="fffid" value="${param.fffid}" />

	<input type="hidden" id="ffid" value="${fffid}" />

	<c:if test="${null ne fffid}">

		<button id="btn-favoritejimu" type="button" class="favorite-button" style="z-index: 2">
			<i class="fas fa-heart favorite__icon favorite--enable1"> </i> <i class="far fa-heart favorite__icon favorite--not1"> </i>
		</button>

	</c:if>

	<button id="btn-favoritejim" type="button" class="favorite-button2" style="z-index: 1">
		<i class="fas fa-heart favorite__icon2 favorite--enable"> </i> <i class="far fa-heart favorite__icon2 favorite--not"> </i>
	</button>
</form>


<!-- =============좋아요버튼============ -->

<div class="container">

	<div class="row-12 d-flex justify-content-between" style="height: 700px!important;">
		<div class="col-6">
			<div class="">
				<div class="slider">
					<input class="slider__dot" type="radio" name="slider" title="slide1" checked="checked" /> <input class="slider__dot" type="radio" name="slider" title="slide2" /> <input class="slider__dot"
						type="radio" name="slider" title="slide3" /> <input class="slider__dot" type="radio" name="slider" title="slide4" />
					<div class="slider__inner">
						<div class="slider__body">
							<c:if test="${empty productboard.img1}">
								<i class="slider__image fa fa-codepen"></i>
							</c:if>
							<h2 class="slider__caption"></h2>
							<p class="slider__text">${productboard.img1}</p>
						</div>
						<div class="slider__body">
							<c:if test="${empty productboard.img2}">
								<i class="slider__image fa fa-newspaper-o"></i>
							</c:if>
							<h2 class="slider__caption"></h2>
							<p class="slider__text">${productboard.img2}
						</div>
						<div class="slider__body">
							<c:if test="${empty productboard.img3}">
								<i class="slider__image fa fa-television"></i>
							</c:if>
							<h2 class="slider__caption"></h2>
							<p class="slider__text">${productboard.img3}
						</div>
						<div class="slider__body">
							<c:if test="${empty productboard.img4}">
								<i class="slider__image fa fa-diamond"></i>
							</c:if>
							<h2 class="slider__caption"></h2>
							<p class="slider__text">${productboard.img4}
						</div>
					</div>
				</div>

			</div>

			<div class="row mt-2 d-flex justify-content-center">
				<span class="mr-1" style="width: 10%">${productboard.img1}</span> <span class="mr-1" style="width: 10%">${productboard.img2}</span> <span class="mr-1" style="width: 10%">${productboard.img3}</span>
				<span class="mr-1" style="width: 10%">${productboard.img4}</span>
			</div>


		</div>




		<div class="col-6">
			<div class="mt-3 ml-2">
				<div>
					<h3>
						${productboard.title}-
						<c:set var="totalstar1" value="0" />
						<c:set var="totalstar2" value="0" />
						<c:forEach var="star" items="${productboard.productreplys}" varStatus="status">
							<c:if test="${null ne star.starpoint1}">
								<c:set var="totalstar1" value="${totalstar1 + 1}" />
								<c:set var="totalstar2" value="${totalstar2 + star.starpoint1/2}" />
							</c:if>
						</c:forEach>


						<div class="custom-review-badge">
							<div class="star-ratings-css">
								<div class="star-ratings-css-top" style="width: <fmt:formatNumber value="${(totalstar2/totalstar1)*23}" pattern="0" />%">
									<span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span>
								</div>
								<div class="star-ratings-css-bottom">
									<span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9733;</span>
								</div>
							</div>
						</div>

						<div class="custom-review-badge-1 ml-3">
							<span class=review-label><fmt:formatNumber value="${(totalstar2/totalstar1)}" pattern=".00" /></span> <span class=review-star-symbol>&#9733;</span>
						</div>

					</h3>
					<hr />
					<div class="ml-1">
						INFO - 분류 : <a style="color: #00BFFF;">${productboard.type1}</a> 분류2 : <a style="color: #5858FA;">${productboard.type2}</a> 재고수 :
						<c:if test="${productboard.mcount!=0}">
							<a style="color: #316DC7;"> ${productboard.mcount} </a>
						</c:if>
						<c:if test="${productboard.mcount==0}">
							<a style="color: red;"> 재고 없음 </a>
						</c:if>


					</div>
					<hr />
				</div>





				<!--   ======================= 배송료 가격부분 ===================== -->
				<div class="row-12 mt-2 d-flex justify-content-end" style="margin-bottom: -10px;">

					<div class="mt-1">
						<span style="color: #D8D8D8; font-size: 12px; text-decoration: line-through;"><fmt:formatNumber value="${productboard.price}" pattern="#,###" />원</span>
						<c:if test="${productboard.discountpercentage!=0}">
							<p>
								<fmt:formatNumber value="${productboard.price-(productboard.price/100*productboard.discountpercentage-(productboard.price/100*productboard.discountpercentage)%1)-productboard.fee}"
									pattern="#,###" />
								원
							</p>
						</c:if>
						<c:if test="${productboard.discountpercentage==0}">
							<p>${productboard.price}원</p>
						</c:if>
					</div>

					<div class="ml-3 mr-2 mt-3">
						<a style="color: #FF0000; font-size: 21px;">-${productboard.discountpercentage}%</a>
					</div>
				</div>
				<hr />
				<div class="d-flex justify-content-end" style="margin-top: -10px; margin-bottom: -10px; margin-right: 20px;">
					<c:if test="${productboard.fee!=0}">
						<a style="color: #FF0000; font-size: 16px;"> 배송료 : ${productboard.fee} </a>
					</c:if>
					<c:if test="${productboard.fee==0}">
						<a style="color: green; font-size: 16px;">&nbsp; 배송료 : 무료배송 </a>
					</c:if>
				</div>

				<hr />

				<!--   ======================= 배송료 가격부분 ===================== -->

				<form action="" method="post">
					<div style="" class="d-flex justify-content-end">
						<c:if test="${productboard.mcount==0}">
							<a style="color: red;"> 재고 없음 </a>
						</c:if>
						<div style="margin-top: -30px; margin-bottom: -50px;" class="body">

							<div class="pt_Quantity">

								<input id="mcount2" onchange='printName()' type="number" min="0" max="${productboard.mcount}" step="1" value="0" data-inc="1" readonly>
							</div>
						</div>
					</div>
					<hr />






					<%-- <%-- 					<c:set var="total7" value="<span id='result'></span>" /> --%>
					<%-- <%-- 					${productboard.mcount} --%>
					<%-- <%-- 					${total7} --%>
					<!-- <!-- 					<script> -->

					<!-- // function printName()  { -->
					<!-- // 	  var name = document.getElementById('mcount').value; -->
					<!-- // 	  document.getElementById("result").innerHTML = name; -->
					<!-- // 	} -->
					<!-- <!-- </script> -->





					<div class="mt-2">
						<textarea id="orderaddress" class="form-control" placeholder="주소를 적어주세요" rows="1"></textarea>
					</div>

					<div class="mt-2">
						<textarea id="ordercontent" class="form-control" placeholder="요청사항을 적어주세요" rows="1"></textarea>
					</div>







					<input type="hidden" class="form-control" value="${productboard.price }" id="price"> <input type="hidden" class="form-control" value="${productboard.fee }" id="fee"> <input
						type="hidden" class="form-control" value="${productboard.title }" id="title"> <input type="hidden" class="form-control" value="${productboard.discountpercentage}" id="discountpercentage">
					<input type="hidden" class="form-control" value="${productboard.info}" id="info"> <input type="hidden" class="form-control" value="${principal.user.username }" id="username"> <input
						type="hidden" class="form-control" value="${productboard.adminname }" id="adminname"> <input type="hidden" class="form-control" value="${productboard.type2}" id="type"> <input
						type="hidden" class="form-control" value="${productboard.id}" id="productido"> <input type="hidden" id="id" value="${productboard.id}" />
		 <input type="hidden" class="form-control" value="${productboard.mcount}" id="mcount">
					<textarea style="opacity: 0;" id="img1" class="form-control" placeholder="사은품 만들어볼 예정" rows="1">${productboard.img1}</textarea>





				</form>

				<div class="d-flex justify-content-center">
					<div class=>
						<div class="row">
							<button style="width: 160px; height: 40px;" type="button" class="btn mr-5 mt-3">
								<img style="margin-top:-20px; width: 50px; height: 50px;" src="https://cdn-icons-png.flaticon.com/512/3495/3495502.png">
							</button>
							<c:if test="${-10<=productboard.mcount}">
								<button id="btn-favorite" style="width: 160px; height: 40px;" type="button" class="btn mt-3">
									<img style="margin-top:-30px; width: 50px; height: 50px;" src="https://cdn-icons-png.flaticon.com/512/116/116383.png">
								</button>
							</c:if>
						</div>

						<div class="row mt-5">
							<c:if test="${productboard.username==principal.user.username}">
								<button style="width: 160px;" id="btn-productdelete" class="btn mt-3 mr-5">
									<img style="margin-top:-30px; width: 40px; height: 40px;" src="https://cdn-icons-png.flaticon.com/512/6270/6270560.png">

								</button>
								<a style="width: 160px;" href="/productboard/${productboard.id}/updateForm" class="btn mt-3">
									<img style="margin-top:-30px; width: 40px; height: 40px;" src="https://cdn-icons-png.flaticon.com/512/1159/1159633.png">

								</a>
							</c:if>
						</div>
					</div>

				</div>



			</div>

		</div>

	</div>



	<hr />

	<c:if test="${param.arar ne null}">
		<div id="my_modal layer_pop"
			 style="position: fixed; right: 20px; bottom: 65px; z-index:1; background-color: white">

			<iframe class="Modeldes" id="my_modal2" style="width: 300px; height: 500px"
					src="http://localhost:11000/chat/room?nickname=${principal.user.username}&roomname=${productboard.id}" id="chat_iframe">대체 내용
			</iframe>

		</div>

		<button class="B2O btn" style="position: fixed; right: 60px; bottom: 10px; z-index:1; background-color: white">
			<img style="width: 30px; height: 30px;"
				 src="https://i.ibb.co/Pmhv1dt/free-icon-chat-oval-speech-bubbles-symbol-55009.png">
		</button>

		<button class="B1C btn" style="position: fixed; right: 60px; bottom: 12px; z-index:1; background-color: white">
			<img style="width: 30px; height: 30px;" src="https://cdn-icons-png.flaticon.com/512/6276/6276642.png">
		</button>
	</c:if>

	<c:if test="${param.arar eq null}">
	<button class="B2O btn" style="position: fixed; right: 60px; bottom: 10px; z-index:1; background-color: white" onclick="location.href='?nickname=${param.nickname}&roomname=${param.roomname}&arar=${1}'">
			<img style="width: 30px; height: 30px;"
				 src="https://i.ibb.co/Pmhv1dt/free-icon-chat-oval-speech-bubbles-symbol-55009.png">
		</button>
	</c:if>



	<hr />
	<div class="row d-flex justify-content-between">
		<div>
			<button class="btn btn-secondary mr-1" onclick="history.back()">돌아가기</button>

		</div>
		<div class="ml-5">
			글 번호 : <span id="id"><i>${productboard.id} </i></span> 작성자 : <span><i> ${productboard.username} </i></span>조회수 : <span id="id"><i>${productboard.count} </i></span> <br />

		</div>

	</div>
	<div class="form-group"></div>
	<hr />
	<div style="background-color: #9B9999; border-radius: 5px; color: #FAFAFA;" class="pt-2 pb-2 ml-2 mr-2 d-flex justify-content-center">
		<span class="ml-2 mr-2">${productboard.info}</span>
	</div>
	<hr />

	<div class="form-group">
		<div>${productboard.content}</div>

	</div>

	<div class="card">
		<form>
			<input id="productboardid" type="hidden" value="${productboard.id}" />
			<div style="height: 65px;" class="card-body row ml-1">
				<div class="form-group" style="margin-right: -10px;" class="col-3">
					<select name="cars" class="custom-select" id="kinds">
						<option value="1">상품의견</option>
						<option value="2">문의</option>
						<option value="3">반품/교환</option>
					</select>
				</div>
				<div class="col-9">
					<textarea id="product-reply-content" class="form-control" rows="1"></textarea>
				</div>
				<div class="starpoint_wrap">
					<div class="row">
						<span class="ml-2 mr-2 mt-2">평점 :</span>



						<div style="height: 18px;" class="starpoint_box mt-2">

							<label for="starpoint_1" class="label_star" title="0.5점"><span class="blind">0.5점</span></label> <label for="starpoint_2" class="label_star" title="1점"><span class="blind">1점</span></label> <label
								for="starpoint_3" class="label_star" title="1.5점"><span class="blind">1.5점</span></label> <label for="starpoint_4" class="label_star" title="2점"><span class="blind">2점</span></label> <label
								for="starpoint_5" class="label_star" title="2.5점"><span class="blind">2.5점</span></label> <label for="starpoint_6" class="label_star" title="3점"><span class="blind">3점</span></label> <label
								for="starpoint_7" class="label_star" title="3.5점"><span class="blind">3.5점</span></label> <label for="starpoint_8" class="label_star" title="4점"><span class="blind">4점</span></label> <label
								for="starpoint_9" class="label_star" title="4.5점"><span class="blind">4.5점</span></label> <label for="starpoint_10" class="label_star" title="5점"><span class="blind">5점</span></label> <input
								type="radio" name="starpoint" id="starpoint_1" class="star_radio" value=1> <input type="radio" name="starpoint" id="starpoint_2" class="star_radio" value=2> <input type="radio"
								name="starpoint" id="starpoint_3" class="star_radio" value=3> <input type="radio" name="starpoint" id="starpoint_4" class="star_radio" value=4> <input type="radio"
								name="starpoint" id="starpoint_5" class="star_radio" value=5> <input type="radio" name="starpoint" id="starpoint_6" class="star_radio" value=6 checked="checked";> <input
								type="radio" name="starpoint" id="starpoint_7" class="star_radio" value=7> <input type="radio" name="starpoint" id="starpoint_8" class="star_radio" value=8> <input type="radio"
								name="starpoint" id="starpoint_9" class="star_radio" value=9> <input type="radio" name="starpoint" id="starpoint_10" class="star_radio" value=10> <span class="starpoint_bg"></span>
						</div>
					</div>
				</div>



				<script>
    function test() {
        var obj_value = $("input:radio[name='starpoint']:checked").val();
        alert(obj_value);
    }
</script>

			</div>
			<div class="form-group">
				<input type="hidden" class="form-control" value="${principal.user.username}" id="username">
			</div>
			<div class="card-footer d-flex justify-content-center">
				<button type="button" id="btn-product-reply-save" class="btn btn-primary ml-1">등록</button>
			</div>
		</form>
	</div>

	<table style="border: 1px solid white;">
		<tr>
			<td><span class="glyphicon glyphicon-plus plusIcon"> <i class="fas fa-arrow-circle-down fa-1x" id="xx"></i> <a>답변하기</a>
			</span> <span class="glyphicon glyphicon-minus plusIcon " style="display: none"> <i class="fas fa-arrow-circle-up fa-1x" id="xx"> </i> <a>접기</a>
			</span>
		</tr>

		<tr style="display: none">
			<td>
				<div class="row ml-3">
					<div class="row">
						<form>
							<input style="height: 35px;" class="mb-1" id="replyreplyid" type="text" placeholder="대상 댓글의 번호 입력" /> <input style="height: 35px; width: 350px;" type="text" id="replyreplycontent"
								placeholder="답글 내용"></input> <input type="hidden" class="form-control" value="${principal.user.username}" id="replyreplyusername"> <input id="productboardid" type="hidden"
								value="${productboard.id}" />
							<button style="height: 35px; margin-top: -6px;" id="btn-product-reply-reply-save" class="btn btn-outline-dark">답글</button>
						</form>
					</div>
				</div>
			</td>
		</tr>


	</table>

	<div class="card">

		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#homea">상품의견</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#menu1a">문의</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#menu2">반품/교환</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div class="tab-pane container active" id="homea">
				<!-- ===================1=================== -->

				<c:forEach var="favoritex" items="${productboard.productreplys}">
					<c:set var="total" value="0" />




					<c:if test="${favoritex.kinds==1}">
						<div class="d-flex justify-content-between mt-4">
							<div class= mt-1>
								<a style="color: #585858;" class="mr-1">-${favoritex.id}-</a> <a>내용 : ${favoritex.content} </a> <br />
								<c:forEach var="favorite1" items="${productrreply.content}">
									<div class="row ml-1">
										<c:if test="${favorite1.replyreplyid==favoritex.id}">
											<span class="ml-1">⤻📧${favorite1.content} <small style="font-size: 8px;">-${favorite1.username}-</small><br /></span>
											<c:if test="${favorite1.username==principal.user.username}">
												<button style="height: 20px;" onClick="index.productreplyreplyDelete(${productboard.id}, ${favorite1.id})" class="badge mt-1 ml-1">삭제</button>
											</c:if>
										</c:if>
									</div>
								</c:forEach>
							</div>
							
							
							
							<div class="row mr-1">
								<div style="height:28px; margin-top:6px;" class="custom-review-badge-1 mr-3">
									<span class=review-label>${favoritex.starpoint1/2}</span> <span class=review-star-symbol>&#9733;</span>
						       </div>
						       
						       <div class="row" style="width:200px; height:30px;">
								<span class="ml-2" style="margin-top:6px;" >작성자 : ${favoritex.username}</span>
								
								<c:if test="${favoritex.username==principal.user.username}">
									<button style="height: 30px; color:#FE5031;" onClick="index.productreplyDelete(${productboard.id}, ${favoritex.id})" class="btn btn-link" >삭제</button>
								</c:if>
								
								<c:if test="${favoritex.username!=principal.user.username}">
									<a style="height: 30px; color:#B8B5B4;" class="btn btndisabled " >삭제</a>
								</c:if>
							   </div>
							</div>
						</div>
					</c:if>





				</c:forEach>
				<br />

			</div>


			<!-- ===================2=================== -->

			<div class="tab-pane container fade" id="menu1a">
				<c:forEach var="favoritex" items="${productboard.productreplys}">

					<c:if test="${favoritex.kinds==2}">
						<div class="d-flex justify-content-between mt-4">
							<div class= mt-1>

								<a style="color: #585858;" class="mr-1">-${favoritex.id}-</a> <a>내용:${favoritex.content} </a> <br />

								<c:forEach var="favorite1" items="${productrreply.content}">
									<div class="row ml-1">
										<c:if test="${favorite1.replyreplyid==favoritex.id}">
											<span class="ml-1">⤻📧${favorite1.content} <small style="font-size: 8px;">-${favorite1.username}-</small><br /></span>
											<c:if test="${favorite1.username==principal.user.username}">
												<button style="height: 20px;" onClick="index.productreplyreplyDelete(${productboard.id}, ${favorite1.id})" class="badge mt-1 ml-1">삭제</button>
											</c:if>
										</c:if>
									</div>
								</c:forEach>
							</div>
							<div class="row mr-1">
								<div style="height:28px; margin-top:6px;" class="custom-review-badge-1 mr-3">
									<span class=review-label>${favoritex.starpoint1/2}</span> <span class=review-star-symbol>&#9733;</span>
						       </div>
						       
						       <div class="row" style="width:200px; height:30px;">
								<span class="ml-2" style="margin-top:6px;" >작성자 : ${favoritex.username}</span>
								
								<c:if test="${favoritex.username==principal.user.username}">
									<button style="height: 30px; color:#FE5031;" onClick="index.productreplyDelete(${productboard.id}, ${favoritex.id})" class="btn btn-link" >삭제</button>
								</c:if>
								
								<c:if test="${favoritex.username!=principal.user.username}">
									<a style="height: 30px; color:#B8B5B4;" class="btn btn disabled" >삭제</a>
								</c:if>
							   </div>
							</div>
						</div>
					</c:if>





				</c:forEach>

				<br />
			</div>


			<!-- ===================3=================== -->
			<div class="tab-pane container fade" id="menu2">
				<c:forEach var="favoritex" items="${productboard.productreplys}">

					<c:if test="${favoritex.kinds==3}">
						<div class="d-flex justify-content-between mt-4">
							<div class= mt-1>

								<a style="color: #585858;" class="mr-1">-${favoritex.id}-</a> <a>내용:${favoritex.content} </a> <br />

								<c:forEach var="favorite1" items="${productrreply.content}">
									<div class="row ml-1">
										<c:if test="${favorite1.replyreplyid==favoritex.id}">
											<span class="ml-1">⤻📧${favorite1.content} <small style="font-size: 8px;">-${favorite1.username}-</small><br /></span>
											<c:if test="${favorite1.username==principal.user.username}">
												<button style="height: 20px;" onClick="index.productreplyreplyDelete(${productboard.id}, ${favorite1.id})" class="badge mt-1 ml-1">삭제</button>
											</c:if>
										</c:if>
									</div>
								</c:forEach>
							</div>
							<div class="row mr-1">
								<div style="height:28px; margin-top:6px;" class="custom-review-badge-1 mr-3">
									<span class=review-label>${favoritex.starpoint1/2}</span> <span class=review-star-symbol>&#9733;</span>
						       </div>
						       
						       <div class="row" style="width:200px; height:30px;">
								<span class="ml-2" style="margin-top:6px;" >작성자 : ${favoritex.username}</span>
								
								<c:if test="${favoritex.username==principal.user.username}">
									<button style="height: 30px; color:#FE5031;" onClick="index.productreplyDelete(${productboard.id}, ${favoritex.id})" class="btn btn-link" >삭제</button>
								</c:if>
								
								<c:if test="${favoritex.username!=principal.user.username}">
									<a style="height: 30px; color:#B8B5B4;" class="btn btn disabled" >삭제</a>
								</c:if>
							   </div>
							</div>
						</div>
					</c:if>



				</c:forEach>

				<br />

			</div>

			<!-- ===================3end=================== -->
		</div>
	</div>








	<div></div>



	<br /> <br />
	<c:set var="totalproduct" value="0" />
	<c:forEach var="productboard3" items="${productboards2}">
		<c:if test="${productboard.username eq productboard3.username}">
			<c:set var="totalproduct" value="${totalproduct + 1}" />
		</c:if>
	</c:forEach>
	<c:if test="${totalproduct >= 4}">
		<span style="font-family: 'Gothic A1', sans-serif;">글쓴이의 다른 상품 보기</span>
	</c:if>
</div>






<c:if test="${totalproduct >= 4}">
	<div class="container-fluid d-flex justify-content-center ">


		<div style="margin-bottom: 200px;" class="slick-sample d-flex justify-content-center mt-5">

			<c:set var="totalproduct" value="0" />
			<c:forEach var="productboard3" items="${productboards2}">
				<c:if test="${productboard.username eq productboard3.username}">

					<div class="col">
						<div class="card-title">

							<button class="btn d-flex justify-content-center ml-3" style="width: 200px; height: 110px; border: none; outrine: none;"
								onClick="index.productcount(${productboard3.id}, ${productboard3.count+1})">${productboard3.img1}</button>
						</div>
						<div style="margin-top: 100px; width: 250px;" class="card-body">
							<span class="d-flex justify-content-center ">${productboard3.title}</span> <small>
								<div class="row mt-1 ml-2">
									<div class="mt-2">
										<a style="color: #FF0000; font-size: 15px;">-${productboard3.discountpercentage}%</a>
									</div>
									<div class="col mt-1">
										<span style="color: #D8D8D8; font-size: 6px; text-decoration: line-through;">${productboard3.price}원</span>
										<c:if test="${productboard3.discountpercentage!=0}">
											<p style="font-size: 6px;"> <fmt:formatNumber value="${productboard3.price-(productboard3.price/100*productboard3.discountpercentage-(productboard3.price/100*productboard3.discountpercentage)%1)-productboard3.fee}" pattern="#,###" />원</p>
										</c:if>
										<c:if test="${productboard3.discountpercentage==0}">
											<p style="font-size: 6px;"><fmt:formatNumber value="${productboard3.price}" pattern="#,###" />원</p>
										</c:if>
									</div>


									<div class="col">
										<!--  =============================== 별표시 =============================== -->
										<c:set var="totalstar1" value="0" />
										<c:set var="totalstar2" value="0" />
										<c:forEach var="star" items="${productboard3.productreplys}" varStatus="status">
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
							<form action="" method="post" class="d-flex justify-content-center">
								<div class="form-group">
									<input style="width: 50px;" type="hidden" id="id" value="${productboard3.id}" /> <input style="width: 50px;" type="hidden" class="form-control" value="${productboard3.count+1}" id="count">
								</div>
							</form>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>

	</div>
</c:if>


<script>
$(document).ready(function(){
	$('.slick-sample').slick({
		  slidesToShow: 4,
		  slidesToScroll: 2,
		  initialSlide: 	1,  
		  autoplay: true,
		  autoplaySpeed: 2500,
		  prevArrow : "<button type='button' class='slick-prev btn'></button>",		// 이전 화살표 모양 설정
		  nextArrow : "<button type='button' class='slick-next btn'></button>",

		});
	});
</script>













<script>
	$('.summernote').summernote(

			{
				placeholder : '제품 소개를 적을 공간입니다 가운데 정렬을 권장합니다',
				tabsize : 2,
				height : 250,
				toolbar : [ [ 'style', [ 'style' ] ],
						[ 'font', [ 'bold', 'underline', 'clear' ] ],
						[ 'color', [ 'color' ] ],
						[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
						[ 'table', [ 'table' ] ],
						[ 'insert', [ 'link', 'picture', 'video' ] ],
						[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
			});
</script>
<script>
(function() {
    'use strict';

    function ctrls() {
        var _this = this;

        this.counter = 0;
        this.els = {
            decrement: document.querySelector('.ctrl-button-decrement'),
            counter: {
                container: document.querySelector('.ctrl-counter'),
                num: document.querySelector('.ctrl-counter-num'),
                input: document.querySelector('.ctrl-counter-input')
            },
            increment: document.querySelector('.ctrl-button-increment')
        };

        this.decrement = function() {
            var counter = _this.getCounter();
            var nextCounter = (_this.counter > 0) ? --counter: counter;
            _this.setCounter(nextCounter);
        };

        this.increment = function() {
            var counter = _this.getCounter();
            var nextCounter = (counter < 9999999999) ? ++counter: counter;
            _this.setCounter(nextCounter);
        };

        this.getCounter = function() {
            return _this.counter;
        };

        this.setCounter = function(nextCounter) {
            _this.counter = nextCounter;
        };

        this.debounce = function(callback) {
            setTimeout(callback, 100);
        };

        this.render = function(hideClassName, visibleClassName) {
            _this.els.counter.num.classList.add(hideClassName);

            setTimeout(function() {
                _this.els.counter.num.innerText = _this.getCounter();
                _this.els.counter.input.value = _this.getCounter();
                _this.els.counter.num.classList.add(visibleClassName);
            },
            100);

            setTimeout(function() {
                _this.els.counter.num.classList.remove(hideClassName);
                _this.els.counter.num.classList.remove(visibleClassName);
            },
            200);
        };

        this.ready = function() {
            _this.els.decrement.addEventListener('click',
            function() {
                _this.debounce(function() {
                    _this.decrement();
                    _this.render('is-decrement-hide', 'is-decrement-visible');
                });
            });

            _this.els.increment.addEventListener('click',
            function() {
                _this.debounce(function() {
                    _this.increment();
                    _this.render('is-increment-hide', 'is-increment-visible');
                });
            });

            _this.els.counter.input.addEventListener('input',
            function(e) {
                var parseValue = parseInt(e.target.value);
                if (!isNaN(parseValue) && parseValue >= 0) {
                    _this.setCounter(parseValue);
                    _this.render();
                }
            });

            _this.els.counter.input.addEventListener('focus',
            function(e) {
                _this.els.counter.container.classList.add('is-input');
            });

            _this.els.counter.input.addEventListener('blur',
            function(e) {
                _this.els.counter.container.classList.remove('is-input');
                _this.render();
            });
        };
    };

    // init
    var controls = new ctrls();
    document.addEventListener('DOMContentLoaded', controls.ready);
})();
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

<script>
const favoriteButton2 = document.querySelector(".favorite-button2");
favoriteButton2.addEventListener("click", (event) => {
  const button2 = event.currentTarget;
  button2.classList.toggle("is-favorite2");
});
</script>

<!-- 접었다 펼치기 ↓ -->
<script>
$(".plusIcon").on("click",function(){
	  var obj = $(this);
	  if( obj.hasClass("glyphicon-plus") ){
	    obj.hide();
	    obj.next().show();            
	    obj.parent().parent().next().show();
	  }else{
	     obj.hide();
	     obj.prev().show();
	     obj.parent().parent().next().hide();
	  }
	});
</script>

<!-- --주문수량부분-- -->
<script>
(function($) {
	  "use strict";

	  function customQuantity() {
	    /** Custom Input number increment js **/
	    jQuery(
	      '<div class="pt_QuantityNav"><div class="pt_QuantityButton pt_QuantityUp">+</div><div class="pt_QuantityButton pt_QuantityDown">-</div></div>'
	    ).insertAfter(".pt_Quantity input");
	    jQuery(".pt_Quantity").each(function() {
	      var spinner = jQuery(this),
	        input = spinner.find('input[type="number"]'),
	        btnUp = spinner.find(".pt_QuantityUp"),
	        btnDown = spinner.find(".pt_QuantityDown"),
	        min = input.attr("min"),
	        max = input.attr("max"),
	        valOfAmout = input.val(),
	        newVal = 0;

	      btnUp.on("click", function() {
	        var oldValue = parseFloat(input.val());

	        if (oldValue >= max) {
	          var newVal = oldValue;
	        } else {
	          var newVal = oldValue + 1;
	        }
	        spinner.find("input").val(newVal);
	        spinner.find("input").trigger("change");
	      });
	      btnDown.on("click", function() {
	        var oldValue = parseFloat(input.val());
	        if (oldValue <= min) {
	          var newVal = oldValue;
	        } else {
	          var newVal = oldValue - 1;
	        }
	        spinner.find("input").val(newVal);
	        spinner.find("input").trigger("change");
	      });
	    });
	  }
	  customQuantity();
	})(jQuery);

	function printName()  {
		  const name = document.getElementById('mcount').value;
		  document.getElementById("result").innerText = name;
		}
</script>


<script>


	function modal(id) {
		var zIndex = 9999;
		var modal = document.getElementById(id);

		// 모달 div 뒤에 희끄무레한 레이어
		var bg = document.createElement('div');
		bg.setStyle({
			position: 'fixed',
			zIndex: zIndex,
			left: '0px',
			top: '0px',
			width: '100%',
			height: '100%',
			overflow: 'auto',
			// 레이어 색갈은 여기서 바꾸면 됨
			backgroundColor: 'rgba(0,0,0,0.4)'
		});
		document.body.append(bg);

		// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
		modal.querySelector('.modal_close_btn').addEventListener('click', function() {
			bg.remove();
			modal.style.display = 'none';
		});

		modal.setStyle({
			position: 'fixed',
			display: 'block',
			boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

			// 시꺼먼 레이어 보다 한칸 위에 보이기
			zIndex: zIndex + 1,

			// div center 정렬
			top: '50%',
			left: '50%',
			transform: 'translate(-50%, -50%)',
			msTransform: 'translate(-50%, -50%)',
			webkitTransform: 'translate(-50%, -50%)'
		});
	}

	const openASD = document.querySelector(".B2O");
	const closeASD = document.querySelector(".B1C");

	openASD.addEventListener('click', openmodel);
	closeASD.addEventListener('click', closemodel);

	function openmodel(event) { //form 전송
		$("#my_modal2").show();
		$(".B1C").show();
		$(".B2O").hide();
	};

	function closemodel(event) { //form 전송
		$("#my_modal2").hide();
		$(".B1C").hide();
		$(".B2O").show();
	};

	window.onload = function () {
		console.log("asd");
		$(".B2O").hide();
	}
</script>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="/js/board.js"></script>

<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<%@ include file="../layout/footer.jsp"%>


<%--<script langauge="javascript">--%>

<%--	window.open("http://localhost:13000/chat/room?nickname=TEST&roomname=6","aerg",width=300,height=200);--%>

<%--</script>--%>
<!-- 글쓰기 디자인 https://summernote.org/getting-started/#without-bootstrap -->

<!-- 슬라이더 slider -codepen url- https://codepen.io/tari/pen/KzzzwX -->