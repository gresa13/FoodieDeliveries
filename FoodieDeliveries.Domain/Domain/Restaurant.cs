using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FoodieDeliveries.Domain.Domain
{
    public class Restaurant : BaseEntity
    {
        [Required]
        public string Name{ get; set; }
        [Required]
        public string Address{ get; set; }
        [Required]
        public bool IsOpen { get; set;}
        [Required]
        public double AverageRating { get; set; } = 0.0;
        [Required]
        public string Image {  get; set; }
        [Required]
        public string PhoneNumber { get; set; }
        [Required]
        public double BaseDeliveryFee { get; set; }
        public virtual ICollection<Rating>? Ratings { get; set; }



    }
}
