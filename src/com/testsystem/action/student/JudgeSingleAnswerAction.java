package com.testsystem.action.student;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.testsystem.storage.JudgeResult;
import com.testsystem.table.ExerciseTable;
import com.testsystem.table.SubmitAnswerTable;
import com.testsystem.util.AnswerMap;
import com.testsystem.util.ExerciseType;
import com.testsystem.util.MysqlDBConnectionUtil;
import com.testsystem.util.SqlExecuter;

public class JudgeSingleAnswerAction extends ActionSupport{

	private SubmitAnswerTable submitAnswer;
	private String select_1;
	private String select_2;
	private String select_3;
	private String select_4;
	private String select_5;
	private String select_6;
	private String select_7;
	private String select_8;
	private String select_9;
	private String select_10;

	private static List<AnswerMap> answerMaps = new ArrayList<>();//一行题目
	
	private String frStr(String str) {//format string 
		return str==null ? "Z " : (str+" ");
	}
	
	public String execute() {
		if(submitAnswer == null) {
			submitAnswer = new SubmitAnswerTable();
			submitAnswer.setAnswer(frStr(select_1)+frStr(select_2)+
					frStr(select_3)+frStr(select_4)+frStr(select_5)+
					frStr(select_6)+frStr(select_7)+frStr(select_8)+
					frStr(select_9)+frStr(select_10));
		}
		MysqlDBConnectionUtil sqlConnection = MysqlDBConnectionUtil.getInstance();
		SqlExecuter executer = new SqlExecuter(sqlConnection.getConnection());

		return executer.executeJudge(submitAnswer, JudgeResult.caught_simple_choice_exercises,
				ExerciseType.SIMPLE_CHOICE_QUESTION) ? SUCCESS : ERROR;
	}

	public SubmitAnswerTable getSubmitAnswer() {
		return submitAnswer;
	}

	public void setSubmitAnswer(SubmitAnswerTable submitAnswer) {
		this.submitAnswer = submitAnswer;
	}

	public static void setAnswerMap(ExerciseTable exercise) {
		answerMaps.clear();
		answerMaps.add(new AnswerMap("A", exercise.getOptionA()));
		answerMaps.add(new AnswerMap("B", exercise.getOptionB()));
		answerMaps.add(new AnswerMap("C", exercise.getOptionC()));
		answerMaps.add(new AnswerMap("D", exercise.getOptionD()));
	}

	public static List<AnswerMap> getAnswerMaps() {
		return answerMaps;
	}



	public String getSelect_1() {
		return select_1;
	}

	public void setSelect_1(String select_1) {
		this.select_1 = select_1;
	}

	public String getSelect_2() {
		return select_2;
	}

	public void setSelect_2(String select_2) {
		this.select_2 = select_2;
	}

	public String getSelect_3() {
		return select_3;
	}

	public void setSelect_3(String select_3) {
		this.select_3 = select_3;
	}

	public String getSelect_4() {
		return select_4;
	}

	public void setSelect_4(String select_4) {
		this.select_4 = select_4;
	}

	public String getSelect_5() {
		return select_5;
	}

	public void setSelect_5(String select_5) {
		this.select_5 = select_5;
	}

	public String getSelect_6() {
		return select_6;
	}

	public void setSelect_6(String select_6) {
		this.select_6 = select_6;
	}

	public String getSelect_7() {
		return select_7;
	}

	public void setSelect_7(String select_7) {
		this.select_7 = select_7;
	}

	public String getSelect_8() {
		return select_8;
	}

	public void setSelect_8(String select_8) {
		this.select_8 = select_8;
	}

	public String getSelect_9() {
		return select_9;
	}

	public void setSelect_9(String select_9) {
		this.select_9 = select_9;
	}

	public String getSelect_10() {
		return select_10;
	}

	public void setSelect_10(String select_10) {
		this.select_10 = select_10;
	}


	
	
}
