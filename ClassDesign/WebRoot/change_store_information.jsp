<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_tools.AboutSQL"%>
<jsp:useBean id="aboutSQL" scope="session" class="db_tools.AboutSQL"/>
<html>
<body>
<%
String userId;
userId=session.getAttribute("userId").toString();
String sql="select * from stores_view where 商家Id='"+userId+"'";
System.out.println(sql);
ResultSet rs=aboutSQL.executeQuery(sql);
rs.next();
String userName=rs.getString("商家姓名");
String gender=rs.getString("商家性别");
String phone=rs.getString("商家电话");
String pass1=rs.getString("商家密码");
String pass2=new String(pass1);
String address=rs.getString("商家地址");
String storeName=rs.getString("店名");

//测试代码
//out.println(introduce+"**"+time);

%>
<form action="change_store_information_check.jsp" Method="post" target="_self">
<table style="margin:20px auto">
<tr>
<td style="text-align:right">商家Id</td>
<td><input type="text" name="userId" value="<%=userId%>" readonly="readonly"/></td>
<td style="text-align:right">&nbsp;&nbsp;商家姓名</td>
<td><input type="text" name="userName" value="<%=userName%>"/></td>
</tr>
<tr>
<td style="text-align:right">&nbsp;&nbsp;性&nbsp;&nbsp;别</td>
<td>
<%if(gender.equals("男")){
out.println("<input type=\"radio\" name=\"gender\" value=\"男\" checked/>男<input type=\"radio\" name=\"gender\" value=\"女\"/>女");
}else if(gender.equals("女")){
out.println("<input type=\"radio\" name=\"gender\" value=\"男\"/>男<input type=\"radio\" name=\"gender\" value=\"女\" checked/>女");
}
%>
</td>
<td style="text-align:right">&nbsp;&nbsp;*商家电话</td>
<td><input type="text" name="phone" value="<%=phone%>" required patten="\d{11}"/></td>
</tr>
<tr>
<td style="text-align:right">*密码</td>
<td><input type="password" name="pass1" value="<%=pass1%>"/></td>
<td style="text-align:right">&nbsp;&nbsp;*确认密码</td>
<td><input type="password" name="pass2" value="<%=pass2%>"/></td>
</tr>
<tr>
<td style="text-align:right">*商家地址</td>
<td colspan="3"><input type="text" name="address" size="60" maxlength="60" value="<%=address%>"/></td>
</tr>
<tr>
<td style="text-align:right">*店名</td>
<td colspan="3">
<input type="text" name="storeName" size="60" maxlength="60" value="<%=storeName%>"/></td>
</tr>
</table>
<p style="text-align:center">
<input type="submit" value="修改" />
</p>
</form>
</body>
</html>