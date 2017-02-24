<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_tools.AboutSQL"%>
<jsp:useBean id="aboutSQL" scope="session" class="db_tools.AboutSQL"></jsp:useBean>
<html>
<head>
<link href="css/main.css" rel="stylesheet"/>
</head>
<body class="main">
<p style="color:white;font-size:25px;text-align:center">显示未确认收货的订单</p>
<%
String sql;
boolean flag=false;//false代表买家，true代表商家
String userId=session.getAttribute("userId").toString().trim();
String varity=session.getAttribute("varity").toString().trim();
if(varity.equals("商家")) flag=true;
if(flag){sql="select * from orders,food_view where orders.食品号=food_view.食品号 and "+
    "是否派送='是' and 是否完成='否' and orders.商家Id='"+userId+"'";}
else{
sql="select * from orders,food_view where orders.食品号=food_view.食品号 and "+
    "是否派送='是' and 是否完成='否' and 买家Id='"+userId+"'";}
//测试代码
//System.out.println(sql);
ResultSet rs=aboutSQL.executeQuery(sql);
while(rs.next()){
out.println("<hr>");
out.println("<form action=\"makesure.jsp\" Method=\"post\" target=\"_self\" style=\"margin:10px auto;\">");
out.println("<table style=\"margin:10px auto\">");
out.println("<tr><td style=\"text-align:right\">&nbsp;&nbsp;订单号:</td>");
out.println("<td>"+"<input type=\"text\" name=\"orderId\" value=\""+rs.getString("订单号")+"\" readonly=\"readonly\">"+"</td>");
out.println("<td style=\"text-align:right\">&nbsp;&nbsp;买家Id:</td>");
out.println("<td>"+rs.getString("买家Id")+"</td></tr>");
out.println("<tr><td style=\"text-align:right\">商家Id:</td>");
out.println("<td>"+rs.getString("商家Id")+"</td>");
out.println("<td style=\"text-align:right\">食品名:</td>");
out.println("<td>"+rs.getString("食品名")+"</td></tr>");
out.println("<td style=\"text-align:right\">单价:</td>");
out.println("<td>"+rs.getString("单价")+"元</td>");
out.println("<td style=\"text-align:right\">订购数量:</td>");
out.println("<td>"+rs.getString("订购数量")+"</td></tr>");
out.println("<tr><td style=\"text-align:right\">&nbsp;&nbsp;总价:</td>");
out.println("<td colspan=\"3\">"+rs.getString("总价")+"元</td></tr></table>");
if(flag){
out.println("</form>");

//if(rs.getString("是否可见").trim().equals("是")){
//out.println("<td><input type=\"radio\" name=\"isVisible\" value=\"是\">是&nbsp;&nbsp;");
//out.println("<td><input type=\"radio\" name=\"isVisible\"}
//else{}
}
else{
out.println("</table><p style=\"text-align:center\"><input type=\"submit\" value=\"确认收货\"/></p>");
}
out.println("</form>");
}
%>
</body>
</html>