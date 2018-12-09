using ProvaFabio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProvaFabio.Controllers
{
    public class HomeController : Controller
    {
        private ProvaFabioEntities db = new ProvaFabioEntities();

        public ActionResult Index()
        {
            ViewBag.Clientes = db.Clientes.Count();
            ViewBag.Fornecedores = db.Fornecedores.Count();
            ViewBag.Grupos = db.Grupo.Count();
            ViewBag.Notas = db.CabecalhoNFE.Count();
            ViewBag.Produtos = db.Produtos.Count();
            
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}