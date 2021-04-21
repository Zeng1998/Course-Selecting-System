<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="head">
    <title>添加新学生</title>
</rapid:override>
<rapid:override name="content">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <form class="layui-form" id="changeform" method="post" action="<%=basePath%>root/changeTeaPass" style="margin:80px 400px; width:450px;">
        <div class="layui-form-item">
            <label class="layui-form-label">教师账号</label>
            <div class="layui-input-block">
                <input type="text" name="teaId" id="teaId" placeholder="请输入教师账号" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">教师姓名</label>
            <div class="layui-input-block">
                <input type="text" name="teaName" id="teaName" placeholder="请输入教师姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">教师密码</label>
            <div class="layui-input-block">
                <input type="text" name="teaPass" id="teaPass" placeholder="请输入教师密码" autocomplete="off" class="layui-input">
            </div>
        </div>

    </form>
    <button type="button" id="success" class="layui-btn layui-btn-danger layui-btn-lg" style="margin:0 550px;">
        确认提交
    </button>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $(function () {
            $("#success").click(function () {
                var teaId = $("#teaId").val();
                var teaName = $("#teaName").val();
                var teaPass = $("#teaPass").val();

                var count=0;

                var content=teaId+"|"+teaName+"|"+teaPass;
                var myform=document.createElement("form");
                myform.id = "form1";
                myform.name = "form1";
                document.body.appendChild(myform);
                var input = document.createElement("input");
                input.type = "text";
                input.name = "content";
                input.value = encodeURIComponent(encodeURIComponent(content));
                myform.appendChild(input);
                myform.method = "POST";
                myform.action = "<%=basePath%>root/insertTeacherSuccess?page="+1;
                myform.submit();
                document.body.removeChild(myform);
            })
        })
    </script>
</rapid:override>
<%@ include file="base.jsp" %>
