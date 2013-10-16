using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HearthstoneApplication
{
    public partial class Stats : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddStats_Click(object sender, EventArgs e)
        {
            pnlviewSection.Visible = false;
            pnlAddSection.Visible = true;            
        }

        protected void btnViewStats_Click(object sender, EventArgs e)
        {
            pnlAddSection.Visible = false;
            pnlviewSection.Visible = true;
        }

        protected void btnSaveStats_Click(object sender, EventArgs e)
        {
            string userName = tbxUserName.Text;
            int userID = GetUserID(userName);
            if (userID == 0)
            {
                userID = InsertUser(userName);
                InsertGameStats(userID);
            }
            else
            {
                InsertGameStats(userID);
            }
        }
        public int GetUserID(string username)
        {
            int userID = 0;

            string connString = "DBConnectionString";
            string sproc = "Users_GetUserID";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connString].ToString());

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = sproc;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                conn.Open();
                cmd.Parameters.AddWithValue("@Username", username);

                object temp;
                temp = cmd.ExecuteScalar();
                if (temp == null)
                {
                    userID = 0;
                }
                else
                {
                    userID = int.Parse(temp.ToString());
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex);
            }
            finally
            {
                conn.Close();
            }

            return userID; 
        }
        public void InsertGameStats(int userID)
        {
            //Inserting in the Game Stats
            int UserHeroKey = int.Parse(ddlSelectedHero.SelectedValue);
            int OppHeroKey = int.Parse(ddlOpponentHero.SelectedValue);
            string Outcome = ddlOutcome.SelectedValue;
            int ManaLeft = int.Parse(ddlmanaLeft.SelectedValue);
            int HealthLeft = int.Parse(tbxHealthLeft.Text);

            string connString = "DBConnectionString";
            string statInsert = "GameStats_Insert";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connString].ToString());

            try
            {
                SqlCommand savecmd = new SqlCommand();
                savecmd.CommandText = statInsert;
                savecmd.CommandType = CommandType.StoredProcedure;
                savecmd.Connection = conn;
                conn.Open();
                savecmd.Parameters.AddWithValue("@UserHero", UserHeroKey);
                savecmd.Parameters.AddWithValue("@OpponentHero", OppHeroKey);
                savecmd.Parameters.AddWithValue("@Outcome", Outcome);
                savecmd.Parameters.AddWithValue("@Manaleft", ManaLeft);
                savecmd.Parameters.AddWithValue("@Healthleft", HealthLeft);
                savecmd.Parameters.AddWithValue("@UserID", userID);

                savecmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex);
            }
            finally
            {
                conn.Close();
            }

        }
        public int InsertUser(string username)
        {
            //string password = "password";
            string connString = "DBConnectionString";
            string usersInsert = "Users_Insert";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connString].ToString());

            int userID = 0;
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = usersInsert;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                conn.Open();
                cmd.Parameters.AddWithValue("@Username", username);
                //TODO INSERT PASSWORD HERE
                //savecmd.Parameters.AddWithValue("@Pass", password);

                userID = int.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex);
            }
            finally
            {
                conn.Close();
            }
            return userID;
        }

    }
}