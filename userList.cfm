<!DOCTYPE html>
<html>
<head>
	<title>Site</title>

	<link rel="stylesheet" type="text/css" href="css/site.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
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

	<cfquery name="users" datasource="#request.dsn#" username="#request.username#" password="#request.password#">
		select * from users;
	</cfquery>
	
	<div class="content">
		
		<p>You can change first and second names without password.<br>
		But to change username or password, it must be required
		</p><br>

		<table class="table table-bordered">
			<thead>
				<th>Id</th>
				<th>Username</th>
				<th>First Name</th>
				<th>Second Name</th>
				<th>Password</th>
				<th></th>
			</thead>
			<tbody>
				<cfloop query="users">
					<cfoutput>
						<tr>
							<form class="validated-form" action="updateUser.cfm" method="post">
								<td>#users.id#</td>
								<td style="display: none"><input type="hidden" name="id_user" value="#users.id#">#users.id#</td>
								<td>#users.username#</td>
								<td style="display: none">
									<input type="text" name="username" class="form-control" value="#users.username#">
								</td>
								<td>#users.f_name#</td>
								<td style="display: none">
									<input type="text" name="f_name" class="form-control" value="#users.f_name#">
								</td>
								<td>#users.s_name#</td>
								<td style="display: none">
									<input type="text" name="s_name" class="form-control" value="#users.s_name#">
								</td>
								<td>--------</td>
								<td style="display: none">
									<input type="password" name="curr_password" class="form-control pure" placeholder="Current password"><br>
									<input type="password" name="new_password" class="form-control password pure" placeholder="New password"><br>
									<input type="password" name="password" class="form-control repeat-password pure" placeholder="Repeat password">
								</td>
								<td><button type="button" class="btn btn-primary editUser">Edit</button></td>
								<td style="display: none">
									<input type="submit" class="btn btn-info" name="updateUser" value = "Save"><br><br>
									<button type="button" class="btn btn-danger cancel">Cancel</button>
								</td>
							</form>
						</tr>
					</cfoutput>
				</cfloop>
			</tbody>
		</table>

		<cfif isDefined("url.result")>
		
		<!-- SWITCH CONSTRUCTION -->
			<cfswitch expression="#url.result#">
				
				<cfcase value="0">
					<cfset mes = "Success. First Name and Second Name are updated! (To update username enter the current password)">
				</cfcase>

				<cfcase value="1">
					<cfset mes = "Optional fields are updated, but the password is wrong!">
				</cfcase>

				<cfcase value="2">
					<cfset mes = "Success!">
				</cfcase>

				<cfcase value="3">
					<cfset mes = "Optional fields and username are updated!">
				</cfcase>
			</cfswitch>

			<cfoutput>#mes#</cfoutput>

		</cfif>
	</div>

	<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script src="js/site.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/validate.js"></script>
	<script src="js/userList.js" type="text/javascript"></script>
</body>
</html>