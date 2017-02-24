<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="db_tools.AboutSQL"%>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<link href="css/main.css" rel="stylesheet"/>
</head>
<body class="main">
<%
String foodId=request.getParameter("foodId");
Map<String,Integer> buy =(Map<String,Integer>)session.getAttribute("buy");
if(buy==null) buy=new HashMap<String,Integer>();
Integer num=buy.get(foodId);
if(num==null) num=new Integer(1);
else num=num+1;
buy.remove(foodId);
buy.put(foodId,num);
session.setAttribute("buy",buy);
//测试代码
//System.out.println(buy);
out.println("<p style=\"color:white;text-align:center\">已添加至外卖车<br>");
out.println("即将返回显示外卖店页面</p>");
response.setHeader("Refresh","2;URL=show_stores.jsp");
%>
</body>
</html>