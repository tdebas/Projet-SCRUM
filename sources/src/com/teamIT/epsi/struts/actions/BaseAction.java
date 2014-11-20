package com.teamIT.epsi.struts.actions;

import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements SessionAware{

	private static final long serialVersionUID = 3992987134120996958L;
	public SessionMap<String,Object> sessionMap;
	
	public void setSession(Map<String, Object> map) {
        sessionMap=(SessionMap<String,Object>)map;  
	}
	public boolean getUserEstConnecte() {
    	return "true".equals(sessionMap.get("logOn"));
    }
	
}
