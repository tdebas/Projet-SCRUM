package com.teamIT.epsi.struts.actions;

import java.io.File;
import java.util.List;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ModelDriven;
import com.teamIT.epsi.hibernate.dao.DroitDAO;
import com.teamIT.epsi.hibernate.dao.MediasDAO;
import com.teamIT.epsi.hibernate.dao.UtilisateurDAO;
import com.teamIT.epsi.hibernate.tables.Medias;
import com.teamIT.epsi.hibernate.tables.Utilisateur;
import com.teamIT.epsi.struts.method.DiversMethod;
public class AdministrationAction extends BaseAction implements ModelDriven<AdministrationAction.AdministrationModel>{

	private static final long serialVersionUID = -450315913459654085L;
	
	public class AdministrationModel {
		public List<Utilisateur> userList;
		public Utilisateur utilisateur;
		public Medias media;
		private File file;
		@SuppressWarnings("unused")
		private String contentType;
	    private String filename;
	    private String destPath;

	     public void setUpload(File file) {
	        this.file = file;
	     }

	     public void setUploadContentType(String contentType) {
	        this.contentType = contentType;
	     }

	     public void setUploadFileName(String filename) {
	        this.filename = filename;
	     }
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

		public Medias getMedia() {
			return media;
		}

		public void setMedia(Medias media) {
			this.media = media;
		}
		
	}
	
	public AdministrationModel model = new AdministrationModel();
	public UtilisateurDAO uDAO = new UtilisateurDAO();
	public MediasDAO mDAO = new MediasDAO();
	public DroitDAO dDAO = new DroitDAO();
	public DiversMethod dm = new DiversMethod();
	
	public String execute(){
		model.userList = uDAO.getAllUser();
		return SUCCESS;
	}

	public String addUser() throws Exception{
		model.filename = model.utilisateur.nom + "_" + model.utilisateur.prenom + "_" + dm.date() + "_" + dm.random() + ".jpg";
		String classPath = AdministrationAction.class.getClassLoader().getResource(AdministrationAction.class.getName().replaceAll("\\.", "/" )+".class").getPath();
		String[] tokens = classPath.split(".metadata");
		model.destPath = tokens[0] + "Trombinoscope/sources/webapp/IMG/";
		File destFile  = new File(model.destPath, model.filename);
    	FileUtils.copyFile(model.file, destFile);
		model.utilisateur.setPassword(dm.crypt(model.utilisateur));
		model.utilisateur.setDroit(dDAO.getDroitById(1));
		model.utilisateur.setChemin("http://localhost:8080/trombi/IMG/" + model.filename);
		model.userList = uDAO.getAllUser();
		uDAO.saveOrUpdateUser(model.utilisateur);
		media();
		return SUCCESS;
	}
	
	public void media() throws Exception{
		Integer i = uDAO.getMax();
		Utilisateur utilisateur = uDAO.getUserById(i);
		model.media = new Medias(utilisateur.getChemin(), utilisateur);
		mDAO.saveOrUpdateMedia(model.media);
	}
	public AdministrationModel getModel() {
		return model;
	}
	public void setModel(AdministrationModel model) {
		this.model = model;
	}
		
}
