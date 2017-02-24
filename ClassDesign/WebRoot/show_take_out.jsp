<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_tools.AboutSQL"%>
<jsp:useBean id="aboutSQL" scope="session" class="db_tools.AboutSQL"></jsp:useBean>
<html>
<head>
<link href="css/main.css" rel="stylesheet"/>
</head>
<body class="main">
<p style="color:white;font-size:25px;text-align:center">显示已添加的食品</p>
<%
String userId=session.getAttribute("userId").toString();
Map<String,Integer> buy=(Map<String,Integer>)session.getAttribute("buy");
if(buy!=null&&!buy.isEmpty()){
Set<Map.Entry<String,Integer>> set=buy.entrySet();
Iterator<Map.Entry<String,Integer>> iterator=set.iterator();
String foodId;
Integer num;
String sql;
String storeId="";
String foodName="";
ResultSet rs;
String combination;
out.println("<form action=\"create_order.jsp\" method=\"post\" target=\"_self\"><table style=\"margin:10px auto\">");
out.println("<tr><td>是否确认</td>");
out.println("<td colspan=\"2\">食品号</td>");
out.println("<td colspan=\"2\">食品名</td>");
out.println("<td>订购数量</td></tr>");
while(iterator.hasNext()){
Map.Entry<String,Integer> map=(Map.Entry<String,Integer>)iterator.next();
foodId=map.getKey();
num=map.getValue();
sql="select 商家Id,食品名 from food_view where 食品号='"+foodId+"'";
rs=aboutSQL.executeQuery(sql);
while(rs.next()){
storeId=rs.getString("商家Id").trim();
foodName=rs.getString("食品名").trim();}
combination=userId+","+storeId+","+foodId;
out.println("<tr><td size=\"10\"><input type=\"checkbox\" name=\"order\" value=\"");
out.println(combination+"\"/></td>");
out.println("<td colspan=\"2\">"+foodId+"</td>");
out.println("<td colspan=\"2\">"+foodName+"</td>");
out.println("<td><input type=\"text\" size=\"5\" name=\""+foodId+"\" value=\"");
out.println(num);
out.println("\" pattern=\"\\d{1}\" required/></td></tr>");
}
out.println("</table>");
out.println("<p style=\"text-align:center\"><input type=\"submit\" value=\"生成订单\"></p>");
out.println("</form>");
}
%>
</body>
</html>
