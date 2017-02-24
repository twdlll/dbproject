<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Title</title>
    <link href="css/main.css" rel="stylesheet"/>
</head>
<body>
<p style="text-align:center;color:white">选择要查看的用户</p>
<div style="color:white">
    <form style="text-align:center" action="show_content.jsp" method="post" target="BottomFr">
    用户Id:<input type="text" name="userId" splaceholder="可输入用户Id"/>
    <input type="radio" name="userVarity" value="商家" checked/>&nbsp;商家
    <input type="radio" name="userVarity" value="买家"/>&nbsp;买家
    &nbsp;&nbsp;<input type="submit" value="搜索"/>
    </form>
</div>
</body>
</html>