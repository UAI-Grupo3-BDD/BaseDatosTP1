using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class SectorDetalle
    {
        public int id_SectorDetalle { get; set; }
        public string Codigo { get; set; }
        public string Area { get; set; }
        public string Detalle { get; set; }
        public int id_Sector { get; set; }
        public int ResponsableInstalacion { get; set; }
        public int GestorAdministrativo { get; set; }
        public int SupervisorInstalacion { get; set; }
        public int ResponsableZonalSP { get; set; }
        public int GerenteRegional { get; set; }
        public int RepresentanteSP { get; set; }
        public int DirectorTecnico { get; set; }
    }
}
