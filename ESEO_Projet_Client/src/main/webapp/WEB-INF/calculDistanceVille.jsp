
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calcul Distance</title>
</head>
<body>

 	<%@include file="menu.jsp" %>

	<select id="cities-dropdown-start" name="cities-start">
	</select>

	<select id="cities-dropdown-end" name="cities-end">
	</select>
	
	<button onclick="calculateDistance()"> Calculer
	</button>
	
	<div>
		<p id="distance-result">  </p> 
	</div>


	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			
			let dropdownStart = $('#cities-dropdown-start');
			let dropdownEnd = $('#cities-dropdown-end');
			dropdownStart.empty();
			dropdownStart.append('<option selected="true" disabled>Choisir une ville</option>');
			dropdownStart.prop('selectedIndex', 0);
			dropdownEnd.empty();
			dropdownEnd.append('<option selected="true" disabled>Choisir une ville</option>');
			dropdownEnd.prop('selectedIndex', 0);
			$.ajax({
		          url: 'http://localhost:8181/listeVille',
		          type: 'GET',
		          dataType: 'json',
		          success: function(data) { 
		     		 $.each(data, function(key, entry) {
		     			 dropdownStart.append($('<option></option>').attr('value',
		     			 entry.codeCommune).attr('longitude',entry.longitude).attr('latitude',entry.latitude).text(entry.nomCommune));
		     			 dropdownEnd.append($('<option></option>').attr('value',
		     			 entry.codeCommune).attr('longitude',entry.longitude).attr('latitude',entry.latitude).text(entry.nomCommune));
		     			 })
		          },
		          error: function() { alert('boo!'); },
		     });
			

		});
		
		
		function calculateDistance(){

			var longitudeStart = $('#cities-dropdown-start option:selected').attr('longitude');
			var latitudeStart = $('#cities-dropdown-start option:selected').attr('latitude');
			var longitudeEnd = $('#cities-dropdown-end option:selected').attr('longitude');
			var latitudeEnd = $('#cities-dropdown-end option:selected').attr('latitude');
			
			
			var distanceVille = Math.round(distance(latitudeStart, longitudeStart, latitudeEnd, longitudeEnd,"K"));
			$('#distance-result').text('La distance entre '+$('#cities-dropdown-start option:selected').text() 
					+ ' et ' + $('#cities-dropdown-end option:selected').text() +  ' est de ' + distanceVille +' km' );
		
		}
		
		function distance(lat1, lon1, lat2, lon2, unit) {
			if ((lat1 == lat2) && (lon1 == lon2)) {
				return 0;
			}
			else {
				var radlat1 = Math.PI * lat1/180;
				var radlat2 = Math.PI * lat2/180;
				var theta = lon1-lon2;
				var radtheta = Math.PI * theta/180;
				var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
				if (dist > 1) {
					dist = 1;
				}
				dist = Math.acos(dist);
				dist = dist * 180/Math.PI;
				dist = dist * 60 * 1.1515;
				if (unit=="K") { dist = dist * 1.609344 }
				if (unit=="N") { dist = dist * 0.8684 }
				return dist;
			}
		}
		
	</script>

</body>
</html>