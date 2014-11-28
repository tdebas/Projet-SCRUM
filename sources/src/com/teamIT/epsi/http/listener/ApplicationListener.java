package com.teamIT.epsi.http.listener;

import java.io.File;
import java.io.FileReader;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.xml.DOMConfigurator;

import com.teamIT.epsi.hibernate.util.HibernateUtil;
import com.teamIT.epsi.struts.model.TrombiContext;

public class ApplicationListener implements ServletContextListener {
	
	private ServletContext context = null;
	
	@Override
	public void contextInitialized(ServletContextEvent event) {
		try {
			context = event.getServletContext();
			String prefix = context.getRealPath("/");
			
			String cfnPropertiesFile = context.getInitParameter("application-config");
			Properties cfnProperties = new Properties();
			cfnProperties.load(new FileReader(prefix + cfnPropertiesFile));
			
			TrombiContext trombiContext = TrombiContext.getInstance();
			
			File webInfFolder = new File(prefix, "WEB-INF");
			trombiContext.setDeploymentTime(String.valueOf(webInfFolder.lastModified()));

			// Hibernate 
			HibernateUtil.getSessionFactory();
			
			//log4j
			String file = context.getInitParameter("log4j-init-file");
			if (file != null) {
				DOMConfigurator.configure(prefix + file);
			}
			
		}  catch (Exception e) {
			System.out.println(e);
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
	}

}