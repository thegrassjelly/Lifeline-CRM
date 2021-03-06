USE [DB_A1649D_lifelinecrm]
GO
/****** Object:  Table [dbo].[Ambulance]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ambulance](
	[AmbulanceID] [int] IDENTITY(1,1) NOT NULL,
	[AmbulanceName] [nvarchar](50) NULL,
	[AmbulanceStatus] [nvarchar](50) NULL,
	[PlateNo] [nvarchar](20) NULL,
	[DateAdded] [date] NULL,
	[DateModified] [date] NULL,
 CONSTRAINT [PK_Ambulance] PRIMARY KEY CLUSTERED 
(
	[AmbulanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Applications]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Birthday] [date] NULL,
	[Street] [nvarchar](50) NULL,
	[Municipality] [nvarchar](80) NULL,
	[City] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Status] [nvarchar](10) NULL,
	[DateSubmitted] [date] NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApplicationVoids]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationVoids](
	[VoidID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [int] NULL,
	[Timestamp] [datetime] NULL,
	[Reason] [nvarchar](100) NULL,
 CONSTRAINT [PK_ApplicationVoids] PRIMARY KEY CLUSTERED 
(
	[VoidID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Articles]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[ArticleID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleType] [nvarchar](50) NULL,
	[Others] [nvarchar](80) NULL,
	[DateSubmitted] [datetime] NULL,
	[ArticlePic] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Summary] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Articles] PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AutomaticRenewal]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutomaticRenewal](
	[AutoRenewalID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RemindMe] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[Type] [nvarchar](100) NULL,
	[RemindMeStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_AutomaticRenewal] PRIMARY KEY CLUSTERED 
(
	[AutoRenewalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cities]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cities](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[RegionID] [int] NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactCategory]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactCategory](
	[RelationshipID] [int] IDENTITY(1,1) NOT NULL,
	[Relationship] [nvarchar](50) NULL,
 CONSTRAINT [PK_ContactCategory] PRIMARY KEY CLUSTERED 
(
	[RelationshipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CorporateAccounts]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CorporateAccounts](
	[CorporateID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](max) NULL,
	[Name] [nvarchar](50) NULL,
	[NatureOfBusiness] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Municipality] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Others] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[DateAdded] [date] NULL,
	[EmployerCode] [nvarchar](10) NULL,
	[Logo] [nvarchar](max) NULL,
 CONSTRAINT [PK_CorporateAccounts] PRIMARY KEY CLUSTERED 
(
	[CorporateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CorporatePayments]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CorporatePayments](
	[CorporatePaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTerms] [nvarchar](20) NULL,
	[Balance] [decimal](18, 2) NULL,
	[CorporateID] [int] NULL,
	[DiscountRate] [decimal](18, 0) NULL,
	[Length] [int] NULL,
 CONSTRAINT [PK_CorporatePayments] PRIMARY KEY CLUSTERED 
(
	[CorporatePaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dependents]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dependents](
	[DependentID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](80) NULL,
	[LastName] [nvarchar](80) NULL,
	[Birthday] [date] NULL,
	[Relationship] [nvarchar](50) NULL,
	[OtherRel] [nvarchar](50) NULL,
	[MembershipID] [int] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Dependents] PRIMARY KEY CLUSTERED 
(
	[DependentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DepositPayments]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepositPayments](
	[DepositID] [int] IDENTITY(1,1) NOT NULL,
	[CorporatePaymentID] [int] NULL,
	[DepositSlip] [nvarchar](max) NULL,
	[PaymentDate] [date] NULL,
	[Amount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_DepositPayments] PRIMARY KEY CLUSTERED 
(
	[DepositID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dispatch]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dispatch](
	[DispatchID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Dispatcher] [nvarchar](80) NULL,
	[DispatchDate] [date] NULL,
	[Ambulance] [nvarchar](80) NULL,
	[TeamLeader] [nvarchar](100) NULL,
	[TransportOfficer] [nvarchar](100) NULL,
	[TreatmentOfficer] [nvarchar](100) NULL,
	[ReceivingHospital] [nvarchar](80) NULL,
 CONSTRAINT [PK_Dispatch] PRIMARY KEY CLUSTERED 
(
	[DispatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exceptions]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exceptions](
	[ExceptionID] [int] IDENTITY(1,1) NOT NULL,
	[Page] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[UserID] [int] NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK_Exceptions] PRIMARY KEY CLUSTERED 
(
	[ExceptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hospitals]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitals](
	[HospitalID] [int] IDENTITY(1,1) NOT NULL,
	[HospitalName] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Municipality] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[DateAdded] [date] NULL,
	[DateModified] [date] NULL,
 CONSTRAINT [PK_Hospitals] PRIMARY KEY CLUSTERED 
(
	[HospitalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Logs]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[LogsID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[LogType] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[Timestamp] [date] NULL,
	[Specifics] [nvarchar](50) NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[LogsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicalHistory]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalHistory](
	[MedHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[DispatchID] [int] NULL,
	[Operation] [nvarchar](50) NULL,
	[Details] [nvarchar](200) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[MedHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicalInfo]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalInfo](
	[MedicalInfoID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[BloodType] [nvarchar](50) NULL,
	[Allergies] [nvarchar](100) NULL,
	[CancerHis] [nvarchar](10) NULL,
	[HeartHis] [nvarchar](10) NULL,
	[AsthmaHis] [nvarchar](10) NULL,
	[EpilepsyHis] [nvarchar](10) NULL,
	[LiverHis] [nvarchar](10) NULL,
	[Others] [nvarchar](50) NULL,
 CONSTRAINT [PK_MedicalInfo] PRIMARY KEY CLUSTERED 
(
	[MedicalInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberships](
	[MembershipID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Length] [int] NULL,
	[MembershipStatus] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Membership] PRIMARY KEY CLUSTERED 
(
	[MembershipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](50) NULL,
	[MessageCat] [nvarchar](50) NULL,
	[Subject] [nvarchar](50) NULL,
	[DateSubmitted] [datetime] NULL,
	[Message] [nvarchar](max) NULL,
	[UserID] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OpportunityActivity]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpportunityActivity](
	[OpportunityActivityID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[AllDay] [bit] NULL,
	[Subject] [nvarchar](20) NULL,
	[Location] [nvarchar](20) NULL,
	[Description] [nvarchar](20) NULL,
	[Status] [int] NULL,
	[Label] [int] NULL,
	[ResourceID] [int] NULL,
	[ResourceIDs] [nvarchar](max) NULL,
	[ReminderInfo] [nvarchar](max) NULL,
	[RecurrenceInfo] [nvarchar](max) NULL,
	[CustomField] [nvarchar](max) NULL,
	[OpportunityID] [int] NULL,
 CONSTRAINT [PK_OpportunityActivity] PRIMARY KEY CLUSTERED 
(
	[OpportunityActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OpportunityTracking]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpportunityTracking](
	[OpportunityID] [int] IDENTITY(1,1) NOT NULL,
	[ClientName] [nvarchar](50) NULL,
	[AccountName] [nvarchar](20) NULL,
	[Rating] [nvarchar](20) NULL,
	[Details] [nvarchar](100) NULL,
	[Source] [nvarchar](50) NULL,
	[DateAdded] [date] NULL,
	[DateModified] [date] NULL,
	[CloseDate] [date] NULL,
	[Amount] [decimal](18, 2) NULL,
	[Probability] [decimal](18, 0) NULL,
	[Stage] [nvarchar](20) NULL,
	[Type] [nvarchar](20) NOT NULL,
	[PhoneNo] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[Priority] [nvarchar](10) NULL,
 CONSTRAINT [PK_OpportunityTracking] PRIMARY KEY CLUSTERED 
(
	[OpportunityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payments]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentStatus] [nvarchar](50) NULL,
	[Amount] [decimal](18, 2) NULL,
	[DepositSlip] [nvarchar](max) NULL,
	[MembershipID] [int] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Recover]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recover](
	[RecoverID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RecoveryCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_Recover] PRIMARY KEY CLUSTERED 
(
	[RecoverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RenewalVoids]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RenewalVoids](
	[VoidID] [int] IDENTITY(1,1) NOT NULL,
	[MembershipID] [int] NULL,
	[Timestamp] [datetime] NULL,
	[Reason] [nvarchar](100) NULL,
 CONSTRAINT [PK_RenewalVoids] PRIMARY KEY CLUSTERED 
(
	[VoidID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Responder]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Responder](
	[ResponderID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[DateAdded] [date] NULL,
	[DateModified] [date] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[ResponderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SecondaryContact]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecondaryContact](
	[SecondaryContactID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[FirstName] [nvarchar](80) NULL,
	[LastName] [nvarchar](80) NULL,
	[TelNo] [nvarchar](50) NULL,
	[MobileNo] [nvarchar](50) NULL,
	[RelationshipID] [int] NULL,
	[Others] [nvarchar](50) NULL,
 CONSTRAINT [PK_SecondaryContact] PRIMARY KEY CLUSTERED 
(
	[SecondaryContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Surveys]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surveys](
	[SurveyID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[QuestionOne] [nvarchar](50) NULL,
	[QuestionTwo] [nvarchar](50) NULL,
	[QuestionThree] [nvarchar](50) NULL,
	[QuestionFour] [nvarchar](50) NULL,
	[QuestionFive] [nvarchar](50) NULL,
	[QuestionSix] [nvarchar](50) NULL,
	[QuestionSeven] [nvarchar](50) NULL,
	[QuestionEight] [nvarchar](50) NULL,
	[QuestionNine] [nvarchar](50) NULL,
	[QuestionTen] [nvarchar](50) NULL,
	[Comments] [nvarchar](max) NULL,
	[DateSubmitted] [date] NULL,
 CONSTRAINT [PK_Surveys] PRIMARY KEY CLUSTERED 
(
	[SurveyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TempTable]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempTable](
	[TempID] [int] IDENTITY(1,1) NOT NULL,
	[DataA] [int] NULL,
	[DataB] [nvarchar](50) NULL,
 CONSTRAINT [PK_TempTable] PRIMARY KEY CLUSTERED 
(
	[TempID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Types]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserActivation]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserActivation](
	[ActivationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ActivationCode] [uniqueidentifier] NULL,
 CONSTRAINT [PK_UserActivation] PRIMARY KEY CLUSTERED 
(
	[ActivationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserIP]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserIP](
	[UserIPID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[IPAddr] [nvarchar](100) NULL,
 CONSTRAINT [PK_UserIP] PRIMARY KEY CLUSTERED 
(
	[UserIPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](max) NULL,
	[FirstName] [nvarchar](80) NULL,
	[LastName] [nvarchar](80) NULL,
	[Birthday] [date] NULL,
	[UserPic] [nvarchar](max) NULL,
	[Street] [nvarchar](50) NULL,
	[Municipality] [nvarchar](80) NULL,
	[City] [nvarchar](50) NULL,
	[AreaCode] [nvarchar](10) NULL,
	[Phone] [nvarchar](50) NULL,
	[Extension] [nvarchar](10) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[DateAdded] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[FacebookID] [bigint] NULL,
	[Priority] [nvarchar](50) NULL,
	[CorporateID] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Verification]    Script Date: 01/04/2016 8:08:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Verification](
	[ScanID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[VerificationScan] [nvarchar](max) NULL,
	[UploadDate] [date] NULL,
 CONSTRAINT [PK_Verification] PRIMARY KEY CLUSTERED 
(
	[ScanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Ambulance] ON 

INSERT [dbo].[Ambulance] ([AmbulanceID], [AmbulanceName], [AmbulanceStatus], [PlateNo], [DateAdded], [DateModified]) VALUES (1, N'Brown', N'Active', N'SER 784', CAST(N'2016-01-01' AS Date), CAST(N'2016-03-05' AS Date))
INSERT [dbo].[Ambulance] ([AmbulanceID], [AmbulanceName], [AmbulanceStatus], [PlateNo], [DateAdded], [DateModified]) VALUES (2, N'Red', N'Active', N'RER 345', CAST(N'2016-01-01' AS Date), CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Ambulance] ([AmbulanceID], [AmbulanceName], [AmbulanceStatus], [PlateNo], [DateAdded], [DateModified]) VALUES (3, N'Black', N'Active', N'AVW 147', CAST(N'2015-04-01' AS Date), CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Ambulance] ([AmbulanceID], [AmbulanceName], [AmbulanceStatus], [PlateNo], [DateAdded], [DateModified]) VALUES (4, N'Green', N'Active', N'WLO 344', CAST(N'2015-03-01' AS Date), CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Ambulance] ([AmbulanceID], [AmbulanceName], [AmbulanceStatus], [PlateNo], [DateAdded], [DateModified]) VALUES (5, N'Yellow', N'Active', N'TYF 974', CAST(N'2015-02-01' AS Date), CAST(N'2016-02-25' AS Date))
SET IDENTITY_INSERT [dbo].[Ambulance] OFF
SET IDENTITY_INSERT [dbo].[Applications] ON 

INSERT [dbo].[Applications] ([ApplicationID], [UserID], [FirstName], [LastName], [Email], [Birthday], [Street], [Municipality], [City], [Phone], [Mobile], [Status], [DateSubmitted]) VALUES (1, 2051, N'Juno', N'Temple', N'steven.tomas01@gmail.com', CAST(N'1993-04-02' AS Date), N'123 Taft Bldg.', N'Malate', N'Manila', N'542-2323', N'09453343423', N'Active', CAST(N'2016-02-11' AS Date))
INSERT [dbo].[Applications] ([ApplicationID], [UserID], [FirstName], [LastName], [Email], [Birthday], [Street], [Municipality], [City], [Phone], [Mobile], [Status], [DateSubmitted]) VALUES (2, 2049, N'Emma', N'Watson', N'emma.watson@email.com', CAST(N'1980-03-04' AS Date), N'21 Baker Street', N'Malate', N'Manila', N'1235677', N'12345443267', N'Voided', CAST(N'2016-02-11' AS Date))
INSERT [dbo].[Applications] ([ApplicationID], [UserID], [FirstName], [LastName], [Email], [Birthday], [Street], [Municipality], [City], [Phone], [Mobile], [Status], [DateSubmitted]) VALUES (3, 9, N'Cox', N'Carl', N'one@email.com', CAST(N'2001-07-11' AS Date), N'78', N'Village six', N'Quezon City', N'4541545', N'09453343423', N'Inactive', CAST(N'2016-02-18' AS Date))
INSERT [dbo].[Applications] ([ApplicationID], [UserID], [FirstName], [LastName], [Email], [Birthday], [Street], [Municipality], [City], [Phone], [Mobile], [Status], [DateSubmitted]) VALUES (4, 2052, N'Jacobs', N'Mark', N'mjay@email.com', CAST(N'1955-02-01' AS Date), N'857 John D Avenue', N'Valenzuela', N'Antipolo City', N'3413423', N'09565464534', N'Inactive', CAST(N'2016-03-06' AS Date))
INSERT [dbo].[Applications] ([ApplicationID], [UserID], [FirstName], [LastName], [Email], [Birthday], [Street], [Municipality], [City], [Phone], [Mobile], [Status], [DateSubmitted]) VALUES (5, 1039, N'Jessicas', N'Jessica', N'jalba@gmail.com', CAST(N'1970-06-07' AS Date), N'2627 Mercedes St., Singalong', N'Malate', N'Manila', N'1235677', N'09083262024', N'Inactive', CAST(N'2016-03-06' AS Date))
INSERT [dbo].[Applications] ([ApplicationID], [UserID], [FirstName], [LastName], [Email], [Birthday], [Street], [Municipality], [City], [Phone], [Mobile], [Status], [DateSubmitted]) VALUES (6, 35, N'Marks', N'Mark', N'123@gmail.com', CAST(N'1980-04-03' AS Date), N'167 Apple Street', N'Mandaluyong City', N'Mandaluyong City', N'8974545', N'09874454564', N'Inactive', CAST(N'2016-03-06' AS Date))
INSERT [dbo].[Applications] ([ApplicationID], [UserID], [FirstName], [LastName], [Email], [Birthday], [Street], [Municipality], [City], [Phone], [Mobile], [Status], [DateSubmitted]) VALUES (8, 1044, N'sman@google.com', N'Spiderr', N'Man', CAST(N'2001-11-11' AS Date), N'546 Apple street', N'District nine', N'Quezon City', N'4351223', N'09676676767', N'Active', CAST(N'2016-03-11' AS Date))
INSERT [dbo].[Applications] ([ApplicationID], [UserID], [FirstName], [LastName], [Email], [Birthday], [Street], [Municipality], [City], [Phone], [Mobile], [Status], [DateSubmitted]) VALUES (9, 1041, N'rr@email.com', N'Rihanna', N'Jones', CAST(N'1980-04-03' AS Date), N'312 Baker street', N'District four', N'Makati City', N'3234423', N'09764454322', N'Active', CAST(N'2016-03-11' AS Date))
SET IDENTITY_INSERT [dbo].[Applications] OFF
SET IDENTITY_INSERT [dbo].[ApplicationVoids] ON 

INSERT [dbo].[ApplicationVoids] ([VoidID], [ApplicationID], [Timestamp], [Reason]) VALUES (1, 2, CAST(N'2016-02-12 01:48:26.420' AS DateTime), N'Trying out this feature')
INSERT [dbo].[ApplicationVoids] ([VoidID], [ApplicationID], [Timestamp], [Reason]) VALUES (2, 2, CAST(N'2016-02-12 05:52:24.317' AS DateTime), N'Trying out this feature')
SET IDENTITY_INSERT [dbo].[ApplicationVoids] OFF
SET IDENTITY_INSERT [dbo].[Articles] ON 

INSERT [dbo].[Articles] ([ArticleID], [ArticleType], [Others], [DateSubmitted], [ArticlePic], [Title], [Summary], [Body], [UserID]) VALUES (1, N'Company News', N'', CAST(N'2015-10-19 05:18:47.217' AS DateTime), N'900x300.png', N'Best so far', N'Someone is almost done', N'<p>
	The quick brown fox jumps over the lazy dog</p>
', 40)
INSERT [dbo].[Articles] ([ArticleID], [ArticleType], [Others], [DateSubmitted], [ArticlePic], [Title], [Summary], [Body], [UserID]) VALUES (2, N'Careers', N'', CAST(N'2015-10-19 05:20:18.097' AS DateTime), N'9425602a-4ac5-4d63-85e7-482dfa498158.png', N'Another One', N'Yet another one', N'<p>
	Wooooooooooo!!</p>
', 40)
INSERT [dbo].[Articles] ([ArticleID], [ArticleType], [Others], [DateSubmitted], [ArticlePic], [Title], [Summary], [Body], [UserID]) VALUES (3, N'Services', N'', CAST(N'2015-10-19 05:33:25.173' AS DateTime), N'63277607-aa2b-4f98-8014-3dc2fff0ca1a.jpg', N'Sample', N'Post something', N'<p>
	<span style="color:#000080;"><span style="font-size:16px;"><span style="font-family:tahoma,geneva,sans-serif;"><strong>The quick brown fox jumps over the lazy dog&nbsp;<img alt="cheeky" height="20" src="http://localhost:6202/ckeditor/plugins/smiley/images/tounge_smile.gif" title="cheeky" width="20" /></strong></span></span></span></p>
', 40)
INSERT [dbo].[Articles] ([ArticleID], [ArticleType], [Others], [DateSubmitted], [ArticlePic], [Title], [Summary], [Body], [UserID]) VALUES (4, N'Health News', N'', CAST(N'2015-10-19 23:15:41.560' AS DateTime), N'a26c8fc9-e4c5-487d-8ccc-2ba1e952da43.jpg', N'Sherlock Holmes and Dr. Watson decide to go on a camping trip. After dinner and a bottle of wine, they lay down for the night, and go to sleep.', N'', N'<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px;">
	The&nbsp;<a href="http://www.sunnyskyz.com/funny-jokes/20/Sherlock-Holmes-and-Dr-Watson-Go-Camping#IO8dOfJMJi0ZLi7P.99" style="box-sizing: border-box; color: rgb(22, 109, 191); text-decoration: none !important; background: transparent;">joke</a>&nbsp;goes like this:</p>
<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px;">
	Sherlock Holmes and Dr. Watson decide to go on a camping trip. After dinner and a bottle of wine, they lay down for the night, and go to sleep.</p>
<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px;">
	Some hours later, Holmes awoke and nudged his faithful friend.<br style="box-sizing: border-box;" />
	&ldquo;Watson, look up at the sky and tell me what you see.&rdquo;</p>
<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px;">
	Watson replied, &ldquo;I see millions of stars.&rdquo;</p>
<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px;">
	&ldquo;What does that tell you?&rdquo;</p>
<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px;">
	Watson pondered for a minute.</p>
<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px;">
	&ldquo;Astronomically, it tells me that there are millions of galaxies and potentially billions of planets.&rdquo;</p>
<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px;">
	&ldquo;Astrologically, I observe that Saturn is in Leo.&rdquo;</p>
<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px;">
	&ldquo;Horologically, I deduce that the time is approximately a quarter past three.&rdquo;</p>
<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px;">
	&ldquo;Theologically, I can see that God is all powerful and that we are small and insignificant.&rdquo;</p>
<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px;">
	&ldquo;Meteorologically, I suspect that we will have a beautiful day tomorrow.&rdquo;</p>
<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px;">
	&ldquo;What does it tell you, Holmes?&rdquo;</p>
<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px;">
	Holmes was silent for a minute, then spoke: &ldquo;Watson, you idiot. Someone has stolen our tent!&rdquo;</p>
', 41)
INSERT [dbo].[Articles] ([ArticleID], [ArticleType], [Others], [DateSubmitted], [ArticlePic], [Title], [Summary], [Body], [UserID]) VALUES (5, N'Health News', N'', CAST(N'2015-10-19 23:18:09.523' AS DateTime), N'900x300.png', N'The High Cost of High Cost', N'', N'<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px; padding-left: 0px !important; padding-right: 0px !important;">
	I admit, I was taken aback at the headline&nbsp;<a href="http://www.houstonpress.com/news/going-under-what-can-happen-if-your-anesthesiologist-leaves-the-room-during-an-operation-7842230" style="box-sizing: border-box; color: rgb(22, 109, 191); text-decoration: none !important; background: transparent;" target="_blank">in the Houston Press</a>:</p>
<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px; padding-left: 0px !important; padding-right: 0px !important;">
	&ldquo;<em style="box-sizing: border-box;">Going Under: What Can Happen if your anesthesiologist leaves the room during an operation</em>.&rdquo;</p>
<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px; padding-left: 0px !important; padding-right: 0px !important;">
	The curious reader is bound to wonder why the anesthesiologist would leave the operating room in the first place.</p>
<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px; padding-left: 0px !important; padding-right: 0px !important;">
	Of course, reporter Dianna Wray explains that in many hospitals, one physician anesthesiologist often supervises multiple cases staffed by nurse anesthetists. This model of care is called the &ldquo;<a href="http://www.asahq.org/For-the-Public-and-Media/About-Profession.aspx" style="box-sizing: border-box; color: rgb(22, 109, 191); text-decoration: none !important; background: transparent;" target="_blank">anesthesia care team</a>&ldquo;, and has a very long record of safe practice in nearly all major hospitals in the United States. Typically, the anesthesiologist makes rounds from one operating room to the next, checking on each case frequently, just as an internal medicine physician would round on patients in the hospital who are being monitored by their nurses.</p>
', 41)
INSERT [dbo].[Articles] ([ArticleID], [ArticleType], [Others], [DateSubmitted], [ArticlePic], [Title], [Summary], [Body], [UserID]) VALUES (6, N'Company News', N'', CAST(N'2015-10-19 23:19:04.880' AS DateTime), N'900x300.png', N'Five takeaways about the Theranos broo-ha-ha', N'', N'<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px; padding-left: 0px !important; padding-right: 0px !important;">
	You&rsquo;ve probably seen by now both that the&nbsp;<a href="http://www.wsj.com/articles/theranos-has-struggled-with-blood-tests-1444881901?mkt_tok=3RkMMJWWfF9wsRonvKvKZKXonjHpfsX66OkvWrHr08Yy0EZ5VunJEUWy2oABS9Q%2FcOedCQkZHblFnVQNSq29Wq4NqaML" style="box-sizing: border-box; color: rgb(22, 109, 191); text-decoration: none !important; background: transparent;" target="_blank">WSJ&rsquo;s John Carreyrou&nbsp;has run a well researched hit piece on Theranos&nbsp;</a>and that the company, led by wunderkind Elizabeth Holmes, has somewhat&nbsp;<a href="http://www.fiercemedicaldevices.com/press-releases/statement-theranos" style="box-sizing: border-box; color: rgb(22, 109, 191); text-decoration: none !important; background: transparent;" target="_blank">muffed its reply</a>. If you haven&rsquo;t, best thing is to read the Roger Parloff&nbsp;<a href="http://fortune.com/2015/10/15/theranos-elizabeth-holmes-wsj/" style="box-sizing: border-box; color: rgb(22, 109, 191); text-decoration: none !important; background: transparent;" target="_blank">Fortune piece</a>&nbsp;which summarizes the pay-walled piece so you don&rsquo;t have to do the painful task of sending&nbsp;Rupert Murdoch money. Now in the spirit of FD I need to let you know that we&rsquo;ve invited Holmes to speak at&nbsp;<a href="http://health2con.com/" style="box-sizing: border-box; color: rgb(22, 109, 191); text-decoration: none !important; background: transparent;" target="_blank">Health 2.0</a>twice and her PR handlers have been unbelievably hard to communicate with. They&rsquo;ve either flat out ignored us or taken forever to turn us down, even though she&rsquo;s appeared often at (what I at least consider) much less important or relevant venues. I have no idea if she&rsquo;s badly advised, wanting to stay away from sophisticated health tech audiences, or if her handlers decided that we and our 2,000 strong crowd&nbsp;are just not cool enough&nbsp;for her. Or maybe simply her calendar hasn&rsquo;t&nbsp;allowed it. Either way I have no first hand knowledge of her or the product&ndash;although Elizabeth our invite is still out there! But I do know five&nbsp;things.</p>
<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px; padding-left: 0px !important; padding-right: 0px !important;">
	1)&nbsp;<em style="box-sizing: border-box;"><strong style="box-sizing: border-box;">Lab business decentralizes &amp; democratizes.</strong></em>&nbsp;Whether or not Theranos is lying, cheating, not using its own tech, or its cool stuff just doesn&rsquo;t work, the trend towards comprehensive, cheap and soon at home lab testing is clear. More than 5 years ago a company called&nbsp;<a href="http://www.bioiq.com/solutions/bioiq-screen/" style="box-sizing: border-box; color: rgb(22, 109, 191); text-decoration: none !important; background: transparent;" target="_blank">BioIQ&nbsp;</a>was selling at home fingerstick based cholesterol &amp; glucose tests. In the past year the two stage Nokia Sensing XCHALLENGE&nbsp;(of which we hosted stage 1 at Health 2.0 in 2013) has revealed a&nbsp;<a href="http://www.wired.com/2014/11/device-diagnoses-hundreds-diseases-using-single-drop-blood/" style="box-sizing: border-box; color: rgb(22, 109, 191); text-decoration: none !important; background: transparent;" target="_blank">plethora&nbsp;</a>of&nbsp;<a href="http://sensing.xprize.org/press-release/nanobiosym-health-radar-brings-point-of-diagnosis-technology-directly" style="box-sizing: border-box; color: rgb(22, 109, 191); text-decoration: none !important; background: transparent;" target="_blank">companies</a>&nbsp;taking minute quantities of blood, pee or spit and doing&nbsp;complex diagnosis from them. And it&rsquo;s not stopping there. The next phase is using l<a href="http://www.sandiegouniontribune.com/news/2014/nov/11/DMI-Qualcomm-XPrize-medical-Tricorder-Nokia/#comments-module" style="box-sizing: border-box; color: rgb(22, 109, 191); text-decoration: none !important; background: transparent;" target="_blank">ight and other sensors</a>&nbsp;to diagnose direct from the skin. Whether or not the locus of activity ends up using Theranos at&nbsp;Walgreens or the kitchen table using something else, the dam holding back continuous, cheap multi-faceted testing is going to burst soon.</p>
<p style="box-sizing: border-box; margin-top: 0px; font-family: Georgia, Times, ''Times New Roman'', serif; font-size: 22px; line-height: 32px; margin-bottom: 24px; padding-left: 0px !important; padding-right: 0px !important;">
	2)&nbsp;<strong style="box-sizing: border-box;">Theranos and Holmes are not the most important thing in health care.</strong>&nbsp;There, I&rsquo;ve said it. While Holmes has talked a lot about revolutionizing health care access and has given lots of transparency into Theranos&rsquo; pricing if not its testing technology, what they&rsquo;re up to is getting easier access to lab tests. I think this is very important and a very good thing, but no one can seriously believe that this is the biggest change in health care. It&rsquo;s part of a trend towards consumerism. But I&rsquo;d argue the most important trend in health care is the redesign of chronic care management, on which we spend a shed-load more than lab testing. I may be wrong but if you insert your pet issue here, I&rsquo;d bet it&rsquo;s not cheaper lab testing. The media has been a tad snowed by the &ldquo;youngest female billionaire&rdquo; and &ldquo;blonde Steve Jobs&rdquo; analogies, but even if she runs the field and takes over most lab testing, it&rsquo;s an incremental change not a huge revolution in health care.</p>
', 41)
INSERT [dbo].[Articles] ([ArticleID], [ArticleType], [Others], [DateSubmitted], [ArticlePic], [Title], [Summary], [Body], [UserID]) VALUES (7, N'Health News', N'', CAST(N'2015-10-19 23:19:25.347' AS DateTime), N'900x300.png', N'GET Funded Service – What did we learn?', N'', N'<div>
	Part of an EU-funded programme, the GET Funded service targeted European digital health SMEs looking for follow-up investments &ndash; typically between 0.5 and 2M &euro; &ndash; and was designed to provide them with training, resources and networking opportunities with European investors. In two years, we worked with 50 start-ups, trained and placed over 30 of them on stage to pitch in front of investors. What did we learn?</div>
<div>
	&nbsp;</div>
<div>
	The GET consortium started by identifying the European investors that were the most active in digital health: about a dozen dedicated funds plus a mix of corporate, health care, technology, and agnostic venture funds. We recruited about 40 we considered as &lsquo;active&rsquo;, a number that will grow as we witness the creation of new dedicated funds every year. 2015 saw the creation of one in particular that should be interesting to follow: AXA, already ahead of the game in terms of digital health reimbursements, now has a new dedicated investment fund.</div>
', 41)
INSERT [dbo].[Articles] ([ArticleID], [ArticleType], [Others], [DateSubmitted], [ArticlePic], [Title], [Summary], [Body], [UserID]) VALUES (8, N'Health News', N'', CAST(N'2015-10-19 23:19:43.130' AS DateTime), N'd7289e99-ad4e-433e-b5a2-21d2b686af2c.jpg', N'Medical Errors, Or Not', N'', N'In a recent post, the renowned neurologist, Martin Samuels, paid homage to the degree to which uncertainties create more than just anxious clinicians,they can lead to clinical errors. That post was followed by another  by Paul Levy, a former CEO of a Boston hospital, arguing that the errors can be diminished and the anxieties assuaged if institutions adhered to an efficient, salutary systems approach. Both Dr. Samuels and Mr. Levy anchor their perspective in the 1999 report of Institute of Medicine Report, “To Err is Human”, which purported to expose an alarming frequency of fatal iatrogenic errors. However, Dr. Samuels reads the Report as a documentation of the price we pay for imperfect knowledge; Mr. Levy as the price we pay for an imperfect organization of health care delivery. These two posts engendered numerous comments and several subsequent posts unfurling one banner or the other. 

 I crossed paths with Dr Samuels a long time ago when we were both speakers at a CME course held by the American Geriatrics Society and the American College of Physicians. I still remember his talk for its content and for its clinical perspective. His post on THCB is similarly worthy for championing the role of the physician in confronting the challenge of doing well by one patient at a time. Mr. Levy and his fellow travelers are convinced they can create settings and algorithms that compensate for the idiosyncrasies of clinical care. I will argue that there is nobility in Dr. Samuels’ quest for clinical excellence. I will further argue that Mr Levy is misled by systems theories that are more appropriate for rendering manufacturing industries profitable than for rendering patient care effective.', 41)
SET IDENTITY_INSERT [dbo].[Articles] OFF
SET IDENTITY_INSERT [dbo].[AutomaticRenewal] ON 

INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (1, 6, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (2, 7, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (3, 10, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (4, 11, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (5, 12, 30, N'Disabled', N'Individual', N'Unsent')
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (6, 13, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (7, 14, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (8, 15, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (9, 17, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (10, 35, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (11, 36, 30, N'Enabled', N'Individual', N'Unsent')
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (12, 40, 15, N'Enabled', N'Individual', N'Unsent')
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (13, 41, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (14, 1038, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (15, 1039, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (16, 1040, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (17, 1041, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (18, 1042, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (19, 1044, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (20, 1046, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (24, 1048, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (26, 1050, 30, N'Enabled', N'Individual', N'Sent')
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (1025, 2049, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (1026, 2050, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (1027, 2051, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (1028, 2052, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (1029, 2053, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (1030, 2056, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (1031, 2057, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (1032, 2058, NULL, N'Disabled', NULL, NULL)
INSERT [dbo].[AutomaticRenewal] ([AutoRenewalID], [UserID], [RemindMe], [Status], [Type], [RemindMeStatus]) VALUES (1033, 2059, NULL, N'Disabled', NULL, NULL)
SET IDENTITY_INSERT [dbo].[AutomaticRenewal] OFF
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (1, N'Antipolo City', 1)
INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (2, N'Caloocan City', 1)
INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (3, N'Las Piñas City', 1)
INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (4, N'Makati City', 1)
INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (5, N'Malabon City', 1)
INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (6, N'Mandaluyong City', 1)
INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (7, N'Manila', 1)
INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (8, N'Marikina City', 1)
INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (9, N'Muntinlupa City', 1)
INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (10, N'Navotas City', 1)
INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (11, N'Paranaque City', 1)
INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (12, N'Pasay City', 1)
INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (13, N'Pasig City', 1)
INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (14, N'Pateros City', 1)
INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (15, N'Quezon City', 1)
INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (16, N'Rizal', 1)
INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (17, N'San Juan City', 1)
INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (18, N'Taguig', 1)
INSERT [dbo].[Cities] ([CityID], [Name], [RegionID]) VALUES (19, N'Valenzuela City', 1)
SET IDENTITY_INSERT [dbo].[Cities] OFF
SET IDENTITY_INSERT [dbo].[ContactCategory] ON 

INSERT [dbo].[ContactCategory] ([RelationshipID], [Relationship]) VALUES (1, N'Relative')
INSERT [dbo].[ContactCategory] ([RelationshipID], [Relationship]) VALUES (2, N'Friend')
INSERT [dbo].[ContactCategory] ([RelationshipID], [Relationship]) VALUES (3, N'Co-worker')
INSERT [dbo].[ContactCategory] ([RelationshipID], [Relationship]) VALUES (4, N'Guardian')
INSERT [dbo].[ContactCategory] ([RelationshipID], [Relationship]) VALUES (5, N'Other')
SET IDENTITY_INSERT [dbo].[ContactCategory] OFF
SET IDENTITY_INSERT [dbo].[CorporateAccounts] ON 

INSERT [dbo].[CorporateAccounts] ([CorporateID], [UserName], [Password], [Name], [NatureOfBusiness], [Address], [Municipality], [City], [Phone], [Fax], [Email], [Others], [Status], [DateAdded], [EmployerCode], [Logo]) VALUES (1, N'mia7dfea81', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Microsoft', N'Service', N'21 Baker Street', N'Makat', N'Metro Manila', N'5421232', N'5421212', N'support@microsoft.com', N'IT', N'Active', CAST(N'2015-10-24' AS Date), N'a7dfea81', NULL)
INSERT [dbo].[CorporateAccounts] ([CorporateID], [UserName], [Password], [Name], [NatureOfBusiness], [Address], [Municipality], [City], [Phone], [Fax], [Email], [Others], [Status], [DateAdded], [EmployerCode], [Logo]) VALUES (2, N'ap2de9278b', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Apple', N'Merchandising', N'65 Avenue Broadway', N'Valenzuela', N'Metro Manila', N'6542123', N'65434343', N'cs@apple.com', N'IT', N'Active', CAST(N'2015-10-24' AS Date), N'2de9278b', NULL)
INSERT [dbo].[CorporateAccounts] ([CorporateID], [UserName], [Password], [Name], [NatureOfBusiness], [Address], [Municipality], [City], [Phone], [Fax], [Email], [Others], [Status], [DateAdded], [EmployerCode], [Logo]) VALUES (3, N'he9a9050da', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Hewlett Packard', N'Other', N'88 Madison Avenue', N'Mango', N'Quezon City', N'25623232', N'23540003', N'it@hp.com', N'IT', N'Active', CAST(N'2015-10-24' AS Date), N'9a9050da', NULL)
INSERT [dbo].[CorporateAccounts] ([CorporateID], [UserName], [Password], [Name], [NatureOfBusiness], [Address], [Municipality], [City], [Phone], [Fax], [Email], [Others], [Status], [DateAdded], [EmployerCode], [Logo]) VALUES (30, N'go1e23254e', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Google', N'Service', N'88 Madison Avenue', N'Malate', N'Manila', N'6542123', N'65434343', N'gg@google.com', N'', N'Active', CAST(N'2015-10-25' AS Date), N'1e23254e', NULL)
INSERT [dbo].[CorporateAccounts] ([CorporateID], [UserName], [Password], [Name], [NatureOfBusiness], [Address], [Municipality], [City], [Phone], [Fax], [Email], [Others], [Status], [DateAdded], [EmployerCode], [Logo]) VALUES (31, N'ts9e28c09d', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'TSM Shipping', N'Other', N'Dian Street Palanan', N'Makati', N'Metro Manila', N'525-1698', N'23540003', N'support@tsmshipping.com.ph', N'Manpower', N'Active', CAST(N'2015-10-25' AS Date), N'9e28c09d', NULL)
INSERT [dbo].[CorporateAccounts] ([CorporateID], [UserName], [Password], [Name], [NatureOfBusiness], [Address], [Municipality], [City], [Phone], [Fax], [Email], [Others], [Status], [DateAdded], [EmployerCode], [Logo]) VALUES (32, N'dea6ce579a', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Dell', N'Manufacturing', N'21 Baker Street', N'Albay', N'Bicol', N'6665355', N'3223145', N'dellop@gg.com', N'IT', N'Active', CAST(N'2015-10-25' AS Date), N'a6ce579a', NULL)
INSERT [dbo].[CorporateAccounts] ([CorporateID], [UserName], [Password], [Name], [NatureOfBusiness], [Address], [Municipality], [City], [Phone], [Fax], [Email], [Others], [Status], [DateAdded], [EmployerCode], [Logo]) VALUES (39, N'ab6732b660', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'ABS-CBN', N'Service', N'Mother Ignacia Street', N'Quezon City', N'Metro Manila', N'42232324', N'65434343', N'help@abs-cbn.com.ph', N'Broadcasting', N'Active', CAST(N'2015-10-25' AS Date), N'6732b660', NULL)
INSERT [dbo].[CorporateAccounts] ([CorporateID], [UserName], [Password], [Name], [NatureOfBusiness], [Address], [Municipality], [City], [Phone], [Fax], [Email], [Others], [Status], [DateAdded], [EmployerCode], [Logo]) VALUES (45, N'sa69815158', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'SAP', N'Merchandising', N'9591 Bay Drive', N'Quezon City', N'Metro Manila', N'2323242', N'65434343', N'sapbusiness@live.com', N'IT', N'Active', CAST(N'2015-10-25' AS Date), N'69815158', NULL)
INSERT [dbo].[CorporateAccounts] ([CorporateID], [UserName], [Password], [Name], [NatureOfBusiness], [Address], [Municipality], [City], [Phone], [Fax], [Email], [Others], [Status], [DateAdded], [EmployerCode], [Logo]) VALUES (47, N'as972e9469', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Asus', N'Merchandising', N'2288 King Street ', N'Canal Winchester', N'OH', N'5251698', N'65434343', N'sales@asus.com', N'', N'Active', CAST(N'2015-10-25' AS Date), N'972e9469', NULL)
INSERT [dbo].[CorporateAccounts] ([CorporateID], [UserName], [Password], [Name], [NatureOfBusiness], [Address], [Municipality], [City], [Phone], [Fax], [Email], [Others], [Status], [DateAdded], [EmployerCode], [Logo]) VALUES (50, N'sm2e597fc7', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Smart Communications', N'Other', N'6134 Ayala Avenue', N'Ayala', N'Makati City', N'2323242', N'5645454', N'help@smart.com.ph', N'Telecommunications', N'Active', CAST(N'2015-10-26' AS Date), N'2e597fc7', NULL)
INSERT [dbo].[CorporateAccounts] ([CorporateID], [UserName], [Password], [Name], [NatureOfBusiness], [Address], [Municipality], [City], [Phone], [Fax], [Email], [Others], [Status], [DateAdded], [EmployerCode], [Logo]) VALUES (51, N'inc5c67c95', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Intel', N'Manufacturing', N'82 Avenue', N'Navotas', N'Navotas City', N'7841454', N'7787454', N'sales@intel.com', N'', N'Active', CAST(N'2016-02-25' AS Date), N'c5c67c95', NULL)
INSERT [dbo].[CorporateAccounts] ([CorporateID], [UserName], [Password], [Name], [NatureOfBusiness], [Address], [Municipality], [City], [Phone], [Fax], [Email], [Others], [Status], [DateAdded], [EmployerCode], [Logo]) VALUES (52, N'lemonjaxf8b2aadf', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Lemonjax', N'Service', N'2115 Edsa corner Reliance street', N'Mandaluyong City', N'Mandaluyong City', N'4671454', N'4787845', N'support@lemonjax.com', N'', N'Active', CAST(N'2016-03-06' AS Date), N'f8b2aadf', NULL)
INSERT [dbo].[CorporateAccounts] ([CorporateID], [UserName], [Password], [Name], [NatureOfBusiness], [Address], [Municipality], [City], [Phone], [Fax], [Email], [Others], [Status], [DateAdded], [EmployerCode], [Logo]) VALUES (53, N'ost-mayer073e0811', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Ost-Mayer', N'Service', N'556 Edsa corner Boni', N'Mandaluyong City', N'Mandaluyong City', N'6478745', N'4574487', N'ostandmayer@osm.com', N'', N'Active', CAST(N'2016-03-06' AS Date), N'073e0811', NULL)
INSERT [dbo].[CorporateAccounts] ([CorporateID], [UserName], [Password], [Name], [NatureOfBusiness], [Address], [Municipality], [City], [Phone], [Fax], [Email], [Others], [Status], [DateAdded], [EmployerCode], [Logo]) VALUES (54, N'or3a1cc6b6', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Orange Fix', N'Service', N'89 Apple Street', N'Quezon City', N'Quezon City', N'3464545', N'5656344', N'orangeapple@orangefix.com', N'', N'Active', CAST(N'2016-03-07' AS Date), N'3a1cc6b6', NULL)
INSERT [dbo].[CorporateAccounts] ([CorporateID], [UserName], [Password], [Name], [NatureOfBusiness], [Address], [Municipality], [City], [Phone], [Fax], [Email], [Others], [Status], [DateAdded], [EmployerCode], [Logo]) VALUES (55, N'vi2016f', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Vira Pest', N'Service', N'958 Mercedes Street', N'Manila', N'Manila', N'3232424', N'3232424', N'vpest@gmail.com', N'', N'Active', CAST(N'2016-04-01' AS Date), N'f40737c2', NULL)
SET IDENTITY_INSERT [dbo].[CorporateAccounts] OFF
SET IDENTITY_INSERT [dbo].[CorporatePayments] ON 

INSERT [dbo].[CorporatePayments] ([CorporatePaymentID], [PaymentTerms], [Balance], [CorporateID], [DiscountRate], [Length]) VALUES (1, N'Net 7', CAST(500000.00 AS Decimal(18, 2)), 1, CAST(5 AS Decimal(18, 0)), 5)
INSERT [dbo].[CorporatePayments] ([CorporatePaymentID], [PaymentTerms], [Balance], [CorporateID], [DiscountRate], [Length]) VALUES (2, N'Net 10', CAST(43660.00 AS Decimal(18, 2)), 2, CAST(7 AS Decimal(18, 0)), 5)
INSERT [dbo].[CorporatePayments] ([CorporatePaymentID], [PaymentTerms], [Balance], [CorporateID], [DiscountRate], [Length]) VALUES (3, N'EOM', CAST(18460.00 AS Decimal(18, 2)), 3, CAST(2 AS Decimal(18, 0)), 5)
INSERT [dbo].[CorporatePayments] ([CorporatePaymentID], [PaymentTerms], [Balance], [CorporateID], [DiscountRate], [Length]) VALUES (25, N'Net 7', CAST(100000.00 AS Decimal(18, 2)), 30, CAST(3 AS Decimal(18, 0)), 3)
INSERT [dbo].[CorporatePayments] ([CorporatePaymentID], [PaymentTerms], [Balance], [CorporateID], [DiscountRate], [Length]) VALUES (26, N'EOM', CAST(450000.00 AS Decimal(18, 2)), 31, CAST(12 AS Decimal(18, 0)), 1)
INSERT [dbo].[CorporatePayments] ([CorporatePaymentID], [PaymentTerms], [Balance], [CorporateID], [DiscountRate], [Length]) VALUES (27, N'Net 7', CAST(120000.00 AS Decimal(18, 2)), 32, CAST(2 AS Decimal(18, 0)), 2)
INSERT [dbo].[CorporatePayments] ([CorporatePaymentID], [PaymentTerms], [Balance], [CorporateID], [DiscountRate], [Length]) VALUES (34, N'Net 7', CAST(900000.00 AS Decimal(18, 2)), 39, CAST(0 AS Decimal(18, 0)), 10)
INSERT [dbo].[CorporatePayments] ([CorporatePaymentID], [PaymentTerms], [Balance], [CorporateID], [DiscountRate], [Length]) VALUES (40, N'Net 90', CAST(750000.00 AS Decimal(18, 2)), 45, CAST(10 AS Decimal(18, 0)), 7)
INSERT [dbo].[CorporatePayments] ([CorporatePaymentID], [PaymentTerms], [Balance], [CorporateID], [DiscountRate], [Length]) VALUES (42, N'Net 30', CAST(100000.00 AS Decimal(18, 2)), 47, CAST(4 AS Decimal(18, 0)), 3)
INSERT [dbo].[CorporatePayments] ([CorporatePaymentID], [PaymentTerms], [Balance], [CorporateID], [DiscountRate], [Length]) VALUES (45, N'EOM', CAST(4799333.99 AS Decimal(18, 2)), 50, CAST(5 AS Decimal(18, 0)), 7)
INSERT [dbo].[CorporatePayments] ([CorporatePaymentID], [PaymentTerms], [Balance], [CorporateID], [DiscountRate], [Length]) VALUES (46, N'Net 7', CAST(14080000.00 AS Decimal(18, 2)), 51, CAST(12 AS Decimal(18, 0)), 5)
INSERT [dbo].[CorporatePayments] ([CorporatePaymentID], [PaymentTerms], [Balance], [CorporateID], [DiscountRate], [Length]) VALUES (47, N'Net 7', CAST(22000.00 AS Decimal(18, 2)), 52, CAST(2 AS Decimal(18, 0)), 5)
INSERT [dbo].[CorporatePayments] ([CorporatePaymentID], [PaymentTerms], [Balance], [CorporateID], [DiscountRate], [Length]) VALUES (48, N'Net 60', CAST(365000.00 AS Decimal(18, 2)), 53, CAST(3 AS Decimal(18, 0)), 3)
INSERT [dbo].[CorporatePayments] ([CorporatePaymentID], [PaymentTerms], [Balance], [CorporateID], [DiscountRate], [Length]) VALUES (49, N'Net 7', CAST(870000.00 AS Decimal(18, 2)), 54, CAST(1 AS Decimal(18, 0)), 4)
INSERT [dbo].[CorporatePayments] ([CorporatePaymentID], [PaymentTerms], [Balance], [CorporateID], [DiscountRate], [Length]) VALUES (50, N'Net 7', CAST(500000.00 AS Decimal(18, 2)), 55, CAST(2 AS Decimal(18, 0)), 2)
SET IDENTITY_INSERT [dbo].[CorporatePayments] OFF
SET IDENTITY_INSERT [dbo].[Dependents] ON 

INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (9, N'Robert Steven', N'Tomas', CAST(N'1993-04-13' AS Date), N'Son', N'Me', 33, 12)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (13, N'Robert Steven', N'Tomas', CAST(N'1993-04-13' AS Date), N'Husband', N'', 34, 12)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (14, N'Robert Steven', N'Tomas', CAST(N'1993-04-13' AS Date), N'Husband', N'', 34, 12)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (17, N'Robert Steven', N'Tomas', CAST(N'1993-04-13' AS Date), N'Son', N'', 37, 12)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (18, N'Emma', N'Watson', CAST(N'1990-02-05' AS Date), N'Wife', N'', 37, 12)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (19, N'Emma', N'Roberts', CAST(N'1995-01-21' AS Date), N'Son', N'', 37, 12)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (21, N'Robert Steven', N'Tomas', CAST(N'1993-04-13' AS Date), N'Other', N'Me', 39, 12)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (25, N'Robert Steven', N'Tomas', CAST(N'1993-04-13' AS Date), N'Wife', N'', 40, 40)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (26, N'Robert Steven', N'Tomas', CAST(N'1993-04-13' AS Date), N'Other', N'', 40, 40)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (27, N'Robert Steven', N'Tomas', CAST(N'1993-04-13' AS Date), N'Other', N'', 40, 40)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (28, N'Robert Steven', N'Tomas', CAST(N'1993-04-13' AS Date), N'Son', N'', 40, 40)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (29, N'Robert Steven', N'Tomas', CAST(N'1993-04-13' AS Date), N'Wife', N'', 41, 12)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (30, N'Robert Steven', N'Tomas', CAST(N'1993-04-13' AS Date), N'Son', N'', 41, 12)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (33, N'Robert Steven', N'Tomas', CAST(N'1993-04-13' AS Date), N'Wife', N'Me', 44, 36)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (37, N'QQ', N'Mayer', CAST(N'1993-04-13' AS Date), N'Son', N'', 45, 40)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (38, N'AA', N'Per', CAST(N'1993-04-13' AS Date), N'Wife', N'', 45, 40)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (41, N'Matt', N'Jerson', CAST(N'1990-05-12' AS Date), N'Son', N'', 60, 40)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (42, N'Emily', N'Watson', CAST(N'1970-01-12' AS Date), N'Wife', N'', 60, 40)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (45, N'Ron', N'Weasley', CAST(N'1997-06-23' AS Date), N'Husband', N'', 2, 2049)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (46, N'Robert Steven', N'Tomas', CAST(N'1997-06-23' AS Date), N'Son', N'', 2, 2049)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (51, N'Emma', N'asdasd', CAST(N'7445-11-23' AS Date), N'Wife', N'', 1, 2051)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (60, N'asdasd', N'sasd', CAST(N'2001-11-23' AS Date), N'Wife', N'asd', 1, 2051)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (64, N'asdasd', N'asdasd', CAST(N'1945-11-23' AS Date), N'Son', N'asd', 1, 2051)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (68, N'Emma', N'Watson', CAST(N'1995-02-04' AS Date), N'Husband', N'', 2070, 1046)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (69, N'Ron', N'Weasley', CAST(N'1980-09-01' AS Date), N'Son', N'', 2070, 1046)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (72, N'Hermione', N'Grandier', CAST(N'2016-03-07' AS Date), N'Husband', N'', 8, 1044)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (73, N'Ron', N'Wisley', CAST(N'2016-03-31' AS Date), N'Wife', N'', 8, 1044)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (76, N'Hermion', N'Granade', CAST(N'2016-03-01' AS Date), N'Wife', N'', 2071, 1044)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (77, N'Harry', N'Potter', CAST(N'2016-03-04' AS Date), N'Son', N'', 2071, 1044)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (78, N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', 2071, 1044)
INSERT [dbo].[Dependents] ([DependentID], [FirstName], [LastName], [Birthday], [Relationship], [OtherRel], [MembershipID], [UserID]) VALUES (79, N'', N'', CAST(N'1900-01-01' AS Date), N'', N'', 2071, 1044)
SET IDENTITY_INSERT [dbo].[Dependents] OFF
SET IDENTITY_INSERT [dbo].[DepositPayments] ON 

INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (1, 1, N'3281fb16-5390-4809-8ce8-6e8d9c4287de.jpg', CAST(N'2015-10-25' AS Date), CAST(3000.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (2, 1, N'24fbf838-1889-481c-a3d6-b00fd8b5cb37.jpg', CAST(N'2015-10-25' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (3, 2, N'2f86f375-2608-4d36-b834-bfef0e431914', CAST(N'2015-10-25' AS Date), CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (4, 3, N'c34ed6bc-b446-4591-9c6c-94239c287cb6', CAST(N'2015-10-25' AS Date), CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (5, 3, N'c6e0c74e-428a-4a59-bbbd-011cd2e5e624', CAST(N'2015-10-25' AS Date), CAST(8000.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (6, 3, N'87df3c53-80ae-479d-be3e-6cb529d3287c', CAST(N'2015-10-25' AS Date), CAST(540.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (7, 3, N'00f1e0d4-d15a-46ef-82a8-c24b7c127b11', CAST(N'2015-10-25' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (8, 1, N'2b39c819-d842-4a03-bced-8ba9bfc42a17.jpg', CAST(N'2015-10-25' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (9, 1, N'5fec33d6-fbe2-430d-8afc-1075481766dc.jpg', CAST(N'2015-10-25' AS Date), CAST(2500.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (10, 2, N'd7f74b05-8675-4594-b157-ffd6201bd01a', CAST(N'2015-10-25' AS Date), CAST(2340.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (13, 40, N'2ebc4670-6a13-4a0f-a58f-870e54ea2b40.jpg', CAST(N'2015-10-26' AS Date), CAST(250000.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (14, 26, N'6ab9f02a-1e58-4722-8925-5b9cb8f036de', CAST(N'2015-10-26' AS Date), CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (15, 26, N'174484e8-96bd-4b57-97be-b76992ad253f', CAST(N'2015-10-26' AS Date), CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (16, 26, N'30ce7200-c842-4a9b-a02a-221d3ff9dd28', CAST(N'2015-10-26' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (21, 45, N'97e85167-f224-46dc-8e9a-d3f68aaa2ad7.jpg', CAST(N'2015-10-26' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (24, 45, N'9f73d169-f27c-49c2-8972-c3937afaee08', CAST(N'2015-10-26' AS Date), CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (25, 45, N'662823aa-60c5-470d-ba69-cace8e75d9e5', CAST(N'2015-10-26' AS Date), CAST(0.01 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (26, 45, N'd3912a44-e57f-46b3-bd3e-87dc6fa41052', CAST(N'2015-10-26' AS Date), CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (27, 45, N'4510dd59-212c-445a-af70-fd3658355e3e', CAST(N'2015-10-26' AS Date), CAST(120.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (28, 45, N'90d5463e-6cf6-44b1-a93b-486536feb5d0.jpg', CAST(N'2015-10-26' AS Date), CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (29, 45, N'46b44d04-0b0f-4253-a35e-6bb96e3b3090.jpg', CAST(N'2016-02-25' AS Date), CAST(200000.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (30, 42, N'd788a888-7e9c-4a54-ba9f-e3198934293a.jpg', CAST(N'2016-02-25' AS Date), CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (36, 46, N'9cc756d0-5d7f-4773-a0e4-438c9c96b594.jpg', CAST(N'2016-02-25' AS Date), CAST(320000.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (37, 46, N'3b58a130-34bc-4e7c-8c36-5918a2a59dbc', CAST(N'2016-02-25' AS Date), CAST(100000.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (38, 46, N'ad65e0cd-786c-4e95-bd67-085ca3282f1c', CAST(N'2016-02-25' AS Date), CAST(500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (39, 47, N'03420ebb-fa31-47e2-93ef-fb018fb1f169.jpg', CAST(N'2016-03-06' AS Date), CAST(78000.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (40, 1, N'4d613526-6600-4d39-978a-8118cc669bf2.jpg', CAST(N'2016-03-07' AS Date), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[DepositPayments] ([DepositID], [CorporatePaymentID], [DepositSlip], [PaymentDate], [Amount]) VALUES (41, 1, N'f56694eb-f680-490e-b19a-d98b142adc62.jpg', CAST(N'2016-03-07' AS Date), CAST(6990000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[DepositPayments] OFF
SET IDENTITY_INSERT [dbo].[Dispatch] ON 

INSERT [dbo].[Dispatch] ([DispatchID], [UserID], [Dispatcher], [DispatchDate], [Ambulance], [TeamLeader], [TransportOfficer], [TreatmentOfficer], [ReceivingHospital]) VALUES (1, 12, N'Joseph', CAST(N'2011-01-01' AS Date), N'Charlie', N'Mark', N'Luke', N'John', N'Makati Medical Center')
INSERT [dbo].[Dispatch] ([DispatchID], [UserID], [Dispatcher], [DispatchDate], [Ambulance], [TeamLeader], [TransportOfficer], [TreatmentOfficer], [ReceivingHospital]) VALUES (2, 12, N'Mathew', CAST(N'2011-01-01' AS Date), N'Mark', N'Luke', N'John', N'Johni', N'PGH')
INSERT [dbo].[Dispatch] ([DispatchID], [UserID], [Dispatcher], [DispatchDate], [Ambulance], [TeamLeader], [TransportOfficer], [TreatmentOfficer], [ReceivingHospital]) VALUES (3, 12, N'Mathew', CAST(N'1111-11-11' AS Date), N'', N'', N'', N'', N'')
INSERT [dbo].[Dispatch] ([DispatchID], [UserID], [Dispatcher], [DispatchDate], [Ambulance], [TeamLeader], [TransportOfficer], [TreatmentOfficer], [ReceivingHospital]) VALUES (4, 6, N'Mathew', CAST(N'1111-11-11' AS Date), N'', N'', N'', N'', N'')
INSERT [dbo].[Dispatch] ([DispatchID], [UserID], [Dispatcher], [DispatchDate], [Ambulance], [TeamLeader], [TransportOfficer], [TreatmentOfficer], [ReceivingHospital]) VALUES (5, 1038, N'Mathew', CAST(N'2005-11-02' AS Date), N'Charlie', N'Jane', N'Jenny', N'Jill', N'PGH')
INSERT [dbo].[Dispatch] ([DispatchID], [UserID], [Dispatcher], [DispatchDate], [Ambulance], [TeamLeader], [TransportOfficer], [TreatmentOfficer], [ReceivingHospital]) VALUES (6, 40, N'Mark', CAST(N'2015-04-12' AS Date), N'', N'', N'', N'', N'')
INSERT [dbo].[Dispatch] ([DispatchID], [UserID], [Dispatcher], [DispatchDate], [Ambulance], [TeamLeader], [TransportOfficer], [TreatmentOfficer], [ReceivingHospital]) VALUES (7, 2050, N'Lammle, Todd', CAST(N'2015-10-13' AS Date), N'Red', N'Reynolds, Michael', N'De La Cruz, Juan', N'Fox, Michael J', N'Cardinal Santos Medical Center')
INSERT [dbo].[Dispatch] ([DispatchID], [UserID], [Dispatcher], [DispatchDate], [Ambulance], [TeamLeader], [TransportOfficer], [TreatmentOfficer], [ReceivingHospital]) VALUES (8, 2056, N'asdasd', CAST(N'1999-03-12' AS Date), N'', N'', N'', N'', N'')
INSERT [dbo].[Dispatch] ([DispatchID], [UserID], [Dispatcher], [DispatchDate], [Ambulance], [TeamLeader], [TransportOfficer], [TreatmentOfficer], [ReceivingHospital]) VALUES (9, 2057, N'Lammle, Todd', CAST(N'2016-02-25' AS Date), N'Red', N'Santos, Mary Jane', N'De La Cruz, Juan', N'Temple, Juno', N'Makati Medical Center')
INSERT [dbo].[Dispatch] ([DispatchID], [UserID], [Dispatcher], [DispatchDate], [Ambulance], [TeamLeader], [TransportOfficer], [TreatmentOfficer], [ReceivingHospital]) VALUES (10, 2057, N'Lammle, Todd', CAST(N'2016-02-28' AS Date), N'Red', N'Santos, Mary Jane', N'Bay, John', N'Temple, Juno', N'Cardinal Santos Medical Center')
SET IDENTITY_INSERT [dbo].[Dispatch] OFF
SET IDENTITY_INSERT [dbo].[Exceptions] ON 

INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (3, N'User Management, Corporate Accounts ', N'Exception TypeSystem.Data.SqlClient.SqlException Exception MessageError converting data type nvarchar to numeric.', 12, CAST(N'2015-10-25 17:24:08.087' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (4, N'User Management, Corporate Accounts ', N'Exception Type: System.Data.SqlClient.SqlException Exception Message: Error converting data type nvarchar to numeric.', 12, CAST(N'2015-10-25 17:27:45.970' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (5, N'User Management, Add Corporate Accounts ', N'Exception Type: System.Data.SqlClient.SqlException Exception Message: Error converting data type nvarchar to numeric.', 12, CAST(N'2015-10-25 20:13:22.660' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (6, N'User Management, Corporate Payments ', N'Exception Type: System.Data.SqlClient.SqlException Exception Message: Error converting data type nvarchar to numeric.', 12, CAST(N'2015-10-26 00:36:01.063' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (7, N'User Management, Corporate Payments ', N'Exception Type: System.Data.SqlClient.SqlException Exception Message: Error converting data type nvarchar to numeric.', 12, CAST(N'2015-10-26 00:38:06.450' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (8, N'User Management, Corporate Payments ', N'Exception Type: System.Data.SqlClient.SqlException Exception Message: Error converting data type nvarchar to numeric.', 12, CAST(N'2015-10-26 00:45:28.727' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (9, N'User Management, Corporate Payments ', N'Exception Type: System.Data.SqlClient.SqlException Exception Message: Error converting data type nvarchar to numeric.', 12, CAST(N'2015-10-26 00:50:14.197' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (10, N'User Management, Corporate Payments ', N'Exception Type: System.Data.SqlClient.SqlException Exception Message: Error converting data type nvarchar to numeric.', 12, CAST(N'2015-10-26 02:49:27.703' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (11, N'User Management, Add Corporate Accounts ', N'Exception Type: System.Data.SqlClient.SqlException Exception Message: Error converting data type nvarchar to numeric.', 12, CAST(N'2015-10-26 07:33:20.067' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (12, N'User Management, Corporate Payments ', N'Exception Type: System.Data.SqlClient.SqlException Exception Message: Error converting data type nvarchar to numeric.', 12, CAST(N'2015-10-26 07:44:07.277' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (13, N'User Management, Corporate Payments ', N'Exception Type: System.Data.SqlClient.SqlException Exception Message: Error converting data type nvarchar to numeric.', 12, CAST(N'2015-10-26 07:49:58.127' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (14, N'User Management, Corporate Payments ', N'Exception Type: System.Data.SqlClient.SqlException Exception Message: Error converting data type nvarchar to numeric.', 12, CAST(N'2015-10-26 07:51:32.213' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (15, N'User Management, Corporate Payments ', N'Exception Type: System.Data.SqlClient.SqlException Exception Message: Error converting data type nvarchar to numeric.', 12, CAST(N'2015-10-26 07:53:12.737' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (16, N'Opportunity Tracking, Add Opportunity', N'Exception Type: System.Data.SqlClient.SqlExceptionException: System.Data.SqlClient.SqlException (0x80131904): Incorrect syntax near '')''.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at Admin_OpportunityTracking_AddOpportunity.btnAdd_OnClick(Object sender, EventArgs e) in d:\OneDrive\Lifeline\Admin\OpportunityTracking\AddOpportunity.aspx.cs:line 38
ClientConnectionId:14602156-2927-412f-ad76-39a5b4f1a7a6
Error Number:102,State:1,Class:15', 12, CAST(N'2015-10-28 06:43:31.567' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (17, N'Opportunity Tracking, Add Opportunity', N'Exception Type: System.Data.SqlClient.SqlExceptionException: System.Data.SqlClient.SqlException (0x80131904): Column name or number of supplied values does not match table definition.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at Admin_OpportunityTracking_AddOpportunity.btnAdd_OnClick(Object sender, EventArgs e) in d:\OneDrive\Lifeline\Admin\OpportunityTracking\AddOpportunity.aspx.cs:line 38
ClientConnectionId:14602156-2927-412f-ad76-39a5b4f1a7a6
Error Number:213,State:1,Class:16', 12, CAST(N'2015-10-28 06:44:10.107' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (18, N'Opportunity Tracking, Add Opportunity', N'Exception Type: System.Data.SqlClient.SqlExceptionException: System.Data.SqlClient.SqlException (0x80131904): Column name or number of supplied values does not match table definition.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at Admin_OpportunityTracking_AddOpportunity.btnAdd_OnClick(Object sender, EventArgs e) in d:\OneDrive\Lifeline\Admin\OpportunityTracking\AddOpportunity.aspx.cs:line 38
ClientConnectionId:30d467e6-6e05-4890-bb96-deede95d2bfe
Error Number:213,State:1,Class:16', 12, CAST(N'2015-10-28 06:45:21.183' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (19, N'Opportunity Tracking, Add Opportunity', N'Exception Type: System.Data.SqlClient.SqlExceptionException: System.Data.SqlClient.SqlException (0x80131904): Column name or number of supplied values does not match table definition.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at Admin_OpportunityTracking_AddOpportunity.btnAdd_OnClick(Object sender, EventArgs e) in d:\OneDrive\Lifeline\Admin\OpportunityTracking\AddOpportunity.aspx.cs:line 38
ClientConnectionId:30d467e6-6e05-4890-bb96-deede95d2bfe
Error Number:213,State:1,Class:16', 12, CAST(N'2015-10-28 06:46:42.923' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (20, N'Opportunity Tracking, Add Opportunity', N'Exception Type: System.Data.SqlClient.SqlExceptionException: System.Data.SqlClient.SqlException (0x80131904): Cannot insert the value NULL into column ''OpportunityID'', table ''dbLifeline.dbo.OpportunityTracking''; column does not allow nulls. INSERT fails.
The statement has been terminated.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at Admin_OpportunityTracking_AddOpportunity.btnAdd_OnClick(Object sender, EventArgs e) in d:\OneDrive\Lifeline\Admin\OpportunityTracking\AddOpportunity.aspx.cs:line 40
ClientConnectionId:14602156-2927-412f-ad76-39a5b4f1a7a6
Error Number:515,State:2,Class:16', 12, CAST(N'2015-10-28 06:48:10.390' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (21, N'Opportunity Tracking, Add Opportunity', N'Exception Type: System.Data.SqlClient.SqlExceptionException: System.Data.SqlClient.SqlException (0x80131904): The parameterized query ''(@ClientName nvarchar(11),@AccountName nvarchar(4),@Rating nvarc'' expects the parameter ''@CloseDate'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at Admin_OpportunityTracking_AddOpportunity.btnAdd_OnClick(Object sender, EventArgs e) in d:\OneDrive\Lifeline\Admin\OpportunityTracking\AddOpportunity.aspx.cs:line 40
ClientConnectionId:ff56a184-5331-4922-8418-7ead1177f7ec
Error Number:8178,State:1,Class:16', 12, CAST(N'2015-10-28 06:57:36.890' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (22, N'Opportunity Tracking, Add Opportunity', N'Exception Type: System.Data.SqlClient.SqlExceptionException: System.Data.SqlClient.SqlException (0x80131904): The parameterized query ''(@ClientName nvarchar(11),@AccountName nvarchar(4),@Rating nvarc'' expects the parameter ''@CloseDate'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds, Boolean describeParameterEncryptionRequest)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at Admin_OpportunityTracking_AddOpportunity.btnAdd_OnClick(Object sender, EventArgs e) in d:\OneDrive\Lifeline\Admin\OpportunityTracking\AddOpportunity.aspx.cs:line 40
ClientConnectionId:ff56a184-5331-4922-8418-7ead1177f7ec
Error Number:8178,State:1,Class:16', 12, CAST(N'2015-10-28 06:57:46.823' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (23, N'Client Forms, Client Verification Form', N'Exception Type: System.Data.SqlClient.SqlException Exception Message: Cannot insert the value NULL into column ''ScanID'', table ''dbLifeline.dbo.Verification''; column does not allow nulls. INSERT fails.
The statement has been terminated.', 40, CAST(N'2016-01-29 06:48:08.447' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (24, N'Client Forms, Client Verification Form', N'Exception Type: System.Data.SqlClient.SqlException Exception Message: Cannot insert the value NULL into column ''ScanID'', table ''dbLifeline.dbo.Verification''; column does not allow nulls. INSERT fails.
The statement has been terminated.', 40, CAST(N'2016-01-29 06:49:04.550' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (25, N'Membership Application, Client Forms ', N'Exception Type: System.Data.SqlClient.SqlException Exception Message: Column name or number of supplied values does not match table definition.', 2051, CAST(N'2016-02-11 13:50:13.360' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (26, N'Membership Application, Void Application', N'Exception Type: System.Data.SqlClient.SqlException Exception Message: Must declare the scalar variable "@ApplicationID".', 40, CAST(N'2016-02-12 01:14:24.170' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (27, N'Membership Application, Void Application', N'Exception Type: System.Data.SqlClient.SqlException Exception Message: Column name or number of supplied values does not match table definition.', 40, CAST(N'2016-02-12 01:15:14.527' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (28, N'Membership Application, Send Mail ', N'Exception Type: System.Net.Mail.SmtpException Exception Message: Failure sending mail.', 1044, CAST(N'2016-03-11 21:57:37.913' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (29, N'Membership Application, Send Mail ', N'Exception Type: System.Net.Mail.SmtpException Exception Message: Failure sending mail.', 1044, CAST(N'2016-03-11 21:59:41.333' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (30, N'Membership Renewal, Send Mail ', N'Exception Type: System.Net.Mail.SmtpException Exception Message: Failure sending mail.', 1044, CAST(N'2016-03-11 22:20:57.760' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (31, N'Membership Application, Send Mail ', N'Exception Type: System.Net.Mail.SmtpException Exception Message: Failure sending mail.', 1041, CAST(N'2016-03-11 22:26:27.803' AS DateTime))
INSERT [dbo].[Exceptions] ([ExceptionID], [Page], [Description], [UserID], [Timestamp]) VALUES (32, N'Membership Application - Payment', N'System.FormatException: The specified string is not in the form required for an e-mail address.
   at System.Net.Mail.MailAddressParser.ReadCfwsAndThrowIfIncomplete(String data, Int32 index)
   at System.Net.Mail.MailAddressParser.ParseDomain(String data, Int32& index)
   at System.Net.Mail.MailAddressParser.ParseAddress(String data, Boolean expectMultipleAddresses, Int32& index)
   at System.Net.Mail.MailAddressParser.ParseMultipleAddresses(String data)
   at System.Net.Mail.MailAddressCollection.ParseValue(String addresses)
   at System.Net.Mail.MailAddressCollection.Add(String addresses)
   at Helper.DepositConfirmation(String recipient, String body) in c:\Users\steve\Documents\Repo\Lifeline-CRM\App_Code\Helper.cs:line 155
   at Account_ClientForms_MembershipApplicationTwo.btnSubmit_Click(Object sender, EventArgs e) in c:\Users\steve\Documents\Repo\Lifeline-CRM\Account\ClientForms\MembershipApplicationTwo.aspx.cs:line 203', 1041, CAST(N'2016-03-11 22:26:39.057' AS DateTime))
SET IDENTITY_INSERT [dbo].[Exceptions] OFF
SET IDENTITY_INSERT [dbo].[Hospitals] ON 

INSERT [dbo].[Hospitals] ([HospitalID], [HospitalName], [Address], [Municipality], [City], [DateAdded], [DateModified]) VALUES (1, N'Makati Medical Center', N'Amorsolo St, Legazpi Village', N'', N'Makati City', CAST(N'2016-02-25' AS Date), CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Hospitals] ([HospitalID], [HospitalName], [Address], [Municipality], [City], [DateAdded], [DateModified]) VALUES (2, N'Baesa Advent Polytechnic', N'238 Deparo St., Baesa', N'', N'Caloocan City', CAST(N'2016-02-25' AS Date), CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Hospitals] ([HospitalID], [HospitalName], [Address], [Municipality], [City], [DateAdded], [DateModified]) VALUES (3, N'Cardinal Santos Medical Center', N'Wilson St. Greenhills West', N'', N'San Juan City', CAST(N'2016-02-25' AS Date), CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Hospitals] ([HospitalID], [HospitalName], [Address], [Municipality], [City], [DateAdded], [DateModified]) VALUES (4, N'St. Luke''s Medical Center', N'279 E. Rodriguez Sr., Blvd.', N'', N'Quezon City', CAST(N'2016-02-25' AS Date), CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Hospitals] ([HospitalID], [HospitalName], [Address], [Municipality], [City], [DateAdded], [DateModified]) VALUES (5, N'The Medical City', N'Ortigas Ave', N'', N'Pasig City', CAST(N'2016-02-25' AS Date), CAST(N'2016-02-25' AS Date))
SET IDENTITY_INSERT [dbo].[Hospitals] OFF
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (57, 41, N'Membership Renewal', N'Deposit slip submission', CAST(N'2015-10-20' AS Date), N'56')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (59, 41, N'Membership Renewal', N'Deposit slip submission', CAST(N'2015-10-20' AS Date), N'39')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (60, 40, N'Membership Renewal', N'', CAST(N'2015-10-20' AS Date), N'57')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (62, 40, N'Feedback', N'Satisfaction Rating', CAST(N'2015-10-20' AS Date), N'32')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (63, 40, N'Feedback', N'Survey', CAST(N'2015-10-20' AS Date), N'3')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (64, 40, N'Feedback', N'Inquiry/Issue', CAST(N'2015-10-20' AS Date), N'33')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (70, 40, N'Membership Renewal', N'New Submission', CAST(N'2015-10-20' AS Date), N'59')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (71, 40, N'Membership Renewal', N'Deposit slip submission', CAST(N'2015-10-20' AS Date), N'59')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (73, 1050, N'Feedback', N'Satisfaction Rating', CAST(N'2015-10-22' AS Date), N'36')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (74, 1050, N'Feedback', N'Survey', CAST(N'2015-10-22' AS Date), N'4')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (75, 1050, N'Feedback', N'Inquiry/Issue', CAST(N'2015-10-22' AS Date), N'37')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (76, 40, N'Membership Renewal', N'Void Membership', CAST(N'2015-10-22' AS Date), N'1')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (1073, 36, N'Feedback', N'Satisfaction Rating', CAST(N'2015-10-22' AS Date), N'1036')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (1074, 40, N'Membership Renewal', N'New Submission', CAST(N'2015-10-22' AS Date), N'60')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (1075, 40, N'Membership Renewal', N'Deposit slip submission', CAST(N'2015-10-22' AS Date), N'60')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (1076, 1050, N'Membership Renewal', N'New Submission', CAST(N'2015-10-23' AS Date), N'61')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (1077, 1050, N'Membership Renewal', N'Deposit slip submission', CAST(N'2015-10-23' AS Date), N'61')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (1078, 1050, N'Feedback', N'Survey', CAST(N'2015-10-23' AS Date), N'1004')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (1079, 1050, N'Feedback', N'Inquiry/Issue', CAST(N'2015-10-23' AS Date), N'1037')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2073, 12, N'Feedback', N'Satisfaction Rating', CAST(N'2015-10-23' AS Date), N'2036')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2074, 12, N'Membership Renewal', N'New Submission', CAST(N'2015-10-23' AS Date), N'1060')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2075, 12, N'Membership Renewal', N'Deposit slip submission', CAST(N'2015-10-23' AS Date), N'1060')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2076, 6, N'Membership Renewal', N'New Submission', CAST(N'2015-10-23' AS Date), N'1061')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2077, 12, N'Membership Renewal', N'New Submission', CAST(N'2015-10-24' AS Date), N'1062')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2078, 12, N'Feedback', N'Satisfaction Rating', CAST(N'2015-10-25' AS Date), N'2037')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2079, 12, N'Feedback', N'Survey', CAST(N'2015-10-25' AS Date), N'2004')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2080, 12, N'Feedback', N'Inquiry/Issue', CAST(N'2015-10-25' AS Date), N'2038')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2081, 12, N'Membership Renewal', N'Deposit slip submission', CAST(N'2015-10-25' AS Date), N'1062')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2082, 12, N'Membership Renewal', N'Deposit slip submission', CAST(N'2015-10-25' AS Date), N'1062')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2083, 12, N'Membership Renewal', N'Deposit slip submission', CAST(N'2015-10-25' AS Date), N'1062')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2084, 12, N'Membership Renewal', N'New Submission', CAST(N'2015-10-25' AS Date), N'1063')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2085, 12, N'Feedback', N'Satisfaction Rating', CAST(N'2015-10-25' AS Date), N'2039')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2086, 12, N'Membership Renewal', N'New Submission', CAST(N'2015-10-26' AS Date), N'1064')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2087, 12, N'Feedback', N'Satisfaction Rating', CAST(N'2015-10-27' AS Date), N'2040')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2088, 6, N'Membership Renewal', N'New Submission', CAST(N'2015-10-28' AS Date), N'1065')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2089, 12, N'Membership Renewal', N'New Submission', CAST(N'2015-10-29' AS Date), N'1066')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2090, 12, N'Feedback', N'Satisfaction Rating', CAST(N'2015-10-29' AS Date), N'2041')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (2091, 12, N'Feedback', N'Inquiry/Issue', CAST(N'2015-10-29' AS Date), N'2042')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (3089, 12, N'Membership Renewal', N'Deposit slip submission', CAST(N'2015-10-29' AS Date), N'1066')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (4089, 1038, N'Membership Renewal', N'New Submission', CAST(N'2015-10-29' AS Date), N'2066')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (4090, 40, N'Client Forms', N'Client Verification', CAST(N'2016-01-29' AS Date), N'2')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (4091, 2051, N'Client Forms', N'Client Verification', CAST(N'2016-01-29' AS Date), N'3')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (4092, 2051, N'Membership Application', N'New Submission', CAST(N'2016-02-11' AS Date), N'1')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (4093, 2049, N'Membership Application', N'New Submission', CAST(N'2016-02-11' AS Date), N'2')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5092, 40, N'Membership Application', N'Void Membership', CAST(N'2016-02-12' AS Date), N'1')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5093, 2051, N'Membership Application', N'Deposit slip submission', CAST(N'2016-02-12' AS Date), N'1')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5094, 40, N'Membership Application', N'Void Membership', CAST(N'2016-02-12' AS Date), N'2')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5095, 2051, N'Client Forms', N'Client Verification', CAST(N'2016-02-18' AS Date), N'4')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5096, 9, N'Membership Application', N'New Submission', CAST(N'2016-02-18' AS Date), N'3')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5097, 1046, N'Client Forms', N'Client Verification', CAST(N'2016-02-20' AS Date), N'5')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5098, 2050, N'Membership Renewal', N'New Submission', CAST(N'2016-02-20' AS Date), N'2067')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5099, 2052, N'Feedback', N'Satisfaction Rating', CAST(N'2016-02-20' AS Date), N'2043')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5100, 2051, N'Membership Application', N'Deposit slip submission', CAST(N'2016-02-28' AS Date), N'1')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5101, 2051, N'Membership Application', N'Deposit slip submission', CAST(N'2016-02-28' AS Date), N'1')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5102, 2051, N'Membership Application', N'Deposit slip submission', CAST(N'2016-02-28' AS Date), N'1')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5103, 2051, N'Membership Application', N'Deposit slip submission', CAST(N'2016-02-28' AS Date), N'1')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5104, 2051, N'Membership Application', N'Deposit slip submission', CAST(N'2016-02-28' AS Date), N'1')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5105, 2051, N'Membership Application', N'Deposit slip submission', CAST(N'2016-02-28' AS Date), N'1')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5106, 2057, N'Client Forms', N'Client Verification', CAST(N'2016-02-28' AS Date), N'6')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5107, 2057, N'Membership Renewal', N'New Submission', CAST(N'2016-02-28' AS Date), N'2068')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5108, 40, N'Membership Renewal', N'New Submission', CAST(N'2016-02-28' AS Date), N'2069')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5109, 2057, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-05' AS Date), N'2044')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5124, 2057, N'Feedback', N'Inquiry/Issue', CAST(N'2016-03-06' AS Date), N'2059')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5125, 2052, N'Membership Application', N'New Submission', CAST(N'2016-03-06' AS Date), N'4')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5126, 2052, N'Membership Application', N'Deposit slip submission', CAST(N'2016-03-06' AS Date), N'4')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5127, 2052, N'Client Forms', N'Client Verification', CAST(N'2016-03-06' AS Date), N'7')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5128, 2052, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-06' AS Date), N'2060')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5129, 2052, N'Feedback', N'Inquiry/Issue', CAST(N'2016-03-06' AS Date), N'2061')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5130, 2052, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-06' AS Date), N'2062')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5131, 2052, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-06' AS Date), N'2063')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5132, 2052, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-06' AS Date), N'2064')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5133, 2052, N'Feedback', N'Inquiry/Issue', CAST(N'2016-03-06' AS Date), N'2065')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5134, 2052, N'Feedback', N'Survey', CAST(N'2016-03-06' AS Date), N'2005')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5135, 2052, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-06' AS Date), N'2066')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5136, 2052, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-06' AS Date), N'2067')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5137, 2052, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-06' AS Date), N'2068')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5138, 2052, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-06' AS Date), N'2069')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5139, 2052, N'Feedback', N'Inquiry/Issue', CAST(N'2016-03-06' AS Date), N'2070')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5143, 1039, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-06' AS Date), N'2080')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5144, 1039, N'Feedback', N'Inquiry/Issue', CAST(N'2016-03-06' AS Date), N'2081')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5145, 1039, N'Membership Application', N'New Submission', CAST(N'2016-03-06' AS Date), N'5')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5148, 9, N'Membership Application', N'Deposit slip submission', CAST(N'2016-03-06' AS Date), N'3')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5149, 35, N'Client Forms', N'Client Verification', CAST(N'2016-03-06' AS Date), N'16')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5150, 35, N'Membership Application', N'New Submission', CAST(N'2016-03-06' AS Date), N'6')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5151, 35, N'Membership Application', N'Deposit slip submission', CAST(N'2016-03-06' AS Date), N'6')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5152, 35, N'Membership Application', N'Deposit slip submission', CAST(N'2016-03-06' AS Date), N'6')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5153, 35, N'Membership Application', N'Deposit slip submission', CAST(N'2016-03-06' AS Date), N'6')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5154, 35, N'Membership Application', N'Deposit slip submission', CAST(N'2016-03-06' AS Date), N'6')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5155, 35, N'Membership Application', N'Deposit slip submission', CAST(N'2016-03-06' AS Date), N'6')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5156, 35, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-06' AS Date), N'2082')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5157, 1046, N'Feedback', N'Inquiry/Issue', CAST(N'2016-03-06' AS Date), N'2083')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5158, 1046, N'Membership Renewal', N'Deposit slip submission', CAST(N'2016-03-06' AS Date), N'54')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5159, 1046, N'Membership Renewal', N'New Submission', CAST(N'2016-03-06' AS Date), N'2070')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5160, 35, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-11' AS Date), N'2084')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5161, 35, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-11' AS Date), N'2085')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5162, 35, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-11' AS Date), N'2086')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5163, 35, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-11' AS Date), N'2087')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5164, 35, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-11' AS Date), N'2088')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5165, 35, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-11' AS Date), N'2089')
GO
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5166, 35, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-11' AS Date), N'2090')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5167, 35, N'Feedback', N'Satisfaction Rating', CAST(N'2016-03-11' AS Date), N'2091')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5168, 35, N'Feedback', N'Survey', CAST(N'2016-03-11' AS Date), N'2006')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5169, 35, N'Feedback', N'Inquiry/Issue', CAST(N'2016-03-11' AS Date), N'2092')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5170, 35, N'Feedback', N'Inquiry/Issue', CAST(N'2016-03-11' AS Date), N'2093')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5171, 35, N'Feedback', N'Inquiry/Issue', CAST(N'2016-03-11' AS Date), N'2094')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5172, 35, N'Feedback', N'Inquiry/Issue', CAST(N'2016-03-11' AS Date), N'2094')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5173, 1044, N'Client Forms', N'Client Verification', CAST(N'2016-03-11' AS Date), N'17')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5174, 1044, N'Client Forms', N'Client Verification', CAST(N'2016-03-11' AS Date), N'18')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5175, 1044, N'Membership Application', N'New Submission', CAST(N'2016-03-11' AS Date), N'7')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5176, 1044, N'Membership Application', N'New Submission', CAST(N'2016-03-11' AS Date), N'8')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5177, 1044, N'Membership Renewal', N'New Submission', CAST(N'2016-03-11' AS Date), N'2071')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5178, 1041, N'Membership Application', N'New Submission', CAST(N'2016-03-11' AS Date), N'9')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5179, 1041, N'Membership Application', N'Deposit slip submission', CAST(N'2016-03-11' AS Date), N'9')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5180, 1041, N'Membership Renewal', N'New Submission', CAST(N'2016-03-13' AS Date), N'2072')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5181, 1041, N'Membership Renewal', N'Deposit slip submission', CAST(N'2016-03-13' AS Date), N'2072')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5182, 2058, N'Client Forms', N'Client Verification', CAST(N'2016-03-13' AS Date), N'19')
INSERT [dbo].[Logs] ([LogsID], [UserID], [LogType], [Description], [Timestamp], [Specifics]) VALUES (5183, 2059, N'Client Forms', N'Client Verification', CAST(N'2016-04-01' AS Date), N'20')
SET IDENTITY_INSERT [dbo].[Logs] OFF
SET IDENTITY_INSERT [dbo].[MedicalHistory] ON 

INSERT [dbo].[MedicalHistory] ([MedHistoryID], [UserID], [DispatchID], [Operation], [Details], [StartDate], [EndDate]) VALUES (1, 12, 1, N'Confinement', N'Fever', CAST(N'2001-01-01' AS Date), CAST(N'2001-01-02' AS Date))
INSERT [dbo].[MedicalHistory] ([MedHistoryID], [UserID], [DispatchID], [Operation], [Details], [StartDate], [EndDate]) VALUES (2, 12, 2, N'Surgery', N'Head', CAST(N'2002-02-02' AS Date), CAST(N'2002-03-03' AS Date))
INSERT [dbo].[MedicalHistory] ([MedHistoryID], [UserID], [DispatchID], [Operation], [Details], [StartDate], [EndDate]) VALUES (6, 12, 3, N'General Checkup', N'Fine', CAST(N'1111-11-11' AS Date), CAST(N'1111-11-11' AS Date))
INSERT [dbo].[MedicalHistory] ([MedHistoryID], [UserID], [DispatchID], [Operation], [Details], [StartDate], [EndDate]) VALUES (7, 6, 4, N'General Checkup', N'Fine', CAST(N'1111-11-11' AS Date), CAST(N'1111-11-11' AS Date))
INSERT [dbo].[MedicalHistory] ([MedHistoryID], [UserID], [DispatchID], [Operation], [Details], [StartDate], [EndDate]) VALUES (8, 1038, 5, N'General Checkup', N'Ok', CAST(N'2005-11-01' AS Date), CAST(N'2005-11-01' AS Date))
INSERT [dbo].[MedicalHistory] ([MedHistoryID], [UserID], [DispatchID], [Operation], [Details], [StartDate], [EndDate]) VALUES (9, 40, 6, N'Check up', N'Cleared', CAST(N'2015-04-12' AS Date), CAST(N'2015-04-12' AS Date))
INSERT [dbo].[MedicalHistory] ([MedHistoryID], [UserID], [DispatchID], [Operation], [Details], [StartDate], [EndDate]) VALUES (10, 2050, 7, N'Check up', N'Fine', CAST(N'2015-10-01' AS Date), CAST(N'2015-10-28' AS Date))
INSERT [dbo].[MedicalHistory] ([MedHistoryID], [UserID], [DispatchID], [Operation], [Details], [StartDate], [EndDate]) VALUES (11, 2056, 8, N'qwe', N'asdasd', CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date))
INSERT [dbo].[MedicalHistory] ([MedHistoryID], [UserID], [DispatchID], [Operation], [Details], [StartDate], [EndDate]) VALUES (12, 2057, 9, N'Check up', N'Fibe', CAST(N'2016-02-25' AS Date), CAST(N'2016-02-27' AS Date))
INSERT [dbo].[MedicalHistory] ([MedHistoryID], [UserID], [DispatchID], [Operation], [Details], [StartDate], [EndDate]) VALUES (13, 2057, 10, N'Injury', N'Pending', CAST(N'2016-02-28' AS Date), CAST(N'2016-03-03' AS Date))
SET IDENTITY_INSERT [dbo].[MedicalHistory] OFF
SET IDENTITY_INSERT [dbo].[MedicalInfo] ON 

INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (1, 12, N'B', N'', N'None', N'Yes', N'Yes', N'None', N'None', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (4, 40, N'A', N'', N'None', N'None', N'None', N'None', N'None', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (5, 6, N'A', N'', N'None', N'Yes', N'None', N'Yes', N'Yes', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (6, 7, N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (7, 9, N'B', N'', N'None', N'None', N'None', N'None', N'Yes', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (8, 10, N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (9, 11, N'A', N'', N'Yes', N'None', N'Yes', N'None', N'None', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (11, 13, N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (12, 14, N'B', N'', N'None', N'None', N'Yes', N'Yes', N'None', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (13, 15, N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (14, 17, N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (15, 35, N'A', N'', N'None', N'None', N'Yes', N'None', N'Yes', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (16, 36, N'AB', N'', N'Yes', N'None', N'Yes', N'Yes', N'None', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (17, 41, N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (1002, 1038, N'B', N'', N'Yes', N'None', N'Yes', N'None', N'Yes', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (1003, 1039, N'A', N'', N'Yes', N'None', N'Yes', N'None', N'Yes', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (1004, 1040, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (1005, 1041, N'A', N'', N'None', N'Yes', N'Yes', N'None', N'None', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (1006, 1042, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (1008, 1044, N'A', N'', N'None', N'Yes', N'None', N'None', N'None', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (1010, 1046, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (1012, 1048, N'A', N'', N'None', N'Yes', N'None', N'Yes', N'Yes', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (1014, 1050, N'B', N'', N'None', N'Yes', N'Yes', N'None', N'None', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (2013, 2049, N'A', N'Egg', N'None', N'None', N'None', N'None', N'Yes', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (2014, 2050, N'A', N'', N'None', N'None', N'Yes', N'Yes', N'None', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (2015, 2051, N'A', N'Chicken', N'None', N'Yes', N'None', N'Yes', N'Yes', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (2016, 2052, N'A', N'', N'Yes', N'None', N'None', N'Yes', N'None', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (2017, 2053, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (2018, 2056, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (2019, 2057, N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (2020, 2058, N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[MedicalInfo] ([MedicalInfoID], [UserID], [BloodType], [Allergies], [CancerHis], [HeartHis], [AsthmaHis], [EpilepsyHis], [LiverHis], [Others]) VALUES (2021, 2059, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[MedicalInfo] OFF
SET IDENTITY_INSERT [dbo].[Memberships] ON 

INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (19, 40, CAST(N'2016-01-11' AS Date), CAST(N'2019-10-15' AS Date), 4, N'Inactive', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (20, 40, CAST(N'2016-01-12' AS Date), CAST(N'2016-10-15' AS Date), 1, N'Active', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (21, 40, CAST(N'2016-01-13' AS Date), CAST(N'2017-10-16' AS Date), 2, N'Inactive', N'Household')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (22, 40, CAST(N'2016-01-14' AS Date), CAST(N'2016-10-16' AS Date), 1, N'Inactive', N'Household')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (23, 40, CAST(N'2016-01-15' AS Date), CAST(N'2017-10-16' AS Date), 2, N'Inactive', N'Household')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (24, 40, CAST(N'2016-01-16' AS Date), CAST(N'2018-10-16' AS Date), 3, N'Inactive', N'Household')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (25, 40, CAST(N'2016-01-17' AS Date), CAST(N'2016-10-16' AS Date), 1, N'Inactive', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (26, 12, CAST(N'2016-01-18' AS Date), CAST(N'2016-10-16' AS Date), 1, N'Inactive', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (28, 12, CAST(N'2016-01-18' AS Date), CAST(N'2016-10-17' AS Date), 1, N'Inactive', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (33, 12, CAST(N'2016-01-18' AS Date), CAST(N'2025-10-17' AS Date), 10, N'Inactive', N'Household')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (34, 12, CAST(N'2016-01-19' AS Date), CAST(N'2017-10-17' AS Date), 2, N'Inactive', N'Household')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (35, 12, CAST(N'2016-01-19' AS Date), CAST(N'2016-10-17' AS Date), 1, N'Inactive', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (36, 12, CAST(N'2016-01-19' AS Date), CAST(N'2017-10-17' AS Date), 2, N'Inactive', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (37, 12, CAST(N'2016-01-20' AS Date), CAST(N'2024-10-17' AS Date), 9, N'Inactive', N'Household')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (38, 12, CAST(N'2016-01-20' AS Date), CAST(N'2018-10-17' AS Date), 3, N'Active', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (39, 12, CAST(N'2016-01-20' AS Date), CAST(N'2016-10-17' AS Date), 1, N'Active', N'Household')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (40, 40, CAST(N'2016-02-10' AS Date), CAST(N'2019-10-17' AS Date), 4, N'Inactive', N'Household')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (41, 12, CAST(N'2016-02-10' AS Date), CAST(N'2020-10-17' AS Date), 5, N'Active', N'Household')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (42, 12, CAST(N'2016-02-10' AS Date), CAST(N'2016-10-17' AS Date), 1, N'Inactive', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (43, 36, CAST(N'2016-02-10' AS Date), CAST(N'2017-10-17' AS Date), 2, N'Inactive', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (44, 36, CAST(N'2016-02-10' AS Date), CAST(N'2018-10-17' AS Date), 3, N'Active', N'Household')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (45, 40, CAST(N'2016-02-11' AS Date), CAST(N'2017-10-17' AS Date), 2, N'Active', N'Household')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (46, 40, CAST(N'2016-02-15' AS Date), CAST(N'2016-10-18' AS Date), 1, N'Active', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (49, 40, CAST(N'2016-02-15' AS Date), CAST(N'2018-10-19' AS Date), 3, N'Inactive', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (50, 1046, CAST(N'2016-02-15' AS Date), CAST(N'2018-10-19' AS Date), 3, N'Inactive', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (51, 1046, CAST(N'2016-01-20' AS Date), CAST(N'2017-10-19' AS Date), 2, N'Inactive', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (53, 1046, CAST(N'2016-01-20' AS Date), CAST(N'2017-10-19' AS Date), 2, N'Inactive', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (54, 1046, CAST(N'2016-01-20' AS Date), CAST(N'2022-10-19' AS Date), 7, N'Active', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (55, 1038, CAST(N'2016-01-14' AS Date), CAST(N'2018-10-20' AS Date), 3, N'Inactive', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (56, 1038, CAST(N'2016-01-14' AS Date), CAST(N'2022-10-20' AS Date), 7, N'Active', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (59, 40, CAST(N'2016-01-14' AS Date), CAST(N'2019-10-20' AS Date), 4, N'Voided', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (60, 40, CAST(N'2016-01-20' AS Date), CAST(N'2025-10-22' AS Date), 10, N'Active', N'Household')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (61, 1050, CAST(N'2016-01-20' AS Date), CAST(N'2018-10-23' AS Date), 3, N'Active', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (1060, 12, CAST(N'2016-01-20' AS Date), CAST(N'2016-10-23' AS Date), 1, N'Inactive', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (1061, 6, CAST(N'2016-01-20' AS Date), CAST(N'2017-10-23' AS Date), 2, N'Active', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (1062, 12, CAST(N'2016-02-05' AS Date), CAST(N'2019-10-24' AS Date), 4, N'Active', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (1063, 12, CAST(N'2016-02-10' AS Date), CAST(N'2017-10-25' AS Date), 2, N'Active', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (1064, 12, CAST(N'2016-02-10' AS Date), CAST(N'2017-10-26' AS Date), 2, N'Active', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (1065, 6, CAST(N'2016-02-15' AS Date), CAST(N'2017-10-28' AS Date), 2, N'Inactive', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (1066, 12, CAST(N'2016-02-15' AS Date), CAST(N'2017-10-29' AS Date), 2, N'Active', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (2066, 1038, CAST(N'2016-02-20' AS Date), CAST(N'2016-10-29' AS Date), 1, N'Inactive', N'Household')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (2067, 2050, CAST(N'2016-02-20' AS Date), CAST(N'2021-02-20' AS Date), 5, N'Active', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (2068, 2057, CAST(N'2016-02-28' AS Date), CAST(N'2017-02-28' AS Date), 1, N'Active', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (2069, 40, CAST(N'2016-02-28' AS Date), CAST(N'2017-02-28' AS Date), 1, N'Active', N'Individual')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (2070, 1046, CAST(N'2016-03-06' AS Date), CAST(N'2017-03-06' AS Date), 1, N'Inactive', N'Household')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (2071, 1044, CAST(N'2016-03-11' AS Date), CAST(N'2018-03-11' AS Date), 2, N'Inactive', N'Household')
INSERT [dbo].[Memberships] ([MembershipID], [UserID], [StartDate], [EndDate], [Length], [MembershipStatus], [Type]) VALUES (2072, 1041, CAST(N'2016-03-13' AS Date), CAST(N'2019-03-13' AS Date), 3, N'Active', N'Individual')
SET IDENTITY_INSERT [dbo].[Memberships] OFF
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (1, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2015-10-03 00:11:43.620' AS DateTime), N'Very Gooood!', 12, N'steven.tomas01@gmail.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2015-10-03 00:13:48.827' AS DateTime), N'Very Gooood!', 12, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (3, N'Feedback', N'User Interface', N'', CAST(N'2015-10-03 00:36:48.220' AS DateTime), N'', 12, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (4, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2015-10-03 01:29:41.777' AS DateTime), N'', 12, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (6, N'Issues/Inquiries', N'Incorrect records', N'Login page', CAST(N'2015-10-03 13:14:07.543' AS DateTime), N'cant log in!!', 12, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (7, N'Issues/Inquiries', N'Website functionality problems', N'Register', CAST(N'2015-10-03 16:51:34.680' AS DateTime), N'not werking', 12, N'steventwo@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (8, N'Issues/Inquiries', N'Incorrect records', N'Register', CAST(N'2015-10-03 16:52:12.387' AS DateTime), N'Not werking', 12, N'steven.tomas01@gmail.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (9, N'Feedback', N'Website functionality', N' Very Good ', CAST(N'2015-10-03 16:55:52.850' AS DateTime), N'Yada', 12, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (10, N'Issues/Inquiries', N'User Interface problems', N'Dashboard', CAST(N'2015-10-03 20:01:20.230' AS DateTime), N'the information there is inaccurate!', 12, N'steven1@gmail.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (11, N'Issues/Inquiries', N'Account/Membership Issues', N'Account discrepancy', CAST(N'2015-10-03 20:04:15.367' AS DateTime), N'I already paid the recent membership renewal but it doesnt not yet reflect in my dashboard.', 12, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (12, N'Issues/Inquiries', N'Client Account Request', N'Request for client account', CAST(N'2015-10-05 13:10:15.253' AS DateTime), N'Robert Steven Tomas
steven.tomas01@gmail.com', 12, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (13, N'Issues/Inquiries', N'Client Account Request', N'Request for client account', CAST(N'2015-10-05 13:12:44.127' AS DateTime), N'Robert Steven Tomas
steven.tomas01@gmail.com', 12, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (14, N'Issues/Inquiries', N'Client Account Request', N'Request for client account', CAST(N'2015-10-05 15:33:32.793' AS DateTime), N'Part 2', 12, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (19, N'Frontpage', N'Message', N'Careers', CAST(N'2015-10-12 01:23:54.243' AS DateTime), N'Where can i see available jobs? Thanks', 12, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (20, N'Feedback', N'Website functionality', N' Bad ', CAST(N'2015-10-18 18:22:48.610' AS DateTime), N'<p>
	<strong>Something is not right!!</strong></p>
', 40, N'steven.tomas01@gmail.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (21, N'Issues/Inquiries', N'Account/Membership Issues', N'Renewal cancellation', CAST(N'2015-10-18 20:43:29.673' AS DateTime), N'<p>
	<span style="font-size:16px;"><span style="font-family:tahoma,geneva,sans-serif;">Please remove my recent renewal, it was a mistake.&nbsp;<img alt="smiley" height="20" src="http://localhost:6202/ckeditor/plugins/smiley/images/regular_smile.gif" title="smiley" width="20" /></span></span></p>
<p>
	<span style="font-size:16px;"><span style="font-family:tahoma,geneva,sans-serif;">Thanks,</span></span></p>
<p>
	<span style="font-size:16px;"><span style="font-family:tahoma,geneva,sans-serif;">Steven</span></span></p>
', 40, N'steven.tomas01@gmail.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (22, N'Feedback', N'User Interface', N' Good ', CAST(N'2015-10-19 18:04:02.163' AS DateTime), N'<p>
	Test</p>
', 40, N'steven.tomas01@gmail.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (23, N'Feedback', N'Service/Dispatch Quality', N' Very Good ', CAST(N'2015-10-19 19:08:28.293' AS DateTime), N'<p>
	Tester</p>
', 1041, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (24, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2015-10-19 19:23:03.390' AS DateTime), N'<p>
	Tessssssssssst</p>
', 1041, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (25, N'Feedback', N'User Interface', N' Bad ', CAST(N'2015-10-19 19:41:00.643' AS DateTime), N'<p>
	Testerrrrr</p>
', 1042, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (26, N'Feedback', N'User Interface', N' Bad ', CAST(N'2015-10-19 19:42:00.580' AS DateTime), N'<p>
	Testerrrrr</p>
', 1042, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (27, N'Feedback', N'User Interface', N' Bad ', CAST(N'2015-10-19 19:42:19.977' AS DateTime), N'<p>
	Testerrrrr</p>
', 1042, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (28, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2015-10-19 19:45:36.750' AS DateTime), N'<p>
	TY</p>
', 1042, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (29, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2015-10-19 19:47:21.147' AS DateTime), N'<p>
	TY</p>
', 1042, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (30, N'Feedback', N'User Interface', N' Very Good ', CAST(N'2015-10-19 19:53:45.333' AS DateTime), N'<p>
	Again</p>
', 1042, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (31, N'Feedback', N'Service/Dispatch Quality', N' Very Good ', CAST(N'2015-10-20 00:04:08.473' AS DateTime), N'<p>
	Try message</p>
', 41, N'john.wayne@email.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (32, N'Feedback', N'Customer Care Representative', N' Very Good ', CAST(N'2015-10-20 20:00:20.400' AS DateTime), N'<p>
	Very good CS!&nbsp;</p>
', 40, N'steven.tomas01@gmail.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (33, N'Issues/Inquiries', N'Error Pages', N'Renewals Error404', CAST(N'2015-10-20 20:48:50.747' AS DateTime), N'<p>
	Cant renew my transaction</p>
', 40, N'steven.tomas01@gmail.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (35, N'Feedback', N'User Interface', N' Very Good ', CAST(N'2015-10-21 00:18:54.100' AS DateTime), N'<p>
	Great</p>
', 40, N'steven.tomas01@gmail.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (36, N'Feedback', N'Website functionality', N' Very Good ', CAST(N'2015-10-22 02:50:08.937' AS DateTime), N'<p>
	Excellent!</p>
', 1050, N'steven.tomas01@gmail.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (37, N'Issues/Inquiries', N'Incorrect records', N'Medical Info', CAST(N'2015-10-22 02:51:53.833' AS DateTime), N'<p>
	The info displaying is inaccurate, please change thanks!</p>
', 1050, N'steven.tomas01@gmail.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (1036, N'Feedback', N'User Interface', N' Good ', CAST(N'2015-10-22 22:59:02.210' AS DateTime), N'<p>
	Very G!</p>
', 36, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (1037, N'Issues/Inquiries', N'Error Pages', N'Error 404', CAST(N'2015-10-23 03:52:01.333' AS DateTime), N'<p>
	Renewal Page</p>
', 1050, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2036, N'Feedback', N'Customer Care Representative', N' Excellent ', CAST(N'2015-10-23 19:05:35.313' AS DateTime), N'<p>
 Great!</p>
', 12, N'steven1@email.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2037, N'Feedback', N'User Interface', N' Very Good ', CAST(N'2015-10-25 18:17:41.950' AS DateTime), N'', 12, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2038, N'Issues/Inquiries', N'User Interface problems', N'Very Bad!', CAST(N'2015-10-25 18:18:16.673' AS DateTime), N'', 12, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2039, N'Feedback', N'Service/Dispatch Quality', N' Good ', CAST(N'2015-10-25 20:55:44.187' AS DateTime), N'', 12, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2040, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2015-10-27 06:15:13.357' AS DateTime), N'Testingggggggg', 12, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2041, N'Feedback', N'Website functionality', N' Excellent ', CAST(N'2015-10-29 10:21:17.223' AS DateTime), N'Very Nice!', 12, N'steven.tomas01@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2042, N'Issues/Inquiries', N'Incorrect records', N'Medical/Dispatch Information', CAST(N'2015-10-29 10:23:15.410' AS DateTime), N'Inaccurate information regarding the date and medical event, please update with the necessary ones.

Thank you', 12, N'steven.tomas01@gmail.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2043, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2016-02-20 17:49:40.560' AS DateTime), N'Hello
', 2052, N'mjay@email.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2059, N'Issues/Inquiries', N'General membership inquiry', N'Tester', CAST(N'2016-03-06 14:52:13.837' AS DateTime), N'Tester123', 2057, N'steven.tomas@live.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2060, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2016-03-06 15:39:52.667' AS DateTime), N'asdfdf', 2052, N'mjay@email.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2061, N'Issues/Inquiries', N'General membership inquiry', N'Tester', CAST(N'2016-03-06 15:41:21.060' AS DateTime), N'hello!', 2052, N'mjay@email.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2062, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2016-03-06 16:03:51.787' AS DateTime), N'tester!', 2052, N'mjay@email.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2063, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2016-03-06 16:10:52.560' AS DateTime), N'tester again!', 2052, N'mjay@email.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2064, N'Feedback', N'User Interface', N' Very Good ', CAST(N'2016-03-06 16:13:14.180' AS DateTime), N'testertstet', 2052, N'mjay@email.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2065, N'Issues/Inquiries', N'User Interface problems', N'Testersters', CAST(N'2016-03-06 16:15:20.297' AS DateTime), N'Tester!', 2052, N'mjay@email.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2066, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2016-03-06 16:20:42.380' AS DateTime), N'tester', 2052, N'mjay@email.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2067, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2016-03-06 16:21:16.747' AS DateTime), N'tester', 2052, N'mjay@email.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2068, N'Feedback', N'User Interface', N' Good ', CAST(N'2016-03-06 16:22:14.293' AS DateTime), N'tester', 2052, N'mjay@email.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2069, N'Feedback', N'User Interface', N' Very Good ', CAST(N'2016-03-06 16:24:40.553' AS DateTime), N'asd', 2052, N'mjay@email.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2070, N'Issues/Inquiries', N'General membership inquiry', N'tester12323', CAST(N'2016-03-06 16:25:39.270' AS DateTime), N'Tester', 2052, N'mjay@email.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2071, N'Issues/Inquiries', N'General membership inquiry', N'test', CAST(N'2016-03-06 16:41:44.337' AS DateTime), N'tester', 1039, N'jalba@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2072, N'Issues/Inquiries', N'General membership inquiry', N'test', CAST(N'2016-03-06 16:41:46.653' AS DateTime), N'tester', 1039, N'jalba@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2073, N'Issues/Inquiries', N'General membership inquiry', N'test', CAST(N'2016-03-06 16:41:50.307' AS DateTime), N'tester', 1039, N'jalba@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2074, N'Issues/Inquiries', N'General membership inquiry', N'test', CAST(N'2016-03-06 16:41:50.547' AS DateTime), N'tester', 1039, N'jalba@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2075, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2016-03-06 16:42:50.647' AS DateTime), N'test', 1039, N'jalba@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2076, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2016-03-06 16:42:53.277' AS DateTime), N'test', 1039, N'jalba@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2077, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2016-03-06 16:42:54.147' AS DateTime), N'test', 1039, N'jalba@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2078, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2016-03-06 16:42:54.413' AS DateTime), N'test', 1039, N'jalba@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2079, N'Issues/Inquiries', N'General membership inquiry', N'test', CAST(N'2016-03-06 16:44:06.807' AS DateTime), N'test', 1039, N'jalba@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2080, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2016-03-06 16:45:36.387' AS DateTime), N'testerrr', 1039, N'jalba@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2081, N'Issues/Inquiries', N'General membership inquiry', N'testerere', CAST(N'2016-03-06 16:45:52.237' AS DateTime), N'testerer', 1039, N'jalba@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2082, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2016-03-06 17:34:39.650' AS DateTime), N'test', 35, N'123@gmail.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2083, N'Issues/Inquiries', N'User Interface problems', N'Testing this new ticket issuing feature', CAST(N'2016-03-06 17:42:08.130' AS DateTime), N'Hello!', 1046, N'ss@email.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2084, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2016-03-11 21:11:48.070' AS DateTime), N'Feedback error test', 35, N'123@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2085, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2016-03-11 21:12:01.807' AS DateTime), N'Feedback error test
', 35, N'123@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2086, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2016-03-11 21:12:47.940' AS DateTime), N'Feedback error test
', 35, N'123@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2087, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2016-03-11 21:23:35.850' AS DateTime), N'Tester', 35, N'123@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2088, N'Feedback', N'User Interface', N' Excellent ', CAST(N'2016-03-11 21:29:53.880' AS DateTime), N'Tester 2', 35, N'123@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2089, N'Feedback', N'User Interface', N' Very Good ', CAST(N'2016-03-11 21:31:31.603' AS DateTime), N'tester 3', 35, N'123@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2090, N'Feedback', N'User Interface', N' Good ', CAST(N'2016-03-11 21:34:25.490' AS DateTime), N'tester 4', 35, N'123@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2091, N'Feedback', N'User Interface', N' Very Good ', CAST(N'2016-03-11 21:37:04.283' AS DateTime), N'tester 5', 35, N'123@gmail.com', N'Unread')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2092, N'Issues/Inquiries', N'User Interface problems', N'Great', CAST(N'2016-03-11 21:42:51.827' AS DateTime), N'Fuppa!', 35, N'123@gmail.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2093, N'Issues/Inquiries', N'User Interface problems', N'Issue Inquiry', CAST(N'2016-03-11 21:46:25.950' AS DateTime), N'Issue Inquiry', 35, N'123@gmail.com', N'Read')
INSERT [dbo].[Messages] ([MessageID], [Category], [MessageCat], [Subject], [DateSubmitted], [Message], [UserID], [Email], [Status]) VALUES (2094, N'Issues/Inquiries', N'Corporate membership inquiry', N'Fuppa 2', CAST(N'2016-03-11 21:47:48.323' AS DateTime), N'Fuppa 2 hotty!', 35, N'123@gmail.com', N'Read')
SET IDENTITY_INSERT [dbo].[Messages] OFF
SET IDENTITY_INSERT [dbo].[OpportunityActivity] ON 

INSERT [dbo].[OpportunityActivity] ([OpportunityActivityID], [Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField], [OpportunityID]) VALUES (1, 0, CAST(N'2015-10-29' AS Date), CAST(N'2015-10-30' AS Date), 1, N'First Meeting', N'SM', NULL, 1, 7, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[OpportunityActivity] ([OpportunityActivityID], [Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField], [OpportunityID]) VALUES (2, 0, CAST(N'2015-10-29' AS Date), CAST(N'2015-10-30' AS Date), 0, N'Second Meeting', N'Vito Cruz', N'Planning', 0, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OpportunityActivity] ([OpportunityActivityID], [Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField], [OpportunityID]) VALUES (3, 0, NULL, NULL, 1, N'Lunch meeting', N'Vito Cruz', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OpportunityActivity] ([OpportunityActivityID], [Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField], [OpportunityID]) VALUES (4, 0, CAST(N'2015-10-30' AS Date), CAST(N'2015-10-31' AS Date), 1, N'Lunch Date', N'Makati', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OpportunityActivity] ([OpportunityActivityID], [Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField], [OpportunityID]) VALUES (5, 0, CAST(N'2015-10-29' AS Date), CAST(N'2015-10-30' AS Date), 1, N'Test Two', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OpportunityActivity] ([OpportunityActivityID], [Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField], [OpportunityID]) VALUES (6, 0, CAST(N'2015-10-29' AS Date), CAST(N'2015-10-30' AS Date), 1, N'First meeting for me', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[OpportunityActivity] ([OpportunityActivityID], [Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField], [OpportunityID]) VALUES (7, 0, CAST(N'2015-11-02' AS Date), CAST(N'2015-11-03' AS Date), 1, N'Third meeting', N'Manila', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[OpportunityActivity] ([OpportunityActivityID], [Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField], [OpportunityID]) VALUES (8, 0, CAST(N'2015-10-30' AS Date), CAST(N'2015-10-31' AS Date), 1, N'Second meeting', N'Quezon City', NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[OpportunityActivity] ([OpportunityActivityID], [Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField], [OpportunityID]) VALUES (9, 0, CAST(N'2015-11-03' AS Date), CAST(N'2015-11-04' AS Date), 0, N'Fourth meeting', N'Valenzuela', NULL, 2, 3, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[OpportunityActivity] ([OpportunityActivityID], [Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField], [OpportunityID]) VALUES (10, 0, CAST(N'2015-11-05' AS Date), CAST(N'2015-11-06' AS Date), 1, N'Fifth meeting', N'Pasig', NULL, 4, 4, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[OpportunityActivity] ([OpportunityActivityID], [Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField], [OpportunityID]) VALUES (11, 0, CAST(N'2015-10-30' AS Date), CAST(N'2015-10-31' AS Date), 1, N'AVX Testing', N'Undisclosed', NULL, 3, 5, NULL, NULL, NULL, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[OpportunityActivity] OFF
SET IDENTITY_INSERT [dbo].[OpportunityTracking] ON 

INSERT [dbo].[OpportunityTracking] ([OpportunityID], [ClientName], [AccountName], [Rating], [Details], [Source], [DateAdded], [DateModified], [CloseDate], [Amount], [Probability], [Stage], [Type], [PhoneNo], [Email], [Priority]) VALUES (1, N'Container C', N'Black Mesa', N'Warm', N'Misc materials', N'New Business', CAST(N'2015-10-28' AS Date), CAST(N'2016-02-20' AS Date), CAST(N'2016-01-20' AS Date), CAST(50000.00 AS Decimal(18, 2)), CAST(60 AS Decimal(18, 0)), N'Lead', N'New Business', N'546424545', N'steelmills@email.com', N'Normal')
INSERT [dbo].[OpportunityTracking] ([OpportunityID], [ClientName], [AccountName], [Rating], [Details], [Source], [DateAdded], [DateModified], [CloseDate], [Amount], [Probability], [Stage], [Type], [PhoneNo], [Email], [Priority]) VALUES (2, N'Test C Chamber', N'Black Mesa', N'Cold', N'Test materials', N'Other', CAST(N'2015-10-28' AS Date), CAST(N'2015-10-28' AS Date), CAST(N'2016-10-11' AS Date), CAST(8000.00 AS Decimal(18, 2)), CAST(15 AS Decimal(18, 0)), N'Lead', N'Other', N'546424545', N'hl3confirmed@email.com', N'High')
INSERT [dbo].[OpportunityTracking] ([OpportunityID], [ClientName], [AccountName], [Rating], [Details], [Source], [DateAdded], [DateModified], [CloseDate], [Amount], [Probability], [Stage], [Type], [PhoneNo], [Email], [Priority]) VALUES (3, N'Gen-3 Material ', N'Black Mesa', N'Hot', N'AB3 ', N'Existing Business', CAST(N'2015-10-28' AS Date), CAST(N'2015-10-28' AS Date), CAST(N'2016-01-31' AS Date), CAST(50000.00 AS Decimal(18, 2)), CAST(10 AS Decimal(18, 0)), N'Lead', N'Existing Business', N'2231233', N'hl3confirmed@email.com', N'Normal')
INSERT [dbo].[OpportunityTracking] ([OpportunityID], [ClientName], [AccountName], [Rating], [Details], [Source], [DateAdded], [DateModified], [CloseDate], [Amount], [Probability], [Stage], [Type], [PhoneNo], [Email], [Priority]) VALUES (4, N'Oct 15', N'JJ Wills', N'Warm', N'Accounting', N'Existing Business', CAST(N'2015-10-28' AS Date), CAST(N'2015-10-28' AS Date), CAST(N'2016-08-03' AS Date), CAST(79000.00 AS Decimal(18, 2)), CAST(25 AS Decimal(18, 0)), N'Needs Analysis', N'Existing Business', N'7784544', N'jj@email.com', N'Normal')
INSERT [dbo].[OpportunityTracking] ([OpportunityID], [ClientName], [AccountName], [Rating], [Details], [Source], [DateAdded], [DateModified], [CloseDate], [Amount], [Probability], [Stage], [Type], [PhoneNo], [Email], [Priority]) VALUES (5, N'Furniture Planning', N'Niagular', N'Hot', N'Service', N'Existing Business', CAST(N'2015-10-28' AS Date), CAST(N'2015-10-28' AS Date), CAST(N'2016-01-31' AS Date), CAST(20000.00 AS Decimal(18, 2)), CAST(35 AS Decimal(18, 0)), N'Needs Analysis', N'Existing Business', N'4454343', N'nfp@email.com', N'High')
INSERT [dbo].[OpportunityTracking] ([OpportunityID], [ClientName], [AccountName], [Rating], [Details], [Source], [DateAdded], [DateModified], [CloseDate], [Amount], [Probability], [Stage], [Type], [PhoneNo], [Email], [Priority]) VALUES (6, N'February 5', N'Gold Inc.,', N'Hot', N'Various office equip.', N'Other', CAST(N'2015-10-28' AS Date), CAST(N'2015-10-28' AS Date), CAST(N'2015-10-04' AS Date), CAST(45000.00 AS Decimal(18, 2)), CAST(70 AS Decimal(18, 0)), N'Prospecting', N'Other', N'8879965', N'fastechequip@google.com', N'Normal')
INSERT [dbo].[OpportunityTracking] ([OpportunityID], [ClientName], [AccountName], [Rating], [Details], [Source], [DateAdded], [DateModified], [CloseDate], [Amount], [Probability], [Stage], [Type], [PhoneNo], [Email], [Priority]) VALUES (7, N'Jan 1', N'Fast Tech', N'Warm', N'IT Equipments', N'Existing Business', CAST(N'2015-10-28' AS Date), CAST(N'2015-10-28' AS Date), CAST(N'2017-07-09' AS Date), CAST(20000.00 AS Decimal(18, 2)), CAST(50 AS Decimal(18, 0)), N'Proposal/Price Quote', N'Existing Business', N'447445', N'fttech@email.com', N'Normal')
INSERT [dbo].[OpportunityTracking] ([OpportunityID], [ClientName], [AccountName], [Rating], [Details], [Source], [DateAdded], [DateModified], [CloseDate], [Amount], [Probability], [Stage], [Type], [PhoneNo], [Email], [Priority]) VALUES (8, N'June 21', N'Steel Mill', N'Hot', N'Good', N'New Business', CAST(N'2015-10-28' AS Date), CAST(N'2015-10-28' AS Date), CAST(N'2016-01-20' AS Date), CAST(50000.00 AS Decimal(18, 2)), CAST(60 AS Decimal(18, 0)), N'Lead', N'New Business', N'546424545', N'steelmills@email.com', N'Normal')
INSERT [dbo].[OpportunityTracking] ([OpportunityID], [ClientName], [AccountName], [Rating], [Details], [Source], [DateAdded], [DateModified], [CloseDate], [Amount], [Probability], [Stage], [Type], [PhoneNo], [Email], [Priority]) VALUES (9, N'June 21', N'Steel Mill', N'Hot', N'Good', N'New Business', CAST(N'2015-10-28' AS Date), CAST(N'2015-10-28' AS Date), CAST(N'2016-01-20' AS Date), CAST(50000.00 AS Decimal(18, 2)), CAST(60 AS Decimal(18, 0)), N'Lead', N'New Business', N'546424545', N'steelmills@email.com', N'Normal')
SET IDENTITY_INSERT [dbo].[OpportunityTracking] OFF
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (28, N'Unpaid', CAST(4000.00 AS Decimal(18, 2)), N'', 19)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (29, N'Paid', CAST(1000.00 AS Decimal(18, 2)), N'a76eb380-7e71-4d7f-a2c7-0e94f234b335.jpg', 20)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (30, N'Unpaid', CAST(6000.00 AS Decimal(18, 2)), N'', 21)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (31, N'Unpaid', CAST(3000.00 AS Decimal(18, 2)), N'', 22)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (32, N'Unpaid', CAST(6000.00 AS Decimal(18, 2)), N'', 23)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (33, N'Unpaid', CAST(9000.00 AS Decimal(18, 2)), N'', 24)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (34, N'Unpaid', CAST(1000.00 AS Decimal(18, 2)), N'', 25)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (35, N'Unpaid', CAST(1000.00 AS Decimal(18, 2)), N'', 26)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (36, N'Unpaid', CAST(6000.00 AS Decimal(18, 2)), N'', 27)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (37, N'Unpaid', CAST(1000.00 AS Decimal(18, 2)), N'', 28)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (38, N'Unpaid', CAST(15000.00 AS Decimal(18, 2)), N'', 29)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (39, N'Unpaid', CAST(9000.00 AS Decimal(18, 2)), N'', 30)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (40, N'Unpaid', CAST(3000.00 AS Decimal(18, 2)), N'', 31)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (41, N'Unpaid', CAST(3000.00 AS Decimal(18, 2)), N'', 32)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (42, N'Unpaid', CAST(30000.00 AS Decimal(18, 2)), N'', 33)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (43, N'Unpaid', CAST(6000.00 AS Decimal(18, 2)), N'', 34)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (44, N'Unpaid', CAST(1000.00 AS Decimal(18, 2)), N'', 35)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (45, N'Unpaid', CAST(2000.00 AS Decimal(18, 2)), N'', 36)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (46, N'Unpaid', CAST(27000.00 AS Decimal(18, 2)), N'', 37)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (47, N'Paid', CAST(3000.00 AS Decimal(18, 2)), N'95badb43-352b-46bd-bd5e-6913ec1528da.jpg', 38)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (48, N'Paid', CAST(3000.00 AS Decimal(18, 2)), N'b53a6b1e-b904-4e59-a9ec-121db419c8bc.jpg', 39)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (49, N'Unpaid', CAST(12000.00 AS Decimal(18, 2)), N'', 40)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (50, N'Paid', CAST(15000.00 AS Decimal(18, 2)), N'b1ae7f6f-ce9b-45f7-8254-6f695d8d6dad.jpg', 41)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (51, N'Unpaid', CAST(1000.00 AS Decimal(18, 2)), N'1541a3bb-45b4-4af9-9441-8af031de414c.png', 42)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (52, N'Unpaid', CAST(2000.00 AS Decimal(18, 2)), N'4328c4cd-b8f9-49e1-a0b3-f6ceb0a63195.jpg', 43)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (53, N'Paid', CAST(9000.00 AS Decimal(18, 2)), N'48de1d34-7aa2-4bf4-ab99-c7d77edcb46a.jpg', 44)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (54, N'Paid', CAST(6000.00 AS Decimal(18, 2)), N'b11ae032-41e9-444f-b0ed-0c1fdec02cbb.jpg', 45)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (55, N'Paid', CAST(1000.00 AS Decimal(18, 2)), N'2fd2e469-cc09-4e0c-a48c-f1de96d2b6b3.jpg', 46)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (58, N'Unpaid', CAST(3000.00 AS Decimal(18, 2)), N'2c8fd4c4-3758-4c28-b259-04da00f7cd15.jpg', 49)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (59, N'Unpaid', CAST(3000.00 AS Decimal(18, 2)), N'', 50)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (60, N'Unpaid', CAST(2000.00 AS Decimal(18, 2)), N'', 51)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (62, N'Unpaid', CAST(2000.00 AS Decimal(18, 2)), N'', 53)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (63, N'Paid', CAST(7000.00 AS Decimal(18, 2)), N'2f20cb92-2b3f-4193-966a-7cd4cc067c74.jpg', 54)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (64, N'Unpaid', CAST(3000.00 AS Decimal(18, 2)), N'', 55)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (65, N'Paid', CAST(7000.00 AS Decimal(18, 2)), N'9a0ea60c-b615-499f-84b5-77acfcfb2a61.jpg', 56)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (68, N'Paid', CAST(4000.00 AS Decimal(18, 2)), N'b00dee6e-83e2-45e3-bd95-074992adbcfd.jpg', 59)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (69, N'Paid', CAST(30000.00 AS Decimal(18, 2)), N'6c8e7704-e86b-4328-833b-bb29722f169d.jpg', 60)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (70, N'Paid', CAST(3000.00 AS Decimal(18, 2)), N'7c132c37-88c9-47f9-9429-1a2561ad8a9a.jpg', 61)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (1069, N'Unpaid', CAST(1000.00 AS Decimal(18, 2)), N'60ea6e91-2377-4713-a753-d22f0f001043.jpg', 1060)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (1070, N'Paid', CAST(2000.00 AS Decimal(18, 2)), N'', 1061)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (1071, N'Paid', CAST(4000.00 AS Decimal(18, 2)), N'728fd2f1-abac-4784-8ec8-5b4c34721314.jpg', 1062)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (1072, N'Paid', CAST(2000.00 AS Decimal(18, 2)), N'', 1063)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (1073, N'Paid', CAST(2000.00 AS Decimal(18, 2)), N'', 1064)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (1074, N'Unpaid', CAST(2000.00 AS Decimal(18, 2)), N'', 1065)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (1075, N'Paid', CAST(2000.00 AS Decimal(18, 2)), N'759bf4d0-281b-40b1-9df6-68fd149548f9.jpg', 1066)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (2075, N'Unpaid', CAST(3000.00 AS Decimal(18, 2)), N'', 2066)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (2076, N'Paid', CAST(1000.00 AS Decimal(18, 2)), N'5c387bff-6378-468e-bab0-886d78e9db44.jpg', 1)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (2077, N'Unpaid', CAST(3000.00 AS Decimal(18, 2)), N'9d97dc51-bfcc-4f17-b86e-b6418bdb56f5.jpg', 2)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (2078, N'Paid', CAST(1000.00 AS Decimal(18, 2)), N'4421486a-b850-4929-bf7a-7374ca83ead1', 3)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (2079, N'Paid', CAST(5000.00 AS Decimal(18, 2)), N'', 2067)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (2080, N'Paid', CAST(1000.00 AS Decimal(18, 2)), N'', 2068)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (2081, N'Paid', CAST(1000.00 AS Decimal(18, 2)), N'', 2069)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (2084, N'Unpaid', CAST(1000.00 AS Decimal(18, 2)), N'abc6cd8a-6851-467e-8654-f995f0688bbe.jpg', 6)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (2085, N'Unpaid', CAST(3000.00 AS Decimal(18, 2)), N'', 2070)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (2087, N'Paid', CAST(3000.00 AS Decimal(18, 2)), N'', 8)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (2088, N'Unpaid', CAST(6000.00 AS Decimal(18, 2)), N'', 2071)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (2089, N'Paid', CAST(1000.00 AS Decimal(18, 2)), N'0234afdf-1a23-4013-aa5e-38038b7fb21e.jpg', 9)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (2090, N'Unpaid', CAST(1000.00 AS Decimal(18, 2)), N'0234afdf-1a23-4013-aa5e-38038b7fb21e.jpg', 5)
INSERT [dbo].[Payments] ([PaymentID], [PaymentStatus], [Amount], [DepositSlip], [MembershipID]) VALUES (2091, N'Paid', CAST(3000.00 AS Decimal(18, 2)), N'48f0f40d-d305-4cca-8d1e-564c7a5d75c8.jpg', 2072)
SET IDENTITY_INSERT [dbo].[Payments] OFF
SET IDENTITY_INSERT [dbo].[Recover] ON 

INSERT [dbo].[Recover] ([RecoverID], [UserID], [RecoveryCode]) VALUES (10, 2057, N'c1c2aaec-d448-4c54-88d2-6d8b0d5469d2')
SET IDENTITY_INSERT [dbo].[Recover] OFF
SET IDENTITY_INSERT [dbo].[RenewalVoids] ON 

INSERT [dbo].[RenewalVoids] ([VoidID], [MembershipID], [Timestamp], [Reason]) VALUES (1, 59, CAST(N'2015-10-22 03:56:46.017' AS DateTime), N'Nothing')
SET IDENTITY_INSERT [dbo].[RenewalVoids] OFF
SET IDENTITY_INSERT [dbo].[Responder] ON 

INSERT [dbo].[Responder] ([ResponderID], [FirstName], [LastName], [Title], [Status], [DateAdded], [DateModified]) VALUES (1, N'Mary Jane', N'Santos', N'Team Leader', N'Inactive', CAST(N'2016-02-25' AS Date), CAST(N'2016-03-04' AS Date))
INSERT [dbo].[Responder] ([ResponderID], [FirstName], [LastName], [Title], [Status], [DateAdded], [DateModified]) VALUES (2, N'Juan', N'De La Cruz', N'Transport Officer', N'Active', CAST(N'2016-02-25' AS Date), CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Responder] ([ResponderID], [FirstName], [LastName], [Title], [Status], [DateAdded], [DateModified]) VALUES (3, N'John', N'Bay', N'Transport Officer', N'Active', CAST(N'2016-02-25' AS Date), CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Responder] ([ResponderID], [FirstName], [LastName], [Title], [Status], [DateAdded], [DateModified]) VALUES (4, N'Michael J', N'Fox', N'Treatment Officer', N'Active', CAST(N'2016-02-25' AS Date), CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Responder] ([ResponderID], [FirstName], [LastName], [Title], [Status], [DateAdded], [DateModified]) VALUES (5, N'James', N'Bond', N'Treatment Officer', N'Active', CAST(N'2016-02-25' AS Date), CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Responder] ([ResponderID], [FirstName], [LastName], [Title], [Status], [DateAdded], [DateModified]) VALUES (6, N'Michael', N'Reynolds', N'Team Leader', N'Active', CAST(N'2016-02-25' AS Date), CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Responder] ([ResponderID], [FirstName], [LastName], [Title], [Status], [DateAdded], [DateModified]) VALUES (7, N'Juno', N'Temple', N'Treatment Officer', N'Active', CAST(N'2016-02-25' AS Date), CAST(N'2016-02-25' AS Date))
INSERT [dbo].[Responder] ([ResponderID], [FirstName], [LastName], [Title], [Status], [DateAdded], [DateModified]) VALUES (8, N'Todd', N'Lammle', N'Dispatcher', N'Active', CAST(N'2016-02-25' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Responder] OFF
SET IDENTITY_INSERT [dbo].[SecondaryContact] ON 

INSERT [dbo].[SecondaryContact] ([SecondaryContactID], [UserID], [FirstName], [LastName], [TelNo], [MobileNo], [RelationshipID], [Others]) VALUES (1, 11, N'Secondary', N'Contact', N'1235677', N'12345443267', 1, N'')
INSERT [dbo].[SecondaryContact] ([SecondaryContactID], [UserID], [FirstName], [LastName], [TelNo], [MobileNo], [RelationshipID], [Others]) VALUES (2, 11, N'Contact', N'Two', N'1231232323', N'1541354545', 5, N'Shitbrix')
INSERT [dbo].[SecondaryContact] ([SecondaryContactID], [UserID], [FirstName], [LastName], [TelNo], [MobileNo], [RelationshipID], [Others]) VALUES (3, 12, N'Chato', N'Tomas', N'868-1232', N'11111111111', 1, N'')
INSERT [dbo].[SecondaryContact] ([SecondaryContactID], [UserID], [FirstName], [LastName], [TelNo], [MobileNo], [RelationshipID], [Others]) VALUES (4, 12, N'Another', N'Sec', N'1235677', N'23232323', 3, N'')
INSERT [dbo].[SecondaryContact] ([SecondaryContactID], [UserID], [FirstName], [LastName], [TelNo], [MobileNo], [RelationshipID], [Others]) VALUES (5, 12, N'Yet', N'Another', N'525-1698', N'1541354545', 4, N'')
INSERT [dbo].[SecondaryContact] ([SecondaryContactID], [UserID], [FirstName], [LastName], [TelNo], [MobileNo], [RelationshipID], [Others]) VALUES (6, 12, N'Trying', N'Fix', N'2323242', N'12345443267', 5, N'Kidz')
INSERT [dbo].[SecondaryContact] ([SecondaryContactID], [UserID], [FirstName], [LastName], [TelNo], [MobileNo], [RelationshipID], [Others]) VALUES (7, 12, N'Yet', N'Yet', N'12323', N'11', 5, N'FF')
INSERT [dbo].[SecondaryContact] ([SecondaryContactID], [UserID], [FirstName], [LastName], [TelNo], [MobileNo], [RelationshipID], [Others]) VALUES (8, 12, N'', N'', N'', N'', 1, N'')
INSERT [dbo].[SecondaryContact] ([SecondaryContactID], [UserID], [FirstName], [LastName], [TelNo], [MobileNo], [RelationshipID], [Others]) VALUES (9, 40, N'Robert Steven', N'Tomas', N'+6393518', N'+6393518859', 4, N'')
INSERT [dbo].[SecondaryContact] ([SecondaryContactID], [UserID], [FirstName], [LastName], [TelNo], [MobileNo], [RelationshipID], [Others]) VALUES (10, 2050, N'Matt', N'Pat', N'5344536', N'09342534342', 1, N'')
SET IDENTITY_INSERT [dbo].[SecondaryContact] OFF
SET IDENTITY_INSERT [dbo].[Surveys] ON 

INSERT [dbo].[Surveys] ([SurveyID], [UserID], [QuestionOne], [QuestionTwo], [QuestionThree], [QuestionFour], [QuestionFive], [QuestionSix], [QuestionSeven], [QuestionEight], [QuestionNine], [QuestionTen], [Comments], [DateSubmitted]) VALUES (1, 12, N'Very Satisfied', N'Somewhat Satisfed', N'Neutral', N'Neutral', N'Somewhat Dissatisfied', N'Neutral', N'Very Dissatisfied', N'Very Dissatisfied', N'Very Dissatisfied', N'Somewhat Dissatisfied', N'Nothingg!', CAST(N'2015-10-11' AS Date))
INSERT [dbo].[Surveys] ([SurveyID], [UserID], [QuestionOne], [QuestionTwo], [QuestionThree], [QuestionFour], [QuestionFive], [QuestionSix], [QuestionSeven], [QuestionEight], [QuestionNine], [QuestionTen], [Comments], [DateSubmitted]) VALUES (2, 12, N'Somewhat Satisfed', N'Somewhat Satisfed', N'Very Satisfied', N'Somewhat Satisfed', N'Somewhat Satisfed', N'Neutral', N'Somewhat Satisfed', N'Neutral', N'Neutral', N'Neutral', N'', CAST(N'2015-10-11' AS Date))
INSERT [dbo].[Surveys] ([SurveyID], [UserID], [QuestionOne], [QuestionTwo], [QuestionThree], [QuestionFour], [QuestionFive], [QuestionSix], [QuestionSeven], [QuestionEight], [QuestionNine], [QuestionTen], [Comments], [DateSubmitted]) VALUES (3, 40, N'Somewhat Satisfed', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'', CAST(N'2015-10-20' AS Date))
INSERT [dbo].[Surveys] ([SurveyID], [UserID], [QuestionOne], [QuestionTwo], [QuestionThree], [QuestionFour], [QuestionFive], [QuestionSix], [QuestionSeven], [QuestionEight], [QuestionNine], [QuestionTen], [Comments], [DateSubmitted]) VALUES (4, 1050, N'Somewhat Satisfed', N'Very Satisfied', N'Somewhat Satisfed', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'', CAST(N'2015-10-22' AS Date))
INSERT [dbo].[Surveys] ([SurveyID], [UserID], [QuestionOne], [QuestionTwo], [QuestionThree], [QuestionFour], [QuestionFive], [QuestionSix], [QuestionSeven], [QuestionEight], [QuestionNine], [QuestionTen], [Comments], [DateSubmitted]) VALUES (1004, 1050, N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'<p>
	I hope this information would be useful!</p>
', CAST(N'2015-10-23' AS Date))
INSERT [dbo].[Surveys] ([SurveyID], [UserID], [QuestionOne], [QuestionTwo], [QuestionThree], [QuestionFour], [QuestionFive], [QuestionSix], [QuestionSeven], [QuestionEight], [QuestionNine], [QuestionTen], [Comments], [DateSubmitted]) VALUES (2004, 12, N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'', CAST(N'2015-10-25' AS Date))
INSERT [dbo].[Surveys] ([SurveyID], [UserID], [QuestionOne], [QuestionTwo], [QuestionThree], [QuestionFour], [QuestionFive], [QuestionSix], [QuestionSeven], [QuestionEight], [QuestionNine], [QuestionTen], [Comments], [DateSubmitted]) VALUES (2005, 2052, N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'', CAST(N'2016-03-06' AS Date))
INSERT [dbo].[Surveys] ([SurveyID], [UserID], [QuestionOne], [QuestionTwo], [QuestionThree], [QuestionFour], [QuestionFive], [QuestionSix], [QuestionSeven], [QuestionEight], [QuestionNine], [QuestionTen], [Comments], [DateSubmitted]) VALUES (2006, 35, N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Very Satisfied', N'Great!', CAST(N'2016-03-11' AS Date))
SET IDENTITY_INSERT [dbo].[Surveys] OFF
SET IDENTITY_INSERT [dbo].[TempTable] ON 

INSERT [dbo].[TempTable] ([TempID], [DataA], [DataB]) VALUES (1, 3000, NULL)
INSERT [dbo].[TempTable] ([TempID], [DataA], [DataB]) VALUES (2, 6000, NULL)
INSERT [dbo].[TempTable] ([TempID], [DataA], [DataB]) VALUES (3, 3000, NULL)
SET IDENTITY_INSERT [dbo].[TempTable] OFF
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([TypeID], [UserType]) VALUES (1, N'Guest')
INSERT [dbo].[Types] ([TypeID], [UserType]) VALUES (5, N'Pending Client')
INSERT [dbo].[Types] ([TypeID], [UserType]) VALUES (9, N'Client')
INSERT [dbo].[Types] ([TypeID], [UserType]) VALUES (10, N'Administrator')
SET IDENTITY_INSERT [dbo].[Types] OFF
SET IDENTITY_INSERT [dbo].[UserActivation] ON 

INSERT [dbo].[UserActivation] ([ActivationID], [UserID], [ActivationCode]) VALUES (8, 1047, N'602cf56b-1a56-46c8-85d1-b485e0b172aa')
INSERT [dbo].[UserActivation] ([ActivationID], [UserID], [ActivationCode]) VALUES (9, 1049, N'20e5c27c-dc11-4c79-a4aa-463bccdfc2a8')
INSERT [dbo].[UserActivation] ([ActivationID], [UserID], [ActivationCode]) VALUES (1009, 2050, N'36899fb2-8b0c-49e6-8892-e9ca80527367')
INSERT [dbo].[UserActivation] ([ActivationID], [UserID], [ActivationCode]) VALUES (1010, 2052, N'e367a724-ec63-479d-aba9-e6e2144b479a')
INSERT [dbo].[UserActivation] ([ActivationID], [UserID], [ActivationCode]) VALUES (1011, 2053, N'7184d509-4125-4725-ad12-ddb780d9585f')
INSERT [dbo].[UserActivation] ([ActivationID], [UserID], [ActivationCode]) VALUES (1012, 2056, N'2a30d810-cbf9-4bcd-9a68-0cf704b820fe')
INSERT [dbo].[UserActivation] ([ActivationID], [UserID], [ActivationCode]) VALUES (1013, 2059, N'9dafb09a-04d2-42c3-8836-015ee9720883')
SET IDENTITY_INSERT [dbo].[UserActivation] OFF
SET IDENTITY_INSERT [dbo].[UserIP] ON 

INSERT [dbo].[UserIP] ([UserIPID], [UserID], [IPAddr]) VALUES (1, 2056, N'127.0.0.1')
INSERT [dbo].[UserIP] ([UserIPID], [UserID], [IPAddr]) VALUES (2, 2059, N'127.0.0.1')
SET IDENTITY_INSERT [dbo].[UserIP] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (6, 9, N'steven.toma@gmail.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'John', N'Mark', CAST(N'1993-04-13' AS Date), N'24afaccb-b94b-4488-97f0-66f41f324b1d.png', N'Manila', N'Malate', N'Manila', NULL, N'1235677', NULL, N'12345443267', N'Active', CAST(N'2015-09-27 17:31:09.593' AS DateTime), CAST(N'2015-10-23 21:42:50.477' AS DateTime), NULL, N'Normal', 1)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (7, 5, N'user@email.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Ferry', N'Corsten', CAST(N'2004-12-13' AS Date), N'bdea82c8-0b44-43c7-afe6-c967be0a8eca.png', N'2627 Mercedes St., Singalong', N'Malate', N'Manila', NULL, N'1235677', NULL, N'12345443267', N'Active', CAST(N'2015-09-27 17:35:50.633' AS DateTime), CAST(N'2015-10-11 22:57:38.197' AS DateTime), NULL, N'Normal', 1)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (9, 1, N'one@email.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Carl', N'Cox', CAST(N'2001-11-07' AS Date), N'3a4523e1-c468-4ccf-afde-51be89061d74.png', N'', N'', N'', NULL, N'', NULL, N'', N'Active', CAST(N'2015-09-27 17:39:51.677' AS DateTime), CAST(N'2016-01-28 05:47:54.927' AS DateTime), NULL, N'Normal', 1)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (10, 1, N'john@email.com', N'NieQminDE4Ggcewn98nKl3Jhgq7Smn3dLlQ1MyLPswq7njpt8qwsIP4jQ2MR1nhWTQyNMFkwV19g4tPQSBhNeQ==', N'Norman', N'Cook', CAST(N'2005-01-01' AS Date), N'3768bdcd-0399-4fb8-9ec8-640f2010693c.png', N'2627 Mercedes St., Singalong', N'Malate', N'Manila', NULL, N'525-1698', NULL, N'09083262024', N'Active', CAST(N'2015-09-27 17:42:38.120' AS DateTime), CAST(N'2015-10-11 22:57:28.220' AS DateTime), NULL, N'Normal', NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (11, 5, N'user@gmail.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Alex', N'Gudino', CAST(N'1980-04-03' AS Date), N'cd74c1d0-45ad-46b2-bca3-e14283f49f58.png', N'Akasha', N'991', N'Quezon City', NULL, N'1235677', NULL, N'09083262024', N'Active', CAST(N'2015-09-27 23:14:41.663' AS DateTime), CAST(N'2015-10-23 04:05:46.333' AS DateTime), NULL, N'Normal', 1)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (12, 10, N'st@email.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'The', N'One', CAST(N'1999-10-30' AS Date), N'481fceb4-a541-4c87-87b9-fc2cbeded411.jpg', N'Manila', N'Malate', N'Manila', N'02', N'5251698', N'4343', N'09083262024', N'Active', CAST(N'2015-10-01 09:34:49.317' AS DateTime), CAST(N'2016-04-01 11:38:30.680' AS DateTime), 0, N'Contact Immediately', 2)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (13, 5, N'accoune@aol.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Armin', N'Van Buuren', CAST(N'1995-12-11' AS Date), N'8d02b445-f7eb-4b0f-9c98-2ec06b56f99c.png', N'', N'', N'', NULL, N'', NULL, N'', N'Active', CAST(N'2015-10-01 09:43:15.560' AS DateTime), CAST(N'2015-10-11 22:57:17.600' AS DateTime), 0, N'Normal', NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (14, 9, N'tester@email.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Mark', N'Knopler', CAST(N'1995-11-11' AS Date), N'e6ca2592-b170-4d0a-abcd-87ccbbd1256c.png', N'21 Baker Street', N'Malate', N'Manila', NULL, N'1235677', NULL, N'09083262024', N'Active', CAST(N'2015-10-01 12:23:11.997' AS DateTime), CAST(N'2015-10-20 17:41:21.523' AS DateTime), 0, N'Normal', NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (15, 5, N'emailtwo@email.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Ryan', N'Reynolds', CAST(N'2001-11-29' AS Date), N'52f77eb9-eda7-4482-a567-0ac2b0780d21.png', N'', N'', N'', NULL, N'', NULL, N'', N'Pending', CAST(N'2015-10-01 12:24:59.420' AS DateTime), CAST(N'2015-10-28 00:27:18.833' AS DateTime), 0, N'Normal', NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (17, 1, N'one@mail.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Luke', N'Evans', CAST(N'2011-11-11' AS Date), N'9ed5dd39-d4b9-412e-be8e-b23233c5371f.png', N'', N'', N'', NULL, N'', NULL, N'', N'Active', CAST(N'2015-10-03 01:55:32.643' AS DateTime), CAST(N'2015-10-11 01:05:21.227' AS DateTime), 0, N'Normal', NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (35, 9, N'123@gmail.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Mark', N'Joseph', CAST(N'1980-04-03' AS Date), N'1dcfca3e-31fa-4444-9e66-93957df390b3.png', N'167 Apple Street', N'Mandaluyong City', N'Mandaluyong City', NULL, N'8974545', NULL, N'09874454564', N'Pending', CAST(N'2015-10-04 19:49:42.413' AS DateTime), CAST(N'2015-10-11 01:05:29.250' AS DateTime), 0, N'Contact Immediately', 1)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (36, 10, N'steven.tomas@gmail.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'John', N'Doe', CAST(N'2005-01-01' AS Date), N'edd13405-96a6-436b-bfac-d0e6d4ff894b.png', N'21 Baker Street', N'Quezon City', N'Manila', NULL, N'1235677', NULL, N'09083262024', N'Active', CAST(N'2015-10-05 00:00:00.000' AS DateTime), CAST(N'2016-03-04 23:22:48.970' AS DateTime), NULL, N'Normal', NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (40, 9, N'admin@lifeline.com.ph', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Robert Steven', N'Tomas', CAST(N'1993-04-13' AS Date), N'b8a4e654-99b8-4e1f-b584-15dff95f9c71.jpg', N'Manila', N'Malate', N'Manila', NULL, N'5251698', NULL, N'09083262024', N'Active', CAST(N'2015-10-11 00:12:42.803' AS DateTime), CAST(N'2016-02-28 21:48:41.467' AS DateTime), 0, N'Contact Immediately', NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (41, 9, N'john.wayne@email.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'John', N'Wayne', CAST(N'1993-04-13' AS Date), N'9b64304d-ecf4-4579-836b-865fa860c4e1.png', N'Manila', N'Malate', N'Manila', NULL, N'1235677', NULL, N'09083262024', N'Active', CAST(N'2015-10-11 01:03:37.737' AS DateTime), CAST(N'2015-10-20 17:40:39.513' AS DateTime), 0, N'Normal', NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (1038, 9, N'b.pit@live.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Brad', N'Pit', CAST(N'1993-04-13' AS Date), N'67185c6e-b949-46c9-bce2-353b592d7e3b.jpg', N'Manila', N'Malate', N'Manila', NULL, N'1235677', NULL, N'09083262024', N'Active', CAST(N'2015-10-11 14:29:37.167' AS DateTime), CAST(N'2015-10-14 19:52:26.477' AS DateTime), 0, N'Normal', NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (1039, 9, N'jalba@gmail.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Jessica', N'Alba', CAST(N'1970-06-07' AS Date), N'6c519701-f9b9-4114-ba6f-c8349f499fc6.png', N'2627 Mercedes St., Singalong', N'Malate', N'Manila', NULL, N'1235677', NULL, N'09083262024', N'Active', CAST(N'2015-10-17 22:56:17.327' AS DateTime), CAST(N'2015-10-17 22:56:47.677' AS DateTime), 0, N'Contact Immediately', NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (1040, 9, N'gramsay@yahoo.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Gordon', N'Ramsay', CAST(N'1970-02-12' AS Date), N'placeholder.png', N'21 Baker Street', N'Yorkshire', N'London', NULL, N'1235677', NULL, N'09083262024', N'Active', CAST(N'2015-10-19 05:26:05.227' AS DateTime), CAST(N'1900-01-01 00:00:00.000' AS DateTime), 0, N'Normal', NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (1041, 9, N'rr@email.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Rihanna', N'Jones', CAST(N'1980-04-03' AS Date), N'placeholder.png', N'Malabon City', N'District nine', N'Malabon City', NULL, N'2324423', NULL, N'09676565656', N'Active', CAST(N'2015-10-19 18:27:47.497' AS DateTime), CAST(N'2015-10-19 19:30:49.917' AS DateTime), 0, N'Normal', 1)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (1042, 1, N'sman@email.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Emilia', N'Clarke', CAST(N'2004-12-13' AS Date), N'placeholder.png', N'', N'', N'', NULL, N'', NULL, N'', N'Active', CAST(N'2015-10-19 19:31:48.583' AS DateTime), CAST(N'2015-10-19 20:18:20.600' AS DateTime), 0, N'Normal', NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (1044, 9, N'sman@google.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Spiderr', N'Man', CAST(N'2001-11-11' AS Date), N'placeholder.png', N'Quezon City', N'District nine', N'Quezon City', NULL, N'4351223', NULL, N'09676676767', N'Pending', CAST(N'2015-10-19 20:23:44.960' AS DateTime), CAST(N'1900-01-01 00:00:00.000' AS DateTime), 0, N'Normal', NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (1046, 9, N'ss@email.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Shei', N'Santos', CAST(N'1999-11-18' AS Date), N'placeholder.png', N'Manila', N'Malate', N'Manila', NULL, N'1235677', NULL, N'09083262024', N'Active', CAST(N'2015-10-19 20:27:52.627' AS DateTime), CAST(N'2016-02-20 14:16:17.853' AS DateTime), 0, N'Contact Immediately', NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (1048, 9, N'jlaw@yahoo.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Jennifer', N'Lawrence', CAST(N'1970-09-06' AS Date), N'placeholder.png', N'2627 Mercedes St., Singalong', N'Malate', N'Manila', NULL, N'1235677', NULL, N'09083262024', N'Active', CAST(N'2015-10-21 08:01:23.087' AS DateTime), CAST(N'2015-10-21 08:01:47.407' AS DateTime), 0, N'Normal', NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (1050, 9, N'steven.tomas2@gmail.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'James', N'Dean', CAST(N'1980-04-03' AS Date), N'placeholder.png', N'Metro Manila', N'Malate', N'Metro Manila', NULL, N'1235677', NULL, N'09083262024', N'Active', CAST(N'2015-10-22 02:33:01.883' AS DateTime), CAST(N'2015-10-23 02:55:22.627' AS DateTime), 0, N'Contact Immediately', NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (2049, 5, N'emma.watson@email.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Emma', N'Watson', CAST(N'1980-04-03' AS Date), N'placeholder.png', N'21 Baker Street', N'Malate', N'Manila', NULL, N'1235677', NULL, N'09083262024', N'Active', CAST(N'2015-10-23 17:05:01.750' AS DateTime), CAST(N'1900-01-01 00:00:00.000' AS DateTime), 0, N'Normal', NULL)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (2050, 9, N'wwill@yahoo.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Wayan', N'Williams', CAST(N'1980-03-04' AS Date), N'placeholder.png', N'Metro Manila', N'Makati', N'Metro Manila', NULL, N'5451234', NULL, N'09677676456', N'Pending', CAST(N'2015-10-25 05:49:19.137' AS DateTime), CAST(N'2016-02-20 16:37:23.353' AS DateTime), 0, N'Normal', 1)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (2051, 9, N'steven.tomas01@gmail.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Juno', N'Temple', CAST(N'1993-04-02' AS Date), N'd243b559-1266-48a4-ae15-14a7ad2403f1.jpg', N'123 Taft Bldg.', N'Malate', N'Manila', NULL, N'1231233', NULL, N'09083262024', N'Active', CAST(N'2015-10-29 16:52:41.027' AS DateTime), CAST(N'2016-02-18 21:51:48.303' AS DateTime), 0, N'Normal', 0)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (2052, 9, N'mjay@email.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Mark', N'Jacobs', CAST(N'1955-02-01' AS Date), N'0640b381-4d1a-437f-bc23-1dc8ef2e9ba7.jpg', N'857 John D Avenue', N'Valenzuela', N'Antipolo City', NULL, N'3413423', NULL, N'09565464534', N'Pending', CAST(N'2016-02-20 17:45:06.680' AS DateTime), CAST(N'2016-02-21 18:52:58.927' AS DateTime), 0, N'Contact Immediately', 0)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (2053, 5, N'jjm@live.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Jenny', N'Mclaughlin', CAST(N'1980-03-02' AS Date), N'placeholder.png', N'', N'', N'', NULL, N'', NULL, N'', N'Pending', CAST(N'2016-02-20 18:13:35.320' AS DateTime), CAST(N'1900-01-01 00:00:00.000' AS DateTime), 0, N'Normal', 0)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (2056, 5, N'mb@google.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Michael', N'Bay', CAST(N'1980-03-02' AS Date), N'placeholder.png', N'', N'', N'', NULL, N'', NULL, N'', N'Pending', CAST(N'2016-02-20 18:16:34.240' AS DateTime), CAST(N'1900-01-01 00:00:00.000' AS DateTime), 0, N'Normal', 0)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (2057, 9, N'steven.tomas@live.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Super', N'Man', CAST(N'1959-02-23' AS Date), N'placeholder.png', N'Quezon City', N'LA', N'Quezon City', NULL, N'4242232', NULL, N'09524442424', N'Active', CAST(N'2016-02-20 20:37:45.570' AS DateTime), CAST(N'2016-02-20 20:55:27.513' AS DateTime), 0, N'Contact Immediately', 0)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (2058, 1, N'232@email.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Steven', N'Tomas', CAST(N'1950-01-01' AS Date), N'placeholder.png', N'2321 Guava street', N'District some', N'Makati City', NULL, N'6564545', NULL, N'09675665656', N'Active', CAST(N'2016-03-13 21:18:23.037' AS DateTime), CAST(N'2016-03-13 21:47:15.037' AS DateTime), 1366241933432894, N'Normal', 0)
INSERT [dbo].[Users] ([UserID], [TypeID], [Email], [Password], [FirstName], [LastName], [Birthday], [UserPic], [Street], [Municipality], [City], [AreaCode], [Phone], [Extension], [Mobile], [Status], [DateAdded], [DateModified], [FacebookID], [Priority], [CorporateID]) VALUES (2059, 1, N'rafaelramos4213@gmail.com', N'1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', N'Rafael', N'Ramos', CAST(N'1995-02-10' AS Date), N'placeholder.png', N'232 asdasdasd', N'asdasd', N'Malabon City', N'', N'4234234', N'', N'44343434343', N'Pending', CAST(N'2016-04-01 11:43:34.193' AS DateTime), CAST(N'2016-04-01 15:57:06.840' AS DateTime), 0, N'Normal', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Verification] ON 

INSERT [dbo].[Verification] ([ScanID], [UserID], [VerificationScan], [UploadDate]) VALUES (1, 40, N'cd589569-78f7-409b-9119-bedc0962173b.jpg', CAST(N'2016-01-29' AS Date))
INSERT [dbo].[Verification] ([ScanID], [UserID], [VerificationScan], [UploadDate]) VALUES (2, 40, N'0499abb9-8315-4aa3-8d60-4fe126e71c89.jpg', CAST(N'2016-01-29' AS Date))
INSERT [dbo].[Verification] ([ScanID], [UserID], [VerificationScan], [UploadDate]) VALUES (3, 2051, N'691ecd6f-dd4d-49bb-911a-0a09e4ea9779.jpg', CAST(N'2016-01-29' AS Date))
INSERT [dbo].[Verification] ([ScanID], [UserID], [VerificationScan], [UploadDate]) VALUES (4, 2051, N'4d74bf8f-2efe-4fcc-babf-20155f2eeac2.jpg', CAST(N'2016-02-18' AS Date))
INSERT [dbo].[Verification] ([ScanID], [UserID], [VerificationScan], [UploadDate]) VALUES (5, 1046, N'3fad9f23-c16f-4e04-88bb-cccb6e77c315.jpg', CAST(N'2016-02-20' AS Date))
INSERT [dbo].[Verification] ([ScanID], [UserID], [VerificationScan], [UploadDate]) VALUES (6, 2057, N'889209b8-588b-458d-8471-a6e40f2307df.jpg', CAST(N'2016-02-28' AS Date))
INSERT [dbo].[Verification] ([ScanID], [UserID], [VerificationScan], [UploadDate]) VALUES (7, 2052, N'59f9bf24-c940-4b51-bb5e-a0c991e65431.jpg', CAST(N'2016-03-06' AS Date))
INSERT [dbo].[Verification] ([ScanID], [UserID], [VerificationScan], [UploadDate]) VALUES (15, 1039, N'8a7cb5fd-874d-494c-b436-5ef7fede4e56.jpg', CAST(N'2016-03-06' AS Date))
INSERT [dbo].[Verification] ([ScanID], [UserID], [VerificationScan], [UploadDate]) VALUES (16, 35, N'89c82bd5-aa10-4ce9-9c14-6c41780c8f7a.jpg', CAST(N'2016-03-06' AS Date))
INSERT [dbo].[Verification] ([ScanID], [UserID], [VerificationScan], [UploadDate]) VALUES (18, 1044, N'f2d54bd2-57cc-425a-8ac1-10ef827abdda.jpg', CAST(N'2016-03-11' AS Date))
INSERT [dbo].[Verification] ([ScanID], [UserID], [VerificationScan], [UploadDate]) VALUES (19, 2058, N'4fc742d5-c917-43fa-bc30-d96cc6153ad8.jpg', CAST(N'2016-03-13' AS Date))
INSERT [dbo].[Verification] ([ScanID], [UserID], [VerificationScan], [UploadDate]) VALUES (20, 2059, N'51af6c00-8594-40f6-a832-acaa94e0fc92.sql', CAST(N'2016-04-01' AS Date))
SET IDENTITY_INSERT [dbo].[Verification] OFF
ALTER TABLE [dbo].[Dispatch]  WITH CHECK ADD  CONSTRAINT [FK_Dispatch_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Dispatch] CHECK CONSTRAINT [FK_Dispatch_Users]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_Users]
GO
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [FK_Membership_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [FK_Membership_Users]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users]
GO
ALTER TABLE [dbo].[Surveys]  WITH CHECK ADD  CONSTRAINT [FK_Surveys_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Surveys] CHECK CONSTRAINT [FK_Surveys_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Types1] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Types] ([TypeID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Types1]
GO
USE [master]
GO
ALTER DATABASE [dbLifeline] SET  READ_WRITE 
GO
