using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProvaFabio.Models;

namespace ProvaFabio.Controllers
{
    public class CabecalhoNFEController : Controller
    {
        private ProvaFabioEntities db = new ProvaFabioEntities();

        // GET: CabecalhoNFE
        public ActionResult Index()
        {
            var cabecalhoNFE = db.CabecalhoNFE.Include(c => c.Fornecedores).ToList();
           
            return View(cabecalhoNFE.ToList());
        }

        // GET: CabecalhoNFE/Produtos/5
        public ActionResult Produtos(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var Produtos = db.CorpoNFE.Where(x => x.Id_NFE == id).ToList();
            ViewBag.idNFE = db.CabecalhoNFE.Find(id);
            return View(Produtos);
        }

        public ActionResult LancaNota(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.cabecalho = db.CabecalhoNFE.Find(id);
            ViewBag.fornecedor = db.Fornecedores.Find(ViewBag.cabecalho.Id_for);
            ViewBag.produtosNota = db.CorpoNFE.Where(x => x.Id_NFE == id).ToList();
 
            return View("NotaFiscal");
        }

        public ActionResult Create()
        {
            ViewBag.Id_for = new SelectList(db.Fornecedores, "Id", "RazaoSocial");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,NumNF,Id_for,TipoNFE,DataEmissao,DataEntrada,HoraEntrada")] CabecalhoNFE cabecalhoNFE)
        {
            if (ModelState.IsValid)
            {
                db.CabecalhoNFE.Add(cabecalhoNFE);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id_for = new SelectList(db.Fornecedores, "Id", "RazaoSocial", cabecalhoNFE.Id_for);
            return View(cabecalhoNFE);
        }

   
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CabecalhoNFE cabecalhoNFE = db.CabecalhoNFE.Find(id);
            if (cabecalhoNFE == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id_for = new SelectList(db.Fornecedores, "Id", "RazaoSocial", cabecalhoNFE.Id_for);
            return View(cabecalhoNFE);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,NumNF,Id_for,TipoNFE,DataEmissao,DataEntrada,HoraEntrada")] CabecalhoNFE cabecalhoNFE)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cabecalhoNFE).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id_for = new SelectList(db.Fornecedores, "Id", "RazaoSocial", cabecalhoNFE.Id_for);
            return View(cabecalhoNFE);
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CabecalhoNFE cabecalhoNFE = db.CabecalhoNFE.Find(id);
            if (cabecalhoNFE == null)
            {
                return HttpNotFound();
            }
            return View(cabecalhoNFE);
        }

   
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CabecalhoNFE cabecalhoNFE = db.CabecalhoNFE.Find(id);
            db.CabecalhoNFE.Remove(cabecalhoNFE);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
