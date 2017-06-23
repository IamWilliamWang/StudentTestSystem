<%@page import="com.testsystem.storage.JudgeResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>考试成绩</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>
		一共<%=JudgeResult.exerciseCount%>道题，您一共做对<%=JudgeResult.score%>道。总分=<%=100.0 * JudgeResult.score / JudgeResult.exerciseCount %>
	</h2>
	<button class="btn btn-primary" onclick="window.opener=null; window.open('','_self'); window.close();">结束考试</button>
</body>
</html>