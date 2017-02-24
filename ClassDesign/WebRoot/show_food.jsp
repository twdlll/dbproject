<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_tools.AboutSQL"%>
<jsp:useBean id="aboutSQL" scope="session" class="db_tools.AboutSQL"></jsp:useBean>
<html>
<head>
<link href="css/main.css" rel="stylesheet"/>
</head>
<body class="main">
<p style="color:white;font-size:25px;text-align:center">显示已发布的食品</p>
<%
String sql;
boolean flag=session.getAttribute("varity").equals("商家");
if(flag){
sql="select * from food where 商家Id='"+session.getAttribute("userId").toString()+"'";}
else sql="select * from food_view where 商家Id='"+request.getParameter("storeId")+"'";
//System.out.println(sql);
ResultSet rs=aboutSQL.executeQuery(sql);
while(rs.next()){
out.println("<hr>");
out.println("<form action=\"change_food.jsp\" Method=\"post\" target=\"_self\" style=\"margin:10px auto;\">");
out.println("<table style=\"margin:10px auto\">");
out.println("<tr><td style=\"text-align:right\">&nbsp;&nbsp;食品号:</td>");
out.println("<td>"+"<input type=\"text\" name=\"foodId\" value=\""+rs.getString("食品号")+"\" readonly=\"readonly\">"+"</td>");
out.println("<td style=\"text-align:right\">&nbsp;&nbsp;商家Id:</td>");
out.println("<td>"+rs.getString("商家Id")+"</td></tr>");
out.println("<tr><td style=\"text-align:right\">食品名:</td>");
out.println("<td>"+rs.getString("食品名")+"</td>");
out.println("<td style=\"text-align:right\">食品分类:</td>");
out.println("<td>"+rs.getString("食品分类")+"</td></tr>");
out.println("<td style=\"text-align:right\">单价:</td>");
out.println("<td>"+rs.getString("单价")+"元</td></tr>");
out.println("<tr><td style=\"text-align:right\">&nbsp;&nbsp;食品介绍:</td>");
out.println("<td colspan=\"3\">"+rs.getString("食品介绍")+"</td></tr>");
if(flag){
out.println("<tr><td style=\"text-align:right\">是否可见:</td>");
out.println("<td>"+rs.getString("是否可见")+"</td></tr></table>");
//if(rs.getString("是否可见").trim().equals("是")){
//out.println("<td><input type=\"radio\" name=\"isVisible\" value=\"是\">是&nbsp;&nbsp;");
//out.println("<td><input type=\"radio\" name=\"isVisible\"}
//else{}
out.println("<p style=\"text-align:center\"><input type=\"submit\" value=\"修改\"/>");
}
else{
out.println("</table><p style=\"text-align:center\"><input type=\"submit\" value=\"添加至外卖车\" formaction=\"add_food.jsp\"/></p>");
}
out.println("</form>");
}
%>
</body>
</html>

