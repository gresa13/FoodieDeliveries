using FoodieDeliveries.Domain.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FoodieDeliveries.Domain.Domain
{
    public class Rating : BaseEntity
    {
        public Guid RestaurantId { get; set; }
        public string CustomerId {  get; set; }

        public Restaurant? Restaurant { get; set; }
        public Customer? Customer { get; set; }

        [Range(1.0, 5.0, ErrorMessage = "Rating must be between 1 and 5.")]
        public double RestaurantRating {  get; set; }
        public DateTime datePosted { get; set; }

    }
}
