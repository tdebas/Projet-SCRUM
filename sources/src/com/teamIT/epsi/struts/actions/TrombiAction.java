package com.teamIT.epsi.struts.actions;

import java.util.List;

import com.opensymphony.xwork2.ModelDriven;
import com.teamIT.epsi.hibernate.dao.UtilisateurDAO;
import com.teamIT.epsi.hibernate.tables.Utilisateur;

public class TrombiAction extends BaseAction implements ModelDriven<TrombiAction.TrombiModel>{

	public class TrombiModel{
		public List<Utilisateur> ListUtilisateur;
		public int tri;
		public List<Utilisateur> getListUtilisateur() {
			return ListUtilisateur;
		}
		public void setListUtilisateur(List<Utilisateur> listUtilisateur) {
			ListUtilisateur = listUtilisateur;
		}
		public int getTri() {
			return tri;
		}
		public void setTri(int tri) {
			this.tri = tri;
		}
	}
	
	private static final long serialVersionUID = -4347886732611284863L;
	public TrombiModel model = new TrombiModel();
	public UtilisateurDAO uDAO = new UtilisateurDAO();
	
	public String execute()
	{
		model.ListUtilisateur = uDAO.getAll();
		return SUCCESS;
	}
	
	public String tri(){
		model.ListUtilisateur = uDAO.getAllByOrder(model.tri);
		return SUCCESS;
	}

	public TrombiModel getModel() {
		return model;
	}

	public void setModel(TrombiModel model) {
		this.model = model;
	}

}
