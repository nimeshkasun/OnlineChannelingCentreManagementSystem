using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

public partial class User_Admin_HealthCard : System.Web.UI.Page
{
    static string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
    DataWorksClass dw = new DataWorksClass(constring);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //string uid = Session["User_ID"].ToString();
            //string uname = Session["User_name"].ToString();
            //string pid = Session["Patient_ID"].ToString();
            string ApptU_ID = Session["ApptU_ID"].ToString();
            string ApptP_ID = Session["ApptPat_ID"].ToString();
            dw.SetDataAdapter("SELECT First_name,Last_name,bloodgroup FROM Patient WHERE Patient_ID = @pid");
            dw.SetDataAdapterParameters("pid", ApptP_ID);
            DataTable dt = dw.GetDataTable();

            lblfname.Text = dt.Rows[0][0].ToString().Trim();
            lbllname.Text = dt.Rows[0][1].ToString().Trim();
            string bgroup= dt.Rows[0][2].ToString().Trim();
            if (bgroup == "0") {
                bGroup.Text = "A+";
            }
            else if (bgroup == "1")
            {
                bGroup.Text = "A-";
            }
            else if (bgroup == "2")
            {
                bGroup.Text = "B+";
            }
            else if (bgroup == "3")
            {
                bGroup.Text = "B-";
            }
            else if (bgroup == "4")
            {
                bGroup.Text = "AB+";
            }
            else if (bgroup == "5")
            {
                bGroup.Text = "AB-";
            }
            else if (bgroup == "6")
            {
                bGroup.Text = "O+";
            }
            else if (bgroup == "7")
            {
                bGroup.Text = "O-";
            }


            lblPHN.Text = ApptP_ID;

            dw.SetDataAdapter("SELECT Home_telephone_number, Mobile_number, Address, NIC FROM namal WHERE User_ID = @uid");
            dw.SetDataAdapterParameters("uid", ApptU_ID);
            DataTable dt1 = dw.GetDataTable();

            lblhome.Text = dt1.Rows[0][0].ToString().Trim();
            lblmobile.Text = dt1.Rows[0][1].ToString().Trim();
            lblAddress.Text = dt1.Rows[0][2].ToString().Trim();
            lblNIC.Text = dt1.Rows[0][3].ToString().Trim();
        }
        catch {
            Response.Redirect("~/User/Doctor/Appointments.aspx");
        }


       

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/User/Doctor/Dashboard.aspx");
    }
}