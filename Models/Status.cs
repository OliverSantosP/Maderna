//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Maderna.Models
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    public partial class Status
    {
        public Status()
        {
            this.Products = new HashSet<Products>();
            this.Users = new HashSet<Users>();
            this.Pictures = new HashSet<Pictures>();
            this.Categories = new HashSet<Categories>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
    
        public virtual ICollection<Products> Products { get; set; }
        public virtual ICollection<Users> Users { get; set; }
        public virtual ICollection<Pictures> Pictures { get; set; }
        public virtual ICollection<Categories> Categories { get; set; }

        public static int ActiveStatus()
        {
            Maderna.Models.Model2Container db = new Maderna.Models.Model2Container();
            var StatusId = from c in db.Status where c.Name == "Active" select c.Id;
            return StatusId.FirstOrDefault();
        }
    }
}
