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
String foodName=request.getParameter("foodName");
String storeId=request.getParameter("storeId");
String foodVarity=request.getParameter("foodVarity");
int price=Integer.parseInt(request.getParameter("price"));
String foodIntroduce=request.getParameter("foodIntroduce");
String isVisible=request.getParameter("isVisible");

String sql="update food set "+
           "食品名='"+foodName+"'"+
           ",食品分类='"+foodVarity+"'"+
           ",单价="+price+
           ",食品介绍='"+foodIntroduce+"'"+
           ",是否可见='"+isVisible+"' "+
           "where 食品号='"+foodId+"';";
           
aboutSQL.executeUpdate(sql);
           
out.println("<p style=\"text-align:center;color:white;font-size:20px\">食品号:"+foodId+"修改成功<br>");
out.println("即将进入已发布食品页面");
response.setHeader("refresh", "2;URL=show_food.jsp");
//}else{
//out.println("<p style=\"text-align:center;color:white;font-size:20px\">用户"+userId+":修改消息错误<br>");
//out.println("请重新发布<br>");
//out.println("即将跳回已发消息页面");
//response.setHeader("refresh", "2;URL=ShowMessage.jsp");}
%>

</div>
</body>
</html>