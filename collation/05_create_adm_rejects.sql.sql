CREATE TABLE "mytable" (
  "USE Amazon_ADM" text NULL
);

INSERT INTO "mytable" ("USE Amazon_ADM")
VALUES
('CREATE TABLE dbo.[TechnicalRejects] ('),
('[RejectsDate] datetime'),
('[RejectsPkgAndTask] nvarchar(100)'),
('[RejectColumn] nvarchar(50)'),
('[RejectsDescription] nvarchar(80)'),
(') WITH (DATA_COMPRESSION = PAGE);'),
('CREATE TABLE [dbo].[FunctionalRejects]('),
('[RejectsDate] [datetime] NULL'),
('[RejectsPkgAndTask] [nvarchar](100) NULL'),
('[RejectsColumn] [nvarchar](50) NULL'),
('[RejectsDescription] [nvarchar](80) NULL'),
('[Error_Qty] [varchar](20) NULL'),
(') ON [PRIMARY]'),
(NULL);
