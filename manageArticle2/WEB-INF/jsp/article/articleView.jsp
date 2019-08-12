<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>开始使用layui</title>
		<link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css">
		<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css">
		<link rel="stylesheet" href="<%=basePath%>/css/child_index.css">
		<style>
			.span1 {
				font-weight: 700;
				font-size: 18px;
			}
			
			.span2 {
				font-size: 16px;
			}
		</style>

	</head>

	<body>
		<div class="container" style="width: 80%;">
			<br />
			<br />
			<h1 style="text-align: center;">${article.bSummary}</h1>
			<br />
			<br />
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${article.bContent}
			</div>
			<br />
			<br />

			<hr style="height: 3px;border:2 dotted #ddd; padding-left: 10px;" />
			<div style="border-left: 3px solid #f44336;padding-left: 20px;">
				<p>
					<div>
						<span class="span1">本文作者：</span>
						<span class="span2">${article.bAuthor}</span>
					</div>
					<div style="margin-top: 10px;">
						<span class="span1">发表时间：</span>
						<span class="span2">${article.bDate}</span>
					</div>
				</p>
			</div>
			<br />
			<br />
			<br />
			<br />
			<div>
				<form class="layui-form" action="javascript();;"  id="leaveForm">
					
					<input type="hidden"  name="bId" value="${article.bId}" />
					
					
					
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label">留言区</label>
						<div class="layui-input-block">
							<textarea id="editor_id" name="cContent"
						style="width: 700px; height: 300px;" >
							
						</textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button type="button" class="layui-btn" onclick="leaveSubmit()"  >立即提交</button>
						</div>
					</div>
				</form>

			</div>
			
			<br>
			<hr>
			<!--  下面是评论代码-->
			<!--全部评论-->
			<div class="allComment">
			
		 	<c:forEach items="${leaveWordReplayAAlist}" var="item" > 
				<div class="comments">
					<div class="media" style="">
						<div class="media-left ">
							<a href="#"><img src="<%=basePath%>/img/tx4.jpg" class="media-object img-rounded" style="width: 60px;height: 60px;"></a>
						</div>
						<div class="media-body">
							<!--设置为浮动  显示评论时间-->
							<p class="time" style="float: right;">${item.leaveWords.cDate }</p>
						
							<h4 class="media-heading" style="margin-bottom: 10px;">${item.leaveWords.cName }</h4>

							<p>${item.leaveWords.cContent }</p>
							<p class="float_right">
								<a href="#"><span>赞👍</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="#"><span>踩👎</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="javascript:;"  onclick="reply_comments(this)"><span>回复</span></a>

							</p>
							<input  type="hidden"  class="dForReply"  value="${item.leaveWords.cId}" > 
							<div class="clean"></div>
							<div class="reply_commonts">
								<!--额外加的代码-->
								<c:forEach items="${item.replyList}"  var="re">
								
									<div class="comments">
										<div class="media" style="">
											<div class="media-left ">
												<a href="#"><img src="<%=basePath%>/img/tx4.jpg" class="media-object img-rounded" style="width: 60px;height: 60px;"></a>
											</div>
											<div class="media-body">
												<!--设置为浮动  显示评论时间-->
												<p class="time" style="float: right;">${re.dDate}</p>
												<h4 class="media-heading" style="margin-bottom: 10px;">${re.dName}</h4>
											
												<p>${re.dContent}</p>
												<p class="float_right">
													<a href="#"><span>赞👍</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="#"><span>踩👎</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="javascript:;"  onclick="reply_smallComments(this)"><span>回复</span></a>
		
												</p>
												<div class="clean"></div>
											</div>
										</div>
									</div>
								</c:forEach>
								
								
								<!---->
								<div class="reply_commonts_div float_left">
									<textarea class="textarea1"   ></textarea>
								</div>
								<div class="reply_commonts_button float_left"><a href="javascript:;"   onclick="replyA(this)"  class="a_color_white" 
								style="width: 100%; height: 100%;display: inline-block;">回复</a></div>
							</div>
						</div>
					</div>
				</div>
			 </c:forEach> 
			</div>
		</div>

		<!-- 你的HTML代码 -->
		<script src="<%=basePath%>/js/jquery-3.3.1.min.js"></script>
		<script src="<%=basePath%>/layui/layui.js"></script>
		<script src="<%=basePath%>/js/bootstrap.js"></script>
		<script charset="utf-8" src="<%=basePath%>/kindeditor-master/kindeditor-all.js"></script>
		<script charset="utf-8" src="<%=basePath%>/kindeditor-master/lang/zh-CN.js"></script>
		<script >
		var dForName='';
		var dForArticleId=${article.bId};
		var dName="${sessionScope.admin.aName}";
		
		function reply_comments(obj){
			
			dForName=$(obj).parent().siblings("h4").first().html();
			console.log(dForName);
			
			$(obj).parent().siblings(".reply_commonts").toggle();
			$(obj).parent().siblings(".reply_commonts").find('.reply_commonts_div').first().children('textarea').text('@'+dForName);
			
		}

			function reply_smallComments(obj){
				dForName=$(obj).parent().siblings("h4").first().html();
				
				console.log(dForName);
				$(obj).parents('.comments').siblings(".reply_commonts_div").first().children('textarea').text('@'+dForName);
				
			}
		</script>
		
		<script>
			//一般直接写在一个js文件中
			layui.use(['layer', 'form'], function() {
				var layer = layui.layer,
					form = layui.form;
				layer.msg('Hello World');
			});
		</script>
		<script type="text/javascript">
			KindEditor.ready(function(K) {
				window.editor = K.create('#editor_id' ,
						{
					resizeType: 1,
					allowFileManager:true,
					        //经测试，下面这行代码可有可无，不影响获取textarea的值
					        //afterCreate:function(){this.sync();}
					        //下面这行代码就是关键的所在，当失去焦点时执行this.sync();
					        afterBlur:function(){this.sync();}
					});
			});
		</script>
		<script type="text/javascript">
			function leaveSubmit(){
				alert($('#leaveForm').serialize());
				
				 var bId=$('#leaveForm input[name="bId"]').val();
				var cContent=$('#editor_id').val(); 
				alert(cContent);
				$.ajax({
			            //几个参数需要注意一下
			                type: "POST",//方法类型
			                dataType: "json",//预期服务器返回的数据类型
			                url: "<%=basePath%>/article/leaveWord.action" ,
			                data: $('#leaveForm').serialize(),
			                success: function (result) {
			                    if (result.status == 200) {
			                    	layer.open({
			                    		  title: '发布成功'
			                    		  ,content: '留言成功'
			                    		});     
			                    }
			                    ;
			                },
			                error : function() {
			                    alert("异常！");
			                }
			            });
				 window.location.href="<%=basePath%>/article/"+${article.bId}+".action";
				/* window.location.reload(); */
			}
		
		</script>
		
		<script >
			function replyA(obj){
				var dContent=$(obj).parent('.reply_commonts_button').siblings('.reply_commonts_div').first().children('textarea').val();
				var dForReply=$(obj).parents('.reply_commonts').siblings('.dForReply').val();
				
				
				
				 $.ajax({
		            	//几个参数需要注意一下
		                type: "GET",//方法类型
		                dataType: "json",//预期服务器返回的数据类型
		                url: "<%=basePath%>/article/reply.action",
						data :{"dId":null,"dName":dName,"dDate":null,
							"dContent":dContent,"dForName":dForName,
							"dForWords":null,"dForReply":dForReply,"dForArticleId":dForArticleId},
						success : function(result) {
						if (result.status == 200) {
						layer.open({
							title : '回复成功',
							content : 'SUCCESS'});
					};
					},
				error : function() {
					alert("异常！");
				}
				});
				 
				 window.location.href="<%=basePath%>/article/"+${article.bId}+".action";
			}
		</script>
		
	</body>

</html>