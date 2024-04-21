using BaseDatosTP1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UsuarioInternoComponent
    {
        public List<Entities.UsuarioInterno> Listar()
        {
            DataClasses1DataContext dataClasses1DataContext = new DataClasses1DataContext();

            var regiones = from r in dataClasses1DataContext.UsuarioInterno
                           select r;
            List<Entities.UsuarioInterno> lista = new List<Entities.UsuarioInterno>();
            foreach (var item in regiones)
            {
                Entities.UsuarioInterno usuario = new Entities.UsuarioInterno();
                usuario.Id_UsuarioInterno = item.Id_UsuarioInterno;
                usuario.Nombre = item.Nombre;

                usuario.Email = item.Email;
                usuario.CarpetaInforme = item.CarpetaInforme;
                usuario.Username = item.Username;


                lista.Add(usuario);
            }
            return lista;



        }
    }
}
