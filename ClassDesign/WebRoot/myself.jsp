<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="java.sql.*"%>
<%@page import="db_tools.AboutSQL"%>
<%@page import="javax.swing.*"%>
<%request.setCharacterEncoding("GBK");%>
<jsp:useBean id="aboutSQL" scope="session" class="db_tools.AboutSQL"/>
<!doctype html>
<html lang="en">
 <head>
  <meta http-equiv="Content-Type" charset="text/html;charset=UTF-8"/>
  <title>童无敌</title>
  <meta name="author" content="Twd"/>
  <meta name="reason" content="for ClassDesign"/>
  <link href="css/main.css" rel="stylesheet"/>
 </head>

 <body class="main">
 <br><br><h1><%=session.getAttribute("userName").toString()%>的个人空间</h1>
 <%
 String item;
 String operation;
 if(session.getAttribute("varity").toString().trim().equals("商家")){ 
 item="item_store.html";
 operation="show_food.jsp";}
 else if(session.getAttribute("varity").toString().trim().equals("管理员")){
 item="null.jsp";
 operation="show_stores_or_customers.jsp";
 }
 else{
 item="item_customer.html";
 operation="show_stores.jsp";}
 System.out.println(item);
 System.out.println(operation);
 %>
 
<div class="container" style="height:200px">
    <table>
        <tr>
            <td><iframe width="160px" height="500px" src="<%=item %>"
            name="LeftFr" frameborder="0" scrolling="no"></iframe></td>
            <td><iframe width="620px" height="500px" src="<%=operation %>"
            name="RightFr" frameborder="0" scrolling="yes"></iframe></td>
        </tr>
        <tr><p style="text-align:right;color:white"><a href="quit.jsp" target="_self">退出</a></p></tr>
    </table>
</div>
 </body>
</html>