using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class SectorDetalleComponent
    {
        public List<Entities.SectorDetalle> Listar()
        {
            BaseDatosTP1.DataClasses1DataContext dataClasses1DataContext = new BaseDatosTP1.DataClasses1DataContext();

            var regiones = from r in dataClasses1DataContext.SectorDetalle
                           select r;
            List<Entities.SectorDetalle> lista = new List<Entities.SectorDetalle>();
            foreach (var item in regiones)
            {
                Entities.SectorDetalle sectorDetalle = new Entities.SectorDetalle();
                sectorDetalle.id_SectorDetalle = item.id_SectorDetalle;
                sectorDetalle.Codigo = item.Codigo;
                sectorDetalle.Area = item.Area;
                sectorDetalle.Detalle = item.Detalle;
                sectorDetalle.id_Sector = item.id_Sector;
                sectorDetalle.ResponsableInstalacion = item.ResponsableInstalacion;
                sectorDetalle.GestorAdministrativo = item.GestorAdministrativo;
                sectorDetalle.SupervisorInstalacion = item.SupervisorInstalacion;
                sectorDetalle.ResponsableZonalSP = item.ResponsableZonalSP;
                sectorDetalle.GerenteRegional = item.GerenteRegional;
                sectorDetalle.RepresentanteSP = item.RepresentanteSP;
                sectorDetalle.DirectorTecnico = item.DirectorTecnico;
                lista.Add(sectorDetalle);

            }
            return lista;

        }
    }
}
