//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProvaFabio.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CorpoNFE
    {
        public int Id { get; set; }
        public Nullable<int> Id_NFE { get; set; }
        public string NumNFE { get; set; }
        public Nullable<int> Id_prod { get; set; }
        public Nullable<decimal> Quantidade { get; set; }
        public Nullable<decimal> CustoUnit { get; set; }
        public Nullable<decimal> IPI { get; set; }
        public Nullable<decimal> ICMS { get; set; }
        public Nullable<decimal> ISS { get; set; }
        public Nullable<decimal> ValorTotal { get; set; }
    
        public virtual CabecalhoNFE CabecalhoNFE { get; set; }
        public virtual Produtos Produtos { get; set; }
    }
}
