using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : MasterPage
{
    string uname = "";
    string uid = "";
    string pid = "";

    private const string AntiXsrfTokenKey = "__AntiXsrfToken";
    private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
    private string _antiXsrfTokenValue;

    protected void Page_Init(object sender, EventArgs e)
    {
        // The code below helps to protect against XSRF attacks
        var requestCookie = Request.Cookies[AntiXsrfTokenKey];
        Guid requestCookieGuidValue;
        if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
        {
            // Use the Anti-XSRF token from the cookie
            _antiXsrfTokenValue = requestCookie.Value;
            Page.ViewStateUserKey = _antiXsrfTokenValue;
        }
        else
        {
            // Generate a new Anti-XSRF token and save to the cookie
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
            Page.ViewStateUserKey = _antiXsrfTokenValue;

            var responseCookie = new HttpCookie(AntiXsrfTokenKey)
            {
                HttpOnly = true,
                Value = _antiXsrfTokenValue
            };
            if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
            {
                responseCookie.Secure = true;
            }
            Response.Cookies.Set(responseCookie);
        }

        Page.PreLoad += master_Page_PreLoad;
    }

    void master_Page_PreLoad(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Set Anti-XSRF token
            ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
            ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
        }
        else
        {
            // Validate the Anti-XSRF token
            if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
            {
                throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        uid = Session["User_ID"].ToString();
        uname = Session["User_name"].ToString();
        pid = Session["Patient_ID"].ToString();
        lblUserName.Text = uname;
        String utype = Session["type"].ToString();

        switch (utype)
        {
            case "doctor":
                btnAppointment.PostBackUrl = "~/User/Doctor/Appointments.aspx";
                btnDashboard.PostBackUrl = "~/User/Doctor/Dashboard.aspx";
                btnProfile.PostBackUrl = "~/User/Doctor/Profile.aspx";
                btnAccount.PostBackUrl = "~/User/Doctor/Account.aspx";
                break;
            case "patient":
                btnAppointment.PostBackUrl = "~/User/Patient/Appointments.aspx";
                btnDashboard.PostBackUrl = "~/User/Patient/Dashboard.aspx";
                btnProfile.PostBackUrl = "~/User/Patient/Profile.aspx";
                btnAccount.Visible = false;
                //btnAccount.PostBackUrl = "~/User/Patient/Account.aspx";
                //Response.Redirect("~/Default.aspx");
                break;
            case "admin":
                btnSearch.PostBackUrl = "~/User/Admin/AdminDefault.aspx";
                btnAppointment.PostBackUrl = "~/User/Admin/Appointments.aspx";
                btnDashboard.PostBackUrl = "~/User/Admin/Dashboard.aspx";
                btnProfile.PostBackUrl = "~/User/Admin/Profile.aspx";
                btnAccount.PostBackUrl = "~/User/Admin/Account.aspx";
                break;
            case "nurse":
                btnSearch.PostBackUrl = "~/User/Nurse/NurseDefault.aspx";
                btnAppointment.PostBackUrl = "~/User/Nurse/Appointments.aspx";
                btnDashboard.PostBackUrl = "~/User/Nurse/Dashboard.aspx";
                btnProfile.PostBackUrl = "~/User/Nurse/Profile.aspx";
                btnAccount.PostBackUrl = "~/User/Nurse/Account.aspx";
                break;
        }
    }
    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        String utype = Session["type"].ToString();

        if (btnDashboard.Visible == false) {
            SideMenu.Width = "10%";
            btnDashboard.Visible = true;
            btnProfile.Visible = true;
            //btnAccount.Visible = false;
            btnAppointment.Visible = true;
            btnBack.Visible = true;

            switch (utype)
            {
                case "doctor":
                    btnAccount.Visible = true;
                    break;
                case "patient":
                    btnAccount.Visible = false;
                    break;
                case "admin":
                    btnSearch.Visible = true;
                    btnAccount.Visible = true;
                    break;
                case "nurse":
                    btnSearch.Visible = true;
                    btnAccount.Visible = true;
                    break;
            }
        }
        else if (btnDashboard.Visible == true)
        {
            btnDashboard.Visible = false;
            btnProfile.Visible = false;
            //btnAccount.Visible = false;
            btnAppointment.Visible = false;
            btnBack.Visible = false;
            SideMenu.Width = "3%";

            switch (utype)
            {
                case "doctor":
                    btnAccount.Visible = false;
                    break;
                case "patient":
                    btnAccount.Visible = false;
                    break;
                case "admin":
                    btnSearch.Visible = false;
                    btnAccount.Visible = false;
                    break;
                case "nurse":
                    btnSearch.Visible = false;
                    btnAccount.Visible = false;
                    break;
            }
        }
        
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/Default.aspx");
    }


}