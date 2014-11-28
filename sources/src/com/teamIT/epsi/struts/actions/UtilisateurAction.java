package com.teamIT.epsi.struts.actions;

import java.io.File;
import java.util.List;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ModelDriven;
import com.teamIT.epsi.hibernate.dao.MediasDAO;
import com.teamIT.epsi.hibernate.dao.UtilisateurDAO;
import com.teamIT.epsi.hibernate.tables.Medias;
import com.teamIT.epsi.hibernate.tables.Utilisateur;
import com.teamIT.epsi.struts.method.DiversMethod;

public class UtilisateurAction extends BaseAction implements ModelDriven<UtilisateurAction.UtilisateurModel>{
	
	public class UtilisateurModel{
		
		public List<Medias> mediasList;
		public Utilisateur utilisateur;
		public Integer idUser;
		private File file;
		@SuppressWarnings("unused")
		private String contentType;
	    private String filename;
	    private String destPath;

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

		public void setUpload(File file) {
	       this.file = file;
	    }
	
	    public void setUploadContentType(String contentType) {
	       this.contentType = contentType;
	    }
	
	    public void setUploadFileName(String filename) {
	       this.filename = filename;
	    }
	}
	
	private static final long serialVersionUID = 6378378866497247173L;
	public UtilisateurModel model = new UtilisateurModel();
	public UtilisateurDAO uDAO = new UtilisateurDAO();
	public MediasDAO mDAO = new MediasDAO();
	public DiversMethod dm = new DiversMethod();
			
	public String execute() {
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
		
		if(model.utilisateur.estAlternant.equals("1")){
			model.utilisateur.setEstAlternant("Yes");
		} else if(model.utilisateur.estAlternant.equals("2")){
			model.utilisateur.setEstAlternant("No");
		} else {
			model.utilisateur.setEstAlternant("Not specified");
		}
		
		return "profil";
	}
	
	public String editProfil() throws Exception{
		/* Surname FirstName Mail Password gender Alternate Chemin(photo) Note Droit */
		boolean empty = false;
		if((model.utilisateur.nom.isEmpty()) || (model.utilisateur.nom == null)){
			addActionError("Surname is empty.");
			empty = true;
		}
		if((model.utilisateur.prenom.isEmpty()) || (model.utilisateur.prenom == null)){
			addActionError("Firstname is empty");
			empty = true;
		}
		if((model.utilisateur.mail.isEmpty()) || (model.utilisateur.mail == null)){
			addActionError("Mail is empty");
			empty = true;
		}
		if(empty == true){
			return SUCCESS;
		}
		model.utilisateur.setPassword(dm.crypt(model.utilisateur));
		model.utilisateur.setDroit(((Utilisateur) sessionMap.get("utilisateur")).getDroit());
		model.utilisateur.setNote(((Utilisateur) sessionMap.get("utilisateur")).getNote());
		if(model.file == null){
			model.utilisateur.setChemin(((Utilisateur) sessionMap.get("utilisateur")).getChemin());
		}else{
			model.filename = model.utilisateur.nom + "_" + model.utilisateur.prenom + "_" + dm.date() + "_" + dm.random() + ".jpg";
			String classPath = UtilisateurAction.class.getClassLoader().getResource(UtilisateurAction.class.getName().replaceAll("\\.", "/" )+".class").getPath();
			String[] tokens = classPath.split(".metadata");
			model.destPath = tokens[0] + "Trombinoscope/sources/webapp/IMG/";
			File destFile  = new File(model.destPath, model.filename);
	    	FileUtils.copyFile(model.file, destFile);
	    	model.utilisateur.setChemin("http://localhost:8080/trombi/IMG/" + model.filename);
		}
		
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
