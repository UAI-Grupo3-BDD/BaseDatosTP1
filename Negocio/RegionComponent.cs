using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BaseDatosTP1;
using Entities;

namespace Negocio
{
    public class RegionComponent
    {
        public List<Entities.Region> Listar()
        {
           DataClasses1DataContext dataClasses1DataContext  = new DataClasses1DataContext();
          
            var regiones = from r in dataClasses1DataContext.Region
                           select r;
            List<Entities.Region> lista = new List<Entities.Region>();
            foreach (var item in regiones)
            {
                Entities.Region region = new Entities.Region();
                region.Id_Region = item.Id_Region;
                region.Descripcion = item.Descripcion;
                region.Codigo=item.Codigo;
                region.Empresa = item.Empresa;
                lista.Add(region);
            }
            return lista;
          
        }
    }
}
