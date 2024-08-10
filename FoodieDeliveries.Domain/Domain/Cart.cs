using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FoodieDeliveries.Domain.Identity;

namespace FoodieDeliveries.Domain.Domain
{
    public class Cart : BaseEntity
    {
        public string CustomerId {  get; set; }
        public Customer? Customer { get; set; }

        public double OrderAmount { get; set; }
        public double DeliveryFee { get; set; } 
        public string? AdditionalInfo {  get; set; }

        public virtual ICollection<FoodItemInCart>? FoodItems { get; set; }



    }
}
