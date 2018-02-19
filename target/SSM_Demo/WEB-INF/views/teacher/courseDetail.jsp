<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<rapid:override name="head">
    <title>课程管理</title>
</rapid:override>
<rapid:override name="content">
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
        String courseid=request.getParameter("courseid");
        String now_page=request.getParameter("page");
    %>
    <div style="margin:10px 15px 10px;">
        <div class="layui-input-block">
            <button type="button" class="layui-btn" style="float:right;" onclick="search()">搜索</button>
            <input type="text" id="search" class="layui-input" style="float:right; width:200px;">
        </div>
    </div>
    <table class="layui-table" style="margin-top:15px;">
        <colgroup>
            <col width="100">
            <col width="80">
            <col width="100">
            <col width="50">
            <col width="200">
        </colgroup>
        <thead>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>学院</th>
                <th>分数</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${paging.dataList}" var="stu">
                <tr>
                    <td>${stu.stuId}</td>
                    <td>${stu.stuName}</td>
                    <td>${stu.insName}</td>
                    <td>${stu.tempScore}</td>
                    <td>
                        <input type="text" class="layui-input" id="${stu.stuId}" value="${stu.tempScore}" style="width:50px; display: inline-block;">
                        <button class="layui-btn" onclick="update_score(${stu.stuId})">评分</button>
                        <button class="layui-btn" onclick="delete_fun(${stu.stuId})">删除</button>
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
            window.location.href="<%=basePath%>teacher/detailCourse?courseid=<%=courseid%>&page="+page;
        }
        function update_score(stuId) {
            var s=document.getElementById(stuId).value;
            window.location.href="<%=basePath%>teacher/updateScore?courseid=<%=courseid%>"+"&stuId="+stuId+"&score="+s+"&page=<%=now_page%>";
        }
        function delete_fun(stuId) {
            var r=confirm("确认删除吗？")
            if (r==true)
            {
                window.location.href="<%=basePath%>teacher/deleteStuCourse?courseid=<%=courseid%>&stuid="+stuId;
            }
            else
            {
                return;
            }
        }
        function search() {
            var stuid=document.getElementById("search").value;
            window.location.href="<%=basePath%>teacher/searchStu?stuid="+stuid+"&courseid="+<%=courseid%>;
        }
    </script>
</rapid:override>
<%@ include file="base.jsp" %>
