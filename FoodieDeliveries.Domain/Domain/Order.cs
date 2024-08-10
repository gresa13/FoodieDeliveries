using FoodieDeliveries.Domain.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FoodieDeliveries.Domain.Domain
{
    public class Order : BaseEntity
    {
        public string CustomerId { get; set; }
        public Guid RestaurantId { get; set; }
        public Customer? Customer { get; set; }
        public Restaurant? Restaurant { get; set; } 

        public string Status { get; set; }  
        public DateTime? OrderDate {  get; set; }
        public string? AdditionalInfo { get; set; }
        public double TotalAmount {  get; set; }

        public virtual ICollection<FoodItemInOrder>? OrderedItems { get; set; }

       
    }
}
