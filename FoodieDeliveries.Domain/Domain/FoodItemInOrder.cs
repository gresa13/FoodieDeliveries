using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FoodieDeliveries.Domain.Domain
{
    public class FoodItemInOrder : BaseEntity
    {
        public Guid OrderId { get; set; }
        public Guid FoodItemId { get; set; }

        public int Quantity { get; set; }
        public FoodItem? FoodItem { get; set; }
        public Order? Order { get; set; }    

    }
}
