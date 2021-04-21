<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="head">
    <title>学生信息</title>
</rapid:override>
<rapid:override name="content">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    %>
    <div>
        <button type="button" onclick="insert()" class="layui-btn layui-btn-lg layui-btn-warm" style="margin-top:15px;">添加新学生</button>
    </div>
    <script>
        function insert() {
            window.location.href="<%=basePath%>root/insertStudent";
        }
    </script>
    <table class="layui-table" style="margin-top:15px;">
        <colgroup>
            <col width="100">
            <col width="120">
            <col width="50">
            <col width="50">
            <col width="200">
            <col width="120">
        </colgroup>
        <thead>
        <tr>
            <th>学生账号</th>
            <th>学生姓名</th>
            <th>学生密码</th>
            <th>学生学院</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${paging.dataList}" var="stu">
            <tr>
                <td>${stu.stuId}</td>
                <td>${stu.stuName}</td>
                <td>${stu.stuPass}</td>
                <td>${stu.insId}</td>

                <td>
                    <button class="layui-btn" onclick="edit(${stu.stuId})">修改</button>
                    <button class="layui-btn" onclick="delete_fun(${stu.stuId})">删除</button>
                    <button class="layui-btn" onclick="detail_fun(${stu.stuId})">管理</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div style="text-align:center; margin-top:10px; margin-left:-100px;" >
        <c:if test="${paging.totalPage >=0}">
            <p style=" color: black; font-size:16px; margin-bottom:10px;">当前第 ${paging.currentPage } 页/共  ${paging.totalPage} 页</p>
            <c:choose>
                <c:when test="${paging.totalPage==0}">
                    <button class="layui-btn layui-btn-disabled" onclick="goPage(1)">首页</button>
                    <button class="layui-btn layui-btn-disabled" onclick="goPage(${paging.currentPage-1})">上一页</button>
                    <button class="layui-btn layui-btn-disabled" onclick="goPage(${paging.currentPage+1})">下一页</button>
                    <button class="layui-btn layui-btn-disabled" onclick="goPage(${paging.totalPage})">末页</button>
                </c:when>
                <c:when test="${paging.currentPage==1 && paging.totalPage==1}">
                    <button class="layui-btn" onclick="goPage(1)">首页</button>
                    <button class="layui-btn layui-btn-disabled" onclick="goPage(${paging.currentPage-1})">上一页</button>
                    <button class="layui-btn layui-btn-disabled" onclick="goPage(${paging.currentPage+1})">下一页</button>
                    <button class="layui-btn" onclick="goPage(${paging.totalPage})">末页</button>
                </c:when>
                <c:when test="${paging.currentPage==1 && paging.totalPage>1}">
                    <button class="layui-btn" onclick="goPage(1)">首页</button>
                    <button class="layui-btn layui-btn-disabled" onclick="goPage(${paging.currentPage-1})">上一页</button>
                    <button class="layui-btn" onclick="goPage(${paging.currentPage+1})">下一页</button>
                    <button class="layui-btn" onclick="goPage(${paging.totalPage})">末页</button>
                </c:when>
                <c:when test="${paging.currentPage>1 && paging.currentPage<paging.totalPage}">
                    <button class="layui-btn" onclick="goPage(1)">首页</button>
                    <button class="layui-btn" onclick="goPage(${paging.currentPage-1})">上一页</button>
                    <button class="layui-btn" onclick="goPage(${paging.currentPage+1})">下一页</button>
                    <button class="layui-btn" onclick="goPage(${paging.totalPage})">末页</button>
                </c:when>
                <c:when test="${paging.currentPage>1 && paging.currentPage==paging.totalPage}">
                    <button class="layui-btn" onclick="goPage(1)">首页</button>
                    <button class="layui-btn" onclick="goPage(${paging.currentPage-1})">上一页</button>
                    <button class="layui-btn layui-btn-disabled" onclick="goPage(${paging.currentPage+1})">下一页</button>
                    <button class="layui-btn" onclick="goPage(${paging.totalPage})">末页</button>
                </c:when>
            </c:choose>
        </c:if>
    </div>
    <script>
        function goPage(page){
            window.location.href="<%=basePath%>root/studentList?page="+page;
        }
        function edit(stuId) {
            window.location.href="<%=basePath%>root/editStudent?stuId="+stuId;
        }
        function delete_fun(stuId) {
            var r=confirm("确认删除吗？")
            if (r==true)
            {
                window.location.href="<%=basePath%>root/deleteStudent?stuId="+stuId;
            }
            else
            {
                return;
            }
        }
        function detail_fun(stuId) {
            window.location.href="<%=basePath%>root/checkedCourseList?stuId="+stuId+"&page="+1;
        }
    </script>
</rapid:override>
<%@ include file="base.jsp" %>