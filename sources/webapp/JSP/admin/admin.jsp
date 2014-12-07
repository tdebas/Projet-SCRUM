<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
	
<s:include value="/JSP/layout/header.jsp" />

<s:if test="userEstConnecte & estAdmin">
<div class="row">
	<s:include value="/JSP/layout/leftMenu.jsp" />
		<div class="col-md-10 content">
			<h2>Administration</h2>
		<div class="row">
			<div class="col-md-4 col-md-offset-1">
				<div class="list-group">
					<a class="list-group-item" href='<s:url action="administration_executeAdd"/>'>
						<div class="media">
						  <div class="media-left" style="float:left;margin-right:10px;">
						    <h2><span class="glyphicon glyphicon-plus"></span></h2>
						  </div>
						  <div class="media-body">
						    <h3 class="media-heading">ADD</h3>
						    	You can add a new student in classroom.
						  </div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-md-4 col-md-offset-1">
				<div class="list-group">
					<a class="list-group-item" href='<s:url action="administration_executeUpdate"/>'>
						<div class="media">
						  <div class="media-left" style="float:left;margin-right:10px;">
						    <h2><span class="glyphicon glyphicon-pencil"></span></h2>
						  </div>
						  <div class="media-body">
						    <h3 class="media-heading">UPDATE</h3>
						    	You can change a student or add a picture.
						  </div>
						</div>
					</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-1">
				<div class="list-group">
					<a class="list-group-item" href='<s:url action="administration_executeDelete"/>'>
						<div class="media">
						  <div class="media-left" style="float:left;margin-right:10px;">
						    <h2><span class="glyphicon glyphicon-remove"></span></h2>
						  </div>
						  <div class="media-body">
						    <h3 class="media-heading">REMOVE</h3>
						    	You can delete a student with all pictures.
						  </div>
						</div>
					</a>
				</div>
			</div>
			<div class="col-md-4 col-md-offset-1">
				<div class="list-group">
					<a class="list-group-item" href='<s:url action="administration_executeRole"/>'>
						<div class="media">
						  <div class="media-left" style="float:left;margin-right:10px;">
						    <h2><span class="glyphicon glyphicon-cog"></span></h2>
						  </div>
						  <div class="media-body">
						    <h3 class="media-heading">CHANGING ROLES</h3>
						    	You can grader student for the application.
						  </div>
						</div>
					</a>
				</div>
			</div>
		</div>
			<br/><br/>
			<s:actionmessage cssStyle="list-style-type:none;font-size:18px;color:#428bca;"/>
		</div>
</div>
</s:if>
<s:else>
	<s:include value="/JSP/layout/authentification.jsp" />
</s:else>

<s:include value="/JSP/layout/footer.jsp" />