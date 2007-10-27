<%@ Page language="C#" %>
<!-- #include file = "inc.aspx" -->

<script language="C#" runat="server">

//Copyright 2002-2007 Corey Trager
//Distributed under the terms of the GNU General Public License


String sql;
DbUtil dbutil;
Security security;
DataSet ds;
DataView dv;


///////////////////////////////////////////////////////////////////////
void Page_Load(Object sender, EventArgs e)
{

	if (Request["format"] != "excel")
	{
		Util.do_not_cache(Response);
	}

	dbutil = new DbUtil();
	security = new Security();

	security.check_security(dbutil, HttpContext.Current, Security.ANY_USER_OK);


	// fetch the sql
	string qu_id_string = Util.sanitize_integer(Request["qu_id"]);

	ds = null;
	dv = null;

	if (qu_id_string != null)
	{

		// use sql specified in query string
		int qu_id = Convert.ToInt32(qu_id_string);
		sql = @"select qu_sql from queries where qu_id = $1";
		sql = sql.Replace("$1", qu_id_string);
		string bug_sql = (string)dbutil.execute_scalar(sql);

		// replace magic variables
		bug_sql = bug_sql.Replace("$ME", Convert.ToString(security.this_usid));

		bug_sql = Util.alter_sql_per_project_permissions(bug_sql,security.this_usid);

		ds = dbutil.get_dataset (bug_sql);
		dv = new DataView(ds.Tables[0]);
	}
	else
	{
		dv = (DataView) Session["bugs"];
	}


	if (dv == null)
	{
		Response.Write ("Please recreate the list before trying to print...");
		Response.End();
	}

	string format = Request["format"];
	if (format != null && format == "excel")
	{
		print_as_excel();
	}
	else
	{
		print_as_html();
	}

}




///////////////////////////////////////////////////////////////////////
void print_as_excel()
{

	Response.Charset= "UTF-8";
	Response.ContentType = "application/x-msexcel";
	Response.AddHeader ("content-disposition","attachment; filename=bugs.xls");

	int col;
	bool first_column;

	// column names
	first_column = true;
	for (col = 1; col < dv.Table.Columns.Count; col++)
	{
		if (!first_column)
		{
			Response.Write ("\t");
		}
		Response.Write (dv.Table.Columns[col].ColumnName);
		first_column = false;
	}
	Response.Write ("\n");

	// bug rows
	foreach (DataRowView drv in dv)
	{
		first_column = true;
		for (col = 1; col < dv.Table.Columns.Count; col++)
		{
			if (!first_column)
			{
				Response.Write ("\t");
			}
			Response.Write (drv[col].ToString());
			first_column = false;
		}
		Response.Write ("\n");
	}

}



///////////////////////////////////////////////////////////////////////
void print_as_html()
{

	Response.Write ("<head><link rel='StyleSheet' href='btnet.css' type='text/css'></head>");

	Response.Write ("<table border=1 cellspacing=0 cellpadding=3>");
	int col;

	for (col = 1; col < dv.Table.Columns.Count; col++)
	{
		Response.Write ("<td class=datah>\n");
		Response.Write (dv.Table.Columns[col].ColumnName);
		Response.Write ("</td>");
	}

	foreach (DataRowView drv in dv)
	{
		Response.Write ("<tr>");
		for (col = 1; col < dv.Table.Columns.Count; col++)
		{
			string datatype = dv.Table.Columns[col].DataType.ToString();

			if (Util.is_numeric_datatype(datatype))
			{
				Response.Write ("<td class=datad align=right>");
			}
			else
			{
				Response.Write ("<td class=datad>");
			}

			// write the data
			if (drv[col].ToString() == "")
			{
				Response.Write ("&nbsp;");
			}
			else
			{
				Response.Write (Server.HtmlEncode(drv[col].ToString()).Replace("\n","<br>"));
			}

			Response.Write ("</td>");
		}
		Response.Write ("</tr>");
	}

	Response.Write ("</table>");
}


</script>


