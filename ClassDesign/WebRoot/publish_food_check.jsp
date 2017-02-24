<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="db_tools.AboutSQL"%>
<%@page import="javax.swing.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<link href="css/main" rel="stylesheet"/>
</head>
<body class="main">
<jsp:useBean id="aboutSQL" scope="session" class="db_tools.AboutSQL"/>
<div style="margin:10px auto">
<%
//session.setAttribute("userId","");
String foodId=request.getParameter("foodId");
String userId=request.getParameter("userId");
String foodName=request.getParameter("foodName");
String foodVarity=request.getParameter("foodVarity");
int price=Integer.parseInt(request.getParameter("price"));
String foodIntroduce=request.getParameter("foodIntroduce");

String sql="insert into food_view values('"+
           foodId+"','"+
           foodName+"','"+
           userId+"','"+
           foodVarity+"',"+
           price+",'"+
           foodIntroduce+"');";
           
boolean flag=aboutSQL.executeUpdate(sql);

if(flag){
out.println("<p style=\"text-align:center;color:white;font-size:20px\">商家:"+userId+"发布食品成功<br>");
out.println("即将进入已发布食品页面");
response.setHeader("refresh", "2;URL=show_food.jsp");
}else{
out.println("<p style=\"text-align:center;color:white;font-size:20px\">用户"+userId+":发布食品失败<br>");
out.println("请重新发布<br>");
out.println("即将跳回食品发布页面");
response.setHeader("refresh", "2;URL=publish_food.jsp");
}
%>
</div>
</body>
</html>