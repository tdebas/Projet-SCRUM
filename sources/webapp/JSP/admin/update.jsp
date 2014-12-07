<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
	
<s:include value="/JSP/layout/header.jsp" />

<s:if test="userEstConnecte & estAdmin">
	<div class="row">
		<s:include value="/JSP/layout/leftMenu.jsp" />
		<div class="col-md-9 content">
			<h2>Edit User</h2>
			

				  	<s:form theme="simple" cssClass="form-horizontal" role="form" action="administration_loadUserEdit" method="POST">
	  			 		<div class="form-group">
		  			 		<div class="col-sm-6">
		  			 			<s:select cssClass="form-control" list="userList" id="select_user_edit" name="userEdit.nom" headerKey="-1" Onchange="importDataUser();"/>
		  			 		</div>
		  			 		<div class="col-sm-2">
		  			 			<s:submit cssClass="btn btn-default" value="Load" /> <!-- OnClick="importDataUser();" --> 
		  			 		</div>
		  			 	</div>
		  			 </s:form>
		  			 
		  			 <s:form theme="simple" cssClass="form-horizontal" action="administration" method="POST">
	  			 		<div class="form-group">
		  			 		<div class="col-sm-3">
		  			 			<img src='${pageContext.request.contextPath}<s:property value="userEdit.chemin" />' class="img-circle" width="80%">
		  			 		</div>
			  			 	<div class="col-md-9">
		  			 			<div class="form-group">
				  			 		<label class="col-sm-2 control-label">Surname</label>
				  			 		<div class="col-sm-6">
				  			 			<s:textfield cssClass="form-control" name="userEdit.nom" value="%{userEdit.nom}"/>
				  			 		</div>
				  			 	</div>
									<div class="form-group">
				  			 		<label class="col-sm-2 control-label">Name</label>
				  			 		<div class="col-sm-6">
				  			 			<s:textfield cssClass="form-control" name="userEdit.prenom" value="%{userEdit.prenom}"/>
				  			 		</div>
				  			 	</div>
				  			 		<div class="form-group">
				  			 		<label class="col-sm-2 control-label">Mail</label>
				  			 		<div class="col-sm-6">
				  			 			<s:textfield cssClass="form-control" name="userEdit.mail" value="%{userEdit.mail}"/>
				  			 		</div>
				  			 	</div>
									<div class="form-group">
								    	<label for="edit_form" class="col-sm-2 control-label">Password</label>
								    	<div class="col-sm-6">
								      		<s:password cssClass="form-control" name="userEdit.password" />
								    	</div>
						  			</div>
						  			<div class="form-group">
								    	<label for="edit_form" class="col-sm-2 control-label">Gender</label>
								    	<div class="col-sm-6">
								    		<s:radio cssClass="form-horizontal" cssStyle="font-weight: normal" name="userEdit.sexe" list="#{'1 ':' Male ','2 ':' Female'}" value="%{userEdit.sexe}"></s:radio>
								    	</div>
						  			</div>
									<div class="form-group">
								    	<label for="edit_form" class="col-sm-2 control-label">Alternate</label>
								    	<div class="col-sm-6">
								    		<s:radio cssClass="form-horizontal" cssStyle="font-weight: normal" name="userEdit.estAlternant" list="#{'1 ':' Yes ','2 ':' No'}" value="%{userEdit.estAlternant}"></s:radio>
								    	</div>
						  			</div>
					  		</div>
		  			 	</div>
		  			 </s:form>

		</div>	
	</div>
</s:if>
<s:else>
	<s:include value="/JSP/layout/authentification.jsp" />
</s:else>

<s:include value="/JSP/layout/footer.jsp" />