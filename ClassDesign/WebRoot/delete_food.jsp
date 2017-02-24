<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="db_tools.AboutSQL"%>
<%@page import="javax.swing.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
</head>
<body>
<jsp:useBean id="aboutSQL" scope="session" class="db_tools.AboutSQL"/>
<div style="margin:10px auto">
<%
//session.setAttribute("userId","");
String foodId=request.getParameter("foodId");
out.println("<p style=\"text-align:center;color:white\">食品号:"+foodId+"：<br>");
String sql="delete from food where 食品号='"+foodId+"';";
aboutSQL.executeUpdate(sql);

out.println("删除成功<br>");
out.println("即将跳回原页面</p>");
response.setHeader("Refresh","2;URL=show_food.jsp");
%>
</div>
</body>
</html>