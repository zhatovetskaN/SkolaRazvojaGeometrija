using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkolaRazvojaGeometrija
{
    public partial class Tečajevi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                GridView1.Visible = false;

                GridView1.DataBind();

            }
           
        }

        protected void BtnPrikazi_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
           
            var sqlCommand = "UPDATE Tečajevi SET [Broj predbilježbi] = (SELECT COUNT(*) FROM dbo.Predbilježba WHERE Predbilježba.Tečaj_Id = Tečajevi.Id_Tečaja GROUP BY Tečaj_Id) ";
           
            SqlDataSource1.UpdateCommand = sqlCommand;
            SqlDataSource1.Update();                           
            
        }
           
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex != e.Row.RowIndex)
            {
                (e.Row.Cells[0].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
                
            }

        }

        protected void Insert(object sender, EventArgs e)
        {
            SqlDataSource1.Insert();
            txtNaziv.Text = string.Empty;
            txtDatum_pocetka.Text = string.Empty;
            txtDatum_zavrsetka.Text = string.Empty;

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
    }

   
}