using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

public partial class User_Admin_Profile : System.Web.UI.Page
{
    static string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
    DataWorksClass dw = new DataWorksClass(constring);
    string uname = "";
    string uid = "";
    string pid = "";
    string ApptU_ID = "";
    string ApptP_ID = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            uid = Session["User_ID"].ToString();
            uname = Session["User_name"].ToString();
            pid = Session["Patient_ID"].ToString();
            ApptP_ID = Session["ApptPat_ID"].ToString();

        }
        catch {
            Response.Redirect("~/User/Nurse/NurseDefault.aspx");
        }

       // Patient Table ====================================================================================

       try
       {
           // Patient Table ====================================================================================

           dw.SetDataAdapter(@"select * from patient where Patient_ID='" + ApptP_ID + "' ");
           DataTable dt = dw.GetDataTable();

           string name = (dt.Rows[0][3].ToString()).Trim() + " " + (dt.Rows[0][4].ToString()).Trim();
           lblName.Text = name; //Name
           lblUid.Text = "User " + (dt.Rows[0][1].ToString()).Trim(); //UID
           Session["ApptU_ID"] = (dt.Rows[0][1].ToString()).Trim(); //UID
           ApptU_ID = Session["ApptU_ID"].ToString();
           lblPatHelNo.Text = (dt.Rows[0][0].ToString()).Trim(); //PID

           lblPatWeight.Text = (dt.Rows[0][6].ToString()).Trim(); //weight
           lblPatHeight.Text = (dt.Rows[0][5].ToString()).Trim(); //height
           float HeightinM = float.Parse(lblPatHeight.Text) / 100;
           float bmi = float.Parse(lblPatWeight.Text) / (HeightinM * HeightinM);
           lblPatBmi.Text = bmi.ToString("0.00");


           //Change BMI color according to value
           if (float.Parse(lblPatBmi.Text) >= 25)
           {
               lblPatBmi.ForeColor = System.Drawing.Color.Red;
           }
           else if (float.Parse(lblPatBmi.Text) < 18.5)
           {
               lblPatBmi.ForeColor = System.Drawing.Color.Orange;
           }
           else
           {
               lblPatBmi.ForeColor = System.Drawing.Color.Green;
           }


           H1.Value = (dt.Rows[0][7].ToString()).Trim(); //bGroup
           int g = Int32.Parse(H1.Value);
           DropDownList2.SelectedIndex = g;
           lblPatBloodGrp.Text = DropDownList2.Text;


           H1.Value = (dt.Rows[0][9].ToString()).Trim(); //smoke
           int j = Int32.Parse(H1.Value);
           DropDownList8.SelectedIndex = j;
           lblSmoke.Text = DropDownList8.SelectedValue;

           H1.Value = (dt.Rows[0][10].ToString()).Trim(); //AlPeriod
           int k = Int32.Parse(H1.Value);
           DropDownList9.SelectedIndex = k;
           lblAlcohol.Text = DropDownList9.SelectedValue;

           lblWatInt.Text = (dt.Rows[0][11].ToString()).Trim(); //WaterIntake
       }catch{}
        try{
           // Namal Table ====================================================================================
            DataTable dt = dw.GetDataTable();
           dw.SetDataAdapter(@"select * from namal where User_ID='" + ApptU_ID + "' ");
           dt = dw.GetDataTable();

           H1.Value = (dt.Rows[0][9].ToString()).Trim(); //year
           int f = Int32.Parse(H1.Value);
           DropDownList5.SelectedIndex = f;
           int age = 2018 - Int32.Parse(DropDownList5.SelectedValue);
           lblPatAge.Text = age.ToString();

           lblPatNic.Text = (dt.Rows[0][12].ToString()).Trim(); //nic


           lblPatConMob.Text = (dt.Rows[0][5].ToString()).Trim(); //mobile
           lblPatConHom.Text = (dt.Rows[0][4].ToString()).Trim(); //home
       }
       catch { }
        
      
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        

        
    }

    protected void txtSearchPatient_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/User/Nurse/Appointments.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/User/Nurse/HealthCard.aspx");
    }

    protected void Button3_Click1(object sender, EventArgs e)
    {
        dw.SetCommand("UPDATE namal SET Mobile_number = @mob, Home_telephone_number = @home, office_number = @onu, Address = @address, Country = @country , Province = @province, ZIPcode = @zip WHERE User_ID = @uid");
        // dw.SetCommand("UPDATE namal SET Mobile_number = @mob WHERE User_ID = @uid");
        dw.SetSqlCommandParameters("uid", ApptU_ID);
        dw.SetSqlCommandParameters("mob", txtmobile.Text.Trim());
        dw.SetSqlCommandParameters("home", txthome.Text.Trim());
        dw.SetSqlCommandParameters("onu",txtoffice.Text.Trim());
        dw.SetSqlCommandParameters("address", txtaddress.Text.Trim());
        dw.SetSqlCommandParameters("country", ddlcountry.SelectedIndex.ToString().Trim());
        dw.SetSqlCommandParameters("province", ddlprovince.SelectedIndex.ToString().Trim());
        dw.SetSqlCommandParameters("zip", txtzip.Text.Trim());
        dw.Update();

        dw.SetCommand("UPDATE Family SET Contact_number = @con, Name = @name WHERE Patient_ID = @pid");
        dw.SetSqlCommandParameters("con", txtemergencycontact.Text.Trim());
        dw.SetSqlCommandParameters("name", txtemergencyname.Text.Trim());
        dw.SetSqlCommandParameters("pid", ApptP_ID);
        dw.Update();

    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        dw.SetCommand("UPDATE Patient SET Smoking = @smoking, Alchol = @alchol, Diet = @diet, Waterintake = @waterintake, Alchol_intake = @alcholintake WHERE Patient_ID = @pid");
        dw.SetSqlCommandParameters("smoking", ddlsmoking.SelectedValue.ToString().Trim());
        dw.SetSqlCommandParameters("alchol", ddlalchol.SelectedValue.ToString().Trim());
        dw.SetSqlCommandParameters("diet", ddldiet.SelectedValue.ToString().Trim());
        dw.SetSqlCommandParameters("waterintake", txtwaterintake.Text.Trim());
        dw.SetSqlCommandParameters("alcholintake", txtalcholintake.Text.Trim());
        dw.SetSqlCommandParameters("pid", ApptP_ID);
        dw.Update();
    }

    protected void btnPP_Click(object sender, EventArgs e)
    {
        ///   dw.SetCommand("UPDATE Patient SET First_name = @fname,Last_name = @lname,Height = @height,weight = @weight,bloodgroup = @bldgrp WHERE Patient_ID = '" + pid + "'");
        //dw.SetCommand("UPDATE Patient SET First_name = @fname, Last_name = @lname, Height = @height, weight = @weight, bloodgroup = @bloodgroup WHERE Patient_ID =  @pid");
        dw.SetCommand("UPDATE Patient SET First_name = @fname WHERE Patient_ID = @pid");
        dw.SetSqlCommandParameters("pid", ApptP_ID);
        dw.SetSqlCommandParameters("fname", txtfname.Text.Trim());
        dw.SetSqlCommandParameters("lname", txtlname.Text.Trim());
        dw.SetSqlCommandParameters("height", txtgeight.Text.Trim());
        dw.SetSqlCommandParameters("weight", txtweight.Text.Trim());
        dw.SetSqlCommandParameters("bloodgroup", ddlbloodgroup.SelectedIndex.ToString().Trim());
        dw.Update();

        dw.SetCommand("UPDATE namal SET Title=@Title, NIC = @nic, PassportN = @pass, DOBy = @year , DOBm = @month, DOBd = @date WHERE User_ID = @uid");
        dw.SetSqlCommandParameters("Title", DropDownList1.SelectedIndex.ToString().Trim());
        dw.SetSqlCommandParameters("uid", ApptU_ID.ToString().Trim());
        dw.SetSqlCommandParameters("nic", txtnic.Text.Trim());
        dw.SetSqlCommandParameters("pass", txtpassno.Text.Trim());
        dw.SetSqlCommandParameters("year", ddlyear.SelectedValue.ToString().Trim());
        dw.SetSqlCommandParameters("month", ddlmonth.SelectedValue.ToString().Trim());
        dw.SetSqlCommandParameters("date", ddldate.SelectedValue.ToString().Trim());
        dw.Update();

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        
            dw.SetCommand("SELECT Password FROM namal WHERE User_ID = @uid");
            dw.SetSqlCommandParameters("uid", ApptU_ID);
            string password = dw.GetSingleData().Trim();


            if (txtpassword.Text.Trim() == password)
            {

                if (txtnewpassword.Text.Trim() == txtconfirmpassword.Text.Trim())
                {

                    dw.SetCommand("UPDATE namal SET Password = @password WHERE User_ID = @uid");
                    dw.SetSqlCommandParameters("uid", ApptU_ID);
                    dw.SetSqlCommandParameters("password", txtnewpassword.Text.Trim());
                    dw.Update();

                    dw.SetCommand("SELECT E_mail FROM namal WHERE User_ID = @uid");
                    dw.SetSqlCommandParameters("uid", ApptU_ID);
                    string email = dw.GetSingleData().Trim();
                    string npass = txtnewpassword.Text.Trim();

                    dw.SetCommand("SELECT First_name FROM Patient WHERE User_ID = @uid");
                    dw.SetSqlCommandParameters("uid", ApptU_ID);
                    string fname = dw.GetSingleData().Trim();

                    MailMessage mm = new MailMessage("kduonlinecms@gmail.com", email);//(your gmail,receiver gmail)
                    mm.Subject = "KDU CMS | Password Reset!";  //Subject
                    mm.Body = "<b>" + "Dear " + fname + "," + "</b> <br>" + "Your password has been changed on KDU Online Channelling and Management System." + "<br> <br>" + "<table>" + "<tr>" + "<td>" + "Your changed Password " + "</td>" + "<td>" + "<b>" + npass + "</b>" + "</td>" + "</tr>" + "</table>" + "<br> <br>" + "<i>" + "Important! Keep your password in a secure place. After remembering your password, permanantly delete this email for your account's safty." + "</i>" + "<br> <br>" + "<table>" + "<tr>" + "<td>" + "<img src=\"https://preview.ibb.co/kaGrEf/logo.png\" width=\"50px\">" + "&nbsp; &nbsp;" + "</td>" + "<td>" + "<b>" + "KDU Channeling Center," + "<br>" + "General Sir John Kotelawala Defence University," + "<br>" + "Southern Campus," + "<br>" + "Sooriyawewa." + "<br>" + "+94718810575" + "</b>" + "</td>" + "</tr>" + "</table>"; //Message

                    //+"<table>"+
                    //    "<tr>"+
                    //        "<td>" + "Your Channel Number " + "</td>" +
                    //        "<td>" + "<b>" + channelno + "</b>" + "</td>" +
                    //    "</tr>"+
                    //    "<tr>" +
                    //        "<td>" + "Your Reserved Date " + "</td>" +
                    //        "<td>" + "<b>" + TextBox3.Text.Trim() + "</b>" + "</td>" +
                    //    "</tr>" +
                    //    "<tr>" +
                    //        "<td>" + "Doctor " + "</td>" +
                    //        "<td>" + "<b>" + TextBox2.Text.Trim() + "</b>" + "</td>" +
                    //    "</tr>" +
                    //    "<tr>" +
                    //        "<td>" + "Specialization " +"</td>" +
                    //        "<td>" + "<b>" + TextBox4.Text.Trim() + "</b>" + "</td>" +
                    //    "</tr>" +
                    //"</table>"+

                    //+"<table>" +
                    //    "<tr>" +
                    //        "<td>" + "<img src=\"https://preview.ibb.co/kaGrEf/logo.png\" width=\"50px\">" + "&nbsp; &nbsp;" + "</td>" +
                    //        "<td>" + "<b>" + "KDU Channeling Center,"+"<br>"+"General Sir John Kotelawala Defence University,"+"<br>"+"Southern Campus,"+"<br>"+"Sooriyawewa."+"<br>"+"+94718810575"+"</b>" + "</td>" +
                    //    "</tr>" +
                    //"</table>" +

                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential networkcred = new NetworkCredential("kduonlinecms@gmail.com", "KDU123cms");//(your gmail & gmail password)
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = networkcred;
                    smtp.Port = 587;
                    smtp.Send(mm);

                    Response.Write("<script language=javascript>alert('PASSWORD CHANGED !!!!')</script>");
                    Response.Redirect("~/User/Doctor/Profile.aspx");
                }
                else
                {
                    Label46.Text = "Password does not match!";
                    Label45.Text = "";
                    //Response.Write("<script language=javascript>alert('PASSWORDS DON'T MATCH !!!!')</script>");
                    //Response.Redirect("~/User/Doctor/Profile.aspx");
                }
            }
            else
            {
                Label45.Text = "Incorrect Password!";
                Label46.Text = "";
                //Response.Write("<script language=javascript>alert('YOUR PREVIOUS PASSWORD IS INCORRECT!!!')</script>");
                //Response.Redirect("~/User/Doctor/Profile.aspx");
            }
        }
    

    protected void Button6_Click(object sender, EventArgs e)
    {
        dw.SetDataAdapter("SELECT First_name, Last_name, Height, weight, bloodgroup,Smoking,Alchol,Waterintake,Alchol_intake, Diet FROM Patient WHERE Patient_ID = @pid");
        dw.SetDataAdapterParameters("pid", ApptP_ID);
        DataTable dt5 = dw.GetDataTable();
        txtfname.Text = dt5.Rows[0][0].ToString().Trim();
        txtlname.Text = dt5.Rows[0][1].ToString().Trim();
        txtgeight.Text = dt5.Rows[0][2].ToString().Trim();
        txtweight.Text = dt5.Rows[0][3].ToString().Trim();
        ddlbloodgroup.SelectedIndex = Convert.ToInt32(dt5.Rows[0][4].ToString().Trim());
        ddlsmoking.SelectedValue = dt5.Rows[0][5].ToString().Trim();
        ddlalchol.SelectedValue = dt5.Rows[0][6].ToString();
        txtwaterintake.Text = dt5.Rows[0][7].ToString().Trim();
        txtalcholintake.Text = dt5.Rows[0][8].ToString().Trim();
        ddldiet.SelectedValue = dt5.Rows[0][9].ToString().Trim();

        dw.SetDataAdapter("SELECT Title, Address, Home_telephone_number, Mobile_number, PassportN, DOBy,DOBd,DOBm,NIC, Country, Province, ZIPcode, office_number from namal WHERE User_ID = @uid");
        dw.SetDataAdapterParameters("uid", ApptU_ID);
        DataTable dt6 = dw.GetDataTable();
        DropDownList1.SelectedValue = dt6.Rows[0][0].ToString().Trim();
        txtaddress.Text = dt6.Rows[0][1].ToString().Trim();
        txthome.Text = dt6.Rows[0][2].ToString().Trim();
        txtmobile.Text = dt6.Rows[0][3].ToString().Trim();
        txtpassno.Text = dt6.Rows[0][4].ToString().Trim();
        ddlyear.SelectedValue = dt6.Rows[0][5].ToString().Trim();
        ddldate.SelectedValue = dt6.Rows[0][6].ToString().Trim();
        ddlmonth.SelectedValue = dt6.Rows[0][7].ToString().Trim();
        txtnic.Text = dt6.Rows[0][8].ToString().Trim();
        ddlcountry.SelectedIndex = Convert.ToInt32(dt6.Rows[0][9].ToString().Trim());
        ddlprovince.SelectedIndex = Convert.ToInt32(dt6.Rows[0][10].ToString().Trim());
        txtzip.Text = dt6.Rows[0][11].ToString().Trim();
        txtoffice.Text = dt6.Rows[0][12].ToString().Trim();

        dw.SetDataAdapter("select Name, Contact_number FROM Family WHERE Patient_ID = @pid");
        dw.SetDataAdapterParameters("pid", ApptP_ID);
        DataTable dt7 = dw.GetDataTable();
        txtemergencyname.Text = dt7.Rows[0][0].ToString().Trim();
        txtemergencycontact.Text = dt7.Rows[0][1].ToString().Trim();
    
    }

}
