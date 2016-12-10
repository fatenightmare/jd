<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title><?php echo $_page_title; ?></title>
	<meta name="keywords" content="<?php echo $_page_keywords; ?>" />
	<meta name="description" content="<?php echo $_page_description; ?>" />
	<!-- 引入公共的CSS -->
	<link rel="stylesheet" href="/Public/Home/style/base.css" type="text/css">
	<link rel="stylesheet" href="/Public/Home/style/global.css" type="text/css">
	<link rel="stylesheet" href="/Public/Home/style/header.css" type="text/css">
	<link rel="stylesheet" href="/Public/Home/style/bottomnav.css" type="text/css">
	<link rel="stylesheet" href="/Public/Home/style/footer.css" type="text/css">
	<!-- 引入公共的JS -->
	<script type="text/javascript" src="/Public/Home/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/Public/Home/js/header.js"></script>
</head>
<body>
	<!-- 顶部导航 start -->
	<div class="topnav">
		<div class="topnav_bd w990 bc">
			<div class="topnav_left">
				
			</div>
			<div class="topnav_right fr">
				<ul>
					<li id="logInfo"></li>
					<li class="line">|</li>
					<li><a href="<?php echo U('My/order'); ?>">我的订单</a></li>
					<li class="line">|</li>
					<li>客户服务</li>

				</ul>
			</div>
		</div>
	</div>
	<!-- 顶部导航 end -->
	<div style="clear:both;"></div>
	
	

<link rel="stylesheet" href="/Public/Home/style/home.css" type="text/css">
<link rel="stylesheet" href="/Public/Home/style/order.css" type="text/css">
<script type="text/javascript" src="/Public/Home/js/home.js"></script>

<!-- 头部 start -->
	<div class="header w1210 bc mt15">
		<!-- 头部上半部分 start 包括 logo、搜索、用户中心和购物车结算 -->
		<div class="logo w1210">
			<h1
					class="fl"><a
					href="<?php echo U('index/index')?>"><img src="/Public/Home/images/logo.png" alt="jd商城"
															  title="jd商城"></a></h1>
			<!-- 头部搜索 start -->
			<div class="search fl">
				<div class="search_form">
					<div class="form_left fl"></div>
					<form name="serarch" method="get" class="fl">
						<input id="key" name="key" type="text" class="txt" value="<?php echo I('get.key', '请输入商品关键字'); ?>" />
						<input onclick="location.href='<?php echo U('Search/key_search', '', FALSE); ?>/key/'+$('#key').val();" type="button" class="btn" value="搜索" />
					</form>
					<div class="form_right fl"></div>
				</div>
				
				<div style="clear:both;"></div>

				<div class="hot_search">
					<strong>热门搜索:</strong>
					<a href="">D-Link无线路由</a>
					<a href="">休闲男鞋</a>
					<a href="">TCL空调</a>
					<a href="">耐克篮球鞋</a>
				</div>
			</div>
			<!-- 头部搜索 end -->

			<!-- 用户中心 start-->
			<div class="user fl">
				<dl>
					<dt>
						<em></em>
						<a href="">用户中心</a>
						<b></b>
					</dt>
					<dd>
						<div class="prompt">
							您好，请<a href="">登录</a>
						</div>
						<div class="uclist mt10">
							<ul class="list1 fl">
								<li><a href="">用户信息></a></li>
								<li><a href="">我的订单></a></li>
								<li><a href="">收货地址></a></li>
								<li><a href="">我的收藏></a></li>
							</ul>

							<ul class="fl">
								<li><a href="">我的留言></a></li>
								<li><a href="">我的红包></a></li>
								<li><a href="">我的评论></a></li>
								<li><a href="">资金管理></a></li>
							</ul>

						</div>
						<div style="clear:both;"></div>
						<div class="viewlist mt10">
							<h3>最近浏览的商品：</h3>
							<ul>
								<li><a href=""><img src="/Public/Home/images/view_list1.jpg" alt="" /></a></li>
								<li><a href=""><img src="/Public/Home/images/view_list2.jpg" alt="" /></a></li>
								<li><a href=""><img src="/Public/Home/images/view_list3.jpg" alt="" /></a></li>
							</ul>
						</div>
					</dd>
				</dl>
			</div>
			<!-- 用户中心 end-->

			<!-- 购物车 start -->
			<div class="cart fl">
				<dl>
					<dt>
						<a id="cart_list" href="<?php echo U('Cart/lst'); ?>">去购物车结算</a>
						<b></b>
					</dt>
					<dd>
						<div class="prompt" id="cart_div_list">
							<img src="/Public/Home/images/loading.gif" />
						</div>
					</dd>
				</dl>
			</div>
			<!-- 购物车 end -->
		</div>
		<!-- 头部上半部分 end -->
		
		<div style="clear:both;"></div>

		<!-- 导航条部分 start -->
		<div class="nav w1210 bc mt10">
			<!--  商品分类部分 start-->
			<div class="category fl <?php if($_show_nav == 0) echo 'cat1'; ?>">
				<div class="cat_hd <?php if($_show_nav == 0) echo 'off'; ?>">  <!-- 注意，首页在此div上只需要添加cat_hd类，非首页，默认收缩分类时添加上off类，并将cat_bd设置为不显示(加上类none即可)，鼠标滑过时展开菜单则将off类换成on类 -->
					<h2>全部商品分类</h2>
					<em></em>
				</div>
				
				<div class="cat_bd <?php if($_show_nav == 0) echo 'none'; ?>"> 
					<!-- 循环输出三层分类数据 -->
					<?php foreach ($catData as $k => $v): ?>
					<div class="cat <?php if($k==0) echo 'item1'; ?>">
						<h3><a href="<?php echo U('Search/cat_search?cat_id='.$v['id'], '', FALSE); ?>"><?php echo $v['cat_name'];?></a> <b></b></h3>
						<div class="cat_detail none">
							<?php foreach ($v['children'] as $k1 => $v1): ?>
							<dl <?php if($k1==0) echo 'class="dl_1st"'; ?>>
								<dt><a href="<?php echo U('Search/cat_search?cat_id='.$v1['id'], '', FALSE); ?>"><?php echo $v1['cat_name'];?></a></dt>
								<dd>
									<?php foreach ($v1['children'] as $k2 => $v2): ?>
									<a href="<?php echo U('Search/cat_search?cat_id='.$v2['id'], '', FALSE); ?>"><?php echo $v2['cat_name'];?></a>
									<?php endforeach; ?>					
								</dd>
							</dl>
							<?php endforeach; ?>
						</div>
					</div>
					<?php endforeach; ?>
				</div>

			</div>
			<!--  商品分类部分 end--> 

			<div class="navitems fl">
				<ul class="fl">
					<li class="current"><a href="">首页</a></li>
					<li><a href="">电脑频道</a></li>
					<li><a href="">家用电器</a></li>
					<li><a href="">品牌大全</a></li>
					<li><a href="">团购</a></li>
					<li><a href="">积分商城</a></li>
					<li><a href="">夺宝奇兵</a></li>
				</ul>
				<div class="right_corner fl"></div>
			</div>
		</div>
		<!-- 导航条部分 end -->
	</div>
	<!-- 头部 end-->

	<div style="clear:both;"></div>
	
<script>
<?php $ic = C('IMAGE_CONFIG'); ?>
var picView = "<?php echo $ic['viewPath']; ?>";
$("#cart_list").mouseover(function(){
	$.ajax({
		type : "GET",
		url : "<?php echo U('Cart/ajaxCartList'); ?>",
		dataType : "json",
		success : function(data)
		{
			// 拼出HTML放到页中
			var html = "<table>";
			$(data).each(function(k,v){
				html += "<tr>";
				html += '<td><img width="50" src="'+picView+v.mid_logo+'" /></td>';
				html += '<td>'+v.goods_name+'</td>';
				html += '</tr>';
			});
			html += "</table>";
			$("#cart_div_list").html(html);
		}
	});
});
</script>

	<!-- 页面主体 start -->
	<div class="main w1210 bc mt10">
		<div class="crumb w1210">
			<h2><strong>我的定单 </strong><span>> 我的订单</span></h2>
		</div>
		
		<!-- 左侧导航菜单 start -->
		<div class="menu fl">
			<h3>我的XX</h3>
			<div class="menu_wrap">
				<dl>
					<dt>订单中心 <b></b></dt>
					<dd class="cur"><b>.</b><a href="<?php echo U('order'); ?>">我的订单</a></dd>
					<dd><b>.</b><a href="">我的关注</a></dd>
					<dd><b>.</b><a href="">浏览历史</a></dd>
					<dd><b>.</b><a href="">我的团购</a></dd>
				</dl>

				<dl>
					<dt>账户中心 <b></b></dt>
					<dd><b>.</b><a href="">账户信息</a></dd>
					<dd><b>.</b><a href="">账户余额</a></dd>
					<dd><b>.</b><a href="">消费记录</a></dd>
					<dd><b>.</b><a href="">我的积分</a></dd>
					<dd><b>.</b><a href="">收货地址</a></dd>
				</dl>

				<dl>
					<dt>订单中心 <b></b></dt>
					<dd><b>.</b><a href="">返修/退换货</a></dd>
					<dd><b>.</b><a href="">取消订单记录</a></dd>
					<dd><b>.</b><a href="">我的投诉</a></dd>
				</dl>
			</div>
		</div>
		<!-- 左侧导航菜单 end -->


		<!-- 右侧内容区域 start -->
		<div class="content fl ml10">
			<div class="order_hd">
				<h3>我的订单</h3>
				<dl>
					<dt>便利提醒：</dt>
					<dd>待付款（<?php echo $data['noPayCount']; ?>）</dd>
				</dl>
			</div>

			<div class="order_bd mt10">
				<table class="orders">
					<thead>
						<tr>
							<th width="10%">订单号</th>
							<th width="20%">订单商品</th>
							<th width="10%">收货人</th>
							<th width="20%">订单金额</th>
							<th width="20%">下单时间</th>
							<th width="10%">订单状态</th>
							<th width="10%">操作</th>
						</tr>
					</thead>
					<tbody>
					<?php foreach ($data['data'] as $k => $v): ?>
						<tr>
							<td><?php echo $v['id']; ?></td>
							<td><a href=""><?php $_arr = explode(',', $v['logo']);foreach ($_arr as $k1 => $v1) showImage($v1); ?></a></td>
							<td><?php echo $v['shr_name']; ?></td>
							<td>￥<?php echo $v['total_price']; ?></td>
							<td><?php echo date('Y-m-d H:i:s', $v['addtime']); ?></td>
							<td>
							<?php if($v['pay_status'] == '是'): ?>
								已支付
							<?php else: ?>
								<?php echo makeAlipayBtn($v['id']); ?>
							<?php endif; ?>
							</td>
							<td>
								<?php if($v['pay_status'] == '否'): ?>
									<a href="">查看</a> | <a href="">取消定单</a>
								<?php endif; ?>
							</td>
						</tr>
					<?php endforeach; ?>
					</tbody> 
				</table>
				
				<p><?php echo $data['page']; ?></p>
			</div>
		</div>
		<!-- 右侧内容区域 end -->
	</div>
	<!-- 页面主体 end-->


	
	<div style="clear:both;"></div>
	<!-- 底部版权 start -->
	<div class="footer w1210 bc mt15">
		<p class="links">
			<a href="">关于我们</a> |
			<a href="">联系我们</a> |
			<a href="">人才招聘</a> |
			<a href="">商家入驻</a> |
			<a href="">千寻网</a> |
			<a href="">奢侈品网</a> |
			<a href="">广告服务</a> |
			<a href="">移动终端</a> |
			<a href="">友情链接</a> |
			<a href="">销售联盟</a> |
			<a href="">京西论坛</a>
		</p>
		<p class="copyright">
			 © 2005-2013 京东网上商城 版权所有，并保留所有权利。  ICP备案证书号:京ICP证070359号 
		</p>
		<p class="auth">
			<a href=""><img src="/Public/Home/images/xin.png" alt="" /></a>
			<a href=""><img src="/Public/Home/images/kexin.jpg" alt="" /></a>
			<a href=""><img src="/Public/Home/images/police.jpg" alt="" /></a>
			<a href=""><img src="/Public/Home/images/beian.gif" alt="" /></a>
		</p>
	</div>
	<!-- 底部版权 end -->

</body>
</html>

<script>
// 判断登录状态 
$.ajax({
	type : "GET",
	url : "<?php echo U('Member/ajaxChkLogin'); ?>",
	dataType : "json",
	success : function(data)
	{
		if(data.login == 1)
			var li = '您好，'+data.username+' [<a href="<?php echo U('Member/logout'); ?>">退出</a>]';
		else
			var li = '您好，欢迎来到京西！[<a href="<?php echo U('Member/login'); ?>">登录</a>] [<a href="<?php echo U('Member/regist'); ?>">免费注册</a>]'
		$("#logInfo").html(li);
	}
});
</script>