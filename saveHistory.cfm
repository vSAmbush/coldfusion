<cfif cgi.REQUEST_METHOD is "post">
	<cfif structKeyExists(form, 'saveHistory')>

		<cfquery name="updateMistake" datasource="#request.dsn#" username="#request.username#" password="#request.password#">
			update mistakes set id_state = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.state#">
				where id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.saveHistory#">;
		</cfquery>
		
		<cfquery name="saveStory" datasource="#request.dsn#" username="#request.username#" password="#request.password#" result="res">
			insert into stories (updated_at, comment, id_act, id_user) values
				(
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#DateFormat(Now(), "yyyy-mm-dd")# #TimeFormat(Now(), "HH:nn:ss")#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#form.comment#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#form.state#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#Session.user.id#">
				);
		</cfquery>

		<cfquery name="saveMistakeStory" datasource="#request.dsn#" username="#request.username#" password="#request.password#">
			insert into mistake_stories (id_mistake, id_story) values
				(
					<cfqueryparam cfsqltype="cf_sql_integer" value="#form.saveHistory#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#res.GENERATEDKEY#">
				);
		</cfquery>

		<cflocation url="/cf_test/site.cfm?result=Success" addtoken="false">

	<cfelse>
		<cflocation url="/cf_test/site.cfm?result=Error" addtoken="false">
	</cfif> 
</cfif>