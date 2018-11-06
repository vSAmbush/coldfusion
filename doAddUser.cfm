<cfif cgi.REQUEST_METHOD is "post">
	<cfif structKeyExists(form, "submit_add_user")>

		<cfquery name="addUser" datasource="#request.dsn#" username="#request.username#" password="#request.password#">
			insert into users (username, f_name, s_name, password_hash) values 
				(
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.username#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.f_name#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.s_name#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#hash(form.password, "SHA")#">
				);
		</cfquery>

		<cflocation url="/cf_test/addUser.cfm?result=Success" addtoken="false">

	<cfelse>
		<cflocation url="/cf_test/addUser.cfm?result=Error" addtoken="false">
	</cfif>
</cfif>