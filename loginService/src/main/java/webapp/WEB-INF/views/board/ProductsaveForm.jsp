<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header2.jsp"%>

<style type='text/css'>
.searchbox2:hover {
	border-color: #171717 #ffffff #171717;
	color: #F77C1E;
	padding: 2px 2px 2px 10px;
}

.searchbox2:focus::placeholder {
	border-color: #171717 #ffffff #171717;
	color: #F77C1E;
}

.searchbox2 {
	width: 380px; /*가로크기*/
	/*height: 50px; 세로크기*/
	background-color: #8E8C8C; /*배경색*/
	border: 1.5px solid #000000; /*테두리 두께, 선스타일, 색상*/
	border-color: #ffffff #ffffff #ffffff;
	border-radius: 1px; /*테두리 둥글게*/
	outline: none; /*기본테두리안보이게*/
	padding: 3px 3px 2px 7px; /*안쪽여백*/
	box-sizing: border-box; /*테두리를 기준으로 박스크기 설정*/
	transition: .3s; /*서서히 나타내기*/
	color: #FFFFFF;
	cursor: default;
}

.searchbox2::placeholder {
color: #FFFFFF;
}

.searchbox1 {
	width: 380px; /*가로크기*/
	/*height: 50px; 세로크기*/
	background-color: #8E8C8C; /*배경색*/
	border: 1.5px solid #000000; /*테두리 두께, 선스타일, 색상*/
	border-color: #8E8C8C #ffffff #8E8C8C;
	border-radius: 1px; /*테두리 둥글게*/
	outline: none; /*기본테두리안보이게*/
	padding: 3px 3px 2px 7px; /*안쪽여백*/
	box-sizing: border-box; /*테두리를 기준으로 박스크기 설정*/
	color: #FFFFFF;
	cursor: default;
}

.searchbox1:focus::placeholder {
	border-color: #171717 #ffffff #171717;
	color: #F77C1E;
}


.searchbox1::placeholder {
color: #FFFFFF;
}

/* ============================= TIP =========================== */
.help-tip {
	position: fixed;
	top: 48px;
	right: 18px;
	text-align: center;
	background-color: #302F2F;
	border-radius: 50%;
	width: 24px;
	height: 24px;
	font-size: 10px;
	line-height: 26px;
	cursor: default;
}

.help-tip:before {
	content: 'TIP';
	font-weight: bold;
	color: #fff;
}

.help-tip:hover p {
	display: block;
	transform-origin: 100% 0%;
	-webkit-animation: fadeIn 0.3s ease-in-out;
	animation: fadeIn 0.3s ease-in-out;
}

.help-tip p {
	display: none;
	text-align: center;
	background-color: #1E2021;
	border: 1px solid #777575; padding : 30px;
	width: 350px;
	position: absolute;
	border-radius: 3px;
	box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
	right: -4px;
	color: #FFFFFF;
	font-size: 13px;
	line-height: 1.4;
	padding: 20px;
}

.help-tip p:before {
	position: absolute;
	content: '';
	width: 0;
	height: 0;
	border: 6px solid transparent;
	border-bottom-color: #1E2021;
	right: 10px;
	top: -12px;
}

.help-tip p:after {
	width: 100%;
	height: 40px;
	content: '';
	position: absolute;
	top: -40px;
	left: 0;
}

 /* ============================= TIP =========================== */
</style>

<div class="help-tip">
	<p>
		- TIP - <br> Shift + e 로 중앙정렬을 할 수 있습니다
	</p>
</div>

<div class="container">


	<form action="" method="post">
		<div class="row d-flex justify-content-center">
			<div style="width: 555px;" class="form-group mr-1">
				<input style="width: 555px;"  type="text" class="form-control searchbox2 mr-1" placeholder="제목을 적어주세요" id="title">
			</div>


			<div style="width:200px;" class="form-group ml-1">
			    <input style="width:200px;"  type="text" class="form-control searchbox2 mr-1" placeholder="재고 수량" id="mcount">
				<input type="hidden" class="form-control" value="${principal.user.username}" placeholder="Enter adminname" id="adminname" readonly>
			</div>


		</div>

		<div class="form-group row d-flex justify-content-center">
			<div class="form-group">
				<textarea style="width: 763px" class="form-control searchbox1" placeholder="제품의 성능을 적어주세요(대표이미지 믿에 표시됩니다)" id="info"></textarea>
			</div>
		</div>



		<div class="row d-flex justify-content-center">
			<div class="form-group mr-1">
				<select style="width: 380px;" name="cars" class="custom-select searchbox2" id="type1">
					<option value="이어폰">이어폰</option>
					<option value="이어폰">이어폰</option>
				</select>
			</div>
			<div class="form-group">
				<select style="width: 380px;" name="cars" class="custom-select searchbox2" id="type2">
					<option value="유선">유선</option>
					<option value="무선">무선</option>
				</select>

			</div>
		</div>

		<div class="row d-flex justify-content-center">
			<div class="form-group mr-1">
				<input style="width: 255px;" type="text" class="form-control searchbox2" placeholder="가격" id="price">
			</div>
			<div class="form-group mr-1">
				<input style="width: 250px;" type="text" class="form-control searchbox2" placeholder="할인(%)" id="discountpercentage">
			</div>
			<div class="form-group">
				<input style="width: 250px;" type="text" class="form-control searchbox2" placeholder="배송료를 적어주세요 무료는(0)" id="fee">
			</div>
		</div>

		<div class="row d-flex justify-content-center">
			<div class="form-group mr-1">
				<textarea class="form-control summernoteimg" rows="5" id="img1"></textarea>
			</div>
			<div class="form-group mr-1">
				<textarea class="form-control summernoteimg2" rows="5" id="img2"></textarea>
			</div>
			<div class="form-group mr-1">
				<textarea class="form-control summernoteimg3" rows="5" id="img3"></textarea>
			</div>
			<div class="form-group">
				<textarea class="form-control summernoteimg4" rows="5" id="img4"></textarea>
			</div>

		</div>


		<div class="form-group d-flex justify-content-center">
			<textarea class="form-control summernote" rows="5" id="content"></textarea>
		</div>

	</form>

	<div class="d-flex justify-content-center">
		<button id="btn-productsave" class="btn btn-primary mb-2">상품 등록</button>
	</div>

	<div class="form-group">
		<input type="hidden" class="form-control" value="${principal.user.username}" id="username">
	</div>



</div>

<script>
	$('.summernote').summernote(

			{
				placeholder : '제품 소개를 적을 공간입니다 가운데 정렬을 권장합니다',
				tabsize : 2,
				width : 770,
				height : 450,
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
	$('.summernoteimg').summernote(

	{
		placeholder : '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;------- Drag & Drop(대표 이미지) -------',
		tabsize : 2,
		width : 380,
		height : 250,
		toolbar : [ [ 'style', [] ], [ 'insert', [] ], [ 'view', [] ] ]
	});
	$('.summernoteimg2').summernote(

	{
		placeholder : '-------썸네일 이미지1------',
		tabsize : 2,
		width : 380,
		height : 250,
		toolbar : [ [ 'style', [] ], [ 'insert', [] ], [ 'view', [] ] ]
	});
	$('.summernoteimg3').summernote(

	{
		placeholder : '-------썸네일 이미지2------',
		tabsize : 2,
		width : 380,
		height : 250,
		toolbar : [ [ 'style', [] ], [ 'insert', [] ], [ 'view', [] ] ]
	});
	$('.summernoteimg4').summernote(

	{
		placeholder : '-------썸네일 이미지3------',
		tabsize : 2,
		width : 380,
		height : 250,
		toolbar : [ [ 'style', [] ], [ 'insert', [] ], [ 'view', [] ] ]
	});
	$('.summernoteinfo').summernote(

	{
		placeholder : '썸네일 믿에 배치될 텍스트 공간입니다',
		tabsize : 2,
		width : 760,
		height : 200,
		toolbar : [ [ 'style', [] ], [ 'insert', [] ], [ 'view', [] ] ]
	});
</script>
<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>



<!-- 글쓰기 디자인 https://summernote.org/getting-started/#without-bootstrap -->