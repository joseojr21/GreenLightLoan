using DAL.Base;
using DAL.SQL2;
using DAL.Utilities.Services;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManagePages : Page
{
    public int page_ID { get; set; }
    public string page_Title { get; set; }
    public int page_Order { get; set; }
    public string page_ShortDescription { get; set; }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=72.18.135.49,1533;Initial Catalog=codeintel_db;User ID=joseojr21;Password=jgjca_0LIV");
        conn.Open();
        var pageList = new List<Admin_ManagePages>();

        SqlCommand command = new SqlCommand("SELECT page_ID, page_Title, page_Order, page_ShortDescription FROM tbl_CCU_Page ORDER BY page_Order", conn);
        using (SqlDataReader reader = command.ExecuteReader())
        {
            if (reader.HasRows)
            {
                // Read advances to the next row.
                while (reader.Read())
                {
                    Admin_ManagePages objPage = new Admin_ManagePages();
                    objPage.page_ID = Convert.ToInt32(reader["page_ID"]);
                    objPage.page_Title = reader["page_Title"].ToString();
                    objPage.page_Order = Convert.ToInt32(reader["page_Order"]);
                    objPage.page_ShortDescription = reader["page_ShortDescription"].ToString();
                    pageList.Add(objPage);
                }
            }
        }

        conn.Close();

        rpt_PageContent.DataSource = pageList ;
        rpt_PageContent.ItemDataBound += repPageContent_ItemDataBound;
        rpt_PageContent.DataBind();
    }
    void repPageContent_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
    {
        RepeaterAssistant<Admin_ManagePages> ra = new RepeaterAssistant<Admin_ManagePages>(e.Item);

        ra.SetControl("lbl_Title", ra.DataItem.page_Title);
        ra.SetControl("lbl_Order", ra.DataItem.page_Order);
        ra.SetControl("lbl_Descr", ra.DataItem.page_ShortDescription);
    }
}