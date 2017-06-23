<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.testsystem.util.MysqlDBConnectionUtil"%>
<%@page import="com.testsystem.util.SqlExecuter"%>
<%@page import="com.testsystem.table.ExerciseTable" %>
<%@page import="com.testsystem.table.UserTable" %>
<%@ taglib uri="/struts-dojo-tags" prefix="sx"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<sx:head/>
		
	    <meta charset="UTF-8">
	    <title>在线考试管理系统</title>
	    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css" /> 
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
	    <%/* <div style="width:200px;float:left;">
	        <p>你好，管理员！</p>
	        <ul class="nav nav-pills nav-stacked">
	            <li id="set_start_time" onclick="change_button_states(0)" class="active"><a href="#">设置考试开始时间</a></li>
	            <li id="set_test_time" onclick="change_button_states(1)"><a href="#">设置考试时长</a></li>
	            <li id="set_information" onclick="change_button_states(2)"><a href="#">编辑所有考生信息</a></li>
	        </ul>
	    </div>
	
	    <script>
	        function change_button_states(selectindex) {
	            switch (selectindex)
	            {
	                case 0:
	                    document.getElementById('set_start_time').setAttribute('class','active')
	                    document.getElementById('set_test_time').setAttribute('class','')
	                    document.getElementById('set_information').setAttribute('class','')
	                    break;
	                case 1:
	                    document.getElementById('set_start_time').setAttribute('class','')
	                    document.getElementById('set_test_time').setAttribute('class','active')
	                    document.getElementById('set_information').setAttribute('class','')
	                    break;
	                case 2:
	                    document.getElementById('set_start_time').setAttribute('class','')
	                    document.getElementById('set_test_time').setAttribute('class','')
	                    document.getElementById('set_information').setAttribute('class','active')
	                    break;
	            }
	        }
	    </script>
	 */%>
	 	<!-- 这里是首部导航栏 -->
	    <nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid"> 
				<!-- 左上方文字部分 -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#example-navbar-collapse">
					</button>
					<a class="navbar-brand" href="#">考试管理系统</a>
				</div>
				<!-- 选择按钮部分 -->
				<div class="collapse navbar-collapse" id="navbar-collapse">
					<ul id="myTab" class="nav navbar-nav">
						<li class="dropdown">
	      					<a href="#" class="dropdown" 
	         					data-toggle="dropdown">题目录入 <b class="caret"></b>
	      					</a>
	      					<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
	      						<li><a href="#checkExercises" tabindex="-1" data-toggle="tab">显示所有题目</a></li>
		         				<li><a href="#addChoiceExercise" tabindex="-1" data-toggle="tab">录入单选题</a></li>
								<li><a href="#addMultiChoiceExercise" tabindex="-1" data-toggle="tab">录入多选题</a></li>
								<li><a href="#addJudgementExercise" tabindex="-1" data-toggle="tab">录入判断题</a></li>
								<li><a href="#removeExercise" tabindex="-1" data-toggle="tab">删除单个试题</a></li>
	      					</ul>
	   					</li>
						<li class="dropdown">
	      					<a href="#" class="dropdown" 
	         					data-toggle="dropdown">学生管理 <b class="caret"></b>
	      					</a>
	      					<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
	      						<li><a href="#checkUsers" tabindex="-1" data-toggle="tab">显示所有学生</a></li>
		         				<li><a href="#addStudent" tabindex="-1" data-toggle="tab">添加学生</a></li>
								<li><a href="#removeStudent" tabindex="-1" data-toggle="tab">删除学生</a></li>
	      					</ul>
	   					</li>
						<li class="dropdown">
	      					<a href="#" class="dropdown" 
	         					data-toggle="dropdown">考试设置 <b class="caret"></b>
	      					</a>
	      					<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
		         				<li><a href="#setStartTime" tabindex="-1" data-toggle="tab">设置考试开始、持续时间</a></li>
								<%//<li><a href="#setStartTime" tabindex="-1" data-toggle="tab">设置考试时间</a></li>%>
	      					</ul>
	   					</li>
						<li>
							<a href="student_login.jsp">退出系统</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	
		<!-- 页面的下方主内容 -->
		<div id="myTabContent" class="tab-content" style="padding: 100px 100px 100px 100px;">
		
		   <!-- 显示所有题目 内容 -->
		   <div class="tab-pane fade" id="checkExercises">
		   	   <h2>所有题目的内容</h2>
		   	   <p>更新后需要<a onclick="window.location.reload()">刷新</a>该页面才能看到</p>
		   	   
			   <table border="1" class="table">
			   		<tr>
			   			<th>题目号</th>
			   			<th>问题</th>
			   			<th>选项A</th>
			   			<th>选项B</th>
			   			<th>选项C</th>
			   			<th>选项D</th>
			   			<th>答案</th>
			   			<th>是否为选择题</th>
			   			<th>是否为单选题</th>
			   		</tr>
			   		<%
			   			MysqlDBConnectionUtil myDB = new MysqlDBConnectionUtil();
			   			SqlExecuter executer = new SqlExecuter(myDB.getConnection());
			   			ArrayList<ExerciseTable> exercises = executer.getAllExercises();
			   			for(ExerciseTable exercise : exercises) {
			   		%>
	   				<tr>
	   					<td><%=exercise.getId()%></td>
	   					<td><%=exercise.getQuestion()%></td>
	   					<td><%=exercise.getOptionA()%></td>
	   					<td><%=exercise.getOptionB()%></td>
	   					<td><%=exercise.getOptionC()%></td>
	   					<td><%=exercise.getOptionD()%></td>
	   					<td><%=exercise.getAnswer()%></td>
	   					<td><%=exercise.is_choice_question()?"是":"否" %>
	   					<td><%=exercise.is_single_choice_question()?"是":"否" %>
	   				</tr>
			   		<%
			   			}
			   		%>
			   </table>
		      
		      
		   </div>
		   
		   <!-- 显示所有学生 内容 -->
		   <div class="tab-pane fade" id="checkUsers">
		   	   <h2>所有学生</h2>
		   	   <p>更新后需要<a onclick="window.location.reload()">刷新</a>该页面才能看到</p>
		   	   
			   <table border="1" class="table">
			   		<tr>
			   			<th>用户名(学号)</th>
			   			<th>密码</th>
			   		</tr>
			   		<%
			   			MysqlDBConnectionUtil myDB2 = new MysqlDBConnectionUtil();
			   			SqlExecuter executer2 = new SqlExecuter(myDB.getConnection());
			   			ArrayList<UserTable> users = executer.getAllUsers();
			   			for(UserTable user : users) {
			   		%>
			   				<tr>
			   					<td><%=user.getUsername() %></td>
			   					<td><%=user.getPassword()%></td>
			   				</tr>
			   		<%
			   			}
			   		%>
			   </table>
		      
		      
		   </div>
		   
		   <!-- 录入单选题 内容 -->
		   <div class="tab-pane fade in active" id="addChoiceExercise">
		      <h2>添加单选题 </h2>
		      <s:form action="add_choice_exercise" role="form" theme="simple">
		      	<div class="input-group">
	                <span class="input-group-addon">题&nbsp;&nbsp;目：</span>
	                <s:textfield type="text" class="form-control" name="exercise.question" placeholder="填写完整的题目"/>
	            </div>
	            <br/>
	            <div class="input-group">
	                <span class="input-group-addon">选项A：</span>
	                <s:textfield type="text" class="form-control" name="exercise.optionA" placeholder="填写A选项内容"/>
	            </div>
	            <br/>
	            <div class="input-group">
	                <span class="input-group-addon">选项B：</span>
	                <s:textfield type="text" class="form-control" name="exercise.optionB" placeholder="填写B选项内容"/>
	            </div>
	            <br/>
	            <div class="input-group">
	                <span class="input-group-addon">选项C：</span>
	                <s:textfield type="text" class="form-control" name="exercise.optionC" placeholder="填写C选项内容"/>
	            </div>
	            <br/>
	            <div class="input-group">
	                <span class="input-group-addon">选项D：</span>
	                <s:textfield type="text" class="form-control" name="exercise.optionD" placeholder="填写D选项内容"/>
	            </div>
	            <br/>
	            <div class="input-group">
	                <span class="input-group-addon">答&nbsp;&nbsp;案：</span>
	                <s:textfield type="text" class="form-control" name="exercise.answer" placeholder="请输入答案对应的A、B、C或者D，注意用大写"/>
	            </div>
	            <br/>
	            <s:submit type="button" class="btn btn-primary btn-lg" value="添加题目"></s:submit>
            	<s:reset type="button" class="btn btn-danger btn-lg" value="清表"></s:reset>
            	
		      </s:form>
		   </div>
		   
		   <!-- 录入多选题 内容 -->
		   <div class="tab-pane fade" id="addMultiChoiceExercise">
		      <h2>添加多选题 </h2>
		      <s:form action="add_multi_choice_exercise" role="form" theme="simple">
		      	<div class="input-group">
	                <span class="input-group-addon">题&nbsp;&nbsp;目：</span>
	                <s:textfield type="text" class="form-control" name="exercise.question" placeholder="填写完整的题目"/>
	            </div>
	            <br/>
	            <div class="input-group">
	                <span class="input-group-addon">选项A：</span>
	                <s:textfield type="text" class="form-control" name="exercise.optionA" placeholder="填写A选项内容"/>
	            </div>
	            <br/>
	            <div class="input-group">
	                <span class="input-group-addon">选项B：</span>
	                <s:textfield type="text" class="form-control" name="exercise.optionB" placeholder="填写B选项内容"/>
	            </div>
	            <br/>
	            <div class="input-group">
	                <span class="input-group-addon">选项C：</span>
	                <s:textfield type="text" class="form-control" name="exercise.optionC" placeholder="填写C选项内容"/>
	            </div>
	            <br/>
	            <div class="input-group">
	                <span class="input-group-addon">选项D：</span>
	                <s:textfield type="text" class="form-control" name="exercise.optionD" placeholder="填写D选项内容"/>
	            </div>
	            <br/>
	            <div class="input-group">
	                <span class="input-group-addon">答&nbsp;&nbsp;案：</span>
	                <s:textfield type="text" class="form-control" name="exercise.answer" placeholder="请输入答案对应的ABCD，注意用大写，中间请勿使用空格"/>
	            </div>
	            <br/>
	            <s:submit type="button" class="btn btn-primary btn-lg" value="添加题目"></s:submit>
            	<s:reset type="button" class="btn btn-danger btn-lg" value="清表"></s:reset>
		      </s:form>
		   </div>
		   
		   <!-- 录入判断题  内容 -->
		   <div class="tab-pane fade" id="addJudgementExercise">
		      <h2>添加判断题 </h2>
		      <s:form action="add_judgement_exercise" role="form" theme="simple">
		      	<div class="input-group">
	                <span class="input-group-addon">题目：</span>
	                <s:textfield type="text" class="form-control" name="exercise.question" placeholder="填写完整的题目"/>
	            </div>
	            <br/>
	            <div class="input-group">
	                <span class="input-group-addon">答案：</span>
	                <s:textfield type="text" class="form-control" name="exercise.answer" placeholder="正确请输入T，错误请输入F"/>
	            </div>
	            <br/>
	            
	            <s:submit type="button" class="btn btn-primary btn-lg" value="添加题目"></s:submit>
		      </s:form>
		   </div>
		   
		   <!-- 删除考题  内容 -->
		   <div class="tab-pane fade" id="removeExercise">
		      <s:form action="remove_exercise" role="form" theme="simple">
		      	<div class="input-group">
	                <span class="input-group-addon">题号：</span>
	                <s:textfield type="text" class="form-control" name="exercise.id" placeholder="填写完整的题号"/>
	            </div>
	            <br/>
	            <s:submit type="button" class="btn btn-danger btn-lg" value="删除题目"></s:submit>
              </s:form>
		   </div>
		   
		   <!-- 添加学生信息 内容 -->
		   <div class="tab-pane fade" id="addStudent">
		      <s:form action="add_student" role="form" theme="simple">
	            <h1>添加学生信息</h1>
	
	            <div class="input-group">
	                <span class="input-group-addon">用户名(学号)：</span>
	                <s:textfield type="text" class="form-control" name="user.username" placeholder="这里输入你的用户名"/>
	            </div>
				<br/>
				
	            <div class="input-group">
	                <span class="input-group-addon">&nbsp;&nbsp;登&nbsp;录&nbsp;密&nbsp;码&nbsp;：</span>
	                <s:textfield type="password" class="form-control" name="user.password" placeholder="输入你的密码"/>
	            </div>
	            <br/>
	
	            <s:submit type="button" class="btn btn-primary btn-lg" value="注册"></s:submit>
	            
	           </s:form>
		   </div>
		   
		   <!-- 删除学生信息 内容 -->
		   <div class="tab-pane fade" id="removeStudent">
		      <s:form action="remove_student" role="form" theme="simple">
		      	<div class="input-group">
	                <span class="input-group-addon">用户名(学号)：</span>
	                <s:textfield type="text" class="form-control" name="user.username" placeholder="输入要删除的用户名(学号)"/>
	            </div>
	            <br/>
	            <s:submit type="button" class="btn btn-danger btn-lg" value="删除"></s:submit>
              </s:form>
		   </div>
		   
		   <!-- 设置考试开始时间  内容 -->
		   <div class="tab-pane fade" id="setStartTime">
			   <h2>设置考试日期与时间</h2>
			   	   <p>更新后需要<a onclick="window.location.reload()">刷新</a>该页面才能看到</p>
			   	   <br/>
		      <% 
		      		String sql = "select start_time,test_time from testsystemdb.settings";
		      		PreparedStatement preparedStatement = new MysqlDBConnectionUtil().getConnection().prepareStatement(sql);
		      		ResultSet resultSet = preparedStatement.executeQuery();
		      		String start_time = "";
		      		String test_time = "";
		      		while(resultSet.next()) {
		      			start_time = resultSet.getString(1).replace('T', ' ').replace("+08:00", "");
		      			test_time = resultSet.getString(2).replace('T', ' ').replace("+08:00", "");
		      		}
		      		
		      		out.println("考试开始："+start_time);
		      		out.println("持续时间："+test_time);
		      		if(start_time==null || test_time==null 
		      				|| start_time.isEmpty() || test_time.isEmpty()) {
		      			%>
		      			<b>警告：检测到未设置考试时间与持续时间，不设置系统不会正常开始考试!</b>
				<%  } %>
				
		      <s:form action="set_times" role="form" theme="simple">
		      	<div class="input-group" style="background-color: #FFFFFF;border: 1px solid #BBBBBB;padding: 2px;
			width: 280px;">
		      		<span class="input-group-addon">考试开始日期： </span>
		      		<sx:datetimepicker name="settings.startTime_date" value="%{'today'}"   
			toggleType="wipe" toggleDuration="300" language="zh_CN" type="date"   
			displayWeeks="5" formatLength="long"
			cssStyle="width:180px;"/> 
		      	</div>
		      	<br/>
		      	<div class="input-group" style="background-color: #FFFFFF;border: 1px solid #BBBBBB;padding: 2px;
			width: 280px;">
		      		<span class="input-group-addon">考试开始时间： </span>
		      		<sx:datetimepicker  name="settings.startTime_time" value=""   
			toggleType="wipe" toggleDuration="300" language="zh_CN" type="time"   
			displayWeeks="5" formatLength="long"
			cssStyle="width:180px;"/>
		      	</div>
		      	<br/>
		      	<div class="input-group" style="background-color: #FFFFFF;border: 1px solid #BBBBBB;padding: 2px;
			width: 280px;">
		      		<span class="input-group-addon">考试持续时间： </span>
		      		<sx:datetimepicker  name="settings.testTime" value=""   
			toggleType="wipe" toggleDuration="300" language="zh_CN" type="time"   
			displayWeeks="5" formatLength="long" displayFormat="hh:mm:ss"
			cssStyle="width:180px;"/> 
					<p>此处小时下方的12代表0小时</p>
		      	</div>
		      	<br/>
		      	<s:submit type="button" class="btn btn-primary btn-lg" value="设置"></s:submit>
              
		      </s:form>
		   </div>
		   
		   <% 
		   //<!-- 设置考试持续时间  内容 -->
		   //<div class="tab-pane fade" id="setTestTime">
		   //   <p>这里设置考试持续时间</p>
		   //</div>
		   %>
		</div>
		
		<script>
		   <!-- 默认点击第一个内容 -->
		   $(function () {
		      $('#myTab li:eq(1) a').tab('show');
		   });
		</script>
	</body>
</html>