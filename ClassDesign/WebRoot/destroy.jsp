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
String sql;
String userId=request.getParameter("userId").trim();
boolean isStore=userId.substring(0,1).equals("s");
if(isStore) sql="update stores set 是否可见='否' where 商家Id='"+userId+"'";
else sql="update customers set 是否可见='否' where 买家Id='"+userId+"'";

boolean flag=aboutSQL.executeUpdate(sql);
if(flag){
out.println("<p style=\"text-align:center;color:white\">注销成功</p>");}
else{out.println("<p style=\"text-align:center;color:white\">注销失败</p>");}
%>
</div>
</body>
</html>