package com.teamIT.epsi.struts.actions;

import java.security.MessageDigest;
import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.teamIT.epsi.hibernate.dao.MediasDAO;
import com.teamIT.epsi.hibernate.dao.UtilisateurDAO;
import com.teamIT.epsi.hibernate.tables.Medias;
import com.teamIT.epsi.hibernate.tables.Utilisateur;

public class UtilisateurAction extends BaseAction implements ModelDriven<UtilisateurAction.UtilisateurModel>{
	
	public class UtilisateurModel{
		
		public List<Medias> mediasList;
		public Utilisateur utilisateur;
		public Integer idUser;
		
		public Utilisateur getUtilisateur() {
			return utilisateur;
		}

		public List<Medias> getMediasList() {
			return mediasList;
		}

		public void setMediasList(List<Medias> mediasList) {
			this.mediasList = mediasList;
		}

		public void setUtilisateur(Utilisateur utilisateur) {
			this.utilisateur = utilisateur;
		}

		public Integer getIdUser() {
			return idUser;
		}

		public void setIdUser(Integer idUser) {
			this.idUser = idUser;
		}
		
	}
	private static final long serialVersionUID = 6378378866497247173L;
	public UtilisateurModel model = new UtilisateurModel();
	public UtilisateurDAO uDAO = new UtilisateurDAO();
	public MediasDAO mDAO = new MediasDAO();
	public String executeProfil()
	{
		return SUCCESS;
	}
	
	public String profil(){
		model.utilisateur = uDAO.getUserById(model.idUser);
		model.mediasList = mDAO.getAllByUserId(model.utilisateur);
		
		if (model.utilisateur.sexe.equals("1")){
			model.utilisateur.setSexe("Man");
		} else if(model.utilisateur.sexe.equals("2")){
			model.utilisateur.setSexe("Woman");
		} else {
			model.utilisateur.setSexe("Not specified");
		}
		
		if (model.utilisateur.estAlternant.equals("1")){
			model.utilisateur.setEstAlternant("Yes");
		} else if(model.utilisateur.estAlternant.equals("2")){
			model.utilisateur.setEstAlternant("No");
		} else {
			model.utilisateur.setEstAlternant("Not specified");
		}
		
		return "profil";
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
