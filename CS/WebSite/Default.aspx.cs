using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {

    }

    protected void grid_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e) {
        object key = e.EditingKeyValue;
        DateTime date = Convert.ToDateTime(grid.GetRowValuesByKeyValue(key, "OrderDate"));
        DateTime date2 = new DateTime(1994, 8, 8);
        
        if (date > date2) {
            e.Cancel = true;
        }
        grid.JSProperties["cpCancelEdit"] = e.Cancel;
        grid.JSProperties["cpMessage"] = string.Format("OrderDate {0} is later than {1}", date.ToShortDateString(), date2.ToShortDateString());
    }
}
