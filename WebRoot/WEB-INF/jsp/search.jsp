<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <title>搜索结果</title>

  <link href="static/css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="static/css/grid.css" media="screen" rel="stylesheet" type="text/css">
  <link href="static/css/layui.css" media="screen" rel="stylesheet" type="text/css">
  <style>
  	.priceInput{
  		width: 30px;
		height: 20px !important;
		border: 1px solid #ccc;
		color: #777;
		border-radius: 2px;
		font:normal 12px 微软雅黑,Segoeui, Arial, Verdana, serif;
  	}
  	.btn{
  		display:inline-block!important;
  		height: 20px ;
  		margin-left:10px;
  	}
  </style>
</head>
<body>
  <%@ include file="header.jsp" %>

  
  <div class="clear"></div>
    
  <div class="container_12">
    <div class="grid_12">
       <div class="breadcrumbs">
	      <a href="${pageContext.request.contextPath}/index">首页</a><span>&#8250;</span><a href="#" class="current">搜索结果</a>
       </div><!-- .breadcrumbs -->
    </div><!-- .grid_12 -->
  </div><!-- .container_12 -->
  
  <div class="clear"></div>
  
  <section id="main">
    <div class="container_12">
       <div id="sidebar" class="grid_3">
	      
	      <aside id="shop_by">
		     <h3>筛选条件</h3>
		     
		     <div class="currently_shopping">
			    <p>当前条件:</p>
			    <ul>
			    	<c:if test="${ categoryArray!=null}">
			    		<li class="s_price"><a title="close" class="close" href="javascript:void(0)"></a>分类: <span>${categoryArray }</span></li>
			    	</c:if>
			    	<c:if test="${ priceArray!=null}">
			    		<li class="s_price"><a title="close" class="close" href="javascript:void(0)"></a>价格: <span>￥ ${priceArray }</span></li>
			    	</c:if>
<!-- 				   <li class="s_price"><a title="close" class="close" href="javascript:void(0)"></a>价格: <span>$0.00 - $999.99</span></li>
				   <li class="s_category"><a title="close" class="close" href="javascript:void(0)"></a>分类: <span>Apple</span></li> -->
			    </ul>
			    <a class="clear_all" href="javascript:void(0)">清除所有条件</a>
			    
			    <div class="clear"></div>
		     </div><!-- .currently_shopping -->
		     
		     <h4>按分类筛选</h4>
		     <form action="#" class="check_opt">
			    <p><input class="niceCheck" type="checkbox"  value="休闲零食" <c:if test="${xxls==1 }">checked="checed"</c:if>/><label >休闲零食</label></p>
			    <p><input class="niceCheck" type="checkbox"  value="饼干糕点" <c:if test="${bggd==1 }">checked="checed"</c:if>/><label >饼干糕点 </label></p>
			    <p><input class="niceCheck" type="checkbox"  value="茶水饮料" <c:if test="${csyl==1 }">checked="checed"</c:if>/><label >茶水饮料 </label></p>
			    <p><input class="niceCheck" type="checkbox"  value="生鲜果蔬" <c:if test="${sxgs==1 }">checked="checed"</c:if>/><label >生鲜果蔬 </label></p>
		     </form>
		     
		     <h4>按价格筛选</h4>
		     
		     <form action="#" class="check_opt">
			    <input class="priceInput" type="text" <c:if test="${sp!=null }">value="${sp}"</c:if>  placeholder="￥"> -- 
			    <input class="priceInput" type="text" <c:if test="${ep!=null }">value="${ep}"</c:if> placeholder="￥">
			    <button class="btn" type="button">&nbsp;&nbsp;确认&nbsp;&nbsp;</button>
		     </form>
	      </aside><!-- #shop_by -->
	      
	      <aside id="specials" class="specials">
		     <h3>限时特惠</h3>
		     
		     <ul>
			    <li>
				   <div class="prev">
					  <a href="#"><img src="//img.alicdn.com/imgextra/i4/787936378/TB2t2xHgviSBuNkSnhJXXbDcpXa_!!787936378.jpg_430x430q90.jpg" alt="" title="" /></a>
				   </div>
				   
				   <div class="cont">
					  <a href="#">【亿滋_奥利奥夹心零食大礼包2223g】多口味巧克力威化饼干</a>
					  <div class="prise"><span class="old">￥185.00</span>￥100.00</div>
				   </div>   
			    </li>
			    
			    <li>
				   <div class="prev">
					  <a href="#"><img src="//img.alicdn.com/imgextra/i1/3348639341/TB2M9oSXX_.F1JjSZFjXXahnXXa_!!3348639341.jpg_430x430q90.jpg" alt="" title="" /></a>
				   </div>
				   
				   <div class="cont">
					  <a href="#">【蒙牛纯甄常温酸奶200g*24盒】</a>
					  <div class="prise"><span class="old">￥200.00</span>￥129.00</div>
				   </div>   
			    </li>
		     </ul>
	      </aside><!-- #specials -->	      
       </div><!-- .sidebar -->
      
       <div id="content" class="grid_9">
	      <h1 class="page_title">搜索结果列表</h1>
	      
	      <div class="options">
		     <div class="grid-list">
			   <a class="grid curent" href="index.html"><span>img</span></a>
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
	      
	      <div class="grid_product">
	      <c:forEach var="item" items="${productList}">
		     <div class="grid_3 product">
			    <div class="prev">
				   <a href="${pageContext.request.contextPath}/product?pid=${item.pid}"><img src="${item.img1 }" alt="" title="" /></a>
			    </div><!-- .prev -->
			    <h3 class="title">${item.pname } </h3>
			    <div class="cart">
				   <div class="price">
					  <div class="vert">
						 <div class="price_new">￥<fmt:formatNumber type="number" value="${item.price/100.0 }" pattern="0.00" maxFractionDigits="2"/></div>
					  	<div class="price_old">￥ <fmt:formatNumber type="number" value="${item.olderprice/100.0 }" pattern="0.00" maxFractionDigits="2"/></div>
					  	
					  </div>
				   </div>
				   <a href="#" class="obn"></a>
				   <a href="#" class="like"></a>
				   <a href="#" class="bay"><input type="hidden" value="${item.pid }"/></a>
			    </div><!-- .cart -->
		     </div><!-- .grid_3 -->
		  </c:forEach>   
		     
	    
	      <div class="clear"></div>
	      </div><!-- .grid_product -->
	      
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
    function reload(page){
		//正则 获取kw参数的值 ，reference=https://blog.csdn.net/QUAN_A/article/details/70861123
		var patt=new RegExp("(?<=kw=).*?(?=&|$)");
		var kw = location.href.match(patt);
		var sort = $("select").val();
		var index = $("select").get(0).selectedIndex;
		var orderAttr = $(".sort_up").attr("data-sx");
		var category = getCategory();
		if(category==undefined)
			category="";
		var start = $("input[class='priceInput']").eq(0).val();
  		var end = $("input[class='priceInput']").eq(1).val();
  		var price;
		var baseurl = "${pageContext.request.contextPath}/search?kw="+kw
		+"&sort="+sort+"&page="+page+"&orderAttr="+orderAttr;
  		if(start==undefined||start==""||end==undefined||end=="")
  			price="";
  		if(category!="")
			baseurl+="&categoryArray="+category;
  		if(price!="")
  			baseurl+="&priceArray="+start+"_"+end;
		location.href=baseurl;
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
  <script>
	function close_remove(e){
			var p = $(e).parent();//获取父节点 li			
			if(p.hasClass("s_category")){
	  			//清除选框
	  			$(".niceCheck").each(function(index,ele){
	  	      		$(ele).find("input").removeAttr("checked");
	  	      		$(ele).removeClass("niceChecked");
	  	      	});
			}else{
	  			//清除 价格输入
	  			var start = $("input[class='priceInput']").eq(0).val("");
	  			var end = $("input[class='priceInput']").eq(1).val("");
			}
			p.remove();
			reload(1);
			
		}
	
	function getCategory(){
		var tt="";
		$(".niceCheck").each(function(index,ele){
	      		$(ele).find("input").prop("checked");
	      		//遍历，选中的则将值添加
	      		if($(ele).find("input").prop("checked")==true){
	      			//对第一个，不添加拼接字符'_'
	      			if(tt=="")
	      				tt+=$(ele).find("input").prop("value");
	      			else{
	      				//不是第一个，前面添加拼接字符'_'
	      				tt+=("_"+$(ele).find("input").prop("value"));
	      			}
	      		}
	      	});
		return tt;
	}
  	$(document).ready(function() {

  		//为当前购物条件 的 x 提供点击响应，点击之后移除对应的元素
  		$("a.close").on("click",function(){
  			close_remove(this);
  			
  		});
  		//清除所有条件
  		$("a.clear_all").on("click",function(){
  			$(".currently_shopping li").each(function(index,ele){
  				close_remove(ele);
  				ele = undefined;
  			});
  			//清除选框
  			$(".niceCheck").each(function(index,ele){
  	      		$(ele).find("input").removeAttr("checked");
  	      		$(ele).removeClass("niceChecked");
  	      	});
  			//清除 价格输入
  			var start = $("input[class='priceInput']").eq(0).val("");
  			var end = $("input[class='priceInput']").eq(1).val("");
  			//重新加载符合条件的
  			reload(1);
  		});
  		//复选框的是否选中响应
  		$(".niceCheck").on("click",function(){
  			/*点击之后多了一个span niceCheck变为了span的样式，
  				通过find("input")得到input对象*/
  			var tt = getCategory();  	        
   	        //如果原来已经存在，移除后再次添加
   	        var category = $(".currently_shopping ul li.s_category");
   	        var parent = $(".currently_shopping ul")
   	        var new_element = "<li class='s_category'><a title='close' "
   	        	+"class='close' href='javascript:void(0)' onClick='close_remove(this)'></a>分类: "
   	        	+"<span>"+tt+"</span></li>";
   	        	//原来已经存在，先移除再添加
   	        if(category!=undefined){ 
   	        	$(category).remove();
   	        	category=undefined;
   	        	/*如果一个都没有选中，直接移除*/
   	        	if(tt == ""){  	  
   	        		console.log("p1");
   	        		return ;
   	        		
   	        	}else{
   	        		console.log("p2");
   	        		parent.append(new_element);
   	        	}
   	        }else{//原来不存在，直接添加
   	        	console.log("p3");
   	        	$(".currently_shopping ul").append(new_element);
   	        	
   	        }
  	    	//重新加载符合条件的  	 
   	     	reload(1);
  		});
  		
  		//价格筛选添加
  		$("button[class='btn']").on("click",function(){
  			var start = $("input[class='priceInput']").eq(0).val();
  			var end = $("input[class='priceInput']").eq(1).val();
  			if(isNaN(start)){
  				layer.msg("开始区间不是数字");
  				$("input[class='priceInput']").eq(0).val("");
  				$("input[class='priceInput']").eq(1).val("");
  				return false;
  			}
  			if(isNaN(end)){
  				layer.msg("结束区间不是数字");
  				$("input[class='priceInput']").eq(1).val("");
  				$("input[class='priceInput']").eq(1).val("");
  				return false;
  			}
  		//如果原来已经存在，移除后再次添加
   	        var price = $(".currently_shopping ul li.s_price");
   	        var parent = $(".currently_shopping ul")
   	        var new_element = "<li class='s_price'><a title='close' "
   	        	+"class='close' href='javascript:void(0)' onClick='close_remove(this)'></a>价格: "
   	        	+"<span>￥"+start+"- ￥"+end+"</span></li>";
   	        	//原来已经存在，先移除再添加
   	        if(price!=undefined){ 
   	        	console.log("p4");
   	        	$(price).remove();
   	        	price=undefined;
   	        	parent.append(new_element);
   	        	
   	        }else{//原来不存在，直接添加
   	        	console.log("p5");
   	        	$(".currently_shopping ul").append(new_element);
   	        	
   	        }
  	    	//重新加载符合条件的
   	     	reload(1);
  			
  		});
  	});
  </script>
</body>
</html>
