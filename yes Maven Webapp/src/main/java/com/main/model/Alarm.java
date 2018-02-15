package com.main.model;

import com.main.model.IJSON;

public class Alarm implements IJSON{
	public Alarm(String elementName, String alarmSeverity){
		this.alarmSeverity = alarmSeverity;
		this.elementName = elementName;
	}
	String alarmSeverity;
	String elementName;
	public String toJSON() {
		return "{\"elementName\": \"" + elementName + "\", \"alarmSeverity\": \"" + alarmSeverity + "\"}";
	}
	public String getAlarmSeverity() {
		return alarmSeverity;
	}
	public void setAlarmSeverity(String alarmSeverity) {
		this.alarmSeverity = alarmSeverity;
	}
	public String getElementName() {
		return elementName;
	}
	public void setElementName(String elementName) {
		this.elementName = elementName;
	}
	
}