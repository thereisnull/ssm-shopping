<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="UTF-8">

  <title>登录界面</title>

  <link href="static/css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="static/css/grid.css" media="screen" rel="stylesheet" type="text/css">
  <link href="static/css/layui.css" media="screen" rel="stylesheet" type="text/css">
  </style>
</head>
<body>
  <%@ include file="header.jsp" %>

  <div class="clear"></div>
  
  <section id="main" class="entire_width">
    <div class="container_12">      
       <div id="content">
		<div class="grid_12">
			<h1 class="page_title">会员登录中心</h1>
		</div><!-- .grid_12 -->
		
		<div class="grid_6 new_customers">
			<img src="static/images/zhuce_400x300.jpg"/>
       </div><!-- .grid_6 -->
		
		<div class="grid_6">
			<form class="registed">
				<h2>会员登录</h2>
							
				<p>如果你已经拥有一个吃货账号，请登录</p>
							
				<div class="email">
					<strong>用户名:</strong><sup class="surely">*</sup><br/>
					<input type="text" name="username"  />
				</div><!-- .email -->
							
				<div class="password">
					<strong>密码:</strong><sup class="surely">*</sup><br/>
					<input type="password" name="password"  />
					<a class="forgot" href="#">忘记密码?</a>
				</div><!-- .password -->
				
				<div class="submit">										
					<input type="submit" value="登录" />
					<sup class="surely">*</sup><span><a href="register">还没有账号？去注册</a></span>
				</div><!-- .submit -->
			</form><!-- .registed -->
                </div><!-- .grid_6 -->
       </div><!-- #content -->
       
      <div class="clear"></div>
    </div><!-- .container_12 -->
  </section><!-- #main -->
  <div class="clear"></div>
   <%@ include file="footer.jsp" %>
   <script>
   		$(document).ready(function(){
   			$("input[type='submit']").on("click",function(){
   				var data = $(".registed").serialize();
   				$.post("plogin",data,function(result){
   					layer.msg(result.msg);
   					if(result.status==200){
   						setTimeout(function(){
   							location.href="index";
   						},1000);
   					}
   						
   				});
   				return false;
   			});
   		}
   		);
   
   </script>
</body>
</html>
