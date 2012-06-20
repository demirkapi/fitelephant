<!--- header template --->
<cfinclude template="#application.fit.dir#templates/#application.settings.template#/_header.cfm">

<cfparam name="event" default="home">

<cfswitch expression="#event#">
	<cfcase value="home,anasayfa">
    	<cfinclude template="#application.fit.dir#templates/#application.settings.template#/home.cfm">
    </cfcase>
    <cfcase value="aboutus,hakkimizda">
    	<cfinclude template="#application.fit.dir#templates/#application.settings.template#/aboutus.cfm">
    </cfcase>
    <cfcase value="contact,iletisim">
    	<cfinclude template="#application.fit.dir#templates/#application.settings.template#/contact.cfm">
    </cfcase>
    <cfcase value="profile,profil">
    	<cfinclude template="#application.fit.dir#templates/#application.settings.template#/profile.cfm">
    </cfcase>
	<cfcase value="why,neden">
    	<cfinclude template="#application.fit.dir#templates/#application.settings.template#/why.cfm">
    </cfcase>
    <cfcase value="healthcheck">
    	<cfinclude template="#application.fit.dir#templates/#application.settings.template#/healthcheck.cfm">
    </cfcase>
    <cfdefaultcase>
    	<cfinclude template="#application.fit.dir#templates/#application.settings.template#/home.cfm">
    </cfdefaultcase>
</cfswitch>



<!--- footer template --->
<cfinclude template="#application.fit.dir#templates/#application.settings.template#/_footer.cfm">
