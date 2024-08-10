using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FoodieDeliveries.Domain.Domain
{
    public class ExtraInFoodItem : BaseEntity
    {
        public double Price { get; set; }
        public FoodItem? FoodItem { get; set; }
        public Guid? FoodId { get; set; }

        public Extra? Extra { get; set; }
        public Guid ExtraId { get; set; }



    }
}
