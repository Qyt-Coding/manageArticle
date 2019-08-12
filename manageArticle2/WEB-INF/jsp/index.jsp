<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap 101 Template</title>

<link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="<%=basePath%>/font-awesome-4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css">
<style>
.head {
	width: 100%;
	height: 250px;
	background-size: 100% 300px;
	background-image: url(img/stock-photo-129533117.jpg);
	padding: 1px;
}

.center-content {
	width: 240px;
	margin: 10px auto 0px;
}

.center-content-top {
	text-align: center;
	background: black;
	width: 170px;
	margin: 0px auto;
}

.a-black {
	color: black;
}

.box-bottom {
	margin: auto;
	width: 500px;
}

.login-regiser {
	margin: auto;
	width: 300px;
}
</style>

</head>

<body>
	<div class="head">
		<div class="center-content">
			<div class="center-content-top">
				<strong style="color: white; font-size: 22px;">Qyt-Coding</strong>
			</div>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i
					class="fa fa-github fa-2x" aria-hidden="true"></i>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i
					class="fa fa-rss-square  fa-2x" aria-hidden="true"></i>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i
					class="fa fa-weixin fa-2x" aria-hidden="true"></i> <br />
				&nbsp;&nbsp;&nbsp;&nbsp; <a class="a-black"
					href="https://github.com/TyCoding">GitHub</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="a-black"
					href="https://github.com/TyCoding">CSDN</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="a-black"
					href="https://github.com/TyCoding">WeiChat</a>
			</div>

		</div>
	</div>
	<div class="container">
		<div class="box-bottom">
			<h1 style="text-align: center; margin-top: 30px;">文章管理系统</h1>
			<h3 style="text-align: cente; margin: 20px auto;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp; <span id="login" style="cursor: pointer;">登录</span>
				&nbsp;&nbsp; <span id="register" style="cursor: pointer;">注册</span>
			</h3>
			<hr />
			<div class="login-regiser">
				<form id="login-form" class="layui-form" action="javascript:;"
					style="display: block;">
					<div class="layui-form-item">
						<label class="layui-form-label">用户名</label>
						<div class="layui-input-inline">
							<input type="aName" name="aName" required
								lay-verify="required" placeholder="请输入用户名" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">密码框</label>
						<div class="layui-input-inline">
							<input type="password" name="aPassword" required
								lay-verify="required" placeholder="请输入密码" autocomplete="off"
								class="layui-input">
						</div>
						<!--    <div class="layui-form-mid layui-word-aux">辅助文字</div>-->
					</div>

					<div class="layui-form-item">
						<label class="layui-form-label">验证码</label>
						<div class="layui-input-inline" style="width: 100px;">
							<input type="text" name="checkCode"  
								  placeholder="验证码" autocomplete="off"  onFocus="checkFocus()"
								class="layui-input">
						</div>
						<div class="layui-input-inline" style="width: 100px;">
							<img alt="图片无法显示" id="imgId" src="<%=basePath%>/checkCode.action?"+new Date()
								onclick="changeImg()" style="width: 80px; height: 30px;">
							<input type="hidden"  id="reCheckCode" name="reCheckCode" value="" >
						</div>
					</div>

					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" id="login-submit"
								onclick="loginSubmit1()">立即提交</button>
						</div>
					</div>
				</form>

				<!--第二个form表单-->
				<form id="register-form" class="layui-form" action="javascript:;"
					style="display: none;">
					<div class="layui-form-item">
						<label class="layui-form-label">用户名</label>
						<div class="layui-input-inline">
							<input type="aName" name="aName" required lay-verify="required"
								placeholder="请输入用户名" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">密码框</label>
						<div class="layui-input-inline">
							<input type="password" name="aPassword" required
								lay-verify="required" placeholder="请输入密码" autocomplete="off"
								class="layui-input">
						</div>
						<!--    <div class="layui-form-mid layui-word-aux">辅助文字</div>-->
					</div>

					<div class="layui-form-item">
						<label class="layui-form-label">手机号</label>
						<div class="layui-input-inline">
							<input type="aPhone" name="aPhone" required lay-verify="required"
								placeholder="请输入手机号码" autocomplete="off" class="layui-input">
						</div>
						<!--    <div class="layui-form-mid layui-word-aux">辅助文字</div>-->
					</div>

					<div class="layui-form-item">
						<label class="layui-form-label">验证码</label>
						<div class="layui-input-inline" style="width: 100px;">
							<input type="text" name="aCheckcode" required
								lay-verify="required" placeholder="验证码" autocomplete="off"
								class="layui-input">
						</div>
						<div class="layui-input-inline" style="width: 100px;">
							<input type="button" name="checkCodeBtn" id="checkCodeBtn"
								class="layui-input" value="获取验证码">
						</div>
					</div>

					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" type="button" id="register-submit"
								onclick="registerSubmit()">立即提交</button>
						</div>
					</div>
				</form>
				<!-- <button id="register-form"  onclick="registerSubmit()">立即提交</button> -->
			</div>

		</div>
	</div>

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="<%=basePath%>/js/jquery-3.3.1.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="<%=basePath%>/js/bootstrap.js"></script>
	<script src="<%=basePath%>/layui/layui.js"></script>
	<script>
			//Demo
			layui.use('form', function() {
				var form = layui.form;
				//监听提交
				form.on('submit(formDemo)', function(data) {
					layer.msg(JSON.stringify(data.field));
					return false;
				});
			});
			$('#login').click(function() {
				$("#register").css({
					'border': 'none',
					'color': '#393D49'
				});
				$(this).css({
					'border-bottom': '2px solid #009688',
					'color': '#009688'
				});
				$('#register-form').hide();
				$('#login-form').show();
			});
			$('#register').click(function() {
				$("#login").css({
					'border': 'none',
					'color': '#393D49'
				});
				$(this).css({
					'border-bottom': '2px solid #009688',
					'color': '#009688'
				});
				$('#login-form').hide();
				$('#register-form').show();
			});



			   function   registerSubmit(){  
				
				alert($('#register-form').serialize());
				$.ajax({
			            //几个参数需要注意一下
			                type: "POST",//方法类型
			                dataType: "json",//预期服务器返回的数据类型
			                url: "<%=basePath%>/register.action" ,
			                data: $('#register-form').serialize(),
			                success: function (result) {
			                    if (result.status == 200) {
			                    	layer.open({
			                    		  title: '注册成功'
			                    		  ,content: 'SUCCESS'
			                    		});     
			                    }
			                    ;
			                },
			                error : function() {
			                    alert("异常！");
			                }
			            });
				
				
				/* 以下代码是，当你注册完后，跳到登录界面的 */
				$("#register").css({
					'border': 'none',
					'color': '#393D49'
				});
				$(this).css({
					'border-bottom': '2px solid #009688',
					'color': '#009688'
				});
				$('#register-form').hide();
				$('#login-form').show();
			}
			   
			   
			   /* 验证码的  */
			 function changeImg(){
       				 document.getElementById("imgId").src="<%=basePath%>/checkCode.action?" +new Date();
    				}
			/* 到登录页面了 */  
		</script>


	<script>
		 function loginSubmit1(){
				
			 	var checkCode =$('#login-form  input[name="checkCode"]').val();
				var reCheckCode=$('#login-form  input[name="reCheckCode"]').val();
				if(checkCode!=reCheckCode)
				{
					layer.open({
           		  title: '失败'
           		  ,content: '验证码错误'
           		});   	
					return false;
				} 
				 
				 $.ajax({
			            	//几个参数需要注意一下
			                type: "POST",//方法类型
			                dataType: "json",//预期服务器返回的数据类型
			                url: "<%=basePath%>/login.action",
							data : $('#login-form').serialize(),
							success : function(result) {
							if (result.status == 200) {
							layer.open({
								title : '注册成功',
								content : 'SUCCESS'});
							 window.location.href="<%=basePath%>/System.action?"+new Date();
						};
						},
					error : function() {
						alert("异常！");
					}
					});
				 
				 
		}
	</script>
	<script >
	function checkFocus(){
		 $.ajax({
         	//几个参数需要注意一下
             type: "GET",//方法类型
             url: "<%=basePath%>/checkSession.action",
				success : function(result) {
				console.log(result);
				$('#reCheckCode').attr("value",result);
			},
		error : function() {
			alert("异常！");
		}
		});
	}
	</script>
</body>

</html>