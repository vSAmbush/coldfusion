<cfapplication name="user" 
sessionmanagement="Yes" 
sessiontimeout=#CreateTimeSpan(0, 0, 45, 0)#>

<cfset request.dsn = "cftest">
<cfset request.username = "root">
<cfset request.password = "root">

<!-- In theese conditions might be better to use controller and compare it's name -->
<cfif isDefined("Session.user") and compareNoCase(cgi.SCRIPT_NAME, '/cf_test/auth.cfm') eq 0>
	<cflocation url="/cf_test/site.cfm" addtoken="false">
</cfif>

<cfif !isDefined("Session.user") and compareNoCase(cgi.SCRIPT_NAME, '/cf_test/doAuth.cfm') neq 0
	and compareNoCase(cgi.SCRIPT_NAME, '/cf_test/auth.cfm') neq 0>
	<cflocation url="/cf_test/auth.cfm" addtoken="false">
</cfif>