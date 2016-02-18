using DAL.Base;
using DAL.SQL2;
using DAL.Utilities.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    #region Local Parameters

    //User Info
    public int userID { get; set; }
    public string userFName { get; set; }
    public string userLName { get; set; }
    public string userName { get; set; }

    //Role Info
    public int userRole { get; set; }
    public int roleID { get; set; }
    public string roleName { get; set; }
    public int roleHierarchy { get; set; }
    public decimal roleLoanAmount { get; set; }

    //Page Info
    public int page_ID { get; set; }
    public string page_Title { get; set; }
    public string page_TitleSub { get; set; }
    public string page_Content { get; set; }
    public int page_Order { get; set; }
    public int page_Continue { get; set; }
    public int page_Yes { get; set; }
    public int page_No { get; set; }
    public string page_ShortDescription { get; set; }
    public string page_Image1 { get; set; }
    public string page_Image2 { get; set; }

    private int currentPage = 1;
    private string uname = String.Empty;
    private decimal uAmount = 5000;
    private decimal loanAmount = 0;

    public string connString = "Data Source=72.18.135.49,1533;Initial Catalog=codeintel_db;User ID=joseojr21;Password=jgjca_0LIV";
    #endregion

    /// <summary>
    /// Check Authorization, Load: Page Content, Modal, and checklist
    /// </summary>
    protected void Page_Load(object sender, EventArgs e)
    {
        //This is my hidden field for passing info for checklist
        if (!String.IsNullOrEmpty(hdnFileId.Value))
        {
            this.currentPage = Convert.ToInt32(hdnFileId.Value);
        }
        if (!String.IsNullOrEmpty(hdnFieldLoanAmount.Value))
        {
            this.loanAmount = Convert.ToInt32(hdnFieldLoanAmount.Value);
        }
        if (!String.IsNullOrEmpty(hdnUname.Value))
        {
            this.uname = hdnUname.Value.ToString();
        }
        if (!String.IsNullOrEmpty(hdnAmount.Value))
        {
            this.uAmount = Convert.ToDecimal(hdnAmount.Value);
        }

        lbl_Icons.Text = "<i class='fa fa-user'></i> <font size=2>" + uname + "&nbsp;&nbsp;&nbsp;&nbsp;<i class='fa fa-usd'></i>" + loanAmount.ToString() + "</font>";

        if (!Page.IsPostBack)
        {
            //Set up modal to popup
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Open Policy Popup", "OpenModal();", true);

            //set up role dropdown
            RoleDropdown();

            //get User info
            GetUserInfo();

            //get Current View Info to set up page content
            View activeView = this.MultiView1.GetActiveView();
            getPageContent(activeView);
        }
    }
    /// <summary>
    /// gather the role dropdown cheklist info
    /// </summary>
    private void RoleDropdown()
    {
        //Set up db connection
        SqlConnection conn = new SqlConnection(connString);
        conn.Open();

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
        conn.Close();
    }
    /// <summary>
    /// Gather user info on page load
    /// </summary>
    private void GetUserInfo()
    {
        SqlConnection conn = new SqlConnection(connString);
        conn.Open();
        try
        {
            //string windowsLogin = User.Identity.Name;
            string windowsLogin = "joseolivaresco_web";

            SqlCommand usercommand = new SqlCommand("SELECT userName, r.roleLoanAmount AS roleAmount FROM tbl_CCU_User u LEFT JOIN tbl_CCU_Role r on u.userRole = r.roleHierarchy WHERE userName = '" + windowsLogin + "'", conn);
            using (SqlDataReader reader = usercommand.ExecuteReader())
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        uname = reader["userName"].ToString();
                        uAmount = Convert.ToDecimal(reader["roleAmount"]);
                        hdnUname.Value = uname;
                        hdnAmount.Value = uAmount.ToString();
                    }
                }
            }

            if (!String.IsNullOrEmpty(uname))
            {
                lbl_User.Text = "<strong>Username:</strong> " + uname;
                lbl_userAmountWarning.Text = "This current user '" + uname + "' has a loan approval limit of $" + uAmount + ". If this loan amount exceeds your approval limit, please contact your supervisor for assistance.";
            }
            else
            {
                lbl_User.Text = "<strong>Username:</strong> could not be found" + windowsLogin + "ddd";
                lbl_userAmountWarning.Text = "The current user was not found. Loan approval limit of $" + uAmount + " has been assigned. If this loan amount exceeds your approval limit, please contact your supervisor for assistance.";
            }
        }
        catch (Exception)
        {
            throw;
        }
        conn.Close();
    }
    private _Default GetPageOrder(int activeViewIndex)
    {
        activeViewIndex += 1;
        SqlConnection connPageContent = new SqlConnection(connString);
        connPageContent.Open();
        var pageContentList = new List<_Default>();
        SqlCommand Pcontentcommand = new SqlCommand("SELECT * FROM tbl_CCU_Page WHERE page_Order = " + activeViewIndex, connPageContent);
        using (SqlDataReader reader = Pcontentcommand.ExecuteReader())
        {
            if (reader.HasRows)
            {
                // Read advances to the next row.
                while (reader.Read())
                {
                    _Default objPageContent = new _Default();
                    objPageContent.page_Order = Convert.ToInt32(reader["page_Order"]);
                    if (!string.IsNullOrEmpty(reader["page_Continue"].ToString()))
                    {
                        objPageContent.page_Continue = Convert.ToInt32(reader["page_Continue"]);
                    }
                    else
                    {
                        objPageContent.page_Continue = 0;
                    }
                    if (!string.IsNullOrEmpty(reader["page_Yes"].ToString()))
                    {
                        objPageContent.page_Yes = Convert.ToInt32(reader["page_Yes"]);
                    }
                    else
                    {
                        objPageContent.page_Yes = 0;
                    }

                    if (!string.IsNullOrEmpty(reader["page_No"].ToString()))
                    {
                        objPageContent.page_No = Convert.ToInt32(reader["page_No"]);
                    }
                    else
                    {
                        objPageContent.page_No = 0;
                    }

                    return objPageContent;
                }
            }
        }
        connPageContent.Close();
        return null;
    }
    /// <summary>
    /// Repeater Logic to display left panel checklist 
    /// </summary>
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
    /// <summary>
    /// Get page Content
    /// </summary>
    protected void getPageContent(View currentView)
    {
        SqlConnection connPageContent = new SqlConnection(connString);
        connPageContent.Open();
        var resultString = Regex.Match(currentView.ID, @"\d+").Value;
        var pageContentList = new List<_Default>();
        SqlCommand Pcontentcommand = new SqlCommand("SELECT * FROM tbl_CCU_Page WHERE page_Order = " + resultString, connPageContent);
        using (SqlDataReader reader = Pcontentcommand.ExecuteReader())
        {
            if (reader.HasRows)
            {
                // Read advances to the next row.
                while (reader.Read())
                {
                    _Default objPageContent = new _Default();
                    objPageContent.page_ID = Convert.ToInt32(reader["page_ID"]);
                    objPageContent.page_Title = reader["page_Title"].ToString();
                    objPageContent.page_TitleSub = reader["page_TitleSub"].ToString();
                    objPageContent.page_Content = reader["page_Content"].ToString();
                    objPageContent.page_Image1 = reader["page_Image1"].ToString();
                    objPageContent.page_Image2 = reader["page_Image2"].ToString();
                    if (!string.IsNullOrEmpty(reader["page_Continue"].ToString()))
                    {
                        objPageContent.page_Continue = Convert.ToInt32(reader["page_Continue"]);
                    }
                    else
                    {
                        objPageContent.page_Continue = 0;
                    }
                    if (!string.IsNullOrEmpty(reader["page_Yes"].ToString()))
                    {
                        objPageContent.page_Yes = Convert.ToInt32(reader["page_Yes"]);
                    }
                    else
                    {
                        objPageContent.page_Yes = 0;
                    }

                    if (!string.IsNullOrEmpty(reader["page_No"].ToString()))
                    {
                        objPageContent.page_No = Convert.ToInt32(reader["page_No"]);
                    }
                    else
                    {
                        objPageContent.page_No = 0;
                    }

                    pageContentList.Add(objPageContent);
                }
            }
        }

        rpt_PageContent1.DataSource = pageContentList;
        rpt_PageContent1.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent1.DataBind();

        rpt_PageContent2.DataSource = pageContentList;
        rpt_PageContent2.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent2.DataBind();

        rpt_PageContent3.DataSource = pageContentList;
        rpt_PageContent3.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent3.DataBind();

        rpt_PageContent4.DataSource = pageContentList;
        rpt_PageContent4.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent4.DataBind();

        rpt_PageContent5.DataSource = pageContentList;
        rpt_PageContent5.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent5.DataBind();

        rpt_PageContent6.DataSource = pageContentList;
        rpt_PageContent6.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent6.DataBind();

        rpt_PageContent7.DataSource = pageContentList;
        rpt_PageContent7.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent7.DataBind();

        rpt_PageContent8.DataSource = pageContentList;
        rpt_PageContent8.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent8.DataBind();

        rpt_PageContent9.DataSource = pageContentList;
        rpt_PageContent9.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent9.DataBind();

        rpt_PageContent10.DataSource = pageContentList;
        rpt_PageContent10.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent10.DataBind();

        rpt_PageContent11.DataSource = pageContentList;
        rpt_PageContent11.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent11.DataBind();

        rpt_PageContent12.DataSource = pageContentList;
        rpt_PageContent12.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent12.DataBind();

        rpt_PageContent13.DataSource = pageContentList;
        rpt_PageContent13.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent13.DataBind();

        rpt_PageContent14.DataSource = pageContentList;
        rpt_PageContent14.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent14.DataBind();

        rpt_PageContent15.DataSource = pageContentList;
        rpt_PageContent15.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent15.DataBind();

        rpt_PageContent16.DataSource = pageContentList;
        rpt_PageContent16.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent16.DataBind();

        rpt_PageContent17.DataSource = pageContentList;
        rpt_PageContent17.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent17.DataBind();

        rpt_PageContent18.DataSource = pageContentList;
        rpt_PageContent18.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent18.DataBind();

        rpt_PageContent19.DataSource = pageContentList;
        rpt_PageContent19.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent19.DataBind();

        rpt_PageContent20.DataSource = pageContentList;
        rpt_PageContent20.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent20.DataBind();

        rpt_PageContent21.DataSource = pageContentList;
        rpt_PageContent21.ItemDataBound += rptPageContent_OnItemDataBound;
        rpt_PageContent21.DataBind();

        connPageContent.Close();
    }
    /// <summary>
    /// Repeater For Page Content
    /// </summary>
    protected void rptPageContent_OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        RepeaterAssistant<_Default> ra = new RepeaterAssistant<_Default>(e.Item);
        ra.SetControl("pageTitle", ra.DataItem.page_Title);
        ra.SetControl("pageTitleSub", ra.DataItem.page_TitleSub);
        ra.SetControl("pageContent", ra.DataItem.page_Content);

        if (!String.IsNullOrEmpty(ra.DataItem.page_Image1))
        {
            ra.SetControl("Image1", "Uploads/" + ra.DataItem.page_Image1);
        }
        if (!String.IsNullOrEmpty(ra.DataItem.page_Image2))
        {
            ra.SetControl("Image2", "Uploads/" + ra.DataItem.page_Image2);
        }

        if (e.Item.ItemType == ListItemType.Item)
        {
            Button btn_Continue = (Button)e.Item.FindControl("btn_Continue");
            Button btn_Yes = (Button)e.Item.FindControl("btn_Yes");
            Button btn_No = (Button)e.Item.FindControl("btn_No");
            if (btn_Continue != null && btn_Yes != null && btn_No != null)
            {
                if (ra.DataItem.page_Continue > 0)
                {
                    btn_Continue.Visible = true;
                    btn_Yes.Visible = false;
                    btn_No.Visible = false;
                }
                else
                {
                    btn_Continue.Visible = false;
                    btn_Yes.Visible = true;
                    btn_No.Visible = true;
                }
            }

        }



    }
    /// <summary>
    /// Modal Terms and Conditions Agreement Button Click Functionality
    /// </summary>
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

    /// <summary>
    /// Previous / No Button Logic
    /// </summary>
    protected void ButtonPrev_Click(object sender, EventArgs e)
    {
        if (MultiView1.ActiveViewIndex == 0)
        {
            MultiView1.ActiveViewIndex = 20;
        }
        else
        {
            currentPage = currentPage - 1;
            hdnFileId.Value = currentPage.ToString();
            MultiView1.ActiveViewIndex -= 1;

            //get Current View Info to set up page info
            View activeView = this.MultiView1.GetActiveView();
            getPageContent(activeView);

        }
    }
    /// <summary>
    /// Continue / Yes Button Logic
    /// </summary>
    protected void ButtonNext_Click(object sender, EventArgs e)
    {
        var pageOrder = GetPageOrder(MultiView1.ActiveViewIndex);

        UpdateCheckList(pageOrder.page_Order);

        if (MultiView1.ActiveViewIndex == 20)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        else
        {
            //if PageView 1.. Do some validation
            var i = 0.00m;
            bool result = decimal.TryParse(txt_loanAmount.Text, out i); //i now = 108
            if (!result || (Convert.ToDecimal(txt_loanAmount.Text) > uAmount))
            {
                //Get current Page info and set checklist to correct page select
                hdnFileId.Value = currentPage.ToString();
                MultiView1.ActiveViewIndex = MultiView1.ActiveViewIndex;
            }
            else {
                var nextpage = 0;
                if (pageOrder.page_Continue == 0)
                {
                    nextpage = pageOrder.page_Yes;
                }
                else
                {
                    nextpage = pageOrder.page_Continue;
                }
                nextpage = nextpage - 1;

                var prvPage = 0;
                if (pageOrder.page_No != 0)
                {
                    prvPage = pageOrder.page_No;
                }

                //Get current Page info and set checklist to correct page select
                currentPage = currentPage + 1;
                hdnFileId.Value = currentPage.ToString();
                MultiView1.ActiveViewIndex = nextpage;
                hdnFieldLoanAmount.Value = txt_loanAmount.Text;
            }

            //get Current View Info to set up page info
            View activeView = this.MultiView1.GetActiveView();
            getPageContent(activeView);



        }
    }

    private void UpdateCheckList(int page_Order)
    {
        if (page_Order >= 2)
            chlist2.Attributes.Add("class", "list-group-item list-group-item-success");
        if (page_Order >= 3)
            chlist3.Attributes.Add("class", "list-group-item list-group-item-success");
        if (page_Order >= 4)
            chlist4.Attributes.Add("class", "list-group-item list-group-item-success");
        if (page_Order >= 5)
            chlist5.Attributes.Add("class", "list-group-item list-group-item-success");
        if (page_Order >= 6)
            chlist6.Attributes.Add("class", "list-group-item list-group-item-success");
        if (page_Order >= 11)
            chlist7.Attributes.Add("class", "list-group-item list-group-item-success");
        if (page_Order >= 12)
            chlist8.Attributes.Add("class", "list-group-item list-group-item-success");
        if (page_Order >= 13)
            chlist9.Attributes.Add("class", "list-group-item list-group-item-success");
        if (page_Order >= 16)
            chlist10.Attributes.Add("class", "list-group-item list-group-item-success");
        if (page_Order >= 17)
            chlist11.Attributes.Add("class", "list-group-item list-group-item-success");
        if (page_Order >= 18)
            chlist12.Attributes.Add("class", "list-group-item list-group-item-success");
        if (page_Order >= 19)
            chlist13.Attributes.Add("class", "list-group-item list-group-item-success");
        if (page_Order >= 21)
            chlist14.Attributes.Add("class", "list-group-item list-group-item-success");
    }

}