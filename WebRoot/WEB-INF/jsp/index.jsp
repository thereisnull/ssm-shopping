<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <title>首页</title>

  <link href="${pageContext.request.contextPath}/static/css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/static/css/grid.css" media="screen" rel="stylesheet" type="text/css">

</head>
<body>
  <%@ include file="header.jsp" %>

  <div class="clear"></div>

  <div class="container_12">
    <div class="grid_12">
        <div class="slidprev"><span>Prev</span></div>
        <div class="slidnext"><span>Next</span></div>
        <div id="slider">
          <div id="slide1">
            <img src="static/images/content/b1.png" alt="" title="" />
          </div>

          <div id="slide2">
            <img src="static/images/content/b2.jpg" alt="" title="" />
          </div>

          <div id="slide3">
            <img src="static/images/content/b3.jpg" alt="" title="" />
          </div>
        </div><!-- .slider -->
        <div id="myController">
          <div class="control"><span>1</span></div>
          <div class="control"><span>2</span></div>
          <div class="control"><span>3</span></div>
        </div>


    </div><!-- .grid_12 -->
  </div><!-- .container_12 -->

  <div class="clear"></div>

  <section id="main" class="home">
    <div class="container_12">
      <div id="top_button">
        <div class="grid_4">
          <a href="#" class="button_block best_price">
            <img src="static/images/banner1.png" alt="Banner 1"/>
          </a><!-- .best_price -->
        </div><!-- .grid_4 -->

        <div class="grid_4">
          <a href="#" class="button_block new_smells">
            <img src="static/images/banner2.png" alt="Banner 2"/>
          </a><!-- .new smells -->
        </div><!-- .grid_4 -->

        <div class="grid_4">
          <a href="#" class="button_block only_natural">
            <img src="static/images/banner3.png" alt="Banner 3"/>
          </a><!-- .only_natural -->
        </div><!-- .grid_4 -->

        <div class="clear"></div>
      </div><!-- #top_button -->

      <div class="clear"></div>

      <div class="carousel">
        <div class="c_header">
          <div class="grid_10">
            <h2>今日热卖</h2>
          </div><!-- .grid_10 -->

          <div class="grid_2">
            <a id="next_c1" class="next arows" href="#"><span>Next</span></a>
            <a id="prev_c1" class="prev arows" href="#"><span>Prev</span></a>
           </div><!-- .grid_2 -->
        </div><!-- .c_header -->

        <div class="list_carousel">

        <ul id="list_product" class="list_product">
        <c:forEach var="item" items="${productTop }">
          <li class="">
            <div class="grid_3 product">
              <img class="sale" src="static/images/top.png" alt="Sale"/>
              <div class="prev">
                <a href="${pageContext.request.contextPath}/product?pid=${item.pid }"><img src="${item.img1}" alt="" title="" /></a>
              </div><!-- .prev -->
              <h3 class="title">${item.pname }</h3>
              <div class="cart">
                <div class="price">
                <div class="vert">
					<div class="price_new">￥<fmt:formatNumber type="number" value="${item.price/100.0 }" pattern="0.00" maxFractionDigits="2"/>  </div>
					<div class="price_old">￥ <fmt:formatNumber type="number" value="${item.olderprice/100.0 }" pattern="0.00" maxFractionDigits="2"/></div>
                </div>
                </div>
                <a href="#" class="obn"></a>
                <a href="#" class="like"></a>
                <a href="#" class="bay"><input type="hidden" value="${item.pid }"/></a>
              </div><!-- .cart -->
            </div><!-- .grid_3 -->
          </li>
		</c:forEach>
          

        </ul><!-- #list_product -->
        </div><!-- .list_carousel -->
      </div><!-- .carousel -->

      <div class="carousel">
        <div class="c_header">
          <div class="grid_10">
            <h2>特色产品</h2>
          </div><!-- .grid_10 -->

          <div class="grid_2">
            <a id="next_c2" class="next arows" href="#"><span>Next</span></a>
            <a id="prev_c2" class="prev arows" href="#"><span>Prev</span></a>
          </div><!-- .grid_2 -->
        </div><!-- .c_header -->

        <div class="list_carousel">
        <ul id="list_product2" class="list_product">
        <c:forEach var="item" items="${productSpe }">
          <li class="">
            <div class="grid_3 product">
              <img class="sale" src="static/images/sale.png" alt="Sale"/>
              <div class="prev">
                <a href="${pageContext.request.contextPath}/product?pid=${item.pid }"><img src="${item.img1 }" alt="" title="" /></a>
              </div><!-- .prev -->
              <h3 class="title">${item.pname }</h3>
              <div class="cart">
                <div class="price">
                <div class="vert">
					<div class="price_new">￥<fmt:formatNumber type="number" value="${item.price/100.0 }" pattern="0.00" maxFractionDigits="2"/>  </div>
					<div class="price_old">￥ <fmt:formatNumber type="number" value="${item.olderprice/100.0 }" pattern="0.00" maxFractionDigits="2"/></div>
                </div>
                </div>
                <a href="#" class="obn"></a>
                <a href="#" class="like"></a>
                <a href="#" class="bay"><input type="hidden" value="${item.pid }" /></a>
              </div><!-- .cart -->
            </div><!-- .grid_3 -->
          </li>
		</c:forEach>

        </ul><!-- #list_product2 -->
        </div><!-- .list_carousel -->
      </div><!-- .carousel -->

    </div><!-- .container_12 -->
  </section><!-- #main -->

  <div class="clear"></div>

<%@ include file="footer.jsp" %>
<script>
	$(document).ready(function(){
		/* 引用jQuery的滑动插件，实现轮播 */
	    $("#myController").jFlow({
			controller: ".control", // must be class, use . sign
			slideWrapper : "#jFlowSlider", // must be id, use # sign
			slides: "#slider",  // the div where all your sliding divs are nested in
			selectedWrapper: "jFlowSelected",  // just pure text, no sign
			width: "984px",  // this is the width for the content-slider
			height: "480px",  // this is the height for the content-slider
			duration: 400,  // time in miliseconds to transition one slide
			prev: ".slidprev", // must be class, use . sign
			next: ".slidnext", // must be class, use . sign
			auto: true
    });
  });
  </script>
  <script>
	$(function() {
		/* carouFredSel 使用jQuery bootstrap 开源代码实现点击切换 旋转木马效果*/
	  $('#list_product').carouFredSel({
		prev: '#prev_c1',
		next: '#next_c1',
		auto: false
	  });
      $('#list_product2').carouFredSel({
		prev: '#prev_c2',
		next: '#next_c2',
		auto: false
	  });
	  $(window).resize();
	});
  </script>
</body>
</html>
