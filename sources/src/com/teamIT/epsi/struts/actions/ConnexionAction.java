package com.teamIT.epsi.struts.actions;

import com.opensymphony.xwork2.ModelDriven;
import com.teamIT.epsi.hibernate.dao.UtilisateurDAO;
import com.teamIT.epsi.hibernate.tables.Utilisateur;

public class ConnexionAction extends BaseAction implements ModelDriven<ConnexionAction.ConnexionModel>{

	private static final long serialVersionUID = -4628078064455096440L;

	public class ConnexionModel{
		public Utilisateur utilisateur;

		public Utilisateur getUtilisateur() {
			return utilisateur;
		}

		public void setUtilisateur(Utilisateur utilisateur) {
			this.utilisateur = utilisateur;
		}
	}
	
	public ConnexionModel model = new ConnexionModel();
	public UtilisateurDAO uDAO = new UtilisateurDAO();
		
	public String execute() {
		addActionMessage("You are now authentificated !!");
		return SUCCESS;
	}
	
	public String deconnexion(){
    	sessionMap.clear();
    	return SUCCESS;
    }
	
    public String utilisateur() throws Exception{
    	if (uDAO.get(model.getUtilisateur()) != null){
    		/* MJ : Log on User */
    		model.utilisateur = uDAO.get(model.getUtilisateur());
			sessionMap.put("logOn","true");
			/* MJ : add admin in session */
			if(model.utilisateur.getDroit().getIdDroit() != 1){
				sessionMap.put("admin","true");
			} 
			/* MJ : add user in session */
			sessionMap.put("utilisateur", model.utilisateur);
			uDAO.get(model.getUtilisateur());
			addActionMessage("You are now authentificated !");
			return SUCCESS;
		} else {
			addActionError("Error Authentification !");
			sessionMap.clear();
			return SUCCESS;
		}
    }

	public ConnexionModel getModel() {
		return model;
	}

	public void setModel(ConnexionModel model) {
		this.model = model;
	}
    
}
