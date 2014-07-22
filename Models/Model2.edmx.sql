
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/22/2014 16:20:37
-- Generated from EDMX file: C:\Users\Oliver Santos\Documents\Visual Studio 2013\Projects\Maderna\Maderna\Models\Model2.edmx
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

IF OBJECT_ID(N'[dbo].[FK_CategoriesProducts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_CategoriesProducts];
GO
IF OBJECT_ID(N'[dbo].[FK_UsersProducts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_UsersProducts];
GO
IF OBJECT_ID(N'[dbo].[FK_StatusProducts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_StatusProducts];
GO
IF OBJECT_ID(N'[dbo].[FK_StatusUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_StatusUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_StatusPictures]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pictures] DROP CONSTRAINT [FK_StatusPictures];
GO
IF OBJECT_ID(N'[dbo].[FK_StatusCategories]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Categories] DROP CONSTRAINT [FK_StatusCategories];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Pictures]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pictures];
GO
IF OBJECT_ID(N'[dbo].[Status]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Status];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Pictures'
CREATE TABLE [dbo].[Pictures] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Product] int  NULL,
    [Path] nvarchar(max)  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [LastUpdate] datetime  NOT NULL,
    [Status] int  NOT NULL
);
GO

-- Creating table 'Status'
CREATE TABLE [dbo].[Status] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Category] int  NOT NULL,
    [MainPicture] int  NOT NULL,
    [CreatedBy] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [LastUpdate] datetime  NOT NULL,
    [Status] int  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Status] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Status] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Pictures'
ALTER TABLE [dbo].[Pictures]
ADD CONSTRAINT [PK_Pictures]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [PK_Status]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
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

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Category] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_CategoriesProducts]
    FOREIGN KEY ([Category])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoriesProducts'
CREATE INDEX [IX_FK_CategoriesProducts]
ON [dbo].[Products]
    ([Category]);
GO

-- Creating foreign key on [Category] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_UsersProducts]
    FOREIGN KEY ([Category])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UsersProducts'
CREATE INDEX [IX_FK_UsersProducts]
ON [dbo].[Products]
    ([Category]);
GO

-- Creating foreign key on [Status] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_StatusProducts]
    FOREIGN KEY ([Status])
    REFERENCES [dbo].[Status]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StatusProducts'
CREATE INDEX [IX_FK_StatusProducts]
ON [dbo].[Products]
    ([Status]);
GO

-- Creating foreign key on [Status] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_StatusUsers]
    FOREIGN KEY ([Status])
    REFERENCES [dbo].[Status]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StatusUsers'
CREATE INDEX [IX_FK_StatusUsers]
ON [dbo].[Users]
    ([Status]);
GO

-- Creating foreign key on [Status] in table 'Pictures'
ALTER TABLE [dbo].[Pictures]
ADD CONSTRAINT [FK_StatusPictures]
    FOREIGN KEY ([Status])
    REFERENCES [dbo].[Status]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StatusPictures'
CREATE INDEX [IX_FK_StatusPictures]
ON [dbo].[Pictures]
    ([Status]);
GO

-- Creating foreign key on [Status] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [FK_StatusCategories]
    FOREIGN KEY ([Status])
    REFERENCES [dbo].[Status]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StatusCategories'
CREATE INDEX [IX_FK_StatusCategories]
ON [dbo].[Categories]
    ([Status]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------