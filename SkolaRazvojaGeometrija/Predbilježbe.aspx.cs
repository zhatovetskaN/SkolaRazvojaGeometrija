using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;


namespace SkolaRazvojaGeometrija
{
    public partial class Predbilježbe : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dwBind();
            }

           
        }

        protected void BtnPrikazi_Click(object sender, EventArgs e)
        {
            string conString = @"Server=DESKTOP-3S1KNK9\SQLEXPRESS; 
            Database = Geometrija; Integrated Security = True;";

            var odabrano = DropDownList1.SelectedValue;
           
            SqlConnection con = new SqlConnection(conString);
            con.Open();
            var sqlCommand = "SELECT * FROM Predbilježba WHERE Tečaj_Id = '" + odabrano + "' AND [Status] IS NULL";
          
            SqlCommand command = new SqlCommand(sqlCommand, con);
            
            SqlDataAdapter adptr = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            adptr.Fill(dt);

            SqlDataReader read = command.ExecuteReader();
            if (read.Read() == true)
            {
                LblText.Text = "";
            }

            else if (read.Read() == false)
            {
                LblText.Text = "Trenutno nema novih predbilježba!";
            }

            // konekcija se mora zatvoriti nakon rada
            con.Close();

            GridView1.DataSource = dt; // dodaj tablicu sa svim podacima
            GridView1.DataBind();           

        }
       

        protected void gvbind()
        {
            SqlConnection connec = new SqlConnection(@"Server=DESKTOP-3S1KNK9\SQLEXPRESS; 
            Database = Geometrija; Integrated Security = True;");
                                   
            connec.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Predbilježba WHERE Tečaj_Id = '" + DropDownList1.Text + "' ", connec);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            connec.Close();
        }
      
         protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int delete = int.Parse(GridView1.DataKeys[e.RowIndex].Value.ToString());
            SqlConnection conn = new SqlConnection(@"Server=DESKTOP-3S1KNK9\SQLEXPRESS; 
            Database = Geometrija; Integrated Security = True;");
            SqlDataAdapter da = new SqlDataAdapter("", conn);
            conn.Open();
            da.DeleteCommand = new SqlCommand("DELETE FROM Predbilježba WHERE Id_Predbilježba=" + delete, conn);
            da.DeleteCommand.ExecuteNonQuery();
            conn.Close();
            gvbind();
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
                if(e.Row.RowType==DataControlRowType.DataRow)
                {
                    string ID = e.Row.Cells[1].Text;
                    LinkButton lb = (LinkButton)e.Row.Cells[0].FindControl("LinkDelete");
                    if(lb!=null)
                    {
                        lb.Attributes.Add("onclick", "return confirm('Do you want to delete this row?');");
                    }
                }
            }       

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            gvbind();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {           
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
           
            string status = ((TextBox)GridView1.Rows[e.RowIndex].Cells[11].Controls[0]).Text;
            string ime = ((TextBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0]).Text;
            string prezime = ((TextBox)GridView1.Rows[e.RowIndex].Cells[7].Controls[0]).Text;
            string adresa = ((TextBox)GridView1.Rows[e.RowIndex].Cells[8].Controls[0]).Text;
            string telefon =  ((TextBox)GridView1.Rows[e.RowIndex].Cells[9].Controls[0]).Text;
            string email = ((TextBox)GridView1.Rows[e.RowIndex].Cells[10].Controls[0]).Text;
            
            int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            
            SqlConnection conn = new SqlConnection(@"Server=DESKTOP-3S1KNK9\SQLEXPRESS; 
            Database = Geometrija; Integrated Security = True;");
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "UPDATE dbo.Predbilježba SET Status =' " + status + " ', Ime =' " + ime + " ', Prezime =' " + prezime + " ', Adresa =' " + adresa + " ', Telefon =' " + telefon + " ', Email =' " + email + " ' WHERE Id_Predbilježba =' " + Id + " ' ";
            conn.Open();
            cmd.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            gvbind();
            
            conn.Close();
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            gvbind();
        }

        protected void GridView1_CancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            gvbind();
        }
        protected void dwBind()
        {
            SqlConnection connec = new SqlConnection(@"Server=DESKTOP-3S1KNK9\SQLEXPRESS; 
            Database = Geometrija; Integrated Security = True;");

            connec.Open();
            SqlCommand cmd = new SqlCommand("SELECT Naziv, Ime, Prezime, Adresa, Telefon, Email FROM Predbilježba", connec);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DetailsView1.DataSource = ds;
            DetailsView1.DataBind();
            connec.Close();

        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            SqlConnection connec = new SqlConnection(@"Server=DESKTOP-3S1KNK9\SQLEXPRESS; 
            Database = Geometrija; Integrated Security = True;");
           
            TextBox txtName = (TextBox)DetailsView1.FindControl("InsertImeTextBox");
            TextBox txtPrezime = (TextBox)DetailsView1.FindControl("InsertPrezimeTextBox");
            TextBox txtAdresa = (TextBox)DetailsView1.FindControl("InsertAdresaTextBox");
            TextBox txtTelefon = (TextBox)DetailsView1.FindControl("InsertTelefonTextBox");
            TextBox txtEmail = (TextBox)DetailsView1.FindControl("InsertEmailTextBox");

            var odaberi = DropDownList2.SelectedValue;
            var izaberi = DropDownList2.SelectedItem.Text;
           
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connec;
            
            cmd.CommandText = "INSERT INTO Predbilježba(Tečaj_Id, Naziv, Ime, Prezime, Adresa, Telefon, Email) Values('" + odaberi + "','" + izaberi + "','" + txtName.Text + "', '" + txtPrezime.Text + "', '" + txtAdresa.Text + "' , '" + txtTelefon.Text + "', '" + txtEmail.Text + "')";
                       
            connec.Open();

            cmd.ExecuteNonQuery();
            
            dwBind();
            connec.Close();
        }
        
        protected void DetailsView1_ModeChanging1(object sender, DetailsViewModeEventArgs e)
        {
            DetailsView1.ChangeMode(e.NewMode);
            dwBind();
            if (e.NewMode == DetailsViewMode.Edit)
            {
                DetailsView1.AllowPaging = false;
            }
            else
            {
                DetailsView1.AllowPaging = true;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        
    }
    }