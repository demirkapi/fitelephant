<cfcomponent output="false" displayname="fitElephantApp" hint="fitElephant application.">
 
 	<!--- Set up the application. --->
	<cfset this.name = "fitElephant" />
	<cfset this.applicationTimeout = CreateTimeSpan( 0, 0, 1, 0 ) />
	<cfset this.sessiontimeout = CreateTimeSpan(0,0,10,0)> 
	<cfset this.sessionManagement = true />
	<cfset this.loginstorage = "Session">
	<!--- ORM has been temporarly disabled 
	<cfset this.ormenabled = "true"> 
	<cfset this.datasource = "fit">     
	--->
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
        
		<cfscript> 
			Application.availableResources = 0; 
			Application.counter = 1; 
			Application.sessions = 0; 
		</cfscript> 
        
        <!--- ColdCourse Config --->
        <cfset application.coldcourse = createObject("component","model.Coldcourse").init("/config/coldcourse.config.cfm")>
        
        <!--- Utility CFC --->
        <cfset application.u = createObject("component","model.util").init()>

		<!--- DB test has been temporarily disabled.
		<cftry> 
        	<!--- Test whether the DB that this application uses is accessible by selecting some data. ---> 
			<cfquery name="testDB" dataSource="cfdocexamples" maxrows="2"> 
            	SELECT Emp_ID FROM employee 
			</cfquery> 
			<!--- If we get database error, report it to the user, log the error information, and do not start the application. ---> 
			<cfcatch type="database"> 
				The database has not been configured.
				<cflog 	file="#this.Name#" type="error" 
                		text="cfdocexamples DB not available. message: #cfcatch.message#  
							Detail: #cfcatch.detail# Native Error: #cfcatch.NativeErrorCode#"> 
				<cfreturn false> 
			</cfcatch> 
		</cftry> 
        --->
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
        
		<cfscript> 
			session.started = now(); 
		</cfscript> 
        
		<cflock timeout="5" throwontimeout="No" type="EXCLUSIVE" scope="SESSION"> 
			<cfset Application.sessions = Application.sessions + 1> 
		</cflock> 
        
        <cflog file="#this.name#" type="Information" text="Session: #Session.sessionid# started."> 
 
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
        <!--- Utility CFC --->
        <cfset application.u = createObject("component","model.util")>
                
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
        
		<cflog file="#this.name#" type="Information" text="Session: #arguments.SessionScope.sessionid# ended."> 
 
		<cfreturn />
	</cffunction>
 
 	<cffunction name="OnApplicationEnd" access="public" returntype="void" output="false" 
    			hint="Fires when the application is terminated.">
 
		<!--- Define arguments. --->
		<cfargument name="ApplicationScope" type="struct"  required="false"	default="#StructNew()#" />
        
		<cflog file="#this.name#" type="Information" text="Application #ApplicationScope.applicationname# Ended">
 
		<cfreturn />
	</cffunction>
 
 <!--- 	
 	<cffunction name="OnError" access="public" returntype="void" output="true" 
    			hint="Fires when an exception occures that is not caught by a try/catch.">
 
		<!--- Define arguments. --->
		<cfargument name="Exception" type="any" required="true" /> 
		<cfargument	name="EventName" type="string" required="false" default="" />
		
		<!--- Log all errors in an application-specific log file. ---> 
		<cflog file="#this.name#" type="error" text="Event Name: #Eventname#" > 
		<cflog file="#this.name#" type="error" text="Message: #exception.message#"> 
		
		<!--- Some exceptions, including server-side validation errors, do not generate a rootcause structure. ---> 
		<cfif isdefined("exception.rootcause")> 
			<cflog file="#this.name#" type="error" text="Root Cause Message: #exception.rootcause.message#"> 
		</cfif>  
		
		<!--- Display an error message if there is a page context. ---> 
		<cfif NOT (Arguments.EventName IS onSessionEnd) OR (Arguments.EventName IS onApplicationEnd)> 
			<cfoutput> 
            <div style="width:700px; padding:50px;">
				<h2>An unexpected error occurred.</h2> 
				<p>Please provide the following information to technical support:</p> 
            	
                <!--- Save error details into a parameter --->
                <cfsavecontent variable="errorMessage">  
					<p>
                    <b>An error occurred:</b> http://#cgi.server_name##cgi.script_name#?#cgi.query_string#
                    <br />
					<b>Time:</b> #dateFormat(now(), "short")# #timeFormat(now(), "short")#
                    <br />
					<b>Error Event:</b> #EventName#
                    <br />
					<b>Error details:</b>
                    <br /> 
                    <cfdump var="#exception#">
					</p>
    	        </cfsavecontent>  
            
			<!--- Show error details only development mode --->
			<cfif application.settings.mode CONTAINS 'dev' OR (IsDefined('url.debug') AND url.debug EQ application.settings.reloadkey)>
            	#errorMessage#
			</cfif>			            
			</div>
			</cfoutput> 
            
            <cfmail from="#application.settings.emailsender#" to="#application.settings.emailadmin#" 
            		bcc="#application.settings.emailbcc#" 
            		subject="Error: #Dateformat(Now(),'short')# - http://#cgi.server_name##cgi.script_name#?#cgi.query_string#" 
                    charset="utf-8" type="html">
				#errorMessage#
            </cfmail> 
		</cfif> 
		<cfreturn />
	</cffunction>
	--->
</cfcomponent>