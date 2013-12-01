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
            imgSelectedHero.ImageUrl = convertDropDownSelectionToImageURL(ddlSelectedHero);
            imgOpponentHero.ImageUrl = convertDropDownSelectionToImageURL(ddlOpponentHero);
        }

        protected void ItemBound(object sender, RepeaterItemEventArgs args)
        {
            if (args.Item.ItemType == ListItemType.Item || args.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater rep = (Repeater)args.Item.FindControl("OppHeroRepeater");

                HeroStats result = args.Item.DataItem as HeroStats;
                if (result != null)
                {
                    rep.DataSource = result.OpponentStats;
                    rep.DataBind();
                }
            }
        }

        protected void btnAddStats_Click(object sender, EventArgs e)
        {
            pnlviewSection.Visible = false;
            pnlAddSection.Visible = true;
            pnlNoUserFound.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            int userID = userLogin(txtLogin.Text, txtPassword.Text);
            if (userID != 0) {
                hdnUserID.Value = userID.ToString();
                pnlLogin.Visible = false;
                pnlStatMenu.Visible = true;
                txtUsername.Text = txtLogin.Text;
                pnlviewSection.Visible = false;
                pnlAddSection.Visible = false;
                pnlNoUserFound.Visible = false;
                lblOutputMessage.Text = "Login Successfull";
                lblOutputMessage.CssClass = "msgSuccess";
            }
            else
            {
                lblOutputMessage.Text = "Login failed, the username or password is incorrect";
                lblOutputMessage.CssClass = "msgError";
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            int userID = registerUser(txtLogin.Text, txtPassword.Text);
            if (userID != 0) {
                hdnUserID.Value = userID.ToString();
                pnlLogin.Visible = false;
                pnlStatMenu.Visible = true;
                txtUsername.Text = txtLogin.Text;
                pnlviewSection.Visible = false;
                pnlAddSection.Visible = false;
                pnlNoUserFound.Visible = false;
                lblOutputMessage.Text = "Registration Successfull";
                lblOutputMessage.CssClass = "msgSuccess";
            }
            else
            {
                lblOutputMessage.Text = "Register failed, this username may already be taken";
                lblOutputMessage.CssClass = "msgError";
            }
        }

        protected void btnViewStats_Click(object sender, EventArgs e)
        {
            lblSaveStatus.Visible = false;
            pnlAddSection.Visible = false;
            pnlNoUserFound.Visible = false;
            pnlviewSection.Visible = true;
            lblUserDisplay.Text = "<u>" + txtUsername.Text + "'s Stats for each Hero</u>";

            string username = txtUsername.Text;
            int userID = getUserId(username);
            if (userID != 0)
            {
                //Once the View Stats button is pressed the username whose stats have been requested is sent to the DB to retrieve the stats
                HeroRepeater.DataSource = getHeroStats(userID);
                HeroRepeater.DataBind();
            }
            else
            {
                lblOutputMessage.Text = "User not found";
                lblOutputMessage.CssClass = "msgError";
                pnlviewSection.Visible = false;
            }
            
        }

        protected void btnSaveStats_Click(object sender, EventArgs e)
        {
            string userName = txtLogin.Text;
            //int userID = GetUserID(userName);
            int userID = Convert.ToInt32(hdnUserID.Value);
            if (userID != 0)
            {
                //userID = InsertUser(userName);
                insertGameStats(userID);
            }
            else
            {
                //InsertGameStats(userID);
                lblOutputMessage.Text = "Saving stats failed, please log in again";
                lblOutputMessage.CssClass = "msgError";
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
            string directoryPath = ConfigurationManager.AppSettings["imgPath"].ToString();
            string picturePath = "Images/Hearthstone/HeroesPics/";
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

            return String.Concat(directoryPath, picturePath, pictureName, pictureExt);
        }

        private int userLogin(string username, string password)
        {
            int userID = 0;

            string connString = "DBConnectionString";
            string sproc = "Users_LoginUser";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connString].ToString());

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = sproc;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = conn;
                conn.Open();
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Pass", password);

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
                lblOutputMessage.Text = "Error: " + ex;
                lblOutputMessage.CssClass = "msgError";
            }
            finally
            {
                conn.Close();
            }

            return userID; 
        }

        private int getUserId(string username)
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
                lblOutputMessage.Text = "Error: " + ex;
                lblOutputMessage.CssClass = "msgError";
            }
            finally
            {
                conn.Close();
            }

            return userID; 
        }

        public void insertGameStats(int userID)
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
                lblOutputMessage.Text = "Error: " + ex;
                lblOutputMessage.CssClass = "msgError";
            }
            finally
            {
                conn.Close();
                lblOutputMessage.Text = "Stats saved successfully";
                lblOutputMessage.CssClass = "msgSuccess";
            }

        }

        public int registerUser(string username, string password)
        {
            string connString = "DBConnectionString";
            string usersInsert = "Users_Insert";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings[connString].ToString());

            int userID = getUserId(username);
            if (userID == 0)
            {
                try
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = usersInsert;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = conn;
                    conn.Open();
                    cmd.Parameters.AddWithValue("@Username", username);
                    //TODO INSERT PASSWORD HERE
                    cmd.Parameters.AddWithValue("@Pass", password);

                    userID = int.Parse(cmd.ExecuteScalar().ToString());
                    //conn.Open();
                    //using (SqlCommand cmd = new SqlCommand("insert into Users (Username, Pass, TS) values ('" + username + "', '" + password + "', GETDATE())", conn))
                    //{
                    //    lblOutputMessage.Text = "insert into Users (Username, Pass, TS) values ('" + username + "', '" + password + "', GETDATE())";
                    //    cmd.ExecuteNonQuery();
                    //    userID = 1;
                    //}
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex);
                    lblOutputMessage.Text = "Error: " + ex;
                    lblOutputMessage.CssClass = "msgError";
                }
                finally
                {
                    conn.Close();
                }
            }
            else
            {
                return 0;   //this user already exists, return a fail
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
                        heroStat.TotalGames = heroStat.TotalWins + heroStat.TotalLoses;
                        if (heroStat.TotalGames != 0)
                        {
                            heroStat.WinPercentage = (Math.Round(((double)heroStat.TotalWins / heroStat.TotalGames), 2) * 100);
                        }
                        else
                        {
                            heroStat.WinPercentage = 0;
                        }
                        List<OppHeroStats> oppHeroStats = new List<OppHeroStats>();
                        //This is for recording the opponent specific stats
                        for(int i=1; i <= 9; i++)
                        {
                            OppHeroStats oppHeroStat = new OppHeroStats();

                            string sqlGetOppStats = "Hero_GetOppSpecificStats";
                            SqlCommand cmd3 = new SqlCommand(sqlGetOppStats, conn);
                            cmd3.CommandType = CommandType.StoredProcedure;
                            cmd3.Parameters.AddWithValue("@UserID", userID);
                            cmd3.Parameters.AddWithValue("@UserHeroID", heroStat.HeroID);
                            cmd3.Parameters.AddWithValue("@OppHeroID", i);
                            SqlDataAdapter da3 = new SqlDataAdapter(cmd3);

                            DataSet ds3 = new DataSet();
                            da3.Fill(ds3, "result_name4");
                            DataTable dt3 = ds3.Tables["result_name4"];

                            foreach (DataRow row3 in dt3.Rows)
                            {
                                oppHeroStat.Name = row3["OppHero"].ToString();
                                oppHeroStat.Class = row3["OppHeroClass"].ToString();
                                oppHeroStat.TotalWins = int.Parse(row3["TotalWins"].ToString());
                                oppHeroStat.TotalLoses = int.Parse(row3["TotalLoses"].ToString());
                                oppHeroStat.TotalGames = oppHeroStat.TotalWins + oppHeroStat.TotalLoses;
                                if (oppHeroStat.TotalGames != 0)
                                {
                                    oppHeroStat.WinPercentage = (Math.Round(((double)oppHeroStat.TotalWins / oppHeroStat.TotalGames), 2) * 100);
                                }
                                else
                                {
                                    oppHeroStat.WinPercentage = 0;
                                }
                            }
                            oppHeroStats.Add(oppHeroStat);
                        }
                        heroStat.OpponentStats = oppHeroStats;
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