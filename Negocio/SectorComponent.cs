using BaseDatosTP1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class SectorComponent
    {
        public List<Entities.Sector> Listar()
        {
            DataClasses1DataContext dataClasses1DataContext = new DataClasses1DataContext();

            var regiones = from r in dataClasses1DataContext.Sector
                           select r;
            List<Entities.Sector> lista = new List<Entities.Sector>();
            foreach (var item in regiones)
            {
                Entities.Sector sector = new Entities.Sector();
                sector.ID_Sector = item.ID_Sector;
                sector.Codigo = item.Codigo;
                sector.Descripcion = item.Descripcion;
                sector.ID_Region = item.ID_Region;
                lista.Add(sector);
               
            }
            return lista;

        }
    }
}
