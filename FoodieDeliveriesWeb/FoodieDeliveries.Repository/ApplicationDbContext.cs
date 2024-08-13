using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using FoodieDeliveries.Domain;
using FoodieDeliveries.Domain.Domain;



namespace FoodieDeliveries.Repository
{
    public class ApplicationDbContext : IdentityDbContext<Domain.Identity.Customer>
    {
        DbSet<Restaurant> Restaurants { get; set; }
        DbSet<FoodItem> FoodItems { get; set; }
        DbSet<Cart> Cart {  get; set; }
        DbSet<FoodItemInCart> FoodItemsInCart {  get; set; }
        DbSet<FoodItemInOrder> FoodItemsInOrder {  get; set; }
        DbSet<Order> Order{  get; set; }
        DbSet<Rating> Rating{  get; set; }
        DbSet<Extra> Extra{  get; set; }
        DbSet<ExtraInFoodItem> ExtraInFoodItems { get; set; }






        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<FoodItemInOrder>()
                .HasOne(f => f.Order)
                .WithMany(o => o.OrderedItems)
                .HasForeignKey(f => f.OrderId)
                .OnDelete(DeleteBehavior.NoAction); // Prevents any delete action

            modelBuilder.Entity<FoodItemInOrder>()
                .HasOne(f => f.FoodItem)
                .WithMany(fi => fi.Orders)
                .HasForeignKey(f => f.FoodItemId)
                .OnDelete(DeleteBehavior.NoAction); // Prevents any delete action
        }


    }
}
