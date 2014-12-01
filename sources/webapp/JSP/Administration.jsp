<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
	
<s:include value="/JSP/layout/header.jsp" />

  <script>
  $(function() {
    $( "#accordion" ).accordion();
  });
  </script>

<s:if test="userEstConnecte & estAdmin">
	<div class="row">
		<s:include value="/JSP/layout/leftMenu.jsp" />
		<div class="col-md-9 content">
			<h2>Manage</h2>
			<div id="accordion">
				<h2>Add user</h2>  			
	  			 	<s:form theme="simple" cssClass="form-horizontal" role="form" action="administration_addUser" method="POST" enctype="multipart/form-data">
	  			 		<div class="form-group">
		  			 		<label class="col-sm-2 control-label">Surname</label>
		  			 		<div class="col-sm-6">
		  			 			<s:textfield cssClass="form-control" id="nom" name="userAdd.nom" />
		  			 		</div>
		  			 	</div>
	  			 		<div class="form-group">
		  			 		<label class="col-sm-2 control-label">Firstname</label>
		  			 		<div class="col-sm-6">
		  			 			<s:textfield cssClass="form-control" id="prenom" name="userAdd.prenom" />
		  			 		</div>
	  			 		</div>
	  			 		<div class="form-group">
					    	<label for="edit_form" class="col-sm-2 control-label">Mail</label>
					    	<div class="col-sm-6">
					      		<s:textfield cssClass="form-control" id="mail" name="userAdd.mail" />
					    	</div>
			  			</div>
			  			<div class="form-group">
					    	<label for="edit_form" class="col-sm-2 control-label">Password</label>
					    	<div class="col-sm-6">
					      		<s:password cssClass="form-control" id="password" name="userAdd.password" />
					    	</div>
			  			</div>
			  			<div class="form-group">
					    	<label for="edit_form" class="col-sm-2 control-label">Gender</label>
					    	<div class="col-sm-6">
					    		<s:radio cssClass="form-horizontal" cssStyle="font-weight: normal" name="userAdd.sexe" list="#{'1 ':' Male ','2 ':' Female'}" ></s:radio>
					    	</div>
			  			</div>
						<div class="form-group">
					    	<label for="edit_form" class="col-sm-2 control-label">Alternate</label>
					    	<div class="col-sm-6">
					    		<s:radio cssClass="form-horizontal" cssStyle="font-weight: normal" name="userAdd.estAlternant" list="#{'1 ':' Yes ','2 ':' No'}"></s:radio>
					    	</div>
			  			</div>
			  			<div class="form-group">
			  				<label for="edit_form" class="col-sm-2 control-label">Photo</label>
				    		<div class="col-sm-6">
				      			<s:file name="upload" label="File" accept="image/gif, image/jpeg, image/png" />
				    		</div>
					  	</div>
			  			<div class="form-group">
				    		<div class="col-sm-offset-2 col-sm-6">
				      			<s:submit cssClass="btn btn-default" value="Add" />
				    		</div>
				  		</div>
	  			 	</s:form>
			  	<h2>Edit user</h2>
				  	<s:form theme="simple" cssClass="form-horizontal" role="form" action="administration_loadUserEdit" method="POST">
	  			 		<div class="form-group">
		  			 		<div class="col-sm-6">
		  			 			<s:select cssClass="form-control" list="userList" id="select_user_edit" name="userEdit.nom" headerKey="-1" />
		  			 		</div>
		  			 		<div class="col-sm-2">
		  			 			<s:submit cssClass="btn btn-default" value="Edit user" />
		  			 		</div>
		  			 	</div>
	  			 		<div class="form-group">
		  			 		<label class="col-sm-2 control-label">Surname</label>
		  			 		<div class="col-sm-6">
		  			 			<s:textfield cssClass="form-control" id="nom" name="userList.nom" />
		  			 		</div>
		  			 	</div>
	  			 		<div class="form-group">
		  			 		<label class="col-sm-2 control-label">Firstname</label>
		  			 		<div class="col-sm-6">
		  			 			<s:textfield cssClass="form-control" id="prenom" name="userEdit.prenom" />
		  			 		</div>
	  			 		</div>
	  			 		<div class="form-group">
					    	<label for="edit_form" class="col-sm-2 control-label">Mail</label>
					    	<div class="col-sm-6">
					      		<s:textfield cssClass="form-control" id="mail" name="userEdit.mail" />
					    	</div>
			  			</div>
			  			<div class="form-group">
					    	<label for="edit_form" class="col-sm-2 control-label">Password</label>
					    	<div class="col-sm-6">
					      		<s:password cssClass="form-control" id="password" name="userEdit.password" />
					    	</div>
			  			</div>
			  			<div class="form-group">
					    	<label for="edit_form" class="col-sm-2 control-label">Gender</label>
					    	<div class="col-sm-6">
					    		<s:radio cssClass="form-horizontal" cssStyle="font-weight: normal" name="userEdit.sexe" list="#{'1':'Male ','2':'Female'}" ></s:radio>
					    	</div>
			  			</div>
						<div class="form-group">
					    	<label for="edit_form" class="col-sm-2 control-label">Alternate</label>
					    	<div class="col-sm-6">
					    		<s:radio cssClass="form-horizontal" cssStyle="font-weight: normal" name="userEdit.estAlternant" list="#{'1':'Yes ','2':'No'}"></s:radio>
					    	</div>
			  			</div>
	  			 	</s:form>
	  			 	<s:form theme="simple" cssClass="form-horizontal" role="form" action="administration_updateUser" method="POST">
	  			 		<div class="form-group">
				    		<div class="col-sm-offset-2 col-sm-6">
				      			<s:submit cssClass="btn btn-default" value="Edit" />
				    		</div>
				  		</div>
	  			 	</s:form>
			  	<h2>Remove user</h2>
				  	<s:form theme="simple" cssClass="form-horizontal" role="form" action="administration_loadUserRemove" method="POST">
	  			 		<div class="form-group">
		  			 		<div class="col-sm-6">
		  			 			<s:select cssClass="form-control" list="userList" id="select_user_remove" name="userRemove.nom" headerKey="-1" />
		  			 		</div>
		  			 		<div class="col-sm-2">
		  			 			<s:submit cssClass="btn btn-default" value="Load" />
		  			 		</div>
		  			 	</div>
		  			 	<div class="form-group">
		  			 		<div class="col-sm-4">
		  			 			<img src='<s:property value="userRemove.chemin" />' class="img-circle" width="60%">
		  			 		</div>
			  			 	<div class="col-md-8">
				  			 	<div class="form-group">
				  			 		<div>
				  			 			<div class="form-group"><label style="width: 20%;">Surname</label><label> : <s:property value="userRemove.nom"/></label></div>
									</div>
									<div>
				  			 			<div class="form-group"><label style="width: 20%;">Firstname</label><label> : <s:property value="userRemove.prenom"/></label></div>
									</div>
				  			 		<div>
				  			 			<div class="form-group"><label style="width: 20%;">Mail</label><label> : <s:property value="userRemove.mail"/></label></div>
									</div>
									<div>
				  			 			<div class="form-group"><label style="width: 20%;">Gender</label><label> : <s:property value="userRemove.sexe"/></label></div>
									</div>
									<div>
				  			 			<div class="form-group"><label style="width: 20%;">Alternate</label><label> : <s:property value="userRemove.estAlternant"/></label></div>
									</div>
					  			</div>
					  		</div>
		  			 	</div>
	  			 	</s:form>
	  			 	<s:form theme="simple" cssClass="form-horizontal" role="form" action="administration_RemoveUser" method="POST">
	  			 		<div class="col-sm-2">
		  					<s:submit cssClass="btn btn-default" value="Remove" />
		  				</div>
	  			 	</s:form>
  			 	<h2>Changing Roles</h2>
				  	<s:form theme="simple" cssClass="form-horizontal" role="form" action="administration_changingRoles" method="POST">
	  			 		<div class="form-group">
		  			 		<div class="col-sm-6">
		  			 			<s:select cssClass="form-control" list="userList" id="nom" name="userChangeDroit.idUtilisateur" headerKey="-1" />
		  			 		</div>
		  			 		<div class="col-sm-2">
		  			 			<s:submit cssClass="btn btn-default" value="Change" />
		  			 		</div>
		  			 	</div>
			  			<div class="form-group">
				    		<div class="col-sm-offset-0 col-sm-6">
				      				<div class="checkbox">
										<label>
											<s:radio id="radio" name="radio_droit" list="#{'1 ':' Etudiant ','2 ':' Administrateur' , '3 ' : ' Super-Administrateur'}"></s:radio>
										</label>
									</div>
				    		</div>
				  		</div>
	  			 	</s:form>	
  			</div>
		</div>	
	</div>
</s:if>
<s:else>
	<s:include value="/JSP/layout/authentification.jsp" />
</s:else>

<s:include value="/JSP/layout/footer.jsp" />