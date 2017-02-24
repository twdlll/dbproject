<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="db_tools.AboutSQL"%>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
<link href="css/main.css" rel="stylesheet"/>
</head>
<body class="main">
<%
AboutSQL aboutSQL=new AboutSQL();
String userId=request.getParameter("userId");
String userName=request.getParameter("userName");
String gender=request.getParameter("gender");
String phone=request.getParameter("phone");
String pass1=request.getParameter("pass1");
String pass2=request.getParameter("pass2");
String address=request.getParameter("address");
String varity=request.getParameter("varity");
String storeName=request.getParameter("storeName");
boolean flag=false; //用来判别是买家还是商家

if(varity.equals("买家")) userId="c"+userId;
else{ userId="s"+userId;flag=true;}

String message="";
String sql;
int k=0; //用来判别是否出现错误

if(!pass1.equals(pass2)){
message="<p style=\"text-align:center\">你的密码填写不一致</p>";
k++;
out.println(message);}

if(flag&&(storeName.equals("")||storeName==null)){
message="<p style=\"text-align:center\">注册商家时，未填写店名</p>";
out.println(message);}

if(k>0){
response.setHeader("Refresh","2;URL=register.jsp");
aboutSQL.close();}

else{
if(!flag){
sql="select 买家Id from customers_view where 买家Id='"+userId+"'";}
else{sql="select 商家Id from stores_view where 商家Id='"+userId+"'";}
ResultSet rs=aboutSQL.executeQuery(sql);
//测试代码
//System.out.println(sql);
if(rs==null) throw new RuntimeException("查询失败");
try{
if(rs.getRow()!=0){
message="<p style=\"text-align:center\">用户id:"+"userId"+",已经有人占用。</p>";
out.println(message);
aboutSQL.close();
response.setHeader("Refresh","2;URL=register.jsp");
}
else{
if(flag) sql="insert into stores_view values('"
             +userId+"','"
             +userName+"','"
             +gender+"','"
             +phone+"','"
             +pass1+"','"
             +address+"','"
             +storeName+"');";
else sql="insert into customers_view values('"
             +userId+"','"
             +userName+"','"
             +gender+"','"
             +phone+"','"
             +pass1+"','"
             +address+"');";

//测试代码
//System.out.println(sql);
boolean isOk=aboutSQL.executeUpdate(sql);
if(isOk){
session.setAttribute("userId",userId);
session.setAttribute("varity",varity);
session.setAttribute("userName",userName);
aboutSQL.close();
out.println("<p style=\"text-align:center;color:white\">恭喜用户"+userId+"注册成功，请牢记您的Id<br/>");
out.println("<a href=\"myself.jsp\" target=\"_blank\" >点击此处可进入个人页面</a></p>");
response.setHeader("Refresh","20;URL=login.jsp");}
else{
out.println("<p style=\"text-align:center;color:white\">注册失败，请重新注册<br/>");
out.println("<a href=\"myself.jsp\" target=\"_self\" >即将重新注册</a></p>");
response.setHeader("Refresh","20;URL=register.jsp");}
}}catch(SQLException e){
e.printStackTrace();
aboutSQL.close();}
}
%>
</body>
</html>

