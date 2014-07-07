
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/07/2014 11:52:15
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


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
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
    [LastUpdate] nvarchar(max)  NOT NULL,
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

-- Creating table 'Galleries'
CREATE TABLE [dbo].[Galleries] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [LastUpdate] datetime  NOT NULL,
    [Status] int  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Category] int  NOT NULL,
    [Gallery] int  NOT NULL,
    [MainPicture] int  NOT NULL,
    [CreatedBy] int  NOT NULL,
    [DateCreated] datetime  NOT NULL,
    [LastUpdate] datetime  NOT NULL,
    [Status] int  NOT NULL
);
GO

-- Creating table 'Pictures'
CREATE TABLE [dbo].[Pictures] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Gallery] int  NOT NULL,
    [Path] nvarchar(max)  NOT NULL,
    [DateCreated] nvarchar(max)  NOT NULL,
    [LastUpdate] nvarchar(max)  NOT NULL,
    [Status] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [LastLoginDate] datetime  NOT NULL,
    [Status] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Clients'
ALTER TABLE [dbo].[Clients]
ADD CONSTRAINT [PK_Clients]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [PK_Status]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Galleries'
ALTER TABLE [dbo].[Galleries]
ADD CONSTRAINT [PK_Galleries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pictures'
ALTER TABLE [dbo].[Pictures]
ADD CONSTRAINT [PK_Pictures]
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

-- Creating foreign key on [Status] in table 'Clients'
ALTER TABLE [dbo].[Clients]
ADD CONSTRAINT [FK_StatusClients]
    FOREIGN KEY ([Status])
    REFERENCES [dbo].[Status]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StatusClients'
CREATE INDEX [IX_FK_StatusClients]
ON [dbo].[Clients]
    ([Status]);
GO

-- Creating foreign key on [MainPicture] in table 'Clients'
ALTER TABLE [dbo].[Clients]
ADD CONSTRAINT [FK_PicturesClients]
    FOREIGN KEY ([MainPicture])
    REFERENCES [dbo].[Pictures]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PicturesClients'
CREATE INDEX [IX_FK_PicturesClients]
ON [dbo].[Clients]
    ([MainPicture]);
GO

-- Creating foreign key on [Status] in table 'Clients'
ALTER TABLE [dbo].[Clients]
ADD CONSTRAINT [FK_StatusClients1]
    FOREIGN KEY ([Status])
    REFERENCES [dbo].[Status]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StatusClients1'
CREATE INDEX [IX_FK_StatusClients1]
ON [dbo].[Clients]
    ([Status]);
GO

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

-- Creating foreign key on [Gallery] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_GalleriesProducts]
    FOREIGN KEY ([Gallery])
    REFERENCES [dbo].[Galleries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GalleriesProducts'
CREATE INDEX [IX_FK_GalleriesProducts]
ON [dbo].[Products]
    ([Gallery]);
GO

-- Creating foreign key on [MainPicture] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_PicturesProducts]
    FOREIGN KEY ([MainPicture])
    REFERENCES [dbo].[Pictures]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PicturesProducts'
CREATE INDEX [IX_FK_PicturesProducts]
ON [dbo].[Products]
    ([MainPicture]);
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

-- Creating foreign key on [Gallery] in table 'Pictures'
ALTER TABLE [dbo].[Pictures]
ADD CONSTRAINT [FK_GalleriesPictures]
    FOREIGN KEY ([Gallery])
    REFERENCES [dbo].[Galleries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GalleriesPictures'
CREATE INDEX [IX_FK_GalleriesPictures]
ON [dbo].[Pictures]
    ([Gallery]);
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

-- Creating foreign key on [Gallery] in table 'Clients'
ALTER TABLE [dbo].[Clients]
ADD CONSTRAINT [FK_GalleriesClients]
    FOREIGN KEY ([Gallery])
    REFERENCES [dbo].[Galleries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GalleriesClients'
CREATE INDEX [IX_FK_GalleriesClients]
ON [dbo].[Clients]
    ([Gallery]);
GO

-- Creating foreign key on [Status] in table 'Galleries'
ALTER TABLE [dbo].[Galleries]
ADD CONSTRAINT [FK_StatusGalleries]
    FOREIGN KEY ([Status])
    REFERENCES [dbo].[Status]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_StatusGalleries'
CREATE INDEX [IX_FK_StatusGalleries]
ON [dbo].[Galleries]
    ([Status]);
GO

-- Creating foreign key on [CreatedBy] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_UsersProducts]
    FOREIGN KEY ([CreatedBy])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UsersProducts'
CREATE INDEX [IX_FK_UsersProducts]
ON [dbo].[Products]
    ([CreatedBy]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------