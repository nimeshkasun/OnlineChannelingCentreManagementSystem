using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class SpecSearch : System.Web.UI.Page
{
    static string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
    DataWorksClass dw = new DataWorksClass(constring);
    String specarea = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        specarea = Session["specarea"].ToString();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
       string fname = GridView1.SelectedRow.Cells[0].Text.Trim();
       string working = GridView1.SelectedRow.Cells[1].Text.Trim();
       dw.SetCommand("select Doctor_ID FROM Doctor WHERE First_name = @fname AND Working_hospital = @working AND Specialized_area = @specarea");
       dw.SetSqlCommandParameters("fname",fname);
       dw.SetSqlCommandParameters("Working", working);
       dw.SetSqlCommandParameters("specarea", specarea);
       string docid =  dw.GetSingleData();
        //string docid = Session["docid"].ToString().Trim();
       Session["docid"] = docid;
       Response.Redirect("~/DocSearch.aspx");
    }
}