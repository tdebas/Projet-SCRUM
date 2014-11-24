<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
	
<s:include value="/JSP/layout/header.jsp" />

<head>
  <meta charset="utf-8">
  <title>jQuery UI Accordion - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#accordion" ).accordion();
  });
  </script>
</head>
  
<s:if test="userEstConnecte & estAdmin">
	<div class="row">
		<s:include value="/JSP/layout/leftMenu.jsp" />
		<div class="col-md-9 content">
			<h2>Manage user</h2>
				<div id="accordion">
						<h2>Add user</h2>  			
			  			 	<s:form theme="simple" cssClass="form-horizontal" role="form" action="administration_addUser" method="POST">
			  			 		<div class="form-group">
				  			 		<label class="col-sm-2 control-label">Surname</label>
				  			 		<div class="col-sm-6">
				  			 			<s:textfield cssClass="form-control" id="nom" name="utilisateur.nom" />
				  			 		</div>
				  			 	</div>
			  			 		<div class="form-group">
				  			 		<label class="col-sm-2 control-label">Firstname</label>
				  			 		<div class="col-sm-6">
				  			 			<s:textfield cssClass="form-control" id="nom" name="utilisateur.prenom" />
				  			 		</div>
			  			 		</div>
			  			 		<div class="form-group">
							    	<label for="edit_form" class="col-sm-2 control-label">Mail</label>
							    	<div class="col-sm-6">
							      		<s:textfield cssClass="form-control" id="mail" name="utilisateur.mail" />
							    	</div>
					  			</div>
					  			<div class="form-group">
							    	<label for="edit_form" class="col-sm-2 control-label">Password</label>
							    	<div class="col-sm-6">
							      		<s:password cssClass="form-control" id="password" name="utilisateur.password" />
							    	</div>
					  			</div>
					  			<div class="form-group">
							    	<label for="edit_form" class="col-sm-2 control-label">Gender</label>
							    	<div class="col-sm-6">
							    		<s:radio cssClass="form-horizontal" cssStyle="font-weight: normal" name="utilisateur.sexe" list="#{'1':'Male ','2':'Female'}" ></s:radio>
							    	</div>
					  			</div>
								<div class="form-group">
							    	<label for="edit_form" class="col-sm-2 control-label">Alternate</label>
							    	<div class="col-sm-6">
							    		<s:radio cssClass="form-horizontal" cssStyle="font-weight: normal" name="utilisateur.estAlternant" list="#{'1':'Yes ','2':'No'}"></s:radio>
							    	</div>
					  			</div>
					  			<div class="form-group">
						    		<div class="col-sm-offset-2 col-sm-6">
						      			<s:submit cssClass="btn btn-default" value="Add" />
						    		</div>
						  		</div>
			  			 	</s:form>
					  	<h2>Edit user</h2>
							  	<s:form theme="simple" cssClass="form-horizontal" role="form" action="administration_editUser" method="POST">
				  			 		<div class="form-group">
					  			 		<label class="col-sm-2 control-label">Surname</label>
					  			 		<div class="col-sm-6">
					  			 			<s:textfield cssClass="form-control" id="nom" name="utilisateur.nom" />
					  			 		</div>
					  			 	</div>
				  			 		<div class="form-group">
					  			 		<label class="col-sm-2 control-label">Firstname</label>
					  			 		<div class="col-sm-6">
					  			 			<s:textfield cssClass="form-control" id="nom" name="utilisateur.prenom" />
					  			 		</div>
				  			 		</div>
				  			 		<div class="form-group">
								    	<label for="edit_form" class="col-sm-2 control-label">Mail</label>
								    	<div class="col-sm-6">
								      		<s:textfield cssClass="form-control" id="mail" name="utilisateur.mail" />
								    	</div>
						  			</div>
						  			<div class="form-group">
								    	<label for="edit_form" class="col-sm-2 control-label">Password</label>
								    	<div class="col-sm-6">
								      		<s:password cssClass="form-control" id="password" name="utilisateur.password" />
								    	</div>
						  			</div>
						  			<div class="form-group">
								    	<label for="edit_form" class="col-sm-2 control-label">Gender</label>
								    	<div class="col-sm-6">
								    		<s:radio cssClass="form-horizontal" cssStyle="font-weight: normal" name="utilisateur.sexe" list="#{'1':'Male ','2':'Female'}" ></s:radio>
								    	</div>
						  			</div>
									<div class="form-group">
								    	<label for="edit_form" class="col-sm-2 control-label">Alternate</label>
								    	<div class="col-sm-6">
								    		<s:radio cssClass="form-horizontal" cssStyle="font-weight: normal" name="utilisateur.estAlternant" list="#{'1':'Yes ','2':'No'}"></s:radio>
								    	</div>
						  			</div>
						  			<div class="form-group">
							    		<div class="col-sm-offset-2 col-sm-6">
							      			<s:submit cssClass="btn btn-default" value="Edit" />
							    		</div>
							  		</div>
				  			 	</s:form>
						  	<h2>Remove user</h2>
							  	<s:form theme="simple" cssClass="form-horizontal" role="form" action="administration_removeUser" method="POST">
				  			 		<div class="form-group">
					  			 		<div class="col-sm-6">
					  			 			<s:select cssClass="form-control" list="userList" id="nom" name="userList.utilisateur.idUtilisateur" headerKey="-1" />
					  			 		</div>
					  			 		<div class="col-sm-2">
					  			 			<s:submit cssClass="btn btn-default" value="Remove" />
					  			 		</div>
					  			 	</div>
					  			 	<div class="form-group">
					  			 		<div class="col-sm-3">
					  			 			<img src="IMG/test.jpg" alt="..." class="img-circle">
					  			 		</div>
						  			 	<div class="form-group">
						  			 		<div class="col-sm-6">
						  			 			<label>Surname : </label><br/>
											</div>
											<div class="col-sm-6">
						  			 			<label>Firstname : </label><br/>
											</div>
						  			 		<div class="col-sm-6">
						  			 			<label>Mail : </label><br/>
											</div>
											<div class="col-sm-6">
						  			 			<label>Gender : </label><br/>
											</div>
											<div class="col-sm-6">
						  			 			<label>Alternate: </label><br/>
											</div>
											<div class="col-sm-6">
						  			 			<label>Firstname : </label>
											</div>
							  			</div>
					  			 	</div>
				  			 	</s:form>	
			  			 	<h2>Changing Roles</h2>
							  	<s:form theme="simple" cssClass="form-horizontal" role="form" action="administration_changingRoles" method="POST">
				  			 		<div class="form-group">
					  			 		<div class="col-sm-6">
					  			 			<s:select cssClass="form-control" list="userList" id="nom" name="userList.utilisateur.idUtilisateur" headerKey="-1" />
					  			 		</div>
					  			 		<div class="col-sm-2">
					  			 			<s:submit cssClass="btn btn-default" value="Change" />
					  			 		</div>
					  			 	</div>
						  			<div class="form-group">
							    		<div class="col-sm-offset-0 col-sm-6">
							      				<div class="checkbox">
													<label>
														<s:radio id="checkbox1" list="#{'1 ':' Etudiant ','2 ':' Administrateur' , '3 ' : ' Super-Administrateur'}"></s:radio>
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