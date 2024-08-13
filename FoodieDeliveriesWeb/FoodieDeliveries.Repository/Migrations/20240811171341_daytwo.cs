using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FoodieDeliveries.Repository.Migrations
{
    /// <inheritdoc />
    public partial class daytwo : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_FoodItemsInOrder_FoodItems_FoodItemId",
                table: "FoodItemsInOrder");

            migrationBuilder.DropForeignKey(
                name: "FK_FoodItemsInOrder_Order_OrderId",
                table: "FoodItemsInOrder");

            migrationBuilder.AddForeignKey(
                name: "FK_FoodItemsInOrder_FoodItems_FoodItemId",
                table: "FoodItemsInOrder",
                column: "FoodItemId",
                principalTable: "FoodItems",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_FoodItemsInOrder_Order_OrderId",
                table: "FoodItemsInOrder",
                column: "OrderId",
                principalTable: "Order",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_FoodItemsInOrder_FoodItems_FoodItemId",
                table: "FoodItemsInOrder");

            migrationBuilder.DropForeignKey(
                name: "FK_FoodItemsInOrder_Order_OrderId",
                table: "FoodItemsInOrder");

            migrationBuilder.AddForeignKey(
                name: "FK_FoodItemsInOrder_FoodItems_FoodItemId",
                table: "FoodItemsInOrder",
                column: "FoodItemId",
                principalTable: "FoodItems",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_FoodItemsInOrder_Order_OrderId",
                table: "FoodItemsInOrder",
                column: "OrderId",
                principalTable: "Order",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
