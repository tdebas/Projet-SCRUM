package com.teamIT.epsi.struts.actions;

import java.security.MessageDigest;
import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.teamIT.epsi.hibernate.dao.DroitDAO;
import com.teamIT.epsi.hibernate.dao.UtilisateurDAO;
import com.teamIT.epsi.hibernate.tables.Utilisateur;

public class AdministrationAction extends BaseAction implements ModelDriven<AdministrationAction.AdministrationModel>{

	private static final long serialVersionUID = -450315913459654085L;
	
	public class AdministrationModel {
		public List<Utilisateur> userList;
		public Utilisateur utilisateur;
		
		public List<Utilisateur> getUserList() {
			return userList;
		}

		public void setUserList(List<Utilisateur> userList) {
			this.userList = userList;
		}

		public Utilisateur getUtilisateur() {
			return utilisateur;
		}

		public void setUtilisateur(Utilisateur utilisateur) {
			this.utilisateur = utilisateur;
		}
		
	}
	
	public AdministrationModel model = new AdministrationModel();
	public UtilisateurDAO uDAO = new UtilisateurDAO();
	public DroitDAO dDAO = new DroitDAO();
	
	public String execute(){
		model.userList = uDAO.getAllUser();
		return SUCCESS;
	}

	public String addUser() throws Exception{
		/* MJ : Crypt password of MD5 */
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(model.utilisateur.getPassword().getBytes());
		byte[] digest = md.digest();
		StringBuffer sb = new StringBuffer();
		for (byte b : digest) {
			sb.append(String.format("%02x", b & 0xff));
		}
		model.utilisateur.setPassword(sb.toString());
		model.utilisateur.setDroit(dDAO.getDroitById(1));
		model.userList = uDAO.getAllUser();
		uDAO.saveOrUpdateUser(model.utilisateur);
		
		return SUCCESS;
	}
	public AdministrationModel getModel() {
		return model;
	}
	public void setModel(AdministrationModel model) {
		this.model = model;
	}
		
}
