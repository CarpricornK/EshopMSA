<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="layout/Productheader2.jsp"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/style1a.css">




<script src="https://use.fontawesome.com/releases/v5.6.0/js/all.js"></script>


<form method="get" action="./productfavorite" class="form-inline mt-5 d-flex justify-content-center">
	<button style="background-color: white; border: none" name="type" type="submit" value="1">
		<i class="fas fa-bars fa-lg"></i>
	</button>
	<button style="background-color: white; border: none" name="type" type="submit" value="2">
		<i class="fas fa-grip-lines fa-lg"></i>
	</button>

	<button style="background-color: white; border: none" name="type" type="submit" value="3">
		<!-- 	<i class="fab fa-centos "></i> -->
		<!-- 	<i class="fas fa-cogs fa-lg"></i> -->
		<i class="fas fa-cog fa-lg"></i>
	</button>

	<button style="background-color: white; border: none" name="type" type="submit" value="4">
		<i class="fas fa-chart-bar fa-lg"></i>
	</button>
</form>




<div class="container-fluid">
	<form method="get" action="./productfavorite?chkbox=fm&chkbox=fm&total_sum=fm" class="form-inline mt-5 d-flex justify-content-center">


		<c:if test="${param.type == 1}">
			<table class="table table-hover">
				<thead>
					<th style="text-align: center;">✔</th>
					<th style="width: 230px; text-align: center;">원가</th>
					<th style="width: 100px; text-align: center;">할인(%)</th>
					<th style="width: 100px; text-align: center;">배송료</th>
					<th style="width: 100px; text-align: center;">주문수량</th>
					<th style="width: 300px; text-align: center;">주소/제목</th>
					<th style="width: 100px; text-align: center;">건의사항</th>
					<th style="width: 130px; text-align: center;">주문한 사람</th>
					<th style="text-align: center;">합계</th>
					<th style="width: 120px; text-align: center;">배송</th>
				</thead>


				<!-- 		<form name="form"> -->
				<c:forEach var="favorite" items="${favorites.content}">
					<c:if test="${favorite.username==principal.user.username}">
						<tbody>


							<tr>
								<td><c:if test="${favorite.delivery==0}">
										<div style="width: 25px; background-color: #F2F2F2; border: 0.5px solid #6E6E6E; border-radius: 5px;" class="d-flex justify-content-center mt-1 pt-1 pb-1">
											<input name="chkbox" type="checkbox"
												value="${(favorite.price-(favorite.price/100*favorite.discountpercentage-(favorite.price/100*favorite.discountpercentage)%1)-favorite.fee)*favorite.ordercount}"
												onClick="itemSum(this.form);"> <input name="chkbox" type="hidden"
												value="${(favorite.price-(favorite.price/100*favorite.discountpercentage-(favorite.price/100*favorite.discountpercentage)%1)-favorite.fee)*favorite.ordercount}"
												onClick="itemSum(this.form);">
										</div>
									</c:if></td>
								<td style="text-align: center;">${favorite.img1}<span style="color: #D8D8D8; text-decoration: line-through;">${favorite.price}￦</span>💨<fmt:formatNumber value="${(favorite.price-(favorite.price/100*favorite.discountpercentage-(favorite.price/100*favorite.discountpercentage)%1)-favorite.fee)}" pattern="#,###" />￦
								</td>
								<td>${favorite.discountpercentage}%</td>
								<td>${favorite.fee}</td>
								<td>${favorite.ordercount}</td>
								<td style="text-align: center;">${favorite.orderaddress}
									<hr /> ${favorite.title}
								</td>
								<td>${favorite.ordercontent}</td>
								<td>${favorite.username}</td>
								<td><span style="color: #D8D8D8; font-size: 12px; text-decoration: line-through;">${favorite.price}￦</span> <br /> <a style="color: #FF0000; font-size: 10px;">-${favorite.discountpercentage}%</a>
									<a class="ml-1" style="color: #FF0000; font-size: 10px;">- ${favorite.fee}￦</a> <c:if test="${favorite.discountpercentage!=0}">
										<p><fmt:formatNumber value="${(favorite.price-(favorite.price/100*favorite.discountpercentage-(favorite.price/100*favorite.discountpercentage)%1)-favorite.fee)}" pattern="#,###" />￦</p>
									</c:if> <c:if test="${favorite.discountpercentage==0}">
										<p>${favorite.price-favorite.fee}￦</p>
									</c:if></td>

								<td style="width: 100px; text-align: center;"><c:if test="${favorite.delivery==0}">
										<span>결제 대기중</span>
									</c:if> <c:if test="${favorite.delivery==1}">
										<span>배송중...</span>
									</c:if> <c:if test="${favorite.delivery==2}">
										<span>배송완료</span>
									</c:if></td>
							</tr>
						</tbody>
					</c:if>




				</c:forEach>
			</table>
		</c:if>



		<!-- ============= 기본으로 보여주는 화면 ↑============== -->


		<c:if test="${param.type == 2}">
			<table class="table table-hover">
				<thead>
					<th style="text-align: center;">✔</th>
					<th style="width: 230px; text-align: center;">원가</th>
					<th style="width: 100px; text-align: center;">할인(%)</th>
					<th style="width: 100px; text-align: center;">배송료</th>
					<th style="width: 100px; text-align: center;">주문수량</th>
					<th style="width: 300px; text-align: center;">주소/제목</th>
					<th style="width: 100px; text-align: center;">건의사항</th>
					<th style="width: 130px; text-align: center;">주문한 사람</th>
					<th style="text-align: center;">합계</th>
					<th style="width: 120px; text-align: center;">배송</th>
				</thead>


				<!-- 		<form name="form"> -->
				<c:forEach var="favorite" items="${favorites.content}">
					<c:if test="${favorite.username==principal.user.username}">
						<tbody>


							<tr>
								<td><c:if test="${favorite.delivery==0}">
										<div style="width: 25px; background-color: #F2F2F2; border: 0.5px solid #6E6E6E; border-radius: 5px;" class="d-flex justify-content-center mt-1 pt-1 pb-1">
											<input name="chkbox" type="checkbox"
												value="${(favorite.price-(favorite.price/100*favorite.discountpercentage-(favorite.price/100*favorite.discountpercentage)%1)-favorite.fee)*favorite.ordercount}"
												onClick="itemSum(this.form);">
										</div>
										<input name="chkbox" type="hidden"
											value="${(favorite.price-(favorite.price/100*favorite.discountpercentage-(favorite.price/100*favorite.discountpercentage)%1)-favorite.fee)*favorite.ordercount}"
											onClick="itemSum(this.form);">
									</c:if></td>
								<td style="text-align: center;"><span style="color: #D8D8D8; text-decoration: line-through;">${favorite.price}원</span>💨<fmt:formatNumber value="${(favorite.price-(favorite.price/100*favorite.discountpercentage-(favorite.price/100*favorite.discountpercentage)%1)-favorite.fee)}" pattern="#,###" />￦
								
								</td>
								<td>${favorite.discountpercentage}%</td>
								<td>${favorite.fee}</td>
								<td>${favorite.ordercount}</td>
								<td style="text-align: center;">${favorite.orderaddress}
									<hr /> ${favorite.title}
								</td>
								<td>${favorite.ordercontent}</td>
								<td>${favorite.username}</td>
								<td><span style="color: #D8D8D8; font-size: 12px; text-decoration: line-through;">${favorite.price}원</span> <br /> <a style="color: #FF0000; font-size: 10px;">-${favorite.discountpercentage}%</a>
									<a class="ml-1" style="color: #FF0000; font-size: 10px;">-${favorite.fee}￦</a> <c:if test="${favorite.discountpercentage!=0}">
										<p><fmt:formatNumber value="${(favorite.price-(favorite.price/100*favorite.discountpercentage-(favorite.price/100*favorite.discountpercentage)%1)-favorite.fee)}" pattern="#,###" />￦</p>
									</c:if> <c:if test="${favorite.discountpercentage==0}">
										<p>${favorite.price-favorite.fee}￦</p>
									</c:if></td>
								<td style="width: 100px; text-align: center;"><c:if test="${favorite.delivery==0}">
										<span>결제 대기중</span>
									</c:if> <c:if test="${favorite.delivery==1}">
										<span>배송중...</span>
									</c:if> <c:if test="${favorite.delivery==2}">
										<span>배송완료</span>
									</c:if></td>
							</tr>
						</tbody>
					</c:if>
				</c:forEach>
			</table>
		</c:if>

		<!-- ============= type 파라미터 2 (이미지 제거)일떄 보여주는 화면 ↑============== -->





		<c:if test="${param.type == 3 || param.type2 == 1}">
			<form method="get" action="./productfavorite" target="param" class="form-inline mt-5 d-flex justify-content-center">
				<button style="background-color: white; border: none" name="type2" type="submit" value="1">
					<i class="fas fa-angle-double-up"></i>
				</button>
				<button style="background-color: white; border: none" name="type" type="submit" value="3">
					<i class="fas fa-angle-double-down"></i>
				</button>
			</form>


			<table class="table table-hover">
				<thead>
					<th style="text-align: center;">✔</th>
					<th style="text-align: center;">원가</th>
					<th style="width: 100px; text-align: center;">할인(%)</th>
					<th style="width: 100px; text-align: center;">배송료</th>
					<th style="width: 100px; text-align: center;">주문수량</th>
					<th style="text-align: center;">주소/제목</th>
					<th style="width: 100px; text-align: center;">건의사항</th>
					<th>주문한 사람</th>
					<th style="width: 100px; text-align: center;">합계</th>
					<th style="width: 100px; text-align: center;">배송</th>
				</thead>

				<c:if test="${null eq param.type2}">
					<!-- 		<form name="form"> -->
					<c:forEach var="favorite" items="${favorites.content}">

						<c:if test="${favorite.adminusername==principal.user.username}">
							<tbody>
							
								<tr>
									<td style="color: red; font-size: 12px;">
								       <c:forEach var="productidid" items="${productboards2}">
											<c:if test="${favorite.productido==productidid.id }">
									${productidid.title}
									</c:if>
										</c:forEach></td>
									<td style="text-align: center;">${favorite.price}￦</td>
									<td>${favorite.discountpercentage}%</td>
									<td>${favorite.fee}</td>
									<td>${favorite.ordercount}</td>
									<td style="text-align: center;">${favorite.orderaddress}
										<hr /> ${favorite.title}
									</td>
									<td>${favorite.ordercontent}</td>
									<td>${favorite.username}<a style="color: red;">&nbsp;에게주문받음</a></td>
									<td style="color: red; font-size: 11px;">관리자</td>
									<td style="width: 100px; text-align: center;"><c:if test="${favorite.delivery==0}">
											<button style="height: 25px;" onClick="index.deliveryupdate(${favorite.id},${favorite.delivery+1})" class="badge mt-1 ml-1">결제확인</button>
										</c:if> <c:if test="${favorite.delivery==1}">
											<button style="height: 25px;" onClick="index.deliveryupdate(${favorite.id},${favorite.delivery+1})" class="badge mt-1 ml-1 pr-3 pl-3">배송완료</button>
											<button style="height: 25px;" onClick="index.deliveryupdate(${favorite.id},${favorite.delivery-1})" class="badge mt-1 ml-1">결제확인취소</button>
										</c:if> <c:if test="${favorite.delivery==2}">
											<button style="height: 25px;" onClick="index.deliveryupdate(${favorite.id},${favorite.delivery-1})" class="badge mt-1 ml-1">배송완료취소</button>
										</c:if></td>
								</tr>
								
								
							
								
								
							</tbody>
						</c:if>
					</c:forEach>
				</c:if>

				<c:if test="${param.type2 == 1}">
					<!-- 		<form name="form"> -->
					<c:forEach var="favorite" items="${favorites2}">

						<c:if test="${favorite.adminusername==principal.user.username}">
							<tbody>
								<tr>
									<td style="color: red; font-size: 12px;">-관리자-</td>
									<td style="text-align: center;">${favorite.price}￦</td>
									<td>${favorite.discountpercentage}%</td>
									<td>${favorite.fee}</td>
									<td>${favorite.ordercount}</td>
									<td style="text-align: center;">${favorite.orderaddress}
										<hr /> ${favorite.title}
									</td>
									<td>${favorite.ordercontent}</td>
									<td>${favorite.username}<a style="color: red;">&nbsp;에게주문받음</a></td>
									<td style="color: red; font-size: 11px;">관리자</td>
									<td style="width: 100px; text-align: center;"><c:if test="${favorite.delivery==0}">
											<button style="height: 25px;" onClick="index.deliveryupdate(${favorite.id},${favorite.delivery+1})" class="badge mt-1 ml-1">결제확인</button>
										</c:if> <c:if test="${favorite.delivery==1}">
											<button style="height: 25px;" onClick="index.deliveryupdate(${favorite.id},${favorite.delivery+1})" class="badge mt-1 ml-1 pr-3 pl-3">배송완료</button>
											<button style="height: 25px;" onClick="index.deliveryupdate(${favorite.id},${favorite.delivery-1})" class="badge mt-1 ml-1">결제확인취소</button>
										</c:if> <c:if test="${favorite.delivery==2}">
											<button style="height: 25px;" onClick="index.deliveryupdate(${favorite.id},${favorite.delivery-1})" class="badge mt-1 ml-1">배송완료취소</button>
										</c:if></td>
								</tr>
							</tbody>
						</c:if>
					</c:forEach>
				</c:if>


			</table>
		</c:if>

		<!-- ============= type 파라미터 3일떄 보여주는 화면 ↑============== -->



		<div class="container-xl">

			<c:if test="${param.type == 4}">
				<script nonce="undefined" src="https://cdn.zingchart.com/zingchart.min.js"></script>
				<style>
#myChart {
	height: 350px;
	width: 100%;
}

#myChart1 {
	height: 300px;
	width: 100%;
}

#myChart2 {
	height: 300px;
	width: 100%;
	min-height: 150px;
}

#myChart3 {
	height: 350px;
	width: 100%;
}

#myChart4 {
	height: 350px;
	width: 100%;
	min-height: 150px;
}

#myChart5 {
	height: 300px;
	width: 100%;
	min-height: 150px;
}

.chart--container {
	min-height: 530px;
	width: 100%;
	height: 100%;
}

.zc-ref {
	display: none;
}
</style>


				<div class="col-14 d-flex justify-content-center p-5">

					<div class="col-7">
						<div style="box-shadow: 10px 15px 15px #E4E2E2; border-radius: 10px;" class="col-11" id='myChart1'>
							<span class="d-flex justify-content-center"></span>
						</div>

						<div class='row mt-5'>
							<div style="box-shadow: 10px 15px 15px #E4E2E2; border-radius: 10px;" class="col-5 mr-4" id='myChart3'>
								<span class="d-flex justify-content-center">전체 제품글 게시 현황</span>
							</div>

							<div style="box-shadow: 10px 15px 15px #E4E2E2; border-radius: 10px;" class="col-5" id='myChart4'>
								<span class="d-flex justify-content-center">전체 사이트 유저수 현황</span>
							</div>
						</div>
					</div>


					<div class="col-7">
						<div style="box-shadow: 10px 15px 15px #E4E2E2; border-radius: 10px;" class="col-12" id='myChart'>
							<span class="d-flex justify-content-center">배송 현황</span>
						</div>

						<div style="box-shadow: 10px 15px 15px #E4E2E2; border-radius: 10px;" class="col-12 mt-5" id='myChart2'>
							<span class="d-flex justify-content-center">🟦유선 & 🟥무선 판매율</span>
						</div>

					</div>
				</div>



				<!-- ==================수요 계산식====================== -->
				<c:set var="total" value="0" />
				<c:forEach var="result" items="${favorites2}" varStatus="status">
					<c:if test="${result.adminusername==principal.user.username}">
						<c:set var="total" value="${total + result.price}" />
					</c:if>
				</c:forEach>


				<c:set var="total2" value="0" />
				<c:forEach var="result2" items="${favorites2}" varStatus="status">
					<c:if test="${result2.adminusername==principal.user.username}">
						<c:if test="${result2.delivery == 2}">
							<c:set var="total2" value="${total2 + result2.price}" />
						</c:if>
					</c:if>
				</c:forEach>

				<!-- ==================수요 계산식====================== -->





				<!-- ==================배송 현황 계산식====================== -->
				<c:set var="totald1" value="0" />
				<c:forEach var="resultd1" items="${favorites2}" varStatus="status">
					<c:if test="${resultd1.adminusername==principal.user.username}">
						<c:if test="${resultd1.delivery == 1}">
							<c:set var="totald1" value="${totald1 + 1}" />
						</c:if>
					</c:if>
				</c:forEach>


				<c:set var="totald3" value="0" />
				<c:forEach var="resultd3" items="${favorites2}" varStatus="status">
					<c:if test="${resultd3.adminusername==principal.user.username}">
						<c:if test="${resultd3.delivery == 0}">
							<c:set var="totald3" value="${totald3 + 1}" />
						</c:if>
					</c:if>
				</c:forEach>


				<c:set var="totald2" value="0" />
				<c:forEach var="resultd2" items="${favorites2}" varStatus="status">
					<c:if test="${resultd2.adminusername==principal.user.username}">
						<c:if test="${resultd2.delivery == 2}">
							<c:set var="totald2" value="${totald2 + 1}" />
						</c:if>
					</c:if>
				</c:forEach>


				<!-- ==================배송 현황 계산식====================== -->


				<script>
   let chartConfig = {
		   type: 'hbar',
		   fontFamily: 'Arial',
		   title: {
		     text: 'Sales Status',
		     backgroundColor: 'none',
		     fontColor: '#3A3838',
		     fontFamily: 'Arial',
		     fontSize: '16px'
		   },
		   plot: {
		     animation: {
		       delay: 300,
		       effect: 'ANIMATION_EXPAND_TOP',
		       method: 'ANIMATION_LINEAR',
		       sequence: 'ANIMATION_BY_PLOT_AND_NODE',
		       speed: '500'
		     },
		     barsOverlap: '100%',
		     borderRadius: '8px',
		     hoverState: {
		       visible: false
		     }
		   },
		   plotarea: {
		     margin: '60px 70px 30px 80px'
		   },
		   scaleX: {
		     values: ['🟥', '🟩'],
		     guide: {
		       visible: false
		     },
		     item: {
		       paddingRight: '20px',
		       autoAlign: true,
		       fontSize: '14px',
		       rules: [
		         {
		           fontColor: '#FA8452',
		           rule: '%i==0'
		         },
		         {
		           fontColor: '#FCAE48',
		           rule: '%i==1'
		         }
		       ]
		     },
		     lineColor: 'none',
		     tick: {
		       visible: false
		     }
		   },
		   scaleY: {
		     guide: {
		       visible: false
		     },
		     visible: false
		   },
		   labels: [
		     {
		       text: '🟥 현재 수익',
		       fontColor: '#E92323',
		       fontSize: '10px',
		       x: '27.5%',
		       y: '10%'
		     },
		     {
		       text: '🟩 전체 판매 예상 수익',
		       fontColor: '#A0BE4A',
		       fontSize: '10px',
		       x: '4%',
		       y: '10%'
		     }
		   ],
		   shapes: [
		     
		   ],


		   series: [
		     {
		       values: [<c:out value="${total2}"/>, <c:out value="${total}"/>],
		       tooltip: {
		         visible: false
		       },
		       backgroundColor: '#f2f2f2',
		       barWidth: '30px',
		       borderColor: '#e8e3e3',
		       borderWidth: '2px',
		       fillAngle: 90
		     },
		     {
		       values: [
		    	   <c:out value="${total2}"/>
		    	   , 
		    	   <c:out value="${total}"/>
],
		       valueBox: {
		         text: '%v ￦',
		         alpha: 0.6,
		         decimals: 0,
		         fontColor: '#A4A4A4',
		         fontSize: '9px',
		         placement: 'top-out'
		       },
		       barWidth: '32px',
		       maxTrackers: 0,
		       rules: [
		         {
		           backgroundColor: '#A0BE4A',
		           rule: '%i==1'
		         },
		         {
		           backgroundColor: '#6FA6DF',
		           rule: '%i==2'
		         }
		       ]
		     }
		   ]
		 };

		 zingchart.render({
		   id: 'myChart1',
		   data: chartConfig,
		   height: '100%',
		   width: '100%',
		 });
  
				
  </script>

				<c:forEach var="productboard" items="${favorites2}">
					<c:if test="${'유선' eq productboard.type}">
						<c:set var="count" value="${count+1}" />

					</c:if>
				</c:forEach>
				<c:forEach var="productboarda" items="${favorites2}">
					<c:if test="${'무선' eq productboarda.type}">
						<c:set var="count2" value="${count2+1}" />

					</c:if>
				</c:forEach>
				<script>
var myConfig = {
  "type": "ring",
  "title": {
	  "text": ""
  },
  "plot": {
    //Use the "slice" attribute to adjust the size of the donut ring.
  },

  "series": [
    {
        "values": [
        
		${count}
        ]
    },
    {
        "values": [
        	
       
        ${count2}
        	
        	]
    }
  ]
};
 
zingchart.render({
  id: 'myChart2',
  data: myConfig,
  height: "70%",
  width: "100%"
});

</script>

				<script>
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];
    var myConfig = {
    		"type": "line",
    	      "plot": {
    	          "exact": 1,
    	          "shadow": 1,
    	          "alpha": 1,
    	          "shadow-distance": 1,
    	          "stacked": 0,
    	          "line-width": 2,
    	          "slice-start": 15,
    	          "value-box": {
    	            "visible": 0
    	          },
    	          "animation": {
    	            "effect": "1",
    	            "speed": "15000",
    	            "method": "5",
    	            "sequence": "1"
    	          },
    	        },
    	        "shapes": [{
    	          "type": "rect",
    	          "id": "animation1",
    	          "width": "100",
    	          "height": "30",
    	          "background-color": "#FFFFFF #FFFFFF",
    	          "border-radius": "10px",
    	          "x": "50px",
    	          "y": "15px",
    	          "label": {
    	            "text": "",
    	            "font-color": "#fff"
    	          }
    	        }],
    	      "series": [{
    	        "values": [
    	        	['2021-12-20',0],
    	          <c:forEach var="productboard" items="${productboards2}">
    	           	['<fmt:formatDate value="${productboard.createDate}" pattern="yyyy-MM-dd" />', <c:out value="${productboard.id}"/>],
    	          </c:forEach>
    	        ]
    	      }]
    	    };
 
    zingchart.render({
      id: 'myChart3',
      data: myConfig,
      height: "100%",
      width: "100%"
    });
  </script>

				<script>
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "b55b025e438fa8a98e32482b5f768ff5"];
    var myConfig = {
      "type": "bar",
      "plot": {
          "exact": 1,
          "shadow": 1,
          "alpha": 1,
          "shadow-distance": 1,
          "stacked": 0,
          "line-width": 2,
          "slice-start": 15,
          "value-box": {
            "visible": 0
          },
          "animation": {
            "effect": "3",
            "speed": "10000",
            "method": "5",
            "sequence": "1"
          },
        },
        "shapes": [{
          "type": "rect",
          "id": "animation1",
          "width": "100",
          "height": "30",
          "background-color": "none none",
          "border-radius": "10px",
          "x": "50px",
          "y": "15px",
          "label": {
            "text": "",
            "font-color": "#fff"
          }
        }],
      "series": [{
        "values": [
          <c:forEach var="users" items="${users}">
           	['<fmt:formatDate value="${users.createDate}" pattern="yyyy-MM-dd" />', <c:out value="${users.id}"/>],
          </c:forEach>
        ]
      }]
    };
 
    zingchart.render({
      id: 'myChart4',
      data: myConfig,
      height: "100%",
      width: "100%"
    });
  </script>





				<script>
				window.feed = function(callback) {
					  var tick = {};
					  tick.plot0 = Math.ceil(350 + (Math.random() * 500));
					  callback(JSON.stringify(tick));
					};
					 
					var myConfig = {
					  type: "gauge",
					  globals: {
					    fontSize: 25
					  },
					  plotarea: {
					    marginTop: 80,
					    marginRight: 30
					  },
					  plot: {
					    size: '100%',
					    valueBox: {
					      placement: 'center',
					      text: '%v', //default
					      fontSize: 22,
					      rules: [
					    	{
					          rule: '%v >= ${(totald1+totald2)/2}',
					          text: '%v<br>반이상 하셨네요!'
					        },
					        
					    	{
						          rule: '%v >= ${totald1+totald2}',
						          text: '%v<br>수고하셨습니다!'
						     },
					        
					        {
					          rule: '%v <  ${(totald1+totald2)/2}',
					          text: '%v<br>일해주세요...'
					        }
					      ]
					    }
					  },
					  tooltip: {
					    borderRadius: 5
					  },
					  scaleR: {
					    aperture: 180,
					    minValue: 0,
					    maxValue: ${totald1+totald2},
					    step: ${(totald1+totald2)/2},
					    center: {
					      visible: false
					    },
					    tick: {
					      visible: false
					    },
					    item: {
					      offsetR: 0,
					      rules: [{
					        rule: '%i == 9',
					        offsetX: 15
					      }]
					    },
					    labels: ['0','${(totald1+totald2)/2}','${totald1+totald2}'],
					    ring: {
					      size: 50,
					      rules: [{
					          rule: '%v <= ${(totald1+totald2)/2}',
					          backgroundColor: '#E53935'
					        },
					        {
					          rule: '%v >= ${(totald1+totald2)/2}',
					          backgroundColor: '#29B6F6'
					        }
					      ]
					    }
					  },
					  series: [{
					    values: [${totald2}], // starting value
					    backgroundColor: '#3A3A3A',
					    indicator: [5, 5, 5, 5, 0.65],
					    animation: {
					      effect: 2,
					      method: 1,
					      sequence: 4,
					      speed: 900
					    },
					  }]
					};
					 
					zingchart.render({
					  id: 'myChart',
					  data: myConfig,
					  height: 400,
					  width: '100%'
					});

  </script>

배송완료${totald2}-배송중${totald1}-결제대기중${totald3}



			</c:if>
		</div>


		<!-- ============= type 파라미터 4 (차트)일떄 보여주는 화면 ↑============== -->













</div>
<c:if test="${param.type == 1 || param.type == 2}">
	<div style="width: 100%;" class="gradient-border d-flex justify-content-end p-1" id="box">
		<div class="row mr-3">
					<span style="margin-top: 4px; font-family: 'Jua', sans-serif; color: white;" class="">합계(￦) :
					<input class="btn" id="name" class="mr-3" style="margin-top:-2px; height: 30px; border: none; color: white; font-family: 'Jua', sans-serif;" name="total_sum" type="text" size="8" readonly>
						<!-- 	1D1F20 -->
					</span>
					<span style="margin-right: 100px;" class="circle" aria-hidden="true"> <span class="icon arrow"></span>
					</span>

		</div>
	</div>
</c:if>
</form>

<button  style="position: absolute; right: 10px; margin-top: -37px;" id="button1" onclick="requestPay()" class="learn-more">
	<span class="button-text">결제하기</span>
</button>













<%--<ul class="pagination justify-content-center mt-5">--%>

<%--	<c:choose>--%>
<%--		<c:when test="${favorites.first}">--%>
<%--			<li class="page-item disabled"><a class="page-link" href="?page=${favorites.number-1}">Previous</a></li>--%>
<%--		</c:when>--%>
<%--		<c:otherwise>--%>
<%--			<li class="page-item"><a class="page-link" href="?page=${favorites.number-1}">Previous</a></li>--%>
<%--		</c:otherwise>--%>
<%--	</c:choose>--%>

<%--	<c:if test="${favorites.number<9}">--%>
<%--		<c:forEach var="i" begin="0" end="9">--%>
<%--			<li class="page-item"><a id="moveMove" class="page-link" href="?page=${i}"> ${i+1} </a></li>--%>
<%--		</c:forEach>--%>
<%--	</c:if>--%>

<%--	<c:if test="${favorites.number>=9}">--%>
<%--		<c:forEach var="i" begin="${favorites.number-5}" end="${(favorites.number+5)}">--%>
<%--			<li class="page-item"><a class="page-link" href="?page=${i}"> ${i+1} </a></li>--%>
<%--		</c:forEach>--%>
<%--	</c:if>--%>




<%--	<c:choose>--%>
<%--		<c:when test="${favorites.last}">--%>
<%--			<li class="page-item disabled"><a class="page-link" href="?page=${favorites.number+1}">Next</a></li>--%>
<%--		</c:when>--%>

<%--		<c:otherwise>--%>
<%--			<li class="page-item"><a class="page-link" href="?page=${favorites.number+1}">Next</a></li>--%>
<%--		</c:otherwise>--%>
<%--	</c:choose>--%>

<%--</ul>--%>

<%--<span class="d-flex justify-content-center">-${(favorites.number+1)}-</span>--%>

<%--<c:if test="${favorites.totalPages<=favorites.number}">--%>
<%--	<span class="d-flex justify-content-center mt-1"> <a style="color: red; font-size: 14px;" href="?page=${favorites.totalPages-1}">이페이지는 아직 사용되어있지 않습니다(누르면 마지막 페이지로--%>
<%--			돌아갑니다-${favorites.totalPages}-)</a>--%>
<%--	</span>--%>
<%--</c:if>--%>



<script language="javascript">
	function itemSum(frm) {
		var sum = 0;
		var count = frm.chkbox.length;
		for (var i = 0; i < count; i++) {
			if (frm.chkbox[i].checked == true) {
				sum += parseInt(frm.chkbox[i].value);
			}
		}
		frm.total_sum.value = sum;
	}

</script>












<%@ include file="layout/footer.jsp"%>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>


	<script>
		function requestPay() {
			console.log("sub");

		var IMP = window.IMP; // 생략가능
		IMP.init('imp21157614'); // 가맹점 식별 코드

		IMP.request_pay({
			pg : 'html5_inicis', // 결제방식
			pay_method : 'card', // 결제 수단
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문명: 결제 테스트', // order 테이블에 들어갈 주문명 혹은 주문 번호
			amount : '82370', // 결제 금액
			buyer_email : '', // 구매자 email
			buyer_name : 'TATAC', // 구매자 이름
			buyer_tel : '123-1532-3634', // 구매자 전화번호
			buyer_addr : '', // 구매자 주소
			buyer_postcode : '', // 구매자 우편번호
			m_redirect_url : '/khx/payEnd.action' // 결제 완료 후 보낼 컨트롤러의 메소드명
		}, function(rsp) {
			if (rsp.success) { // 성공시
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else { // 실패시
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
		});
		}
	</script>




<script src="/js/board.js"></script>
