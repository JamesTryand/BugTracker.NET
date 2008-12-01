<%@ Page language="C#"%>
<!-- #include file = "inc.aspx" -->

<script runat="server">


Security security;

///////////////////////////////////////////////////////////////////////
void Page_Load(Object sender, EventArgs e)
{

	Util.do_not_cache(Response);
	
	security = new Security();
	security.check_security( HttpContext.Current, Security.ANY_USER_OK);

	string bugid = Util.sanitize_integer(Request["bugid"]);

	// check permission
	int permission_level = Bug.get_bug_permission_level(Convert.ToInt32(bugid), security);
	if (permission_level != Security.PERMISSION_NONE)
	{

		Response.Write(@"

<style>
.cmt_text
{
font-family: courier new;
font-size: 8pt;
}
.pst
{
font-size: 7pt;
}
</style>");
		

		int post_cnt = PrintBug.write_posts(
			Response,
			Convert.ToInt32(bugid),
			permission_level,
			false,
			false,
			false,
			security.user);		
	
		// We can't unwrite what we wrote, but let's tell javascript to ignore it.
		if (post_cnt == 0)
		{
			Response.Write ("<!--zeroposts-->");
		}
	
	}
	else
	{
		Response.Write ("");
	}
}

</script>