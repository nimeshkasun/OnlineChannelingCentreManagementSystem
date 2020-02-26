using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBConn
/// </summary>
public class DBConn
{
	public DBConn()
	{
        SqlConnection sqlCon = new SqlConnection(@"Data Source=NIMESH-PC;Initial Catalog=project1;Integrated Security=True");
        DataTable dt = new DataTable();
        sqlCon.Open();
	}
}