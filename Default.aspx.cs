using System;
using System.Collections.Generic;
using System.Web;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Configuration;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetArea(string prefixText, int count)
    {
        string sql;
        SqlConnection cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
        int temp;
        if (int.TryParse(prefixText, out temp))
        {
            sql = String.Format("select DISTINCT Pincode from Pin where Pincode like '{0}%' ", prefixText);
            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "Pin");
            int rcount, size;
            rcount = ds.Tables[0].Rows.Count;
            if (rcount >= count)
                size = count;
            else
                size = rcount;
            string[] pnames = new string[size];
            for (int i = 0; i < size; i++)
            {
                DataRow row = ds.Tables[0].Rows[i];
                pnames[i] = row["Pincode"].ToString();
            }
            return pnames;
        }
        else
        {
            sql = String.Format("select DISTINCT Area from Pin where Area like '{0}%' ", prefixText);
            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "Pin");
            int rcount, size;
            rcount = ds.Tables[0].Rows.Count;
            if (rcount >= count)
                size = count;
            else
                size = rcount;
            string[] pnames = new string[size];
            for (int i = 0; i < size; i++)
            {
                DataRow row = ds.Tables[0].Rows[i];
                pnames[i] = row["Area"].ToString();
            }
            return pnames;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Med_List.aspx?" + placeholderTextBox.Text);
    }
}
        

    

        
