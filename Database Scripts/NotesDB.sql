USE [NotesDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_Update_Note]    Script Date: 06-03-2021 05:04:17 ******/
DROP PROCEDURE [dbo].[usp_Update_Note]
GO
/****** Object:  StoredProcedure [dbo].[usp_IsTagExists]    Script Date: 06-03-2021 05:04:17 ******/
DROP PROCEDURE [dbo].[usp_IsTagExists]
GO
/****** Object:  StoredProcedure [dbo].[usp_Insert_Tag]    Script Date: 06-03-2021 05:04:17 ******/
DROP PROCEDURE [dbo].[usp_Insert_Tag]
GO
/****** Object:  StoredProcedure [dbo].[usp_Insert_Note]    Script Date: 06-03-2021 05:04:17 ******/
DROP PROCEDURE [dbo].[usp_Insert_Note]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetTags]    Script Date: 06-03-2021 05:04:17 ******/
DROP PROCEDURE [dbo].[usp_GetTags]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetNoteById]    Script Date: 06-03-2021 05:04:17 ******/
DROP PROCEDURE [dbo].[usp_GetNoteById]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetColors]    Script Date: 06-03-2021 05:04:17 ******/
DROP PROCEDURE [dbo].[usp_GetColors]
GO
/****** Object:  StoredProcedure [dbo].[usp_Get_Notes]    Script Date: 06-03-2021 05:04:17 ******/
DROP PROCEDURE [dbo].[usp_Get_Notes]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteNoteById]    Script Date: 06-03-2021 05:04:17 ******/
DROP PROCEDURE [dbo].[usp_DeleteNoteById]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 06-03-2021 05:04:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tag]') AND type in (N'U'))
DROP TABLE [dbo].[Tag]
GO
/****** Object:  Table [dbo].[NoteTags]    Script Date: 06-03-2021 05:04:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NoteTags]') AND type in (N'U'))
DROP TABLE [dbo].[NoteTags]
GO
/****** Object:  Table [dbo].[NoteColor]    Script Date: 06-03-2021 05:04:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NoteColor]') AND type in (N'U'))
DROP TABLE [dbo].[NoteColor]
GO
/****** Object:  Table [dbo].[Note]    Script Date: 06-03-2021 05:04:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Note]') AND type in (N'U'))
DROP TABLE [dbo].[Note]
GO
/****** Object:  Table [dbo].[Note]    Script Date: 06-03-2021 05:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Note](
	[NoteId] [bigint] IDENTITY(1,1) NOT NULL,
	[NoteColorId] [int] NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Text] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Note] PRIMARY KEY CLUSTERED 
(
	[NoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoteColor]    Script Date: 06-03-2021 05:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoteColor](
	[NoteColorId] [int] NOT NULL,
	[ColorDisplay] [nvarchar](100) NOT NULL,
	[ColorCode] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_NoteColor] PRIMARY KEY CLUSTERED 
(
	[NoteColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoteTags]    Script Date: 06-03-2021 05:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoteTags](
	[NoteId] [bigint] NOT NULL,
	[TagId] [bigint] NOT NULL,
 CONSTRAINT [PK_NoteTags] PRIMARY KEY CLUSTERED 
(
	[NoteId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 06-03-2021 05:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[TagId] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Note] ON 

INSERT [dbo].[Note] ([NoteId], [NoteColorId], [Title], [Text]) VALUES (1, 4, N'Personal Confidential Note', N'<p>This is pure personal Note.This is edited..<strong>123</strong></p>')
INSERT [dbo].[Note] ([NoteId], [NoteColorId], [Title], [Text]) VALUES (2, 4, N'Work Note', N'<p>Many veteran designers remember Lorem Ipsum text being available from Letraset in various font types and sizes. In <strong>''Old School''</strong> graphic design where designers would lay out their design with paper and pen <em>(without computer)</em>, text was taken using the Letraset pads and inserted (rubbed) into place.</p>')
INSERT [dbo].[Note] ([NoteId], [NoteColorId], [Title], [Text]) VALUES (3, 2, N'Extremely secret Note', N'<p>Keep it very very <strong>secret</strong></p>')
INSERT [dbo].[Note] ([NoteId], [NoteColorId], [Title], [Text]) VALUES (4, 1, N'Bucket List', N'<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over <strong>2000</strong> years old</p>')
INSERT [dbo].[Note] ([NoteId], [NoteColorId], [Title], [Text]) VALUES (6, 3, N'A Personal Story', N'<p><strong>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout</strong>. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''<strong><u>Content here, content here</u></strong><u>''.</u></p>')
INSERT [dbo].[Note] ([NoteId], [NoteColorId], [Title], [Text]) VALUES (9, 4, N'This is a brand new Note', N'<p>Do a search for <strong>"Lorem ipsum"</strong> on the internet, is it a surprise that hundreds of thousands of results are returned.</p>')
INSERT [dbo].[Note] ([NoteId], [NoteColorId], [Title], [Text]) VALUES (12, 4, N'Yet another note', N'<p>Just a test on this feature with <strong>Bold</strong>, <em>Italic</em> and <u>Underlines</u></p>')
INSERT [dbo].[Note] ([NoteId], [NoteColorId], [Title], [Text]) VALUES (13, 4, N'This is New Note', N'<p>Lorem <strong>ipsum</strong> <u>dummy</u> text</p>')
SET IDENTITY_INSERT [dbo].[Note] OFF
GO
INSERT [dbo].[NoteColor] ([NoteColorId], [ColorDisplay], [ColorCode]) VALUES (1, N'Default', N'#fff')
INSERT [dbo].[NoteColor] ([NoteColorId], [ColorDisplay], [ColorCode]) VALUES (2, N'Red', N'#ffd5d5')
INSERT [dbo].[NoteColor] ([NoteColorId], [ColorDisplay], [ColorCode]) VALUES (3, N'Green', N'lightgreen')
INSERT [dbo].[NoteColor] ([NoteColorId], [ColorDisplay], [ColorCode]) VALUES (4, N'Yellow', N'lightyellow')
GO
INSERT [dbo].[NoteTags] ([NoteId], [TagId]) VALUES (0, 1)
INSERT [dbo].[NoteTags] ([NoteId], [TagId]) VALUES (1, 2)
INSERT [dbo].[NoteTags] ([NoteId], [TagId]) VALUES (1, 3)
INSERT [dbo].[NoteTags] ([NoteId], [TagId]) VALUES (2, 1)
INSERT [dbo].[NoteTags] ([NoteId], [TagId]) VALUES (2, 5)
INSERT [dbo].[NoteTags] ([NoteId], [TagId]) VALUES (3, 6)
INSERT [dbo].[NoteTags] ([NoteId], [TagId]) VALUES (4, 5)
INSERT [dbo].[NoteTags] ([NoteId], [TagId]) VALUES (6, 2)
INSERT [dbo].[NoteTags] ([NoteId], [TagId]) VALUES (6, 3)
INSERT [dbo].[NoteTags] ([NoteId], [TagId]) VALUES (9, 2)
INSERT [dbo].[NoteTags] ([NoteId], [TagId]) VALUES (12, 1)
INSERT [dbo].[NoteTags] ([NoteId], [TagId]) VALUES (13, 2)
INSERT [dbo].[NoteTags] ([NoteId], [TagId]) VALUES (13, 5)
GO
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([TagId], [Text]) VALUES (1, N'Work')
INSERT [dbo].[Tag] ([TagId], [Text]) VALUES (2, N'Personal')
INSERT [dbo].[Tag] ([TagId], [Text]) VALUES (3, N'Confidential')
INSERT [dbo].[Tag] ([TagId], [Text]) VALUES (4, N'User Credentials')
INSERT [dbo].[Tag] ([TagId], [Text]) VALUES (5, N'Todo')
INSERT [dbo].[Tag] ([TagId], [Text]) VALUES (6, N'Secret')
INSERT [dbo].[Tag] ([TagId], [Text]) VALUES (9, N'Reminder')
SET IDENTITY_INSERT [dbo].[Tag] OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteNoteById]    Script Date: 06-03-2021 05:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_DeleteNoteById]
(
   @NoteId BIGINT
)
AS
BEGIN

	SET NOCOUNT ON;

	BEGIN TRY
		
		BEGIN TRAN

		 DELETE FROM dbo.NoteTags WHERE NoteId= @NoteId

		 DELETE FROM dbo.Note WHERE NoteId = @NoteId

		 SELECT @NoteId as id
		 FOR JSON PATH, WITHOUT_ARRAY_WRAPPER

		COMMIT TRAN

	END TRY

	BEGIN CATCH
		
		IF @@TRANCOUNT > 0
		  BEGIN
			ROLLBACK TRAN

			 SELECT CAST(0 AS BIGINT) as id
			 FOR JSON PATH, WITHOUT_ARRAY_WRAPPER

		  END



	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Get_Notes]    Script Date: 06-03-2021 05:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Get_Notes]
(
  @Tag NVARCHAR(200) = NULL,
  @Color NVARCHAR(100) = NULL,
  @SearchKey nvarchar(1000) = NULL
)
AS
BEGIN
	
	SET NOCOUNT ON;

	DECLARE @TagFilter BIGINT;
	DECLARE @ColorFilter INT;
	DECLARE @TextFilter NVARCHAR(1000);

	IF RTRIM(LTRIM(isnull(@Tag,''))) = ''
	   SET @TagFilter = NULL
	ELSE
	   BEGIN
			SELECT TOP 1 @TagFilter = TagId FROM dbo.Tag WHERE [Text] = LOWER(@Tag)
			SET @TagFilter = ISNULL(@TagFilter,-1)
	   END

	IF RTRIM(LTRIM(isnull(@Color,''))) = ''
	   SET @ColorFilter = NULL
	ELSE
	   BEGIN
			SELECT TOP 1 @ColorFilter = NoteColorId FROM dbo.NoteColor WHERE ColorDisplay = LOWER(RTRIM(LTRIM(@Color)))
			SET @ColorFilter = ISNULL(@ColorFilter,-1)
	   END

	IF RTRIM(LTRIM(isnull(@SearchKey,''))) = ''
	   SET @TextFilter = NULL
	ELSE
	   SET @TextFilter = '%' + @SearchKey + '%'

	SELECT N.NoteId as id,
	       N.Title as title,
		   N.Text as text,
		   NC.NoteColorId as 'color.id',
		   NC.ColorDisplay as 'color.display',
		   NC.ColorCode as 'color.code',
		   ISNULL((
		      SELECT T.TagId as id,
			         T.Text as text
			  FROM NoteTags NT
			  INNER JOIN Tag T ON NT.NoteId = N.NoteId and NT.TagId = T.TagId
			  FOR JSON PATH , INCLUDE_NULL_VALUES
		   ),JSON_QUERY('[]'))as tags
	FROM 
	Note N
	inner join NoteColor NC on NC.NoteColorId = N.NoteColorId
	WHERE 
	( 	  
	
	  (EXISTS(SELECT 1 FROM NoteTags NT WHERE NT.NoteId = N.NoteId AND NT.TagId= @TagFilter))
	  OR
	  @TagFilter IS NULL
	  

	)AND
	(

	   (N.NoteColorId = @ColorFilter)
	   OR
	   @ColorFilter IS NULL
	 

	)AND
	(
	  
	   (
	     N.Title LIKE @TextFilter OR N.Text LIKE @TextFilter
	   )
	   OR
	    @TextFilter IS NULL
	  
	)
	FOR JSON PATH , INCLUDE_NULL_VALUES
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetColors]    Script Date: 06-03-2021 05:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[usp_GetTags]    Script Date: 03-02-2021 11:43:14 ******/

CREATE PROCEDURE [dbo].[usp_GetColors]
AS
BEGIN
	SET NOCOUNT ON;

	select NoteColorId as id,
		       ColorDisplay as display,
			   ColorCode as code
		from dbo.NoteColor 
		ORDER BY NoteColorId 
		FOR JSON PATH ,  INCLUDE_NULL_VALUES

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetNoteById]    Script Date: 06-03-2021 05:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetNoteById]
(
	@NoteId BIGINT
)
AS
BEGIN

SET NOCOUNT ON;

SELECT N.NoteId as id,
       N.Title as title,
	   N.[Text] as [text],
	   NC.NoteColorId as 'color.id',
	   NC.ColorDisplay as 'color.display',
	   NC.ColorCode as 'color.code',
	   ISNULL((
		      SELECT T.TagId as id,
			         T.Text as text
			  FROM NoteTags NT
			  INNER JOIN Tag T ON NT.NoteId = N.NoteId and NT.TagId = T.TagId
			  FOR JSON PATH , INCLUDE_NULL_VALUES
		   ),JSON_QUERY('[]'))as tags
FROM dbo.Note N
INNER JOIN dbo.NoteColor NC ON N.NoteColorId = NC.NoteColorId 
WHERE N.NoteId = @NoteId
FOR JSON PATH , INCLUDE_NULL_VALUES ,WITHOUT_ARRAY_WRAPPER

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetTags]    Script Date: 06-03-2021 05:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetTags]
AS
BEGIN
	SET NOCOUNT ON;

	select TagId as id,
		       Text as [text]
		from dbo.Tag 
		ORDER BY TagId 
		FOR JSON PATH ,  INCLUDE_NULL_VALUES

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Insert_Note]    Script Date: 06-03-2021 05:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Insert_Note]
(
   @Title NVARCHAR(250),
   @Text NVARCHAR(1000),
   @ColorId INT,
   @TagIds NVARCHAR(MAX)
)
AS
BEGIN

BEGIN TRY

BEGIN TRAN

SET NOCOUNT ON;

DECLARE @INSERTED_NOTE_ID BIGINT = 0;

INSERT INTO dbo.Note(NoteColorId,Title,Text)
VALUES(@ColorId,@Title,@Text)

set @INSERTED_NOTE_ID = SCOPE_IDENTITY();

IF @INSERTED_NOTE_ID > 0
  BEGIN
		IF ISJSON(@TagIds) = 1
		   BEGIN
				
				insert into NoteTags
				SELECT @INSERTED_NOTE_ID , TagId 
				FROM OPENJSON(@TagIds)
				WITH ( TagId BIGINT '$')

		   END
  END

 SELECT N.NoteId as id,
	       N.Title as title,
		   N.Text as text,
		   NC.NoteColorId as 'color.id',
		   NC.ColorDisplay as 'color.display',
		   NC.ColorCode as 'color.code',
		   ISNULL((
		      SELECT T.TagId as id,
			         T.Text as text
			  FROM NoteTags NT
			  INNER JOIN Tag T ON NT.NoteId = N.NoteId and NT.TagId = T.TagId
			  FOR JSON PATH , INCLUDE_NULL_VALUES
		   ),JSON_QUERY('[]'))as tags
	FROM 
	Note N
	inner join NoteColor NC on NC.NoteColorId = N.NoteColorId
	WHERE N.NoteId = @INSERTED_NOTE_ID
	FOR JSON PATH , INCLUDE_NULL_VALUES ,WITHOUT_ARRAY_WRAPPER

COMMIT TRAN

END TRY

BEGIN CATCH

  IF @@TRANCOUNT > 0
     BEGIN
		ROLLBACK TRAN;

		RAISERROR('Error inserting note',16,1)
	 END

END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Insert_Tag]    Script Date: 06-03-2021 05:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Insert_Tag]
(
  @TagText nvarchar(200)
)
AS
BEGIN

	IF rtrim(ltrim(isnull(@TagText,''))) <> ''
	  BEGIN
	    if not exists(select 1 from dbo.Tag WHERE LOWER([Text])= LOWER(LTRIM(RTRIM(@TagText))))
		   BEGIN

			declare @NewTagId BIGINT;

		      INSERT INTO dbo.Tag([Text])
			  VALUES(LTRIM(RTRIM(@TagText)))

			  SET @NewTagId = SCOPE_IDENTITY()

			  SELECT TagId as id,
			         [Text] as [text]
			  FROM dbo.Tag
			  WHERE TagId = @NewTagId
			  FOR JSON PATH ,INCLUDE_NULL_VALUES,  WITHOUT_ARRAY_WRAPPER

		   END
		ELSE
		   RAISERROR('Duplicate tag with same value exists',16,1)
	  END
	ELSE
	  RAISERROR('Cannot insert blank tag',16,1)

END
GO
/****** Object:  StoredProcedure [dbo].[usp_IsTagExists]    Script Date: 06-03-2021 05:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_IsTagExists]
(
  @TagText NVARCHAR(200)
)
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(SELECT 1 FROM dbo.Tag WHERE  RTRIM(LTRIM(LOWER([Text]))) = RTRIM(LTRIM(LOWER(@TagText))))
	   BEGIN
			SELECT CAST(1 AS BIT) as [status]
			FOR JSON PATH , WITHOUT_ARRAY_WRAPPER
	   END
   ELSE
       BEGIN
			SELECT CAST(0 AS BIT) as [status]
			FOR JSON PATH , WITHOUT_ARRAY_WRAPPER
	   END
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Update_Note]    Script Date: 06-03-2021 05:04:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Update_Note]
(
   @NoteId BIGINT,
   @Title NVARCHAR(250),
   @Text NVARCHAR(1000),
   @ColorId INT,
   @TagIds NVARCHAR(MAX)
)
AS
BEGIN

BEGIN TRY

BEGIN TRAN

SET NOCOUNT ON;

UPDATE dbo.Note
set NoteColorId = @ColorId,
    Title = @Title,
    Text = @Text
WHERE NoteId = @NoteId

IF ISJSON(@TagIds) = 1
  BEGIN
        DECLARE @TAG_TEMP TABLE(Id INT PRIMARY KEY IDENTITY(1,1),NoteId bigint,TagId bigint);

		INSERT INTO @TAG_TEMP(NoteId,TagId)
		SELECT @NoteId, TagId
		FROM OPENJSON(@TagIds)
		WITH(
			TagId bigint '$'
		)

		MERGE dbo.NoteTags as TARGET
		USING @TAG_TEMP as SOURCE
		ON (TARGET.NoteId = @NoteId and TARGET.TagId = SOURCE.tagId)
		WHEN NOT MATCHED BY TARGET
		THEN INSERT(NoteId,TagId) VALUES(SOURCE.NoteId,SOURCE.TagId)
		WHEN NOT MATCHED BY SOURCE AND TARGET.NoteId = @NoteId
		THEN DELETE;
  END


 SELECT N.NoteId as id,
	       N.Title as title,
		   N.Text as text,
		   NC.NoteColorId as 'color.id',
		   NC.ColorDisplay as 'color.display',
		   NC.ColorCode as 'color.code',
		   ISNULL((
		      SELECT T.TagId as id,
			         T.Text as text
			  FROM NoteTags NT
			  INNER JOIN Tag T ON NT.NoteId = N.NoteId and NT.TagId = T.TagId
			  FOR JSON PATH , INCLUDE_NULL_VALUES
		   ),JSON_QUERY('[]'))as tags
	FROM 
	Note N
	inner join NoteColor NC on NC.NoteColorId = N.NoteColorId
	WHERE N.NoteId = @NoteId
	FOR JSON PATH , INCLUDE_NULL_VALUES ,WITHOUT_ARRAY_WRAPPER

COMMIT TRAN

END TRY

BEGIN CATCH

  IF @@TRANCOUNT > 0
     BEGIN
		ROLLBACK TRAN

		SELECT JSON_QUERY('{"error":"Error updating Note"}')
	 END

END CATCH

END
GO
