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

	<div class="content">
		<cfquery name="mistakes" datasource="#request.dsn#" username="#request.username#" password="#request.password#">
			SELECT mistakes.id, created_at, short_desc, long_desc, f_name, s_name, state, urgency, criticality from mistakes 
			join users on mistakes.id_user = users.id join states on mistakes.id_state = states.id
			join urgencies on mistakes.id_urgency = urgencies.id join criticalities on mistakes.id_criticality = criticalities.id;
		</cfquery>

		<!-- Date returns as datetime. Don't shows a time, when use mmmm (Strange) -->
		<!-- Cftable is useful thing, but don't customize
		<cftable query="mistakes">
			<cfcol header="date" text="#DateFormat(created_at, "D/mm/yyyy")# #TimeFormat(created_at, "HH:nn:ss")#">
		</cftable>
		-->
			
		<cfquery name="states" datasource="cftest" username="root" password="root">
			select state from states;
		</cfquery>

		<cfif isDefined("url.result")>
			<cfoutput>#url.result#</cfoutput>
		</cfif>
		
		<table class="table table-bordered">
			<thead>
				<th>Date</th>
				<th>Short description</th>
				<th>Long description</th>
				<th>First Name</th>
				<th>Second Name</th>
				<th>State</th>
				<th>Urgency</th>
				<th>Criticality</th>
				<th>History</th>
			</thead>
			<tbody>
				<cfloop query="mistakes">

					<cfquery name="stories" datasource="#request.dsn#" username="#request.username#" password="#request.password#">
						select updated_at, comment, act, f_name, s_name from mistake_stories join stories on id_story = stories.id join acts on 
						acts.id = id_act join users on id_user = users.id where id_mistake = <cfqueryparam cfsqltype="cf_sql_integer" 
						value="#mistakes.id#">
					</cfquery>

					<tr>
						<cfoutput>
							<td>#DateFormat(mistakes.created_at, "dd/mm/yyyy")# #TimeFormat(mistakes.created_at, "HH:nn:ss")#</td>
							<td>#mistakes.short_desc#</td>
							<td>#mistakes.long_desc#</td>
							<td>#mistakes.f_name#</td>
							<td>#mistakes.s_name#</td>
							<td class="state">#mistakes.state#</td>
							<td>#mistakes.urgency#</td>
							<td>#mistakes.criticality#</td>
							<td>
								<button class="btn btn-primary edit" type="button" name="id_mistake">
									Edit
								</button>
							</td>
						</cfoutput>
					</tr>
					<tr class="history" style="display: none">
						<td colspan="<cfoutput>#listLen(mistakes.columnList)#</cfoutput>">
							<cfoutput>
								<table class="table table-bordered">
									<thead>
										<th>Time</th>
										<th>Comment</th>
										<th>State</th>
										<th>User</th>
									</thead>
									<tbody>

										<cfloop query="stories">
											<tr>
												<td>#DateFormat(stories.updated_at, "dd/mm/yyyy")# #TimeFormat(stories.updated_at, "HH:nn:ss")#</td>
												<td>#stories.comment#</td>
												<td class="act">#stories.act#</td>
												<td>#stories.f_name & ' ' & stories.s_name#</td>
											</tr>
										</cfloop>

										<tr>
											<form class="saveHistory" action="saveHistory.cfm" method="post">
												<td>#DateFormat(Now(), "dd/mm/yyyy")# #TimeFormat(Now(), "HH:nn:ss")#</td>
												<td><input class="form-control" type="text" name="comment"></td>
												<td>
													<select class="form-control states" name="state">
														<option value="" disabled selected>State</option>
														<cfloop query="states">
															<option value="#states.currentRow#">#states.state#</option>
														</cfloop>
													</select>
												</td>
												<td>#mistakes.f_name & ' ' & mistakes.s_name#</td>
												<td>
													<button class="btn btn-info" type="submit" name="saveHistory" value="#mistakes.id#">Save</button>
												</td>
											</form>
										</tr>
									</tbody>
								</table>
							</cfoutput>
						</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
	</div>

	<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script src="js/site.js" type="text/javascript"></script>
</body>
</html>