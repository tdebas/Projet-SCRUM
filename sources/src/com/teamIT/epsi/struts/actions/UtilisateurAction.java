package com.teamIT.epsi.struts.actions;

import java.security.MessageDigest;

import com.opensymphony.xwork2.ModelDriven;
import com.teamIT.epsi.hibernate.dao.UtilisateurDAO;
import com.teamIT.epsi.hibernate.tables.Utilisateur;

public class UtilisateurAction extends BaseAction implements ModelDriven<UtilisateurAction.UtilisateurModel>{
	
	public class UtilisateurModel{
		
		public Utilisateur utilisateur;

		public Utilisateur getUtilisateur() {
			return utilisateur;
		}

		public void setUtilisateur(Utilisateur utilisateur) {
			this.utilisateur = utilisateur;
		}
		
	}
	private static final long serialVersionUID = 6378378866497247173L;
	public UtilisateurModel model = new UtilisateurModel();
	public UtilisateurDAO uDAO = new UtilisateurDAO();
	
	public String executeProfil()
	{
		
		return SUCCESS;
	}
	
	public String editProfil() throws Exception{
		
		/* MJ : crypt password */
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(model.utilisateur.getPassword().getBytes());
		byte[] digest = md.digest();
		StringBuffer sb = new StringBuffer();
		for (byte b : digest) {
			sb.append(String.format("%02x", b & 0xff));
		}
		
		/* MJ : change password crypted */
		model.utilisateur.setPassword(sb.toString());
		
		/* MJ : update profil user */
		model.utilisateur.setDroit(((Utilisateur) sessionMap.get("utilisateur")).getDroit());
		model.utilisateur.setNote(((Utilisateur) sessionMap.get("utilisateur")).getNote());
		
		uDAO.saveOrUpdateUser(model.utilisateur);
		
		sessionMap.clear();

		return SUCCESS;
	}

	public UtilisateurModel getModel() {
		return model;
	}

	public void setModel(UtilisateurModel model) {
		this.model = model;
	}
	
	
}
