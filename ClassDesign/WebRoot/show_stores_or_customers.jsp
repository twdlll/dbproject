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
  <title>Í¯ÎÞµÐ</title>
  <meta name="author" content="Twd"/>
  <meta name="reason" content="for ClassDesign"/>
  <link href="css/main.css" rel="stylesheet"/>
 </head>

 <body class="main">
<div>
    <table>
        <tr>
            <td><iframe width="620px" height="50px" src="show_item.jsp"
            name="TopFr" frameborder="0" scrolling="no"></iframe></td>
        </tr>
        <tr>
            <td><iframe width="620px" height="450px" src="null.jsp"
            name="BottomFr" frameborder="0" scrolling="yes"></iframe></td>
        </tr>
    </table>
</div>
 </body>
</html>