<%@ page import="com.blog.pojo.Admin" %><%--
  Created by IntelliJ IDEA.
  User: 31586
  Date: 2020/11/30
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>关于博主</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
</head>
<body style="background-color: #e2e2e2">
<!-- 导航--->
<jsp:include page="element/head.jsp"/>
<!-- 导航结束--->
<!-- 主体开始--->
<div class="layui-fluid" style="padding-top: 85px">
    <div class="layui-row layui-col-space28">
        <div class="layui-col-md8" style="padding-left: 150px">
            <div class="layui-card" >
                <div class="layui-card-header layui-bg-green" style="line-height: 60px;color: #ffffff;font-size: 18px">关于我</div>
                <div class="layui-card-body" style="line-height: 50px;color: #393D49;font-size: 18px">
                    <p>博主黄旭航，性别:男，广东省</p>
                    <p>只会灌水的社畜</p>
                    <p>认为java是世界上最好的语言</p>
                    <p>好读书，书龄近6年</p>
                    <p>学习java一年半，中间断断续续，踌躇着要不要考研</p>
                </div>
                <div class="layui-card-header layui-bg-green" style="line-height: 60px;color: #ffffff;font-size: 18px">关于博客</div>
                <div class="layui-card-body" style="line-height: 50px;color: #393D49;font-size: 18px">
                    <p>个人的技术博客</p>
                    <p>从2020年10月至今</p>
                    <p>交流java经验，记录开发遇到的bug以及解决方法</p>
                    <p> 不定期会灌水</p>
                    <p>欢迎大家前来灌水</p>
                </div>
            </div>
        </div>
        <div class="layui-col-md4 layui-fluid" style="padding-right: 150px">
            <jsp:include page="element/right.jsp" flush="true"/>
        </div>
    </div>
</div>
<!-- 主体结束--->
</body>
<script>
    //JavaScript代码区域
    layui.use(['element','layer'], function(){
        var element = layui.element;

    });
</script>
</html>
