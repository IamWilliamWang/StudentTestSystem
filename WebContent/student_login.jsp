<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线考试系统</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div style="padding: 100px 100px 10px;">
        <s:form action="student_login" role="form" theme="simple">
            <h1>在线考试系统登录（学生登录）</h1>

            <div class="input-group">
                <span class="input-group-addon">用户名(学号)：</span>
                <s:textfield type="text" class="form-control" name="user.username" placeholder="这里输入你的用户名"/>
            </div>

            <div class="input-group">
                <span class="input-group-addon">&nbsp;&nbsp;登&nbsp;录&nbsp;密&nbsp;码&nbsp;：</span>
                <s:textfield type="password" class="form-control" name="user.password" placeholder="输入你的密码"/>
            </div>
            <br/>

            <s:submit type="button" class="btn btn-primary btn-lg" value="登录"></s:submit>
            <s:reset type="button" class="btn btn-danger btn-lg" value="清表"></s:reset>
            	管理员点击<a href="./administrator_login.jsp">这里</a>登录
        </s:form>

    </div>
</body>
</html>