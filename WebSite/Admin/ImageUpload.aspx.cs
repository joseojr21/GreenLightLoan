using DAL.Utilities.Services;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ImageUpload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string dirFullPath = HttpContext.Current.Server.MapPath("~/Uploads/");
        List<string> docResults = Directory.GetFiles(dirFullPath, "*").Select(path => Path.GetFileName(path)).ToList();
        //Console.Write(pdfFiles);
        this.rpt_ImageDirectory.DataSource = docResults;
        this.rpt_ImageDirectory.ItemDataBound += rpt_ImageDirectory_ItemDataBound;
        this.rpt_ImageDirectory.DataBind();
    }
    void rpt_ImageDirectory_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
    {
        RepeaterAssistant<string> ra = new RepeaterAssistant<string>(e.Item);

        ra.SetControl("liImageName", ra.DataItem.ToString());
        ra.SetControl("liImageURL", ra.DataItem.ToString());

    }
}