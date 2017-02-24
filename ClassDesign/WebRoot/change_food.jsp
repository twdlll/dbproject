<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="date.CreateId" %>
<jsp:useBean id="aboutSQL" scope="session" class="db_tools.AboutSQL"/>
<%request.setCharacterEncoding("UTF-8");%>
<html>
<body>
<%String sql="select * from food where 食品号='"+request.getParameter("foodId")+"'";
System.out.println(sql);
ResultSet rs=aboutSQL.executeQuery(sql);
rs.next();
String foodId=rs.getString("食品号").trim();
String foodName=rs.getString("食品名").trim();
String storeId=rs.getString("商家Id").trim();
String foodVarity=rs.getString("食品分类").trim();
int price=rs.getInt("单价");
String foodIntroduce=rs.getString("食品介绍").trim();
String isVisible=rs.getString("是否可见").trim();
%>
<h1 style="text-align:center;color:white">食品修改</h1>
<form action="change_food_check.jsp" Method="post" target="_self">
<table style="margin:20px auto">
<tr>
<td style="text-align:right">食品号:</td>
<td><input type="text" name="foodId" value="<%=foodId%>"
readonly="readonly"/></td>
<td style="text-align:right">&nbsp;&nbsp;商家Id:</td>
<td><input type="text" name="stored" value="<%=storeId%>" readonly="readonly"/></td>
</tr>
<tr>
<td style="text-align:right">&nbsp;*食品名:</td>
<td><input type="text" name="foodName" value="<%=foodName %>" required/></td>
<td style="text-align:right">*食品分类:</td>
<td colspan="2">
<%if(foodVarity.equals("面食")){
out.println("<input type=\"radio\" name=\"foodVarity\" value=\"面食\" checked/>面食");
out.println("<input type=\"radio\" name=\"foodVarity\" value=\"饭食\"/>饭食");
out.println("<input type=\"radio\" name=\"foodVarity\" value=\"小吃\"/>小吃");
out.println("<input type=\"radio\" name=\"foodVarity\" value=\"其他\"/>其他");}
else if(foodVarity.equals("饭食")){
out.println("<input type=\"radio\" name=\"foodVarity\" value=\"面食\"/>面食");
out.println("<input type=\"radio\" name=\"foodVarity\" value=\"饭食\" checked/>饭食");
out.println("<input type=\"radio\" name=\"foodVarity\" value=\"小吃\"/>小吃");
out.println("<input type=\"radio\" name=\"foodVarity\" value=\"其他\"/>其他");}
else if(foodVarity.equals("小吃")){
out.println("<input type=\"radio\" name=\"foodVarity\" value=\"面食\"/>面食");
out.println("<input type=\"radio\" name=\"foodVarity\" value=\"饭食\"/>饭食");
out.println("<input type=\"radio\" name=\"foodVarity\" value=\"小吃\" checked/>小吃");
out.println("<input type=\"radio\" name=\"foodVarity\" value=\"其他\"/>其他");}
else{
out.println("<input type=\"radio\" name=\"foodVarity\" value=\"面食\"/>面食");
out.println("<input type=\"radio\" name=\"foodVarity\" value=\"饭食\"/>饭食");
out.println("<input type=\"radio\" name=\"foodVarity\" value=\"小吃\"/>小吃");
out.println("<input type=\"radio\" name=\"foodVarity\" value=\"其他\" checked/>其他");}
%>
</td>
</tr>
<tr>
<td style="text-align:right">&nbsp;*单价</td>
<td><input type="text" name="price" size="10" value="<%=price %>"/>元</td></tr>
<tr>
<td style="text-align:right">*食品介绍</td>
<td colspan="3"><input type="text" name="foodIntroduce" size="60" maxlength="" rows="3" value="<%=foodIntroduce %>" required/></td>
</tr>
<tr>
<td style="text-align:right">是否可见:</td>
<% if(isVisible.equals("是")){
out.println("<td><input type=\"radio\" name=\"isVisible\" value=\"是\" checked>是&nbsp;&nbsp;");
out.println("<input type=\"radio\" name=\"isVisible\" value=\"否\">否</td>");}
else{
out.println("<td><input type=\"radio\" name=\"isVisible\" value=\"是\">是&nbsp;&nbsp;");
out.println("<input type=\"radio\" name=\"isVisible\" value=\"否\" checked>否</td>");}
%>
</tr>
</table>
<p style="text-align:center">
<input type="submit" value="修改"/>
</p>
</form>
</body>
</html>