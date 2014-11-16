package com.teamIT.epsi.hibernate.dao;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.teamIT.epsi.hibernate.util.HibernateUtil;

public abstract class CoreDAO<T> {

	protected Session session;
	protected Class<T> entityClass;

	public void flushAndClear() {
		session.flush();
		session.clear();
	}

	public CoreDAO(Class<T> entityClass) {
		session = HibernateUtil.currentSession();
		this.entityClass = entityClass;
	}

	@SuppressWarnings("unchecked")
	public T get(Serializable id) {
		return (T) session.get(entityClass, id);
	}

	@SuppressWarnings("unchecked")
	public List<T> getAll() {
		return createCriteria().list();
	}

	@SuppressWarnings("unchecked")
	public T load(Serializable id) {
		return (T) session.load(entityClass, id);
	}

	@SuppressWarnings("unchecked")
	public T load(Serializable id, HashMap<String, FetchMode> fetchModes) {
		Criteria criteria = session.createCriteria(entityClass);
		for (Map.Entry<String, FetchMode> fetchMode : fetchModes.entrySet()) {
			criteria.setFetchMode(fetchMode.getKey(), fetchMode.getValue());
		}
		criteria.add(Restrictions.idEq(id));
		return (T) criteria.uniqueResult();
	}

	public Serializable save(T obj) {
		return session.save(obj);
	}

	public void update(T obj) {
		session.update(obj);
	}

	public void saveOrUpdate(T obj) {
		session.saveOrUpdate(obj);
	}

	public void delete(T obj) {
		session.delete(obj);
	}

	public void flushSession() {
		session.flush();
	}

	public void refresh(T obj) {
		session.refresh(obj);
	}

	public void evict(T obj) {
		session.evict(obj);
	}

	public void merge(T obj) {
		session.merge(obj);
	}

	public void reassociate(T obj) {
		session.lock(obj, LockMode.NONE);
	}

	public Query getNamedQuery(String pNamedQueryName) {
		return session.getNamedQuery(pNamedQueryName);
	}

	public Criteria createCriteria() {
		return session.createCriteria(entityClass);
	}

	protected DetachedCriteria copy(DetachedCriteria criteria) {
		try {
			ByteArrayOutputStream baostream = new ByteArrayOutputStream();
			ObjectOutputStream oostream = new ObjectOutputStream(baostream);
			oostream.writeObject(criteria);
			oostream.flush();
			oostream.close();
			ByteArrayInputStream baistream = new ByteArrayInputStream(baostream.toByteArray());
			ObjectInputStream oistream = new ObjectInputStream(baistream);
			DetachedCriteria copy = (DetachedCriteria) oistream.readObject();
			oistream.close();
			return copy;
		} catch (Throwable t) {
			throw new HibernateException(t);
		}
	}

	protected void addFilter(Criteria criteria, String fieldName, Object value) {
		if (value != null) {
			criteria.add(Restrictions.eq(fieldName, value));
		}
	}

	public Session getSession() {
		return session;
	}
}
