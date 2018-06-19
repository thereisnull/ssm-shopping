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
  <input type="hidden" value="uid"/>
  <section id="main" class="entire_width">
    <div class="container_12">      
       <div id="content">
		<div class="grid_12">
			<h1 class="page_title">注册会员</h1>
		</div><!-- .grid_12 -->
		
		<div class="grid_6 new_customers">
			<img src="static/images/zhuce_400x300.jpg"/>
       </div><!-- .grid_6 -->
		
		<div class="grid_6">
			<form class="registed">
				<h2>会员注册</h2>
				<p></p>			
							
				<div class="email">
					<strong>用户名:</strong><sup class="surely">*</sup><br/>
					<input type="text" name="username" class="" value="" />
					<lable ></lable>
				</div><!-- .email -->
							
				<div class="password">
					<strong>密码:</strong><sup class="surely">*</sup><br/>
					<input type="password" name="password" class="" value="" />
					<lable ></lable>
				</div><!-- .password -->
				<div class="password">
					<strong>确认密码:</strong><sup class="surely">*</sup><br/>
					<input type="password" name="confirmpassword" class="" value="" />
					<lable ></lable>
				</div><!-- .password -->
			    <div class="email">
					<strong>联系方式:</strong><sup class="surely">*</sup><br/>
					<input type="text" name="phone" class="" value="" />
					<lable ></lable>
				</div><!-- .email -->
				<div class="email">
					<strong>地址:</strong><sup class="surely">*</sup><br/>
					<input type="text" name="address" class="" value="" />
					<lable ></lable>
				</div><!-- .email -->
				<div class="submit">										
					<input type="submit" value="注册" />
					<sup class="surely">*</sup><span> 必填字段</span>
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
    	   $("input[type='text']").on("focus",function(){
    		   $(this).next().html(""); 
    		   $("input[type='submit']").removeAttr("disabled");
    	   });
    	   $("input[type='password']").on("focus",function(){
    		   $(this).next().html(""); 
    		   $("input[type='submit']").removeAttr("disabled");
    	   });
    	   $("input[name='username']").on("blur",function(){
    		   var t = $(this).val();
    		   if(t==""){
    			   $(this).next().html("<font color='red'> *请填写用户名!</font>");
    			   $("input[type='submit']").attr("disabled","disabled");
    			   return ;
    		   }
    		   var data={username:t};
    		   $.post("volidatename",data,function(result){
    			   if(result.status != 200){
    				   $("input[name='username']").next().html("<font color='red'> *该用户名已被使用!</font>");
    				   $("input[type='submit']").attr("disabled","disabled");
    			   }
    		   });
    	   });
		   $("input[name='password']").on("blur",function(){
			   var t = $(this).val();
			   if(t==""||t.length<6){
				   $(this).next().html("<font color='red'> *请填写大于6位的密码!</font>");
				   $("input[type='submit']").attr("disabled","disabled");
			   }
		   });
		   $("input[name='confirmpassword']").on("blur",function(){
			   var t = $(this).val();
			   var p = $("input[name='password']").val();
			   if(t==""||t!=p){
				   $(this).next().html("<font color='red'> *两次密码不一致!</font>");
				   $("input[type='submit']").attr("disabled","disabled");
			   }
		   });
		   $("input[name='phone']").on("blur",function(){
			   var pattern = /^[1][3,4,5,7,8][0-9]{9}$/; // 验证手机号正则表达式
			   var t = $(this).val();
			   if(t==""||!pattern.test(t)){
				   $(this).next().html("<font color='red'> *手机号格式有误!</font>");
				   $("input[type='submit']").attr("disabled","disabled");
			   }
		   });
		   $("input[name='address']").on("blur",function(){
			   var t = $(this).val();
			   if(t==""){
				   $(this).next().html("<font color='red'> *请填写地址!</font>");
				   $("input[type='submit']").attr("disabled","disabled");
			   }
		   });
			$("input[type='submit']").on("click",function(){
   				var data = $(".registed").serialize();
   				$.post("pregister",data,function(result){
   					layer.msg(result.msg);
   					if(result.status==200){
   						setTimeout(function(){
   							location.href="login";
   						},1000);
   					}
   				});
   				return false;
   			});
       });
  </script>
</body>
</html>
