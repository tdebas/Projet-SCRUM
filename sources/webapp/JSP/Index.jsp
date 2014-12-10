<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
	
<s:include value="/JSP/layout/header.jsp" />
	
<s:if test="userEstConnecte">
	<div class="row">
		<s:include value="/JSP/layout/leftMenu.jsp" />
		<div class="col-md-9 content">
			<h2>Hello <s:property value="#session.utilisateur.prenom" /> !</h2>
			<div class="row">
				<div class="col-md-5 col-md-offset-1">
					<div class="list-group">
						<a class="list-group-item" href='<s:url action="utilisateur_execute"/>'>
							<div class="media">
							  <div class="media-left" style="float:left;margin-right:10px;">
							    <h2><span class="glyphicon glyphicon-pencil"></span></h2>
							  </div>
							  <div class="media-body">
							    <h3 class="media-heading">EDIT PROFILE</h3>
							    	You can edit your profile and change your picture.
							  </div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-md-5 col-md-offset-1">
					<div class="list-group">
						<a class="list-group-item" href='<s:url action="trombinoscope_execute"/>'>
							<div class="media">
							  <div class="media-left" style="float:left;margin-right:10px;">
							    <h2><span class="glyphicon glyphicon-th"></span></h2>
							  </div>
							  <div class="media-body">
							    <h3 class="media-heading">TROMBINOSCOPE</h3>
							    	You can watch the trombinoscope and view the student profile.
							  </div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="row">
				<s:if test="estAdmin">
					<div class="col-md-5 col-md-offset-1">
						<div class="list-group">
							<a class="list-group-item" href='<s:url action="administration_execute"/>'>
								<div class="media">
								  <div class="media-left" style="float:left;margin-right:10px;">
								    <h2><span class="glyphicon glyphicon-wrench"></span></h2>
								  </div>
								  <div class="media-body">
								    <h3 class="media-heading">ADMINISTRATION</h3>
								    	You can manage this application.
								  </div>
								</div>
							</a>
						</div>
					</div>
				</s:if>
				<div class="col-md-5 col-md-offset-1">
					<div class="list-group">
						<a class="list-group-item" href='<s:url action="connexion_deconnexion"/>'>
							<div class="media">
							  <div class="media-left" style="float:left;margin-right:10px;">
							    <h2><span class="glyphicon glyphicon-off"></span></h2>
							  </div>
							  <div class="media-body">
							    <h3 class="media-heading">LOG OFF</h3>
							    	You can log out.
							  </div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</s:if>
<s:else>
	<s:include value="/JSP/layout/authentification.jsp" />
</s:else>

<s:include value="/JSP/layout/footer.jsp" />