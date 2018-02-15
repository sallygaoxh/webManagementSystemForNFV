package com.main.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class AddTest {
	
	private String command;
	private int parameter;

	public AddTest() {
		super();
	}
	public AddTest(String command, int parameter) {
		super();
		this.command = command;
		this.parameter = parameter;
	}
	public String getCommand() {
		return command;
	}
	public void setCommand(String command) {
		this.command = command;
	}
	public int getParameter() {
		return parameter;
	}
	public void setParameter(int parameter) {
		this.parameter = parameter;
	}
	@Override
	public String toString() {
		return "AddTest [command=" + command + ", parameter=" + parameter + "]";
	}
	
	
}
