using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FoodieDeliveries.Domain.Domain;
using Microsoft.AspNetCore.Identity;
namespace FoodieDeliveries.Domain.Identity
{
    public class Customer : IdentityUser
    {

        public string Name { get; set; }    
        public string Surname { get; set; }  
        public string Address { get; set; }
        public int Age { get; set; }
        public virtual ICollection<Rating>? Ratings { get; set; }    

       
    }
}
