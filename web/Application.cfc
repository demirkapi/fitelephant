<cfcomponent output="false" displayname="fitElephantApp" hint="fitElephant application.">
 
 	<!--- Set up the application. --->
	<cfset this.name = "fitElephant" />
	<cfset this.applicationTimeout = CreateTimeSpan( 0, 0, 1, 0 ) />
	<cfset this.sessionManagement = true />
	<cfset this.setClientCookies = false />
    <cfset this.mappings["/com"] = "../com">
 
 	<!--- Define the page request properties. --->
	<cfsetting requesttimeout="999" showdebugoutput="false" enablecfoutputonly="false" />
  
	<cffunction name="OnApplicationStart" access="public" returntype="boolean" output="false" 
    			hint="Fires when the application is first created.">
 
		<!--- Set env. parameters --->
		<cfset application.fit.basedir = ExpandPath('/')>
   		<cfset application.fit.dir = right(getdirectoryfrompath(getcurrenttemplatepath()),len(getdirectoryfrompath(getcurrenttemplatepath()))-len(expandpath("/"))+1)>
		<cfset application.fit.tz = CreateObject("java", "java.util.TimeZone").getDefault()>
        
 		<cfreturn true />
	</cffunction>
 
	<cffunction name="OnSessionStart" access="public" returntype="void" output="false" 
    			hint="Fires when the session is first created.">
 
 		<!--- Set default session parameters --->
		<cfparam name="session.user.isLoggedIn" default="false" />
        <cfparam name="session.user.userID" default="" />
        <cfparam name="session.user.username" default="Kullanıcı Adı" />
		<cfparam name="session.user.fname" default="" />
		<cfparam name="session.user.lname" default="" />        
		<cfparam name="session.user.geolat" default="" />
		<cfparam name="session.user.geolong" default="" />        
		<cfparam name="session.user.geotz" default="#application.fit.tz.getID()#" />                
        <cfparam name="session.user.lastlogin" default="" />
        <cfparam name="session.user.rights" default="0" />
        <cfparam name="session.user.rememberMe" type="numeric" default="0" />
        <cfparam name="session.user.loginAttempts" type="numeric" default="0" />
 
		<cfreturn />
	</cffunction>
 
	<cffunction name="OnRequestStart" access="public" returntype="boolean" output="false" 
    			hint="Fires at first part of page processing.">
 
 		<!--- Define arguments. --->
		<cfargument name="TargetPage" type="string" required="true" />

 		<!--- Load Application Settings --->
 		<cfif NOT isDefined("application.settings") OR isDefined("url.reinit")>
			<cfset iniFile = expandPath("./config/settings.ini.cfm")>
			<cfset sections = getProfileSections(iniFile)>
			<cfset data = structNew()>
			<cfif structKeyExists(sections, "default")>
				<cfloop index="key" list="#sections.default#">
					<cfset data[key] = trim(getProfileString(iniFile, "default", key))>
				</cfloop>
				<cfset application.settings = data>
			<cfelse>
				<cfthrow message="Ini file has a missing default section!">
			</cfif>
		</cfif>
        
        <cfparam name="event" default="home">
                
		<cfreturn true />
	</cffunction>
 
	<cffunction name="OnRequest" access="public" returntype="void" output="true" 
    			hint="Fires after pre page processing is complete.">
 
		<!--- Define arguments. --->
		<cfargument name="TargetPage" type="string" required="true" />
 
		<!--- Include the requested page. --->
		<cfinclude template="#ARGUMENTS.TargetPage#" />
 
		<cfreturn />
	</cffunction>
 
 	<cffunction name="OnRequestEnd" access="public" returntype="void" output="true" 
    			hint="Fires after the page processing is complete.">
 
		<cfreturn />
	</cffunction>
  
	<cffunction name="OnSessionEnd" access="public" returntype="void" output="false" 
    			hint="Fires when the session is terminated.">
 
		<!--- Define arguments. --->
		<cfargument name="SessionScope" type="struct" required="true" />
 
		<cfargument name="ApplicationScope" type="struct" required="false" default="#StructNew()#" 	/>
 
		<cfreturn />
	</cffunction>
 
 	<cffunction name="OnApplicationEnd" access="public" returntype="void" output="false" 
    			hint="Fires when the application is terminated.">
 
		<!--- Define arguments. --->
		<cfargument name="ApplicationScope" type="struct"  required="false"	default="#StructNew()#" />
 
		<cfreturn />
	</cffunction>
 
 	<!--- temporary disabled
 	<cffunction name="OnError" access="public" returntype="void" output="true" 
    			hint="Fires when an exception occures that is not caught by a try/catch.">
 
		<!--- Define arguments. --->
		<cfargument name="Exception" type="any" required="true" /> 
		<cfargument	name="EventName" type="string" required="false" default="" />
 
		<cfreturn />
	</cffunction>
	 --->
</cfcomponent>