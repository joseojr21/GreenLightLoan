using DAL.Utilities.Services;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UserRoles : System.Web.UI.Page
{
    public int roleID { get; set; }
    public string roleName { get; set; }
    public int roleHierarchy { get; set; }
    public decimal roleLoanAmount { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=72.18.135.49,1533;Initial Catalog=codeintel_db;User ID=joseojr21;Password=jgjca_0LIV");
        conn.Open();
        var roleList = new List<Admin_UserRoles>();

        SqlCommand command = new SqlCommand("SELECT * FROM tbl_CCU_Role ORDER BY roleHierarchy", conn);
        using (SqlDataReader reader = command.ExecuteReader())
        {
            if (reader.HasRows)
            {
                // Read advances to the next row.
                while (reader.Read())
                {
                    Admin_UserRoles objPage = new Admin_UserRoles();
                    objPage.roleID = Convert.ToInt32(reader["roleID"]);
                    objPage.roleName = reader["roleName"].ToString();
                    objPage.roleHierarchy = Convert.ToInt32(reader["roleHierarchy"]);
                    objPage.roleLoanAmount = Convert.ToDecimal(reader["roleLoanAmount"]);
                    roleList.Add(objPage);
                }
            }
        }

        conn.Close();

        rpt_UserRoles.DataSource = roleList;
        rpt_UserRoles.ItemDataBound += repUserRoles_ItemDataBound;
        rpt_UserRoles.DataBind();
    }
    void repUserRoles_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
    {
        RepeaterAssistant<Admin_UserRoles> ra = new RepeaterAssistant<Admin_UserRoles>(e.Item);

        ra.SetControl("lbl_Hierarchy", ra.DataItem.roleHierarchy);
        ra.SetControl("lbl_Name", ra.DataItem.roleName);
        ra.SetControl("lbl_LAmount", ra.DataItem.roleLoanAmount);
        ra.SetControl("hdnFld_RoleID", ra.DataItem.roleID);
    }

    protected void btn_Update_Click(object sender, EventArgs e)
    {
        //Set up modal to popup
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Open Policy Popup", "OpenModal();", true);

        foreach (RepeaterItem item in rpt_UserRoles.Items)
        {
            HiddenField hdnID = (HiddenField)item.FindControl("hdnFld_RoleID");
            if (hdnID != null)
            {
                lbl1.Text = hdnID.Value;
            }
        }


    }

    protected void rpt_UserRoles_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.Equals("SaveChanges"))
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Open Policy Popup", "OpenModal();", true);
            string FID = e.CommandArgument.ToString();
            HiddenField hdnID = e.Item.FindControl("hdnFld_RoleID") as HiddenField;
            lbl1.Text = hdnID.Value;
        }
    }
}