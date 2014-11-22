<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
	
<s:include value="/JSP/layout/header.jsp" />
	
<s:if test="userEstConnecte">
	<div class="row">
		<s:include value="/JSP/layout/leftMenu.jsp" />
		<div class="col-md-9 content">
			<h3>Edit profil</h3>  			
  			
		  		<div class="panel-body">
				  <s:form theme="simple" cssClass="form-horizontal" role="form" action="editProfil_user" method="POST">
						<div class="form-group">
				    	<label for="edit_form" class="col-sm-2 control-label">Nom</label>
				    	<div class="col-sm-6">
				      		<s:textfield cssClass="form-control" id="nom" name="utilisateur.nom" />
				    	</div>
				    </div>
				    <div class="form-group">
				    	<label for="edit_form" class="col-sm-2 control-label">Prénom</label>
				    	<div class="col-sm-6">
				      		<s:textfield cssClass="form-control" id="prenom" name="utilisateur.prenom" />
				    	</div>
		  			</div>
		  			<div class="form-group">
				    	<label for="edit_form" class="col-sm-2 control-label">Mail</label>
				    	<div class="col-sm-6">
				      		<s:textfield cssClass="form-control" id="mail" name="utilisateur.mail" />
				    	</div>
		  			</div>
		  			<div class="form-group">
				    	<label for="edit_form" class="col-sm-2 control-label">Sexe</label>
				    	<div class="col-sm-6">
				      		<s:textfield cssClass="form-control" id="sexe" name="utilisateur.sexe" />
				    	</div>
		  			</div>
					<div class="form-group">
				    	<label for="edit_form" class="col-sm-2 control-label">estAlternant</label>
				    	<div class="col-sm-6">
				      		<s:textfield cssClass="form-control" id="estAlternant" name="utilisateur.estAlternant" />
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