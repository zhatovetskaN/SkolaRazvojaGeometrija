using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SkolaRazvojaGeometrija
{
    public partial class Prijava : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string conString = @"Server=DESKTOP-3S1KNK9\SQLEXPRESS; 
            Database = Geometrija; Integrated Security = True";

            string username = null;
            string password = null;

            SqlConnection con = new SqlConnection(conString);

            var query = "SELECT Korisničko_ime, Zaporka FROM Zaposlenik WHERE Korisničko_ime =@username AND Zaporka=@password";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@username", TxtLogin.Text);
            cmd.Parameters.AddWithValue("@password", TxtPass.Text);
            con.Open();

            SqlDataReader reader = default(SqlDataReader);

             reader = cmd.ExecuteReader();

            while ((reader.Read()) == true)
            {

                username = (string)reader["Korisničko_ime"].ToString();
                password = (string)reader["Zaporka"].ToString();

            }
                    if (TxtLogin.Text == username && TxtPass.Text == password)
                    {
                        Response.Redirect("~/Predbilježbe.aspx");
                    }

                    else
                    {

                      LblError.Text = "Krivo korisnicko ime ili zaporka!";
                LblError.Visible = true;
                    }
                           
            con.Close();


        }
    }
}