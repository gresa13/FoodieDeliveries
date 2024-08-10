using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FoodieDeliveries.Domain.Domain
{
    public class FoodItem : BaseEntity
    {
        [Required]
        public string Name { get; set; }
        public string Description { get; set; }
        public int TimesOrdered { get; set; }
        [Required]
        public double Price { get; set; }
        public string Image { get; set; }
        public Guid RestaurantId { get; set; }
         public Restaurant? Restaurant { get; set; }
        public virtual ICollection<ExtraInFoodItem>? ExtrasInFoodItem { get; set; }
        public virtual ICollection<FoodItemInCart>? FoodItemsInCarts { get; set; }
        public virtual ICollection<FoodItemInOrder>? Orders { get; set; }



    }
}
