//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ChiTietTour
    {
        public int MaCTTour { get; set; }
        public int MaTour { get; set; }
        public int MaDiaDiem { get; set; }
    
        public virtual DiaDiem DiaDiem { get; set; }
        public virtual Tour Tour { get; set; }
    }
}
