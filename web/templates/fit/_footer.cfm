    <footer>
		<p>
        <!--- CopyLeft - All Wrongs Reserved! --->
        <!--[if lte IE 8]><span style="filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=2); display: inline-block;"><![endif]-->
			<span style="-webkit-transform: rotate(180deg); -moz-transform: rotate(180deg); -o-transform: rotate(180deg); -khtml-transform: rotate(180deg); -ms-transform: rotate(180deg); transform: rotate(180deg); display: inline-block;">&copy;</span>
		<!--[if lte IE 8]></span><![endif]-->
         fitElephant 2012
         |
         &nbsp;&nbsp;&nbsp;<cfoutput>
         <a href="#application.u.cl('privacy')#"><i class="icon-briefcase"></i> Gizlilik</a>
         &nbsp;&nbsp;&nbsp;
         <a href="#application.u.cl('disclaimer')#"><i class="icon-exclamation-sign"></i> Yasal Notlar</a></cfoutput>
         </p>
	</footer>
</div>

<!--- Show debug info base on URL parameter --->
<cfif isDefined('url.debug') AND (url.debug EQ application.settings.reloadkey)>
	<cfdump var="#application#" label="Application Variables">
	<cfdump var="#session#" label="Session Variables">
	<cfdump var="#form#" label="Form Variables">
	<cfdump var="#cgi#" label="CGI Variables">
</cfif>

<!--- javaScript files --->
<!--- Placed at the end of the document so the pages load faster --->
<script src="includes/js/jquery.js"></script>
<script src="includes/js/bootstrap-transition.js"></script>
<script src="includes/js/bootstrap-alert.js"></script>
<script src="includes/js/bootstrap-modal.js"></script>
<script src="includes/js/bootstrap-dropdown.js"></script>
<script src="includes/js/bootstrap-scrollspy.js"></script>
<script src="includes/js/bootstrap-tab.js"></script>
<script src="includes/js/bootstrap-tooltip.js"></script>
<script src="includes/js/bootstrap-popover.js"></script>
<script src="includes/js/bootstrap-button.js"></script>
<script src="includes/js/bootstrap-collapse.js"></script>
<script src="includes/js/bootstrap-carousel.js"></script>
<script src="includes/js/bootstrap-typeahead.js"></script>

<!--- Google Analytics --->
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-3516158-29']);
  _gaq.push(['_setDomainName', 'fitelephant.com']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
</body>
</html>
