<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_tools.AboutSQL"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="aboutSQL" scope="session" class="db_tools.AboutSQL"></jsp:useBean>
<html>
<head>
<link href="css/main.css" rel="stylesheet"/>
</head>
<body class="main">
<%
String sql;
ResultSet rs;
String userId=request.getParameter("userId").trim();
String userVarity=request.getParameter("userVarity").trim();
boolean flag=userVarity.equals("商家");
if(flag){
if(userId.equals("")){
sql="select * from stores where 是否可见='是'";
}
else{
sql="select * from stores where 是否可见='是' and 商家Id='"+userId+"'";
}
rs=aboutSQL.executeQuery(sql);
while(rs.next()){
out.println("<hr>");
out.println("<form action=\"destroy.jsp\" Method=\"post\" target=\"_self\" style=\"margin:10px auto;\">");
out.println("<table style=\"margin:10px auto\">");
out.println("<tr><td style=\"text-align:right\">&nbsp;&nbsp;商家Id:</td>");
out.println("<td>"+"<input type=\"text\" name=\"userId\" value=\""+rs.getString("商家Id")+"\" readonly=\"readonly\">"+"</td>");
out.println("<td style=\"text-align:right\">&nbsp;&nbsp;商家姓名:</td>");
out.println("<td>"+rs.getString("商家姓名")+"</td></tr>");
out.println("<tr><td style=\"text-align:right\">&nbsp;&nbsp;商家性别:</td>");
out.println("<td>"+rs.getString("商家性别")+"</td>");
out.println("<td style=\"text-align:right\">&nbsp;&nbsp;商家电话:</td>");
out.println("<td>"+rs.getString("商家电话")+"</td></tr>");
out.println("<tr><td style=\"text-align:right\">商家地址:</td>");
out.println("<td>"+rs.getString("商家地址")+"</td>");
out.println("<td style=\"text-align:right\">&nbsp;&nbsp;店名:</td>");
out.println("<td>"+rs.getString("店名")+"</td></tr></table>");
out.println("<p style=\"text-align:center\"><input type=\"submit\" value=\"注销\"/>");
out.println("</p>");
out.println("</form>");
}}
else{
if(userId.equals("")){
sql="select * from customers where 是否可见='是'";
}
else{
sql="select * from customers where 是否可见='是' and 买家Id='"+userId+"'";
}
rs=aboutSQL.executeQuery(sql);
while(rs.next()){
out.println("<hr>");
out.println("<form action=\"destroy.jsp\" Method=\"post\" target=\"_self\" style=\"margin:10px auto;\">");
out.println("<table style=\"margin:10px auto\">");
out.println("<tr><td style=\"text-align:right\">&nbsp;&nbsp;买家Id:</td>");
out.println("<td>"+"<input type=\"text\" name=\"userId\" value=\""+rs.getString("买家Id")+"\" readonly=\"readonly\">"+"</td>");
out.println("<td style=\"text-align:right\">&nbsp;&nbsp;买家姓名:</td>");
out.println("<td>"+rs.getString("买家姓名")+"</td></tr>");
out.println("<tr><td style=\"text-align:right\">&nbsp;&nbsp;买家性别:</td>");
out.println("<td>"+rs.getString("买家性别")+"</td>");
out.println("<td style=\"text-align:right\">&nbsp;&nbsp;商家电话:</td>");
out.println("<td>"+rs.getString("买家电话")+"</td></tr>");
out.println("<tr><td style=\"text-align:right\">买家地址:</td>");
out.println("<td>"+rs.getString("买家地址")+"</td></tr></table>");
out.println("<p style=\"text-align:center\"><input type=\"submit\" value=\"注销\"/>");
out.println("</p>");
out.println("</form>");
}}
%>
</body>
</html>