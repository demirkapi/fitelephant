<cfcomponent>
	<cffunction name="cl" access="public" returntype="string">
		<cfargument name="eventName" type="string" required="yes">
		<cfset theLink = "/index.cfm/#arguments.eventName#">
		<cfreturn theLink>
	</cffunction>
</cfcomponent>