using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Net;

public partial class DocSearch : System.Web.UI.Page
{
    static string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
    DataWorksClass dw = new DataWorksClass(constring);
    string session1 = "";
    int no;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Label6.Visible = false;
            // string session = Session["Docname"].ToString().Trim();
            session1 = Session["docid"].ToString().Trim();

            //string nu =   GridView1.Rows.Count.ToString();


            Label6.Text = session1;
            dw.SetCommand("SELECT COUNT(Appointmentdate_ID) from Appointment_date WHERE Doctor_ID=@docid");
            dw.SetSqlCommandParameters("docid", Label6.Text.Trim());
            lblNoSessions.Text = dw.GetSingleData();

            dw.SetDataAdapter("SELECT Working_hospital,First_name,Specialized_area FROM Doctor WHERE  Doctor_ID = @docid");
            //dw.SetSqlCommandParameters("fname",session);
            dw.SetDataAdapterParameters("docid", session1);
            DataTable dt = dw.GetDataTable();
            string hospital = (dt.Rows[0][0].ToString().Trim()) + " Hospital";
            string fname = dt.Rows[0][1].ToString().Trim();
            string specarea = dt.Rows[0][2].ToString().Trim();
            // string hospital = dw.GetSingleData().ToString().Trim()+" Hospital";
            lblName.Text = fname;
            lblSpecArea.Text = specarea;
            lblOther.Text = hospital;
        }
        catch {
            Response.Redirect("~/Default.aspx");
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        string validate="";
        try
        {
            validate = Session["Patient_ID"].ToString().Trim();
        }
        catch {
            Response.Redirect("~/Account/Login.aspx");
        }

        if (validate != "")
        {
            int no = Convert.ToInt32(GridView1.SelectedRow.Cells[0].Text);
            if (no >=0)
            {
                string a = GridView1.SelectedRow.Cells[4].Text.Trim();
                this.ModalPopupExtender1.Show();

                TextBox1.Text = Session["Patient_ID"].ToString().Trim();

                dw.SetCommand("SELECT First_name FROM Patient WHERE Patient_ID = @pid");
                dw.SetSqlCommandParameters("pid", validate);
                TextBox5.Text = dw.GetSingleData();

                TextBox2.Text = lblName.Text.Trim();
                TextBox4.Text = lblSpecArea.Text;
                TextBox3.Text = GridView1.SelectedRow.Cells[1].Text;
            }
            else
            {
                Response.Write("<script language=javascript>alert('THIS TIME SLOT IS NOT AVAILABLE!!!!!')</script>");

            }
        }
        else
        {
            Response.Redirect("~/Account/Login.aspx");
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string pid = Session["Patient_ID"].ToString();

        DateTime d = DateTime.Now;
        string date = d.ToString("yyyy-MM-dd");
        

        //string date = GridView1.SelectedRow.Cells[1].Text;
        dw.SetCommand("SELECT No_of_patient FROM Appointment_date WHERE Date = @date and Doctor_ID = @did");
        dw.SetSqlCommandParameters("date", date);
        dw.SetSqlCommandParameters("did", session1);
        int count1 = Convert.ToInt32(dw.GetSingleData()) - 1;

        dw.SetCommand("SELECT appointmentdate_ID from Appointment_date WHERE  Date = @date and Doctor_ID = @did");
        dw.SetSqlCommandParameters("date", date);
        dw.SetSqlCommandParameters("did", session1);
        string appointmentdateid = dw.GetSingleData().Trim();

        dw.SetCommand("SELECT COUNT(Channel_no) FROM Channel WHERE Doctor_ID = @did and Patient_ID = @pid and chan_date = @date");
        dw.SetSqlCommandParameters("did", session1);
        dw.SetSqlCommandParameters("pid", Session["Patient_ID"].ToString().Trim());
        dw.SetSqlCommandParameters("date", date);
        int i = Convert.ToInt32(dw.GetSingleData());

        if (i<1)
        {

            dw.SetCommand("UPDATE Appointment_date SET No_of_patient = @count WHERE  Date = @dte and Doctor_ID = @did");
            dw.SetSqlCommandParameters("dte", date);
            dw.SetSqlCommandParameters("did", session1);
            dw.SetSqlCommandParameters("count", count1);
            dw.Update();

            dw.SetCommand("SELECT MAX(Channel_no) from Channel");
            int channelno = Convert.ToInt32(dw.GetSingleData()) + 1;

            dw.SetCommand("INSERT INTO Channel (Channel_no,Doctor_ID,appointmentdate_ID,Patient_ID,chan_date) VALUES (@chlno,@docid,@appno,@patid,@date)");
            dw.SetSqlCommandParameters("chlno", channelno);
            dw.SetSqlCommandParameters("docid", Label6.Text.Trim());
            dw.SetSqlCommandParameters("appno", appointmentdateid);
            dw.SetSqlCommandParameters("patid", pid);
            dw.SetSqlCommandParameters("date", date);
            dw.Insert();

            dw.SetCommand("SELECT No_of_patient FROM Appointment_date WHERE  Date = @dte and Doctor_ID = @did");

            if (count1 == 0)
            {
                dw.SetCommand("UPDATE Appointment_date SET Availability = @ava WHERE Date = @dte and Doctor_ID = @did");
                dw.SetSqlCommandParameters("dte", date);
                dw.SetSqlCommandParameters("did", session1);
                dw.SetSqlCommandParameters("ava", "NOT AVAILABLE");
                dw.Update();

            }
            else
            {
                dw.SetCommand("UPDATE Appointment_date SET Availability = @ava WHERE Date = @dte and Doctor_ID = @did");
                dw.SetSqlCommandParameters("dte", date);
                dw.SetSqlCommandParameters("did", session1);
                dw.SetSqlCommandParameters("ava", "AVAILABLE");
                dw.Update();
            }

            //Email Start......................................................

            string uid = Session["User_ID"].ToString();
            string uname = Session["User_name"].ToString();

            dw.SetCommand(@"SELECT User_name FROM namal WHERE User_ID = @uid");
            dw.SetSqlCommandParameters("uid", uid);


            string check = dw.GetSingleData();
            if (check == uname)
            {
                dw.SetDataAdapter(@"SELECT E_mail, User_name FROM namal WHERE User_ID = '" + uid + "' ");
                DataTable dt = dw.GetDataTable();
                string email = (dt.Rows[0][0].ToString()).Trim();
                string username = (dt.Rows[0][1].ToString()).Trim();

                //dw.SetCommand("SELECT Channel_no FROM Channel WHERE ");
                //dw.SetSqlCommandParameters("uname", txtuname.Text.Trim());
                //dw.SetSqlCommandParameters("email", txtemail.Text.Trim());
                //dw.SetSqlCommandParameters("nic", txtnic.Text.Trim());
                //string pass = dw.GetSingleData().Trim();

                MailMessage mm = new MailMessage("kduonlinecms@gmail.com", email);//(your gmail,receiver gmail)
                mm.Subject = "KDU CMS | Appintment Has Been Approved!";  //Subject
                mm.Body = "<b>" + "Dear " + TextBox5.Text.Trim() + "," + "</b> <br>" + "Your appointment has been approved by KDU Online Channelling and Management System." + "<br> <br>" + "<table>" + "<tr>" + "<td>" + "Your Channel Number " + "</td>" + "<td>" + "<b>" + channelno + "</b>" + "</td>" + "</tr>" + "<tr>" + "<td>" + "Your Reserved Date " + "</td>" + "<td>" + "<b>" + TextBox3.Text.Trim() + "</b>" + "</td>" + "</tr>" + "<tr>" + "<td>" + "Doctor " + "</td>" + "<td>" + "<b>" + TextBox2.Text.Trim() + "</b>" + "</td>" + "</tr>" + "<tr>" + "<td>" + "Specialization " + "</td>" + "<td>" + "<b>" + TextBox4.Text.Trim() + "</b>" + "</td>" + "</tr>" + "</table>" + "<br> <br>" + "<table>" + "<tr>" + "<td>" + "<img src=\"https://preview.ibb.co/kaGrEf/logo.png\" width=\"50px\">" + "&nbsp; &nbsp;" + "</td>" + "<td>" + "<b>" + "KDU Channeling Center," + "<br>" + "General Sir John Kotelawala Defence University," + "<br>" + "Southern Campus," + "<br>" + "Sooriyawewa." + "<br>" + "+94718810575" + "</b>" + "</td>" + "</tr>" + "</table>"; //Message

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

                //Response.Write("<script language=javascript>alert('BOOKING SUCCESSFULL! CHECK YOUR EMAILS!')</script>");
            }


            else
            {
                Response.Write("<script language=javascript>alert('YOUR DETAILS ARE NOT MATCH WITH YOUR ACCOUNT DETAILS !!!!')</script>");
            }
        }
        else {

            Response.Write("<script language=javascript>alert('You have an appointment already for this date !!!!')</script>");
        }


        //---------------------------------End Email





        Response.Write("<script language=javascript>alert('BOOKING SUCCESSFULL! CHECK YOUR EMAILS!')</script>");
        Response.Redirect("~/User/Patient/Appointments.aspx");
            Response.Write("<script language=javascript>alert('You have an appointment already for this date !!!!')</script>");
    }
}