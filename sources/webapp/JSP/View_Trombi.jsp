<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:include value="/JSP/layout/header.jsp" />

<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<s:if test="userEstConnecte">
	<s:include value="/JSP/layout/leftMenu.jsp" />
	<div class="col-md-10 content">
		<h2>Trombinoscope</h2>  		
			<h4>Sorting method:</h4>
			<s:form theme="simple" cssClass="form-horizontal" name="trier" action="trombinoscope_tri" method="POST">
				<div class="row">
					<div class="col-md-11">
						<div class="input-group">
							<span class="input-group-addon">
	 							<input type="radio" name="tri" value="1">
							</span>
								<label class="form-control" >A to Z</label>
							<span class="input-group-addon">
	 							<input type="radio" name="tri" value="2">
							</span>
								<label class="form-control" >Z to A</label>
							<span class="input-group-addon">
	 							<input type="radio" name="tri" value="3">
							</span>
								<label class="form-control" >Male</label>
							<span class="input-group-addon">
	 							<input type="radio" name="tri" value="4">
							</span>
								<label class="form-control" >Female</label>
							<span class="input-group-addon">
	 							<input type="radio" name="tri" value="5">
							</span>
								<label class="form-control" >Alternate</label>
							<span class="input-group-addon">
	 							<input type="radio" name="tri" value="6">
							</span>
								<label class="form-control" >No alternate</label>
							<span class="input-group-addon">
	 							<input type="radio" name="tri" value="7">
							</span>
								<label class="form-control" >Note</label>
						</div> 
					</div>
					<div class="col-md-1">
						<a href="#" onclick="document.forms['trier'].submit();" class="btn btn-success"><span class="glyphicon glyphicon-search"></span></a>
					</div>
				</div>
				</s:form>  		
			<br/>
			<div class="row sortable">
				<s:iterator value="ListUtilisateur">
				<s:url action="utilisateur_profil" var="Utilisateur"><s:param name="idUser"><s:property value="idUtilisateur"/></s:param></s:url>
					  <div class="col-sm-6 col-md-3">
					    <div class="thumbnail">
					      <img src='${pageContext.request.contextPath}<s:property value="chemin"/>' class="img-rounded">
					      <div class="caption">
					        <h6><s:property value="nom"/> <s:property value="prenom"/></h6>
							
							<div class="basic" style="margin:auto;z-index:10" data-average=<s:property value="note"/> data-id=<s:property value="idUtilisateur"/>></div>					       
					       
					        <s:if test="sexe == 1">
					        	<p><a href="${Utilisateur}" style="margin-top:10px;" class="btn btn-primary">See profil</a></p>
					        </s:if>
					        <s:else>
					        	<p><a href="${Utilisateur}" style="margin-top:10px;" class="btn btn-warning">See profil</a></p>
					        </s:else>
					        
					      </div>
					    </div>
					  </div>
				</s:iterator>
			</div>
	</div>
</s:if>
<s:else>
	<s:include value="/JSP/layout/authentification.jsp" />
</s:else>

<s:include value="/JSP/layout/footer.jsp" />

<script type="text/javascript">
	$(document).ready(function(){
		// Début de la notation
		$(".basic").jRating({
			length:5,
			decimalLength:0,
		    onClick : function(element,rate) {
	         $.ajax({
	           type: "POST",
	           url: "/trombi/trombinoscope_vote",
	           data: {rate:rate, id: $(element).attr("data-id")},
	           success: function(){
	           }
	         });
		    }
	       });
	    // Fin de la notation
	
	    // Début du Drag ans Drop
		$(function() {
			 $(".sortable").sortable({
			    	tolerance:'pointer',
					forceHelperSize: true
			    });
		});
	    // Fin du Drag ans Drop
		
	  });
</script>