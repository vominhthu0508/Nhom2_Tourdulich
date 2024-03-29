﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.DAO;
namespace TourWeb.Controllers
{
    public class TourController : Controller
    {
        //
        // GET: /Tour/

        //
        // GET: /Tour/Details/5
        public ActionResult Danhsach(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new TourDAO();
            var model = dao.TimTour(searchString, page, pageSize);

            ViewBag.SearchString = searchString;
            return View(model);
        }



        //
        // GET: /Tour/Create
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Tour/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Tour/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Tour/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Tour/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Tour/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        
    }
}
