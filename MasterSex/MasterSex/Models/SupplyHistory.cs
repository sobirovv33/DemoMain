//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MasterSex.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class SupplyHistory
    {
        public int id { get; set; }
        public Nullable<int> idHistoryMaterial { get; set; }
        public Nullable<int> Amount { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
    
        public virtual HistoryMaterial HistoryMaterial { get; set; }
    }
}
