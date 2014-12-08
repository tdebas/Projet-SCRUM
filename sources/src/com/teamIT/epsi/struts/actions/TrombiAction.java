package com.teamIT.epsi.struts.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ModelDriven;
import com.teamIT.epsi.hibernate.dao.MediasDAO;
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
	public MediasDAO mDAO = new MediasDAO();
	
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
	
	public String vote()
	{
		try {
		HttpServletRequest request = ServletActionContext.getRequest();
		
		String id = request.getParameter("id");

		String note = request.getParameter("rate");
		Utilisateur utilisateur = uDAO.getUserById(Integer.parseInt(id));
		
		
		
		int rate = Integer.parseInt(note);

		utilisateur.note = (utilisateur.note * utilisateur.nbVote + rate)/(utilisateur.nbVote+1);
		utilisateur.nbVote ++;
		
		uDAO.saveOrUpdate(utilisateur);
		return SUCCESS;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ERROR;
		}
		
	}

}
