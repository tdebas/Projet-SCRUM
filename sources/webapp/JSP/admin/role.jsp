<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
	
<s:include value="/JSP/layout/header.jsp" />

<s:if test="userEstConnecte & estAdmin">
	<div class="row">
		<s:include value="/JSP/layout/leftMenu.jsp" />
		<div class="col-md-9 content">
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
				    		<div class="col-sm-6">
			      				<div class="checkbox">
									<label><s:radio id="radio" name="radio_droit" list="#{'1 ':' Etudiant ','2 ':' Administrateur' , '3 ' : ' Super-Administrateur'}"></s:radio></label>
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