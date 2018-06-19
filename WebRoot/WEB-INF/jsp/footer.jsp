<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

  <footer>
    <div class="f_navigation">
      <div class="container_12">
        <div class="grid_4">
          <h3>联系 我们</h3>
          <ul class="f_contact">
            <li>凡是你需要的的地方</li>
            <li>+10086 123456</li>
            <li>mail@buy.cn</li>
          </ul><!-- .f_contact -->
        </div><!-- .grid_3 -->

        <div class="grid_4">
          <h3>信息</h3>
          <nav class="f_menu">
            <ul>
              <li><a href="#">关于我们</a></li>
              <li><a href="#">隐私策略</a></li>
              <li><a href="#">用户条款</a></li>
              <li><a href="#">安全支付</a></li>
            </ul>
          </nav><!-- .private -->
        </div><!-- .grid_3 -->

        <div class="grid_4">
          <h3>客户服务</h3>
          <nav class="f_menu">
            <ul>
              <li><a href="contact_us.html">在线客服</a></li>
              <li><a href="#">建议与意见</a></li>
              <li><a href="#">疑问解答</a></li>
              <li><a href="#">网站地图</a></li>
            </ul>
          </nav><!-- .private -->
        </div><!-- .grid_3 -->       

        <div class="clear"></div>
      </div><!-- .container_12 -->
    </div><!-- .f_navigation -->

    <div class="f_info">
      <div class="container_12">
          <center><p class="copyright">© Chihuo Store Online </p></center>
        <div class="clear"></div>
      </div><!-- .container_12 -->
    </div><!-- .f_info -->
  </footer>
  <script src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js" ></script>
  <script src="${pageContext.request.contextPath}/static/js/layui.all.js" ></script>
  <script src="${pageContext.request.contextPath}/static/js/html5.js" ></script>
  <script src="${pageContext.request.contextPath}/static/js/jflow.plus.js" ></script>
  <script src="${pageContext.request.contextPath}/static/js/jquery.carouFredSel-5.2.2-packed.js"></script>
<script>
	$(document).ready(function() {
		var layer = layui.layer;
		/* 当按钮被点击时 添加一个点击样式 */
		$("button").click(function() {
			$(this).addClass('click')
		});
		/* 当搜索表单提交的时候 拦截提交校验非空*/
		$(".search").submit(function() {			
			var key = $("input[name='kw']").val();
			if (key == "") {
				layer.msg("请输入搜索词");
				return false;
			}
		});
		$("a.bay").on("click",function(){
	    	  if($(this).find("input").val()==undefined||$(this).find("input").val()==""){
	    		  layer.msg("出了点小意外");
	    		  return false;
	    	  }
	    	  var number=1;
	    	  var sku=${productInfo.sku==null?1000:productInfo.sku};
	    	  if($(this).parent().find("input").eq(1).val()!=undefined){
	    		  number=$(this).parent().find("input").eq(1).val();
	    		  if(isNaN(number)){
	    				layer.msg("输入数量不是数字");
	    				$(this).parent().find("input").eq(1).val("1");
	    				return false;
	    		  }
	    		  if( parseInt(number) > parseInt(sku) ){
	    			  layer.msg("买的数量已经超出库存了");
	    			  return false;
	    		  }
	    	  }
	    	  var data = {pid:$(this).find("input").val(),number:number};
	    	  $.post(
	    		"${pageContext.request.contextPath}/addCart",
	    		data,
	    		function(result){
	    			layer.msg(result.msg);
	    		} );
	    	  return false;
	      });
	})
</script>
