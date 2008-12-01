<%@ Page language="C#"%>
<!--
Copyright 2002-2008 Corey Trager
Distributed under the terms of the GNU General Public License
-->
<!-- #include file = "inc.aspx" -->

<script language="C#" runat="server">


DataSet ds;

Security security;

void Page_Load(Object sender, EventArgs e)
{

	Util.do_not_cache(Response);
	
	security = new Security();
	security.check_security( HttpContext.Current, Security.MUST_BE_ADMIN);

	ds = btnet.DbUtil.get_dataset(
		@"select og_id [id],
		'<a href=edit_org.aspx?id=' + convert(varchar,og_id) + '>edit</a>' [$no_sort_edit],
		'<a href=delete_org.aspx?id=' + convert(varchar,og_id) + '>delete</a>' [$no_sort_delete],
		og_name[desc],
		case when og_non_admins_can_use = 1 then 'Y' else 'N' end [non-admin<br>can use],
		case
			when og_other_orgs_permission_level = 0 then 'None'
			when og_other_orgs_permission_level = 1 then 'Read Only'
			else 'Add/Edit' end [other orgs<br>permission<br>level],
		case when og_external_user = 1 then 'Y' else 'N' end [external<br>(i.e, customer,<br>not employee)],
		case when og_can_edit_sql = 1 then 'Y' else 'N' end [can<br>edit sql],
		case when og_can_delete_bug = 1 then 'Y' else 'N' end [can<br>delete item],
		case when og_can_edit_and_delete_posts = 1 then 'Y' else 'N' end [can<br>edit/del posts],
		case when og_can_use_reports = 1 then 'Y' else 'N' end [can<br>use rpts],
		case when og_can_edit_reports = 1 then 'Y' else 'N' end [can<br>edit rpts],
		case when og_can_be_assigned_to = 1 then 'Y' else 'N' end [can<br>be assigned to],
		case
			when og_status_field_permission_level = 0 then 'None'
			when og_status_field_permission_level = 1 then 'Read Only'
			else 'Add/Edit' end [status<br>permission<br>level],
		case
			when og_assigned_to_field_permission_level = 0 then 'None'
			when og_assigned_to_field_permission_level = 1 then 'Read Only'
			else 'Add/Edit' end [assigned to<br>permission<br>level],
		case
			when og_priority_field_permission_level = 0 then 'None'
			when og_priority_field_permission_level = 1 then 'Read Only'
			else 'Add/Edit' end [priority<br>permission<br>level]
		from orgs order by og_name");

}


</script>

<html>
<head>
<title id="titl" runat="server">btnet orgs</title>
<link rel="StyleSheet" href="btnet.css" type="text/css">
<script type="text/javascript" language="JavaScript" src="sortable.js"></script>
</head>

<body>
<% security.write_menu(Response, "admin"); %>


<div class=align>
<a href=edit_org.aspx>add new org</a>
</p>
<%

if (ds.Tables[0].Rows.Count > 0)
{
	SortableHtmlTable.create_from_dataset(
		Response, ds, "", "", false);

}
else
{
	Response.Write ("No orgs in the database.");
}

%>
</div>
<% Response.Write(Application["custom_footer"]); %></body>
</html>