<cfparam name="event" default="home">
<cfoutput>
<div class="well sidebar-nav">
	<ul class="nav nav-list">
    	<li <cfif cgi.path_info CONTAINS 'home'>class="active"</cfif>><a href="/"><i class="icon-home"></i> Anasayfa</a></li>
		<li class="nav-header"><i class="icon-user"></i> Profil</li>
		<li <cfif cgi.path_info CONTAINS 'userinfo'>class="active"</cfif>><a href="#application.u.cl('userinfo')#"><i class="icon-edit"></i> Bilgi Girişi</a></li>
        <li <cfif cgi.path_info CONTAINS 'photos'>class="active"</cfif>><a href="#application.u.cl('photos')#"><i class="icon-edit"></i> Fotoğraflar</a></li>
		<li <cfif cgi.path_info CONTAINS 'settings'>class="active"</cfif>> <a href="#application.u.cl('settings')#"><i class="icon-cog"></i> Ayarlar</a></li>
                  		
    	<li class="nav-header"><i class="icon-heart"></i> fitElephant</li>
        <li <cfif cgi.path_info CONTAINS 'healthcheck'>class="active"</cfif>><a href="#application.u.cl('healthcheck')#"><i class=" icon-ok-circle"></i> Sağlıklı mıyız?</a></li>
        <li <cfif cgi.path_info CONTAINS 'success'>class="active"</cfif>><a href="#application.u.cl('success')#"><i class="icon-thumbs-up"></i> Başarı Hikayeleri</a></li>	
    	<li <cfif cgi.path_info CONTAINS 'blog'>class="active"</cfif>><a href="#application.u.cl('blog')#"><i class="icon-star-empty"></i> Blog</a></li> 
    	<li <cfif cgi.path_info CONTAINS 'competiton'>class="active"</cfif>><a href="#application.u.cl('competition')#"><i class="icon-signal"></i> Yarışmalar</a></li>
		<li <cfif cgi.path_info CONTAINS 'faq'>class="active"</cfif>><a href="#application.u.cl('faq')#"><i class="icon-eye-open"></i> FAQ</a></li>                    
		<li <cfif cgi.path_info CONTAINS 'help'>class="active"</cfif>><a href="#application.u.cl('help')#"><i class="icon-question-sign"></i> Yardım</a></li>                    
	</ul>
</div>
</cfoutput>