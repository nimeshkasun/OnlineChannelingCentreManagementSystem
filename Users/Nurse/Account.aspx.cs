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

public partial class User_Admin_Profile : System.Web.UI.Page
{
    string uname = "";
    string uid = "";
    string pid = "";
    string count = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            uid = Session["User_ID"].ToString();
            uname = Session["User_name"].ToString();
            pid = Session["Patient_ID"].ToString();

        }
        catch
        {
            Response.Redirect("~/Account/Login.aspx");
        }
        
    }

   

    public Control UP { get; set; }
    
    
    

    

    protected void Button1_Click(object sender, EventArgs e)
    {
        // Start ==================================================

        string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
        DataWorksClass dw = new DataWorksClass(constring);

        int message = 0;
        try
        {
            // Doctor Table ====================================================================================

            dw.SetDataAdapter(@"select * from Nurse where User_ID='" + uid + "' ");
            DataTable dt = dw.GetDataTable();

            string name = (dt.Rows[0][8].ToString()).Trim() + " " + (dt.Rows[0][9].ToString()).Trim();
            lblName.Text = name; //Name
            lblPhn.Text = "User " + (dt.Rows[0][1].ToString()).Trim(); //UID

            TextBox1.Text = (dt.Rows[0][8].ToString()).Trim(); //Fname
            TextBox2.Text = (dt.Rows[0][9].ToString()).Trim(); //Lname

            DropDownList12.SelectedValue = (dt.Rows[0][4].ToString()).Trim(); //Trained_area
            DropDownList13.SelectedValue = (dt.Rows[0][3].ToString()).Trim(); //Hospital
            TextBox14.Text = (dt.Rows[0][5].ToString()).Trim(); //Salary
        }catch{}
        

        try{
            // Namal Table ====================================================================================

            dw.SetDataAdapter(@"select * from namal where User_ID='" + uid + "' ");
            DataTable dt = dw.GetDataTable();

            H1.Value = (dt.Rows[0][7].ToString()).Trim(); //Title
            int a = Int32.Parse(H1.Value);
            DropDownList1.SelectedIndex = a;

            H1.Value = (dt.Rows[0][6].ToString()).Trim(); //gender
            int b = Int32.Parse(H1.Value);
            DropDownList11.SelectedIndex = b;

            DropDownList3.SelectedValue = (dt.Rows[0][10].ToString()).Trim(); //date
           

            DropDownList4.SelectedValue = (dt.Rows[0][11].ToString()).Trim(); //month
            

            DropDownList5.SelectedValue = (dt.Rows[0][9].ToString()).Trim(); //year
            

            TextBox3.Text = (dt.Rows[0][12].ToString()).Trim(); //nic
            TextBox4.Text = (dt.Rows[0][8].ToString()).Trim(); //passport

            message = 1;
        }catch{}

        try{
            dw.SetDataAdapter(@"select * from namal where User_ID='" + uid + "' ");
            DataTable dt = dw.GetDataTable();

            TextBox7.Text = (dt.Rows[0][5].ToString()).Trim(); //mobile
            TextBox8.Text = (dt.Rows[0][4].ToString()).Trim(); //home
            TextBox9.Text = (dt.Rows[0][13].ToString()).Trim(); //office
            TextBox10.Text = (dt.Rows[0][3].ToString()).Trim(); //address

            H1.Value = (dt.Rows[0][14].ToString()).Trim(); //country
            int h = Int32.Parse(H1.Value);
            DropDownList7.SelectedIndex = h;

            H1.Value = (dt.Rows[0][15].ToString()).Trim(); //province
            int i = Int32.Parse(H1.Value);
            DropDownList6.SelectedIndex = i;

            TextBox11.Text = (dt.Rows[0][16].ToString()).Trim(); //zip
            TextBox12.Text = (dt.Rows[0][21].ToString()).Trim(); //EmName
            TextBox13.Text = (dt.Rows[0][22].ToString()).Trim(); //EmConMob

            message = 1;
        }catch{}
        try{

            if (lblName.Text != "")
            {
                //Response.Write("<script language=javascript>alert('Search Success!')</script>");
               
                message = 0;
            }
            else
            {
                Response.Write("<script language=javascript>alert('No Records Found!')</script>");
                message = 0;

                lblName.Text = "N/A";
                lblPhn.Text = "N/A";
                DropDownList1.SelectedIndex = 0;
                TextBox1.Text = "";
                TextBox2.Text = "";
                DropDownList11.SelectedIndex = 0;
                DropDownList3.SelectedIndex = 0;
                DropDownList4.SelectedIndex = 0;
                DropDownList5.SelectedIndex = 0;
                TextBox3.Text = "";
                TextBox4.Text = "";
                DropDownList12.SelectedIndex = 0;
                DropDownList13.SelectedIndex = 0;
                TextBox7.Text = "";
                TextBox8.Text = "";
                TextBox9.Text = "";
                TextBox10.Text = "";
                DropDownList7.SelectedIndex = 0;
                DropDownList6.SelectedIndex = 0;
                TextBox11.Text = "";
                TextBox12.Text = "";
                TextBox13.Text = "";
                TextBox14.Text = "";
            }

        }
        catch (Exception ex)
        {
            if (message == 1)
            {
                Response.Write("<script language=javascript>alert('Modification Needed!')</script>");
                
            }
            else
            {
                Response.Write("<script language=javascript>alert('Invalid Entry!')</script>");

                lblName.Text = "N/A";
                lblPhn.Text = "N/A";
                DropDownList1.SelectedIndex = 0;
                TextBox1.Text = "";
                TextBox2.Text = "";
                DropDownList11.SelectedIndex = 0;
                DropDownList3.SelectedIndex = 0;
                DropDownList4.SelectedIndex = 0;
                DropDownList5.SelectedIndex = 0;
                TextBox3.Text = "";
                TextBox4.Text = "";
                DropDownList12.SelectedIndex = 0;
                DropDownList13.SelectedIndex = 0;
                TextBox7.Text = "";
                TextBox8.Text = "";
                TextBox9.Text = "";
                TextBox10.Text = "";
                DropDownList7.SelectedIndex = 0;
                DropDownList6.SelectedIndex = 0;
                TextBox11.Text = "";
                TextBox12.Text = "";
                TextBox13.Text = "";
                TextBox14.Text = "";
            }
        }

        // end ==========================================
    }

   

    protected void btnPP_Click(object sender, EventArgs e)
    {
        string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
        DataWorksClass dw = new DataWorksClass(constring);
        dw.SetDataAdapter(@"SELECT * FROM Nurse WHERE User_ID='" + uid + "' ");
        DataTable dt = dw.GetDataTable();

        if (dw != null)
        {
            try
            {
                dw.SetCommand(@"UPDATE Nurse SET Working_hospital=@Working_hospital,Trained_area=@Trained_area,Salary=@Salary,First_name=@First_name,Last_name=@Last_name where User_ID='" + uid + "' ");
                dw.SetSqlCommandParameters("@Working_hospital", DropDownList13.SelectedValue.Trim());
                dw.SetSqlCommandParameters("@Trained_area", DropDownList12.SelectedValue.Trim());
                dw.SetSqlCommandParameters("@Salary", TextBox14.Text.Trim());
                dw.SetSqlCommandParameters("@First_name", TextBox1.Text.Trim());
                dw.SetSqlCommandParameters("@Last_name", TextBox2.Text.Trim());
                dw.Update();

                dw.SetCommand(@"UPDATE namal SET Title=@Title,Gender=@Gender,DOBy=@DOBy,DOBd=@DOBd,DOBm=@DOBm,NIC=@NIC,PassportN=@PassportN where User_ID='" + uid + "' ");
                dw.SetSqlCommandParameters("@Title", DropDownList1.SelectedValue.Trim());
                dw.SetSqlCommandParameters("@Gender", DropDownList11.SelectedValue.Trim());
                dw.SetSqlCommandParameters("@DOBy", DropDownList5.SelectedValue.Trim());
                dw.SetSqlCommandParameters("@DOBd", DropDownList3.SelectedValue.Trim());
                dw.SetSqlCommandParameters("@DOBm", DropDownList4.SelectedValue.Trim());
                dw.SetSqlCommandParameters("@NIC", TextBox3.Text.Trim());
                dw.SetSqlCommandParameters("@PassportN", TextBox4.Text.Trim());
                dw.Update();


                Response.Write("<script language=javascript>alert('Update Success!')</script>");
            }
            catch (Exception)
            {
                Response.Write("<script language=javascript>alert('Updation Failed!')</script>");
            }
        }
        else
        {
            Response.Write("<script language=javascript>alert('No Records Found!')</script>");
        }
    }

    private string cPass;
    protected void Button3_Click2(object sender, EventArgs e)
    {
        
        try
        {
            
            string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
            DataWorksClass dw = new DataWorksClass(constring);
            dw.SetDataAdapter(@"select * from namal where User_ID='" + uid + "' ");
            DataTable dt = dw.GetDataTable();

             cPass= (dt.Rows[0][2].ToString()).Trim(); //current pass
            string newPass=TextBox17.Text.Trim();
            string newPassConf=TextBox18.Text.Trim();

            if (TextBox16.Text.Trim() == cPass )
            {
                if(newPass == newPassConf){

                dw.SetCommand(@"UPDATE namal SET Password=@Password where User_ID='" + uid + "' ");
                dw.SetSqlCommandParameters("@Password", TextBox17.Text.Trim());
                dw.Update();

                Label32.Text = "";
                Label33.Text = "";

                //Email Start......................................................

                dw.SetCommand("SELECT E_mail FROM namal WHERE User_ID = @uid");
                    dw.SetSqlCommandParameters("uid", uid);
                    string email = dw.GetSingleData().Trim();
                    string npass = TextBox17.Text.Trim();

                    dw.SetCommand("SELECT First_name FROM Nurse WHERE User_ID = @uid");
                    dw.SetSqlCommandParameters("uid", uid);
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

                    //Response.Write("<script language=javascript>alert('BOOKING SUCCESSFULL! CHECK YOUR EMAILS!')</script>");
                    Response.Redirect("~/User/Doctor/Account.aspx");

                    //---------------------------------End Email

                }else{
                    Label33.Text = "";
                    Label32.Text = "Password does not match!";
                }
            }
            else {
                Label33.Text = "Incorrect Password!";
                Label32.Text = "";
            }

        }
        catch { }
    }

    protected void Button2_Click1(object sender, EventArgs e)
    {
        string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
        DataWorksClass dw = new DataWorksClass(constring);

        dw.SetCommand(@"UPDATE namal SET Mobile_number=@Mobile_number,Home_telephone_number=@Home_telephone_number,office_number=@office_number,Address=@Address,Country=@Country,Province=@Province,ZIPcode=@ZIPcode,EmName=@EmName,EmConMob=@EmConMob where User_ID='" + uid + "' ");
        dw.SetSqlCommandParameters("@Mobile_number", TextBox7.Text.Trim());
        dw.SetSqlCommandParameters("@Home_telephone_number", TextBox8.Text.Trim());
        dw.SetSqlCommandParameters("@office_number", TextBox9.Text.Trim());
        dw.SetSqlCommandParameters("@Address", TextBox10.Text.Trim());
        dw.SetSqlCommandParameters("@Country", DropDownList7.SelectedIndex);
        dw.SetSqlCommandParameters("@Province", DropDownList6.SelectedIndex);
        dw.SetSqlCommandParameters("@ZIPcode", TextBox11.Text.Trim());
        dw.SetSqlCommandParameters("@EmName", TextBox12.Text.Trim());
        dw.SetSqlCommandParameters("@EmConMob", TextBox13.Text.Trim());
        dw.Update();
    }
}
