
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des villes</title>
</head>
<body>

	<%@include file="menu.jsp" %>

	<table id="table-cities">
		<tr>
			<th>codeCommune</th>
			<th>nomCommune</th>
			<th>codePostal</th>
			<th>libelle</th>
			<th>latitude</th>
			<th>longitude</th>
		</tr>
	</table>
	

	
	
	
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>

	
	<script>
	
	$(document).ready(function() {
		
		$.ajax({
	          url: 'http://localhost:8181/listeVille',
	          type: 'GET',
	          dataType: 'json',
	          success: function(data) { 
	     		 $.each(data, function(key, entry) {
	     			 
	     			 $('#table-cities').append('<tr class="table-line"> <td>'+ entry.codeCommune +'</td>  <td> <a href="http://localhost:8080/ESEO_Projet_Client/DetailVille?idVille='+entry.codeCommune+'">'+ entry.nomCommune +'</a></td>' 
	     			 +'<td>'+ entry.codePostal +'</td> <td>'+ entry.libelle +'</td>  <td>'+ entry.latitude +'</td> <td>'+ entry.longitude +'</td> </tr>');
	     		})
	     			
	          },
	          error: function() { alert('boo!'); },
	     });
		

	});
	
	
	</script>
	


</body>
</html>
