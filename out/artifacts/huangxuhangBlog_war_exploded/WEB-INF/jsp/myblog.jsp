<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
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
    <title>我的博客</title>
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
        <div class="layui-col-md8 layui-fluid"  style="padding-left: 150px">
            <fieldset class="layui-elem-field">
                <legend>我的博客</legend>
                <c:forEach items="${myblog}" var="item">
                <div class="layui-card" style="margin-top: 10px">
                    <div class="layui-card-header"><a href="${pageContext.request.contextPath}/main/ScanBlog?id=<c:out value="${item.id}" escapeXml="false"></c:out>"><c:out value="${item.title}" escapeXml="false"></c:out></a></div>
                    <div class="layui-card-body">
                        <ul>
                            <li style="border-bottom: 1px dotted #c0c4cc;padding: 4px 0;">
                                <span >[<c:out value="${item.creatDate.toLocaleString()}" escapeXml="false"></c:out>]</span>
                                <div class="layui-btn-group" style="position: absolute;right: 10px;">
                                        <button type="button"  class="layui-btn layui-btn-sm" onclick="updateblog('${item.id}')">
                                            <i class="layui-icon">&#xe642;</i>
                                        </button>
                                        <button type="button" class="layui-btn layui-btn-sm" onclick="deleteblog('${item.id}')">
                                            <i class="layui-icon">&#xe640;</i>
                                        </button>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                </c:forEach>

            </fieldset>
            <div id="page"></div>
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

    function updateblog(id) {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/edit/WantUpdateeBlog",
            data:'id='+id,
            dataType:"json",
            success:function (data) {
                if (data.toString() == "200"){
                     window.location.href="${pageContext.request.contextPath}/edit/ToUpdateBlog"
                } else if (data.toString() == "500") {
                    layer.msg("未知错误")
                }
            }
        })
    }
    function deleteblog(id) {
        layer.confirm('确定删除？',function () {
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/edit/DeleteBlog",
                data:'id='+id,
                dataType:"json",
                success:function (data) {
                    if (data.toString() == "200"){
                        layer.msg("删除成功",{time:500},function () {
                            window.location.reload()
                        })
                    } else if (data.toString() == "500") {
                        layer.msg("删除失败")
                    }
                }
            })
            return false;
        })
    }
    //分页
    layui.use('laypage', function(){
        var laypage = layui.laypage;

        //执行一个laypage实例
        laypage.render({
            elem: 'page' //注意，这里的 test1 是 ID，不用加 # 号
            ,count: ${myblog.size()} //数据总数，从服务端得到

            ,jump: function(obj, first){
                //obj包含了当前分页的所有参数，比如：
                console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                console.log(obj.limit); //得到每页显示的条数

                    //首次不执行
                    if(!first){


                    }
                    //do something
                }
        });
    });

</script>
</html>
