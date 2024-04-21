using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Entities;
using Negocio;
namespace API.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            RegionComponent regionComponnt = new RegionComponent();
            List<Region> regions = new List<Region>();

            regions= regionComponnt.Listar();
            return View(regions);
        }

        public ActionResult About()
        {
           UsuarioInternoComponent usuarioInternoComponent = new UsuarioInternoComponent();

            return View(usuarioInternoComponent.Listar());
        }

        public ActionResult Contact()
        {
           SectorComponent sectorComponent = new SectorComponent();
            return View(sectorComponent.Listar());


        }

        public ActionResult SectorDetalle()
        {
            SectorDetalleComponent sectorDetalleComponent = new SectorDetalleComponent();
            return View(sectorDetalleComponent.Listar());


        }
    }
}