<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <div class="container_12">
   
    <div class="clear"></div>

    <header id="branding">
      <div class="grid_3">
        <hgroup>
          <h1 id="site_logo" ><a href="${pageContext.request.contextPath}/index" title=""><img src="${pageContext.request.contextPath}/static/images/logo.png" alt="Online Store Theme Logo"/></a></h1>
          <h2 id="site_description">吃货在线商城</h2>
        </hgroup>
      </div><!-- .grid_3 -->

      <div class="grid_3">
    <form class="search" action="${pageContext.request.contextPath}/search">
          <input type="text" name="kw" class="entry_form" value="" placeholder="总想吃点什么呢..."/>
	</form>
      </div><!-- .grid_3 -->

      <div class="grid_6">
        <ul id="cart_nav">
          <li>
            <a class="cart_li" href="${pageContext.request.contextPath}/cart">购物车 </a>           
          </li>
        </ul>

        <nav class="private">
          <ul>
            <li><a href="showallproduct">我的订单</a></li>
		<li class="separator">|</li>
		<c:if test="${ActiveUser==null}">
            <li><a href="${pageContext.request.contextPath}/login">登录</a></li>
		<li class="separator">|</li>
            <li><a href="${pageContext.request.contextPath}/register">注册</a></li>
        </c:if>
        <c:if test="${ActiveUser!=null }">
        	<li><a href="#">欢迎你 ${ActiveUser.username }</a></li> 
        	<li class="separator">|</li>
        	<li><a href="modify.jsp">修改密码</a></li>
		<li class="separator">|</li>
            <li><a href="logout">退出</a></li>
        </c:if>
          </ul>
        </nav><!-- .private -->
      </div><!-- .grid_6 -->
    </header><!-- #branding -->
  </div><!-- .container_12 -->
 <div class="clear"></div>

  <div id="block_nav_primary">
    <div class="container_12">
      <div class="grid_12">
        <nav class="primary">
          <ul>
            <li class="curent"><a href="${pageContext.request.contextPath}/index">首页</a></li>
            <li><a href="${pageContext.request.contextPath}/category?categoryName=休闲零食">休闲零食</a></li>
            <li><a href="${pageContext.request.contextPath}/category?categoryName=饼干糕点">饼干糕点</a></li>
            <li><a href="${pageContext.request.contextPath}/category?categoryName=茶水饮料">茶水饮料</a></li>
            <li><a href="${pageContext.request.contextPath}/category?categoryName=生鲜果蔬">生鲜果蔬</a></li>
            <li>
            	<a>精选零食</a>
	            <ul class="sub">
	            	<li><a onclick="">三只松鼠</a></li>
	            	<li><a onclick="">两只老虎</a></li>
	            	<li><a onclick="">良品铺子</a></li>
	            	<li><a onclick="">百草味</a></li>
	            </ul>
	        </li>
          </ul>
        </nav><!-- .primary -->
      </div><!-- .grid_12 -->
    </div><!-- .container_12 -->
  </div><!-- .block_nav_primary -->
