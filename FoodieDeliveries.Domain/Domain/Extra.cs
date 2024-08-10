using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FoodieDeliveries.Domain.Domain
{
    public class Extra : BaseEntity
    {
        [Required]
        public string Name { get; set; }
   public virtual ICollection<ExtraInFoodItem>?  ExtraInFoodItems { get; set; }  


    }
}
