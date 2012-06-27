<cfcomponent name="util" hint="Utility Functions" output="no">
	<cffunction name="init" access="public" output="no" returntype="util">
    	<cfargument name="dsn" type="string" required="no" default="fit" hint="DataSourceName">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>

	<cffunction name="cl" access="public" returntype="string">
		<cfargument name="eventName" type="string" required="yes">
		<cfset theLink = "/index.cfm/#arguments.eventName#">
		<cfreturn theLink>
	</cffunction>
</cfcomponent>