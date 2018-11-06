<!DOCTYPE html>
<html>
<head>
	<title>Add Mistake</title>

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
		
		<h2>Add mistake</h2>
		
		<div class="form-container">
			<form class="validated-form" action="doAddMistake.cfm" method="post">
				
				<input type="text" name="short_desc" class="form-control control" placeholder="Short description">
				
				<p>Long description</p>
				<textarea name="long_desc" class="form-control control"></textarea>
				
				<!-- To save life cycle of mistake
				<select name="state" class="form-control control">
					<option value="" disabled selected>State</option>
					<option value="1">New</option>
					<option value="2">Opened</option>
					<option value="3">Decided</option>
					<option value="4">Closed</option>
				</select>
				-->

				<select name="urgency" class="form-control control">
					<option value="" disabled selected>Urgency</option>
					<option value="1">Very Urgent</option>
					<option value="2">Urgently</option>
					<option value="3">Do not rush</option>
					<option value="4">Not urgent</option>
				</select>

				<select name="criticality" class="form-control control">
					<option value="" disabled selected>Criticality</option>
					<option value="1">Emergency</option>
					<option value="2">Critical</option>
					<option value="3">Not critical</option>
					<option value="4">Change request</option>
				</select><br>

				<input name="submit_add_mistake" type="submit" class="submit_btn control" value="Add">
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