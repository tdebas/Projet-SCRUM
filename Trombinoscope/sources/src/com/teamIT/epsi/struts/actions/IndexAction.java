package com.teamIT.epsi.struts.actions;

import com.opensymphony.xwork2.ActionSupport;

public class IndexAction extends ActionSupport{

	private static final long serialVersionUID = 1L;

	public String execute(){
		return SUCCESS;
	}
	
	public String test(){
		return "test";
	}
}
