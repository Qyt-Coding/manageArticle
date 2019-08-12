<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%> 
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Bootstrap 101 Template</title>
		<link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css">

	</head>

	<body>
		<div class="container" style="width: 90%;">
			<fieldset class=" ">
				<legend style=""><strong>回收站信息列表</strong>
				</legend>
			</fieldset>
			<br />
			<h6 style="color: #009688;font-weight: bold;">已经删除的文章信息列表</h6>
			<hr />
			<button type="button" class="layui-btn layui-btn-danger">批量删除</button>
			<button type="button" class="layui-btn" style="margin-left: 0px;">添加文章</button>
			<!--表格-->
			<table class="layui-table">
				<thead>
					<tr>
						<th style="text-align: center;width: 3%;"><input type="checkbox" /></th>
						<th style="text-align: center;width: 4%;">文章编号</th>
						<th style="text-align: center;width: 9%;">文章简介</th>
						<th style="text-align: center;width: 7%;">文章作者</th>
						<th style="text-align: center;width: 7%;">发表日期</th>
						<th style="text-align: center;width: 4%;">审核状态</th>
						<th style="text-align: center;width: 4%;">发布状态</th>
						<th style="text-align: center;width: 4%;">存在状态</th>
						<th style="text-align: center;width: 15%;">操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" /> </td>
						<td>1</td>
						<td>test</td>
						<td>admin</td>
						<td>2016-11-28</td>
						<td>已审核</td>
						<td>已发布</td>
						<td>存在</td>
						<td style="text-align: center;">
							<button type="button" class="layui-btn layui-btn-sm">查看</button>
							<button type="button" class="layui-btn layui-btn-normal   layui-btn-sm">编辑</button>
							<button type="button" class="layui-btn layui-btn-danger layui-btn-sm">删除</button>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="test1"></div>
			<div/>

			<script src="<%=basePath%>/js/jquery-3.3.1.min.js"></script>
			<script src="<%=basePath%>/js/bootstrap.min.js"></script>
			<script src="<%=basePath%>/layui/layui.js"></script>
			<script>
				layui.use('laypage', function() {
					var laypage = layui.laypage;
					//执行一个laypage实例
					laypage.render({
						elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
							,
						count: 50 //数据总数，从服务端得到
					});
				});
			</script>
	</body>

</html>