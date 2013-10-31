using HearthstoneApplication.Objects;
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

            string userName = tbxUserName.Text;
            int userID = GetUserID(userName);
            if (userID == 0)
            {
                
            }
            else
            {
                //Once the View Stats button is pressed the username whose stats have been requested is sent to the DB to retrieve the stats
                HeroRepeater.DataSource = getHeroStats(userID);
                HeroRepeater.DataBind(); 
            }
            
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

        protected void ddlSelectedHero_SelectedIndexChange(Object sender, EventArgs e)
        {
            imgSelectedHero.ImageUrl = convertDropDownSelectionToImageURL(ddlSelectedHero);
        }

        protected void ddlOpponentHero_SelectedIndexChange(Object sender, EventArgs e)
        {
            imgOpponentHero.ImageUrl = convertDropDownSelectionToImageURL(ddlOpponentHero);
        }

        private string convertDropDownSelectionToImageURL(DropDownList dropDownList)
        {
            int startIndex = dropDownList.SelectedItem.Text.IndexOf(":") + 2;    //skip past the leading blank space
            int endIndex = dropDownList.SelectedItem.Text.Substring(startIndex).IndexOf(" ");
            string picturePath = "/Images/Hearthstone/HeroesPics/";
            string pictureName;
            if (endIndex + startIndex < startIndex)
            {
                pictureName = dropDownList.SelectedItem.Text.Substring(startIndex);
            }
            else
            {
                pictureName = dropDownList.SelectedItem.Text.Substring(startIndex, endIndex);
            }
            string pictureExt = ".jpg";

            return String.Concat(picturePath, pictureName, pictureExt);
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
            int HealthLeft = -1;
            if (tbxHealthLeft.Text != "")
            {
                HealthLeft = int.Parse(tbxHealthLeft.Text);
            }
           
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
                lblSaveStatus.Visible = true;
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

        public List<HeroStats> getHeroStats(int userID)
        {
            List<HeroStats> heroStats = new List<HeroStats>();

            //DB Connection =============================================================
            string connString = "DBConnectionString";
            string sql = "Hero_GetHeroes";
            string sqlGetStats = "User_GetStats";

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connString].ToString());

            try
            {
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                da.Fill(ds, "result_name2");
                DataTable dt = ds.Tables["result_name2"];


                foreach (DataRow row in dt.Rows)
                {
                    HeroStats heroStat = new HeroStats();
                    heroStat.Name = row["Name"].ToString();
                    heroStat.Class = row["Class"].ToString();
                    heroStat.HeroID = int.Parse(row["HeroID"].ToString());

                    //List<OppHeroStats> oppHeroStats = new List<OppHeroStats>();

                    SqlCommand cmmd = new SqlCommand(sqlGetStats, conn);
                    cmmd.CommandType = CommandType.StoredProcedure;
                    cmmd.Parameters.AddWithValue("@UserID", userID);
                    cmmd.Parameters.AddWithValue("@UserHeroID", heroStat.HeroID);
                    SqlDataAdapter da2 = new SqlDataAdapter(cmmd);

                    DataSet ds2 = new DataSet();
                    da2.Fill(ds2, "result_name3");
                    DataTable dt2 = ds2.Tables["result_name3"];

                    foreach (DataRow row2 in dt2.Rows)
                    {
                        heroStat.TotalWins = int.Parse(row2["TotalWins"].ToString());
                        heroStat.TotalLoses = int.Parse(row2["TotalLoses"].ToString());
                    }

                    heroStats.Add(heroStat);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Error: " + e);
            }
            finally
            {
                conn.Close();
            }

            return heroStats;
        }
    }
}