<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap 101 Template</title>

<!-- Bootstrap -->
<link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css">

</head>

<body>
	<div class="container" style="width: 90%;">
		<fieldset class=" ">
			<legend style="">
				<strong>文章撰写</strong>
			</legend>
		</fieldset>
		<br /> <br />
		<div>
			<form class="layui-form" action="javascript:;"
				id="articlePublishedForm">
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: 100px;">文章作者</label>
					<div class="layui-input-inline" style="width: 400px;">
						<input type="text" name="bAuthor" value="${admin.aName}"
							class="layui-input">
					</div>
				</div>
				<hr />
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: 100px;">文章简介</label>
					<div class="layui-input-inline" style="width: 400px;">
						<input type="text" name="bSummary" placeholder="请用简短的文字说明一下文章把！！！"
							class="layui-input">
					</div>
				</div>
				<hr />

				<div>
					<textarea id="editor_id" name="bContent"
						style="width: 700px; height: 300px;">
							&lt;strong&gt;HTML内容&lt;/strong&gt;
						</textarea>
				</div>

				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" onclick="articleSubmit()">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>

		</div>
	</div>

	<script src="<%=basePath%>/js/jquery-3.3.1.min.js"></script>
	<script src="<%=basePath%>/js/bootstrap.js"></script>
	<script src="<%=basePath%>/layui/layui.js"></script>
	<script charset="utf-8"  src="<%=basePath%>/kindeditor-master/kindeditor-all.js"></script>
	<script charset="utf-8" src="<%=basePath%>/kindeditor-master/lang/zh-CN.js"></script>
	<script type="text/javascript">
			KindEditor.ready(function(K) {
				window.editor = K.create('#editor_id',{
					resizeType: 1,
					allowFileManager:true,
					        //经测试，下面这行代码可有可无，不影响获取textarea的值
					        //afterCreate:function(){this.sync();}
					        //下面这行代码就是关键的所在，当失去焦点时执行this.sync();
					        afterBlur:function(){this.sync();}
				});
			});
			
			
			function articleSubmit(){
				alert( $('#articlePublishedForm').serialize());
				$.ajax({//几个参数需要注意一下
	                type: "GET",//方法类型
	                dataType: "json",//预期服务器返回的数据类型
	                url: "<%=basePath%>/article/articlePublished.action",
				data : $('#articlePublishedForm').serialize(),
				success : function(result) {
					if (result.status == 200) {
						alert("发布成功")
					}
					;
					
					 window.location.href="<%=basePath%>/article/toArticleWrite.action?";
				},
				error : function() {
					alert("异常！");
				}
			})
		}
	</script>
</body>

</html>