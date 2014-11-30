<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
	
<s:include value="/JSP/layout/header.jsp" />
	
<s:if test="userEstConnecte">
	<div class="row">
		<s:include value="/JSP/layout/leftMenu.jsp" />
		<div class="col-md-7 content">
			<h2>Edit profil</h2>  			
	  		<div class="panel-body">
			  <s:form theme="simple" cssClass="form-horizontal" role="form" action="utilisateur_editProfil" method="POST" enctype="multipart/form-data">
				<s:hidden name="utilisateur.idUtilisateur" value="%{#session.utilisateur.idUtilisateur}" />
					<div class="form-group">
				    	<label for="edit_form" class="col-sm-2 control-label">Surname</label>
				    	<div class="col-sm-9">
				      		<s:textfield cssClass="form-control" id="nom" name="utilisateur.nom" value="%{#session.utilisateur.nom}"/>
				    	</div>
				    </div>
				    <div class="form-group">
				    	<label for="edit_form" class="col-sm-2 control-label">Firstname</label>
				    	<div class="col-sm-9">
				      		<s:textfield cssClass="form-control" id="prenom" name="utilisateur.prenom" value="%{#session.utilisateur.prenom}"/>
				    	</div>
		  			</div>
		  			<div class="form-group">
				    	<label for="edit_form" class="col-sm-2 control-label">Mail</label>
				    	<div class="col-sm-9">
				      		<s:textfield cssClass="form-control" id="mail" name="utilisateur.mail" value="%{#session.utilisateur.mail}"/>
				    	</div>
		  			</div>
		  			<div class="form-group">
				    	<label for="edit_form" class="col-sm-2 control-label">Password</label>
				    	<div class="col-sm-9">
				      		<s:password cssClass="form-control" id="password" name="utilisateur.password" value="%{#session.utilisateur.password}"/>
				    	</div>
		  			</div>
		  			<div class="form-group">
				    	<label for="edit_form" class="col-sm-2 control-label">Gender</label>
				    	<div class="col-sm-9">
				    		<s:radio cssClass="form-horizontal" cssStyle="font-weight: normal" name="utilisateur.sexe" list="#{'1':'Male ','2':'Female'}" value="%{#session.utilisateur.sexe}"></s:radio>
				    	</div>
		  			</div>
					<div class="form-group">
				    	<label for="edit_form" class="col-sm-2 control-label">Alternate</label>
				    	<div class="col-sm-9">
				    		<s:radio cssClass="form-horizontal" cssStyle="font-weight: normal" name="utilisateur.estAlternant" list="#{'1':'Yes ','2':'No'}" value="%{#session.utilisateur.estAlternant}"></s:radio>
				    	</div>
		  			</div>
		  			<div class="form-group">
		  				<label for="edit_form" class="col-sm-2 control-label">Photo *.jpg</label>
			    		<div class="col-sm-9">
			      			<p style="text-align:left"><s:file name="upload" label="File" accept="image/jpeg" /></p>
			    		</div>
				  	</div>
		  			<div class="form-group">
		    			<div class="col-sm-offset-2 col-sm-9">
		      				<s:submit cssClass="btn btn-default" value="Edit" />
		    			</div>
		  			</div>
				</s:form>
			 </div>
		</div>
		<div class="col-md-3">
			<s:if test="hasActionErrors()">
				<div class="alert alert-danger" style="margin-top:90px;">
					<p><span class="glyphicon glyphicon-exclamation-sign"> Error !</span><p><br/>
					<p><span><s:actionerror cssStyle="list-style-type:none;" cssClass="actionerror" /></p>
				</div>
			</s:if>
		</div>
	</div>
</s:if>
<s:else>
	<s:include value="/JSP/layout/authentification.jsp" />
</s:else>

<s:include value="/JSP/layout/footer.jsp" />