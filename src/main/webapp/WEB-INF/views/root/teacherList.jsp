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
        <button type="button" onclick="insert()" class="layui-btn layui-btn-lg layui-btn-warm" style="margin-top:15px;">添加新教师</button>
    </div>
    <script>
        function insert() {
            window.location.href="<%=basePath%>root/insertTeacher";
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
            <th>教师账号</th>
            <th>教师姓名</th>
            <th>教师密码</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${paging.dataList}" var="tea">
            <tr>
                <td>${tea.teaId}</td>
                <td>${tea.teaName}</td>
                <td>${tea.teaPass}</td>

                <td>
                    <button class="layui-btn" onclick="edit(${tea.teaId})">修改</button>
                    <button class="layui-btn" onclick="delete_fun(${tea.teaId})">删除</button>
                    <button class="layui-btn" onclick="detail_fun(${tea.teaId})">管理</button>
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
            window.location.href="<%=basePath%>root/teacherList?page="+page;
        }
        function edit(teaId) {
            window.location.href="<%=basePath%>root/editTeacher?teaId="+teaId;
        }
        function delete_fun(teaId) {
            var r=confirm("确认删除吗？")
            if (r==true)
            {
                window.location.href="<%=basePath%>root/deleteTeacher?teaId="+teaId;
            }
            else
            {
                return;
            }
        }
        function detail_fun(teaId) {
            window.location.href="<%=basePath%>root/courseTeaList?teaId="+teaId+"&page="+1;
        }
    </script>
</rapid:override>
<%@ include file="base.jsp" %>
