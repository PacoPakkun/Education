using Lab2Sharp.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab2Sharp.Domain
{
    class Participant : Entity<int>
    {

        public String nume { get; set; }
        public int varsta { get; set; }

        public override string ToString()
        {
            return base.ToString() + " " + nume + ", " + varsta;
        }
    }
}
