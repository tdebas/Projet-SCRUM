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
		public Utilisateur userRemove;
		public Utilisateur userAdd;
		public Utilisateur userEdit;
		public Utilisateur userChangeDroit;
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
		
		public Utilisateur getUserRemove() {
			return userRemove;
		}

		public void setUserRemove(Utilisateur userRemove) {
			this.userRemove = userRemove;
		}

		public Utilisateur getUserAdd() {
			return userAdd;
		}

		public void setUserAdd(Utilisateur userAdd) {
			this.userAdd = userAdd;
		}

		public Utilisateur getUserEdit() {
			return userEdit;
		}

		public void setUserEdit(Utilisateur userEdit) {
			this.userEdit = userEdit;
		}

		public Utilisateur getUserChangeDroit() {
			return userChangeDroit;
		}

		public void setUserChangeDroit(Utilisateur userChangeDroit) {
			this.userChangeDroit = userChangeDroit;
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
	
	private String username;
	private String name;
	
    public void setUsername(String username) {
        this.username = username;
    }
    public void setName(String name) {
        this.name = name;
    }
	
	public String execute(){
		model.userList = uDAO.getAllUser();
		return SUCCESS;
	}
	
	public String addUser() throws Exception{
		model.filename = model.userAdd.nom + "_" + model.userAdd.prenom + "_" + dm.date() + "_" + dm.random() + ".jpg";
		String classPath = AdministrationAction.class.getClassLoader().getResource(AdministrationAction.class.getName().replaceAll("\\.", "/" )+".class").getPath();
		String[] tokens = classPath.split(".metadata");
		model.destPath = tokens[0] + "Trombinoscope/sources/webapp/IMG/";
		File destFile  = new File(model.destPath, model.filename);
    	FileUtils.copyFile(model.file, destFile);
		model.userAdd.setPassword(dm.crypt(model.userAdd));
		model.userAdd.setDroit(dDAO.getDroitById(1));
		model.userAdd.setChemin("http://localhost:8080/trombi/IMG/" + model.filename);
		model.userList = uDAO.getAllUser();
		uDAO.saveOrUpdateUser(model.userAdd);
		media();
		return SUCCESS;
	}

	public String updateUser() throws Exception{
		model.userEdit.setPassword(dm.crypt(model.userEdit));
		model.userEdit.setDroit(dDAO.getDroitById(1));
		model.userEdit.setChemin("http://localhost:8080/trombi/IMG/" + model.filename);
		uDAO.saveOrUpdateUser(model.userEdit);
		return execute();
	}
	
	public String loadUserRemove(){
		model.userRemove = uDAO.getUserName(model.userRemove.nom);
		return execute();
	}
	
	public String loadUserEdit(){
		model.userEdit = uDAO.getUserName(username);
		return execute();
	}
	
	public String RemoveUser(){
		uDAO.delete(model.userRemove);
		return execute();
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
