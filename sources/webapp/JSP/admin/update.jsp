<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
	
<s:include value="/JSP/layout/header.jsp" />

<s:if test="userEstConnecte & estAdmin">
	
<div class="row">
	<s:include value="/JSP/layout/leftMenu.jsp" />
	<div class="col-md-7 content">
		<h2>Edit User</h2>
		  
		<s:form theme="simple" cssClass="form-horizontal" role="form" action="administration_loadUserEdit" method="POST">
			<div class="form-group">
				<div class="col-sm-6">
					<s:select cssClass="form-control" list="userList" id="select_user_edit" name="utilisateur.nom" headerKey="-1" />
				</div>
				<div class="col-sm-2">
					<s:submit cssClass="btn btn-default" value="Load" />
				</div>
			</div>
		</s:form>
		<br/><br/>
		<div id="hide">
			<s:form theme="simple" cssClass="form-horizontal" action="administration_updateUser" method="POST">
				<div class="form-group">
					<s:hidden name="utilisateur.idUtilisateur" value="%{utilisateur.idUtilisateur}"/>
					<s:hidden name="utilisateur.note" value="%{utilisateur.note}"/>
					<s:hidden name="utilisateur.chemin" value="%{utilisateur.chemin}"/>
					<s:hidden name="utilisateur.nbVote" value="%{utilisateur.nbVote}"/>
					<div class="col-sm-3">
						<img id="avatar" src='${pageContext.request.contextPath}<s:property value="utilisateur.chemin" />' class="img-circle" width="100%">
					</div>
					<div class="col-md-9">
						<div id="empty" style="color:#ffe"><s:property value="utilisateur.nom" /></div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Surname</label>
							<div class="col-sm-6">
								<s:textfield cssClass="form-control" name="utilisateur.nom" value="%{utilisateur.nom}"/>
						 	</div>
				 		</div>
						<div class="form-group">
						 	<label class="col-sm-2 control-label">Name</label>
						 	<div class="col-sm-6">
						 		<s:textfield cssClass="form-control" name="utilisateur.prenom" value="%{utilisateur.prenom}"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Mail</label>
							<div class="col-sm-6">
								<s:textfield cssClass="form-control" name="utilisateur.mail" value="%{utilisateur.mail}"/>
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
						 		<s:radio cssClass="form-horizontal" cssStyle="font-weight: normal" name="utilisateur.sexe" list="#{'1 ':' Male ','2 ':' Female'}" value="%{utilisateur.sexe}"></s:radio>
						   	</div>
						</div>
						<div class="form-group">
						   	<label for="edit_form" class="col-sm-2 control-label">Alternate</label>
						   	<div class="col-sm-6">
						   		<s:radio cssClass="form-horizontal" cssStyle="font-weight: normal" name="utilisateur.estAlternant" list="#{'1 ':' Yes ','2 ':' No'}" value="%{utilisateur.estAlternant}"></s:radio>
						 	</div>
						</div>
						<div class="form-group">
							<div class="col-sm-1">
								<s:submit cssClass="btn btn-warning" value="Update"/>
							</div>
						</div>
					</div>
				</div>
			</s:form>
			<h2>Change picture</h2>
			 <s:form theme="simple" cssClass="form-horizontal" role="form" action="administration_changePicture" method="POST" enctype="multipart/form-data">
			 	<s:hidden name="utilisateur.idUtilisateur" value="%{utilisateur.idUtilisateur}" />
			 	<div class="form-group">
	  				<label for="edit_form" class="col-sm-3 control-label">Photo *.jpg</label>
		    		<div class="col-sm-9">
		      			<p style="text-align:left"><s:file name="upload" label="File" accept="image/jpeg" /></p>
		    		</div>
			  	</div>
	  			<div class="form-group">
	    			<div class="col-sm-offset-3 col-sm-9">
	      				<s:submit cssClass="btn btn-warning" value="Change" />
	    			</div>
	  			</div>
			</s:form>
		</div>
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

<script type="text/javascript">
  $(document).ready(function(){
 
	  if($('#empty').text() == ""){
		  $('#hide').addClass('hide');
	  }

  });
</script>