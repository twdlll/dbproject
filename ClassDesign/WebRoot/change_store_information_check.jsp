<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="db_tools.AboutSQL"%>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<title>
</title>
<body>
<jsp:useBean id="aboutSQL" scope="session" class="db_tools.AboutSQL"/>
<%
String userId=request.getParameter("userId");
String userName=request.getParameter("userName");
String gender=request.getParameter("gender");
String phone=request.getParameter("phone");
String pass1=request.getParameter("pass1");
String pass2=request.getParameter("pass2");
String address=request.getParameter("address");
String storeName=request.getParameter("storeName");

String sql;int k=0;

if(!pass1.equals(pass2)){
k++;
out.println("<p style=\"text-align:center;color:white\">你的密码填写不一样<br>");
out.println("即将返回个人信息修改页面</p>");}

if(k>0) response.setHeader("Refresh","2;URL=change_store_information.jsp");
else{
sql="update stores_view set "+
    "商家姓名='"+userName+"',"+
    "商家性别='"+gender+"',"+
    "商家电话='"+phone+"',"+
    "商家密码='"+pass1+"',"+
    "商家地址='"+address+"',"+
    "店名='"+storeName+"' "+
    "where 商家Id='"+userId+"';";
    
aboutSQL.executeUpdate(sql);

out.println("<p style=\"text-align:center;color:white\">恭喜你修改成功，数据已写入数据库中</p>");
response.setHeader("Refresh","2;URL=change_store_information.jsp");}
%>
</body>
</html>
