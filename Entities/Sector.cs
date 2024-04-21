using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Sector
    {
        public int ID_Sector { get; set; }
        public string Codigo { get; set; }
        public string Descripcion { get; set; }
        public int ID_Region { get; set; }
    }
}
