<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 31586
  Date: 2020/12/2
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="layui-card">
    <div class="layui-card-header ">搜索博客</div>
    <div class="layui-card-body">
        <form class="layui-form" action="${pageContext.request.contextPath}/main/Search">
            <div class="layui-input-inline">
                <input type="text" name="title" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" >
            </div>
            <button class="layui-btn" lay-submit lay-filter="title"><i class="layui-icon layui-icon-search" style="position: center"></i></button>
        </form>
    </div>
</div>

<div class="layui-card">
    <div class="layui-card-header layui-bg-green">活跃周榜top10</div>
    <div class="layui-card-body">
        <ul>
            <c:forEach items="${admins}" var="item">
                <li style="border-bottom: 1px dotted #c0c4cc;padding: 4px 0;">
                    <div>
                        <span><c:out value="${item.name}" escapeXml="false"></c:out></span>
                        <span style="position: absolute;right: 10px;">评论数:<c:out value="${item.sign}" escapeXml="false"></c:out></span>
                    </div>
                    <span>个性签名</span>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<script>
    layui.use(['jquery','form','layer'], function(){
        var  $ = layui.jquery;
        var form = layui.form;
        var  layer = layui.layer;
        form.on('submit(title)', function(data){
            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            //return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
        })

    })
</script>