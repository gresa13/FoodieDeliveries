using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FoodieDeliveries.Domain.Domain
{
    public class FoodItemInCart : BaseEntity
    {
       public Guid CartId { get; set; }
       public Cart? Cart { get; set; }
        public Guid FoodItemId { get; set; }
        public FoodItem? FoodItem { get; set; }
        public int Quantity { get; set; }

    }
}
