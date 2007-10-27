<%@ Page language="C#"%>
<!--
Copyright 2002-2007 Corey Trager
Distributed under the terms of the GNU General Public License
-->
<!-- #include file = "inc.aspx" -->

<script runat="server">

///////////////////////////////////////////////////////////////////////
void Page_Load(Object sender, EventArgs e)
{

	Util.do_not_cache(Response);
}


</script>

<head>
<title id="titl" runat="server">BugTracker.NET - about</title>
<link rel="StyleSheet" href="btnet.css" type="text/css">
</head>
<body>

<p>&nbsp;<p>

<a style="font-size:12pt;" href=http://ifdefined.com/bugtrackernet.html>BugTracker.NET</a>

<p>
Version 2.5.8  October 26, 2007

<p>
<p style="font-size:8pt;">
Copyright 2002-2007 Corey Trager - ctrager@yahoo.com
<br>
Distributed under the terms of the <a target=_blank href="COPYING">GNU General Public License</a>
<br>
</p>

<p>View <a href="http://ifdefined.com/README.html">Documentation</a>
<p>Get help, make suggestions at the <a href="http://sourceforge.net/forum/forum.php?forum_id=226938">BugTracker.NET Support Forum</a>

<p>&nbsp;<p>

<div style='width: 500; background: orange; border: solid 1px blue; padding: 10px;'>
Donations encourage me and make my wife more tolerant of the time I spend on this, so, please consider donating any amount.  Thanks! - Corey
<br><br>

<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="image" src="https://www.paypal.com/en_US/i/btn/x-click-but04.gif" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
<img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
<input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----
">
</form>

</div>

<p>&nbsp;<p>

<b>BugTracker.NET also includes the following software:</b>
<p>
<li><a target=_blank href=http://www.bosrup.com/web/overlib/>overLIB 3.51</a> - Copyright Erik Bosrup 1998-2002  (the date chooser)
<li><a target=_blank href=http://www.codeproject.com/cs/internet/pop3client.asp>POP3Client.cs</a> - Bill Dean
<li><a target=_blank href=http://anmar.eu.org/projects/sharpmimetools//>SharpMailTools</a> (parsing MIME messages) - Copyright Angel Marin 2003-2007
<li><a target=_blank href=http://logging.apache.org/log4net/>log4net</a> (logging library used by SharpMailTools) - From Apache Software Foundation
<li><a target=_blank href=http://www.fckeditor.net//>FCKEditor</a> (HTML text editor) - Frederico Caldeira Knabben

<p>
<b>Thanks to the following for their contributions:</b>
<p>
<li>Maty Siman at <a href=http://www.checkmarx.com>www.checkmarx.com</a> for security-related contributions.
<li>Michael Wilson for both the ideas AND the code for several important features.   He's really the second developer on this project.
<li>Martin Richter for code to handle international date formating.
<li>Tom Sella for improvements related to using terms like "issue" instead of "bug".
<li>Eugene Kalinin for constructive critical feedback in the early days.
<li>Andrew Lovetski for so much bug reporting.
<li>Jason Taylor for converting urls and email addresses in comments to hyperlinks.
<li>Sylvain Ross for performance improvements to btnet_service.exe, btnet_console.exe
<li>Jochen Jonckheere for many important bug reports, the clever translate.aspx sample, and intergrating FCKEditor.
<li>Andreas Michael for reporting bugs and for encouragement.
<li>Andrew McKay at <a href=http://www.kazmax.co.uk>www.kazmax.co.uk</a> for interesting ideas and encouragement.
<li>Kellee Gunderson at <a href=http://www.maxknowledge.com/faculty.php?id=4222>www.maxknowledge.com</a> for encouragement.
<li>Peter Heath for encouragement.

<p>
<div style='width: 500; background: white; border: solid 1px blue; padding: 10px;'>
If you have made a contribution to BugTracker.NET in the past and want to be listed on this page, email me at <a href=mailto:ctrager@yahoo.com>ctrager@yahoo.com</a>.
</div>

<p>You are running .NET version: <% Response.Write(Environment.Version.ToString()); %>
