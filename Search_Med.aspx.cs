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
using System.Net;
using System.IO;
using Newtonsoft.Json.Linq;

namespace WebApplication2
{
    public partial class Search_Med : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string[] GetMed(string prefixText, int count)
        {
            string sql;
            SqlConnection cn = new SqlConnection(WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);

            sql = String.Format("select DISTINCT NAME from MEDICINE_DB where NAME like '{0}%'", prefixText);
            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "MEDICINE_DB");
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
                pnames[i] = row["NAME"].ToString();
            }
            return pnames;
            //string json = new System.Net.WebClient().DownloadString("http://www.truemd.in/api/medicine_suggestions?id=" + prefixText + "&key=0723585156afac28e74f5a6777bbfe");
            //Console.WriteLine(json);
            //JObject jObject = JObject.Parse(json);
            //JToken jResponse = jObject["response"];
            //JArray jSuggestions = (JArray)jResponse["suggestions"];
            //string[] trmdnames = new string[jSuggestions.Count];
            //for (int j = 0; j < jSuggestions.Count; j++)
            //    trmdnames[j] = jSuggestions[j]["suggestion"].ToString();
            //return trmdnames;
        }
    }
}