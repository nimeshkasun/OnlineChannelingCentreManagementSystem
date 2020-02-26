using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_register : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        lbl1.Visible = false;
        lbl2.Visible = false;
        lbl3.Visible = false;

        txtuname.Focus();
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Account/Login.aspx");
    }
    protected void btnreg_Click(object sender, EventArgs e)
    {
        string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
        DataWorksClass dw = new DataWorksClass(constring);

        dw.SetCommand("SELECT count(User_ID) FROM namal WHERE User_name = @uname");
        dw.SetSqlCommandParameters("uname",txtuname.Text.Trim());
        int count1 = Convert.ToInt32(dw.GetSingleData().Trim());
        if(count1 < 1){
        dw.SetCommand("SELECT MAX(User_ID) FROM namal");
        int count = Convert.ToInt32(dw.GetSingleData()) + 1;

        if (txtpassword.Text.Trim() == txtconfirmpassword.Text.Trim())
        {
            const int MIN_LENGTH = 8;
            const int MAX_LENGTH = 15;

            if (txtpassword.Text == null) throw new ArgumentNullException();

            bool meetsLengthRequirements = txtpassword.Text.Trim().Length >= MIN_LENGTH && txtpassword.Text.Trim().Length <= MAX_LENGTH;
            bool hasUpperCaseLetter = false;
            bool hasLowerCaseLetter = false;
            bool hasDecimalDigit = false;

            if (meetsLengthRequirements)
            {
                foreach (char c in txtpassword.Text.Trim())
                {
                    if (char.IsUpper(c)) hasUpperCaseLetter = true;
                    else if (char.IsLower(c)) hasLowerCaseLetter = true;
                    else if (char.IsDigit(c)) hasDecimalDigit = true;
                }
                bool isValid = meetsLengthRequirements
            && hasUpperCaseLetter
            && hasLowerCaseLetter
            && hasDecimalDigit
            ;
                if (isValid == true)
                {

                    string pa = "patient";
                    dw.SetCommand("INSERT INTO namal(User_ID,User_name,Password,E_mail,Type) VALUES (@uid,@uname,@pass,@email,@type)");
                    dw.SetSqlCommandParameters("uid", count.ToString());
                    dw.SetSqlCommandParameters("uname", txtuname.Text.Trim());
                    dw.SetSqlCommandParameters("pass", txtpassword.Text.Trim());
                    dw.SetSqlCommandParameters("email", txtemail.Text.Trim());
                    dw.SetSqlCommandParameters("type", pa);
                    dw.Insert();

                    dw.SetCommand("SELECT MAX(Patient_id) From Patient");
                    int pid = Convert.ToInt32( dw.GetSingleData().Trim())+1;
                    dw.SetCommand("INSERT INTO Patient(Patient_ID,User_ID) VALUES (@pid,@uid)");
                    dw.SetSqlCommandParameters("pid", pid);
                    dw.SetSqlCommandParameters("uid", count);
                    dw.Insert();

                    dw.SetCommand("SELECT MAX(Relation_ID) FROM Family");
                    int rid = Convert.ToInt32(dw.GetSingleData())+1;

                    dw.SetCommand("INSERT INTO Family(Relation_ID, Patient_ID) VALUES (@rid,@pid)");
                    dw.SetSqlCommandParameters("rid", rid);
                    dw.SetSqlCommandParameters("pid", pid);
                    dw.Insert();


                    //Email Start......................................................

                    string email = txtemail.Text.Trim();
                    string pass = txtpassword.Text.Trim();
                    string uname = txtuname.Text.Trim();

                    MailMessage mm = new MailMessage("kduonlinecms@gmail.com", email);//(your gmail,receiver gmail)
                    mm.Subject = "KDU CMS | Registration Success!";  //Subject
                    mm.Body = "<b>" + "Dear " + txtuname.Text.Trim() + "," + "</b> <br>" + "You have registered on KDU Online Channelling and Management System." + "<br> <br>" + "<table>" + "<tr>" + "<td>" + "Your Username " + "</td>" + "<td>" + "<b>" + uname + "</b>" + "</td>" + "</tr>" + "</table>" + "<br> <br>" + "<i>" + "Important! Keep your username and password in a secure place." + "</i>" + "<br> <br>" + "<table>" + "<tr>" + "<td>" + "<img src=\"https://preview.ibb.co/kaGrEf/logo.png\" width=\"50px\">" + "&nbsp; &nbsp;" + "</td>" + "<td>" + "<b>" + "KDU Channeling Center," + "<br>" + "General Sir John Kotelawala Defence University," + "<br>" + "Southern Campus," + "<br>" + "Sooriyawewa." + "<br>" + "+94718810575" + "</b>" + "</td>" + "</tr>" + "</table>"; //Message

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

                    //---------------------------------End Email

                    txtuname.Text = "";
                    txtpassword.Text = "";
                    txtemail.Text = "";
                    txtconfirmpassword.Text = "";
                    Response.Write("<script language=javascript>alert('SUCCESSFULLY REGISTERED!!!')</script>");
                    Response.Redirect("~/Account/Login.aspx");

                }
                else {
                    string ss = "PASSWORD SHOULD BE INCLUDED LOWER CASES AND UPPER CASES";
                    lbl1.Visible = true;
                    lbl1.Text = ss;
                }

            }
            else
            {
                string ss = "Password Length should be in 8 to 15";
                lbl1.Visible = true;
                lbl1.Text = ss;
            }
            //bool isValid = meetsLengthRequirements
            //            && hasUpperCaseLetter
            //            && hasLowerCaseLetter
            //            && hasDecimalDigit
            //            ;

           // if (isValid == true)
           // {


            //string pa = "patient";
            //dw.SetCommand("INSERT INTO namal(User_ID,User_name,Password,E_mail,Type) VALUES (@uid,@uname,@pass,@email,@type)");
            //dw.SetSqlCommandParameters("uid", count.ToString());
            //dw.SetSqlCommandParameters("uname", txtuname.Text.Trim());
            //dw.SetSqlCommandParameters("pass", txtpassword.Text.Trim());
            //dw.SetSqlCommandParameters("email", txtemail.Text.Trim());
            //dw.SetSqlCommandParameters("type", pa);
            //dw.Insert();

            ////Email Start......................................................

            //string email = txtemail.Text.Trim();
            //string pass = txtpassword.Text.Trim();
            //string uname = txtuname.Text.Trim();

            //MailMessage mm = new MailMessage("kduonlinecms@gmail.com", email);//(your gmail,receiver gmail)
            //mm.Subject = "KDU CMS | Registration Success!";  //Subject
            //mm.Body = "<b>" + "Dear " + txtuname.Text.Trim() + "," + "</b> <br>" + "You have registered on KDU Online Channelling and Management System." + "<br> <br>" + "<table>" + "<tr>" + "<td>" + "Your Username " + "</td>" + "<td>" + "<b>" + uname + "</b>" + "</td>" + "</tr>" + "</table>" + "<br> <br>" + "<i>" + "Important! Keep your username and password in a secure place." + "</i>" + "<br> <br>" + "<table>" + "<tr>" + "<td>" + "<img src=\"https://preview.ibb.co/kaGrEf/logo.png\" width=\"50px\">" + "&nbsp; &nbsp;" + "</td>" + "<td>" + "<b>" + "KDU Channeling Center," + "<br>" + "General Sir John Kotelawala Defence University," + "<br>" + "Southern Campus," + "<br>" + "Sooriyawewa." + "<br>" + "+94718810575" + "</b>" + "</td>" + "</tr>" + "</table>"; //Message

            ////+"<table>"+
            ////    "<tr>"+
            ////        "<td>" + "Your Channel Number " + "</td>" +
            ////        "<td>" + "<b>" + channelno + "</b>" + "</td>" +
            ////    "</tr>"+
            ////    "<tr>" +
            ////        "<td>" + "Your Reserved Date " + "</td>" +
            ////        "<td>" + "<b>" + TextBox3.Text.Trim() + "</b>" + "</td>" +
            ////    "</tr>" +
            ////    "<tr>" +
            ////        "<td>" + "Doctor " + "</td>" +
            ////        "<td>" + "<b>" + TextBox2.Text.Trim() + "</b>" + "</td>" +
            ////    "</tr>" +
            ////    "<tr>" +
            ////        "<td>" + "Specialization " +"</td>" +
            ////        "<td>" + "<b>" + TextBox4.Text.Trim() + "</b>" + "</td>" +
            ////    "</tr>" +
            ////"</table>"+

            ////+"<table>" +
            ////    "<tr>" +
            ////        "<td>" + "<img src=\"https://preview.ibb.co/kaGrEf/logo.png\" width=\"50px\">" + "&nbsp; &nbsp;" + "</td>" +
            ////        "<td>" + "<b>" + "KDU Channeling Center,"+"<br>"+"General Sir John Kotelawala Defence University,"+"<br>"+"Southern Campus,"+"<br>"+"Sooriyawewa."+"<br>"+"+94718810575"+"</b>" + "</td>" +
            ////    "</tr>" +
            ////"</table>" +

            //mm.IsBodyHtml = true;
            //SmtpClient smtp = new SmtpClient();
            //smtp.Host = "smtp.gmail.com";
            //smtp.EnableSsl = true;
            //NetworkCredential networkcred = new NetworkCredential("kduonlinecms@gmail.com", "KDU123cms");//(your gmail & gmail password)
            //smtp.UseDefaultCredentials = true;
            //smtp.Credentials = networkcred;
            //smtp.Port = 587;
            //smtp.Send(mm);

            ////---------------------------------End Email

            //txtuname.Text = "";
            //txtpassword.Text = "";
            //txtemail.Text = "";
            //txtconfirmpassword.Text = "";
            //Response.Write("<script language=javascript>alert('SUCCESSFULLY REGISTERED!!!')</script>");
            //Response.Redirect("~/Account/Login.aspx");
           // }
          //  else {
             //   Response.Write("<script language=javascript>alert('PASSWORD IS NOT STRONG!!!!')</script>");

       //     }

        }
        else
        {
            string ss = "PASSWORDS ARE NOT MATCHING!!!!";
            lbl2.Visible = true;
            lbl2.Text = ss;
        }
        }
        else
        {
            string ss = "THIS USER NAME ALREADY IN USE";
            lbl3.Visible = true;
            lbl3.Text = ss;
        }
    }
    protected void txtuname_TextChanged(object sender, EventArgs e)
    {
        txtpassword.Focus();
    }
    protected void txtpassword_TextChanged(object sender, EventArgs e)
    {
        txtconfirmpassword.Focus();
    }
    protected void txtconfirmpassword_TextChanged(object sender, EventArgs e)
    {
        txtemail.Focus();
    }
    protected void txtemail_TextChanged(object sender, EventArgs e)
    {
        btnreg_Click(sender, e);
    }
}