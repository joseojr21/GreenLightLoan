using DAL.Base;
using DAL.SQL2;
using DAL.Utilities.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    #region Local Parameters
    public int userID { get; set; }
    public string userFName { get; set; }
    public string userLName { get; set; }
    public string userName { get; set; }
    public int userRole { get; set; }
    public int roleID { get; set; }
    public string roleName { get; set; }
    public int roleHierarchy { get; set; }

    public int page_ID { get; set; }
    public string page_Title { get; set; }
    public int page_Order { get; set; }
    public string page_ShortDescription { get; set; }

    private int currentPage = 1;
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!String.IsNullOrEmpty(hdnFileId.Value))
        {
            this.currentPage = Convert.ToInt32(hdnFileId.Value);
        }
        

        if (!Page.IsPostBack)
        {
            SqlConnection conn = new SqlConnection("Data Source=72.18.135.49,1533;Initial Catalog=codeintel_db;User ID=joseojr21;Password=jgjca_0LIV");
            conn.Open();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Open Policy Popup", "OpenModal();", true);
            MultiView1.Visible = true;
            var roleList = new List<_Default>();



            SqlCommand command = new SqlCommand("SELECT roleID, roleName FROM tbl_CCU_Role ORDER BY roleHierarchy DESC", conn);
            using (SqlDataReader reader = command.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    // Read advances to the next row.
                    while (reader.Read())
                    {
                        _Default objRole = new _Default();
                        objRole.roleID = Convert.ToInt32(reader["roleID"]);
                        objRole.roleName = reader["roleName"].ToString();
                        roleList.Add(objRole);
                    }
                }
            }

            this.dd_Role.DataSource = roleList;
            dd_Role.DataValueField = "roleID";
            dd_Role.DataTextField = "roleName";
            dd_Role.DataBind();

            try
            {
                string windowsLogin = Environment.UserName;
                string uname = String.Empty;

                SqlCommand usercommand = new SqlCommand("SELECT userName FROM tbl_CCU_User WHERE userName = '" + windowsLogin + "'", conn);
                using (SqlDataReader reader = usercommand.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            uname = reader["userName"].ToString();
                        }
                    }
                }

                

                if (!String.IsNullOrEmpty(uname))
                {
                    lbl_User.Text = "<strong>Username:</strong> " + uname;
                }
                else
                {
                    lbl_User.Text = "<strong>Username:</strong> could not be found";
                }
            }
            catch (Exception)
            {


                throw;
            }

            conn.Close();

            getChecklist();

        }

        



    }
    protected void getChecklist()
    {
        SqlConnection cconn = new SqlConnection("Data Source=72.18.135.49,1533;Initial Catalog=codeintel_db;User ID=joseojr21;Password=jgjca_0LIV");
        cconn.Open();
        var pageList = new List<_Default>();
        try
        {
            SqlCommand pagecommand = new SqlCommand("SELECT page_ID, page_Title FROM tbl_CCU_Page ORDER BY page_Order", cconn);
            using (SqlDataReader reader = pagecommand.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    // Read advances to the next row.
                    while (reader.Read())
                    {
                        _Default objPage = new _Default();
                        objPage.page_ID = Convert.ToInt32(reader["page_ID"]);
                        objPage.page_Title = reader["page_Title"].ToString();
                        pageList.Add(objPage);
                    }
                }
            }
        }
        catch (Exception)
        {

            throw;
        }

        cconn.Close();

        rpt_Checklist.DataSource = pageList;
        rpt_Checklist.ItemDataBound += repChecklist_ItemDataBound;
        rpt_Checklist.DataBind();
    }
    void repChecklist_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
    {
        RepeaterAssistant<_Default> ra = new RepeaterAssistant<_Default>(e.Item);
        ra.SetControl("litChecklist", ra.DataItem.page_Title);

        var li = (HtmlControl)e.Item.FindControl("litChecklist");
        if (ra.DataItem.page_ID <= currentPage)
        {
            li.Attributes.Add("class", "list-group-item list-group-item-success");
        }
        if (ra.DataItem.page_ID > currentPage)
        {
            li.Attributes.Add("class", "list-group-item");
        }


    }
    protected void IAgreeButton_Click(object sender, System.EventArgs e)
    {
        var agree1 = FormServices.GetChecked(this.AgreeTerms1);
        var agree2 = FormServices.GetChecked(this.AgreeTerms2);
        if (agree1 == true && agree2 == true)
        {
            MultiView1.Visible = true;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Close Modal Popup", "CloseModal();", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Open Policy Popup", "OpenModal();", true);
        }
    }

    protected void ButtonPrev_Click(object sender, EventArgs e)
    {
        if (MultiView1.ActiveViewIndex == 0)
        {
            MultiView1.ActiveViewIndex = 9;
        }
        else
        {
            MultiView1.ActiveViewIndex -= 1;
        }
    }
    protected void ButtonNext_Click(object sender, EventArgs e)
    {
        if (MultiView1.ActiveViewIndex == 8)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        else
        {
            currentPage = currentPage + 1;
            hdnFileId.Value = currentPage.ToString();
            MultiView1.ActiveViewIndex += 1;
            getChecklist();
        }
    }
}