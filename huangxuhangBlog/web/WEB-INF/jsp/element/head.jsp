<%@ page import="com.blog.pojo.Admin" %><%--
  Created by IntelliJ IDEA.
  User: 31586
  Date: 2020/12/5
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 导航--->
<div style="background-color: #393D49;position: fixed;width: 100%;z-index: 999"><!--z-index 属性设置元素的堆叠顺序。拥有更高堆叠顺序的元素总是会处于堆叠顺序较低的元素的前面。 fixed固定-->
    <div class="layui-fluid">
        <div class="layui-row">
            <div class="layui-col-md12">
                <ul class="layui-nav">
                    <span style="position: relative;display: inline-block;vertical-align: middle;line-height: 60px;color: #fff9ec;margin: 0 20px;font-size: 18px">个人博客</span>
                    <li class="layui-nav-item ${main}">
                        <a href="${pageContext.request.contextPath}/main/ToMain"><i class="layui-icon layui-icon-home">&nbsp;&nbsp;首页</i></a>
                    </li>
                    <li class="layui-nav-item ${talk}">
                        <a href="${pageContext.request.contextPath}/discuss/ToDiscussPage"><i class="layui-icon layui-icon-dialogue">&nbsp;&nbsp;交流社区</i></a>
                    </li>
                    <li class="layui-nav-item ${about}">
                        <a href="${pageContext.request.contextPath}/about/ToAbout"><i class="layui-icon layui-icon-about">&nbsp;&nbsp;关于</i></a>
                    </li>
                    <li class="layui-nav-item ${edit}">
                        <a href="${pageContext.request.contextPath}/edit/ToEdit"><i class="layui-icon layui-icon-edit">&nbsp;&nbsp;写博客</i></a>
                    </li>
                    <li class="layui-nav-item" style="position: absolute;right: 10px">
                        <%Admin admin = (Admin) request.getSession().getAttribute("admin");
                            if (admin != null){%>
                        <a href="javascript:;"><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
                        <dl class="layui-nav-child" style="text-align: center">
                            <dd><a href="${pageContext.request.contextPath}/individualMyBlog/Information">基本资料</a></dd>
                            <dd><a href="${pageContext.request.contextPath}/individualMyBlog/MyBlog">我的博客</a></dd>
                            <dd><a href="javascript:;" onclick="out('${admin.name}')">退出登录</a></dd>
                        </dl>
                        <%}else{%>
                        <a href="${pageContext.request.contextPath}/login/ToLogin">登录</a>
                        <% } %>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script>
    function out(name) {
        layer.confirm('确定退出？',function () {
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/main/Cancel",
                data:'name='+name,
                success:function (data) {
                    if (data == 'OK'){
                        layer.msg("退出成功",{time:500},function () {
                            window.location.href = "${pageContext.request.contextPath}/main/RefreshMain"
                        })
                    }else {
                        layer.msg("退出失败")
                    }
                }
            })
        })
    }

</script>
