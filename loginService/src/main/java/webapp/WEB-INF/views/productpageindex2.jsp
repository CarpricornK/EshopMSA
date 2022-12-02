<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="layout/Productheader.jsp"%>

<div class="container">

	<!-- 동작원리 54강 5:30초 설명 -->


	<div class="col-12 d-flex justify-content-between" style="padding-bottom: 100px;" class="mb-5">
		<div class="col-1 mr-3" style="width: 150px; heigjt: 100px; background-color: #E6E6E6; padding-bottom: 300px;"></div>
		<div class="col-10" id="card1">

			<div class="row mt-3 d-flex justify-content-center">
				<div class="form-group mr-3">
					<input style="width: 300px;" type="text" class="form-control" placeholder="price" id="price">
				</div>
				<div class="form-group ml-3">
					<input style="width: 300px;" type="text" class="form-control" placeholder="discountpercentage" id="discountpercentage">
				</div>
				<br />
				<div class="form-group mr-3">
					<input style="width: 300px;" type="text" class="form-control" placeholder="title" id="price">
				</div>
				<div class="form-group ml-3">
					<input style="width: 300px;" type="text" class="form-control" placeholder="....." id="discountpercentage">
				</div>

			</div>
			<hr />
			<div class="row mt-3 d-flex justify-content-center">
				Filter <select name="" class="form-control mx-1 mt-2">
					<option value="전체">유선</option>
					<option value="전공">무선</option>
				</select>
			</div>

			<div id="search_search">
				<form method="get" action="./productpageindex.jsp" class="form-inline mt-3">
					<select name="searchType" class="form-control mx-1 mt-2">

						<option value="b">제품명</option>

						<option value="c">c</option>

					</select> <input "type="text" name="searcha" class="form-control mx-1 mt-2" value="" placeholder="찾고 싶은 상품을 검색해보세요." style="width: 250px; height: 38px; font-size: 15px;">

					<button type="submit" class="btn btn-primary mx-1 mt-2">조회</button>

				</form>
			</div>


			<div class="ml-5 mt-3 d-flex justify-content-center">
				<button style="width: 200px; height: 40px" class="btn btn-outline-primary mr-5 ml-2 mb-3">검색</button>
			</div>


		</div>
		<div class="col-1 ml-3" style="width: 150px; heigjt: 100px; background-color: #E6E6E6; padding-bottom: 300px;"></div>
	</div>







	<div class="scroll type2 row d-flex justify-content-between" style="overflow: auto;">



		<div class="col d-flex justify-content-center mb-4" style="margin-left: 280px;">

			
		</div>



	</div>
	
	<span class="d-flex justify-content-center"></span>

	
</div>
<!-- justify-content-center 부트스트랩 flex 정렬할때 문법 -->



<div class="col-12 d-flex justify-content-between" style="padding-bottom: 100px;" class="mb-5">
	<div class="col-12 ml-3">
		<div id="demo" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="https://images.wallpaperscraft.com/image/single/spruce_branches_balls_229216_6000x4000.jpg" alt="Los Angeles" width="1100" height="500">
				</div>
				<div class="carousel-item">
					<img src="https://images.wallpaperscraft.com/image/single/field_trees_stone_229175_1280x720.jpg" alt="Chicago" width="1100" height="500">
				</div>
				<div class="carousel-item">
					<img src="https://images.wallpaperscraft.com/image/single/anime_school_winter_street_674_1280x720.jpg" alt="New York" width="1100" height="500">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next"> <span class="carousel-control-next-icon"></span>
			</a>
		</div>


	</div>
</div>


<%@ include file="layout/footer.jsp"%>