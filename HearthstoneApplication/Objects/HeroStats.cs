using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HearthstoneApplication.Objects
{
    public class HeroStats
    {
        public string Name { get; set; }
        public string Class { get; set; }
        public int HeroID { get; set; }
        public int TotalWins { get; set; }
        public int TotalLoses { get; set; }
        public List<OppHeroStats> OpponentStats { get; set; }
    }
}