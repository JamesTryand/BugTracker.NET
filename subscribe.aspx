<%@ Page language="C#"%>
<!--
Copyright 2002-2007 Corey Trager
Distributed under the terms of the GNU General Public License
-->
<!-- #include file = "inc.aspx" -->

<script language="C#" runat="server">

String sql;
DbUtil dbutil;
Security security;

///////////////////////////////////////////////////////////////////////
void Page_Load(Object sender, EventArgs e)
{

	dbutil = new DbUtil();
	security = new Security();
	security.check_security(dbutil, HttpContext.Current, Security.ANY_USER_OK_EXCEPT_GUEST);

	int bugid = Convert.ToInt32(Request["id"]);
	int permission_level = Bug.get_bug_permission_level(bugid, security);
	if (permission_level == Security.PERMISSION_NONE)
	{
		Response.End();
	}

	if (Request.QueryString["action"] == "1")
	{
		sql = @"insert into bug_subscriptions (bs_bug, bs_user)
			values($bg, $us)";
	}
	else
	{
		sql = @"delete from bug_subscriptions
			where bs_bug = $bg and bs_user = $us";
	}

	sql = sql.Replace("$bg", Util.sanitize_integer(Request["id"]));
	sql = sql.Replace("$us", Convert.ToString(security.this_usid));
	dbutil.execute_nonquery(sql);

}



</script>