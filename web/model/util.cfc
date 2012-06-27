<cfcomponent name="util" hint="Utility Functions" output="no">
	<cffunction name="init" access="public" output="no" returntype="util">
    	<cfargument name="dsn" type="string" required="no" default="fit" hint="DataSourceName">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>

	<cffunction name="cl" access="public" returntype="string">
		<cfargument name="eventName" type="string" required="yes">
		<cfparam name="isSES" default="#application.settings.sesbased#" />
		<cfif isSES>
			<cfset theLink = "#arguments.eventName#/">
		<cfelse>
			<cfset theLink = "/index.cfm/#arguments.eventName#">
		</cfif>
		<cfreturn theLink>
	</cffunction>
</cfcomponent>