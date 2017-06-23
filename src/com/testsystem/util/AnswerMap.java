package com.testsystem.util;

public class AnswerMap {
		private String code;
		private String displayValue;
		public AnswerMap(String code, String displayValue) {
			super();
			this.code = code;
			this.displayValue = displayValue;
		}
		public String getCode() {
			return code;
		}
		public void setCode(String code) {
			this.code = code;
		}
		public String getDisplayValue() {
			return displayValue;
		}
		public void setDisplayValue(String displayValue) {
			this.displayValue = displayValue;
		}
	}