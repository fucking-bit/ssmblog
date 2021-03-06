<%--
  Created by IntelliJ IDEA.
  User: 31586
  Date: 2020/11/25
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/layui/css/layui.css">
        <style type="text/css">
            .container{
                width: 420px;
                height: 320px;
                min-height: 320px;
                max-height: 320px;
                position: absolute;
                top: 0;
                left: 0;
                bottom: 0;
                right: 0;
                margin: auto;
                padding: 20px;
                z-index: 130;
                border-radius: 8px;
                background-color: #fff;
                box-shadow: 0 3px 18px rgba(100, 0, 0, .5);
                font-size: 16px;
            }
            .layui-input{
                border-radius: 5px;
                width: 300px;
                height: 40px;
                font-size: 15px;
            }
            .layui-form-item{
                margin-left: -20px;
            }
            #logoid{
                margin-top: -16px;
                padding-left:150px;
                padding-bottom: 15px;
            }
            .layui-btn{
                margin-left: -50px;
                border-radius: 5px;
                width: 350px;
                height: 40px;
                font-size: 15px;
            }
            .verity{
                width: 120px;
            }
            .font-set{
                font-size: 13px;
                text-decoration: none;
                margin-left: 120px;
            }
            a:hover{
                text-decoration: underline;
            }

        </style>
    </head>
    <body>
    <form class="layui-form" >
        <div class="container">
            <div class="layui-form-mid layui-word-aux">
                <img id="logoid" src="${pageContext.request.contextPath}/static/myImages/1.jpg" height="35">
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input type="text"  name="username"  required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" />
                </div>

            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密 &nbsp;&nbsp;码</label>
                <div class="layui-input-inline">
                    <input type="password" name="password"  required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input"/>
                </div>

            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">验证码</label>
                <div class="layui-input-inline">
                    <input type="text" name="code"  required lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input "/>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <img id="captchaImage"  onclick="changeImage()" src="${pageContext.request.contextPath}/login/GetCode">
                </div>

            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="login">登陆</button>
                </div>
            </div>
                <a href="" class="font-set">忘记密码?</a>  <a href="${pageContext.request.contextPath}/register/ToRegister" class="font-set">立即注册</a>
        </div>
    </form>
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
    <script type="text/javascript">
        layui.use(['jquery','form','layer'], function(){
            var  $ = layui.jquery;
            var form = layui.form;
            var  layer = layui.layer;
            form.on('submit(login)', function(data){
                console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                //return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/login/Login",
                    data:data.field,
                    success:function (data) {
                        if (data.toString() == 'NNO'){
                            layer.msg("用户名不存在")
                        }else if (data.toString()=="PNO"){
                            layer.msg("密码错误")
                        }else if (data.toString()=="CNO"){
                            layer.msg("验证码错误")
                        } else {
                            window.location.href="${pageContext.request.contextPath}/main/ToMain"
                        }
                    }
                })
                return false;
            })

        })
        function changeImage() {
            $("#captchaImage").attr({"src":"${pageContext.request.contextPath }/login/GetCode?w="+Math.random()})
        }
    </script>
    </body>
</html>
