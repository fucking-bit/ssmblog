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
        <div class="layui-col-md8 layui-fluid"  style="padding-left: 150px">
            <table class="layui-table">
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col>
                </colgroup>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>昵称</th>
                    <th>邮箱</th>
                    <th>创建时间</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>${id}</td>
                    <td>${name}</td>
                    <td>${email}</td>
                    <td>${time}</td>
                </tr>
                </tbody>
            </table>
            <button type="button" class="layui-btn" id="message">给博主留言</button>
            <div class="layui-card" style="margin-top: 10px">
                <div class="layui-card-header">我的留言</div>
                <div class="layui-card-body">
                    <ul>
                        <li style="border-bottom: 1px dotted #c0c4cc;padding: 4px 0;">
                            <span>第一条留言</span>
                            <span style="position: absolute;right: 10px;">[12-05]</span>
                        </li>
                        <li style="border-bottom: 1px dotted #c0c4cc;padding: 4px 0;">
                            <span>第一条留言</span>
                            <span style="position: absolute;right: 10px;">[12-05]</span>
                            <div style="background-color: #2F4056;color: #ffffff;padding: 8px;">
                                回复：博主已回复
                            </div>
                        </li>
                        <li style="border-bottom: 1px dotted #c0c4cc;padding: 4px 0;">
                            <span>第一条留言</span>
                            <span style="position: absolute;right: 10px;">[12-05]</span>
                            <div style="background-color: #2F4056;color: #ffffff;padding: 8px;">
                                回复：博主已回复
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <form class="layui-form" action="" id="msgform" style="display: none">
                <div class="layui-form-item layui-form-text" style="padding: 8px 20px;">
                        <textarea name="desc" placeholder="你想说什么" class="layui-textarea"></textarea>
                </div>
                <div class="layui-form-item" style="padding: 8px 20px;">
                        <button class="layui-btn" lay-submit lay-filter="msgadd" >立即提交</button>
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
    //单击显示隐藏的文本域
    $("#message").click(function () {
        layer.open({
            type:1,
            content:$("#msgform"),
            area:['300px','auto']
        })
    })
    layui.use(['form','jquery'], function(){
        var form = layui.form;
        var $ = layui.jquery;
        form.on('submit(msgadd)', function(data){
            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/individualMyBlog/MsgAdd",
                data:data.field,
            })
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
    });
</script>
</html>
