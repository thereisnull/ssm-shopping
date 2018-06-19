<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <title>购物车</title>

  <link href="static/css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="static/css/grid.css" media="screen" rel="stylesheet" type="text/css">
  <link href="static/css/layui.css" media="screen" rel="stylesheet" type="text/css">
  <style>
  	.disn{
  		display:none !important;
  	}
  </style>
</head>
<body>
  <%@ include file="header.jsp" %>

  
  <div class="clear"></div>
    
  <div class="container_12">
    <div class="grid_12">
       <div class="breadcrumbs">
	      <a href="${pageContext.request.contextPath}/index">首页</a><span>&#8250;</span><a href="#" class="current">购物车</a>
       </div><!-- .breadcrumbs -->
    </div><!-- .grid_12 -->
  </div><!-- .container_12 -->
  
  <div class="clear"></div>

  <section id="main" class="entire_width">
    <div class="container_12">
       <div class="grid_12">
       <h1 class="page_title">购物车</h1>

       <table class="cart_product">
	      <tr>
	      	 <th class="edit" >操作(全选) </th>
		     <th class="images"></th>
		     <th class="bg name">商品名</th>

		     <th class="bg price">单价</th>
		     <th class="qty">数量</th>
		     <th class="bg subtotal">小计</th>
		     <th class="close">删除</th>
	      </tr>
	      <c:forEach var="item" items="${cartList}">
		      <tr>
		      	 <td ><input class="niceCheck" type="checkbox" /></td>
			     <td class="images"><a href="${pageContext.request.contextPath}/product?pid=${item.pid }"><img src="${item.img}" alt=""></a></td>
			     <td class="bg name">${item.pname }</td>
			     <td class="bg price" data-sm="${item.price}">￥<fmt:formatNumber type="number" value="${item.price/100.0 }" pattern="0.00" maxFractionDigits="2"/></td>
			     <td class="qty"><input type="text" name="number" value="${item.number}" placeholder="1" /></td>
			     <td class="bg subtotal" data-tm="${item.price*item.number}">￥<fmt:formatNumber type="number" value="${item.price*item.number/100.0 }" pattern="0.00" maxFractionDigits="2"/></td>
			     <td class="close"><a title="close" class="close" href="#"><input type="hidden" value="${item.pid }"/></a></td>
		      </tr>
	      </c:forEach>
	      <tr>
		     <td colspan="7" class="cart_but"  style="font-size: 20px">
			    
      已选择商品件数：<font color="#FF0000" id="pc">0</font> 件    商品总金额： <font color="#FF0000" id="total">￥ 0.00</font>元     
        <input type="submit"  style="margin-left:800px;margin-top:15px;height:40px;width:100px;font-size:20px" value="结算 "  disabled="disabled"/> 
		  
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

<%@ include file="footer.jsp" %>
  <script src="${pageContext.request.contextPath}/static/js/checkbox.js"></script>
  <script src="${pageContext.request.contextPath}/static/js/radio.js"></script>
  <script src="${pageContext.request.contextPath}/static/js/selectBox.js"></script>
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
  	$(document).ready(function(){
  		//全选
  		$("th.edit").on("click",function(){
  			$(".niceCheck").each(function(index,ele){
  				if(!$(ele).hasClass("niceChecked")){
  					$(ele).addClass("niceChecked");
  					$(ele).find("input").click();
  				}
  				
  			});
  		});
  		//清空
  		$("th.close").on("click",function(){
  			layer.confirm("确认清空购物车？",{
	    		  btn:['确认','取消'],
	    		  yes:function(){
	    			  $("a.close").each(function(index,ele){
	    				  var gp = $(ele).parent().parent(); 
		    		    	 var data={pid:$(ele).find("input").val()}
		    		    	 $.post("removeCart",data,function(result){
		    		    		 if(result.status==200){
		    		    			 gp.remove();
		    		    			 layer.msg(result.msg);
		    		    		 }
		    		    	 });  
	    			  });	    			  
	    		  },btn2:function(){
		    			  return ;
		    		  }
  			}); 
  		});
  		//修正一个多选框出现不能完全隐藏的bug
  		$(".niceCheck").find("input").addClass("disn");
  		$(".niceCheck").on("click",function(){
  		   var sum=parseInt(0);
		   var count=parseInt(0);
	  		//遍历被选中的
	  		$(".niceChecked").each(function(index,ele){
	  			$("input[type='submit']").removeAttr("disabled");
	  			var parent = $(ele).parent();
	  			//选出小计的钱数
	  			var i =parent.nextAll().eq(4).attr("data-tm");
	  			sum = parseInt(sum)+parseInt(i);
	  			count=count+parseInt(1);
	  			
	  		});
	  		$("#pc").text(count);
	  		$("#total").text('￥'+(sum/100.00).toFixed(2));
  		});
  		var old;
  		$("input[name='number']").on("focus",function(){
  			old=$(this).val();
  		});
  		//失去焦点
  		$("input[name='number']").on("blur",function(){
  			if(isNaN($(this).val())){
  				layer.msg("不是数字");
  				$(this).val(old);
  				return false;
  			}
	  		var data = {pid:$(this).parent().nextAll().eq(1).find("input").val(),
	  				number:$(this).val()};
	  		var that = $(this);
	  		$.post("editCart",data,function(result){
	  			layer.msg(result.msg);
	  			if(result.status==200){
	  	  			var count = $(that).val();
	  	  			var money = $(that).parent().prev().attr("data-sm");
	  	  			var total = $(that).parent().next();
	  	  			total.attr("data-tm",parseInt(count)*parseInt(money));
	  	  			
	  	  			var sum = parseInt(count)*parseInt(money);
	  	  			total.text("￥"+(sum/100.0).toFixed(2));
	  	  		   var sum=parseInt(0);
	  			   var count=parseInt(0);
	  		  		//遍历被选中的
	  		  		$(".niceChecked").each(function(index,ele){
	  		  			var parent = $(ele).parent();
	  		  			//选出小计的钱数
	  		  			var i =parent.nextAll().eq(4).attr("data-tm");
	  		  			sum = parseInt(sum)+parseInt(i);
	  		  			count=count+parseInt(1);
	  		  			
	  		  		});
		  			//修改
			  		$("#pc").text(count);
			  		$("#total").text((sum/100.00).toFixed(2));	
	  			}else{
	  				$(that).val(old);
	  			}

	  		});

  		});
	      $("a.close").on("click",function(){
	    	  var that = $(this);
	    	  layer.confirm("确认删除？",{
	    		  btn:['确认','取消'],
	    		  yes:function(){
	    			  layer.msg();
	    			  var gp = $(that).parent().parent(); 
	    		    	 var data={pid:$(that).find("input").val()}
	    		    	 $.post("removeCart",data,function(result){
	    		    		 if(result.status==200){
	    		    			 gp.remove();
	    		    			 layer.msg(result.msg);
	    		    		 }
	    		    	 }); 
	    		  },btn2:function(){
	    			  return ;
	    		  }
	    		  
	    	  });
	    	
	    	
	    	 return false;
	      });
	     $("input[type='submit']").on("click",function(){
	    	 layer.msg("提交订单");
	    	 var data=[];
	  		$(".niceChecked").each(function(index,ele){
		      	 /* <td ><input class="niceCheck" type="checkbox" /></td>
			     <td class="images"><a href="${pageContext.request.contextPath}/product?pid=${item.pid }"><img src="${item.img}" alt=""></a></td>
			     <td class="bg name">${item.pname }</td>
			     <td class="bg price" data-sm="${item.price}">￥<fmt:formatNumber type="number" value="${item.price/100.0 }" pattern="0.00" maxFractionDigits="2"/></td>
			     <td class="qty"><input type="text" name="number" value="${item.number}" placeholder="1" /></td>
			     <td class="bg subtotal" data-tm="${item.price*item.number}">￥<fmt:formatNumber type="number" value="${item.price*item.number/100.0 }" pattern="0.00" maxFractionDigits="2"/></td>
			     <td class="close"><a title="close" class="close" href="#"><input type="hidden" value="${item.pid }"/></a></td>
			     */
			     var parent = $(ele).parent(); 
	  			//获取单价
	  			var price = parent.nextAll().eq(2).attr("data-sm");
	  			//获取数量
	  			var number = parent.nextAll().eq(3).find("input").val();
	  			//获取pid
	  			var id = parent.nextAll().eq(5).find("input").val();
	  			var t = {money:price,number:number,pid:id};
	  			data.push(t);
	  			
	  		});
	    	 $.ajax({
	    		 type:'POST',
	    		 url:"addOrder",
	    		 data:JSON.stringify(data),
	    		 contentType : 'application/json',
	    		 success:function(result){
	    			layer.open({
	    				 type: 2, 
	    				 //localhost和127.0.0.1 访问时带的session不同 无语
	    				 content: ['http://127.0.0.1/shopping/getPayInfo'] ,
	    				 title:'结算信息',
	    				 area: ['1100px','600px'],
	    				 cancel:function(){
	    					 setTimeout(function(){location.reload()},1000);
	    				 }
	    			});
 	    		 	layer.msg(result.msg);
 	    		 	/*setTimeout(function(){location.reload()},2000); */
	    	 	}
	    	 });
	     });
  	});
  </script>
  

</body>
</html>
