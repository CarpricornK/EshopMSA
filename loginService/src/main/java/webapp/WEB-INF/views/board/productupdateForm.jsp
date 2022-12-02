<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header2.jsp"%>

<div class="container">


	<form action="" method="post">
		<input type="hidden" id="id" value="${productboard.id}" />
		<div class="row d-flex justify-content-center">
			<div style="width: 375px;" class="form-group mr-1">
				<input type="text" class="form-control" value="${productboard.title}" id="title">
			</div>


			<div style="width: 380px;" class="form-group mr-1">
				<input type="text" class="form-control" value="${productboard.adminname}" id="adminname">
			</div>
		</div>


		<div class="form-group row d-flex justify-content-center">
			<div class="form-group" style="width: 760px">
				<input type="text" class="form-control" value="${productboard.info}" id="info">
			</div>
		</div>


		<div class="row d-flex justify-content-center">
			<div class="form-group mr-1">
				<select style="width: 375px; height: 47px;" name="order" id="type1">
					<option value="이어폰">이어폰</option>
					<option value="이어폰">이어폰</option>
				</select>
			</div>
			<div class="form-group">
				<select style="width: 375px; height: 47px;" name="order" id="type2">
					<option value="유선">유선</option>
					<option value="무선">무선</option>
				</select>

			</div>
		</div>

		<div class="row d-flex justify-content-center">
			<div class="form-group mr-1">
				<input style="width: 186px;" type="text" class="form-control" placeholder="제품가격" value="${productboard.price}" id="price">
			</div>
			<div class="form-group mr-1">
				<input style="width: 186px;" type="text" class="form-control" placeholder="재고수.." value="${productboard.mcount}" id="mcount" >
			</div>
			<div class="form-group mr-1">
				<input style="width: 186px;" type="text" class="form-control" placeholder="할인(%)" value="${productboard.discountpercentage}" id="discountpercentage">
			</div>
			<div class="form-group">
				<input style="width: 186px;" type="text" class="form-control" placeholder="배송료(￦)" value="${productboard.fee}" id="fee">
			</div>
		</div>

		<div class="row d-flex justify-content-center">
			<div class="form-group mr-1">
				<textarea class="form-control summernoteimg" rows="5" id="img1">${productboard.img1}</textarea>
			</div>
			<div class="form-group mr-1">
				<textarea class="form-control summernoteimg2" rows="5" id="img2">${productboard.img2}</textarea>
			</div>
			<div class="form-group mr-1">
				<textarea class="form-control summernoteimg3" rows="5" id="img3">${productboard.img3}</textarea>
			</div>
			<div class="form-group">
				<textarea class="form-control summernoteimg4" rows="5" id="img4">${productboard.img4}</textarea>
			</div>

		</div>


		<div class="form-group">
			<textarea class="form-control summernote" rows="5" id="content">${productboard.content}</textarea>
		</div>

	</form>


	<button id="btn-productupdate" class="btn btn-primary mb-2">상품 등록</button>


	<div class="form-group">
		작성자<input type="text" class="form-control" value="${principal.user.username}" id="username">
	</div>



</div>

<script>
	$('.summernote').summernote(

			{
				placeholder : '제품 소개를 적을 공간입니다 가운데 정렬을 권장합니다',
				tabsize : 2,
				height : 550,
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
		placeholder : '&nbsp;&nbsp;-------대표  이미지-------',
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
</script>
<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>



<!-- 글쓰기 디자인 https://summernote.org/getting-started/#without-bootstrap -->