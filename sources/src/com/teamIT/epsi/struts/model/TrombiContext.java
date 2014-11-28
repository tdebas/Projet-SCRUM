package com.teamIT.epsi.struts.model;

import org.apache.log4j.Logger;

public class TrombiContext {

	@SuppressWarnings("unused")
	private static final Logger logger = Logger.getLogger(TrombiContext.class);
	private static TrombiContext instance = new TrombiContext();
	/*
	 * the key where PSRContext is stored
	 */
	public static final String KEY = "CFN_CONTEXT";
	
	private String deploymentTime;
	
	private  TrombiContext() {
	}

	public static TrombiContext getInstance() {
		return instance;
	}

	public String getDeploymentTime() {
		return deploymentTime;
	}

	public void setDeploymentTime(String deploymentTime) {
		this.deploymentTime = deploymentTime;
	}
}
