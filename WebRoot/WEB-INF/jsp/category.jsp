<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <meta name="description" content="">
  <meta name="keywords" content="">

  <title>产品分类</title>

  <link href="${pageContext.request.contextPath}/static/css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/static/css/grid.css" media="screen" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/static/css/layui.css" media="screen" rel="stylesheet" type="text/css">
  <style>
    #sidebar{
  	width:90px!important;
  }
  </style>

</head>
<body>
  <%@ include file="header.jsp" %> 
  <div class="clear"></div>
  <div class="container_12">
    <div class="grid_12">
       <div class="breadcrumbs">
	      <a href="${pageContext.request.contextPath}/index">首页</a><span >&#8250;</span><span class="current"><a href="#">${currentUrl }</a></span>
       </div><!-- .breadcrumbs -->
    </div><!-- .grid_12 -->
  </div><!-- .container_12 -->
  
  <div class="clear"></div>
<section id="main">
    <div class="container_12">
       <div id="sidebar" class="grid_1 " >
	      &nbsp;
       </div><!-- .sidebar -->
      
       <div id="content" class="grid_9">
	      <h1 class="page_title">产品分类列表</h1>
	      
	      <div class="options">
		     <div class="grid-list">
			   <a class="list curent" href="index.html"><span>img</span></a>
		     </div><!-- .grid-list -->

		    <div class="sort">
			   排序规则
			    <select >		    	
				   <option value="price">价格</option>
				   <option <c:if test="${sort == 'sales'}">selected="selected"</c:if>  value="sales">销量</option>
				   <option <c:if test="${sort == 'startime'}">selected="selected"</c:if> value="startime">上架时间</option>
			     </select>
			    <c:if test="${orderAttr == 'ASC'}">
			    	<a class="sort_up" href="javascript:void(0)" data-sx="ASC">&nbsp;&#8593;&nbsp;</a>
			    </c:if>
			    <c:if test="${orderAttr == 'DESC'}">
			    	<a class="sort_up" href="javascript:void(0)" data-sx="DESC">&nbsp;&#8595;&nbsp;</a>
			    </c:if>
		     </div><!-- .sort -->
	      </div><!-- .options -->
	      
	      <div class="listing_product">
	      <c:forEach var="item" items="${productList}">
	      	<div class="product_li">
				<div class="grid_3">
					<img class="sale" src="${pageContext.request.contextPath}/static/images/new.png" alt="New"/>
					<div class="prev">
						<a href="${pageContext.request.contextPath}/product?pid=${item.pid}"><img src="${item.img1}" alt="" title="" /></a>
					</div><!-- .prev -->
				</div><!-- .grid_3 -->
				
				<div class="grid_4">
					<div class="entry_content">
						<a href="${pageContext.request.contextPath}/product?pid=${item.pid}"><h3 class="title">${item.pname }</h3></a>
						<div class="review">
							<c:forEach begin="1" step="1" end="${item.score }">
								<a class="plus" href="#"></a>
							</c:forEach>
							<c:forEach  var="i" begin="1" step="1" end="${5-item.score }">
								<a  href="#"></a>
							</c:forEach>
							<span>${item.sales } 已售</span>
						</div>
						<p ><a href="${pageContext.request.contextPath}/product?pid=${item.pid}">${item.pname }</a></p>
						
					</div><!-- .entry_content -->
				</div><!-- .grid_4 -->
				
				<div class="grid_2">
					<div class="cart">
						<div class="price">
							<div class="vert">
								<div class="price_new">￥<fmt:formatNumber type="number" value="${item.price/100.0 }" pattern="0.00" maxFractionDigits="2"/>  </div>
								<div class="price_old"><del>￥ <fmt:formatNumber type="number" value="${item.olderprice/100.0 }" pattern="0.00" maxFractionDigits="2"/></del></div>
							</div>
						</div>
						<a href="#" class="bay">加入购物车<input type="hidden" value="${item.pid}"></a>
						<a href="#" class="obn"></a>
						<a href="#" class="like"></a>
					</div><!-- .cart -->
				</div><!-- .grid_2 -->
				
				<div class="clear"></div>
			</div><!-- .article -->						
	      </c:forEach>

									
	    
	      <div class="clear"></div>
	      </div><!-- .listing_product -->
	      
	      <div class="clear"></div>
	      
	      <div class="pagination">
		     <ul>
			    <li class="prev"><span>&#8592;</span></li>
			    <c:forEach var="i" begin="1" step="1" end="${totalPage }">
			    	<c:if test="${ currentPage==i}">
			    		 <li class="curent"><a href="#">${i }</a></li>
			    	</c:if>
			    	<c:if test="${ currentPage!=i}">
			    		<li><a  href="javascript:void(0)">${i}</a></li>
			    	</c:if>
			    </c:forEach>
			    <li class="next"><a href="javascript:void(0)">&#8594;</a></li>
		     </ul>
	      </div><!-- .pagination -->
	      <p class="pagination_info">第  ${currentPage} 页 ，共 ${ totalPage} 页</p>
       </div><!-- #content -->
       
      <div class="clear"></div>
      
    </div><!-- .container_12 -->
  </section><!-- #main -->
  <div class="clear"></div>
 
<%@ include file="footer.jsp" %>
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
  <script>
    function reload(page){
    	var name = $(".breadcrumbs span.current > a").text();
		var sort = $("select").val();
		var index = $("select").get(0).selectedIndex;
		var orderAttr = $(".sort_up").attr("data-sx");
		location.href="${pageContext.request.contextPath}/category"+
			"?categoryName="+name+"&sort="+sort+"&page="+page+"&orderAttr="+orderAttr;
    }
	$(document).ready(function() {
		$(".pagination li a").on("click",function(){
			var page = $(this).text();
			reload(page);
		});
		$("select").on("change",function(){
			reload(1);			
		});
		$(".sort_up").on("click",function(){
			var orderAttr = $(this).attr("data-sx");
			if(orderAttr == "ASC"){
				$(this).html("&nbsp;&#8595;&nbsp;");
				$(this).attr("data-sx","DESC");
				reload(1);
			}
			else{
				$(this).html("&nbsp;&#8593;&nbsp;");
				$(this).attr("data-sx","ASC");
				reload(1);
			}			
		});
	});
  </script>
</body>
</html>
