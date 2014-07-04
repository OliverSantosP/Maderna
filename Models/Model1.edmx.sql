
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/04/2014 16:10:43
-- Generated from EDMX file: C:\Users\Oliver Santos\Documents\Visual Studio 2013\Projects\Maderna\Maderna\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Maderna];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ProductsStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Status] DROP CONSTRAINT [FK_ProductsStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductsUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_ProductsUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductsCategories]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Categories] DROP CONSTRAINT [FK_ProductsCategories];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductsGalleries]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Galleries] DROP CONSTRAINT [FK_ProductsGalleries];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductsPictures]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pictures] DROP CONSTRAINT [FK_ProductsPictures];
GO
IF OBJECT_ID(N'[dbo].[FK_CategoriesStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Status] DROP CONSTRAINT [FK_CategoriesStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_GalleriesStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Status] DROP CONSTRAINT [FK_GalleriesStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_ClientsGalleries]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Galleries] DROP CONSTRAINT [FK_ClientsGalleries];
GO
IF OBJECT_ID(N'[dbo].[FK_ClientsPictures]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pictures] DROP CONSTRAINT [FK_ClientsPictures];
GO
IF OBJECT_ID(N'[dbo].[FK_ClientsStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Status] DROP CONSTRAINT [FK_ClientsStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_UsersStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Status] DROP CONSTRAINT [FK_UsersStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_PicturesGalleries]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Galleries] DROP CONSTRAINT [FK_PicturesGalleries];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[Clients]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Clients];
GO
IF OBJECT_ID(N'[dbo].[Galleries]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Galleries];
GO
IF OBJECT_ID(N'[dbo].[Pictures]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pictures];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Status]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Status];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NULL,
    [Category] int  NOT NULL,
    [Gallery] int  NOT NULL,
    [MainPicture] int  NOT NULL,
    [CreatedBy] nvarchar(max)  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [LastUpdate] datetime  NOT NULL,
    [Status] int  NOT NULL
);
GO

-- Creating table 'Clients'
CREATE TABLE [dbo].[Clients] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Gallery] int  NOT NULL,
    [MainPicture] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [LastUpdate] datetime  NOT NULL,
    [Status] int  NOT NULL
);
GO

-- Creating table 'Galleries'
CREATE TABLE [dbo].[Galleries] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [LastUpdate] datetime  NOT NULL,
    [Status] int  NOT NULL,
    [Product_Id] int  NOT NULL,
    [Client_Id] int  NOT NULL,
    [Picture_Id] int  NOT NULL
);
GO

-- Creating table 'Pictures'
CREATE TABLE [dbo].[Pictures] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Gallery] int  NOT NULL,
    [Path] nvarchar(max)  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [Status] int  NOT NULL,
    [Product_Id] int  NOT NULL,
    [Client_Id] int  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Status] int  NOT NULL,
    [Product_Id] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [LastLoginDate] int  NOT NULL,
    [Status] int  NOT NULL,
    [Product_Id] int  NOT NULL
);
GO

-- Creating table 'Status'
CREATE TABLE [dbo].[Status] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Product_Id] int  NOT NULL,
    [Category_Id] int  NOT NULL,
    [Gallery_Id] int  NOT NULL,
    [Client_Id] int  NOT NULL,
    [User_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Clients'
ALTER TABLE [dbo].[Clients]
ADD CONSTRAINT [PK_Clients]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Galleries'
ALTER TABLE [dbo].[Galleries]
ADD CONSTRAINT [PK_Galleries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pictures'
ALTER TABLE [dbo].[Pictures]
ADD CONSTRAINT [PK_Pictures]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [PK_Status]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Product_Id] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [FK_ProductsStatus]
    FOREIGN KEY ([Product_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductsStatus'
CREATE INDEX [IX_FK_ProductsStatus]
ON [dbo].[Status]
    ([Product_Id]);
GO

-- Creating foreign key on [Product_Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_ProductsUsers]
    FOREIGN KEY ([Product_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductsUsers'
CREATE INDEX [IX_FK_ProductsUsers]
ON [dbo].[Users]
    ([Product_Id]);
GO

-- Creating foreign key on [Product_Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [FK_ProductsCategories]
    FOREIGN KEY ([Product_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductsCategories'
CREATE INDEX [IX_FK_ProductsCategories]
ON [dbo].[Categories]
    ([Product_Id]);
GO

-- Creating foreign key on [Product_Id] in table 'Galleries'
ALTER TABLE [dbo].[Galleries]
ADD CONSTRAINT [FK_ProductsGalleries]
    FOREIGN KEY ([Product_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductsGalleries'
CREATE INDEX [IX_FK_ProductsGalleries]
ON [dbo].[Galleries]
    ([Product_Id]);
GO

-- Creating foreign key on [Product_Id] in table 'Pictures'
ALTER TABLE [dbo].[Pictures]
ADD CONSTRAINT [FK_ProductsPictures]
    FOREIGN KEY ([Product_Id])
    REFERENCES [dbo].[Products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductsPictures'
CREATE INDEX [IX_FK_ProductsPictures]
ON [dbo].[Pictures]
    ([Product_Id]);
GO

-- Creating foreign key on [Category_Id] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [FK_CategoriesStatus]
    FOREIGN KEY ([Category_Id])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoriesStatus'
CREATE INDEX [IX_FK_CategoriesStatus]
ON [dbo].[Status]
    ([Category_Id]);
GO

-- Creating foreign key on [Gallery_Id] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [FK_GalleriesStatus]
    FOREIGN KEY ([Gallery_Id])
    REFERENCES [dbo].[Galleries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GalleriesStatus'
CREATE INDEX [IX_FK_GalleriesStatus]
ON [dbo].[Status]
    ([Gallery_Id]);
GO

-- Creating foreign key on [Client_Id] in table 'Galleries'
ALTER TABLE [dbo].[Galleries]
ADD CONSTRAINT [FK_ClientsGalleries]
    FOREIGN KEY ([Client_Id])
    REFERENCES [dbo].[Clients]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientsGalleries'
CREATE INDEX [IX_FK_ClientsGalleries]
ON [dbo].[Galleries]
    ([Client_Id]);
GO

-- Creating foreign key on [Client_Id] in table 'Pictures'
ALTER TABLE [dbo].[Pictures]
ADD CONSTRAINT [FK_ClientsPictures]
    FOREIGN KEY ([Client_Id])
    REFERENCES [dbo].[Clients]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientsPictures'
CREATE INDEX [IX_FK_ClientsPictures]
ON [dbo].[Pictures]
    ([Client_Id]);
GO

-- Creating foreign key on [Client_Id] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [FK_ClientsStatus]
    FOREIGN KEY ([Client_Id])
    REFERENCES [dbo].[Clients]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientsStatus'
CREATE INDEX [IX_FK_ClientsStatus]
ON [dbo].[Status]
    ([Client_Id]);
GO

-- Creating foreign key on [User_Id] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [FK_UsersStatus]
    FOREIGN KEY ([User_Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UsersStatus'
CREATE INDEX [IX_FK_UsersStatus]
ON [dbo].[Status]
    ([User_Id]);
GO

-- Creating foreign key on [Picture_Id] in table 'Galleries'
ALTER TABLE [dbo].[Galleries]
ADD CONSTRAINT [FK_PicturesGalleries]
    FOREIGN KEY ([Picture_Id])
    REFERENCES [dbo].[Pictures]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PicturesGalleries'
CREATE INDEX [IX_FK_PicturesGalleries]
ON [dbo].[Galleries]
    ([Picture_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------