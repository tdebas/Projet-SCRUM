<div class="row">
			<div class="footer">
				<a>© Copyright - TEAM IT - Trombinoscope - 2014/2015</a>
			</div>
		</div>
	</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		
		if ($(location).attr('pathname').indexOf('connexion_execute') > -1)
			$('#home_menu').addClass('active');
		
		else if ($(location).attr('pathname').indexOf('utilisateur_execute.') > -1)
			$('#edit_menu').addClass('active'); 
		
		else if ($(location).attr('pathname').indexOf('trombinoscope_execute.') > -1)
			$('#trombi_menu').addClass('active'); 
		
		else if ($(location).attr('pathname').indexOf('trombinoscope_tri.') > -1)
			$('#trombi_menu').addClass('active'); 
	
		else if ($(location).attr('pathname').indexOf('administration_execute.') > -2)
			$('#admin_menu').addClass('active'); 
		
	});
	
	
</script>