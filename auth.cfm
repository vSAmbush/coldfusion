<!DOCTYPE html>
<html>
<head>
	<title>Auth ColdFusion</title>

	<link rel="stylesheet" type="text/css" href="css/auth.css">
</head>
<body>

	<!-- Query Datasource - name of datasoure, which had been written in server admin page -->
	<!--
	<cfset request.dsn = 'cftest'>
	<cfset request.user = 'root'>
	<cfset request.password = 'root'>

	<cfquery name="q" datasource = "#request.dsn#" username = "#request.user#" password = "#request.password#">
		select * from users;
	</cfquery>
	-->
	
	<!-- ColdFusion var_dump -->
	<!--
	<cfdump var="#q#"/>
	-->
	
	<div class="main">
		<!-- Using of cfform helps to validate input data from input fields (attributes are required, validate, message etc.) -->
		<!-- Stackoverflow advises do not using of cfform --> 
		<form class="validated-form" name="auth" action="doAuth.cfm" method="post">
			<div class="auth_container">
				<h2>Authentification</h2>

				<input name="username" type="text" class="form-control control" placeholder="username"/>

				<input name="password" type="password" class="form-control control" placeholder="password"/>

				<input name="submit_auth" type="submit" class="submit_btn control" value="Sign In">
			</div>

			<div class="hint">Login: "vovchai", password: "12345"</div>

			<!-- $_GET -->
			<cfif isDefined("url.fail")>
				<div class="error">
					Incorrect username or password
				</div>
			</cfif>
		</form>
	</div>

	<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/validate.js"></script>
</body>
</html>