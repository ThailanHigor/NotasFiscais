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
    public class CorpoNFEController : Controller
    {
        private ProvaFabioEntities db = new ProvaFabioEntities();

        // GET: CorpoNFE
        public ActionResult Index()
        {
            var corpoNFE = db.CorpoNFE.Include(c => c.CabecalhoNFE).Include(c => c.Produtos);
            return View(corpoNFE.ToList());
        }

           // GET: CorpoNFE/Create
        public ActionResult AdicionarProdutos(int id)
        {
            ViewBag.Nota = db.CabecalhoNFE.Where(x => x.Id == id).FirstOrDefault();

            ViewBag.NumNFE = new SelectList(db.CabecalhoNFE, "NumNF", "NumNF");
            ViewBag.Id_prod = new SelectList(db.Produtos, "Id", "Descricao");
            return View("Create");
        }

        // POST: CorpoNFE/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Id_NFE,NumNFE,Id_prod,Quantidade,CustoUnit,IPI,ICMS,ISS,ValorTotal")] CorpoNFE corpoNFE)
        {
            if (ModelState.IsValid)
            {
                //regras de imposto
                var IPI = corpoNFE.CustoUnit * (corpoNFE.IPI / 100);
                var ICMS = corpoNFE.CustoUnit * (corpoNFE.ICMS / 100);
                var ISS = corpoNFE.CustoUnit * (corpoNFE.ISS / 100);
             
                var valorTotal = (corpoNFE.Quantidade * corpoNFE.CustoUnit) + (IPI + ICMS + ISS);
                var valorUnitProduto = corpoNFE.CustoUnit + (IPI + ICMS + ISS);
                //get nota
                var idCabecalho = db.CabecalhoNFE.Where(x => x.NumNF == corpoNFE.NumNFE).FirstOrDefault();

                //set novos campos
                corpoNFE.Id_NFE = idCabecalho.Id;
                corpoNFE.ValorTotal = valorTotal;

                //altera quantidade e valor do produto
                var produto = db.Produtos.Where(x => x.Id == corpoNFE.Id_prod).First();
                if(idCabecalho.TipoNFE == "E")
                {
                    produto.Quantidade = produto.Quantidade + corpoNFE.Quantidade;
                    produto.CustoAtu = valorUnitProduto;
                }
                else if (idCabecalho.TipoNFE == "S")
                {
                    produto.Quantidade = produto.Quantidade - corpoNFE.Quantidade;
                }

                db.Entry(produto).State = EntityState.Modified;
                db.CorpoNFE.Add(corpoNFE);
                db.SaveChanges();
                return RedirectToAction("Produtos", "CabecalhoNFE",new { id = corpoNFE.Id_NFE });
            }

            return View(corpoNFE);
        }
        // GET: CorpoNFE/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CorpoNFE corpoNFE = db.CorpoNFE.Find(id);
            var cabecalho = db.CabecalhoNFE.Where(x => x.NumNF == corpoNFE.NumNFE).FirstOrDefault();
            if (corpoNFE == null)
            {
                return HttpNotFound();
            }

            var produto = db.Produtos.Where(x => x.Id == corpoNFE.Id_prod).First();
            if (cabecalho.TipoNFE == "E")
            {
                produto.Quantidade = produto.Quantidade - corpoNFE.Quantidade;
     
            }
            else if (cabecalho.TipoNFE == "S")
            {
                produto.Quantidade = produto.Quantidade + corpoNFE.Quantidade;
            }

            db.Entry(produto).State = EntityState.Modified;
           
            db.CorpoNFE.Remove(corpoNFE);
            db.SaveChanges();
            return RedirectToAction("Produtos", "CabecalhoNFE", new { id = cabecalho.Id });

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
