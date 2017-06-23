<%@page import="com.testsystem.action.student.JudgeMultiAnswerAction"%>
<%@page import="com.testsystem.action.student.JudgeSingleAnswerAction"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.testsystem.storage.JudgeResult"%>
<%@page import="com.testsystem.util.*"%>
<%@page import="com.testsystem.table.ExerciseTable"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%! int exerciseCount = 10; //在这里设置题目的个数，运行前可以修改这个值 %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>在线考试系统</title>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<!-- 这里是首部导航栏 -->
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<!-- 左上方文字部分 -->
			<div class="navbar-header">
				<a class="navbar-brand" href="#">在线考试系统</a>
			</div>
			<!-- 选择按钮部分 -->
			<div>
				<ul id="myTab" class="nav navbar-nav">
					<li><a href="#single_choice" tabindex="-1" data-toggle="tab">单选题</a>
					</li>
					<li><a href="#multi_choice" tabindex="-1" data-toggle="tab">多选题</a>
					</li>
					<li><a href="#judgemeng_exercise" tabindex="-1"
						data-toggle="tab">判断题</a></li>
					<li><a href="student_login.jsp">退出系统</a></li>
					<li><a id="test_start_time"> <% 
					      		String sql = "select start_time,test_time from testsystemdb.settings";
					      		PreparedStatement preparedStatement = new MysqlDBConnectionUtil().getConnection().prepareStatement(sql);
					      		ResultSet resultSet = preparedStatement.executeQuery();
					      		String start_time = "";
					      		String test_time = "";
					      		while(resultSet.next()) {
					      			start_time = resultSet.getString(1).replace('T', ' ').replace("+08:00", "");
					      			test_time = resultSet.getString(2).replace('T', ' ').replace("+08:00", "");
					      		}
					      	%> <%="考试开始："+start_time %>
					</a></li>
					<li><a id="test_time"> <% 
					      			SimpleDateFormat startTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
					      			SimpleDateFormat testTimeFormat = new SimpleDateFormat("HH:mm:ss");
					      			
					      			Calendar calendar = Calendar.getInstance();
					      			Date startTime = startTimeFormat.parse(start_time);
					      			Date testTime = testTimeFormat.parse(test_time);
					      			calendar.setTime(startTime);
					      			calendar.set(Calendar.HOUR_OF_DAY, calendar.get(Calendar.HOUR_OF_DAY)+testTime.getHours());
					      			calendar.set(Calendar.MINUTE, calendar.get(Calendar.MINUTE)+testTime.getMinutes());
					      			calendar.set(Calendar.SECOND, calendar.get(Calendar.SECOND)+testTime.getSeconds());
					      			/*long startTime_millis = calendar.getTimeInMillis();
					      			calendar.setTime(testTime);
					      			long testTime_millis = 1000;
					      			testTime_millis *= testTime.getHours()*3600+testTime.getMinutes()*60+testTime.getSeconds();
					      			
					      			calendar.setTime(new Date());
					      			long nowTime_millis = calendar.getTimeInMillis();
					      			calendar.setTimeInMillis(startTime_millis+testTime_millis-nowTime_millis);
					      			*/
					      			Date endTime = calendar.getTime();
					      			calendar.setTime(endTime);
					      			long endTimeMil = calendar.getTimeInMillis();
					      			calendar.setTime(new Date());
					      			long nowTimeMil = calendar.getTimeInMillis();
					      			
					      			long restTime_seconds = (endTimeMil-nowTimeMil)/1000;
					      			
					      			long hh=0,mm=0,ss=0;
					      			for(ss = restTime_seconds; ss >= 60; ss-=60,mm++);
					      			for(;mm >= 60;mm-=60,hh++);
					      			
					      			String rest_time = ""+hh+":"+mm+":"+ss;
					      			
					      			if(endTime.before(new Date())) 
					      				rest_time = "00:00:00";
					      			
					      			
					      		%> <%="剩余时间："+rest_time %>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- 页面的下方主内容 -->
	<div id="myTabContent" class="tab-content"
		style="padding: 50px 50px 50px 50px;">

		<!-- 单选题  内容 -->
		<div class="tab-pane fade" id="single_choice">
			<s:form action="submit_single_answer" role="form" theme="simple">

				<table border="1" class="table">
					<tr>
						<th>问题</th>
						<th>选项A</th>
						<th>选项B</th>
						<th>选项C</th>
						<th>选项D</th>
					</tr>
					<%
				   			int single_question_index = 1;
				   		
				   			MysqlDBConnectionUtil myDB = MysqlDBConnectionUtil.getInstance();
				   			SqlExecuter executer = new SqlExecuter(myDB.getConnection());
				   			ArrayList<ExerciseTable> exercises = executer.getFewExercises(ExerciseType.SIMPLE_CHOICE_QUESTION,exerciseCount);
				   			for(ExerciseTable exercise : exercises) {
				   		%>
					<tr>
						<td><%=exercise.getQuestion()%></td>
						<% JudgeSingleAnswerAction.setAnswerMap(exercise); %>
						<% 
							request.setAttribute("answersMap", JudgeSingleAnswerAction.getAnswerMaps()); 
							
							request.setAttribute("single_question_index", single_question_index); 
						%>
						<td colspan="4">
							<s:radio cssStyle="width:80px" list="#request.answersMap" listKey="code" listValue="displayValue" name="select_%{#request.single_question_index}"></s:radio>
						</td>
						<!-- 
						<td>
							<div>
								<label class="radio-inline"> 
									<input type="radio" name="<%=single_question_index %>">
									<%=exercise.getOptionA() %>
								</label>
							</div>
						</td>
						<td>
							<div>
								<label class="radio-inline"> 
									<input type="radio" name="<%=single_question_index %>">
									<%=exercise.getOptionB() %>
								</label>
							</div>
						</td>
						<td>
							<div>
								<label class="radio-inline"> 
									<input type="radio" name="<%=single_question_index %>">
									<%=exercise.getOptionC() %>
								</label>
							</div>
						</td>
						<td>
							<div>
								<label class="radio-inline">
									<input type="radio" name="<%=single_question_index++ %>">
									<%=exercise.getOptionD() %>
								</label>
							</div>
						</td> 
						-->
					</tr>
					<%
				   			}
				   		%>
				</table>

				<%/*
			   		<div class="input-group">
		                <span class="input-group-addon">答案：</span>
		                <s:textfield type="text" class="form-control" name="submitAnswer.answer" placeholder="请输入所有答案的大写选项中间用空格隔开，如B A C A A" />
		            </div>
		            <br/>
		       */%>
				<s:submit type="button" class="btn btn-primary btn-lg" value="保存答案"></s:submit>
			</s:form>
		</div>

		<!-- 多选题  内容 -->
		<div class="tab-pane fade" id="multi_choice">
			<s:form action="submit_multi_answer" role="form" theme="simple">
				<table border="1" class="table">
					<tr>
						<th>问题</th>
						<th>选项A</th>
						<th>选项B</th>
						<th>选项C</th>
						<th>选项D</th>
					</tr>
					<%
				   			int multi_question_index = 1;
				   			MysqlDBConnectionUtil myDB_2 = MysqlDBConnectionUtil.getInstance();
				   			SqlExecuter executer_2 = new SqlExecuter(myDB_2.getConnection());
				   			ArrayList<ExerciseTable> exercises_2 = executer_2.getFewExercises(ExerciseType.MULTI_CHOICE_QUESTION,exerciseCount);
				   			for(ExerciseTable exercise : exercises_2) {
				   		%>
					<tr>
						<td><%=exercise.getQuestion()%></td>
						<% JudgeMultiAnswerAction.setAnswerMap(exercise); %>
						<%
							request.setAttribute("answersMap", JudgeMultiAnswerAction.getAnswerMaps());
						
							request.setAttribute("multi_question_index", multi_question_index);
						%>
						<td colspan="4">
							<s:checkboxlist cssStyle="width:80px" list="#request.answersMap" listKey="code" listValue="displayValue" name="select_%{#request.multi_question_index}"></s:checkboxlist>
						</td>
						<!-- 
						<td>
							<div>
								<label class="checkbox-inline"> <input type="checkbox"
									name="submitAnswer.answers"
									value=<%=multi_question_index %>>
									<%=exercise.getOptionA() %>
								</label>
							</div>
						</td>
						
						<td>
							<div>
								<label class="checkbox-inline"> <input type="checkbox"
									name="submitAnswer.answers"
									value=<%=multi_question_index %>>
									<%=exercise.getOptionB() %>
								</label>
							</div>
						</td>
						<td>
							<div>
								<label class="checkbox-inline"> <input type="checkbox"
									name="submitAnswer.answers"
									value=<%=multi_question_index %>>
									<%=exercise.getOptionC() %>
								</label>
							</div>
						</td>
						<td>
							<div>
								<label class="checkbox-inline"> <input type="checkbox"
									name="submitAnswer.answers"
									value=<%=multi_question_index++ %>>
									<%=exercise.getOptionD() %>
								</label>
							</div>
						</td>
						-->
					</tr>
					<%
				   			}
				   		%>
				</table>

			
				<%/*
			      	<div class="input-group">
		                <span class="input-group-addon">答案：</span>
		                <s:textfield type="text" class="form-control" name="submitAnswer.answer" placeholder="请输入所有答案的大写选项中间用空格隔开，如AB AC CD AD AD"/>
		            </div>
		            <br/>
		       */%>
				<s:submit type="button" class="btn btn-primary btn-lg" value="保存答案"></s:submit>

			</s:form>
		</div>

		<!-- 判断题  内容 -->
		<div class="tab-pane fade" id="judgemeng_exercise">
			<s:form action="submit_judgement_answer">
				<table border="1" class="table">
					<tr>
						<th>问题</th>
						<th>请勾选你认为正确的选项</th>
					</tr>
					<%
				   			int judgement_question_index = 0;
				   		
				   			MysqlDBConnectionUtil myDB_3 = MysqlDBConnectionUtil.getInstance();
				   			SqlExecuter executer_3 = new SqlExecuter(myDB_3.getConnection());
				   			ArrayList<ExerciseTable> exercises_3 = executer_3.getFewExercises(ExerciseType.JUDGEMENT_QUESTION,exerciseCount);
				   			
				   			for(ExerciseTable exercise : exercises_3) {
				   		%>
					<tr>
						<th><%=exercise.getQuestion()%></th>
						<th><input type="checkbox" name="submitAnswer.answers"
							value="<%=judgement_question_index++%>" /></th>
					</tr>
					<%
				   			}
				   		%>
				</table>
				<s:submit type="button" class="btn btn-primary btn-lg" value="提交答案"></s:submit>
			</s:form>
		</div>
	</div>

	<script>
		   <!-- 默认点击第一个内容 -->
		   $(function () {
		      $('#myTab li:eq(0) a').tab('show');
		   });
		   
		   window.setInterval("checkTestFinish()", 1000);
		   
		   function getFormatTime(hh,mm,ss) {
			   /*str = "";
			   str += hh >= 10 ? hh : ("0"+hh);
			   str += ":";
			   str += mm >= 10 ? mm : ("0"+mm);
			   str += ":";
			   str += ss >= 10 ? ss : ("0"+ss);*/
			   return hh+":"+mm+":"+ss;
		   }
		   
		   	function checkTestFinish() {
			    content = document.getElementById('test_time').innerHTML;
			    content = content.substring(content.indexOf('：')+1);
			    firstSeparIndex = content.indexOf(':');
			    secondSeparIndex = content.lastIndexOf(':');
			    hh = content.substring(0,firstSeparIndex);
			    mm = content.substring(firstSeparIndex+1,secondSeparIndex);
			    ss = content.substring(secondSeparIndex+1);
			    ss--;
			    if(ss < 0) {
			        mm--;
			        ss+=60;
			    }
			    if(mm < 0) {
			        hh--;
			        mm+=60;
			    }
			    if(hh < 0) {
			        alert('收卷时间到，不可以再答题！');
			        window.opener=null;
			        window.open('','_self');
			        window.close();
			        
			        /*对于不兼容关闭页面的浏览器，采用返回操作来弥补*/
			        history.back();
			    }
			    document.getElementById('test_time').innerHTML = "剩余时间：" + getFormatTime(hh,mm,ss) ;
			}
			
			
		</script>
</body>
</html>