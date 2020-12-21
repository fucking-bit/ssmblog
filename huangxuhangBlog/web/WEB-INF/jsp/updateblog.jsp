<%--
  Created by IntelliJ IDEA.
  User: 31586
  Date: 2020/12/11
  Time: 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title><%@ page import="com.blog.pojo.Admin" %><%--
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
        <title>修改博客</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
        <script src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    </head>
<body style="background-color: #fff9ec">
<!-- 导航--->
<jsp:include page="element/head.jsp"/>
<!-- 导航结束--->
<!-- 主体开始--->
<div class="layui-fluid" style="padding-top: 85px">
    <div class="layui-row layui-col-space28">
        <div class="layui-col-md8 layui-fluid" style="padding-left: 150px">
            <form class="layui-form">
                <fieldset class="layui-elem-field" style="border-color: #4E5465">
                    <legend>修改博客</legend>
                    <div class="layui-field-box">
                        <input type="hidden" id="blogid" value="'${article.id}'"/>
                        <input type="title" name="title" required lay-verify="title" placeholder="请输入标题" autocomplete="off" class="layui-input" value="${article.title}">
                        <textarea id="content" name="content" required lay-verify="content" >${article.content}</textarea>
                    </div>
                </fieldset>
                <div class="layui-input-block" style="position:absolute;right: 20px">
                    <button class="layui-btn"  lay-submit lay-filter="submit">立即修改</button>
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
    layui.use(['form','layedit'], function(){
        var layedit = layui.layedit;
        var form = layui.form;
        var index = layedit.build('content',{height:500}); //建立编辑器

        form.verify({
            content : function(value) {
                if (layedit.getContent(index)==""){
                    return "文章不能为空";
                }
            }
            ,title:function (value) {
                if (value==""){
                    return "标题不得为空";
                }
            }
        })

        form.on('submit(submit)', function(data){
            var id = document.getElementById("blogid").getAttribute("value")
            var data1 = {id:id,title:data.field.title,content:layedit.getContent(index)}
            console.log(data1)
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/edit/Publish",
                data:data1,
                success:function (data) {
                    if (data.toString()=="200"){
                        window.location.href="${pageContext.request.contextPath}/individualMyBlog/MyBlog"
                    }else if(data.toString()=="500"){
                        layer.msg("未知错误")
                    }
                }
            })
            return false;
        })

    });


</script>
</html>

</head>
<body>

</body>
</html>
