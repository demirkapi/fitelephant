<!--- ColdCouse for SES --->
<cfset application.coldcourse.dispatch(cgi.path_info, cgi.script_name) />


<!--- header template --->
<cfinclude template="templates/#application.settings.template#/_header.cfm">

<cfparam name="event" default="#Rereplace(cgi.path_info,'/','ALL')#">
<cfset event = RereplaceNoCase(cgi.path_info,'/','','ALL')>

<cfswitch expression="#event#">
	<cfcase value="home,anasayfa">
    	<cfinclude template="templates/#application.settings.template#/home.cfm">
    </cfcase>
    <cfcase value="aboutus,hakkimizda">
    	<cfinclude template="templates/#application.settings.template#/aboutus.cfm">
    </cfcase>
    <cfcase value="contact,iletisim">
    	<cfinclude template="templates/#application.settings.template#/contact.cfm">
    </cfcase>
    <cfcase value="profile,profil">
    	<cfinclude template="templates/#application.settings.template#/profile.cfm">
    </cfcase>
	<cfcase value="why,neden">
    	<cfinclude template="templates/#application.settings.template#/why.cfm">
    </cfcase>
    <cfcase value="healthcheck">
    	<cfinclude template="templates/#application.settings.template#/healthcheck.cfm">
    </cfcase>
    <cfdefaultcase>
    	<cfinclude template="templates/#application.settings.template#/home.cfm">
    </cfdefaultcase>
</cfswitch>

<!--- footer template --->
<cfinclude template="templates/#application.settings.template#/_footer.cfm">
