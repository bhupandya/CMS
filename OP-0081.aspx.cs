﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class OP_0081 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                ProjectNameDdl.AppendDataBoundItems = true;
                String strConnString = WebConfigurationManager.ConnectionStrings["Registration"].ConnectionString;
                String strQuery = "SELECT * FROM Refinery";
                SqlConnection con = new SqlConnection(strConnString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    ProjectNameDdl.DataSource = cmd.ExecuteReader();
                    ProjectNameDdl.DataTextField = "Name";
                    ProjectNameDdl.DataValueField = "Refinery_id";
                    ProjectNameDdl.DataBind();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    con.Close();
                    con.Dispose();
                }
            }
        }

        protected void ProjectNameDdl_SelectedIndexChanged(object sender, EventArgs e)
        {
            PUNameDdl.Items.Clear();
            PUNameDdl.Items.Add(new ListItem("--Select PU--", ""));
            SystemDdl.Items.Clear();
            SystemDdl.Items.Add(new ListItem("--Select System--", ""));

            PUNameDdl.AppendDataBoundItems = true;
            String strConnString = WebConfigurationManager.ConnectionStrings["Registration"].ConnectionString;
            String strQuery = "SELECT * FROM ((Process_Units P INNER JOIN Refinery_Area RA ON RA.Refinery_Area_id=P.Refinery_Area_id)INNER JOIN Refinery R ON R.Refinery_id=RA.Refinery_id) WHERE R.Refinery_id = @Refinery_id";
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@Refinery_id", ProjectNameDdl.SelectedItem.Value);
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strQuery;
            cmd.Connection = con;
            try
            {
                con.Open();
                PUNameDdl.DataSource = cmd.ExecuteReader();
                PUNameDdl.DataTextField = "Process_Unit_Name";
                PUNameDdl.DataValueField = "Process_Unit_id";
                PUNameDdl.DataBind();
                if (PUNameDdl.Items.Count > 1)
                {
                    PUNameDdl.Enabled = true;
                }
                else
                {
                    PUNameDdl.Enabled = false;
                    SystemDdl.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }

        protected void PUNameDdl_SelectedIndexChanged(object sender, EventArgs e)
        {
            SystemDdl.Items.Clear();
            SystemDdl.Items.Add(new ListItem("--Select System--", ""));
            SystemDdl.AppendDataBoundItems = true;
            String strConnString = WebConfigurationManager.ConnectionStrings["Registration"].ConnectionString;
            String strQuery = "SELECT * FROM (((PU_System PU INNER JOIN Process_Units P ON P.Process_Unit_id=PU.Process_Unit_id) INNER JOIN Refinery_Area RA ON RA.Refinery_Area_id = P.Refinery_Area_id) INNER JOIN Refinery R ON R.Refinery_id = RA.Refinery_id) WHERE P.Process_Unit_id = @Process_Unit_id";
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@Process_Unit_id", PUNameDdl.SelectedItem.Value);
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strQuery;
            cmd.Connection = con;
            try
            {
                con.Open();
                SystemDdl.DataSource = cmd.ExecuteReader();
                SystemDdl.DataTextField = "System_Name";
                SystemDdl.DataValueField = "PU_Systems_id";
                SystemDdl.DataBind();
                if (SystemDdl.Items.Count > 1)
                {
                    SystemDdl.Enabled = true;
                }
                else
                {
                    SystemDdl.Enabled = false;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Registration"].ToString();
            SqlConnection connection = new SqlConnection(connectionString);

            try
            {
                connection.Open();
                SqlCommand command = new SqlCommand();
                command.Connection = connection;
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "Insert_OP0081";
                //Top part of form
                command.Parameters.AddWithValue("Form", FormLbl.Text);
                command.Parameters.AddWithValue("Project_Number", ProjectNoTxtBox.Text);
                command.Parameters.AddWithValue("Project_Name", ProjectNameDdl.SelectedItem.Text);
                command.Parameters.AddWithValue("Process_Unit_Name", PUNameDdl.SelectedItem.Text);
                command.Parameters.AddWithValue("System_Name", SystemDdl.SelectedItem.Text);
                command.Parameters.AddWithValue("Sub_System", SubSystemTxtBox.Text);
                command.Parameters.AddWithValue("Equipment", EquipmentTxtBox.Text);
                command.Parameters.AddWithValue("Tag_Number", TagNumberTxtBox.Text);
                command.Parameters.AddWithValue("Discipline", DisciplineTxtBox.Text);
                command.Parameters.AddWithValue("Form_Date", DateTxtBox.Text);
                command.Parameters.AddWithValue("PID", PIDTxtBox.Text);
                command.Parameters.AddWithValue("Design_Operating_Pressure", OpPressureTxtBox.Text);
                command.Parameters.AddWithValue("Expected_Test_Duration", ExpTestDurationTxtBox.Text);
                command.Parameters.AddWithValue("Actual_Test_Duration", ActualTestDurationTxtBox.Text);
                command.Parameters.AddWithValue("Pressure_Unit", PressureTxtBox.Text);
                command.Parameters.AddWithValue("Time_Unit", TimeTxtBox.Text);
                command.Parameters.AddWithValue("Test_Fluid_Used", TestFluidChkBox.SelectedValue);
                command.Parameters.AddWithValue("Leak_Detection_Method", LeakDetectionChkBox.SelectedValue);

                command.Parameters.AddWithValue("Stage1", TextBox1.Text);
                command.Parameters.AddWithValue("Test_Pressure1", TextBox2.Text);
                command.Parameters.AddWithValue("Holding_Time1", TextBox3.Text);
                command.Parameters.AddWithValue("Actual_Pressure1", TextBox4.Text);
                command.Parameters.AddWithValue("Pressure_Drop1", TextBox5.Text);
                command.Parameters.AddWithValue("Leak_Found1", TextBox6.Text);
                command.Parameters.AddWithValue("Remarks1", TextBox7.Text);
                command.Parameters.AddWithValue("Comments1", CommentTxtBox.Text);

                command.Parameters.AddWithValue("Stage2", TextBox8.Text);
                command.Parameters.AddWithValue("Test_Pressure2", TextBox9.Text);
                command.Parameters.AddWithValue("Holding_Time2", TextBox10.Text);
                command.Parameters.AddWithValue("Actual_Pressure2", TextBox11.Text);
                command.Parameters.AddWithValue("Pressure_Drop2", TextBox12.Text);
                command.Parameters.AddWithValue("Leak_Found2", TextBox13.Text);
                command.Parameters.AddWithValue("Remarks2", TextBox14.Text);
                command.Parameters.AddWithValue("Comments2", CommentTxtBox.Text);

                command.Parameters.AddWithValue("Stage3", TextBox15.Text);
                command.Parameters.AddWithValue("Test_Pressure3", TextBox16.Text);
                command.Parameters.AddWithValue("Holding_Time3", TextBox17.Text);
                command.Parameters.AddWithValue("Actual_Pressure3", TextBox18.Text);
                command.Parameters.AddWithValue("Pressure_Drop3", TextBox19.Text);
                command.Parameters.AddWithValue("Leak_Found3", TextBox20.Text);
                command.Parameters.AddWithValue("Remarks3", TextBox21.Text);
                command.Parameters.AddWithValue("Comments3", CommentTxtBox.Text);

                command.Parameters.AddWithValue("Stage4", TextBox22.Text);
                command.Parameters.AddWithValue("Test_Pressure4", TextBox23.Text);
                command.Parameters.AddWithValue("Holding_Time4", TextBox24.Text);
                command.Parameters.AddWithValue("Actual_Pressure4", TextBox25.Text);
                command.Parameters.AddWithValue("Pressure_Drop4", TextBox26.Text);
                command.Parameters.AddWithValue("Leak_Found4", TextBox27.Text);
                command.Parameters.AddWithValue("Remarks4", TextBox28.Text);
                command.Parameters.AddWithValue("Comments4", CommentTxtBox.Text);

                command.Parameters.AddWithValue("Stage5", TextBox29.Text);
                command.Parameters.AddWithValue("Test_Pressure5", TextBox30.Text);
                command.Parameters.AddWithValue("Holding_Time5", TextBox31.Text);
                command.Parameters.AddWithValue("Actual_Pressure5", TextBox32.Text);
                command.Parameters.AddWithValue("Pressure_Drop5", TextBox33.Text);
                command.Parameters.AddWithValue("Leak_Found5", TextBox34.Text);
                command.Parameters.AddWithValue("Remarks5", TextBox35.Text);
                command.Parameters.AddWithValue("Comments5", CommentTxtBox.Text);

                command.Parameters.AddWithValue("Stage6", TextBox36.Text);
                command.Parameters.AddWithValue("Test_Pressure6", TextBox37.Text);
                command.Parameters.AddWithValue("Holding_Time6", TextBox38.Text);
                command.Parameters.AddWithValue("Actual_Pressure6", TextBox39.Text);
                command.Parameters.AddWithValue("Pressure_Drop6", TextBox40.Text);
                command.Parameters.AddWithValue("Leak_Found6", TextBox41.Text);
                command.Parameters.AddWithValue("Remarks6", TextBox42.Text);
                command.Parameters.AddWithValue("Comments6", CommentTxtBox.Text);

                command.Parameters.AddWithValue("Stage7", TextBox43.Text);
                command.Parameters.AddWithValue("Test_Pressure7", TextBox44.Text);
                command.Parameters.AddWithValue("Holding_Time7", TextBox45.Text);
                command.Parameters.AddWithValue("Actual_Pressure7", TextBox46.Text);
                command.Parameters.AddWithValue("Pressure_Drop7", TextBox47.Text);
                command.Parameters.AddWithValue("Leak_Found7", TextBox48.Text);
                command.Parameters.AddWithValue("Remarks7", TextBox49.Text);
                command.Parameters.AddWithValue("Comments7", CommentTxtBox.Text);

                //Bottom part of form

                command.Parameters.AddWithValue("IPC_Company", IPCCompanyTxtBox.Text);
                command.Parameters.AddWithValue("Commissioning_Company", CommissioningCompanyTxtBox.Text);
                command.Parameters.AddWithValue("QA_QC_Company", QAQCCompanyTxtBox.Text);
                command.Parameters.AddWithValue("Lead_StartUp_Company", LeadStartUpCompanyTxtBox.Text);
                command.Parameters.AddWithValue("IPC_Name", IPCNameTxtBox.Text);
                command.Parameters.AddWithValue("Commissioning_Name", CommissioningNameTxtBox.Text);
                command.Parameters.AddWithValue("QA_QC_Name", QAQCNameTxtBox.Text);
                command.Parameters.AddWithValue("Lead_StartUp_Name", LeadStartUpNameTxtBox.Text);
                command.Parameters.AddWithValue("IPC_Sign", IPCSignTxtBox.Text);
                command.Parameters.AddWithValue("Commissioning_Sign", CommissioningSignTxtBox.Text);
                command.Parameters.AddWithValue("QA_QC_Sign", QAQCSignTxtBox.Text);
                command.Parameters.AddWithValue("Lead_StartUp_Sign", LeadStartUpSignTxtBox.Text);
                command.Parameters.AddWithValue("IPC_Date", IPCDateTxtBox.Text);
                command.Parameters.AddWithValue("Commissioning_Date", CommissioningDateTxtBox.Text);
                command.Parameters.AddWithValue("QA_QC_Date", QAQCDateTxtBox.Text);
                command.Parameters.AddWithValue("Lead_StartUp_Date", LeadStartUpDateTxtBox.Text);
                command.Parameters.AddWithValue("Submit", SubmitRadioButtonList.SelectedItem.Text);

                command.ExecuteNonQuery();
                connection.Close();
                SuccessLbl.Text = "Successfully Inserted !!";
            }

            catch (Exception ex)
            {
                SuccessLbl.Text = "Error inserting data" + ex.ToString();
            }
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Comm.aspx");
        }
    }
}