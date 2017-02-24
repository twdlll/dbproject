<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="date.CreateId" %>
<jsp:useBean id="createId" scope="page" class="date.CreateId"/>
<html>
<body>
<h1 style="text-align:center;color:white">食品发布</h1>
<form action="publish_food_check.jsp" Method="post" target="_self">
<table style="margin:20px auto">
<tr>
<td style="text-align:right">食品号:</td>
<td><input type="text" name="foodId" value="f<%=createId.dateTimeToId()%>"
readonly="readonly"/></td>
<td style="text-align:right">&nbsp;&nbsp;商家id:</td>
<td><input type="text" name="userId" value="<%=session.getAttribute("userId").toString()%>"
readonly="readonly"/></td>
</tr>
<tr>
<td style="text-align:right">&nbsp;*食品名:</td>
<td><input type="text" name="foodName" required/></td>
<td style="text-align:right">*食品分类</td>
<td colspan="2">
<input type="radio" name="foodVarity" value="面食" checked/>面食
<input type="radio" name="foodVarity" value="饭食"/>饭食
<input type="radio" name="foodVarity" value="小吃"/>小吃
<input type="radio" name="foodVarity" value="其他"/>其他
</td>
</tr>
<tr>
<td style="text-align:right">*单价:</td>
<td colspan="3"><input type="text" name="price" size="10" required/>元</td>
</tr>
<tr>
<td style="text-align:right">*食品介绍:</td>
<td colspan="3"><input type="textarea" name="foodIntroduce" size="60" maxlength="50" rows="3" required/></td>
</tr>
</table>
<p style="text-align:center">
<input type="submit" value="发布"/>
&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重填"/>
</p>
</form>
</body>
</html>
