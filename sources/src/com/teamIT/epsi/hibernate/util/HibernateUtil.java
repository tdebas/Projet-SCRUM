package com.teamIT.epsi.hibernate.util;

import java.util.HashMap;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateUtil {
	private static final SessionFactory sessionFactory = buildSessionFactory();
	public static final String HIBERNATE_CONFIGURATION_FILE_PATH = "hibernate.cfg.xml";
	public static HashMap<String, SessionFactory> sessionFactoriesMap = new HashMap<String, SessionFactory>();
	
 	private static SessionFactory buildSessionFactory() {
        try {
            // Create the SessionFactory from hibernate.cfg.xml
            return new AnnotationConfiguration().configure()
                    .buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
 
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    
    public static Session currentSession() throws HibernateException {
		return sessionFactory.getCurrentSession();
	}
    
    public static Session currentSession(String key) throws HibernateException {
		return sessionFactoriesMap.get(key).getCurrentSession();
	}
}
