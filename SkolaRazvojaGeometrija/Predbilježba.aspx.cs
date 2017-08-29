using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkolaRazvojaGeometrija
{
    public partial class Predbilježba : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void BtnOdaberi_Click(object sender, EventArgs e)
        {
            string conString = @"Server=DESKTOP-3S1KNK9\SQLEXPRESS; 
            Database = Geometrija; Integrated Security = True;";

            var odabrano = DropDownList1.SelectedValue;
                       
            SqlConnection con = new SqlConnection(conString);

            con.Open();

            var sqlCommand = "SELECT Id_Tečaja, Šifra_Tečaja, Naziv, Datum_pocetka, Datum_zavrsetka  FROM Tečajevi WHERE Naziv LIKE '" + odabrano + "'";
            SqlCommand command = new SqlCommand(sqlCommand, con);

            SqlDataAdapter adptr = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            adptr.Fill(dt);

            con.Close();

            GridView1.DataSource = dt; 
            GridView1.DataBind();
        }

        protected void BtnSend_Click(object sender, EventArgs e)
        {
            string conString = @"Server=DESKTOP-3S1KNK9\SQLEXPRESS; 
            Database = Geometrija; Integrated Security = True;";          

            string id_tečaja = GridView1.Rows[0].Cells[0].Text;
            string naziv = GridView1.Rows[0].Cells[2].Text;
            string ime = TxtBoxIme.Text;
            string prezime = TxtBoxPrezime.Text;
            string adresa = TxtBoxAdresa.Text;
            string telefon = TxtBoxTelefon.Text;
            string email = TxtBoxEmail.Text;

            var query = String.Format("INSERT INTO Predbilježba (Tečaj_Id, Naziv, Ime, Prezime, Adresa, Telefon, Email)" +
                "VALUES (@id_tečaja, @naziv, @ime, @prezime, @adresa, @telefon, @email)");
           
           var con = new SqlConnection(conString);
            try
            {
                SqlCommand cmd = new SqlCommand(query, con);

                con.Open();

                cmd.Parameters.AddWithValue("@id_tečaja", id_tečaja);
                cmd.Parameters.AddWithValue("@naziv", naziv);
                cmd.Parameters.AddWithValue("@ime", ime);
                cmd.Parameters.AddWithValue("@prezime", prezime);
                cmd.Parameters.AddWithValue("@adresa", adresa);
                cmd.Parameters.AddWithValue("@telefon", telefon);
                cmd.Parameters.AddWithValue("@email", email);
                
                var result = cmd.ExecuteNonQuery();
            }

            finally
            {

                con.Close();
            }
            TxtBoxIme.Text = string.Empty;
            TxtBoxPrezime.Text = string.Empty;
            TxtBoxAdresa.Text = string.Empty;
            TxtBoxTelefon.Text = string.Empty;
            TxtBoxEmail.Text = string.Empty;

        }
       
        
    }
   
}