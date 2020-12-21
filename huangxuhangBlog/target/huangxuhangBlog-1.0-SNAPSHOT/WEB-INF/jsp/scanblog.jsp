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
    <title>${article.title}</title>
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
            <div class="layui-card">
                <div class="layui-card-header layui-bg-green">
                    ${article.title}
                    <span style="position: absolute;right: 10px;">作者：${name}</span>
                </div>
                <div class="layui-card-body">
                    ${article.content}
                </div>
            </div>
            <!--评论区-->
            <div style="padding-top: 30px">
                <div class="layui-card">
                    <div class="layui-card-header">评论区
                    </div>
                    <c:forEach items="${comments}" var="item">
                    <div class="layui-collapse">
                        <div class="layui-colla-item">
                            <h2 class="layui-colla-title">
                                <span><c:out value="${item.adminName}" escapeXml="false"></c:out></span>
                                <span style="position: absolute;right: 10px;">[<c:out value="${item.createTime}" escapeXml="false"></c:out>]</span></h2>
                            <div class="layui-colla-content layui-show"><c:out value="${item.content}" escapeXml="false"></c:out></div>
                        </div>
                    </div>
                    </c:forEach>

                </div>
            </div>
            <hr class="layui-bg-gray">
            <!--评论-->
            <form class="layui-form" action="">
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">评论</label>
                    <div class="layui-input-block">
                        <textarea name="content" placeholder="请输入内容" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="submit">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
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

    layui.use(['form'], function(){
        var form = layui.form;


        form.on('submit(submit)', function(data){
            var data1 = {content:data.field.content,bid:'${article.id}'}
            console.log(data1) //当前容器的全部表单字段，名值对形式：{name: value}
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/main/Comment",
                data:data1,
                success:function (data) {
                    if (data.toString()=="200"){
                       window.location.reload()
                    }else if(data.toString()=="500"){
                        layer.msg("未知错误")
                    }
                }
            })
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

    });

</script>
</html>
