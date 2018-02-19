<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="head">
    <title>修改密码</title>
</rapid:override>
<rapid:override name="content">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <form class="layui-form" id="changeform" method="post" action="<%=basePath%>student/changeStuPass" style="margin:80px 400px; width:450px;">
        <div class="layui-form-item">
            <label class="layui-form-label">原密码</label>
            <div class="layui-input-block">
                <input type="text" name="prepass" id="pre" placeholder="请输入原密码" autocomplete="off" class="layui-input">
            </div>
            <p>${msg}</p>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-block">
                <input type="text" name="nowpass" id="now" placeholder="请输入新密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-block">
                <input type="text" name="nowpassagain" id="again" placeholder="请确认新密码" autocomplete="off" class="layui-input">
            </div>
        </div>
    </form>
    <button type="button" class="layui-btn layui-btn-danger layui-btn-lg" style="margin:0 550px;">
        确认修改
    </button>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script >
        $(function () {
            $("button").click(function () {
                if($("#now").val()===$("#again").val()){
                    $("#changeform").submit();
                }
                else{
                    alert("两次输入的密码不同");
                }
            })
        })
    </script>
</rapid:override>
<%@ include file="base.jsp" %>
