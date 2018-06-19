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

  <title>商品详情</title>

  <link href="${pageContext.request.contextPath}/static/css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/static/css/grid.css" media="screen" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/static/css/layui.css" media="screen" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/jquery.jqzoom.css" type="text/css">
  <style>
    #sidebar{
  	width:90px!important;
  }
  </style>
</head>
<body>
  <%@ include file="header.jsp" %> 
  <div class="clear"></div>
  
  <div class="clear"></div>
<section id="main">
    <div class="container_12">
       <div id="sidebar" class="grid_1 " >
	      &nbsp;
       </div><!-- .sidebar -->
      
       <div id="content" class="grid_9">
	     <h1 class="page_title">${productInfo.pname }</h1>

		<div class="product_page">
			<div class="grid_4 img_slid" id="products">
				<img class="sale" src="static/images/sale.png" alt="Sale"/>
				<div class="preview slides_container">
					<div class="prev_bg">
						<a href="${productInfo.img1 }" class="jqzoom" rel='gal1' title="">
							<img src="${productInfo.img1 }"  title="" alt=""/>
						</a>
					</div>
				</div><!-- .prev -->

				<ul class="pagination clearfix" id="thumblist">
					<li><a class="zoomThumbActive" href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '${productInfo.img1 }',largeimage: '${productInfo.img1 }'}"><img src='${productInfo.img1 }' alt=""></a></li>
					<li><a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '${productInfo.img2 }',largeimage: '${productInfo.img2 }'}"><img src='${productInfo.img2 }' alt=""></a></li>
					<li><a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '${productInfo.img3 }',largeimage: '${productInfo.img3 }'}"><img src='${productInfo.img3 }' alt=""></a></li>
					<li><a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '${productInfo.img4 }',largeimage: '${productInfo.img4 }'}"><img src='${productInfo.img4 }' alt=""></a></li>
				</ul>

			</div><!-- .grid_4 -->
			
			<div class="grid_5">
				<div class="entry_content">
					<div class="review">
							<c:forEach begin="1" step="1" end="${productInfo.score }">
								<a class="plus" href="#"></a>
							</c:forEach>
							<c:forEach  var="i" begin="1" step="1" end="${5-productInfo.score }">
								<a  href="#"></a>
							</c:forEach>
						<span>${productInfo.sales } 已售</span>
					</div>
					<p>${productInfo.pname } 	<div>【活动】前1000名立减3元</div></p>
					<div class="ava_price">
						<div class="availability_sku">
							<div class="availability">
								库存状态: <span>库存充足</span>
							</div>
							<div class="sku">
								库存量: <span>${productInfo.sku }</span>
							</div>
						</div><!-- .availability_sku -->

						<div class="price">
							<div class="price_new">￥ <fmt:formatNumber type="number" value="${productInfo.price/100.0 }" pattern="0.00" maxFractionDigits="2"/></div>
							<div class="price_old">￥ <fmt:formatNumber type="number" value="${productInfo.olderprice/100.0 }" pattern="0.00" maxFractionDigits="2"/></div>
						</div><!-- .price -->
					</div><!-- .ava_price -->

					<div class="block_cart">
						<div class="obn_like">
							<div class="obn"><a href="#" class="obn">比比价</a></div>
							<div class="like"><a href="#" class="like">加入收藏</a></div>
						</div>
						<div class="cart">
							<a href="#" class="bay">加入购物车<input type="hidden" value="${productInfo.pid }"/></a>
							<input type="text" name="" class="number" value="1" />
							<span>数量:</span>
						</div>
					
					<div class="clear"></div>
					
					</div><!-- .block_cart -->
				</div><!-- .entry_content -->

			</div><!-- .grid_5 -->

			<div class="clear"></div>

			<div class="grid_9" >
				<div id="wrapper_tab" class="tab1">
					<a href="#" class="tab1 tab_link">商品详情</a>
					<a href="#" class="tab2 tab_link">评论</a>

					<div class="clear"></div>

					<div class="tab1 tab_body">
					${productInfo.des}
					<div class="clear"></div>
					</div><!-- .tab1 .tab_body -->

					<div class="tab2 tab_body">
						<ul class="comments">
							<c:forEach var="item" items="${ comments}">
							<li>
								<div class="autor">${item.username}</div>&nbsp;&nbsp;&nbsp;&nbsp;于 <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${item.time }" />
								<div class="evaluation">
									<div class="price">
										<strong>综合评价</strong>
										<c:forEach begin="1" step="1" end="${item.score }">
											<a class="plus" href="#"></a>
										</c:forEach>
										<c:forEach  var="i" begin="1" step="1" end="${5-item.score }">
											<a  href="#"></a>
										</c:forEach>
									</div>
									<div class="clear"></div>
								</div><!-- .evaluation -->

								<p >
									<input name="nohtml" type="hidden" value='${item.content }' />
							    </p>
							</li>
						</c:forEach>
						</ul><!-- .comments -->
						<form class="add_comments" action="">
							<h4>写下你的评论吧</h4>
							<div class="evaluation">
								<div class="price">
									<strong>评分：</strong><sup class="surely">*</sup>
									<input class="niceRadio" type="radio" name="score" value="1" /><span class="eva_num">1</span>
									<input class="niceRadio" type="radio" name="score" value="2" /><span class="eva_num">2</span>
									<input class="niceRadio" type="radio" name="score" value="3" /><span class="eva_num">3</span>
									<input class="niceRadio" type="radio" name="score" value="4" /><span class="eva_num">4</span>
									<input class="niceRadio" type="radio" name="score" value="5" /><span class="eva_num">5</span>
								</div>
							</div><!-- .evaluation -->
							<div class="clear"></div>
							<input type="hidden" name="pid" value="${ productInfo.pid}" />
							<div class="text_review">
								<strong>评论：</strong><sup class="surely">*</sup><br/>
								<textarea name="content" ></textarea>
							</div><!-- .text_review -->
							<input type="reset" style="display:none;" /> 
							<input type=submit value="提交评论" id="reviewsub" />
						</form><!-- .add_comments -->
					<div class="clear"></div>
					</div><!-- .tab2 .tab_body -->

					<div class="clear"></div>
				</div>​<!-- #wrapper_tab -->
				<div class="clear"></div>
			</div><!-- .grid_9 -->

			<div class="clear"></div>

			<div class="related">
				<div class="c_header">
					<div class="grid_7">
						<h2>相关商品推荐</h2>
					</div><!-- .grid_7 -->

					<div class="grid_2">
						<a id="next_c1" class="next arows" href="#"><span>Next</span></a>
						<a id="prev_c1" class="prev arows" href="#"><span>Prev</span></a>
					</div><!-- .grid_2 -->
				</div><!-- .c_header -->

				<div class="list_carousel">

				<ul id="list_product" class="list_product">
				 <c:forEach var="item" items="${relative }">
					<li class="">
						<div class="grid_3 product">
							<img class="sale" src="static/images/sale.png" alt="Sale"/>
							<div class="prev">
								<a href="${pageContext.request.contextPath}/product?pid=${item.pid}"><img src="${item.img1}" alt="" title="" /></a>
							</div><!-- .prev -->
							<div><h3 class="title">${item.pname}</h3></div>
							<div class="cart">
								<div class="price">
									<div class="vert">
										<div class="price_new">￥<fmt:formatNumber type="number" value="${item.price/100.0 }" pattern="0.00" maxFractionDigits="2"/></div>
										<div class="price_old">￥<fmt:formatNumber type="number" value="${item.olderprice/100.0 }" pattern="0.00" maxFractionDigits="2"/></div>
									</div>
								</div>
								<a href="#" class="obn"></a>
								<a href="#" class="like"></a>
								<a href="#" class="bay"><input type="hidden" name="pid" value="${item.pid}"/></a>
								
							</div><!-- .cart -->
						</div><!-- .grid_3 -->
					</li>
				</c:forEach>
			        </ul><!-- #list_product -->
				</div><!-- .list_carousel -->
			</div><!-- .carousel -->
		</div><!-- .product_page -->
		<div class="clear"></div>
       </div><!-- #content -->
       
      <div class="clear"></div>
      
    </div><!-- .container_12 -->
  </section><!-- #main -->
  <div class="clear"></div>
 
<%@ include file="footer.jsp" %>
  <script src="static/js/checkbox.js"></script>
  <script src="static/js/radio.js"></script>
  <script src="static/js/selectBox.js"></script>
  <script src="static/js/jquery.jqzoom-core.js" ></script>
  <script>
	$(document).ready(function() {
		$('.jqzoom').jqzoom({
			zoomType: 'standard',
			lens:true,
			preloadImages: true,
			alwaysOn:false
		});
	});
  </script>

  <script>
	$(document).ready(function() {
		$("select").selectBox();
	});
  </script>

  <script>
	$(document).ready(function() {
		$('#wrapper_tab a').click(function() {
			if ($(this).attr('class') != $('#wrapper_tab').attr('class') ) {
				$('#wrapper_tab').attr('class',$(this).attr('class'));
			}
			return false;
		});
	});
  </script>

  <script>
	$(function() {
	  $('#list_product').carouFredSel({
		prev: '#prev_c1',
		next: '#next_c1',
		auto: false
	  });
          $('#list_banners').carouFredSel({
		prev: '#ban_prev',
		next: '#ban_next',
		scroll: 1,
		auto: false
	  });
	  $('#thumblist').carouFredSel({
		prev: '#img_prev',
		next: '#img_next',
		scroll: 1,
		auto: false,
		circular: false,
	  });
	  $(window).resize();
	});
  </script>
  <script>
       $(document).ready(function(){
    	   var layer = layui.layer;
	      $("button").click(function(){
		     $(this).addClass('click')
	      });
	      
	      $("#reviewsub").on("click",function(){
	    	  var data = $(".add_comments").serialize();
	    	  if($("input[type='radio']:checked").val()==""||$("input[type='radio']:checked").val()==undefined){
	    		  layer.msg("打个分先");
	    		  return false;
	    	  }
	    	  if($("textarea[name='content']").val()==""){
	    		  layer.msg("留下你的评论");
	    		  return false;
	    	  }
	    	  $.post(
	    		"${pageContext.request.contextPath}/addComment",
	    		data,
	    		function(result){
	    			layer.msg(result.msg);
	    			$("input[type=reset]").trigger("click");//触发reset
	    		}
	    	  	
	    	  );
	    	  //阻止表单的默认提交事件
	    	  return false;
	      });

       })
  </script>
<script>
	//js代码转义，防止xss注入
    function NoHtml(str){
    	str=str.replace(/({|})/g,'');   //过滤{}
    	str=str.replace(/</g,'&lt;');    //置换符号<
    	str=str.replace(/>/g,'&gt;');    //置换符号>
        return str;
    }
    $(document).ready(function(){
    	$("input[name='nohtml']").each(function(index,ele){
    		var t = NoHtml($(ele).val());
    		$(ele).parent().html(t);
    		$(ele).remove();
    	});
    });
</script>

</body>
</html>
