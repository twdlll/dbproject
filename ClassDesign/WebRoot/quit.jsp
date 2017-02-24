<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_tools.AboutSQL"%>
<jsp:useBean id="aboutSQL" scope="session" class="db_tools.AboutSQL"></jsp:useBean>
<html>
<head>
<link href="css/main.css" rel="stylesheet"/>
</head>
<body class="main">
<p style="color:white;font-size:25px;text-align:center">正在清除一些缓存数据</p>
<%
Enumeration e=session.getAttributeNames(); 
while(e.hasMoreElements()){ 
String sessionName=(String)e.nextElement(); 
System.out.println("存在的session有："+sessionName); 
session.removeAttribute(sessionName); }
response.setHeader("Refresh","5;URL=index.html");
%>
</body>
</html>
