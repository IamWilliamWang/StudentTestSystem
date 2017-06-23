package com.testsystem.table;

public class ExerciseTable {

	private int id;
	private String question;
	private String optionA;
	private String optionB;
	private String optionC;
	private String optionD;
	private String answer;
	private boolean is_choice_question = true;
	private boolean is_single_choice_question = true;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getOptionA() {
		return optionA;
	}

	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}

	public String getOptionB() {
		return optionB;
	}

	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}

	public String getOptionC() {
		return optionC;
	}

	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}

	public String getOptionD() {
		return optionD;
	}

	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public boolean is_choice_question() {
		return this.is_choice_question;
	}

	public void setIs_choice_question(boolean is_choice_question) {
		this.is_choice_question = is_choice_question;
	}

	public boolean is_single_choice_question() {
		return this.is_single_choice_question;
	}

	public void setIs_single_choice_question(boolean is_single_choice_question) {
		this.is_single_choice_question = is_single_choice_question;
	}

	@Override
	public String toString() {
		return "[" + question + " : " + answer + " (" + (is_choice_question ? "选择题" : "非选择题") + ","
				+ (is_single_choice_question ? "单选题" : "非单选题") + ")]";
	}

}
