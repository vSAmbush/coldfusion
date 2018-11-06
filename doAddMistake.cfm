<cfif cgi.REQUEST_METHOD is "post">
	<cfif structKeyExists(form, "submit_add_mistake")>

		<cfquery name="addMistake" datasource="#request.dsn#" username="#request.username#" password="#request.password#">
			insert into mistakes (created_at, short_desc, long_desc, id_user, id_state, id_urgency, id_criticality) values 
				(
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#dateFormat(now(), "yyyy-mm-dd")# #timeFormat(now(), "HH:nn:ss")#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.short_desc#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.long_desc#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#Session.user.id#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="1">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#form.urgency#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#form.criticality#">
				);
		</cfquery>

		<cflocation url="/cf_test/addMistake.cfm?result=Success" addtoken="false">

	<cfelse>
		<cflocation url="/cf_test/addMistake.cfm?result=Error" addtoken="false">
	</cfif>
</cfif>