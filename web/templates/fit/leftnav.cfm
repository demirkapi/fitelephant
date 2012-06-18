<cfparam name="event" default="home">
<cfoutput>
<div class="well sidebar-nav">
	<ul class="nav nav-list">
    	<li <cfif event EQ 'home'>class="active"</cfif>><a href="/?event=home"><i class="icon-home"></i> Anasayfa</a></li>
		<li class="nav-header"><i class="icon-user"></i> Profil</li>
		<li <cfif event EQ 'userinfo'>class="active"</cfif>><a href="/?event=userinfo"><i class="icon-edit"></i> Bilgi Girişi</a></li>
        <li <cfif event EQ 'photos'>class="active"</cfif>><a href="/?event=photos"><i class="icon-edit"></i> Fotoğraflar</a></li>
		<li <cfif event EQ 'settings'>class="active"</cfif>> <a href="/?event=settings"><i class="icon-cog"></i> Ayarlar</a></li>
                  		
    	<li class="nav-header"><i class="icon-heart"></i> fitElephant</li>
        <li <cfif event EQ 'healthcheck'>class="active"</cfif>><a href="/?event=healthcheck"><i class=" icon-ok-circle"></i> Sağlıklı mıyız?</a></li>
        <li <cfif event EQ 'success'>class="active"</cfif>><a href="/?event=success"><i class="icon-thumbs-up"></i> Başarı Hikayeleri</a></li>	
    	<li <cfif event EQ 'blog'>class="active"</cfif>><a href="/?event=blog"><i class="icon-star-empty"></i> Blog</a></li> 
    	<li <cfif event EQ 'competiton'>class="active"</cfif>><a href="/?event=competiton"><i class="icon-signal"></i> Yarışmalar</a></li>
		<li <cfif event EQ 'faq'>class="active"</cfif>><a href="/?event=faq"><i class="icon-eye-open"></i> FAQ</a></li>                    
		<li <cfif event EQ 'help'>class="active"</cfif>><a href="/?event=help"><i class="icon-question-sign"></i> Yardım</a></li>                    
	</ul>
</div>
</cfoutput>