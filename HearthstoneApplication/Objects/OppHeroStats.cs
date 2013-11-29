using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HearthstoneApplication.Objects
{
    public class OppHeroStats
    {
        public string Name { get; set; }
        public string Class { get; set; }
        public int HeroID { get; set; }
        public int TotalGames { get; set; }
        public double WinPercentage { get; set; }
        public int TotalWins { get; set; }
        public int TotalLoses { get; set;} 

    }
}