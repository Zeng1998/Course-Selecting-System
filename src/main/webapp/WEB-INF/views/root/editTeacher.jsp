<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="head">
    <title>修改课程</title>
</rapid:override>
<rapid:override name="content">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <form class="layui-form" id="changeform" method="post" action="<%=basePath%>teacher/changeTeaPass" style="margin:80px 400px; width:450px;">
        <div class="layui-form-item">
            <label class="layui-form-label">教师账号</label>
            <div class="layui-input-block">
                <input value="${tea.teaId}" type="text" disabled = "disabled" name="teaId" id="teaId" placeholder="请输入课程名称" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">教师姓名</label>
            <div class="layui-input-block">
                <input value="${tea.teaName}" type="text" name="teaName" id="teaName"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">教师密码</label>
            <div class="layui-input-block">
                <input value="${tea.teaPass}" type="text" name="teaPass" id="teaPass" placeholder="请输入人数" autocomplete="off" class="layui-input">
            </div>
        </div>
    </form>
    <div class="layui-input-block" style="margin-left:500px;">
        <button type="button" onclick="javascript:history.back(-1);" class="layui-btn layui-btn-lg">
            返回上一页
        </button>
        <button type="button" id="success" class="layui-btn layui-btn-danger layui-btn-lg">
            确认提交
        </button>
    </div>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $(function () {
            $("#success").click(function () {
                var name = $("#teaName").val();
                var id = $("#teaId").val();

                var pass=$("#teaPass").val();
                var count=0;

                var content=id+"|"+name+"|"+pass;
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
                myform.action = "<%=basePath%>root/updateTeacherSuccess?page="+1;
                myform.submit();
                document.body.removeChild(myform);
            })
        })
    </script>
</rapid:override>
<%@ include file="base.jsp" %>
