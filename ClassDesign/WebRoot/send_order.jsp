<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="db_tools.AboutSQL"%>
<%@page import="javax.swing.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<head>
</head>
<body>
<jsp:useBean id="aboutSQL" scope="session" class="db_tools.AboutSQL"/>
<div style="margin:10px auto">
<%
//session.setAttribute("userId","");
String orderId=request.getParameter("orderId").trim();
out.println("<p style=\"text-align:center;color:white\">订单号:"+orderId+"：<br>");
String sql="update orders set 是否派送='是' where 订单号='"+orderId+"';";
aboutSQL.executeUpdate(sql);

out.println("外卖派送成功<br>");
out.println("即将跳回原页面</p>");
response.setHeader("Refresh","2;URL=show_not_send_order.jsp");
%>
</div>
</body>
</html>