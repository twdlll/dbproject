<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="db_tools.AboutSQL"%>
<%@page import="javax.swing.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<link href="css/main.css" rel="stylesheet"/>
</head>
<body class="main">
<jsp:useBean id="aboutSQL" scope="session" class="db_tools.AboutSQL"/>
<div style="margin:10px auto" class="littleTitle">

<%

String userId=request.getParameter("userId");
String password=request.getParameter("password");
String checkCode=request.getParameter("checkCode");
String yzm=session.getAttribute("code").toString();
String varity;
if(userId.substring(0,1).equals("m")) varity="管理员";
else if(userId.substring(0,1).equals("s")) varity="商家";
else varity="买家";


String sql="";int k=0;
String userName;
String realPassword;
if(!checkCode.equalsIgnoreCase(yzm)){
out.println("<p style=\"text-align:center\">验证码错误<br>");
out.println("即将跳回登录页面</p>");
k++;
}
if(k>0){
response.setHeader("refresh", "3;URL=login.jsp");}

else{
if(varity.equals("商家")) sql="select 商家Id,商家姓名,商家密码 from stores_view where 商家Id='"+userId+"'";
else if(varity.equals("管理员")) sql="select 管理员Id,管理员姓名,管理员密码 from managers where 管理员Id='"+userId+"'";
else sql="select 买家Id,买家姓名,买家密码 from customers_view where 买家Id='"+userId+"'";

ResultSet rs=aboutSQL.executeQuery(sql);
rs.next();
//测试代码
//out.println("<p>"+rs.getString("密码")+"*****"+password+"**"+"</p>");
if(rs.getRow()>0){
session.setAttribute("userId",userId);
if(varity.equals("商家")){ userName=rs.getString("商家姓名").trim();realPassword=rs.getString("商家密码").trim();}
else if(varity.equals("管理员")) {userName=rs.getString("管理员姓名").trim();realPassword=rs.getString("管理员密码").trim();}
else {userName=rs.getString("买家姓名").trim();realPassword=rs.getString("买家密码").trim();}
if(realPassword.equals(password)){
session.setAttribute("userId",userId);
session.setAttribute("userName",userName);
session.setAttribute("varity",varity);
out.println("<p style=\"text-align:center\">"+userId+"登录成功<br>");
out.println("<a href=\"myself.jsp\" target=\"_blank\" >点击此处可进入个人页面</p>");
response.setHeader("refresh", "20;URL=login.jsp");}
else {
out.println("<p style=\"text-align:center\">用户"+userId+":密码错误<br>");
out.println("请重新登录<br>");
out.println("即将跳回登录页面</>");
response.setHeader("refresh", "3;URL=login.jsp");
}}
else {
out.println("<p >用户"+userId+"不存在<br>");
out.println("<p style=\"text-align:center\">请重新登录<br>");
out.println("即将跳回登录页面</p>");
response.setHeader("refresh", "3;URL=Login.jsp");
}
}
%>
</div>
</body>
</html>