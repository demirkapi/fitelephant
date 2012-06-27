<cfcomponent>
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