<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>失败！</title>
</head>
<body>
	<script>
		alert('设置失败！数据库出现错误，可能的原因：1.有空的格子 2.使用键盘而不是鼠标输入 3.输入的格式错误');
		history.back();
	</script>
</body>
</html>