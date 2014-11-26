package com.teamIT.epsi.struts.actions;

import java.util.List;

import com.teamIT.epsi.hibernate.dao.UtilisateurDAO;
import com.teamIT.epsi.hibernate.tables.Utilisateur;

public class TrombiAction extends BaseAction {

	private static final long serialVersionUID = -4347886732611284863L;
	public List<Utilisateur> ListUtilisateur;
	public UtilisateurDAO uDAO = new UtilisateurDAO();
	
	public String execute()
	{
		ListUtilisateur = uDAO.getAll();
		return SUCCESS;
	}

	public List<Utilisateur> getListUtilisateur() {
		return ListUtilisateur;
	}

	public void setListUtilisateur(List<Utilisateur> listUtilisateur) {
		ListUtilisateur = listUtilisateur;
	}
	
	
}
