using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Login : System.Web.UI.Page
{
    int test;
    protected void Page_Load(object sender, EventArgs e)
    {
        
            txtuname.Focus();
        
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
        DataWorksClass dw = new DataWorksClass(constring);
        dw.SetCommand(@"select count(User_ID) from namal where User_name=@username and Password = @password");
        dw.SetSqlCommandParameters("username", txtuname.Text.Trim());
        dw.SetSqlCommandParameters("password", txtpassword.Text.Trim());
        int count = Convert.ToInt32(dw.GetSingleData());
        dw.SetCommand("SELECT MAX(id) FROM loginlog");
        int i = Convert.ToInt32(dw.GetSingleData()) + 1;
        DateTime d = DateTime.Now;
        string date = d.ToString("yyyy-MM-dd");
        string time = d.ToString("hh:mm:ss");
        //validating the user
        if (count == 1)
        {
            dw.SetDataAdapter(@"select Type,User_name,User_ID from namal where User_name=@username and Password = @password");
            dw.SetDataAdapterParameters("username", txtuname.Text.Trim());
            dw.SetDataAdapterParameters("password", txtpassword.Text.Trim());
            DataTable dt = dw.GetDataTable();
            string uname = (dt.Rows[0][1].ToString()).Trim();
            string type = (dt.Rows[0][0].ToString()).Trim();
            string uid = (dt.Rows[0][2].ToString()).Trim();
            Session["User_ID"] = uid;
            Session["type"] = type;

            dw.SetCommand("SELECT Patient_ID FROM Patient WHERE User_ID = @uid");
            dw.SetSqlCommandParameters("uid", uid);
            string pid = dw.GetSingleData().Trim();
            Session["Patient_ID"] = pid;
            //filling login log table
            dw.SetCommand("INSERT INTO loginlog (id,username,attempt,date,time,type) VALUES (@id,@uname,@attempt,@date,@time,@type)");//,,
            dw.SetSqlCommandParameters("id", i);
            dw.SetSqlCommandParameters("uname", txtuname.Text.Trim());
            dw.SetSqlCommandParameters("attempt", "success");
            dw.SetSqlCommandParameters("date", date);
            dw.SetSqlCommandParameters("time", time);
            dw.SetSqlCommandParameters("type", type);
            dw.Insert();
            Session["User_name"] = uname;
            //checking the type of users
            switch (type)
            {
                case "doctor":
                    dw.SetCommand("SELECT Doctor_ID FROM Doctor WHERE User_ID = @uid");
                    dw.SetSqlCommandParameters("uid", uid);
                    string did = dw.GetSingleData().Trim();
                    Session["Doctor_ID"] = did;

                    if (CheckBox1.Checked)
                    {
                        Session["ok"] = "go";
                    }
                    else
                    {
                        Session["ok"] = null;
                    }
                    Session["User_name"] = uname;
                    Response.Redirect("~/User/Doctor/Appointments.aspx");
                    break;
                case "patient":
                    if (CheckBox1.Checked)
                    {
                        Session["ok"] = "go";
                    }
                    else
                    {
                        Session["ok"] = null;
                    }
                    Session["User_name"] = uname;
                    Response.Redirect("~/Default.aspx");
                    break;
                case "admin":
                    dw.SetCommand("SELECT Admin_ID FROM Admin WHERE User_ID = @uid");
                    dw.SetSqlCommandParameters("uid", uid);
                    string aid = dw.GetSingleData().Trim();
                    Session["Admin_ID"] = aid;

                    if (CheckBox1.Checked)
                    {
                        Session["ok"] = "go";
                    }
                    else
                    {
                        Session["ok"] = null;
                    }
                    Session["User_name"] = uname;
                    Response.Redirect("~/User/Admin/AdminDefault.aspx");
                    break;
                case "nurse":
                    dw.SetCommand("SELECT Nurse_ID FROM Nurse WHERE User_ID = @uid");
                    dw.SetSqlCommandParameters("uid", uid);
                    string nid = dw.GetSingleData().Trim();
                    Session["Nurse_ID"] = nid;

                    if (CheckBox1.Checked)
                    {
                        Session["ok"] = "go";
                    }
                    else
                    {
                        Session["ok"] = null;
                    }
                    Session["User_name"] = uname;
                    Response.Redirect("~/User/Nurse/NurseDefault.aspx");
                    break;
            }
        }
        else
        {
            //print a error msg when user try to login without providing user credentials and in here userlogs table not filling
            if (txtuname.Text == "" || txtpassword.Text == "")
            {
                Response.Write("<script language=javascript>alert('PLZ FILL THE USERNAME AND PASSWORD FIELDS!!!!')</script>");
            }
            else if (txtuname.Text != "" || txtpassword.Text != "")
            {
                //filing loginlog table
                dw.SetCommand("INSERT INTO loginlog (id,username,attempt,date,time,type) VALUES (@id,@uname,@attempt,@date,@time,@type)");//,,
                dw.SetSqlCommandParameters("id", i);
                dw.SetSqlCommandParameters("uname", txtuname.Text.Trim());
                dw.SetSqlCommandParameters("attempt", "not success");
                dw.SetSqlCommandParameters("date", date);
                dw.SetSqlCommandParameters("time", time);
                dw.SetSqlCommandParameters("type", "unbound");
                dw.Insert();
                Response.Write("<script language=javascript>alert('WRONG CREDENTIALS!!!!')</script>");
            }
        }
    }
    protected void btnreg_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Account/register.aspx");
    }
    protected void btnfroget_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Account/ForgotPassword.aspx");
    }
    protected void txtuname_TextChanged(object sender, EventArgs e)
    {
        txtpassword.Focus();
    }
    protected void txtpassword_TextChanged(object sender, EventArgs e)
    {
        btnlogin_Click(sender, e);
    }
}