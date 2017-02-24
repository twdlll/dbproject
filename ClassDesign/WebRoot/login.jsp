<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="db_tools.*"%>
<%@page import="date.CreateId" %>
<jsp:useBean id="createId" scope="page" class="date.CreateId"/>
<jsp:useBean id="aboutSQL" scope="session" class="db_tools.AboutSQL"/>
<%String yzm=createId.createRand();session.setAttribute("code",yzm); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<div style="margin:10px auto">
<p style="text-align:center">只有注册用户才能登陆哟</p>
<hr/>
<div style="margin:10px auto;width:300px">
<form action="login_check.jsp" target="_self" method="post">
<table>
<tr>
<td style="text-align:right">用户Id:</td>
<td><input type="text" name="userId" required/></td>
</tr>
<tr>
<td style="text-align:right">密码:</td>
<td><input type="password" name="password" required/></td>
</tr>
<tr>
<td>验证码</td>
<td><input type="text" name="checkCode" required/></td>
<td><%=yzm%></td>
</tr>
</table>
<p style="text-align:center">
<input type="submit" value="登录"/>
<input type="reset" value="重填"/>
</p>
</form>
</div>
</div>
</body>
</html>
