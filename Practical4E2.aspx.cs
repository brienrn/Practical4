using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practical4
{
    public partial class Practical4E2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            sdsOrder.SelectParameters["EmployeeID"].DefaultValue = ddlName.SelectedValue;

            sdsOrder.SelectParameters["Years"].DefaultValue = rblYear.SelectedValue;
        }
    }
}