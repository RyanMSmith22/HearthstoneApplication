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
        public int WinTotal { get; set; }
        public int LoseTotal { get; set;} 

    }
}