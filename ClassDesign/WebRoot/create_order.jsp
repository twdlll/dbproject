<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="db_tools.AboutSQL"%>
<jsp:useBean id="aboutSQL" scope="session" class="db_tools.AboutSQL"></jsp:useBean>
<jsp:useBean id="createId" scope="page" class="date.CreateId"/>
<html>
<head>
<link href="css/main.css" rel="stylesheet"/>
</head>
<body class="main">
<p style="color:white;font-size:25px;text-align:center">生成订单</p>
<%
Map<String,Integer> buy=new HashMap<String,Integer>();
String userId;
String storeId;
String foodId;
String[] every;
String sql;
int foodNum;
int num=100;
String initOrderId="o"+createId.dateTimeToId();
String orderId;
int total;
ResultSet rs;
boolean flag=false;
String time=createId.dateTime0();
String[] combinations=request.getParameterValues("order");
if(combinations==null){
out.println("<p style=\"text-align:center;color:white\">未选食品</p>");
}
if(combinations!=null){
for(String str:combinations){
every=str.split(",");
userId=every[0].trim();
storeId=every[1].trim();
foodId=every[2].trim();
orderId=initOrderId+num;
num++;
foodNum=Integer.parseInt(request.getParameter(foodId));
System.out.println(foodId);
sql="select 单价 from food_view where 食品号='"+foodId+"'";
//System.out.println(sql);
rs=aboutSQL.executeQuery(sql);
rs.next();
total=foodNum*rs.getInt("单价");
//System.out.println(total);
sql="insert into create_orders_view\n values('"+orderId+"','"
    +userId+"','"+
    storeId+"','"+
    foodId+"',"+
    foodNum+",'"+
    time+"',"+
    total+")";
//测试代码
System.out.println(sql);
System.out.println(userId);
flag=aboutSQL.executeUpdate(sql);
}}
if(flag) {
out.println("<p style=\"text-align:center;color:white\">订单已生成<br>");
out.println("即将跳转至订单页面</p>");
session.setAttribute("buy",buy);
response.setHeader("Refresh","3;URL=show_not_send_order.jsp");}
else{
out.println("<p style=\"text-align:center;color:white\">订单生成失败<br>");
out.println("即将跳转至外卖车页面</p>");
response.setHeader("Refresh","3;URL=show_take_out.jsp");
}

%>
</body>
</html>
