<!-- CF SQL TYPES
	CF_SQL_BIGINT	CF_SQL_IDSTAMP		CF_SQL_REFCURSOR
	CF_SQL_BIT		CF_SQL_INTEGER		CF_SQL_SMALLINT
	CF_SQL_CHAR		CF_SQL_LONGVARCHAR	CF_SQL_TIME
	CF_SQL_DATE		CF_SQL_MONEY		CF_SQL_TIMESTAMP
	CF_SQL_DECIMAL	CF_SQL_MONEY4		CF_SQL_TINYINT
	CF_SQL_DOUBLE	CF_SQL_NUMERIC		CF_SQL_VARCHAR
	CF_SQL_FLOAT	CF_SQL_REAL
-->
<!-- CLEARING SESSION
		<cfset StructClear(Session)>
-->
<cffunction name="checkPassword">
	<cfargument name="password1" required="true">
	<cfargument name="check" required="true">
	<cfif hash(password1, "SHA") eq check.password_hash>
		<cfset Session.user = check>
		<cflocation url="/cf_test/site.cfm" addtoken="false">
	<cfelse>
		<cflocation url="/cf_test/auth.cfm?fail=true" addtoken="false">
	</cfif>
</cffunction>

<cfif cgi.REQUEST_METHOD is "post">
	<cfif structKeyExists(form, "username") and isDefined("form.password")>

		<cfquery name="check" datasource = "#request.dsn#" username = "#request.username#" password = "#request.password#">
			select * from users where username = <cfqueryparam cfsqltype = "cf_sql_varchar" value = "#form.username#">;
		</cfquery>
		
		<cfoutput>
			#checkPassword(form.password, check)#
		</cfoutput>
	</cfif>
</cfif>