<cfcomponent output="false" singleton="true">
	<!--- <cfproperty name="rewrite" default="getProfileString(expandpath('./config/settings.ini.cfc'),'default','rewrite')" /> --->

	<cffunction name="init" access="public" returntype="functions" output="false">
		<cfreturn this />
	</cffunction>

	<cffunction name="createLink" access="public" output="false" returntype="String" hint="URL Rewrite durumuna gšre link Ÿretir.">
		<cfargument name="rewrite" type="string" required="true" />
		<cfargument name="event" type="string" required="true" />
		<cfif arguments.rewrite>
		<cfset action = arguments.event & '/' />
		<cfelse>
		<cfset action = '?event=' & arguments.event />
		</cfif>
		<cfreturn action />
	</cffunction>
</cfcomponent>