//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Sessiya3
{
    using System;
    using System.Collections.Generic;
    
    public partial class Тариф_Оплата
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Тариф_Оплата()
        {
            this.Города = new HashSet<Города>();
        }
    
        public Nullable<int> Тариф { get; set; }
        public string Оплата { get; set; }
        public int Код_тарифа { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Города> Города { get; set; }
    }
}
