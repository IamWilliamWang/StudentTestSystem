<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>在线考试管理系统登录（管理员登录）</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
    <div style="padding: 100px 100px 10px;">
        <s:form action="admin_login" class="bs-example bs-example-form" role="form" theme="simple">
            <h1>在线考试管理系统登录（管理员登录）</h1>

            <div class="input-group">
                <span class="input-group-addon">管理员用户名：</span>
                <s:textfield type="text" class="form-control" name="user.username" placeholder="这里输入你的用户名"/>
            </div>

            <div class="input-group">
                <span class="input-group-addon">&nbsp;&nbsp;管理员密码：&nbsp;&nbsp;</span>
                <s:textfield type="password" class="form-control" name="user.password" placeholder="输入你的密码"/>
            </div>
            <br/>

            <s:submit type="button" class="btn btn-primary btn-lg" value="登录"></s:submit>
            <s:reset type="button" class="btn btn-danger btn-lg" value="清表"></s:reset>
				学生点击<a href="./student_login.jsp">这里</a>登录
        </s:form>

    </div>
</body>
</html>