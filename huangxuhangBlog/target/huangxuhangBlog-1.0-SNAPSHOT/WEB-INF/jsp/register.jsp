<%--
  Created by IntelliJ IDEA.
  User: 31586
  Date: 2020/11/28
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script>
        //注意：导航 依赖 element 模块，否则无法进行功能性操作
        layui.use(['element'],function(){
            var element = layui.element;
        });
        layui.use(['jquery','form','layer'], function(){
            var  $ = layui.jquery;
            var form = layui.form;
            var  layer = layui.layer;
            //监听提交
            form.on('submit(register)', function(data){
                console.log(data.field);
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/register/Register",
                    data:data.field,
                    success:function (data) {
                        if (data.toString() == '用户名存在'){
                            layer.msg("用户名已存在")
                        }else if (data.toString()=="注册成功"){
                            window.location.href="${pageContext.request.contextPath}/login/ToLogin"
                        }
                    }
                })
                return false
            })
        })

    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">注册</div>
        <ul class="layui-nav layui-layout-right" lay-filter="">
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/main/ToMain">主页</a></li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/login/ToLogin">返回</a></li>
        </ul>
    </div>
    <div class="layui-body">
        <form class="layui-form" >
            <div class="layui-form-item" style="margin-top: 30px">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                    <input type="text"  name="username" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码框</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" required lay-verify="required|number" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" >
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-inline">
                    <input type="text" name="email" required  lay-verify="email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="男" title="男" checked>
                    <input type="radio" name="sex" value="女" title="女" >
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="register">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
