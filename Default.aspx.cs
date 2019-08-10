using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class _Default : Page
{
    static string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
    DataWorksClass dw = new DataWorksClass(constring);
    int count = 0;
    int select = 0;
    int select1 = 0;
    string docid = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        Session["docid"] = null;
        Session["specarea"] = null;
       // session = Session["User_name"].ToString();
        drpSpecialization.Visible = false;

        try
        {
            String utype = Session["type"].ToString();

            switch (utype)
            {
                case "doctor":
                    ImageButton2.PostBackUrl = "~/User/Doctor/Appointments.aspx";
                    btnHR.PostBackUrl = "~/User/Doctor/Appointments.aspx";
                    btnLR.PostBackUrl = "~/User/Doctor/Appointments.aspx";
                    btnMed.PostBackUrl = "~/User/Doctor/Appointments.aspx";
                    break;

                case "admin":
                    ImageButton2.PostBackUrl = "~/User/Admin/AdminDefault.aspx";
                    btnHR.PostBackUrl = "~/User/Admin/AdminDefault.aspx";
                    btnLR.PostBackUrl = "~/User/Admin/AdminDefault.aspx";
                    btnMed.PostBackUrl = "~/User/Admin/AdminDefault.aspx";
                    break;

                case "nurse":
                    ImageButton2.PostBackUrl = "~/User/Nurse/NurseDefault.aspx";
                    btnHR.PostBackUrl = "~/User/Nurse/NurseDefault.aspx";
                    btnLR.PostBackUrl = "~/User/Nurse/NurseDefault.aspx";
                    btnMed.PostBackUrl = "~/User/Nurse/NurseDefault.aspx";
                    break;
            }
        }
        catch { }









    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        drpSpecialization.Visible = true;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        select = selection1;
        select1 = selection2;
        

        if (select == 1 && select1 != 2) {
            dw.SetCommand("SELECT COUNT(Doctor_ID) FROM Doctor WHERE Last_name = @lname");
            dw.SetSqlCommandParameters("lname", drpDoctor.SelectedItem.ToString());
            count = Convert.ToInt32(dw.GetSingleData());

            dw.SetCommand("SELECT Doctor_ID FROM Doctor WHERE Last_name = @lname");
            dw.SetSqlCommandParameters("lname", drpDoctor.SelectedItem.ToString());
            docid = dw.GetSingleData().ToString().Trim();

            if (count == 1)
            {
                Session["docid"] = docid;
              //  Session["Docname"] = drpDoctor.SelectedItem.ToString();
               // Session["specializedarea"] = drpSpecialization.SelectedItem.ToString();
                Response.Redirect("~/DocSearch.aspx");
            }
            else {
                Response.Write("<script language=javascript>alert('THAT DOCTOR IS NOT AVAILABLE')</script>");
            }
        }
        if (select != 1 && select1 == 2)
        {
            dw.SetCommand("SELECT COUNT(Doctor_ID) FROM Doctor WHERE Specialized_area = @sarea");
            dw.SetSqlCommandParameters("sarea", drpSpecialization.SelectedItem.ToString());
            count = Convert.ToInt32(dw.GetSingleData());

            dw.SetCommand("SELECT Doctor_ID FROM Doctor WHERE Specialized_area = @sarea");
            dw.SetSqlCommandParameters("sarea", drpSpecialization.SelectedItem.ToString());
            docid = dw.GetSingleData().ToString().Trim();

            //if (count == 1)
            //{
                Session["specarea"] = drpSpecialization.SelectedItem.Text.Trim();
               // Session["docid"] = docid;
               // Session["Docname"] = drpDoctor.SelectedItem.ToString();
                Response.Redirect("~/SpecSearch.aspx");
            //}
            //else
            //{
            //    Response.Redirect("~/Default.aspx");
            //}
        }
        else
        {
            Response.Redirect("~/Default.aspx");
        }
        
    }

    protected void btnHR_Click1(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/User/Patient/Profile.aspx");
    }
    
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/User/Patient/HealthCard.aspx");
    }
    protected void btnLR_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/User/Patient/Dashboard.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (drpSpecialization.Visible == true)
        {
            drpSpecialization.Visible = false;
        }
        if (drpSpecialization.Visible == false)
        {
            drpSpecialization.Visible = true;
        }
    }
    protected void btnMed_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/User/Patient/Dashboard.aspx");
    }
    public int selection1=0;
    public int selection2=0;
    protected void drpDoctor_SelectedIndexChanged(object sender, EventArgs e)
    {
        selection1 = 1;
        selection2 = 0;
    }
    protected void drpSpecialization_SelectedIndexChanged(object sender, EventArgs e)
    {
        selection2 = 2;
        selection1 = 0;
    }
}