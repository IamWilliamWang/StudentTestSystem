package com.testsystem.table;

public class SettingTable {
	private String startTime_date;
	private String startTime_time;
	// private String startTime;
	private String testTime;

	public String getStartTime_date() {
		return startTime_date;
	}

	public void setStartTime_date(String startTime_date) {
		this.startTime_date = startTime_date.substring(0, startTime_date.indexOf("T"));
	}

	public String getStartTime_time() {
		return startTime_time;
	}

	public void setStartTime_time(String startTime_time) {
		this.startTime_time = startTime_time.trim().substring(startTime_time.indexOf("T") + 1).replace("+08:00", "");
	}

	public String getStartTime() {
		return startTime_date + " " + startTime_time;
	}

	public String getTestTime() {
		return testTime;
	}

	public void setTestTime(String testTime) {
		String time = testTime.trim().substring(testTime.indexOf("T") + 1).replace("+08:00", "");
		char[] tmp = time.toCharArray();
		Integer hh = Integer.parseInt(time.substring(0, 2));
		if (hh >= 12) {
			hh -= 12;
			this.testTime = hh.toString() + time.substring(2);
		}
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "[startTime = " + getStartTime() + ", testTime = " + getTestTime() + "]";
	}
}
