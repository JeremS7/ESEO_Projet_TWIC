
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail ville</title>
</head>
<body>

	<style>
body {
	font-family: Arial;
}

input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 100%;
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

div.container {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}
</style>

	<%@include file="menu.jsp" %>

	<div style="width: 50%; margin-left: 25%; margin-right: 25%; margin-top: 50px">

		<form method="post" action="DetailVille">
			<label for="codeCommune"> Code commune</label>
			<input type="text"  id="codeCommune" name="codeCommune" value=" ${ville.codeCommune } " /> 
			<label for="nomCommune"> Nom commune</label>
			<input type="text" id="nomCommune" name="nomCommune" value=" ${ville.nomCommune} " />
			<label for="codePostal"> Code postal</label>
		    <input type="text" id="codePostal" name="codePostal" value=" ${ville.codePostal } " /> 
		    <label for="libelle"> Libelle </label>
		    <input type="text" id="libelle" name="libelle" value=" ${ville.libelle } " /> 
		    <label for="latitude"> Latitude </label>
		    <input type="text" id="latitude" name="latitude" value=" ${ville.latitude } " /> 
		    <label for="longitude"> Longitude </label>
		    <input type="text" id="longitude" name="longitude" value=" ${ville.longitude } " /> 
		    <input type="submit" value="Modifier" />
		</form>
	</div>

</body>
</html>