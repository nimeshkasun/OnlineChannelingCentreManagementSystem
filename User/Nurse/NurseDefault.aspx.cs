using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class User_Nurse_NurseDefault : System.Web.UI.Page
{
    string uname = "";
    string uid = "";
    string pid = "";
    string apptpid = "";
    string nid = "";

   static string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
    DataWorksClass dw = new DataWorksClass(constring);
    protected void Page_Load(object sender, EventArgs e)
    {
      
        try
        {
            uid = Session["User_ID"].ToString();
            uname = Session["User_name"].ToString();
            pid = Session["Patient_ID"].ToString();
            nid = Session["Nurse_ID"].ToString();
            txtSearchNurse.Focus();
        }
        catch
        {
            Response.Redirect("~/Account/Login.aspx");
        }

    }
    protected void btnSearchNurse_Click(object sender, EventArgs e)
    {
        //string uid;
        //string pid;
        string aaaa = txtSearchNurse.Text.Trim();


        dw.SetCommand("SELECT User_ID FROM namal WHERE NIC = @nic");
        dw.SetSqlCommandParameters("nic", txtSearchNurse.Text.Trim());
        uid = dw.GetSingleData().ToString().Trim();

        dw.SetCommand("SELECT Patient_ID FROM Patient WHERE User_ID = @uid");
        dw.SetSqlCommandParameters("uid", uid);
        pid = dw.GetSingleData().Trim();


        if (pid == "0")
        {
            dw.SetCommand("SELECT Patient_ID FROM Patient WHERE User_ID = @uid");
            dw.SetSqlCommandParameters("uid", txtSearchNurse.Text.Trim());
            pid = dw.GetSingleData().Trim();
            if (pid == "0")
            {

                Response.Write("<script language=javascript>alert('THERE IS NO ANY PATIENT RELATED TO THIS NUMBER')</script>");
            }
            else
            {
                Session["ApptPat_ID"] = pid;
                Response.Redirect("~/User/Nurse/Dashboard.aspx");
            }
        }
        else
        {
            Session["ApptPat_ID"] = pid;
            Response.Redirect("~/User/Nurse/Dashboard.aspx");
        }
    }
    protected void txtSearchNurse_TextChanged(object sender, EventArgs e)
    {
        btnSearchNurse_Click(sender, e);
    }
}