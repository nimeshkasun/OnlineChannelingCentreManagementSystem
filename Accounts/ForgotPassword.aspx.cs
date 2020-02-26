using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Login : System.Web.UI.Page
{
    static string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
    DataWorksClass dw = new DataWorksClass(constring);
    string uname = "";
    string uid = "";
    string pid = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        txtuname.Focus();
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        //Email Start......................................................

        dw.SetCommand(@"SELECT COUNT(User_ID) FROM namal WHERE User_name = @uname and E_mail  = @email and NIC = @nic");
        dw.SetSqlCommandParameters("uname", txtuname.Text.Trim());
        dw.SetSqlCommandParameters("email", txtemail.Text.Trim());
        dw.SetSqlCommandParameters("nic", txtnic.Text.Trim());
        int count = Convert.ToInt32(dw.GetSingleData());
        if (count == 1)
        {
            string email = txtemail.Text.Trim();
            dw.SetCommand("SELECT Password FROM namal WHERE User_name = @uname and E_mail  = @email and NIC = @nic");
            dw.SetSqlCommandParameters("uname", txtuname.Text.Trim());
            dw.SetSqlCommandParameters("email", txtemail.Text.Trim());
            dw.SetSqlCommandParameters("nic", txtnic.Text.Trim());
            string pass = dw.GetSingleData().Trim();

            MailMessage mm = new MailMessage("kduonlinecms@gmail.com", email);//(your gmail,receiver gmail)
            mm.Subject = "KDU CMS | Password Reminder!";  //Subject
            mm.Body = "<b>" + "Dear " + txtuname.Text.Trim() + "," + "</b> <br>" + "Your password has been retrieved by KDU Online Channelling and Management System." + "<br> <br>" + "<table>" + "<tr>" + "<td>" + "Your Recorded Password " + "</td>" + "<td>" + "<b>" + pass + "</b>" + "</td>" + "</tr>" + "</table>" + "<br> <br>" + "<i>" + "Important! Keep your password in a secure place. After remembering your password, permanantly delete this email for your account's safty." + "</i>" + "<br> <br>" + "<table>" + "<tr>" + "<td>" + "<img src=\"https://preview.ibb.co/kaGrEf/logo.png\" width=\"50px\">" + "&nbsp; &nbsp;" + "</td>" + "<td>" + "<b>" + "KDU Channeling Center," + "<br>" + "General Sir John Kotelawala Defence University," + "<br>" + "Southern Campus," + "<br>" + "Sooriyawewa." + "<br>" + "+94718810575" + "</b>" + "</td>" + "</tr>" + "</table>"; //Message

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
            Response.Redirect("~/Account/Login.aspx");


        }
        else
        {
            Response.Write("<script language=javascript>alert('YOUR DETAILS ARE NOT MATCH WITH YOUR ACCOUNT DETAILS !!!!')</script>");
        }


        //---------------------------------End Email
    }
    protected void btnreg_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Account/Login.aspx");
    }
    protected void btnfroget_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Account/ForgotPassword.aspx");
    }
    protected void txtuname_TextChanged(object sender, EventArgs e)
    {
        txtemail.Focus();
    }
    protected void txtemail_TextChanged(object sender, EventArgs e)
    {
        txtnic.Focus();
    }
    protected void txtnic_TextChanged(object sender, EventArgs e)
    {
        btnlogin_Click(sender, e);
    }
}