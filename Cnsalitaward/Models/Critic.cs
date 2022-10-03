using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Cnsalitaward.Models
{
    public class Critic
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string Content { get; set; }
        public DateTime Date { get; set; }
        public int View { get; set; }
        public int Like { get; set; }
        public string Work{ get; set; }
        public string UserID { get; set; }

    }
}