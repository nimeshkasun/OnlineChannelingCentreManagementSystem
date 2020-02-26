using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Admin_Dashboard : System.Web.UI.Page
{
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
            
            TextBox1.Text = ApptP_ID.Trim();
            TextBox4.Text = ApptP_ID.Trim();
            TextBox14.Text = ApptP_ID.Trim();
            TextBox15.Text = ApptP_ID.Trim();
            
        }
        catch {
            Response.Redirect("~/User/Nurse/NurseDefault.aspx");
        }
        // Start ==================================================

        string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
        DataWorksClass dw = new DataWorksClass(constring);


        int message = 0;
        try
        {
            // Patient Table ====================================================================================
            
                dw.SetDataAdapter(@"select * from patient where Patient_ID='" + ApptP_ID + "' ");
                DataTable dt = dw.GetDataTable();

                string name = (dt.Rows[0][3].ToString()).Trim() + " " + (dt.Rows[0][4].ToString()).Trim();
                lblName.Text = name; //Name
                lblPhn.Text = "User " + (dt.Rows[0][1].ToString()).Trim(); //UID
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
                TextBox24.Text = lblPatBloodGrp.Text;

                H1.Value = (dt.Rows[0][9].ToString()).Trim(); //smoke
                string j = H1.Value;
                DropDownList8.SelectedValue = j;
                lblSmoke.Text = DropDownList8.SelectedValue;

                H1.Value = (dt.Rows[0][10].ToString()).Trim(); //AlPeriod
                string k = H1.Value;
                DropDownList9.SelectedValue = k;
                lblAlcohol.Text = DropDownList9.SelectedValue;

                lblWatInt.Text = (dt.Rows[0][11].ToString()).Trim(); //WaterIntake
            
            // Namal Table ====================================================================================
            
                dw.SetDataAdapter(@"select * from namal where User_ID='" + ApptU_ID + "' ");
                dt = dw.GetDataTable();

                H1.Value = (dt.Rows[0][9].ToString()).Trim(); //year
                string f = H1.Value;
                DropDownList5.SelectedValue = f;
                int age = 2018 - Int32.Parse(DropDownList5.SelectedValue);
                lblPatAge.Text = age.ToString();

                lblPatNic.Text = (dt.Rows[0][12].ToString()).Trim(); //nic

                message = 1;

                lblPatConMob.Text = (dt.Rows[0][5].ToString()).Trim(); //mobile
                lblPatConHom.Text = (dt.Rows[0][4].ToString()).Trim(); //home

                message = 1;
            

        }
        catch (Exception ex)
        {

        }

        // end ==========================================


    }

    

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string a = GridView1.SelectedRow.Cells[5].Text.Trim();
        string repid = GridView1.SelectedRow.Cells[0].Text.Trim();
        Session["lab_id"] = repid;
        //Session["ApptPat_ID"] = a;
        
        string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
        DataWorksClass dw = new DataWorksClass(constring);
        switch (a) { 
            case "Blood":
                btnBloodInsert.Visible = false;
                Button6.Visible = true;
                TextBox1.Text = ApptP_ID;
                TextBox24.Text = lblPatBloodGrp.Text;

                //Clear previous records
                DropDownList1.SelectedIndex = 0;
                DropDownList3.SelectedIndex = 0;
                DropDownList4.SelectedIndex = 0;
                DropDownList6.SelectedIndex = 88;
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
                TextBox8.Text = "";
                TextBox7.Text = "";

                //string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
                //DataWorksClass dw = new DataWorksClass(constring);

                try
                {
                    dw.SetDataAdapter(@"select * from Labreport where Lab_report_ID='" + repid + "' ");
                    DataTable dt = dw.GetDataTable();
                    DropDownList1.SelectedValue = (dt.Rows[0][1].ToString()).Trim();
                    DropDownList3.SelectedValue = (dt.Rows[0][3].ToString()).Trim();
                    DropDownList4.SelectedValue = (dt.Rows[0][4].ToString()).Trim();
                    DropDownList6.SelectedValue = (dt.Rows[0][5].ToString()).Trim();
                }
                catch { }

                try
                {
                    dw.SetDataAdapter(@"select * from Bloodreport where Lab_report_ID='" + repid + "' ");
                    DataTable dt = dw.GetDataTable();
                    TextBox2.Text = (dt.Rows[0][2].ToString()).Trim();
                    TextBox3.Text = (dt.Rows[0][3].ToString()).Trim();
                    TextBox5.Text = (dt.Rows[0][4].ToString()).Trim();
                    TextBox6.Text = (dt.Rows[0][6].ToString()).Trim();
                    TextBox8.Text = (dt.Rows[0][7].ToString()).Trim();
                    TextBox7.Text = (dt.Rows[0][8].ToString()).Trim();
                }
                catch { }
                this.ModalPopupExtender1.Show();
                break;

            case "Cholestrol":
                Button10.Visible = false;
                Button11.Visible = true;
                TextBox4.Text = ApptP_ID;

                //Clear previous records
                DropDownList7.SelectedIndex = 0;
                DropDownList10.SelectedIndex = 0;
                DropDownList11.SelectedIndex = 0;
                DropDownList12.SelectedIndex = 88;
                TextBox9.Text = "";
                TextBox10.Text = "";
                TextBox11.Text = "";
                TextBox12.Text = "";
                TextBox13.Text = "";
                TextBox19.Text = "";

                //string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
                //DataWorksClass dw = new DataWorksClass(constring);

                try
                {
                    dw.SetDataAdapter(@"select * from Labreport where Lab_report_ID='" + repid + "' ");
                    DataTable dt = dw.GetDataTable();
                    DropDownList7.SelectedValue = (dt.Rows[0][1].ToString()).Trim();
                    DropDownList10.SelectedValue = (dt.Rows[0][3].ToString()).Trim();
                    DropDownList11.SelectedValue = (dt.Rows[0][4].ToString()).Trim();
                    DropDownList12.SelectedValue = (dt.Rows[0][5].ToString()).Trim();
                }
                catch { }

                try
                {
                    dw.SetDataAdapter(@"select * from Colestoroll where Lab_report_ID='" + repid + "' ");
                    DataTable dt = dw.GetDataTable();
                    TextBox9.Text = (dt.Rows[0][2].ToString()).Trim();
                    TextBox10.Text = (dt.Rows[0][3].ToString()).Trim();
                    TextBox11.Text = (dt.Rows[0][4].ToString()).Trim();
                    TextBox12.Text = (dt.Rows[0][5].ToString()).Trim();
                    TextBox13.Text = (dt.Rows[0][6].ToString()).Trim();
                    TextBox19.Text = (dt.Rows[0][8].ToString()).Trim();
                }
                catch { }
                this.ModalPopupExtender2.Show();
                break;

            case "Urine":
                Button12.Visible = false;
                Button13.Visible = true;
                TextBox15.Text = ApptP_ID;

                //Clear previous records
                DropDownList13.SelectedIndex = 0;
                DropDownList14.SelectedIndex = 0;
                DropDownList15.SelectedIndex = 0;
                DropDownList16.SelectedIndex = 88;
                TextBox16.Text = "";
                TextBox17.Text = "";
                TextBox18.Text = "";
                TextBox20.Text = "";
                TextBox23.Text = "";

                //string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
                //DataWorksClass dw = new DataWorksClass(constring);

                try
                {
                    dw.SetDataAdapter(@"select * from Labreport where Lab_report_ID='" + repid + "' ");
                    DataTable dt = dw.GetDataTable();
                    DropDownList13.SelectedValue = (dt.Rows[0][1].ToString()).Trim();
                    DropDownList14.SelectedValue = (dt.Rows[0][3].ToString()).Trim();
                    DropDownList15.SelectedValue = (dt.Rows[0][4].ToString()).Trim();
                    DropDownList16.SelectedValue = (dt.Rows[0][5].ToString()).Trim();
                }
                catch { }

                try
                {
                    dw.SetDataAdapter(@"select * from Urinereport where Lab_report_ID='" + repid + "' ");
                    DataTable dt = dw.GetDataTable();
                    TextBox16.Text = (dt.Rows[0][2].ToString()).Trim();
                    TextBox17.Text = (dt.Rows[0][3].ToString()).Trim();
                    TextBox18.Text = (dt.Rows[0][4].ToString()).Trim();
                    TextBox20.Text = (dt.Rows[0][5].ToString()).Trim();
                    TextBox23.Text = (dt.Rows[0][7].ToString()).Trim();
                }
                catch { }
                this.ModalPopupExtender3.Show();
                break;
        }
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        btnBloodInsert.Visible = true;
        Button6.Visible = false;
        TextBox1.Text = ApptP_ID;
        DropDownList1.SelectedIndex = 0;
        DropDownList3.SelectedIndex = 0;
        DropDownList4.SelectedIndex = 0;
        DropDownList6.SelectedIndex = 88;
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        TextBox8.Text = "";
        TextBox7.Text = "";
        ModalPopupExtender1.Show();
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        try
        {
            string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
            DataWorksClass dw = new DataWorksClass(constring);
            dw.SetCommand("SELECT MAX(Lab_report_ID) FROM Labreport");
            int labid = Convert.ToInt32(dw.GetSingleData()) + 1;
            dw.SetCommand("SELECT MAX(Blood_report_ID) FROM Bloodreport");
            int bloodrepid = Convert.ToInt32(dw.GetSingleData()) + 1;

            dw.SetCommand("INSERT INTO Labreport(Lab_report_ID,Medical_officer,Patient_ID ,Issue_date,Issue_month,Issue_year,Report_type) VALUES(@lid,@moff,@pid,@isd,@ism,@isy,@rtype)");

            dw.SetSqlCommandParameters("lid", labid);
            dw.SetSqlCommandParameters("moff", DropDownList1.SelectedValue);
            dw.SetSqlCommandParameters("pid", ApptP_ID);
            dw.SetSqlCommandParameters("isd", DropDownList3.SelectedValue);
            dw.SetSqlCommandParameters("ism", DropDownList4.SelectedValue);
            dw.SetSqlCommandParameters("isy", DropDownList6.SelectedValue);
            dw.SetSqlCommandParameters("rtype", "Blood");
            dw.Insert();

            dw.SetCommand("INSERT INTO Bloodreport(Blood_report_ID ,Lab_report_ID,Red_blood_cells,White_blood_cells,Glucose,Blood_type,Hemoglobin,Platelets,Other) VALUES(@bid,@lid,@redbcell,@whitebcell ,@glu,@btype,@hemog,@plate,@other)");

            dw.SetSqlCommandParameters("bid", bloodrepid);
            dw.SetSqlCommandParameters("lid", labid);
            dw.SetSqlCommandParameters("redbcell", TextBox2.Text.Trim());
            dw.SetSqlCommandParameters("whitebcell", TextBox3.Text.Trim());
            dw.SetSqlCommandParameters("glu", TextBox5.Text.Trim());
            dw.SetSqlCommandParameters("btype", TextBox24.Text.Trim());
            dw.SetSqlCommandParameters("hemog", TextBox6.Text.Trim());
            dw.SetSqlCommandParameters("plate", TextBox8.Text.Trim());
            dw.SetSqlCommandParameters("other", TextBox7.Text.Trim());
            dw.Insert();
            Response.Redirect("~/User/Nurse/Dashboard.aspx");
        }
        catch { 
        
        }
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        try
        {
            string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
            DataWorksClass dw = new DataWorksClass(constring);
            string labid = Session["lab_id"].ToString();

            dw.SetCommand("UPDATE Labreport SET Medical_officer=@moff, Patient_ID=@pid, Issue_date=@isd, Issue_month=@ism, Issue_year=@isy, Report_type=@rtype WHERE Lab_report_ID='" + labid + "'");

            //dw.SetSqlCommandParameters("lid", labid);
            dw.SetSqlCommandParameters("moff", DropDownList1.SelectedValue);
            dw.SetSqlCommandParameters("pid", ApptP_ID);
            dw.SetSqlCommandParameters("isd", DropDownList3.SelectedValue);
            dw.SetSqlCommandParameters("ism", DropDownList4.SelectedValue);
            dw.SetSqlCommandParameters("isy", DropDownList6.SelectedValue);
            dw.SetSqlCommandParameters("rtype", "Blood");
            dw.Update();

            dw.SetCommand("UPDATE Bloodreport SET Red_blood_cells=@redbcell, White_blood_cells=@whitebcell, Glucose=@glu, Blood_type=@btype, Hemoglobin=@hemog, Platelets=@plate, Other=@other WHERE  Lab_report_ID='" + labid + "'");

            dw.SetSqlCommandParameters("redbcell", TextBox2.Text.Trim());
            dw.SetSqlCommandParameters("whitebcell", TextBox3.Text.Trim());
            dw.SetSqlCommandParameters("glu", TextBox5.Text.Trim());
            dw.SetSqlCommandParameters("btype", TextBox24.Text.Trim());
            dw.SetSqlCommandParameters("hemog", TextBox6.Text.Trim());
            dw.SetSqlCommandParameters("plate", TextBox8.Text.Trim());
            dw.SetSqlCommandParameters("other", TextBox7.Text.Trim());
            dw.Update();
            Response.Redirect("~/User/Nurse/Dashboard.aspx");
        }
        catch
        {

        }
    }

    protected void Button10_Click1(object sender, EventArgs e)
    {
        try
        {
            string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
            DataWorksClass dw = new DataWorksClass(constring);
            dw.SetCommand("SELECT MAX(Lab_report_ID) FROM Labreport");
            int labid = Convert.ToInt32(dw.GetSingleData()) + 1;
            dw.SetCommand("SELECT MAX(Colestoroll_ID) FROM Colestoroll");
            int cholid = Convert.ToInt32(dw.GetSingleData()) + 1;

            dw.SetCommand("INSERT INTO Labreport(Lab_report_ID,Medical_officer,Patient_ID ,Issue_date,Issue_month,Issue_year,Report_type) VALUES(@lid,@moff,@pid,@isd,@ism,@isy,@rtype)");

            dw.SetSqlCommandParameters("lid", labid);
            dw.SetSqlCommandParameters("moff", DropDownList7.SelectedValue);
            dw.SetSqlCommandParameters("pid", ApptP_ID);
            dw.SetSqlCommandParameters("isd", DropDownList10.SelectedValue);
            dw.SetSqlCommandParameters("ism", DropDownList11.SelectedValue);
            dw.SetSqlCommandParameters("isy", DropDownList12.SelectedValue);
            dw.SetSqlCommandParameters("rtype", "Cholestrol");
            dw.Insert();

            dw.SetCommand("INSERT INTO Colestoroll(Lab_report_ID ,Colestoroll_ID,LDL,HDL,Triglicerides,VLDL_Cholesterol,Total_Cholesterol,Pat_ID,Other) VALUES(@Lab_report_ID,@Colestoroll_ID,@LDL,@HDL ,@Triglicerides,@VLDL_Cholesterol,@Total_Cholesterol,@Pat_ID,@Other)");

            dw.SetSqlCommandParameters("Lab_report_ID", labid);
            dw.SetSqlCommandParameters("Colestoroll_ID", cholid);
            dw.SetSqlCommandParameters("LDL", TextBox9.Text.Trim());
            dw.SetSqlCommandParameters("HDL", TextBox10.Text.Trim());
            dw.SetSqlCommandParameters("Triglicerides", TextBox11.Text.Trim());
            dw.SetSqlCommandParameters("VLDL_Cholesterol", TextBox12.Text.Trim());
            dw.SetSqlCommandParameters("Total_Cholesterol", TextBox13.Text.Trim());
            dw.SetSqlCommandParameters("Pat_ID", TextBox4.Text.Trim());
            dw.SetSqlCommandParameters("Other", TextBox19.Text.Trim());
            dw.Insert();
            Response.Redirect("~/User/Nurse/Dashboard.aspx");
        }
        catch
        {

        }
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        Button10.Visible = true;
        Button11.Visible = false;
        TextBox4.Text = ApptP_ID;
        DropDownList7.SelectedIndex = 0;
        DropDownList10.SelectedIndex = 0;
        DropDownList11.SelectedIndex = 0;
        DropDownList12.SelectedIndex = 88;
        TextBox9.Text = "";
        TextBox10.Text = "";
        TextBox11.Text = "";
        TextBox12.Text = "";
        TextBox13.Text = "";
        TextBox19.Text = "";
        ModalPopupExtender2.Show();
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        try
        {
            string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
            DataWorksClass dw = new DataWorksClass(constring);
            string labid = Session["lab_id"].ToString();

            dw.SetCommand("UPDATE Labreport SET Medical_officer=@moff, Patient_ID=@pid, Issue_date=@isd, Issue_month=@ism, Issue_year=@isy, Report_type=@rtype WHERE Lab_report_ID='" + labid + "'");

            //dw.SetSqlCommandParameters("lid", labid);
            dw.SetSqlCommandParameters("moff", DropDownList7.SelectedValue);
            dw.SetSqlCommandParameters("pid", ApptP_ID);
            dw.SetSqlCommandParameters("isd", DropDownList10.SelectedValue);
            dw.SetSqlCommandParameters("ism", DropDownList11.SelectedValue);
            dw.SetSqlCommandParameters("isy", DropDownList12.SelectedValue);
            dw.SetSqlCommandParameters("rtype", "Cholestrol");
            dw.Update();

            dw.SetCommand("UPDATE Colestoroll SET LDL=@LDL, HDL=@HDL, Triglicerides=@Triglicerides, VLDL_Cholesterol=@VLDL_Cholesterol, Total_Cholesterol=@Total_Cholesterol, Other=@Other WHERE  Lab_report_ID='" + labid + "'");

            dw.SetSqlCommandParameters("LDL", TextBox9.Text.Trim());
            dw.SetSqlCommandParameters("HDL", TextBox10.Text.Trim());
            dw.SetSqlCommandParameters("Triglicerides", TextBox11.Text.Trim());
            dw.SetSqlCommandParameters("VLDL_Cholesterol", TextBox12.Text.Trim());
            dw.SetSqlCommandParameters("Total_Cholesterol", TextBox13.Text.Trim());
            dw.SetSqlCommandParameters("Other", TextBox19.Text.Trim());
            dw.Update();
            Response.Redirect("~/User/Nurse/Dashboard.aspx");
        }
        catch
        {

        }
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        Button12.Visible = true;
        Button13.Visible = false;
        TextBox15.Text = ApptP_ID;
        DropDownList13.SelectedIndex = 0;
        DropDownList14.SelectedIndex = 0;
        DropDownList15.SelectedIndex = 0;
        DropDownList16.SelectedIndex = 88;
        TextBox16.Text = "";
        TextBox17.Text = "";
        TextBox18.Text = "";
        TextBox20.Text = "";
        TextBox23.Text = "";
        ModalPopupExtender3.Show();
    }
    protected void Button12_Click(object sender, EventArgs e)
    {
        try
        {
            string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
            DataWorksClass dw = new DataWorksClass(constring);
            dw.SetCommand("SELECT MAX(Lab_report_ID) FROM Labreport");
            int labid = Convert.ToInt32(dw.GetSingleData()) + 1;
            dw.SetCommand("SELECT MAX(Urine_report_ID) FROM Urinereport");
            int urid = Convert.ToInt32(dw.GetSingleData()) + 1;

            dw.SetCommand("INSERT INTO Labreport(Lab_report_ID,Medical_officer,Patient_ID ,Issue_date,Issue_month,Issue_year,Report_type) VALUES(@lid,@moff,@pid,@isd,@ism,@isy,@rtype)");

            dw.SetSqlCommandParameters("lid", labid);
            dw.SetSqlCommandParameters("moff", DropDownList13.SelectedValue);
            dw.SetSqlCommandParameters("pid", ApptP_ID);
            dw.SetSqlCommandParameters("isd", DropDownList14.SelectedValue);
            dw.SetSqlCommandParameters("ism", DropDownList15.SelectedValue);
            dw.SetSqlCommandParameters("isy", DropDownList16.SelectedValue);
            dw.SetSqlCommandParameters("rtype", "Urine");
            dw.Insert();

            dw.SetCommand("INSERT INTO Urinereport(Urine_report_ID ,Lab_report_ID,Glucose,Protein,Crystal,Acidity,Pat_ID,Other) VALUES(@Urine_report_ID,@Lab_report_ID,@Glucose,@Protein,@Crystal,@Acidity,@Pat_ID,@Other)");

            dw.SetSqlCommandParameters("Urine_report_ID", urid);
            dw.SetSqlCommandParameters("Lab_report_ID", labid);
            dw.SetSqlCommandParameters("Glucose", TextBox16.Text.Trim());
            dw.SetSqlCommandParameters("Protein", TextBox17.Text.Trim());
            dw.SetSqlCommandParameters("Crystal", TextBox18.Text.Trim());
            dw.SetSqlCommandParameters("Acidity", TextBox20.Text.Trim());
            dw.SetSqlCommandParameters("Pat_ID", TextBox15.Text.Trim());
            dw.SetSqlCommandParameters("Other", TextBox13.Text.Trim());
            dw.Insert();
            Response.Redirect("~/User/Nurse/Dashboard.aspx");
        }
        catch
        {

        }
    }
    protected void Button13_Click(object sender, EventArgs e)
    {
        try
        {
            string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
            DataWorksClass dw = new DataWorksClass(constring);
            string labid = Session["lab_id"].ToString();

            dw.SetCommand("UPDATE Labreport SET Medical_officer=@moff, Patient_ID=@pid, Issue_date=@isd, Issue_month=@ism, Issue_year=@isy, Report_type=@rtype WHERE Lab_report_ID='" + labid + "'");

            //dw.SetSqlCommandParameters("lid", labid);
            dw.SetSqlCommandParameters("moff", DropDownList13.SelectedValue);
            dw.SetSqlCommandParameters("pid", ApptP_ID);
            dw.SetSqlCommandParameters("isd", DropDownList14.SelectedValue);
            dw.SetSqlCommandParameters("ism", DropDownList15.SelectedValue);
            dw.SetSqlCommandParameters("isy", DropDownList16.SelectedValue);
            dw.SetSqlCommandParameters("rtype", "Urine");
            dw.Update();

            dw.SetCommand("UPDATE Urinereport SET Glucose=@Glucose, Protein=@Protein, Crystal=@Crystal, Acidity=@Acidity, Other=@Other WHERE  Lab_report_ID='" + labid + "'");

            dw.SetSqlCommandParameters("Glucose", TextBox16.Text.Trim());
            dw.SetSqlCommandParameters("Protein", TextBox17.Text.Trim());
            dw.SetSqlCommandParameters("Crystal", TextBox18.Text.Trim());
            dw.SetSqlCommandParameters("Acidity", TextBox20.Text.Trim());
            dw.SetSqlCommandParameters("Other", TextBox23.Text.Trim());
            dw.Update();
            Response.Redirect("~/User/Nurse/Dashboard.aspx");
        }
        catch
        {

        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox1.Text = ApptP_ID;
    }
    protected void Button17_Click(object sender, EventArgs e)
    {
        try
        {
            DateTime date = DateTime.Now;
            string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
            DataWorksClass dw = new DataWorksClass(constring);
            dw.SetCommand("SELECT MAX(Prescription_ID) FROM Prescription");
            int preid = Convert.ToInt32(dw.GetSingleData()) + 1;

            dw.SetCommand("INSERT INTO Prescription(Prescription_ID,Medical_officer,Issue_date,Issue_month,Issue_year,Medicine,Dosage,Notes,Patient_ID,date) VALUES(@Prescription_ID,@Medical_officer,@Issue_date,@Issue_month,@Issue_year,@Medicine,@Dosage,@Notes,@Patient_ID,@date)");

            dw.SetSqlCommandParameters("Prescription_ID", preid);
            dw.SetSqlCommandParameters("Medical_officer", DropDownList17.SelectedValue);
            dw.SetSqlCommandParameters("Issue_date", DropDownList18.SelectedValue);
            dw.SetSqlCommandParameters("Issue_month", DropDownList19.SelectedValue);
            dw.SetSqlCommandParameters("Issue_year", DropDownList20.SelectedValue);
            dw.SetSqlCommandParameters("Medicine", DropDownList21.SelectedValue.Trim());
            dw.SetSqlCommandParameters("Dosage", TextBox22.Text.Trim());
            dw.SetSqlCommandParameters("Notes", TextBox27.Text.Trim());
            dw.SetSqlCommandParameters("Patient_ID", ApptP_ID);
            dw.SetSqlCommandParameters("date", date);
            dw.Insert();
            
            DropDownList17.SelectedIndex = 0;
            DropDownList18.SelectedIndex = 0;
            DropDownList19.SelectedIndex = 0;
            DropDownList20.SelectedIndex = 88;
            DropDownList21.SelectedIndex = 0;
            TextBox22.Text = "";
            TextBox27.Text = "";

            Response.Redirect("~/User/Nurse/Dashboard.aspx");
        }
        catch
        {

        }
    }
    protected void Button16_Click(object sender, EventArgs e)
    {
        try
        {
            DateTime date = DateTime.Now;
            string constring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
            DataWorksClass dw = new DataWorksClass(constring);
            dw.SetCommand("SELECT MAX(Prescription_ID) FROM Prescription");
            int preid = Convert.ToInt32(dw.GetSingleData()) + 1;

            dw.SetCommand("INSERT INTO Prescription(Prescription_ID,Medical_officer,Issue_date,Issue_month,Issue_year,Medicine,Dosage,Notes,Patient_ID,date) VALUES(@Prescription_ID,@Medical_officer,@Issue_date,@Issue_month,@Issue_year,@Medicine,@Dosage,@Notes,@Patient_ID,@date)");

            dw.SetSqlCommandParameters("Prescription_ID", preid);
            dw.SetSqlCommandParameters("Medical_officer", DropDownList17.SelectedValue);
            dw.SetSqlCommandParameters("Issue_date", DropDownList18.SelectedValue);
            dw.SetSqlCommandParameters("Issue_month", DropDownList19.SelectedValue);
            dw.SetSqlCommandParameters("Issue_year", DropDownList20.SelectedValue);
            dw.SetSqlCommandParameters("Medicine", DropDownList21.SelectedValue.Trim());
            dw.SetSqlCommandParameters("Dosage", TextBox22.Text.Trim());
            dw.SetSqlCommandParameters("Notes", TextBox27.Text.Trim());
            dw.SetSqlCommandParameters("Patient_ID", ApptP_ID);
            dw.SetSqlCommandParameters("date", date);
            dw.Insert();

            DropDownList21.SelectedIndex = 0;
            TextBox22.Text = "";
            TextBox27.Text = "";
            this.Button14_ModalPopupExtender.Show();

        }
        catch
        {

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/User/Nurse/Appointments.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/User/Nurse/HealthCard.aspx");
    }
}