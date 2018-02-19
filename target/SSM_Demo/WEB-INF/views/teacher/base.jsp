<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<html>
<head>
    <rapid:block name="head"></rapid:block>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/layui.css">
    <style type="text/css">
        .layui-nav-item.side a {
            font-size: 22px;
            margin: 10px;
        }
        /*解决Chrome下表单自动填充后背景色为黄色*/
        input:-webkit-autofill {
            -webkit-box-shadow: 0 0 0px 1000px white inset;
        }
    </style>
</head>
<body class="layui-layout-body" style="padding:10px 50px;">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<ul class="layui-nav layui-bg-blue">
    <li class="layui-nav-item"><a href="<%=basePath%>teacher/teacherIndex" style="font-size:20px;">首页</a></li>
    <!--这里${requestScope}取不到值，需要改为${param}-->
    <li class="layui-nav-item"><a href="<%=basePath%>teacher/teacherInfo?teaid=${sessionScope.teaid}" style="font-size:20px;">个人资料</a></li>
    <li class="layui-nav-item "><a href="<%=basePath%>teacher/courseList?page=1" style="font-size:20px;">我的课程信息</a></li>
    <li class="layui-nav-item" style="float:right; "><a href="<%=basePath%>exit" style="font-size: 20px;">退出登录</a></li>
    <li class="layui-nav-item" style="float:right; font-size:20px;"><i class="layui-icon" style="font-size:18px;" >&#xe612;</i>${sessionScope.username}&nbsp;</li>
</ul>
<rapid:block name="content"></rapid:block>
<script src="${pageContext.request.contextPath}/static/layui.all.js"></script>
</body>
</html>
