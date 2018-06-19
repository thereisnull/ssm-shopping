<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">
  <link href="static/css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="static/css/grid.css" media="screen" rel="stylesheet" type="text/css">
  <link href="static/css/layui.css" media="screen" rel="stylesheet" type="text/css">
<style type="text/css">
body{
	background: none !important;
}
#main.entire_width{
margin: 0px 0 70px 0 !important ;
}
</style>
</head>
<body>
  <section id="main" class="entire_width">
    <div class="container_12">
       <div class="grid_12">
       <table class="cart_product">
	      <tr>
	      	 <th class="bg price">序号</th>
		     <th class="images">图片</th>
		     <th class="bg name">商品名</th>
		     <th class="bg price">单价</th>
		     <th class="qty">数量</th>
		     <th class="bg subtotal">小计</th>
	      </tr>
	      <c:forEach var="item" items="${orderList}" varStatus="status">
		      <tr>
		      	 <td>${status.index+1 }</td>
			     <td class="images"><a href="${pageContext.request.contextPath}/product?pid=${item.pid }"><img src="${item.img}" alt=""></a></td>
			     <td class="bg name">${item.pname }</td>
			     <td class="bg price" data-sm="${item.money}">￥<fmt:formatNumber type="number" value="${item.money/100.0 }" pattern="0.00" maxFractionDigits="2"/></td>
			     <td class="qty">${item.number}</td>
			     <td class="bg subtotal" data-tm="${item.money*item.number}">￥<fmt:formatNumber type="number" value="${item.money*item.number/100.0 }" pattern="0.00" maxFractionDigits="2"/></td>
		      </tr>
	      </c:forEach>
	      <tr>
	      	<td></td>
	      	<td></td>
	      	<td colspan="2" class="cart_but"  style="font-size: 20px">
	      	<div class="grid_2">
	      	&nbsp;
	      	</div>
	      		<div class="grid_2">
	      		<ul class="f_contact">
            		<li >${ActiveUser.address }</li>
          		</ul><!-- .f_contact -->
          		</div>
	      	</td>
	      </tr>
	      <tr>
		     <td colspan="6" class="cart_but"  style="font-size: 20px">
			    
      应付：<font color="#FF0000" id="pc"><fmt:formatNumber type="number" value="${should/100.0 }" pattern="0.00" maxFractionDigits="2"/></font> 元  <br/>  
      优惠： <font color="#FF0000" id="total">￥ <fmt:formatNumber type="number" value="${discount/100.0 }" pattern="0.00" maxFractionDigits="2"/></font>元  <br/>  
      实付： <font color="#FF0000" id="total">￥ <fmt:formatNumber type="number" value="${sum/100.0 }" pattern="0.00" maxFractionDigits="2"/></font>元    
		   
		     </td>
	      </tr>
       </table>
       </div><!-- .grid_12 -->
        <div class="clear"></div>
      </div><!-- #content_bottom -->
      <div class="clear"></div>

    </div><!-- .container_12 -->
  </section><!-- #main -->
  <div class="clear"></div>

</body>
</html>
