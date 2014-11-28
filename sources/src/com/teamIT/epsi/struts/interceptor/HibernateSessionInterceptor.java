package com.teamIT.epsi.struts.interceptor;

import org.apache.log4j.Logger;
import org.hibernate.Transaction;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.teamIT.epsi.hibernate.util.HibernateUtil;

public class HibernateSessionInterceptor implements Interceptor {

	private static final long serialVersionUID = -6415977415715518979L;
	private static final Logger logger = Logger.getLogger(HibernateSessionInterceptor.class);

	@Override
	public void destroy() {
	}

	@Override
	public void init() {
	}

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		Transaction transaction = null;
		try {
			transaction = HibernateUtil.currentSession().beginTransaction();
			String result = actionInvocation.invoke();
			if (result == null || result.equals(ActionSupport.ERROR) || result.equals(ActionSupport.INPUT)) {
				if (transaction != null && transaction.isActive()) {
					transaction.rollback();
				}
			} else {
				transaction.commit();
			}
			return result;
		} catch (Exception e) {
			logger.error(e);
			if (transaction != null && transaction.isActive()) {
				transaction.rollback();
			}
			throw e;
		} catch (Throwable e) {
			logger.error(e);
			if (transaction != null && transaction.isActive()) {
				transaction.rollback();
			}
			throw new Exception(e);
		}
	}

}

