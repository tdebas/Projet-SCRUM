<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
	
<s:include value="/JSP/layout/header.jsp" />

<s:if test="userEstConnecte & estAdmin">
	<div class="row">
		<s:include value="/JSP/layout/leftMenu.jsp" />
		<div class="col-md-9 content">
			<h2>Remove User</h2>
			
			<s:form theme="simple" cssClass="form-horizontal" role="form" action="administration_loadUserRemove" method="POST">
				<div class="form-group">
					<div class="col-sm-6">
						<s:select cssClass="form-control" list="userList" id="select_user_remove" name="utilisateur.nom" headerKey="-1" />
					</div>
					<div class="col-sm-2">
						<s:submit cssClass="btn btn-default" value="Load" />
					</div>
				</div>
			</s:form>
			<br/><br/>
			<s:form id="hide" theme="simple" cssClass="form-horizontal" role="form" action="administration_RemoveUser" method="POST">
				<s:hidden name="utilisateur.idUtilisateur" value="%{utilisateur.idUtilisateur}" />
				<div class="form-group" >
					<div class="col-sm-4">
						<img src='${pageContext.request.contextPath}<s:property value="utilisateur.chemin" />' class="img-circle" width="60%">
					</div>
					<div class="col-md-8">
						<div class="form-group">
							<div>
								<div class="form-group">
									<label style="width: 20%;">Surname :</label>  
									<span id="empty"><s:property value="utilisateur.nom"/></span>
								</div>
							</div>
							<div>
					 			<div class="form-group"><label style="width: 20%;">Firstname :</label>
					 			<s:property value="utilisateur.prenom"/></div>
							</div>
					 		<div>
					 			<div class="form-group"><label style="width: 20%;">Mail :</label>
					 			<s:property value="utilisateur.mail"/></div>
							</div>
							<div>
					 			<div class="form-group"><label style="width: 20%;">Gender :</label>
					 			<s:property value="sexe"/></div>
							</div>
							<div>
					 			<div class="form-group"><label style="width: 20%;">Alternate :</label>
					 			<s:property value="alternant"/></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-2" >
					<s:submit cssClass="btn btn-danger" value="Remove"/>
				</div>
			</s:form>	
		</div>	
	</div>
</s:if>
<s:else>
	<s:include value="/JSP/layout/authentification.jsp" />
</s:else>

<s:include value="/JSP/layout/footer.jsp" />
<script type="text/javascript">
  $(document).ready(function(){
	
	  function loadingUser(){
         $.ajax({
           type: "POST",
           url: "/trombi/administration_loadUserRemove",
           data: {nom: $("#select_user_remove").val()},
           success: function(){
           }
         });
	  }
 
	  if($('#empty').text() == ""){
		  $('#hide').addClass('hide');
	  }
	  
  });
</script>