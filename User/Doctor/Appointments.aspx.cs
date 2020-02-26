using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Admin_Appointments : System.Web.UI.Page
{
    string uname = "";
    string uid = "";
    string pid = "";
    string apptpid = "";
    string did = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            uid = Session["User_ID"].ToString();
            uname = Session["User_name"].ToString();
            pid = Session["Patient_ID"].ToString();
            did = Session["Doctor_ID"].ToString();
        }catch{
            Response.Redirect("~/Account/Login.aspx");
        }



    }
    
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int a = Convert.ToInt32(GridView1.SelectedRow.Cells[2].Text);
        Session["ApptPat_ID"] = a;
        Response.Redirect("~/User/Doctor/Dashboard.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
        using (SqlConnection con = new SqlConnection(constring))
        {
            try {
                using (SqlCommand cmd = new SqlCommand(@"SELECT Channel.Channel_no, Doctor.First_name, Channel.Patient_ID, Patient.Last_name, Channel.chan_date 
                                                        FROM Channel, Doctor, Patient 
                                                         WHERE ((Channel.Doctor_ID = Doctor.Doctor_ID) AND ((Channel.Doctor_ID = @Doctor_ID) AND (Channel.Patient_ID = Patient.Patient_ID) AND (Channel.chan_date BETWEEN @From AND @To))) 
                                                        ORDER BY [chan_date] DESC", con)) 
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        cmd.Parameters.AddWithValue("@Doctor_ID", did);
                        cmd.Parameters.AddWithValue("@From", Convert.ToDateTime(this.txtFilFrom.Text.Trim(), new CultureInfo("en-GB")));
                        cmd.Parameters.AddWithValue("@To", Convert.ToDateTime(this.txtFilTo.Text.Trim(), new CultureInfo("en-GB")));
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        GridView1.DataSource = ds;
                        GridView1.DataBind();
                    }
                }
            }catch{
                using (SqlCommand cmd = new SqlCommand(@"SELECT Channel.Channel_no, Doctor.First_name, Channel.Patient_ID, Patient.Last_name, Channel.chan_date 
                                                        FROM Channel, Doctor, Patient 
                                                         WHERE ((Channel.Doctor_ID = Doctor.Doctor_ID) AND ((Channel.Doctor_ID = @Doctor_ID) AND (Channel.Patient_ID = Patient.Patient_ID) AND (Channel.chan_date BETWEEN @From AND @To))) 
                                                        ORDER BY [chan_date] DESC", con)) 
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        string date = DateTime.Now.ToString("yyyy-MM-dd");
                        cmd.Parameters.AddWithValue("@Doctor_ID", did);
                        cmd.Parameters.AddWithValue("@From", Convert.ToDateTime(this.txtFilFrom.Text.Trim(), new CultureInfo("en-GB")));
                        cmd.Parameters.AddWithValue("@To", Convert.ToDateTime((date), new CultureInfo("en-GB")));
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        GridView1.DataSource = ds;
                        GridView1.DataBind();
                    }
                }
                
            }
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        string date = DateTime.Now.ToString("yyyy-MM-dd");

        string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
        using (SqlConnection con = new SqlConnection(constring))
        {
            using (SqlCommand cmd = new SqlCommand(@"SELECT Channel.Channel_no, Doctor.First_name, Channel.Patient_ID, Patient.Last_name, Channel.chan_date 
                                                        FROM Channel, Doctor, Patient 
                                                          WHERE ((Channel.Doctor_ID = Doctor.Doctor_ID) AND ((Channel.Doctor_ID = @Doctor_ID) AND (Channel.Patient_ID = Patient.Patient_ID) AND (Channel.chan_date = @on))) 
                                                        ORDER BY [chan_date] DESC", con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    cmd.Parameters.AddWithValue("@Doctor_ID", did);
                    cmd.Parameters.AddWithValue("@on", Convert.ToDateTime(date));
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
            }
        }
    }
}