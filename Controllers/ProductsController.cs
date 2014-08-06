﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Maderna.Models;
using System.IO;

namespace Maderna.Controllers
{
    public class ProductsController : Controller
    {
        private Maderna.Models.Model2Container db = new Maderna.Models.Model2Container();

        // GET: /Products/
        public ActionResult Index()
        {
            ViewBag.ActivePage = "Products";
            return View(db.Products.ToList());
        }

        // GET: /Products/Details/5
        public ActionResult Details(int? id)
        {
            ViewBag.ActivePage = "Products";
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products products = db.Products.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            return View(products);
        }

        // GET: /Products/Create
        public ActionResult Create()
        {
            ViewBag.ActivePage = "Products";
            return View();
        }

        // POST: /Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Description,Category,Gallery,MainPicture,CreatedBy,DateCreated,LastUpdate,Status")] Products products)
        {
            ViewBag.ActivePage = "Products";
            SaveDropzoneJsUploadedFiles();
            if (ModelState.IsValid)
            {
                products.DateCreated = System.DateTime.Now;
                Maderna.Models.Users User = new Maderna.Models.Users();
                products.CreatedBy = 1;
                products.Status = 1;
                db.Products.Add(products);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(products);
        }

        // GET: /Products/Edit/5
        public ActionResult Edit(int? id)
        {
            ViewBag.ActivePage = "Products";
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products products = db.Products.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            return View(products);
        }

        // POST: /Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Description,Category,Gallery,MainPicture,CreatedBy,DateCreated,LastUpdate,Status")] Products products)
        {
            ViewBag.ActivePage = "Products";
            if (ModelState.IsValid)
            {
                db.Entry(products).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(products);
        }

        // GET: /Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products products = db.Products.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            return View(products);
        }

        // POST: /Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Products products = db.Products.Find(id);
            db.Products.Remove(products);
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

        /// <summary>
        /// to Save DropzoneJs Uploaded Files
        /// </summary>
        public ActionResult SaveDropzoneJsUploadedFiles()
        {
            bool isSavedSuccessfully = false;

            foreach (string fileName in Request.Files)
            {
                HttpPostedFileBase file = Request.Files[fileName];

                var FileName = Path.GetFileName(file.FileName);
                var FullPath = Path.Combine(Server.MapPath("~/Images/"), fileName);
                file.SaveAs(FullPath);
                Maderna.Models.Pictures Picture = new Maderna.Models.Pictures();
                
                Picture.DateCreated = System.DateTime.Now;
                Picture.LastUpdate = System.DateTime.Now;
                Picture.Path = FullPath;
                Picture.Status = Status.ActiveStatus();
                
                db.Pictures.Add(Picture);
                //db.SaveChanges();

                isSavedSuccessfully = true;
            }

            return Json(new { Message = string.Empty });

        }
    }
}
