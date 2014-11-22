<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
	
<s:include value="/JSP/layout/header.jsp" />
	
<s:if test="userEstConnecte">
	<div class="row">
		<s:include value="/JSP/layout/leftMenu.jsp" />
		<div class="col-md-9 content">
			<h3>Edit profil</h3>  			
  			
		  		<div class="panel-body">
				  <s:form theme="simple" cssClass="form-horizontal" role="form" action="utilisateur_editProfil" method="POST">
					<s:hidden name="utilisateur.idUtilisateur" value="%{#session.utilisateur.idUtilisateur}" />
					<div class="form-group">
				    	<label for="edit_form" class="col-sm-2 control-label">Surname</label>
				    	<div class="col-sm-6">
				      		<s:textfield cssClass="form-control" id="nom" name="utilisateur.nom" value="%{#session.utilisateur.nom}"/>
				    	</div>
				    </div>
				    <div class="form-group">
				    	<label for="edit_form" class="col-sm-2 control-label">Firstname</label>
				    	<div class="col-sm-6">
				      		<s:textfield cssClass="form-control" id="prenom" name="utilisateur.prenom" value="%{#session.utilisateur.prenom}"/>
				    	</div>
		  			</div>
		  			<div class="form-group">
				    	<label for="edit_form" class="col-sm-2 control-label">Mail</label>
				    	<div class="col-sm-6">
				      		<s:textfield cssClass="form-control" id="mail" name="utilisateur.mail" value="%{#session.utilisateur.mail}"/>
				    	</div>
		  			</div>
		  			<div class="form-group">
				    	<label for="edit_form" class="col-sm-2 control-label">Password</label>
				    	<div class="col-sm-6">
				      		<s:password cssClass="form-control" id="password" name="utilisateur.password" value="%{#session.utilisateur.password}"/>
				    	</div>
		  			</div>
		  			<div class="form-group">
				    	<label for="edit_form" class="col-sm-2 control-label">Gender</label>
				    	<div class="col-sm-6">
				      		<input type="radio" name="utilisateur.sexe" value="homme" class="form-horizontal"> Male<br/>
				      		<input type="radio" name="utilisateur.sexe" value="femme" class="form-horizontal"> Female
				    	</div>
		  			</div>
					<div class="form-group">
				    	<label for="edit_form" class="col-sm-2 control-label">Alternate</label>
				    	<div class="col-sm-6">
				      		<input type="radio" name="utilisateur.estAlternant" value="oui" class="form-horizontal"> Yes<br/>
				      		<input type="radio" name="utilisateur.estAlternant" value="non" class="form-horizontal"> No
				    	</div>
		  			</div>
			  			<div class="form-group">
			    			<div class="col-sm-offset-2 col-sm-6">
			      				<s:submit cssClass="btn btn-default" value="Modifier" />
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