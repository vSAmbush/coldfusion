<!DOCTYPE html>
<html>
<head>
	<title>New User</title>

	<link rel="stylesheet" type="text/css" href="css/site.css">
	<link rel="stylesheet" type="text/css" href="css/auth.css">
</head>
<body>
	<div class="menu_container">

		<button id="menu_btn" class="menu_btn"><span></span></button>
		<ul class="menu">
			<li><a class="menu-item" href="/cf_test/addMistake.cfm">Add new mistake</a></li>
			<li><a class="menu-item" href="/cf_test/site.cfm">List of mistakes</a></li>
			<li><a class="menu-item" href="/cf_test/addUser.cfm">New user</a></li>
			<li><a class="menu-item" href="/cf_test/userList.cfm">User list</a></li>
			<li><a class="menu-item" href="/cf_test/logout.cfm">Logout</a></li>
		</ul>
	</div>

	<div class="content">
		
		<h2>Add User</h2>
		
		<div class="form-container">
			<form class="validated-form" action="doAddUser.cfm" method="post">

				<input type="text" name="username" class="form-control control" placeholder="Username">
				
				<input type="text" name="f_name" class="form-control control" placeholder="First Name">

				<input type="text" name="s_name" class="form-control control" placeholder="Second Name">

				<input type="password" class="form-control control password" placeholder="Password">

				<input type="password" name="password" class="form-control control repeat-password" placeholder="Repeat password">

				<input name="submit_add_user" type="submit" class="submit_btn control" value="Add">
			</form>
		</div>

		<cfif isDefined("url.result")>
			<cfoutput>#url.result#</cfoutput>
		</cfif>
	</div>

	<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/validate.js"></script>
	<script src="js/site.js" type="text/javascript"></script>
</body>
</html>