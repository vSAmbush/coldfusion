<cfif cgi.REQUEST_METHOD is "post">
	
	<cfif structKeyExists(form, "updateUser")>
		 
		<cfquery name="updateOptional" datasource="#request.dsn#" username="#request.username#" password="#request.password#">

			update users set 
				f_name = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.f_name#">,
				s_name = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.s_name#">
				where id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id_user#">;
		</cfquery>

		<cfif form.curr_password neq ''>
			<cfquery name="check" datasource="#request.dsn#" username="#request.username#" password="#request.password#">

				select password_hash from users where id=<cfqueryparam cfsqltype="cf_sql_integer" value="#form.id_user#">
			</cfquery>
			
			<cfif hash(form.curr_password, "SHA") eq check.password_hash>
				
				<cfif form.new_password eq '' || form.password eq ''>

					<cfquery name="update" datasource="#request.dsn#" username="#request.username#" password="#request.password#">
						update users set
							username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.username#">
						where id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id_user#">;
					</cfquery>
					<cfset result = 3>
				<cfelse>

					<cfquery name="update" datasource="#request.dsn#" username="#request.username#" password="#request.password#">
						update users set
							username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.username#">,
							password_hash = <cfqueryparam cfsqltype="cf_sql_varchar" value="#hash(form.password, "SHA")#">
						where id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id_user#">;
					</cfquery>
					<cfset result = 2>
				</cfif>
			<cfelse>
				<cfset result = 1>
			</cfif>
		<cfelse>
			<cfset result = 0>
		</cfif>

		<cflocation url="/cf_test/userList.cfm?result=#result#" addtoken="false">
	</cfif>
</cfif>