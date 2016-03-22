using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Chemist_List : System.Web.UI.Page
    {
        string connectionstring;
        public Pagination pagination;
        public int page;
        String searchString;

        protected void Page_Load(object sender, EventArgs e)
        {
            connectionstring = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            if (!IsPostBack)
                GetDetails();
        }

        private void GetDetails()
        {
            if(PreviousPage != null)
            {
                var searchBox = (TextBox) PreviousPage.FindControl("txt_search_med");
                searchString = searchBox.Text;
            }
            else
            {
                searchString = "";
            }
            System.Diagnostics.Debug.WriteLine(searchString);
            DataTable dtMedicineList = new DataTable("MedicineList");
            DataTable dtCount = new DataTable("MedicineList");
            page = Request.QueryString["page"] != null ? int.Parse(Request.QueryString["page"]) : 1;
            int perPage = 10;
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM MEDICINE_DB WHERE NAME LIKE @search + '%'");
                cmd.Parameters.AddWithValue("search", searchString);
                cmd.Connection = con;
                con.Open();
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dtMedicineList);
                }
            }
            //int totalCount = (int)dtCount.Rows[0][0];
            //pagination = new Pagination(page, perPage, totalCount);
            //using (SqlConnection con = new SqlConnection(connectionstring))
            //{
            //    SqlCommand cmd = new SqlCommand("SELECT * FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY NAME) AS x FROM MEDICINE_DB) AS tbl WHERE tbl.x BETWEEN @low AND @high AND NAME LIKE @search");
            //    cmd.Parameters.AddWithValue("low", pagination.offset());
            //    cmd.Parameters.AddWithValue("high", pagination.offset() + perPage);
            //    cmd.Parameters.AddWithValue("search", searchString);
            //    //SqlCommand cmd = new SqlCommand("SELECT * FROM MEDICINE_DB");
            //    cmd.Connection = con;
            //    con.Open();
            //    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            //    {
            //        sda.Fill(dtMedicineList);
            //    }
            //}
            
            //dtMedicineList = (DataTable)dtMedicineList.AsEnumerable().Skip(pagination.offset()).Take(perPage);
            MedicineList.DataSource = dtMedicineList;
            MedicineList.DataBind();
             
        }

    }
}