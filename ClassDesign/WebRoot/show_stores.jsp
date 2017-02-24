<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_tools.AboutSQL"%>
<jsp:useBean id="aboutSQL" scope="session" class="db_tools.AboutSQL"></jsp:useBean>
<html>
<head>
<link href="css/main.css" rel="stylesheet"/>
</head>
<body class="main">
<p style="color:white;font-size:25px;text-align:center">显示周围外卖店</p>
<%
String sql="select * from stores_view";
//System.out.println(sql);
ResultSet rs=aboutSQL.executeQuery(sql);
while(rs.next()){
out.println("<hr>");
out.println("<form action=\"show_food.jsp\" Method=\"post\" target=\"_self\" style=\"margin:10px auto;\">");
out.println("<table style=\"margin:10px auto\">");
out.println("<tr><td style=\"text-align:right\">&nbsp;&nbsp;商家Id:</td>");
out.println("<td>"+"<input type=\"text\" name=\"storeId\" value=\""+rs.getString("商家Id")+"\" readonly=\"readonly\">"+"</td>");
out.println("<td style=\"text-align:right\">&nbsp;&nbsp;商家电话:</td>");
out.println("<td>"+rs.getString("商家电话")+"</td></tr>");
out.println("<tr><td style=\"text-align:right\">商家地址:</td>");
out.println("<td>"+rs.getString("商家地址")+"</td></tr>");
out.println("<tr><td style=\"text-align:right\">&nbsp;&nbsp;店名:</td>");
out.println("<td colspan=\"3\">"+rs.getString("店名")+"</td></tr></table>");
out.println("<p style=\"text-align:center\"><input type=\"submit\" value=\"查看该店外卖\"/>");
out.println("</p>");
out.println("</form>");
}
%>
</body>
</html>
