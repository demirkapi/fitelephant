<!DOCTYPE html>
<html lang="en"><cfoutput>
<head>
	<meta charset="UTF-8">
	<title>fitElephant.com - Sağlıklı Yaşam Portalı</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="fitElephant.com - Sağlıklı Yaşam Portalınız">
	<meta name="author" content="CFTR">
	<base href="http://#CGI.HTTP_HOST#/" />
	<link href="/includes/css/bootstrap.css" rel="stylesheet">
	<link href="/includes/css/bootstrap-responsive.css" rel="stylesheet">

	<!--- Custom Template CSS --->    
   	<link href="/templates/#application.settings.template#/css/fit.css" rel="stylesheet">

	<!--- Le HTML5 shim, for IE6-8 support of HTML5 elements --->
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!--- fav and touch icons --->
	<link rel="shortcut icon" href="/includes/ico/favicon.ico">
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="/includes/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="/includes/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="/includes/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="/includes/ico/apple-touch-icon-57-precomposed.png">
</head>
<body>
<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container-fluid">
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</a>
			<a class="brand" href="/"><img src="/includes/img/fitlogo70.png" name="fitElephant" width="273" height="70" hspace="0" vspace="0" border="0"></a>
			<div class="btn-group pull-right">
				<a class="btn dropdown-toggle" data-toggle="dropdown" href="##">
				<i class="icon-user"></i> <cfoutput>#session.user.username#</cfoutput>
				<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a href="##">Profil</a></li>
					<li class="divider"></li>
					<li><a href="##">Çıkış</a></li>
				</ul>
			</div>
			<div class="nav-collapse pull-right">
				<ul class="nav nav-pills">
					<li <cfif cgi.path_info CONTAINS 'home'>class="active"</cfif>><a href="/"><i class="icon-home"></i> Anasayfa</a></li>
					<li <cfif cgi.path_info CONTAINS 'aboutus'>class="active"</cfif>><a href="#application.u.cl('aboutus')#"><i class="icon-globe"></i> Hakkımızda</a></li>
					<li <cfif cgi.path_info CONTAINS 'contact'>class="active"</cfif>><a href="#application.u.cl('contact')#"><i class="icon-envelope"></i> İletişim</a></li>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div>
</div>
</cfoutput>

<div class="container-fluid">