<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="head">
    <title>首页</title>
</rapid:override>
<rapid:override name="content">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <div style="width:600px; height:450px; margin:100px 350px; border:3px solid gray;">
        <h2 style="text-align: center; margin-top: 25px; margin-bottom: 25px;">选课系统（学生版）</h2>
        <h3 style="margin-left:50px; margin-bottom: 10px;">1.登陆后请及时修改初始密码（个人资料）</h3>
        <h3 style="margin-left:50px; margin-bottom: 10px;">2.在（选课）中进行选课、查看、管理已选课程</h3>
    </div>
</rapid:override>
<%@ include file="base.jsp"%>