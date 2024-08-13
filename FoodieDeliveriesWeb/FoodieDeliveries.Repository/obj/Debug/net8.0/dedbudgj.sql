IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

CREATE TABLE [AspNetRoles] (
    [Id] nvarchar(450) NOT NULL,
    [Name] nvarchar(256) NULL,
    [NormalizedName] nvarchar(256) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [AspNetUsers] (
    [Id] nvarchar(450) NOT NULL,
    [Name] nvarchar(max) NOT NULL,
    [Surname] nvarchar(max) NOT NULL,
    [Address] nvarchar(max) NOT NULL,
    [Age] int NOT NULL,
    [UserName] nvarchar(256) NULL,
    [NormalizedUserName] nvarchar(256) NULL,
    [Email] nvarchar(256) NULL,
    [NormalizedEmail] nvarchar(256) NULL,
    [EmailConfirmed] bit NOT NULL,
    [PasswordHash] nvarchar(max) NULL,
    [SecurityStamp] nvarchar(max) NULL,
    [ConcurrencyStamp] nvarchar(max) NULL,
    [PhoneNumber] nvarchar(max) NULL,
    [PhoneNumberConfirmed] bit NOT NULL,
    [TwoFactorEnabled] bit NOT NULL,
    [LockoutEnd] datetimeoffset NULL,
    [LockoutEnabled] bit NOT NULL,
    [AccessFailedCount] int NOT NULL,
    CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Extra] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_Extra] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [Restaurants] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NOT NULL,
    [Address] nvarchar(max) NOT NULL,
    [IsOpen] bit NOT NULL,
    [AverageRating] float NOT NULL,
    [Image] nvarchar(max) NOT NULL,
    [PhoneNumber] nvarchar(max) NOT NULL,
    [BaseDeliveryFee] float NOT NULL,
    CONSTRAINT [PK_Restaurants] PRIMARY KEY ([Id])
);
GO

CREATE TABLE [AspNetRoleClaims] (
    [Id] int NOT NULL IDENTITY,
    [RoleId] nvarchar(450) NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [AspNetUserClaims] (
    [Id] int NOT NULL IDENTITY,
    [UserId] nvarchar(450) NOT NULL,
    [ClaimType] nvarchar(max) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [AspNetUserLogins] (
    [LoginProvider] nvarchar(128) NOT NULL,
    [ProviderKey] nvarchar(128) NOT NULL,
    [ProviderDisplayName] nvarchar(max) NULL,
    [UserId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
    CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [AspNetUserRoles] (
    [UserId] nvarchar(450) NOT NULL,
    [RoleId] nvarchar(450) NOT NULL,
    CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
    CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [AspNetUserTokens] (
    [UserId] nvarchar(450) NOT NULL,
    [LoginProvider] nvarchar(128) NOT NULL,
    [Name] nvarchar(128) NOT NULL,
    [Value] nvarchar(max) NULL,
    CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
    CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [Cart] (
    [Id] uniqueidentifier NOT NULL,
    [CustomerId] nvarchar(450) NOT NULL,
    [OrderAmount] float NOT NULL,
    [DeliveryFee] float NOT NULL,
    [AdditionalInfo] nvarchar(max) NULL,
    CONSTRAINT [PK_Cart] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Cart_AspNetUsers_CustomerId] FOREIGN KEY ([CustomerId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [FoodItems] (
    [Id] uniqueidentifier NOT NULL,
    [Name] nvarchar(max) NOT NULL,
    [Description] nvarchar(max) NOT NULL,
    [TimesOrdered] int NOT NULL,
    [Price] float NOT NULL,
    [Image] nvarchar(max) NOT NULL,
    [RestaurantId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_FoodItems] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_FoodItems_Restaurants_RestaurantId] FOREIGN KEY ([RestaurantId]) REFERENCES [Restaurants] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [Order] (
    [Id] uniqueidentifier NOT NULL,
    [CustomerId] nvarchar(450) NOT NULL,
    [RestaurantId] uniqueidentifier NOT NULL,
    [Status] nvarchar(max) NOT NULL,
    [OrderDate] datetime2 NULL,
    [AdditionalInfo] nvarchar(max) NULL,
    [TotalAmount] float NOT NULL,
    CONSTRAINT [PK_Order] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Order_AspNetUsers_CustomerId] FOREIGN KEY ([CustomerId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Order_Restaurants_RestaurantId] FOREIGN KEY ([RestaurantId]) REFERENCES [Restaurants] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [Rating] (
    [Id] uniqueidentifier NOT NULL,
    [RestaurantId] uniqueidentifier NOT NULL,
    [CustomerId] nvarchar(450) NOT NULL,
    [RestaurantRating] float NOT NULL,
    [datePosted] datetime2 NOT NULL,
    CONSTRAINT [PK_Rating] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Rating_AspNetUsers_CustomerId] FOREIGN KEY ([CustomerId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Rating_Restaurants_RestaurantId] FOREIGN KEY ([RestaurantId]) REFERENCES [Restaurants] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [ExtraInFoodItems] (
    [Id] uniqueidentifier NOT NULL,
    [Price] float NOT NULL,
    [FoodItemId] uniqueidentifier NULL,
    [FoodId] uniqueidentifier NULL,
    [ExtraId] uniqueidentifier NOT NULL,
    CONSTRAINT [PK_ExtraInFoodItems] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ExtraInFoodItems_Extra_ExtraId] FOREIGN KEY ([ExtraId]) REFERENCES [Extra] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_ExtraInFoodItems_FoodItems_FoodItemId] FOREIGN KEY ([FoodItemId]) REFERENCES [FoodItems] ([Id])
);
GO

CREATE TABLE [FoodItemsInCart] (
    [Id] uniqueidentifier NOT NULL,
    [CartId] uniqueidentifier NOT NULL,
    [FoodItemId] uniqueidentifier NOT NULL,
    [Quantity] int NOT NULL,
    CONSTRAINT [PK_FoodItemsInCart] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_FoodItemsInCart_Cart_CartId] FOREIGN KEY ([CartId]) REFERENCES [Cart] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_FoodItemsInCart_FoodItems_FoodItemId] FOREIGN KEY ([FoodItemId]) REFERENCES [FoodItems] ([Id]) ON DELETE CASCADE
);
GO

CREATE TABLE [FoodItemsInOrder] (
    [Id] uniqueidentifier NOT NULL,
    [OrderId] uniqueidentifier NOT NULL,
    [FoodItemId] uniqueidentifier NOT NULL,
    [Quantity] int NOT NULL,
    CONSTRAINT [PK_FoodItemsInOrder] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_FoodItemsInOrder_FoodItems_FoodItemId] FOREIGN KEY ([FoodItemId]) REFERENCES [FoodItems] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_FoodItemsInOrder_Order_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [Order] ([Id]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
GO

CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL;
GO

CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
GO

CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
GO

CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
GO

CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
GO

CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL;
GO

CREATE INDEX [IX_Cart_CustomerId] ON [Cart] ([CustomerId]);
GO

CREATE INDEX [IX_ExtraInFoodItems_ExtraId] ON [ExtraInFoodItems] ([ExtraId]);
GO

CREATE INDEX [IX_ExtraInFoodItems_FoodItemId] ON [ExtraInFoodItems] ([FoodItemId]);
GO

CREATE INDEX [IX_FoodItems_RestaurantId] ON [FoodItems] ([RestaurantId]);
GO

CREATE INDEX [IX_FoodItemsInCart_CartId] ON [FoodItemsInCart] ([CartId]);
GO

CREATE INDEX [IX_FoodItemsInCart_FoodItemId] ON [FoodItemsInCart] ([FoodItemId]);
GO

CREATE INDEX [IX_FoodItemsInOrder_FoodItemId] ON [FoodItemsInOrder] ([FoodItemId]);
GO

CREATE INDEX [IX_FoodItemsInOrder_OrderId] ON [FoodItemsInOrder] ([OrderId]);
GO

CREATE INDEX [IX_Order_CustomerId] ON [Order] ([CustomerId]);
GO

CREATE INDEX [IX_Order_RestaurantId] ON [Order] ([RestaurantId]);
GO

CREATE INDEX [IX_Rating_CustomerId] ON [Rating] ([CustomerId]);
GO

CREATE INDEX [IX_Rating_RestaurantId] ON [Rating] ([RestaurantId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20240811165731_two', N'8.0.7');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [FoodItemsInOrder] DROP CONSTRAINT [FK_FoodItemsInOrder_FoodItems_FoodItemId];
GO

ALTER TABLE [FoodItemsInOrder] DROP CONSTRAINT [FK_FoodItemsInOrder_Order_OrderId];
GO

ALTER TABLE [FoodItemsInOrder] ADD CONSTRAINT [FK_FoodItemsInOrder_FoodItems_FoodItemId] FOREIGN KEY ([FoodItemId]) REFERENCES [FoodItems] ([Id]) ON DELETE NO ACTION;
GO

ALTER TABLE [FoodItemsInOrder] ADD CONSTRAINT [FK_FoodItemsInOrder_Order_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [Order] ([Id]) ON DELETE NO ACTION;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20240811170642_three', N'8.0.7');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20240811170736_threee', N'8.0.7');
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

ALTER TABLE [FoodItemsInOrder] DROP CONSTRAINT [FK_FoodItemsInOrder_FoodItems_FoodItemId];
GO

ALTER TABLE [FoodItemsInOrder] DROP CONSTRAINT [FK_FoodItemsInOrder_Order_OrderId];
GO

ALTER TABLE [FoodItemsInOrder] ADD CONSTRAINT [FK_FoodItemsInOrder_FoodItems_FoodItemId] FOREIGN KEY ([FoodItemId]) REFERENCES [FoodItems] ([Id]);
GO

ALTER TABLE [FoodItemsInOrder] ADD CONSTRAINT [FK_FoodItemsInOrder_Order_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [Order] ([Id]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20240811170948_threeee', N'8.0.7');
GO

COMMIT;
GO

