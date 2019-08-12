<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css">
<!-- Bootstrap -->
<link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">
<style>
.listTitle {
	font-weight: 700;
	color: #299A74;
}

.float-left {
	float: left;
}

.width-nine {
	width: 90px;
}

.width-ten {
	width: 100px;
}
</style>

</head>

<body>
	<div class="container" style="width: 90%;">
		<fieldset class=" ">
			<legend style="">
				<strong>文章信息列表</strong>
			</legend>
		</fieldset>
		<br />

		<div>
			<div>
				<span class="listTitle">输入查询信息</span>
				<hr />
				<div>
					<form class="layui-form" action="<%=basePath%>">
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label " style="width: 100px;">文章简介</label>
								<div class="layui-input-inline">
									<input type="text" name="number" lay-verify="required|number"
										autocomplete="off" class="layui-input">
								</div>
							</div>

							&nbsp;&nbsp;&nbsp;&nbsp;

							<div class="layui-inline">
								<label class="layui-form-label  width-nine" style="width: 80px;">审核状态</label>
								<div class="layui-input-inline" style="width: 100px;">
									<select name="quiz1">
										<option value="">请选择</option>
										<option value="" selected="">已审核</option>
										<option value="">未审核</option>
									</select>
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label width-nine">发布状态</label>
								<div class="layui-input-inline" style="width: 100px;">
									<select name="quiz1">
										<option value="">请选择</option>
										<option value="" selected="">已发布</option>
										<option value="">未发布</option>
									</select>
								</div>
							</div>

							<div class="layui-inline">
								<label class="layui-form-label width-nine">存在状态</label>
								<div class="layui-input-inline " style="width: 100px;">
									<select name="quiz1">
										<option value="">请选择</option>
										<option value="" selected="">已存在</option>
										<option value="">不存在</option>
									</select>
								</div>
							</div>
							&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

							<div class="layui-inline">
								<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
							</div>
						</div>

					</form>
				</div>
				<!--查询结果展示-->
				<span class="listTitle">查询结果展示</span>
				<hr />
				<button type="button" class="layui-btn layui-btn-danger">批量删除</button>
				<button type="button" class="layui-btn" style="margin-left: 0px;">添加文章</button>

				<table class="layui-hide" id="demo" lay-filter="test"></table>
			</div>
		</div>
	</div>

	</div>
	</div>

	<script src="<%=basePath%>/js/jquery-3.3.1.min.js"></script>
	<script src="<%=basePath%>/js/bootstrap.js"></script>
	<script src="<%=basePath%>/layui/layui.js"></script>
	
	<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>




  
<!-- 是否审核 -->
	<script type="text/html" id="bVerify">
 		 {{#  if(d.bVerify == 1){ }}
  			  已审核
 		 {{#  } else { }}
  			 没审核
  		 {{#  } }}
	</script>
	<!--是否发布  -->
	<script type="text/html" id="bPublish">
 		 {{#  if(d.bPublish == 1){ }}
  			  已发布
 		 {{#  } else { }}
  			 没发布
  		 {{#  } }}
	</script>
	<!--  -->
	<script type="text/html" id="bStatus">
 		 {{#  if(d.bStatus == 1){ }}
  			  存在
 		 {{#  } else { }}
  			 不存在
  		 {{#  } }}
	</script>
<script>
layui.config({
  version: '1560414887305' //为了更新 js 缓存，可忽略
});
 
layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
  var laydate = layui.laydate //日期
  ,laypage = layui.laypage //分页
  ,layer = layui.layer //弹层
  ,table = layui.table //表格
  ,carousel = layui.carousel //轮播
  ,upload = layui.upload //上传
  ,element = layui.element //元素操作
  ,slider = layui.slider //滑块
  
  //向世界问个好
  layer.msg('Hello World');
  

  
  //执行一个 table 实例
  table.render({
    elem: '#demo'
    ,height: 420
    ,url: '<%=basePath%>/article/demo/table/item.action' //数据接口
    ,title: '用户表'
    ,page: true //开启分页
    ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
    ,totalRow: true //开启合计行
    ,cols: [[ //表头
      {type: 'checkbox', fixed: 'left'}
      ,{field: 'bId', title: '文章编号', fixed: 'left' }
      ,{field: 'bSummary', title: '文章简介名' , fixed: 'left'}
      ,{field: 'bAuthor', title: '文章作者', fixed: 'left' }
      ,{field: 'bDate', title: '发表日期' , fixed: 'left'}
      ,{field: 'bVerify', title: '审核状态', templet: '#bVerify', fixed: 'left'}
      ,{field: 'bPublish', title: '发布状态', templet: '#bPublish', fixed: 'left'} 
      ,{field: 'bStatus', title: '存在状态',templet: '#bStatus', fixed: 'left'}
      ,{toolbar:'#barDemo',fixed: 'right',width:160}
    ]]
  });
  
  //监听头工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id)
    ,data = checkStatus.data; //获取选中的数据
    switch(obj.event){
      case 'add':
        layer.msg('添加');
      break;
      case 'update':
        if(data.length === 0){
          layer.msg('请选择一行');
        } else if(data.length > 1){
          layer.msg('只能同时编辑一个');
        } else {
          layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
        }
      break;
      case 'delete':
        if(data.length === 0){
          layer.msg('请选择一行');
        } else {
          layer.msg('删除');
        }
      break;
    };
  });
  
  //监听行工具事件
  table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
    var data = obj.data //获得当前行数据
    ,layEvent = obj.event; //获得 lay-event 对应的值
    if(layEvent === 'detail'){
    	console.log(data.bId);
    	console.log(layEvent +"    layEvent");
    	 window.location.href="<%=basePath%>/article/"+data.bId+".action";  
    } else if(layEvent === 'del'){
      layer.confirm('真的删除行么', function(index){
        obj.del(); //删除对应行（tr）的DOM结构
        layer.close(index);
        //向服务端发送删除指令
      });
    } else if(layEvent === 'edit'){
      layer.msg('编辑操作');
    }
  }); 
});   
</script>
</body>

</html>