<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
	
<s:include value="/JSP/layout/header.jsp" />

<s:if test="userEstConnecte & estAdmin">
<div class="row">
	<s:include value="/JSP/layout/leftMenu.jsp" />
		<div class="col-md-7 content">
			<h2>Add User</h2>
		
		 	<s:form theme="simple" cssClass="form-horizontal" role="form" action="administration_addUser" method="POST" enctype="multipart/form-data">
				<div class="form-group">
					<label class="col-sm-2 control-label">Surname</label>
					<div class="col-sm-6">
						<s:textfield cssClass="form-control" name="utilisateur.nom" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Firstname</label>
					<div class="col-sm-6">
						<s:textfield cssClass="form-control" name="utilisateur.prenom" />
					</div>
				</div>
				<div class="form-group">
					<label for="edit_form" class="col-sm-2 control-label">Mail</label>
					<div class="col-sm-6">
				  		<s:textfield cssClass="form-control" name="utilisateur.mail" />
				 	</div>
				</div>
				<div class="form-group">
				 	<label for="edit_form" class="col-sm-2 control-label">Password</label>
				 	<div class="col-sm-6">
				   		<s:password cssClass="form-control" name="utilisateur.password" />
				 	</div>
				</div>
				<div class="form-group">
				 	<label for="edit_form" class="col-sm-2 control-label">Gender</label>
				 	<div class="col-sm-6">
				 		<s:radio cssClass="form-horizontal" cssStyle="font-weight: normal" name="utilisateur.sexe" list="#{'1 ':' Male ','2 ':' Female'}" ></s:radio>
				   	</div>
						</div>
				<div class="form-group">
				   	<label for="edit_form" class="col-sm-2 control-label">Alternate</label>
				   	<div class="col-sm-6">
				   		<s:radio cssClass="form-horizontal" cssStyle="font-weight: normal" name="utilisateur.estAlternant" list="#{'1 ':' Yes ','2 ':' No'}"></s:radio>
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
				  			<s:submit cssClass="btn btn-success" value="Add" />
						</div>
				</div>
			</s:form>
		</div>	
		<div class="col-md-3">
			<s:if test="hasActionErrors()">
				<div class="alert alert-danger" style="margin-top:90px;">
					<p><span class="glyphicon glyphicon-exclamation-sign"> Error !</span><p><br/>
					<p><span><s:actionerror cssStyle="list-style-type:none;" cssClass="actionerror" /></span></p>
				</div>
			</s:if>
		</div>
</div>
</s:if>
<s:else>
	<s:include value="/JSP/layout/authentification.jsp" />
</s:else>

<s:include value="/JSP/layout/footer.jsp" />