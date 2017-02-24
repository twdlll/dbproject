<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="date.CreateId" %>
<jsp:useBean id="createId" scope="page" class="date.CreateId"/>
<html>
<body>
<form action="register_check.jsp" Method="post" target="_self">
<table style="margin:20px auto">
<tr>
<td style="text-align:right">用户Id</td>
<td><input type="text" name="userId" value="<%=createId.dateTimeToId()%>" readonly="readonly"/></td>
<td style="text-align:right">&nbsp;&nbsp;*用户姓名</td>
<td><input type="text" name="userName" autofocus="autofocus"
placeholder="请填写真实姓名" required/></td>
</tr>
<tr>
<td style="text-align:right">&nbsp;&nbsp;性&nbsp;&nbsp;别</td>
<td>
<input type="radio" name="gender" value="男" checked/>男
<input type="radio" name="gender" value="女"/>女
</td>
<td style="text-align:right">&nbsp;&nbsp;*联系电话</td>
<td><input type="text" name="phone" required pattern="\d{11}"/></td>
</tr>
<tr>
<td style="text-align:right">*登录密码</td>
<td><input type="password" name="pass1" required placeholder="不超过15个字符"/></td>
<td style="text-align:right">&nbsp;&nbsp;*确认密码</td>
<td><input type="password" name="pass2" required/></td>
</tr>

<tr>
<td style="text-align:right">*地址</td>
<td colspan="3"><input type="text" name="address" size="60" maxlength="60"/></td>
</tr>
<tr>
<td style="text-align:right">*注册类别</td>
<td>
<input type="radio" name="varity" value="买家" checked/>买家
<input type="radio" name="varity" value="商家"/>商家
</td>
</tr>
<tr>
<td style="text-align:right">店名</td>
<td colspan="3">
<input type="text" name="storeName" size="60" maxlength="30" placeholder="若选择买家可不填，商家则必填"></td>
</tr>
</table>
<p style="text-align:center">
<input type="submit" value="填好了"/>
&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重填"/>
</p>
</form>
</body>
</html>
