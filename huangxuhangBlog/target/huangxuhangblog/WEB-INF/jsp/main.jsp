<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>个人博客</title>
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
            <div class="layui-col-md8 layui-fluid" style="padding-left: 150px">
                <div class="layui-carousel" id="slideshow">
                    <div carousel-item >
                        <div><img src="${pageContext.request.contextPath}/static/myImages/0.jpg"></div>
                        <div><img src="${pageContext.request.contextPath}/static/myImages/2.jpg"></div>
                        <div><img src="${pageContext.request.contextPath}/static/myImages/3.jpg"></div>
                    </div>
                </div>
                <div style="padding-top: 30px">
                    <div class="layui-card">
                        <div class="layui-card-header layui-bg-green">
                            热门博客
                        </div>
                        <div class="layui-card-body">
                            <ul>
                                <c:forEach items="${hotblog}" var="item">
                                <li style="margin: 4px 0px;border-bottom: 1px dotted #cccccc;padding: 4px;">
                                    <a href="${pageContext.request.contextPath}/main/ScanBlog?id=<c:out value="${item.id}" escapeXml="false"></c:out>"><span><c:out value="${item.title}" escapeXml="false"></c:out></span></a>
                                    <span style="position: absolute;right: 10px;">[<c:out value="${item.creatDate}" escapeXml="false"></c:out>]</span>
                                </li>
                                </c:forEach>
                            </ul>
                        </div>
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
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#slideshow'
            ,width: '100%' //设置容器宽度
            ,arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式

        });
    });

</script>
</html>
