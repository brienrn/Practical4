using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practical4
{
    public partial class Practical4E1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnFind_Click(object sender, EventArgs e)
        {
            sdsProducts.SelectParameters["CategoryID"].DefaultValue = 
                ddlCategory.SelectedValue;
        }

        protected void sdsProducts_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            lblResult.Text = e.AffectedRows.ToString();
        }
    }
}