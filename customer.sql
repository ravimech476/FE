USE [customerconnect]
GO
/****** Object:  Table [dbo].[blog_categories]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[slug] [nvarchar](100) NOT NULL,
	[description] [nvarchar](500) NULL,
	[created_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blog_comments]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog_comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[post_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[status] [nvarchar](20) NULL,
	[created_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blog_post_categories]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog_post_categories](
	[post_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[post_id] ASC,
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blog_posts]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog_posts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](500) NOT NULL,
	[slug] [nvarchar](500) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[excerpt] [nvarchar](500) NULL,
	[featured_image] [nvarchar](500) NULL,
	[author_id] [int] NOT NULL,
	[status] [nvarchar](20) NULL,
	[view_count] [int] NULL,
	[published_date] [datetime] NULL,
	[created_date] [datetime] NULL,
	[modified_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[expert_settings]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[expert_settings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[isActive] [bit] NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[invoice_number] [nvarchar](255) NOT NULL,
	[customer_name] [nvarchar](255) NOT NULL,
	[customer_email] [nvarchar](255) NULL,
	[customer_phone] [nvarchar](255) NULL,
	[product_name] [nvarchar](255) NOT NULL,
	[product_id] [int] NULL,
	[quantity] [int] NOT NULL,
	[unit_price] [decimal](10, 2) NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[invoice_date] [datetime] NOT NULL,
	[delivery_date] [datetime] NULL,
	[status] [nvarchar](50) NOT NULL,
	[payment_status] [nvarchar](50) NOT NULL,
	[shipping_address] [nvarchar](max) NULL,
	[notes] [nvarchar](max) NULL,
	[created_by] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[customer_code] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SequelizeMeta]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SequelizeMeta](
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[social_media_links]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[social_media_links](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[icon] [nvarchar](50) NOT NULL,
	[link] [nvarchar](500) NOT NULL,
	[isActive] [bit] NOT NULL,
	[sortOrder] [int] NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_invoice_to_delivery]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_invoice_to_delivery](
	[sl_no] [int] IDENTITY(1,1) NOT NULL,
	[invoice_number] [nvarchar](100) NOT NULL,
	[invoice_date] [datetimeoffset](7) NOT NULL,
	[invoice_value] [nvarchar](100) NULL,
	[invoice_value_inr] [nvarchar](100) NULL,
	[dispatch_date] [datetimeoffset](7) NULL,
	[lr_number] [nvarchar](100) NULL,
	[delivery_partner] [nvarchar](100) NULL,
	[delivered_date] [datetimeoffset](7) NULL,
	[status] [varchar](255) NULL,
	[created_date] [datetimeoffset](7) NOT NULL,
	[modified_date] [datetimeoffset](7) NOT NULL,
	[customer_code] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sl_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_login_log]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_login_log](
	[sl_no] [int] IDENTITY(1,1) NOT NULL,
	[login_id] [int] NOT NULL,
	[login_datetime] [datetimeoffset](7) NOT NULL,
	[logout_datetime] [datetimeoffset](7) NULL,
	[ip_address] [nvarchar](45) NULL,
	[user_agent] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[sl_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_market_research]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_market_research](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[research_number] [nvarchar](100) NOT NULL,
	[research_name] [nvarchar](250) NOT NULL,
	[research_title] [nvarchar](500) NULL,
	[research_long_description] [nvarchar](max) NULL,
	[video_link] [nvarchar](255) NULL,
	[research_short_description] [nvarchar](max) NULL,
	[research_image1] [nvarchar](100) NULL,
	[research_image2] [nvarchar](100) NULL,
	[document] [nvarchar](100) NULL,
	[status] [varchar](255) NULL,
	[priority] [int] NULL,
	[created_date] [datetimeoffset](7) NOT NULL,
	[created_by] [nvarchar](100) NULL,
	[modified_date] [datetimeoffset](7) NOT NULL,
	[modified_by] [nvarchar](100) NULL,
	[customer_code] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_meeting_minutes]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_meeting_minutes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[meeting_date] [datetime2](7) NOT NULL,
	[attendees] [ntext] NULL,
	[agenda] [ntext] NULL,
	[minutes] [ntext] NOT NULL,
	[action_items] [ntext] NULL,
	[next_meeting_date] [datetime2](7) NULL,
	[status] [nvarchar](20) NOT NULL,
	[created_by] [int] NOT NULL,
	[created_date] [datetime2](7) NOT NULL,
	[modified_date] [datetime2](7) NOT NULL,
	[mom_number] [nvarchar](50) NOT NULL,
	[attachments] [nvarchar](max) NULL,
	[customer_code] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_news]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_news](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[news_number] [nvarchar](100) NOT NULL,
	[news_name] [nvarchar](250) NOT NULL,
	[news_title] [nvarchar](500) NULL,
	[news_long_description] [nvarchar](max) NULL,
	[news_short_description] [nvarchar](max) NULL,
	[news_image1] [nvarchar](100) NULL,
	[news_image2] [nvarchar](100) NULL,
	[document] [nvarchar](100) NULL,
	[status] [varchar](255) NULL,
	[priority] [int] NULL,
	[created_date] [datetimeoffset](7) NOT NULL,
	[created_by] [nvarchar](100) NULL,
	[modified_date] [datetimeoffset](7) NOT NULL,
	[modified_by] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_page_log]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_page_log](
	[sl_no] [int] IDENTITY(1,1) NOT NULL,
	[login_id] [int] NOT NULL,
	[page_name] [nvarchar](100) NOT NULL,
	[datetime] [datetimeoffset](7) NOT NULL,
	[session_id] [nvarchar](255) NULL,
	[action] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[sl_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_products]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_number] [nvarchar](100) NOT NULL,
	[product_name] [nvarchar](250) NOT NULL,
	[product_long_description] [nvarchar](max) NULL,
	[uom] [nvarchar](10) NULL,
	[product_short_description] [nvarchar](max) NULL,
	[product_image1] [nvarchar](100) NULL,
	[product_image2] [nvarchar](100) NULL,
	[product_group] [nvarchar](100) NULL,
	[status] [varchar](255) NULL,
	[priority] [int] NULL,
	[created_date] [datetimeoffset](7) NOT NULL,
	[modified_date] [datetimeoffset](7) NOT NULL,
	[common_name] [varchar](200) NULL,
	[botanical_name] [varchar](200) NULL,
	[plant_part] [varchar](100) NULL,
	[source_country] [varchar](100) NULL,
	[harvest_region_new] [varchar](500) NULL,
	[peak_season_enabled] [bit] NULL,
	[peak_season_months] [varchar](500) NULL,
	[harvest_season_enabled] [bit] NULL,
	[harvest_season_months] [varchar](500) NULL,
	[procurement_method] [varchar](100) NULL,
	[main_components] [text] NULL,
	[sensory_notes] [text] NULL,
	[color_absolute] [varchar](200) NULL,
	[extraction_process] [varchar](100) NULL,
	[applications_uses] [text] NULL,
	[production_availability] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_roles]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](100) NOT NULL,
	[description] [ntext] NULL,
	[permissions] [ntext] NOT NULL,
	[status] [nvarchar](20) NOT NULL,
	[created_by] [int] NULL,
	[created_date] [datetime2](7) NOT NULL,
	[modified_date] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_sales]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_sales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bill_date] [date] NULL,
	[billing_doc_no] [varchar](50) NULL,
	[invoice_no] [varchar](50) NULL,
	[sales_document] [varchar](50) NULL,
	[delivery] [varchar](50) NULL,
	[account_doc] [varchar](50) NULL,
	[profit_center] [varchar](100) NULL,
	[excise_invoice] [varchar](50) NULL,
	[order_type] [varchar](50) NULL,
	[billing_document_description] [varchar](255) NULL,
	[customer_name] [varchar](255) NULL,
	[material_no] [varchar](100) NULL,
	[ext_group] [varchar](100) NULL,
	[hsn_code] [varchar](50) NULL,
	[description] [varchar](max) NULL,
	[batch_no] [varchar](100) NULL,
	[qty] [decimal](18, 2) NULL,
	[rate_unit_doc_curr] [decimal](18, 2) NULL,
	[rate_unit_inr] [decimal](18, 2) NULL,
	[uom] [varchar](10) NULL,
	[basis_rate_doc_curr] [decimal](18, 2) NULL,
	[basis_rate_inr] [decimal](18, 2) NULL,
	[bcd_percent] [decimal](5, 2) NULL,
	[basic_custom_duty] [decimal](18, 2) NULL,
	[sws_percent] [decimal](5, 2) NULL,
	[social_welfare_schg] [decimal](18, 2) NULL,
	[sgst_percent] [decimal](5, 2) NULL,
	[sgst] [decimal](18, 2) NULL,
	[cgst_percent] [decimal](5, 2) NULL,
	[cgst] [decimal](18, 2) NULL,
	[igst_percent] [decimal](5, 2) NULL,
	[igst] [decimal](18, 2) NULL,
	[bed_16_percent] [decimal](18, 2) NULL,
	[cess_2_percent] [decimal](18, 2) NULL,
	[shcess_1_percent] [decimal](18, 2) NULL,
	[vat_4_percent] [decimal](18, 2) NULL,
	[cst] [decimal](18, 2) NULL,
	[surcharge] [decimal](18, 2) NULL,
	[net_amount] [decimal](18, 2) NULL,
	[packing_details] [varchar](255) NULL,
	[transport] [varchar](255) NULL,
	[no_kinds_of_package] [varchar](255) NULL,
	[marks_container_nos] [varchar](255) NULL,
	[insurance_policy_no] [varchar](100) NULL,
	[lr_rr_date] [date] NULL,
	[extra_header] [varchar](255) NULL,
	[customer_code] [varchar](50) NULL,
	[currency] [varchar](10) NULL,
	[payterms] [varchar](50) NULL,
	[payment_terms_description] [varchar](255) NULL,
	[due_date] [date] NULL,
	[exchange_rate] [decimal](18, 6) NULL,
	[mode_shipment] [varchar](100) NULL,
	[gst_number] [varchar](50) NULL,
	[country] [varchar](100) NULL,
	[inco_terms] [varchar](50) NULL,
	[customer_po_number] [varchar](100) NULL,
	[customer_po_date] [date] NULL,
	[date_of_realisation] [date] NULL,
	[clearing_document_number] [varchar](100) NULL,
	[sales_category] [varchar](50) NULL,
	[our_bank_name] [varchar](100) NULL,
	[our_bank_acct_no] [varchar](50) NULL,
	[mode_of_transport] [varchar](100) NULL,
	[status] [varchar](20) NULL,
	[created_by] [varchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_by] [varchar](50) NULL,
	[updated_at] [datetime] NULL,
	[dispatch_status] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_statement]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_statement](
	[sl_no] [int] IDENTITY(1,1) NOT NULL,
	[customer_code] [nvarchar](100) NOT NULL,
	[customer_name] [nvarchar](250) NOT NULL,
	[customer_group] [nvarchar](100) NULL,
	[outstanding_value] [decimal](15, 2) NULL,
	[invoice_number] [nvarchar](100) NOT NULL,
	[invoice_date] [datetimeoffset](7) NOT NULL,
	[due_date] [datetimeoffset](7) NULL,
	[total_paid_amount] [decimal](15, 2) NULL,
	[status] [varchar](255) NULL,
	[created_date] [datetimeoffset](7) NOT NULL,
	[modified_date] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sl_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_users]    Script Date: 12-09-2025 08:57:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[email_id] [nvarchar](255) NOT NULL,
	[role] [varchar](255) NULL,
	[status] [varchar](255) NULL,
	[last_login_datetime] [datetimeoffset](7) NULL,
	[created_date] [datetimeoffset](7) NOT NULL,
	[modified_date] [datetimeoffset](7) NOT NULL,
	[first_name] [nvarchar](100) NULL,
	[last_name] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[role_id] [int] NULL,
	[created_by] [int] NULL,
	[customer_code] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[blog_categories] ON 
GO
INSERT [dbo].[blog_categories] ([id], [name], [slug], [description], [created_date]) VALUES (1, N'Technology', N'technology', N'Technology and software development', CAST(N'2025-09-12T08:22:31.603' AS DateTime))
GO
INSERT [dbo].[blog_categories] ([id], [name], [slug], [description], [created_date]) VALUES (2, N'Company News', N'company-news', N'Latest company updates and announcements', CAST(N'2025-09-12T08:22:31.637' AS DateTime))
GO
INSERT [dbo].[blog_categories] ([id], [name], [slug], [description], [created_date]) VALUES (3, N'Industry Insights', N'industry-insights', N'Industry trends and analysis', CAST(N'2025-09-12T08:22:31.647' AS DateTime))
GO
INSERT [dbo].[blog_categories] ([id], [name], [slug], [description], [created_date]) VALUES (4, N'Tips & Tutorials', N'tips-tutorials', N'Helpful tips and tutorials', CAST(N'2025-09-12T08:22:31.657' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[blog_categories] OFF
GO
SET IDENTITY_INSERT [dbo].[blog_comments] ON 
GO
INSERT [dbo].[blog_comments] ([id], [post_id], [user_id], [content], [status], [created_date]) VALUES (1, 2, 7, N'XDFHSFHG', N'approved', CAST(N'2025-09-12T08:50:59.040' AS DateTime))
GO
INSERT [dbo].[blog_comments] ([id], [post_id], [user_id], [content], [status], [created_date]) VALUES (2, 2, 9, N'hi', N'approved', CAST(N'2025-09-12T08:52:41.613' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[blog_comments] OFF
GO
INSERT [dbo].[blog_post_categories] ([post_id], [category_id]) VALUES (2, 4)
GO
SET IDENTITY_INSERT [dbo].[blog_posts] ON 
GO
INSERT [dbo].[blog_posts] ([id], [title], [slug], [content], [excerpt], [featured_image], [author_id], [status], [view_count], [published_date], [created_date], [modified_date]) VALUES (1, N'Welcome to Our Company Blog', N'welcome-to-our-company-blog', N'
                    <h2>Welcome to Our New Blog Platform!</h2>
                    <p>We''re excited to launch our new company blog where we''ll share updates, insights, and knowledge with our team.</p>
                    <h3>What to Expect</h3>
                    <ul>
                        <li>Company news and updates</li>
                        <li>Technical tutorials and best practices</li>
                        <li>Industry insights and trends</li>
                        <li>Team spotlights and achievements</li>
                    </ul>
                    <p>Stay tuned for more exciting content!</p>
                ', N'Welcome to our new company blog platform where we share updates, insights, and knowledge.', NULL, 1, N'published', 0, CAST(N'2025-09-12T02:52:31.243' AS DateTime), CAST(N'2025-09-12T08:22:31.260' AS DateTime), CAST(N'2025-09-12T08:22:31.260' AS DateTime))
GO
INSERT [dbo].[blog_posts] ([id], [title], [slug], [content], [excerpt], [featured_image], [author_id], [status], [view_count], [published_date], [created_date], [modified_date]) VALUES (2, N'FHFGH', N'fhfgh', N'GHJGHDGSDHFDHFHGG', N'DFHF', N'https://crm.pazl.info/user-uploads/app-logo/8b1997f4b73ffa05a2dc45790155e20d.png', 7, N'published', 6, CAST(N'2025-09-12T03:20:42.150' AS DateTime), CAST(N'2025-09-12T08:50:42.170' AS DateTime), CAST(N'2025-09-12T08:50:42.170' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[blog_posts] OFF
GO
SET IDENTITY_INSERT [dbo].[expert_settings] ON 
GO
INSERT [dbo].[expert_settings] ([id], [email], [isActive], [createdAt], [updatedAt]) VALUES (1, N'expert@customerconnect.com', 0, CAST(N'2025-07-25T16:52:26.3566667' AS DateTime2), CAST(N'2025-07-25T11:24:10.7350000' AS DateTime2))
GO
INSERT [dbo].[expert_settings] ([id], [email], [isActive], [createdAt], [updatedAt]) VALUES (2, N'expert@customerconnect.comd', 1, CAST(N'2025-07-25T11:24:10.7810000' AS DateTime2), CAST(N'2025-07-25T11:24:10.7810000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[expert_settings] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 
GO
INSERT [dbo].[orders] ([id], [invoice_number], [customer_name], [customer_email], [customer_phone], [product_name], [product_id], [quantity], [unit_price], [amount], [invoice_date], [delivery_date], [status], [payment_status], [shipping_address], [notes], [created_by], [created_at], [updated_at], [customer_code]) VALUES (1, N'INV-2025-001', N'John Smith', N'john.smith@example.com', N'+1234567890', N'Premium Widget Pro', NULL, 3, CAST(49.99 AS Decimal(10, 2)), CAST(149.97 AS Decimal(10, 2)), CAST(N'2025-01-15T00:00:00.000' AS DateTime), CAST(N'2025-01-20T00:00:00.000' AS DateTime), N'delivered', N'paid', N'123 Main St, Anytown, USA 12345', N'Customer requested expedited shipping', NULL, CAST(N'2025-07-25T14:35:34.523' AS DateTime), CAST(N'2025-07-25T14:35:34.523' AS DateTime), NULL)
GO
INSERT [dbo].[orders] ([id], [invoice_number], [customer_name], [customer_email], [customer_phone], [product_name], [product_id], [quantity], [unit_price], [amount], [invoice_date], [delivery_date], [status], [payment_status], [shipping_address], [notes], [created_by], [created_at], [updated_at], [customer_code]) VALUES (2, N'INV-2025-002', N'Sarah Johnson', N'sarah.j@example.com', N'+1234567891', N'Standard Widget', NULL, 5, CAST(29.99 AS Decimal(10, 2)), CAST(149.95 AS Decimal(10, 2)), CAST(N'2025-01-16T00:00:00.000' AS DateTime), CAST(N'2025-01-22T00:00:00.000' AS DateTime), N'shipped', N'paid', N'456 Oak Avenue, Springfield, USA 23456', N'Fragile - handle with care', NULL, CAST(N'2025-07-25T14:35:34.523' AS DateTime), CAST(N'2025-07-25T14:35:34.523' AS DateTime), NULL)
GO
INSERT [dbo].[orders] ([id], [invoice_number], [customer_name], [customer_email], [customer_phone], [product_name], [product_id], [quantity], [unit_price], [amount], [invoice_date], [delivery_date], [status], [payment_status], [shipping_address], [notes], [created_by], [created_at], [updated_at], [customer_code]) VALUES (3, N'INV-2025-003', N'Mike Brown', N'mike.brown@example.com', N'+1234567892', N'Deluxe Widget Bundle', NULL, 2, CAST(99.99 AS Decimal(10, 2)), CAST(199.98 AS Decimal(10, 2)), CAST(N'2025-01-18T00:00:00.000' AS DateTime), CAST(N'2025-01-25T00:00:00.000' AS DateTime), N'processing', N'paid', N'789 Elm Street, Metropolis, USA 34567', N'Gift wrapping requested', NULL, CAST(N'2025-07-25T14:35:34.523' AS DateTime), CAST(N'2025-07-25T14:35:34.523' AS DateTime), NULL)
GO
INSERT [dbo].[orders] ([id], [invoice_number], [customer_name], [customer_email], [customer_phone], [product_name], [product_id], [quantity], [unit_price], [amount], [invoice_date], [delivery_date], [status], [payment_status], [shipping_address], [notes], [created_by], [created_at], [updated_at], [customer_code]) VALUES (4, N'INV-2025-004', N'Emily Davis', N'emily.d@example.com', N'+1234567893', N'Basic Widget Set', NULL, 10, CAST(19.99 AS Decimal(10, 2)), CAST(199.90 AS Decimal(10, 2)), CAST(N'2025-01-20T00:00:00.000' AS DateTime), CAST(N'2025-01-27T00:00:00.000' AS DateTime), N'pending', N'pending', N'321 Pine Road, Smallville, USA 45678', N'Bulk order for office', NULL, CAST(N'2025-07-25T14:35:34.523' AS DateTime), CAST(N'2025-07-25T14:35:34.523' AS DateTime), NULL)
GO
INSERT [dbo].[orders] ([id], [invoice_number], [customer_name], [customer_email], [customer_phone], [product_name], [product_id], [quantity], [unit_price], [amount], [invoice_date], [delivery_date], [status], [payment_status], [shipping_address], [notes], [created_by], [created_at], [updated_at], [customer_code]) VALUES (5, N'INV-2025-005', N'Robert Wilson', N'r.wilson@example.com', N'+1234567894', N'Enterprise Widget Solution', NULL, 1, CAST(499.99 AS Decimal(10, 2)), CAST(499.99 AS Decimal(10, 2)), CAST(N'2025-01-21T00:00:00.000' AS DateTime), CAST(N'2025-01-28T00:00:00.000' AS DateTime), N'processing', N'partial', N'654 Birch Lane, Big City, USA 56789', N'Installation support required', NULL, CAST(N'2025-07-25T14:35:34.523' AS DateTime), CAST(N'2025-07-25T14:35:34.523' AS DateTime), NULL)
GO
INSERT [dbo].[orders] ([id], [invoice_number], [customer_name], [customer_email], [customer_phone], [product_name], [product_id], [quantity], [unit_price], [amount], [invoice_date], [delivery_date], [status], [payment_status], [shipping_address], [notes], [created_by], [created_at], [updated_at], [customer_code]) VALUES (6, N'INV-2025-006', N'Lisa Anderson', N'lisa.a@example.com', N'+1234567895', N'Widget Accessories Pack', NULL, 4, CAST(15.99 AS Decimal(10, 2)), CAST(63.96 AS Decimal(10, 2)), CAST(N'2025-01-22T00:00:00.000' AS DateTime), CAST(N'2025-01-29T00:00:00.000' AS DateTime), N'shipped', N'paid', N'987 Cedar Court, Riverside, USA 67890', N'Leave package at door', NULL, CAST(N'2025-07-25T14:35:34.523' AS DateTime), CAST(N'2025-07-25T14:35:34.523' AS DateTime), NULL)
GO
INSERT [dbo].[orders] ([id], [invoice_number], [customer_name], [customer_email], [customer_phone], [product_name], [product_id], [quantity], [unit_price], [amount], [invoice_date], [delivery_date], [status], [payment_status], [shipping_address], [notes], [created_by], [created_at], [updated_at], [customer_code]) VALUES (7, N'INV-2025-007', N'David Martinez', N'david.m@example.com', N'+1234567896', N'Custom Widget Design', NULL, 1, CAST(299.99 AS Decimal(10, 2)), CAST(299.99 AS Decimal(10, 2)), CAST(N'2025-01-23T00:00:00.000' AS DateTime), CAST(N'2025-02-01T00:00:00.000' AS DateTime), N'pending', N'pending', N'246 Maple Drive, Townsville, USA 78901', N'Custom color: Blue', NULL, CAST(N'2025-07-25T14:35:34.523' AS DateTime), CAST(N'2025-07-25T14:35:34.523' AS DateTime), NULL)
GO
INSERT [dbo].[orders] ([id], [invoice_number], [customer_name], [customer_email], [customer_phone], [product_name], [product_id], [quantity], [unit_price], [amount], [invoice_date], [delivery_date], [status], [payment_status], [shipping_address], [notes], [created_by], [created_at], [updated_at], [customer_code]) VALUES (8, N'INV-2025-008', N'Jennifer Taylor', N'jen.taylor@example.com', N'+1234567897', N'Widget Maintenance Kit', NULL, 6, CAST(24.99 AS Decimal(10, 2)), CAST(149.94 AS Decimal(10, 2)), CAST(N'2025-01-24T00:00:00.000' AS DateTime), CAST(N'2025-01-31T00:00:00.000' AS DateTime), N'completed', N'paid', N'135 Walnut Way, Suburbia, USA 89012', N'Repeat customer - apply discount', NULL, CAST(N'2025-07-25T14:35:34.523' AS DateTime), CAST(N'2025-07-25T14:35:34.523' AS DateTime), NULL)
GO
INSERT [dbo].[orders] ([id], [invoice_number], [customer_name], [customer_email], [customer_phone], [product_name], [product_id], [quantity], [unit_price], [amount], [invoice_date], [delivery_date], [status], [payment_status], [shipping_address], [notes], [created_by], [created_at], [updated_at], [customer_code]) VALUES (9, N'INV-2025-009', N'Chris Thomas', N'chris.t@example.com', N'+1234567898', N'Widget Starter Pack', NULL, 2, CAST(39.99 AS Decimal(10, 2)), CAST(79.98 AS Decimal(10, 2)), CAST(N'2025-01-25T00:00:00.000' AS DateTime), CAST(N'2025-02-02T00:00:00.000' AS DateTime), N'processing', N'paid', N'864 Spruce Street, Hamlet, USA 90123', N'First-time customer', NULL, CAST(N'2025-07-25T14:35:34.523' AS DateTime), CAST(N'2025-07-25T14:35:34.523' AS DateTime), NULL)
GO
INSERT [dbo].[orders] ([id], [invoice_number], [customer_name], [customer_email], [customer_phone], [product_name], [product_id], [quantity], [unit_price], [amount], [invoice_date], [delivery_date], [status], [payment_status], [shipping_address], [notes], [created_by], [created_at], [updated_at], [customer_code]) VALUES (10, N'INV-2025-010', N'Amanda White', N'amanda.w@example.com', N'+1234567899', N'Limited Edition Widget', NULL, 1, CAST(199.99 AS Decimal(10, 2)), CAST(199.99 AS Decimal(10, 2)), CAST(N'2025-01-25T00:00:00.000' AS DateTime), CAST(N'2025-02-05T00:00:00.000' AS DateTime), N'cancelled', N'refunded', N'753 Chestnut Place, Village, USA 01234', N'Order cancelled by customer', NULL, CAST(N'2025-07-25T14:35:34.523' AS DateTime), CAST(N'2025-07-25T14:35:34.523' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250125-create-orders.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250125-seed-more-invoice-to-delivery-data.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250125-seed-statements-data.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250724000001-create-users.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250724000002-create-products.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250724000003-create-market-research.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250724000004-create-news.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250724000005-create-invoice-to-delivery.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250724000006-create-statement.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250724000007-create-login-log.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250724000008-create-page-log.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250725000001-create-roles.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250725000001-create-tables.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250725000002-update-users.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250725000003-add-timestamps.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250725000003-create-meeting-minutes.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250725000004-update-roles-enum.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250725000005-add-customer-code.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250726-add-attachments-to-meeting-minutes.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20250726-add-mom-number-to-meeting-minutes.js')
GO
SET IDENTITY_INSERT [dbo].[social_media_links] ON 
GO
INSERT [dbo].[social_media_links] ([id], [name], [icon], [link], [isActive], [sortOrder], [createdAt], [updatedAt]) VALUES (1, N'Facebook', N'fab fa-facebook-f', N'https://facebook.com/customerconnect', 1, 1, CAST(N'2025-07-25T16:52:26.3733333' AS DateTime2), CAST(N'2025-07-25T11:31:22.5000000' AS DateTime2))
GO
INSERT [dbo].[social_media_links] ([id], [name], [icon], [link], [isActive], [sortOrder], [createdAt], [updatedAt]) VALUES (2, N'Twitter', N'fab fa-twitter', N'https://twitter.com/customerconnect', 1, 2, CAST(N'2025-07-25T16:52:26.3733333' AS DateTime2), CAST(N'2025-07-25T11:38:29.7710000' AS DateTime2))
GO
INSERT [dbo].[social_media_links] ([id], [name], [icon], [link], [isActive], [sortOrder], [createdAt], [updatedAt]) VALUES (3, N'LinkedIn', N'fab fa-linkedin-in', N'https://linkedin.com/company/customerconnect', 1, 3, CAST(N'2025-07-25T16:52:26.3733333' AS DateTime2), CAST(N'2025-07-25T11:38:41.5060000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[social_media_links] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_invoice_to_delivery] ON 
GO
INSERT [dbo].[tbl_invoice_to_delivery] ([sl_no], [invoice_number], [invoice_date], [invoice_value], [invoice_value_inr], [dispatch_date], [lr_number], [delivery_partner], [delivered_date], [status], [created_date], [modified_date], [customer_code]) VALUES (1, N'INV-2025-009', CAST(N'2025-01-26T00:00:00.0000000+00:00' AS DateTimeOffset), N'2800.00', N'233200.00', CAST(N'2025-01-27T00:00:00.0000000+00:00' AS DateTimeOffset), N'LR-006-2025', N'Gati Express', CAST(N'2025-01-29T00:00:00.0000000+00:00' AS DateTimeOffset), N'delivered', CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[tbl_invoice_to_delivery] ([sl_no], [invoice_number], [invoice_date], [invoice_value], [invoice_value_inr], [dispatch_date], [lr_number], [delivery_partner], [delivered_date], [status], [created_date], [modified_date], [customer_code]) VALUES (2, N'INV-2025-010', CAST(N'2025-01-27T00:00:00.0000000+00:00' AS DateTimeOffset), N'1950.00', N'162350.00', CAST(N'2025-01-28T00:00:00.0000000+00:00' AS DateTimeOffset), N'LR-007-2025', N'Ecom Express', NULL, N'dispatched', CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[tbl_invoice_to_delivery] ([sl_no], [invoice_number], [invoice_date], [invoice_value], [invoice_value_inr], [dispatch_date], [lr_number], [delivery_partner], [delivered_date], [status], [created_date], [modified_date], [customer_code]) VALUES (3, N'INV-2025-011', CAST(N'2025-01-28T00:00:00.0000000+00:00' AS DateTimeOffset), N'675.00', N'56175.00', NULL, NULL, NULL, NULL, N'pending', CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[tbl_invoice_to_delivery] ([sl_no], [invoice_number], [invoice_date], [invoice_value], [invoice_value_inr], [dispatch_date], [lr_number], [delivery_partner], [delivered_date], [status], [created_date], [modified_date], [customer_code]) VALUES (4, N'INV-2025-012', CAST(N'2025-01-29T00:00:00.0000000+00:00' AS DateTimeOffset), N'3500.00', N'291500.00', CAST(N'2025-01-30T00:00:00.0000000+00:00' AS DateTimeOffset), N'LR-008-2025', N'India Post', CAST(N'2025-02-02T00:00:00.0000000+00:00' AS DateTimeOffset), N'delivered', CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[tbl_invoice_to_delivery] ([sl_no], [invoice_number], [invoice_date], [invoice_value], [invoice_value_inr], [dispatch_date], [lr_number], [delivery_partner], [delivered_date], [status], [created_date], [modified_date], [customer_code]) VALUES (5, N'INV-2025-013', CAST(N'2025-01-30T00:00:00.0000000+00:00' AS DateTimeOffset), N'890.00', N'74070.00', NULL, NULL, NULL, NULL, N'pending', CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[tbl_invoice_to_delivery] ([sl_no], [invoice_number], [invoice_date], [invoice_value], [invoice_value_inr], [dispatch_date], [lr_number], [delivery_partner], [delivered_date], [status], [created_date], [modified_date], [customer_code]) VALUES (6, N'INV-2025-014', CAST(N'2025-01-31T00:00:00.0000000+00:00' AS DateTimeOffset), N'5200.00', N'432800.00', CAST(N'2025-01-31T00:00:00.0000000+00:00' AS DateTimeOffset), N'LR-009-2025', N'Aramex', NULL, N'dispatched', CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[tbl_invoice_to_delivery] ([sl_no], [invoice_number], [invoice_date], [invoice_value], [invoice_value_inr], [dispatch_date], [lr_number], [delivery_partner], [delivered_date], [status], [created_date], [modified_date], [customer_code]) VALUES (7, N'INV-2025-015', CAST(N'2025-02-01T00:00:00.0000000+00:00' AS DateTimeOffset), N'1275.00', N'106175.00', CAST(N'2025-02-02T00:00:00.0000000+00:00' AS DateTimeOffset), N'LR-010-2025', N'Xpressbees', CAST(N'2025-02-04T00:00:00.0000000+00:00' AS DateTimeOffset), N'delivered', CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[tbl_invoice_to_delivery] ([sl_no], [invoice_number], [invoice_date], [invoice_value], [invoice_value_inr], [dispatch_date], [lr_number], [delivery_partner], [delivered_date], [status], [created_date], [modified_date], [customer_code]) VALUES (8, N'INV-2025-016', CAST(N'2025-02-02T00:00:00.0000000+00:00' AS DateTimeOffset), N'420.00', N'34980.00', NULL, NULL, NULL, NULL, N'pending', CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[tbl_invoice_to_delivery] ([sl_no], [invoice_number], [invoice_date], [invoice_value], [invoice_value_inr], [dispatch_date], [lr_number], [delivery_partner], [delivered_date], [status], [created_date], [modified_date], [customer_code]) VALUES (9, N'INV-2025-017', CAST(N'2025-02-03T00:00:00.0000000+00:00' AS DateTimeOffset), N'6800.00', N'566200.00', CAST(N'2025-02-03T00:00:00.0000000+00:00' AS DateTimeOffset), N'LR-011-2025', N'SafeExpress', NULL, N'dispatched', CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[tbl_invoice_to_delivery] ([sl_no], [invoice_number], [invoice_date], [invoice_value], [invoice_value_inr], [dispatch_date], [lr_number], [delivery_partner], [delivered_date], [status], [created_date], [modified_date], [customer_code]) VALUES (10, N'INV-2025-018', CAST(N'2025-02-04T00:00:00.0000000+00:00' AS DateTimeOffset), N'990.00', N'82470.00', CAST(N'2025-02-05T00:00:00.0000000+00:00' AS DateTimeOffset), N'LR-012-2025', N'First Flight', CAST(N'2025-02-07T00:00:00.0000000+00:00' AS DateTimeOffset), N'delivered', CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[tbl_invoice_to_delivery] ([sl_no], [invoice_number], [invoice_date], [invoice_value], [invoice_value_inr], [dispatch_date], [lr_number], [delivery_partner], [delivered_date], [status], [created_date], [modified_date], [customer_code]) VALUES (11, N'INV-2025-019', CAST(N'2025-02-05T00:00:00.0000000+00:00' AS DateTimeOffset), N'3150.00', N'262350.00', NULL, NULL, NULL, NULL, N'pending', CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), NULL)
GO
INSERT [dbo].[tbl_invoice_to_delivery] ([sl_no], [invoice_number], [invoice_date], [invoice_value], [invoice_value_inr], [dispatch_date], [lr_number], [delivery_partner], [delivered_date], [status], [created_date], [modified_date], [customer_code]) VALUES (12, N'INV-2025-020', CAST(N'2025-02-06T00:00:00.0000000+00:00' AS DateTimeOffset), N'7500.00', N'624500.00', CAST(N'2025-02-06T00:00:00.0000000+00:00' AS DateTimeOffset), N'LR-013-2025', N'Delhivery', NULL, N'dispatched', CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:07:03.9560000+00:00' AS DateTimeOffset), NULL)
GO
SET IDENTITY_INSERT [dbo].[tbl_invoice_to_delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_login_log] ON 
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (1, 1, CAST(N'2025-07-24T18:37:04.6010000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (2, 1, CAST(N'2025-07-24T19:33:20.1540000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (3, 1, CAST(N'2025-07-24T19:37:58.3760000+00:00' AS DateTimeOffset), CAST(N'2025-07-24T19:42:32.0920000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (4, 4, CAST(N'2025-07-24T19:42:44.8660000+00:00' AS DateTimeOffset), CAST(N'2025-07-24T19:44:46.2680000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (5, 1, CAST(N'2025-07-24T19:44:56.3150000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (6, 1, CAST(N'2025-07-24T19:59:12.1290000+00:00' AS DateTimeOffset), CAST(N'2025-07-24T20:16:33.9100000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (7, 1, CAST(N'2025-07-24T20:16:39.9600000+00:00' AS DateTimeOffset), CAST(N'2025-07-24T20:24:18.6910000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (8, 1, CAST(N'2025-07-24T20:24:27.2100000+00:00' AS DateTimeOffset), CAST(N'2025-07-24T20:27:46.1460000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (9, 1, CAST(N'2025-07-24T20:27:59.1190000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (10, 1, CAST(N'2025-07-25T05:13:40.5770000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T05:24:48.7650000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (11, 1, CAST(N'2025-07-25T05:24:51.3510000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:58:47.6170000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (12, 1, CAST(N'2025-07-25T11:01:13.6190000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T11:09:17.2950000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (13, 4, CAST(N'2025-07-25T11:09:29.4920000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T11:24:16.2690000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (14, 1, CAST(N'2025-07-25T11:24:18.4570000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T11:44:53.1480000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (15, 1, CAST(N'2025-07-25T11:48:23.5380000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (16, 1, CAST(N'2025-07-28T16:48:06.2100000+00:00' AS DateTimeOffset), CAST(N'2025-07-28T18:07:49.0580000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (17, 1, CAST(N'2025-07-28T16:51:20.0460000+00:00' AS DateTimeOffset), CAST(N'2025-07-28T17:39:32.3770000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (18, 4, CAST(N'2025-07-28T17:39:40.1570000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (19, 4, CAST(N'2025-07-28T18:07:59.6960000+00:00' AS DateTimeOffset), CAST(N'2025-07-28T18:09:27.3560000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (20, 1, CAST(N'2025-07-28T18:09:29.5340000+00:00' AS DateTimeOffset), CAST(N'2025-07-29T04:10:58.8820000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (21, 1, CAST(N'2025-07-29T04:11:01.5470000+00:00' AS DateTimeOffset), CAST(N'2025-07-29T10:14:42.6530000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (22, 4, CAST(N'2025-07-29T05:52:26.9870000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (23, 4, CAST(N'2025-07-29T06:27:28.2470000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (24, 4, CAST(N'2025-07-29T06:27:58.1210000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (25, 4, CAST(N'2025-07-29T06:28:28.5730000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (26, 4, CAST(N'2025-07-29T07:12:41.1060000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (27, 4, CAST(N'2025-07-29T07:13:14.2210000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (28, 4, CAST(N'2025-07-29T07:16:53.9000000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (29, 4, CAST(N'2025-07-29T07:17:28.1900000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (30, 4, CAST(N'2025-07-29T07:19:25.3740000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (31, 4, CAST(N'2025-07-29T07:24:27.0060000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (32, 4, CAST(N'2025-07-29T07:42:33.3320000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (33, 4, CAST(N'2025-07-29T07:45:28.2460000+00:00' AS DateTimeOffset), CAST(N'2025-07-29T15:50:25.3060000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (34, 1, CAST(N'2025-07-29T10:15:00.5360000+00:00' AS DateTimeOffset), CAST(N'2025-07-29T10:17:44.1670000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (35, 4, CAST(N'2025-07-29T10:17:53.0250000+00:00' AS DateTimeOffset), CAST(N'2025-07-29T10:18:15.1390000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (36, 1, CAST(N'2025-07-29T10:18:20.4690000+00:00' AS DateTimeOffset), CAST(N'2025-07-29T10:18:32.3590000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (37, 4, CAST(N'2025-07-29T10:18:36.4670000+00:00' AS DateTimeOffset), CAST(N'2025-07-29T10:25:02.8870000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (38, 1, CAST(N'2025-07-29T10:25:07.9830000+00:00' AS DateTimeOffset), CAST(N'2025-07-30T08:48:25.0340000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (39, 4, CAST(N'2025-07-29T15:50:36.7500000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (40, 4, CAST(N'2025-07-30T08:48:35.3380000+00:00' AS DateTimeOffset), CAST(N'2025-07-30T11:42:18.3260000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (41, 1, CAST(N'2025-07-30T11:42:23.5110000+00:00' AS DateTimeOffset), CAST(N'2025-07-30T11:45:10.9530000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (42, 1, CAST(N'2025-07-30T11:45:40.1330000+00:00' AS DateTimeOffset), CAST(N'2025-07-30T11:48:02.4750000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (43, 4, CAST(N'2025-07-30T11:48:07.0950000+00:00' AS DateTimeOffset), CAST(N'2025-07-30T11:48:58.2500000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (44, 4, CAST(N'2025-08-14T01:47:34.4010000+00:00' AS DateTimeOffset), CAST(N'2025-08-14T04:08:32.5850000+00:00' AS DateTimeOffset), N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (45, 4, CAST(N'2025-08-14T04:57:58.2790000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36')
GO
INSERT [dbo].[tbl_login_log] ([sl_no], [login_id], [login_datetime], [logout_datetime], [ip_address], [user_agent]) VALUES (46, 4, CAST(N'2025-08-19T07:09:21.3400000+00:00' AS DateTimeOffset), NULL, N'::1', N'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36')
GO
SET IDENTITY_INSERT [dbo].[tbl_login_log] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_market_research] ON 
GO
INSERT [dbo].[tbl_market_research] ([id], [research_number], [research_name], [research_title], [research_long_description], [video_link], [research_short_description], [research_image1], [research_image2], [document], [status], [priority], [created_date], [created_by], [modified_date], [modified_by], [customer_code]) VALUES (1, N'84551', N'Testing', N'ok', N'sdf', NULL, N'sdf', N'/uploads/market-research/1753432918489-802840459.png', N'/uploads/market-research/1753432918493-586302900.png', NULL, N'active', 0, CAST(N'2025-07-25T08:41:58.4990000+00:00' AS DateTimeOffset), N'admin', CAST(N'2025-07-25T08:41:58.4990000+00:00' AS DateTimeOffset), N'admin', NULL)
GO
SET IDENTITY_INSERT [dbo].[tbl_market_research] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_meeting_minutes] ON 
GO
INSERT [dbo].[tbl_meeting_minutes] ([id], [title], [meeting_date], [attendees], [agenda], [minutes], [action_items], [next_meeting_date], [status], [created_by], [created_date], [modified_date], [mom_number], [attachments], [customer_code]) VALUES (1, N'Testing', CAST(N'2025-07-26T00:00:00.0000000' AS DateTime2), N'["Selvam"]', N'ok', N'ok', N'[]', CAST(N'2025-07-26T00:00:00.0000000' AS DateTime2), N'finalized', 1, CAST(N'2025-07-25T07:43:38.7250000' AS DateTime2), CAST(N'2025-07-25T07:43:38.7250000' AS DateTime2), N'125896', N'[]', NULL)
GO
SET IDENTITY_INSERT [dbo].[tbl_meeting_minutes] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_news] ON 
GO
INSERT [dbo].[tbl_news] ([id], [news_number], [news_name], [news_title], [news_long_description], [news_short_description], [news_image1], [news_image2], [document], [status], [priority], [created_date], [created_by], [modified_date], [modified_by]) VALUES (1, N'NEWS001', N'Thovalai Flower Market Expansion', N'Huge shed coming up at Thovalai Flower Market', N'Kanniyakumari District Collector R. Alagumeena visited the flower market at Thovalai near here on Saturday and inspected the ongoing erection of the sprawling shed in the market at a cost of ₹2.12 crore. The new infrastructure will provide better facilities for flower traders and improve market conditions.', N'New shed construction at Thovalai Flower Market for ₹2.12 crore.', N'/uploads/news1.jpg', N'/uploads/news2.jpg', N'/uploads/news_doc1.pdf', N'active', 1, CAST(N'2025-07-24T18:32:29.1420000+00:00' AS DateTimeOffset), N'admin', CAST(N'2025-07-24T18:32:29.1420000+00:00' AS DateTimeOffset), N'admin')
GO
INSERT [dbo].[tbl_news] ([id], [news_number], [news_name], [news_title], [news_long_description], [news_short_description], [news_image1], [news_image2], [document], [status], [priority], [created_date], [created_by], [modified_date], [modified_by]) VALUES (2, N'NEWS002', N'Jasmine Market Growth', N'Rising demand for jasmine flowers in Indian markets', N'Demand for fresh jasmine flowers has skyrocketed in 2023, due in part to the increasing size and frequency of public gatherings across India. More people gathered. More celebrations happened. And with that, came a higher demand for fresh jasmine flowers.', N'Increased demand for jasmine flowers in 2023.', N'/uploads/jasmine_market1.jpg', N'/uploads/jasmine_market2.jpg', NULL, N'active', 2, CAST(N'2025-07-24T18:32:29.1420000+00:00' AS DateTimeOffset), N'admin', CAST(N'2025-07-24T18:32:29.1420000+00:00' AS DateTimeOffset), N'admin')
GO
SET IDENTITY_INSERT [dbo].[tbl_news] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_page_log] ON 
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1, 1, N'/api/news/latest?limit=3', CAST(N'2025-07-24T18:37:04.9020000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (2, 1, N'/api/market-research/latest?limit=2', CAST(N'2025-07-24T18:37:04.9270000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (3, 1, N'/api/invoices/stats', CAST(N'2025-07-24T18:37:04.9500000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (4, 1, N'/api/market-research/latest?limit=2', CAST(N'2025-07-24T18:37:05.2580000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (5, 1, N'/api/news/latest?limit=3', CAST(N'2025-07-24T18:37:05.2930000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (6, 1, N'/api/invoices/stats', CAST(N'2025-07-24T18:37:05.4000000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (7, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-24T18:37:14.5890000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (8, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-24T18:37:14.8430000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (9, 1, N'/api/invoices/stats', CAST(N'2025-07-24T18:37:58.2370000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (10, 1, N'/api/market-research/latest?limit=2', CAST(N'2025-07-24T18:37:58.2430000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (11, 1, N'/api/news/latest?limit=3', CAST(N'2025-07-24T18:37:58.2510000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (12, 1, N'/api/market-research/latest?limit=2', CAST(N'2025-07-24T18:37:58.4490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (13, 1, N'/api/news/latest?limit=3', CAST(N'2025-07-24T18:37:58.4790000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (14, 1, N'/api/invoices/stats', CAST(N'2025-07-24T18:37:58.5050000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (15, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-24T19:45:55.4310000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (16, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-24T19:45:55.4930000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (17, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-24T20:17:12.7830000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (18, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-24T20:17:12.8340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (19, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-24T20:24:36.8170000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (20, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-24T20:24:36.8750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (21, 1, N'/api/products', CAST(N'2025-07-24T20:26:03.6070000+00:00' AS DateTimeOffset), N'no-session', N'POST')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (22, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-24T20:26:05.2800000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (23, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-24T20:26:05.4140000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (24, 1, N'/api/products/6', CAST(N'2025-07-24T20:26:11.9000000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (25, 1, N'/api/products/6', CAST(N'2025-07-24T20:26:12.0770000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (26, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-24T20:26:22.0560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (27, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-24T20:26:22.0930000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (28, 1, N'/api/products/5', CAST(N'2025-07-24T20:26:25.3910000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (29, 1, N'/api/products/5', CAST(N'2025-07-24T20:26:25.4230000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (30, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-24T20:26:35.7910000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (31, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-24T20:26:35.8180000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (32, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-24T20:27:35.0770000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (33, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-24T20:27:35.1180000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (34, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-24T20:28:45.5790000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (35, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-24T20:28:45.6170000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (36, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:25:06.7680000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (37, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:25:06.7970000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (38, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:25:40.7910000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (39, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:25:40.8190000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (40, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:27:46.5260000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (41, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:27:46.5530000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (42, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:32:46.7480000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (43, 1, N'/api/products?page=4&limit=10', CAST(N'2025-07-25T05:33:48.7580000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (44, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:33:49.8720000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (45, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:33:50.8900000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (46, 1, N'/api/products/1', CAST(N'2025-07-25T05:34:36.7590000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (47, 1, N'/api/products/1', CAST(N'2025-07-25T05:34:36.7940000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (48, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:34:45.1290000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (49, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:34:45.1580000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (50, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:35:37.3560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (51, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:35:37.3880000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (52, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:41:21.7510000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (53, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:42:27.9190000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (54, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:42:27.9500000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (55, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:42:37.0800000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (56, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:42:37.0980000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (57, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:46:39.6590000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (58, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:46:39.6900000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (59, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:46:52.9970000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (60, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:46:53.0310000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (61, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:49:41.8860000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (62, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:49:41.9390000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (63, 1, N'/api/products?page=1&limit=10&date_range=2025-07-24', CAST(N'2025-07-25T05:49:52.2700000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (64, 1, N'/api/products?page=1&limit=10&date_range=2025-07-25', CAST(N'2025-07-25T05:49:57.6460000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (65, 1, N'/api/products?page=1&limit=10&product_number=0989733832&date_range=2025-07-25', CAST(N'2025-07-25T05:50:18.1710000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (66, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:51:48.7670000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (67, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:51:48.8210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (68, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:59:57.6770000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (69, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T05:59:57.7140000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (70, 1, N'/api/products?page=1&limit=10&product_number=0989733832', CAST(N'2025-07-25T06:00:17.4960000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (71, 1, N'/api/products?page=1&limit=10&product_number=0989733832&product_name=Jasmine+Grandiflorum', CAST(N'2025-07-25T06:00:39.6600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (72, 1, N'/api/products?page=1&limit=10&product_name=Jasmine+Grandiflorum', CAST(N'2025-07-25T06:00:45.1350000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (73, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:03:04.8940000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (74, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:03:04.9280000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (75, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:03:24.7330000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (76, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:03:24.7620000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (77, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:04:04.8000000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (78, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:04:04.8310000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (79, 1, N'/api/products?page=1&limit=10&search=jas', CAST(N'2025-07-25T06:04:43.7650000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (80, 1, N'/api/products?page=1&limit=10&search=0989733832', CAST(N'2025-07-25T06:05:03.0290000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (81, 1, N'/api/products?page=1&limit=10&status=active', CAST(N'2025-07-25T06:05:08.7310000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (82, 1, N'/api/products?page=1&limit=10&status=inactive', CAST(N'2025-07-25T06:05:12.5270000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (83, 1, N'/api/products?page=1&limit=10&status=inactive', CAST(N'2025-07-25T06:05:22.7170000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (84, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:05:34.1180000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (85, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:05:41.7690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (86, 1, N'/api/products/6', CAST(N'2025-07-25T06:06:24.1330000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (87, 1, N'/api/products/6', CAST(N'2025-07-25T06:06:24.1640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (88, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:06:31.8270000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (89, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:06:31.8560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (90, 1, N'/api/products/1', CAST(N'2025-07-25T06:06:35.6170000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (91, 1, N'/api/products/1', CAST(N'2025-07-25T06:06:35.6370000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (92, 1, N'/api/products/1', CAST(N'2025-07-25T06:08:40.5480000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (93, 1, N'/api/products/1', CAST(N'2025-07-25T06:08:40.5760000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (94, 1, N'/api/products/1', CAST(N'2025-07-25T06:09:29.1480000+00:00' AS DateTimeOffset), N'no-session', N'PUT')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (95, 1, N'/api/products/1', CAST(N'2025-07-25T06:11:13.4690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (96, 1, N'/api/products/1', CAST(N'2025-07-25T06:11:13.4960000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (97, 1, N'/api/products/1', CAST(N'2025-07-25T06:11:24.9600000+00:00' AS DateTimeOffset), N'no-session', N'PUT')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (98, 1, N'/api/products/1', CAST(N'2025-07-25T06:15:21.7640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (99, 1, N'/api/products/1', CAST(N'2025-07-25T06:16:40.3230000+00:00' AS DateTimeOffset), N'no-session', N'PUT')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (100, 1, N'/api/products/1', CAST(N'2025-07-25T06:18:16.0400000+00:00' AS DateTimeOffset), N'no-session', N'PUT')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (101, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:18:17.6570000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (102, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:18:17.7010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (103, 1, N'/api/products/1', CAST(N'2025-07-25T06:18:20.5560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (104, 1, N'/api/products/1', CAST(N'2025-07-25T06:18:20.5790000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (105, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:18:28.0140000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (106, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:18:28.0610000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (107, 1, N'/api/products/1', CAST(N'2025-07-25T06:18:30.9270000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (108, 1, N'/api/products/1', CAST(N'2025-07-25T06:18:30.9490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (109, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:19:41.3560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (110, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:19:41.3880000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (111, 1, N'/api/products/1', CAST(N'2025-07-25T06:22:05.9090000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (112, 1, N'/api/products/1', CAST(N'2025-07-25T06:22:05.9440000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (113, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:22:35.7100000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (114, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:22:35.7430000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (115, 1, N'/api/products/1', CAST(N'2025-07-25T06:22:38.2100000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (116, 1, N'/api/products/1', CAST(N'2025-07-25T06:22:38.2340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (117, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:22:44.7060000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (118, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:22:44.7390000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (119, 1, N'/api/products/1', CAST(N'2025-07-25T06:22:47.9590000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (120, 1, N'/api/products/1', CAST(N'2025-07-25T06:22:47.9740000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (121, 1, N'/api/products/1', CAST(N'2025-07-25T06:23:13.1580000+00:00' AS DateTimeOffset), N'no-session', N'PUT')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (122, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:23:14.7120000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (123, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:23:14.7320000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (124, 1, N'/api/products/1', CAST(N'2025-07-25T06:23:16.6390000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (125, 1, N'/api/products/1', CAST(N'2025-07-25T06:23:16.6570000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (126, 1, N'/api/products/1', CAST(N'2025-07-25T06:27:49.2560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (127, 1, N'/api/products/1', CAST(N'2025-07-25T06:27:49.2910000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (128, 1, N'/api/products/1', CAST(N'2025-07-25T06:29:33.7010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (129, 1, N'/api/products/1', CAST(N'2025-07-25T06:29:33.7370000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (130, 1, N'/api/products/1', CAST(N'2025-07-25T06:29:45.8420000+00:00' AS DateTimeOffset), N'no-session', N'PUT')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (131, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:29:47.4210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (132, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:29:47.4510000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (133, 1, N'/api/products/1', CAST(N'2025-07-25T06:29:50.4340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (134, 1, N'/api/products/1', CAST(N'2025-07-25T06:29:50.4520000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (135, 1, N'/api/products/1', CAST(N'2025-07-25T06:30:06.4200000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (136, 1, N'/api/products/1', CAST(N'2025-07-25T06:30:06.4440000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (137, 1, N'/api/products/1', CAST(N'2025-07-25T06:30:28.5810000+00:00' AS DateTimeOffset), N'no-session', N'PUT')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (138, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:30:30.1490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (139, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:30:30.1690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (140, 1, N'/api/products/1', CAST(N'2025-07-25T06:30:32.9220000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (141, 1, N'/api/products/1', CAST(N'2025-07-25T06:30:32.9370000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (142, 1, N'/api/products/1', CAST(N'2025-07-25T06:35:10.7980000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (143, 1, N'/api/products/1', CAST(N'2025-07-25T06:36:58.9110000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (144, 1, N'/api/products/1', CAST(N'2025-07-25T06:36:58.9500000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (145, 1, N'/api/products/1', CAST(N'2025-07-25T06:37:12.4880000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (146, 1, N'/api/products/1', CAST(N'2025-07-25T06:37:12.4970000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (147, 1, N'/api/products/1', CAST(N'2025-07-25T06:40:23.6040000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (148, 1, N'/api/products/1', CAST(N'2025-07-25T06:40:23.6680000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (149, 1, N'/api/products/1', CAST(N'2025-07-25T06:40:47.2610000+00:00' AS DateTimeOffset), N'no-session', N'PUT')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (150, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:40:48.8300000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (151, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:40:48.8580000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (152, 1, N'/api/products/1', CAST(N'2025-07-25T06:40:53.8410000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (153, 1, N'/api/products/1', CAST(N'2025-07-25T06:40:53.8540000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (154, 1, N'/api/products/1', CAST(N'2025-07-25T06:42:07.0380000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (155, 1, N'/api/products/1', CAST(N'2025-07-25T06:42:07.0730000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (156, 1, N'/api/products/1', CAST(N'2025-07-25T06:42:51.1820000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (157, 1, N'/api/products/1', CAST(N'2025-07-25T06:42:51.2070000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (158, 1, N'/api/products/1', CAST(N'2025-07-25T06:43:22.0480000+00:00' AS DateTimeOffset), N'no-session', N'PUT')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (159, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:43:23.6690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (160, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:43:23.7210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (161, 1, N'/api/products/1', CAST(N'2025-07-25T06:43:26.4440000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (162, 1, N'/api/products/1', CAST(N'2025-07-25T06:43:26.4760000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (163, 1, N'/api/products/1', CAST(N'2025-07-25T06:43:31.5060000+00:00' AS DateTimeOffset), N'no-session', N'PUT')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (164, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:43:33.0680000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (165, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:43:33.0880000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (166, 1, N'/api/products/6', CAST(N'2025-07-25T06:43:36.0620000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (167, 1, N'/api/products/6', CAST(N'2025-07-25T06:43:36.0770000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (168, 1, N'/api/products/6', CAST(N'2025-07-25T06:43:42.8910000+00:00' AS DateTimeOffset), N'no-session', N'PUT')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (169, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:43:44.4470000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (170, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:43:44.4680000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (171, 1, N'/api/products/1', CAST(N'2025-07-25T06:43:49.7290000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (172, 1, N'/api/products/1', CAST(N'2025-07-25T06:43:49.7590000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (173, 1, N'/api/products/1', CAST(N'2025-07-25T06:43:52.8100000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (174, 1, N'/api/products/1', CAST(N'2025-07-25T06:43:52.8260000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (175, 1, N'/api/products/1', CAST(N'2025-07-25T06:45:49.6300000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (176, 1, N'/api/products/1', CAST(N'2025-07-25T06:45:49.6550000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (177, 1, N'/api/products/1', CAST(N'2025-07-25T06:45:51.6750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (178, 1, N'/api/products/1', CAST(N'2025-07-25T06:45:51.6950000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (179, 1, N'/api/products/1', CAST(N'2025-07-25T06:45:52.4850000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (180, 1, N'/api/products/1', CAST(N'2025-07-25T06:45:52.5060000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (181, 1, N'/api/products/1', CAST(N'2025-07-25T06:45:58.3260000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (182, 1, N'/api/products/1', CAST(N'2025-07-25T06:45:58.3470000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (183, 1, N'/api/products/1', CAST(N'2025-07-25T06:46:20.2020000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (184, 1, N'/api/products/1', CAST(N'2025-07-25T06:46:20.2220000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (185, 1, N'/api/products/1', CAST(N'2025-07-25T06:46:30.7420000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (186, 1, N'/api/products/1', CAST(N'2025-07-25T06:46:30.7570000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (187, 1, N'/api/products/1', CAST(N'2025-07-25T06:46:39.5370000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (188, 1, N'/api/products/1', CAST(N'2025-07-25T06:46:39.5590000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (189, 1, N'/api/products/1', CAST(N'2025-07-25T06:46:45.7340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (190, 1, N'/api/products/1', CAST(N'2025-07-25T06:49:11.7400000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (191, 1, N'/api/products/1', CAST(N'2025-07-25T06:49:11.8240000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (192, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:50:04.8380000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (193, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:50:04.8890000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (194, 1, N'/api/products/1', CAST(N'2025-07-25T06:50:07.1680000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (195, 1, N'/api/products/1', CAST(N'2025-07-25T06:50:07.2000000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (196, 1, N'/api/products/1', CAST(N'2025-07-25T06:51:28.7670000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (197, 1, N'/api/products/1', CAST(N'2025-07-25T06:52:52.4600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (198, 1, N'/api/products/1', CAST(N'2025-07-25T06:52:52.4920000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (199, 1, N'/api/products/1', CAST(N'2025-07-25T06:53:55.7090000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (200, 1, N'/api/products/1', CAST(N'2025-07-25T06:53:55.7410000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (201, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:54:00.7330000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (202, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:54:00.7660000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (203, 1, N'/api/products/1', CAST(N'2025-07-25T06:54:52.9480000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (204, 1, N'/api/products/1', CAST(N'2025-07-25T06:54:52.9820000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (205, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:55:04.6950000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (206, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:55:04.7280000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (207, 1, N'/api/products?page=1&limit=10&search=sf', CAST(N'2025-07-25T06:55:12.6820000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (208, 1, N'/api/products?page=1&limit=10&search=sf', CAST(N'2025-07-25T06:55:16.8160000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (209, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:55:19.4980000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (210, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:55:31.1230000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (211, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T06:55:31.1600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (212, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T07:13:05.3530000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (213, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T07:13:05.3900000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (214, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T07:23:30.2420000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (215, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T07:23:30.2730000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (216, 1, N'/api/market-research?page=1&limit=10&search=&category=&status=', CAST(N'2025-07-25T08:24:48.7850000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (217, 1, N'/api/market-research?page=1&limit=10&search=&category=&status=', CAST(N'2025-07-25T08:24:48.8210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (218, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T08:26:40.7540000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (219, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T08:30:35.6490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (220, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T08:30:35.6870000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (221, 1, N'/api/market-research', CAST(N'2025-07-25T08:37:25.7290000+00:00' AS DateTimeOffset), N'no-session', N'POST')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (222, 1, N'/api/market-research', CAST(N'2025-07-25T08:38:24.1680000+00:00' AS DateTimeOffset), N'no-session', N'POST')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (223, 1, N'/api/market-research', CAST(N'2025-07-25T08:38:33.7420000+00:00' AS DateTimeOffset), N'no-session', N'POST')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (224, 1, N'/api/market-research', CAST(N'2025-07-25T08:40:06.3800000+00:00' AS DateTimeOffset), N'no-session', N'POST')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (225, 1, N'/api/market-research', CAST(N'2025-07-25T08:41:58.4660000+00:00' AS DateTimeOffset), N'no-session', N'POST')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (226, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T08:41:58.5920000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (227, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T08:41:58.6340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (228, 1, N'/api/market-research/1', CAST(N'2025-07-25T08:42:01.6070000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (229, 1, N'/api/market-research/1', CAST(N'2025-07-25T08:42:01.6410000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (230, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T08:42:05.6300000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (231, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T08:42:05.6620000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (232, 1, N'/api/market-research/1', CAST(N'2025-07-25T08:42:07.6120000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (233, 1, N'/api/market-research/1', CAST(N'2025-07-25T08:42:07.6370000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (234, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T08:42:16.8390000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (235, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T08:42:16.8700000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (236, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T08:49:54.9260000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (237, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T08:49:54.9870000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (238, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T09:37:19.1950000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (239, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T09:37:19.2640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (240, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T09:37:21.1950000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (241, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T09:37:21.2300000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (242, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T09:37:56.6590000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (243, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T09:37:56.6940000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (244, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T09:56:59.2190000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (245, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T09:56:59.2500000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (246, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T09:57:31.6330000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (247, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T09:57:31.6490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (248, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T09:57:37.2580000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (249, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T09:57:37.2840000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (250, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T09:58:15.4090000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (251, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T09:58:15.4540000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (252, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T09:59:59.0860000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (253, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T09:59:59.1190000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (254, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:00:14.6100000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (255, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:00:14.6380000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (256, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:00:22.6800000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (257, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:00:22.7030000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (258, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T10:00:59.8200000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (259, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T10:00:59.8530000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (260, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:01:14.6900000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (261, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:01:14.7090000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (262, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:01:19.2070000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (263, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:01:19.2300000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (264, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:13:58.0750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (265, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:13:58.1210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (266, 1, N'/api/statements/10', CAST(N'2025-07-25T10:14:00.9520000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (267, 1, N'/api/statements/10', CAST(N'2025-07-25T10:14:00.9850000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (268, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:14:06.4250000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (269, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:14:06.4460000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (270, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:19:38.2850000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (271, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:19:38.3190000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (272, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:20:16.0860000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (273, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:20:16.1170000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (274, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:21:28.2580000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (275, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:21:28.3060000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (276, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:23:20.3300000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (277, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:23:20.3790000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (278, 1, N'/api/statements/10', CAST(N'2025-07-25T10:23:23.6350000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (279, 1, N'/api/statements/10', CAST(N'2025-07-25T10:23:23.6650000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (280, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T10:23:52.0900000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (281, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T10:23:52.1170000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (282, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:23:57.4340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (283, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:23:57.4660000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (284, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:23:58.3520000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (285, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:23:58.3750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (286, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:23:59.9530000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (287, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:23:59.9790000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (288, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:24:07.6520000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (289, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:24:07.6940000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (290, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:25:16.4440000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (291, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:25:16.4730000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (292, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T10:25:25.8810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (293, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T10:25:41.8860000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (294, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T10:25:41.9420000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (295, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T10:25:56.1850000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (296, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T10:25:56.2120000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (297, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:26:15.6240000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (298, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:26:15.6520000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (299, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:26:18.8300000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (300, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:26:18.8640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (301, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T10:26:34.5400000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (302, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T10:26:34.5940000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (303, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:29:03.0380000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (304, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:29:03.0700000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (305, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:31:06.0380000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (306, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:31:06.0780000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (307, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T10:35:26.8270000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (308, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T10:35:26.9000000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (309, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:35:32.0320000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (310, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:35:32.0710000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (311, 1, N'/api/statements/10', CAST(N'2025-07-25T10:35:35.5250000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (312, 1, N'/api/statements/10', CAST(N'2025-07-25T10:35:35.5560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (313, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:35:39.5780000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (314, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T10:35:39.6010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (315, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T11:02:01.6210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (316, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T11:02:01.6690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (317, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T11:02:11.0950000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (318, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T11:02:11.1200000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (319, 1, N'/api/products/1', CAST(N'2025-07-25T11:02:13.9390000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (320, 1, N'/api/products/1', CAST(N'2025-07-25T11:02:13.9660000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (321, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T11:02:21.5930000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (322, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T11:02:21.6150000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (323, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T11:03:34.8080000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (324, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T11:03:34.8420000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (325, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T11:03:44.8580000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (326, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-25T11:03:44.8870000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (327, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T11:03:46.6570000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (328, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-25T11:03:46.6990000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (329, 1, N'/api/statements/10', CAST(N'2025-07-25T11:03:50.4490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (330, 1, N'/api/statements/10', CAST(N'2025-07-25T11:03:50.4750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (331, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T11:44:39.2750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (332, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-25T11:44:39.3240000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (333, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T16:55:31.0390000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (334, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T16:55:31.0870000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (335, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T16:55:58.5030000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (336, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T16:55:58.5450000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (337, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-28T16:56:19.7650000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (338, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-28T16:56:19.8070000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (339, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-28T16:56:29.8080000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (340, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-28T16:56:29.8360000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (341, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-28T16:56:36.9490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (342, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-28T16:56:36.9890000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (343, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:06:55.0840000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (344, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:06:55.1160000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (345, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:11:18.8340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (346, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:11:18.8660000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (347, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:11:49.5400000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (348, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:11:49.6150000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (349, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:12:10.5720000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (350, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:12:10.6110000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (351, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:12:11.6300000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (352, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:12:11.6500000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (353, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:12:12.2510000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (354, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:12:12.2740000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (355, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:12:12.7400000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (356, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:12:12.7620000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (357, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:12:13.2210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (358, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:12:13.2400000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (359, 1, N'/api/products/1', CAST(N'2025-07-28T17:12:14.5420000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (360, 1, N'/api/products/1', CAST(N'2025-07-28T17:12:14.5770000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (361, 1, N'/api/products/1', CAST(N'2025-07-28T17:12:26.6260000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (362, 1, N'/api/products/1', CAST(N'2025-07-28T17:12:26.6430000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (363, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:12:30.4750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (364, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:12:30.5460000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (365, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:12:37.5500000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (366, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:12:37.6040000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (367, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:12:38.3910000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (368, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:12:38.4150000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (369, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:12:43.0520000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (370, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:12:43.0750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (371, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:13:50.1870000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (372, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:13:50.2260000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (373, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:13:50.9900000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (374, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:13:51.0110000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (375, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:14:00.3820000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (376, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:14:00.4130000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (377, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:14:01.4110000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (378, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:14:01.4360000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (379, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:14:14.9520000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (380, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:14:14.9710000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (381, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:14:20.2260000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (382, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:14:20.2460000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (383, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-28T17:14:25.6170000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (384, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-28T17:14:25.6450000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (385, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-28T17:28:25.2340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (386, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-28T17:28:25.2650000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (387, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-28T17:28:29.3670000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (388, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-28T17:28:29.3920000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (389, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-28T17:30:16.6660000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (390, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-28T17:30:16.7000000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (391, 1, N'/api/statements/10', CAST(N'2025-07-28T17:30:18.5360000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (392, 1, N'/api/statements/10', CAST(N'2025-07-28T17:30:18.5590000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (393, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-28T17:30:26.2310000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (394, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-28T17:30:26.2490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (395, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:40:27.8170000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (396, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-28T17:40:27.8620000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (397, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-28T17:42:57.8490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (398, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-28T17:42:57.8850000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (399, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-28T17:51:48.4740000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (400, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-28T17:51:48.5160000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (401, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-28T17:51:50.6610000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (402, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-28T17:51:50.6770000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (403, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-28T18:03:47.2190000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (404, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-28T18:03:47.3110000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (405, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:04:43.8430000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (406, 4, N'/api/market-research?limit=2&sort=created_date&order=desc', CAST(N'2025-07-28T18:04:43.8530000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (407, 4, N'/api/market-research?limit=2&sort=created_date&order=desc', CAST(N'2025-07-28T18:04:44.0350000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (408, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:04:44.0700000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (409, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-28T18:07:36.7100000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (410, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-28T18:07:36.7930000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (411, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:07:59.9110000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (412, 4, N'/api/market-research?limit=2&sort=created_date&order=desc', CAST(N'2025-07-28T18:07:59.9350000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (413, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:08:00.1010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (414, 4, N'/api/market-research?limit=2&sort=created_date&order=desc', CAST(N'2025-07-28T18:08:00.1120000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (415, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-28T18:08:12.0590000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (416, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-28T18:08:12.0940000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (417, 4, N'/api/products?page=1&limit=10&sort=category&order=asc', CAST(N'2025-07-28T18:08:23.1220000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (418, 4, N'/api/products?page=1&limit=10&sort=category&order=desc', CAST(N'2025-07-28T18:08:25.3610000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (419, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-28T18:08:31.9860000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (420, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-28T18:08:32.0690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (421, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:08:36.1730000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (422, 4, N'/api/market-research?limit=2&sort=created_date&order=desc', CAST(N'2025-07-28T18:08:36.1760000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (423, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:08:36.2450000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (424, 4, N'/api/market-research?limit=2&sort=created_date&order=desc', CAST(N'2025-07-28T18:08:36.2590000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (425, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-28T18:08:48.0610000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (426, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-28T18:08:48.0830000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (427, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:08:49.4210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (428, 4, N'/api/market-research?limit=2&sort=created_date&order=desc', CAST(N'2025-07-28T18:08:49.4240000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (429, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:08:49.4830000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (430, 4, N'/api/market-research?limit=2&sort=created_date&order=desc', CAST(N'2025-07-28T18:08:49.4880000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (431, 4, N'/api/market-research?limit=2&sort=created_date&order=desc', CAST(N'2025-07-28T18:09:24.3130000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (432, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:09:24.3190000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (433, 4, N'/api/market-research?limit=2&sort=created_date&order=desc', CAST(N'2025-07-28T18:09:24.4490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (434, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:09:24.4630000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (435, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:10:47.5950000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (436, 4, N'/api/market-research?limit=2&sort=created_date&order=desc', CAST(N'2025-07-28T18:10:47.5990000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (437, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:10:47.6510000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (438, 4, N'/api/market-research?limit=2&sort=created_date&order=desc', CAST(N'2025-07-28T18:10:47.6600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (439, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:11:15.7600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (440, 4, N'/api/market-research?limit=2&sort=created_date&order=desc', CAST(N'2025-07-28T18:11:15.7750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (441, 4, N'/api/market-research?limit=2&sort=created_date&order=desc', CAST(N'2025-07-28T18:11:15.9070000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (442, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:11:15.9250000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (443, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:11:33.8210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (444, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:11:33.8560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (445, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:12:06.6070000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (446, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:12:06.6110000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (447, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:12:06.6720000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (448, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:12:06.6830000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (449, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:12:54.3520000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (450, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:12:54.3590000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (451, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:12:54.3940000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (452, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:12:54.4130000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (453, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:13:28.0200000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (454, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:13:28.0710000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (455, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:13:28.1740000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (456, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:13:28.1810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (457, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:13:41.2020000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (458, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:13:41.2130000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (459, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:13:41.3420000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (460, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:13:41.3520000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (461, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:13:48.1340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (462, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:13:48.1400000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (463, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:13:48.1970000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (464, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:13:48.2050000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (465, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:14:12.4960000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (466, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:14:12.5010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (467, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:14:12.5810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (468, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:14:12.5900000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (469, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-28T18:14:23.3390000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (470, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-28T18:14:23.3700000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (471, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-28T18:14:48.0650000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (472, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-28T18:14:48.0910000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (473, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:14:54.0060000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (474, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:14:54.0120000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (475, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:14:54.0970000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (476, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:14:54.1070000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (477, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:15:00.1730000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (478, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:15:00.1800000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (479, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:15:00.2680000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (480, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:15:00.2810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (481, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:16:01.0070000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (482, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:16:01.0250000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (483, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:16:01.1830000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (484, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:16:01.2130000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (485, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:16:08.7000000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (486, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:16:08.7060000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (487, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:16:08.8010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (488, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:16:08.8760000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (489, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:16:17.3120000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (490, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:16:17.3160000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (491, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:16:17.3640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (492, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:16:17.3700000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (493, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-28T18:16:21.9210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (494, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-28T18:16:21.9470000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (495, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-28T18:16:31.8840000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (496, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-28T18:16:31.9040000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (497, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:16:33.6790000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (498, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:16:33.6840000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (499, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:16:33.7690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (500, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:16:33.7860000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (501, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:17:04.1400000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (502, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:17:04.2160000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (503, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:17:04.2640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (504, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:17:04.3160000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (505, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:17:28.8690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (506, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:17:28.9130000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (507, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:17:29.0340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (508, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:17:29.0720000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (509, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-28T18:17:34.4350000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (510, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-28T18:17:34.4880000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (511, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:19:01.8520000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (512, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:19:01.8780000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (513, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:19:02.0180000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (514, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-28T18:19:02.0350000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (515, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T03:56:38.9960000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (516, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T03:56:39.0030000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (517, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T03:56:39.1530000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (518, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T03:56:39.1620000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (519, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T03:59:07.4680000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (520, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T03:59:07.5210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (521, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T03:59:19.3400000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (522, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T03:59:19.3720000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (523, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-29T03:59:22.0810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (524, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-29T03:59:22.1170000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (525, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T03:59:42.3690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (526, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T03:59:42.4320000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (527, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T04:00:08.7290000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (528, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T04:00:08.7340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (529, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T04:00:08.7770000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (530, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T04:00:08.7920000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (531, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-29T04:00:21.8990000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (532, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-29T04:00:21.9280000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (533, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T04:00:23.2560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (534, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T04:00:23.2590000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (535, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T04:00:23.3330000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (536, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T04:00:23.3420000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (537, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:04:10.4320000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (538, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:04:10.4630000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (539, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:06:48.9930000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (540, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:06:49.0340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (541, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:06:55.2770000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (542, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:06:55.3050000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (543, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:07:15.2800000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (544, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:07:15.3250000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (545, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:09:07.1190000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (546, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:09:07.1540000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (547, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:09:21.6570000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (548, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:09:21.6600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (549, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:10:54.8920000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (550, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:10:54.9350000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (551, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:11:06.2790000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (552, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:11:06.3010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (553, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:12:53.7200000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (554, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:12:53.7430000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (555, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:14:19.5710000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (556, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:14:19.5930000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (557, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:14:21.9090000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (558, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:14:21.9330000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (559, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:16:05.9960000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (560, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:16:06.0550000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (561, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:16:36.7920000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (562, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:16:36.8190000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (563, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:16:58.7570000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (564, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:16:58.7780000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (565, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:17:10.7160000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (566, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:17:10.7360000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (567, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:17:51.9570000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (568, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:17:51.9860000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (569, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:17:54.2390000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (570, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:17:54.2620000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (571, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:19:32.3330000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (572, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:19:32.3630000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (573, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:19:39.9640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (574, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:19:40.0150000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (575, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-29T04:19:45.3760000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (576, 4, N'/api/products?page=1&limit=10&sort=product_name&order=asc', CAST(N'2025-07-29T04:19:45.4010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (577, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:22:19.4670000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (578, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:22:19.5060000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (579, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:22:39.7630000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (580, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:22:39.7900000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (581, 1, N'/api/products/1', CAST(N'2025-07-29T04:22:43.0450000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (582, 1, N'/api/products/1', CAST(N'2025-07-29T04:22:43.1250000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (583, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:22:47.2230000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (584, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:22:47.2580000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (585, 4, N'/api/products/1', CAST(N'2025-07-29T04:24:50.2230000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (586, 4, N'/api/products/1', CAST(N'2025-07-29T04:24:50.2620000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (587, 4, N'/api/products/1', CAST(N'2025-07-29T04:25:43.2070000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (588, 4, N'/api/products/1', CAST(N'2025-07-29T04:25:43.2430000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (589, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:26:05.2720000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (590, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:26:05.3070000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (591, 4, N'/api/products/3', CAST(N'2025-07-29T04:26:07.9760000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (592, 4, N'/api/products/3', CAST(N'2025-07-29T04:26:08.0070000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (593, 4, N'/api/products/3', CAST(N'2025-07-29T04:58:36.9690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (594, 4, N'/api/products/3', CAST(N'2025-07-29T04:58:37.0610000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (595, 1, N'/api/products/1', CAST(N'2025-07-29T04:59:04.0060000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (596, 1, N'/api/products/1', CAST(N'2025-07-29T04:59:04.0430000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (597, 1, N'/api/products/1', CAST(N'2025-07-29T04:59:08.3150000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (598, 1, N'/api/products/1', CAST(N'2025-07-29T04:59:08.3520000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (599, 1, N'/api/products/1', CAST(N'2025-07-29T04:59:23.0120000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (600, 1, N'/api/products/1', CAST(N'2025-07-29T04:59:23.0470000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (601, 1, N'/api/products/1', CAST(N'2025-07-29T04:59:30.7400000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (602, 1, N'/api/products/1', CAST(N'2025-07-29T04:59:30.7630000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (603, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:59:46.3340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (604, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T04:59:46.3810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (605, 1, N'/api/products/1', CAST(N'2025-07-29T05:00:06.2020000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (606, 1, N'/api/products/1', CAST(N'2025-07-29T05:00:06.2250000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (607, 4, N'/api/products/3', CAST(N'2025-07-29T05:01:16.5790000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (608, 4, N'/api/products/3', CAST(N'2025-07-29T05:01:16.6100000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (609, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T05:01:18.8950000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (610, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T05:01:18.9440000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (611, 4, N'/api/products/1', CAST(N'2025-07-29T05:01:22.1420000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (612, 4, N'/api/products/1', CAST(N'2025-07-29T05:01:22.1790000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (613, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T05:01:26.9870000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (614, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T05:01:27.0190000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (615, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T05:02:05.9340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (616, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T05:02:05.9760000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (617, 4, N'/api/products/1', CAST(N'2025-07-29T05:02:08.4220000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (618, 4, N'/api/products/1', CAST(N'2025-07-29T05:02:08.4580000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (619, 1, N'/api/products/1', CAST(N'2025-07-29T05:02:16.6880000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (620, 1, N'/api/products/1', CAST(N'2025-07-29T05:02:16.7260000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (621, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:04:03.6490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (622, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:04:03.6530000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (623, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:04:03.7140000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (624, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:04:03.7280000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (625, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:45:08.3920000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (626, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:45:08.4080000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (627, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:45:08.5660000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (628, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:45:08.5760000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (629, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:46:08.0890000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (630, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:46:08.0950000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (631, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:46:08.1380000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (632, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:46:08.1560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (633, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:46:41.9450000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (634, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:46:41.9530000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (635, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:46:42.0110000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (636, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:46:42.0280000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (637, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:47:02.1510000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (638, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:47:02.1560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (639, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:47:02.2670000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (640, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:47:02.2760000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (641, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:47:28.5540000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (642, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:47:28.5600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (643, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:47:28.6150000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (644, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:47:28.6230000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (645, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:47:42.5380000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (646, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:47:42.5420000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (647, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:47:42.5800000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (648, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:47:42.5930000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (649, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:47:51.5010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (650, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:47:51.5040000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (651, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:47:51.5510000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (652, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:47:51.5660000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (653, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:48:08.5080000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (654, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:48:08.5150000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (655, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:48:08.5910000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (656, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:48:08.6120000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (657, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:48:17.1570000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (658, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:48:17.1610000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (659, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:48:17.1890000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (660, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T05:48:17.1960000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (661, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T06:31:01.2840000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (662, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T06:31:01.2880000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (663, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T06:31:01.3750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (664, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T06:31:01.3810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (665, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T06:34:54.2570000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (666, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T06:34:54.2630000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (667, 4, N'/api/news?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T06:34:54.3320000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (668, 4, N'/api/market-research?limit=3&sort=created_date&order=desc', CAST(N'2025-07-29T06:34:54.3500000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (669, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:34:55.9910000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (670, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:34:56.0320000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (671, 4, N'/api/products/1', CAST(N'2025-07-29T06:34:59.3530000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (672, 4, N'/api/products/1', CAST(N'2025-07-29T06:34:59.3760000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (673, 4, N'/api/products/1', CAST(N'2025-07-29T06:35:57.0480000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (674, 4, N'/api/products/1', CAST(N'2025-07-29T06:35:57.0880000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (675, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:35:58.6020000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (676, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:35:58.6310000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (677, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:36:02.8130000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (678, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:36:02.8270000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (679, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:36:12.2060000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (680, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:36:12.2690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (681, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:37:17.1390000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (682, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:37:17.2030000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (683, 1, N'/api/products/1', CAST(N'2025-07-29T06:37:19.2280000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (684, 1, N'/api/products/1', CAST(N'2025-07-29T06:37:19.2480000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (685, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:37:21.7020000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (686, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:37:21.7260000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (687, 1, N'/api/products/5', CAST(N'2025-07-29T06:37:23.0580000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (688, 1, N'/api/products/5', CAST(N'2025-07-29T06:37:23.0770000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (689, 1, N'/api/products/5', CAST(N'2025-07-29T06:37:30.2570000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (690, 1, N'/api/products/5', CAST(N'2025-07-29T06:37:30.2740000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (691, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:37:33.7490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (692, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:37:33.7630000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (693, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:37:36.4990000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (694, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:37:36.5320000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (695, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:37:45.6890000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (696, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:37:45.7040000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (697, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:38:13.9620000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (698, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T06:38:13.9830000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (699, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T07:50:52.3090000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (700, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T07:50:52.4210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (701, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T07:55:52.7170000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (702, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T07:55:52.8460000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (703, 4, N'/api/products/1', CAST(N'2025-07-29T07:55:59.8190000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (704, 4, N'/api/products/1', CAST(N'2025-07-29T07:55:59.8880000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (705, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T08:37:17.6970000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (706, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T08:37:17.7750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (707, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T08:37:30.1080000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (708, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T08:37:30.1610000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (709, 4, N'/api/products/1', CAST(N'2025-07-29T08:37:32.7000000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (710, 4, N'/api/products/1', CAST(N'2025-07-29T08:37:32.7360000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (711, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T08:37:37.3690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (712, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T08:37:37.3990000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (713, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T08:44:20.4460000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (714, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T08:44:21.0360000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (715, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T08:44:34.5390000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (716, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T08:44:34.6460000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (717, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T08:44:46.3880000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (718, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T08:44:46.4880000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (719, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T08:46:39.2310000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (720, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T08:46:39.4380000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (721, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T08:46:46.4750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (722, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T08:46:46.5110000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (731, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:14:44.7220000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (732, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:14:44.7600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (733, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:16:13.1130000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (734, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:16:13.1540000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (735, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:19:08.9470000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (736, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:19:09.0080000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (737, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:21:31.5860000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (738, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:21:31.6810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (739, 1, N'/api/products/1', CAST(N'2025-07-29T09:21:37.6750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (740, 1, N'/api/products/1', CAST(N'2025-07-29T09:21:37.7030000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (741, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:21:51.3930000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (742, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:21:51.4230000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (743, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:22:03.2150000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (744, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:22:03.2460000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (745, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:22:11.5640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (746, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:22:11.6250000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (747, 1, N'/api/products/1', CAST(N'2025-07-29T09:22:13.4210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (748, 1, N'/api/products/1', CAST(N'2025-07-29T09:22:13.4800000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (749, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:22:24.0560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (750, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:22:24.0980000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (751, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:24:19.7310000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (752, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:24:19.9180000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (753, 1, N'/api/products/1', CAST(N'2025-07-29T09:24:23.1140000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (754, 1, N'/api/products/1', CAST(N'2025-07-29T09:24:23.1460000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (755, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:24:28.8200000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (756, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:24:28.8520000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (757, 1, N'/api/products/6', CAST(N'2025-07-29T09:24:30.9520000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (758, 1, N'/api/products/6', CAST(N'2025-07-29T09:24:31.0250000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (759, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:24:43.2690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (760, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:24:43.3060000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (761, 1, N'/api/products/1', CAST(N'2025-07-29T09:25:10.5450000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (762, 1, N'/api/products/1', CAST(N'2025-07-29T09:25:10.5630000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (763, 1, N'/api/products/1', CAST(N'2025-07-29T09:27:34.0720000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (764, 1, N'/api/products/1', CAST(N'2025-07-29T09:27:34.1970000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (765, 1, N'/api/products/1', CAST(N'2025-07-29T09:28:26.2720000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (766, 1, N'/api/products/1', CAST(N'2025-07-29T09:28:26.3080000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (767, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:28:34.7010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (768, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:28:34.7360000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (769, 1, N'/api/products/1', CAST(N'2025-07-29T09:28:36.2410000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (770, 1, N'/api/products/1', CAST(N'2025-07-29T09:28:36.2630000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (771, 1, N'/api/products/1', CAST(N'2025-07-29T09:29:34.4540000+00:00' AS DateTimeOffset), N'no-session', N'PUT')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (772, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:29:36.1090000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (773, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:29:36.1450000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (774, 1, N'/api/products/1', CAST(N'2025-07-29T09:29:37.6770000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (775, 1, N'/api/products/1', CAST(N'2025-07-29T09:29:37.7020000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (778, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:29:47.6210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (779, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:29:47.6640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (780, 4, N'/api/products/1', CAST(N'2025-07-29T09:29:49.7600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (781, 4, N'/api/products/1', CAST(N'2025-07-29T09:29:49.7840000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (786, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:31:53.3230000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (787, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:31:53.3720000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (788, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:31:54.1360000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (789, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:31:54.2510000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (790, 4, N'/api/products/1', CAST(N'2025-07-29T09:31:57.3750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (791, 4, N'/api/products/1', CAST(N'2025-07-29T09:31:57.4080000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (792, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:32:03.2040000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (793, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:32:03.2260000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (794, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:32:49.0250000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (795, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:32:49.1360000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (796, 4, N'/api/products/1', CAST(N'2025-07-29T09:32:51.7920000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (797, 4, N'/api/products/1', CAST(N'2025-07-29T09:32:51.8320000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (798, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:35:51.4420000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (799, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:35:51.4810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (800, 4, N'/api/products/1', CAST(N'2025-07-29T09:35:55.7880000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (801, 4, N'/api/products/1', CAST(N'2025-07-29T09:35:55.8290000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (802, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:36:01.9690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (803, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T09:36:01.9940000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (804, 1, N'/api/products/1', CAST(N'2025-07-29T09:44:38.1920000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (805, 1, N'/api/products/1', CAST(N'2025-07-29T09:44:38.2440000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (806, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:00:01.2480000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (807, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:00:01.3060000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (808, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:00:33.1560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (809, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:00:33.1890000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (810, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:01:28.9540000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (811, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:01:29.0440000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (812, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:01:34.9910000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (813, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:01:35.0430000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (814, 1, N'/api/products/1', CAST(N'2025-07-29T10:01:37.8100000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (815, 1, N'/api/products/1', CAST(N'2025-07-29T10:01:37.8350000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (816, 4, N'/api/products/1', CAST(N'2025-07-29T10:02:41.2550000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (817, 4, N'/api/products/1', CAST(N'2025-07-29T10:02:41.2830000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (818, 4, N'/api/products/1', CAST(N'2025-07-29T10:04:33.8670000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (819, 4, N'/api/products/1', CAST(N'2025-07-29T10:04:33.9500000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (820, 4, N'/api/products/1', CAST(N'2025-07-29T10:04:53.5010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (821, 4, N'/api/products/1', CAST(N'2025-07-29T10:04:53.6390000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (822, 1, N'/api/products/1', CAST(N'2025-07-29T10:04:59.3530000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (823, 1, N'/api/products/1', CAST(N'2025-07-29T10:04:59.3710000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (824, 1, N'/api/products/1', CAST(N'2025-07-29T10:09:31.1500000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (825, 1, N'/api/products/1', CAST(N'2025-07-29T10:09:31.2090000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (826, 4, N'/api/products/1', CAST(N'2025-07-29T10:09:36.7640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (827, 4, N'/api/products/1', CAST(N'2025-07-29T10:09:36.8270000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (828, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:10:02.3950000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (829, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:10:02.4530000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (830, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:10:05.6700000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (831, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-29T10:10:12.0580000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (832, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-29T10:10:12.1360000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (833, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:11:31.6240000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (834, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:11:31.6730000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (835, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:13:02.0780000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (836, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:13:02.1510000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (837, 1, N'/api/products/1', CAST(N'2025-07-29T10:13:03.7350000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (838, 1, N'/api/products/1', CAST(N'2025-07-29T10:13:03.7990000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (839, 1, N'/api/products/1', CAST(N'2025-07-29T10:13:11.6730000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (840, 1, N'/api/products/1', CAST(N'2025-07-29T10:13:11.7280000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (841, 1, N'/api/products/1', CAST(N'2025-07-29T10:13:37.5030000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (842, 1, N'/api/products/1', CAST(N'2025-07-29T10:13:37.5320000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (843, 1, N'/api/products/1', CAST(N'2025-07-29T10:14:13.8840000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (844, 1, N'/api/products/1', CAST(N'2025-07-29T10:14:13.9220000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (845, 1, N'/api/products/1', CAST(N'2025-07-29T10:14:17.3570000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (846, 1, N'/api/products/1', CAST(N'2025-07-29T10:14:17.3940000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (847, 1, N'/api/products/1', CAST(N'2025-07-29T10:14:35.2490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (848, 1, N'/api/products/1', CAST(N'2025-07-29T10:14:35.2640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (849, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:14:38.4570000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (850, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:14:38.4970000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (851, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:15:33.5470000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (852, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:15:33.5910000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (853, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:15:51.8020000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (854, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:15:51.8280000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (855, 1, N'/api/products/1', CAST(N'2025-07-29T10:15:53.7670000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (856, 1, N'/api/products/1', CAST(N'2025-07-29T10:15:53.7940000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (857, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T10:16:58.8480000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (858, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T10:16:58.8980000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (859, 1, N'/api/market-research/1', CAST(N'2025-07-29T10:17:01.2080000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (860, 1, N'/api/market-research/1', CAST(N'2025-07-29T10:17:01.2640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (861, 1, N'/api/market-research/1', CAST(N'2025-07-29T10:17:06.6020000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (862, 1, N'/api/market-research/1', CAST(N'2025-07-29T10:17:06.6250000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (863, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-29T10:17:15.6470000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (864, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-29T10:17:15.6830000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (865, 1, N'/api/statements/10', CAST(N'2025-07-29T10:17:18.0520000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (866, 1, N'/api/statements/10', CAST(N'2025-07-29T10:17:18.0900000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (867, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-29T10:17:26.7850000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (868, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-29T10:17:26.8230000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (871, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:18:39.3160000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (872, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:18:39.3630000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (873, 4, N'/api/products/1', CAST(N'2025-07-29T10:18:42.7700000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (874, 4, N'/api/products/1', CAST(N'2025-07-29T10:18:42.8150000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (875, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:20:45.9970000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (876, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:20:46.0490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (877, 4, N'/api/products/1', CAST(N'2025-07-29T10:20:48.1470000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (878, 4, N'/api/products/1', CAST(N'2025-07-29T10:20:48.3390000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (879, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:21:51.2700000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (880, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:21:51.3130000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (881, 4, N'/api/products/1', CAST(N'2025-07-29T10:21:52.9010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (882, 4, N'/api/products/1', CAST(N'2025-07-29T10:21:52.9260000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (883, 4, N'/api/products/1', CAST(N'2025-07-29T10:22:58.0260000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (884, 4, N'/api/products/1', CAST(N'2025-07-29T10:22:58.0850000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (885, 4, N'/api/products/1', CAST(N'2025-07-29T10:23:07.1350000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (886, 4, N'/api/products/1', CAST(N'2025-07-29T10:23:07.1580000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (887, 4, N'/api/products/1', CAST(N'2025-07-29T10:23:28.4400000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (888, 4, N'/api/products/1', CAST(N'2025-07-29T10:23:28.4870000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (889, 4, N'/api/products/1', CAST(N'2025-07-29T10:23:31.5300000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (890, 4, N'/api/products/1', CAST(N'2025-07-29T10:23:31.6020000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (891, 4, N'/api/products/1', CAST(N'2025-07-29T10:23:41.4930000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (892, 4, N'/api/products/1', CAST(N'2025-07-29T10:23:41.5380000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (893, 4, N'/api/products/1', CAST(N'2025-07-29T10:23:43.3370000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (894, 4, N'/api/products/1', CAST(N'2025-07-29T10:23:43.4490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (895, 4, N'/api/products/1', CAST(N'2025-07-29T10:24:27.2470000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (896, 4, N'/api/products/1', CAST(N'2025-07-29T10:24:27.3040000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (897, 4, N'/api/products/1', CAST(N'2025-07-29T10:24:29.8450000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (898, 4, N'/api/products/1', CAST(N'2025-07-29T10:24:29.8730000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (899, 4, N'/api/products/1', CAST(N'2025-07-29T10:24:46.6900000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (900, 4, N'/api/products/1', CAST(N'2025-07-29T10:24:46.7280000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (901, 4, N'/api/products/1', CAST(N'2025-07-29T10:24:48.4630000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (902, 4, N'/api/products/1', CAST(N'2025-07-29T10:24:48.5030000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (903, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:25:11.2430000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (904, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:25:11.2700000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (905, 1, N'/api/products/1', CAST(N'2025-07-29T10:25:13.1940000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (906, 1, N'/api/products/1', CAST(N'2025-07-29T10:25:13.2160000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (907, 1, N'/api/products/1', CAST(N'2025-07-29T10:30:40.8430000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (908, 1, N'/api/products/1', CAST(N'2025-07-29T10:30:40.8770000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (909, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:32:36.1100000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (910, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:32:36.1610000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (911, 1, N'/api/products/1', CAST(N'2025-07-29T10:32:38.0530000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (912, 1, N'/api/products/1', CAST(N'2025-07-29T10:32:38.0750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (913, 1, N'/api/products/1', CAST(N'2025-07-29T10:32:55.6680000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (914, 1, N'/api/products/1', CAST(N'2025-07-29T10:32:55.7170000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (915, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:35:35.5710000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (916, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:35:35.6060000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (919, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:35:47.9990000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (920, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:35:48.0300000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (921, 1, N'/api/products/1', CAST(N'2025-07-29T10:35:59.2450000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (922, 1, N'/api/products/1', CAST(N'2025-07-29T10:35:59.2660000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (923, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:39:47.3810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (924, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:39:47.4350000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (925, 4, N'/api/products/1', CAST(N'2025-07-29T10:39:50.4250000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (926, 4, N'/api/products/1', CAST(N'2025-07-29T10:39:50.4460000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (927, 4, N'/api/products/1', CAST(N'2025-07-29T10:42:17.7470000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (928, 4, N'/api/products/1', CAST(N'2025-07-29T10:42:17.8190000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (929, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:43:03.9530000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (930, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:43:03.9860000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (935, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:45:01.7290000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (936, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:45:01.7660000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (939, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:45:10.1570000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (940, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:45:10.2140000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (941, 1, N'/api/products/1', CAST(N'2025-07-29T10:45:32.9790000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (942, 1, N'/api/products/1', CAST(N'2025-07-29T10:45:33.0000000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (943, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:45:49.7350000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (944, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:45:49.7570000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (945, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:46:00.4020000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (946, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:46:00.4210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (947, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:46:33.7430000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (948, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:46:33.7770000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (949, 1, N'/api/products/1', CAST(N'2025-07-29T10:46:42.8750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (950, 1, N'/api/products/1', CAST(N'2025-07-29T10:46:42.8960000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (951, 1, N'/api/products/1', CAST(N'2025-07-29T10:46:53.3960000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (952, 1, N'/api/products/1', CAST(N'2025-07-29T10:46:53.4110000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (953, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:47:01.2910000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (954, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:47:01.3110000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (955, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T10:47:12.2640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (956, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T10:47:12.2940000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (957, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:51:41.0840000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (958, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T10:51:41.1090000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (959, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T10:51:55.6980000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (960, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T10:51:55.7240000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (961, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-29T10:51:58.9580000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (962, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-29T10:51:58.9830000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (963, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:00:11.4010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (964, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:00:11.4330000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (965, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T11:00:25.1620000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (966, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T11:00:25.1810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (967, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-29T11:00:27.9720000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (968, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-29T11:00:27.9930000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (969, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:00:33.6800000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (970, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:00:33.7070000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (973, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:12:14.2220000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (974, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:12:14.2610000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (975, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:14:25.9440000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (976, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:14:26.0210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (977, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:14:27.1200000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (978, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:14:27.1540000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (979, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:14:30.9750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (980, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:14:31.0030000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (981, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:14:40.3950000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (982, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:14:40.4110000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (983, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:14:49.2580000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (984, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:14:49.3400000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (985, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:18:13.1230000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (986, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:18:13.1530000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (987, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:43:10.0650000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (988, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:43:10.2260000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (989, 4, N'/api/products/1', CAST(N'2025-07-29T11:43:13.9770000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (990, 4, N'/api/products/1', CAST(N'2025-07-29T11:43:14.0080000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (991, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:43:19.0130000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (992, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:43:19.0490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (993, 4, N'/api/products?page=1&limit=10&search=0989733832', CAST(N'2025-07-29T11:43:26.5900000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (994, 4, N'/api/products?page=1&limit=10&search=0989733832', CAST(N'2025-07-29T11:43:28.4730000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (995, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T11:43:29.3540000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (996, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T12:34:53.2590000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (997, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T12:34:53.3470000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (998, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T12:37:24.5050000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (999, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T12:37:24.5720000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1000, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T12:38:22.9070000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1001, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T12:38:22.9900000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1002, 1, N'/api/products/1', CAST(N'2025-07-29T12:38:32.1990000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1003, 1, N'/api/products/1', CAST(N'2025-07-29T12:38:32.2370000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1004, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T12:41:48.3860000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1005, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T12:41:48.4220000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1006, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T12:41:55.0710000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1007, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T12:41:55.1740000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1008, 4, N'/api/products/1', CAST(N'2025-07-29T12:41:56.3600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1009, 4, N'/api/products/1', CAST(N'2025-07-29T12:41:56.3870000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1010, 1, N'/api/products/1', CAST(N'2025-07-29T12:43:24.3760000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1011, 1, N'/api/products/1', CAST(N'2025-07-29T12:43:24.3990000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1012, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T12:43:28.1880000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1013, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T12:43:28.2140000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1014, 1, N'/api/products/1', CAST(N'2025-07-29T12:43:29.5040000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1015, 1, N'/api/products/1', CAST(N'2025-07-29T12:43:29.5160000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1016, 4, N'/api/products/1', CAST(N'2025-07-29T12:43:40.7720000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1017, 4, N'/api/products/1', CAST(N'2025-07-29T12:43:40.8080000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1018, 4, N'/api/products/1', CAST(N'2025-07-29T12:43:41.6610000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1019, 4, N'/api/products/1', CAST(N'2025-07-29T12:43:41.6940000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1020, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T12:47:59.9130000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1021, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T12:47:59.9550000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1022, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T12:52:21.1920000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1023, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T12:52:21.2810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1024, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T13:03:51.7210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1025, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T13:03:51.8510000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1026, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:04:21.9340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1027, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:04:21.9960000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1028, 1, N'/api/market-research/1', CAST(N'2025-07-29T13:04:26.0050000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1029, 1, N'/api/market-research/1', CAST(N'2025-07-29T13:04:26.0270000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1030, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:04:32.8800000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1031, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:04:32.9620000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1032, 1, N'/api/market-research/1', CAST(N'2025-07-29T13:04:34.3410000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1033, 1, N'/api/market-research/1', CAST(N'2025-07-29T13:04:34.4080000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1034, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:04:36.1350000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1035, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:04:36.1640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1036, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:04:39.3480000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1037, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:04:39.3770000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1038, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:04:53.9550000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1039, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:04:53.9850000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1040, 1, N'/api/market-research/1', CAST(N'2025-07-29T13:04:55.2550000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1041, 1, N'/api/market-research/1', CAST(N'2025-07-29T13:04:55.2940000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1042, 1, N'/api/market-research/1', CAST(N'2025-07-29T13:04:59.3170000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1043, 1, N'/api/market-research/1', CAST(N'2025-07-29T13:04:59.3450000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1044, 1, N'/api/market-research/1', CAST(N'2025-07-29T13:08:58.6140000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1045, 1, N'/api/market-research/1', CAST(N'2025-07-29T13:08:58.6440000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1046, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:09:01.7960000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1047, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:09:01.9780000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1048, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:09:34.3430000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1049, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:09:34.3720000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1050, 1, N'/api/market-research/1', CAST(N'2025-07-29T13:09:36.3810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1051, 1, N'/api/market-research/1', CAST(N'2025-07-29T13:09:36.4040000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1052, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:09:38.3010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1053, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:09:38.3180000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1054, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:10:53.0300000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1055, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:10:53.0630000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1056, 1, N'/api/statements/10', CAST(N'2025-07-29T13:10:55.3820000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1057, 1, N'/api/statements/10', CAST(N'2025-07-29T13:10:55.4050000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1058, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:18:12.0030000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1059, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-29T13:18:12.0390000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1060, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:40:09.4180000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1061, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:40:11.5890000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1062, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:41:18.6840000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1063, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:41:18.8010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1064, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:41:28.6280000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1065, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:41:28.7370000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1066, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:43:48.2000000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1067, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:43:49.5230000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1068, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:44:51.0740000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1069, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:44:51.2140000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1070, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:45:34.4560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1071, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:45:34.5900000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1072, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:49:22.9010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1073, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:49:23.1950000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1074, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:50:16.0330000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1075, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:50:16.3500000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1076, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:51:37.4590000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1077, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:51:37.7060000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1078, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:52:23.5360000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1079, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:52:23.9850000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1080, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:54:38.6540000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1081, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T14:54:39.1460000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1082, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:03:18.8730000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1083, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:03:20.8690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1084, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:04:16.6630000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1085, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:04:17.8310000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1086, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:05:07.5350000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1087, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:07:50.1360000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1088, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:07:51.0170000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1089, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:08:57.1020000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1090, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:08:57.9370000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1091, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T15:13:52.0960000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1092, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T15:13:52.1870000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1093, 4, N'/api/products/1', CAST(N'2025-07-29T15:13:55.7840000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1094, 4, N'/api/products/1', CAST(N'2025-07-29T15:13:55.8580000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1095, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T15:14:02.1690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1096, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T15:14:02.2390000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1097, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:41:55.8960000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1098, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:41:56.0950000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1099, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:42:00.8190000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1100, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:42:01.0180000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1101, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:42:03.2090000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1102, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:42:03.2950000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1103, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:42:12.1940000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1104, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:42:12.3080000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1105, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:42:41.6420000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1106, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:42:41.7600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1107, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:42:42.8030000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1108, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:42:42.9360000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1109, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:42:47.1840000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1110, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:42:47.3020000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1111, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:43:44.9460000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1112, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:43:45.1200000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1113, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:43:45.9970000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1114, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:43:46.1690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1115, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:44:23.2910000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1116, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:44:23.4780000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1117, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:44:24.9280000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1118, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:44:25.1140000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1119, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:44:26.0860000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1120, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:44:26.2190000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1121, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:44:26.8450000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1122, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:44:27.0020000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1123, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:44:29.4090000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1124, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:44:29.5080000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1127, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:44:34.9150000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1128, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:44:35.1120000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1129, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T15:44:52.3910000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1130, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T15:44:52.4560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1131, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:44:54.3760000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1132, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:44:54.4740000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1133, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:47:39.3300000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1134, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:47:39.7370000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1135, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:47:42.4560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1136, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:47:42.6260000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1137, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:47:44.2410000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1138, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:47:44.3900000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1139, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:47:45.1850000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1140, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:47:45.3520000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1141, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:48:19.3880000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1142, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:48:20.0080000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1143, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:48:28.2320000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1144, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:48:28.3640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1145, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:48:29.6880000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1146, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:48:29.8450000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1147, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:49:00.1050000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1148, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:49:00.2860000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1149, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:49:42.7610000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1150, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:49:42.9490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1151, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:49:47.3100000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1152, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:49:47.4690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1153, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T15:49:51.3560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1154, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T15:49:51.4190000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1155, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:49:55.9830000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1156, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:49:56.1780000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1157, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:50:37.0900000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1158, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:50:37.2380000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1159, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:50:40.5250000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1160, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:50:40.6470000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1161, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:51:28.4290000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1162, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:51:28.5190000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1163, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:57:20.0270000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1164, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T15:57:20.2510000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1165, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T16:00:18.6380000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1166, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T16:00:18.6890000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1167, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T16:00:21.3960000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1168, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T16:00:21.4680000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1169, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T16:00:23.2630000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1170, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T16:00:23.3000000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1171, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T16:14:04.0460000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1172, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T16:14:04.2920000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1173, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T16:14:51.7540000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1174, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T16:14:51.8100000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1175, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T16:18:34.0180000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1176, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-29T16:18:34.0720000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1177, 1, N'/api/market-research/1', CAST(N'2025-07-29T16:18:36.1680000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1178, 1, N'/api/market-research/1', CAST(N'2025-07-29T16:18:36.2030000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1183, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T16:31:58.8650000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1184, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-29T16:31:58.9820000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1185, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T16:40:41.6060000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1186, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T16:40:41.6750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1187, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T16:43:16.4750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1188, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T16:43:16.5490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1189, 1, N'/api/market-research/1', CAST(N'2025-07-29T16:49:01.8820000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1190, 1, N'/api/market-research/1', CAST(N'2025-07-29T16:49:01.9400000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1191, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T17:09:24.0190000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1192, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T17:09:24.2460000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1193, 1, N'/api/products/1', CAST(N'2025-07-29T17:09:26.6010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1194, 1, N'/api/products/1', CAST(N'2025-07-29T17:09:26.6760000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1195, 1, N'/api/products/1', CAST(N'2025-07-29T17:13:24.7120000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1196, 1, N'/api/products/1', CAST(N'2025-07-29T17:13:24.7460000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1197, 1, N'/api/products/1', CAST(N'2025-07-29T17:13:58.5410000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1198, 1, N'/api/products/1', CAST(N'2025-07-29T17:13:58.5750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1199, 1, N'/api/products/1', CAST(N'2025-07-29T17:15:45.0970000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1200, 1, N'/api/products/1', CAST(N'2025-07-29T17:15:45.1530000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1201, 1, N'/api/products/1', CAST(N'2025-07-29T17:16:11.5800000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1202, 1, N'/api/products/1', CAST(N'2025-07-29T17:16:11.6340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1203, 1, N'/api/products/1', CAST(N'2025-07-29T17:16:52.4050000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1204, 1, N'/api/products/1', CAST(N'2025-07-29T17:16:52.4610000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1205, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T17:16:55.6220000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1206, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T17:16:55.8250000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1207, 4, N'/api/products/1', CAST(N'2025-07-29T17:16:57.2030000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1208, 4, N'/api/products/1', CAST(N'2025-07-29T17:16:57.2440000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1209, 1, N'/api/products/1', CAST(N'2025-07-29T17:17:06.2830000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1210, 1, N'/api/products/1', CAST(N'2025-07-29T17:17:06.3340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1211, 1, N'/api/products/1', CAST(N'2025-07-29T17:17:08.1210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1212, 1, N'/api/products/1', CAST(N'2025-07-29T17:17:08.2180000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1213, 1, N'/api/products/1', CAST(N'2025-07-29T17:17:24.8150000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1214, 1, N'/api/products/1', CAST(N'2025-07-29T17:17:24.8560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1215, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T17:17:29.8150000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1216, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-29T17:17:29.8650000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1217, 1, N'/api/products/1', CAST(N'2025-07-29T17:17:33.8810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1218, 1, N'/api/products/1', CAST(N'2025-07-29T17:17:33.9060000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1219, 1, N'/api/products/1', CAST(N'2025-07-29T17:18:43.0500000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1220, 1, N'/api/products/1', CAST(N'2025-07-29T17:18:43.0860000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1221, 1, N'/api/products/1', CAST(N'2025-07-29T17:19:02.0450000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1222, 1, N'/api/products/1', CAST(N'2025-07-29T17:19:02.0780000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1223, 1, N'/api/products/1', CAST(N'2025-07-29T17:19:43.1320000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1224, 1, N'/api/products/1', CAST(N'2025-07-29T17:19:43.1780000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1225, 1, N'/api/products/1', CAST(N'2025-07-29T17:20:36.2570000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1226, 1, N'/api/products/1', CAST(N'2025-07-29T17:20:36.4200000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1227, 1, N'/api/products/1', CAST(N'2025-07-29T17:20:52.3900000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1228, 1, N'/api/products/1', CAST(N'2025-07-29T17:20:52.5010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1229, 1, N'/api/products/1', CAST(N'2025-07-29T17:21:25.1640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1230, 1, N'/api/products/1', CAST(N'2025-07-29T17:21:25.3180000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1231, 4, N'/api/products/1', CAST(N'2025-07-29T17:22:03.9590000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1232, 4, N'/api/products/1', CAST(N'2025-07-29T17:22:04.0330000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1233, 1, N'/api/products/1', CAST(N'2025-07-29T17:22:09.1810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1234, 1, N'/api/products/1', CAST(N'2025-07-29T17:22:09.2120000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1235, 4, N'/api/products/1', CAST(N'2025-07-29T17:22:50.5130000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1236, 4, N'/api/products/1', CAST(N'2025-07-29T17:22:50.5690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1237, 4, N'/api/products/1', CAST(N'2025-07-29T17:23:11.7020000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1238, 4, N'/api/products/1', CAST(N'2025-07-29T17:23:12.3820000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1239, 4, N'/api/products/1', CAST(N'2025-07-29T17:24:11.0000000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1240, 4, N'/api/products/1', CAST(N'2025-07-29T17:24:11.0690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1241, 4, N'/api/products/1', CAST(N'2025-07-29T17:24:53.6640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1242, 4, N'/api/products/1', CAST(N'2025-07-29T17:24:53.7130000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1243, 4, N'/api/products/1', CAST(N'2025-07-29T17:25:40.7960000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1244, 4, N'/api/products/1', CAST(N'2025-07-29T17:25:40.9040000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1245, 1, N'/api/products/1', CAST(N'2025-07-29T17:29:54.7740000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1246, 1, N'/api/products/1', CAST(N'2025-07-29T17:29:54.9200000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1247, 1, N'/api/products/1', CAST(N'2025-07-29T17:30:22.6090000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1248, 1, N'/api/products/1', CAST(N'2025-07-29T17:30:22.6670000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1249, 1, N'/api/products/1', CAST(N'2025-07-29T17:30:34.8450000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1250, 1, N'/api/products/1', CAST(N'2025-07-29T17:30:34.9020000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1251, 1, N'/api/products/1', CAST(N'2025-07-29T17:30:52.3530000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1252, 1, N'/api/products/1', CAST(N'2025-07-29T17:30:52.3920000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1253, 1, N'/api/products/1', CAST(N'2025-07-29T17:32:06.6120000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1254, 1, N'/api/products/1', CAST(N'2025-07-29T17:32:06.9600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1255, 1, N'/api/products/1', CAST(N'2025-07-29T17:34:19.8460000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1256, 1, N'/api/products/1', CAST(N'2025-07-29T17:34:19.8850000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1257, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:36:17.9900000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1258, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:36:18.1190000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1259, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:36:24.9060000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1260, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:36:24.9350000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1261, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-30T08:36:35.8160000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1262, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-30T08:36:35.9480000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1263, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:36:43.8390000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1264, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:36:43.9040000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1265, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:43:15.6710000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1266, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:43:15.7320000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1267, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-30T08:43:17.2580000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1268, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-30T08:43:17.3670000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1269, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:43:20.5750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1270, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:43:20.6040000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1271, 4, N'/api/products/1', CAST(N'2025-07-30T08:43:22.3350000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1272, 4, N'/api/products/1', CAST(N'2025-07-30T08:43:22.3810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1273, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:43:29.0320000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1274, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:43:29.0630000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1275, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:44:00.3340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1276, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:44:00.3810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1277, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:44:48.7290000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1278, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:44:48.7720000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1279, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:46:25.5350000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1280, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:46:25.6240000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1281, 1, N'/api/products/1', CAST(N'2025-07-30T08:46:28.0250000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1282, 1, N'/api/products/1', CAST(N'2025-07-30T08:46:28.0730000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1283, 1, N'/api/products/1', CAST(N'2025-07-30T08:46:42.5640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1284, 1, N'/api/products/1', CAST(N'2025-07-30T08:46:42.6130000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1285, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:47:02.6570000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1286, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:47:02.8690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1287, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-30T08:47:53.4120000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1288, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-30T08:47:53.6210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1289, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-30T08:48:02.1320000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1290, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-30T08:48:02.1910000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1291, 1, N'/api/market-research/1', CAST(N'2025-07-30T08:48:03.7410000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1292, 1, N'/api/market-research/1', CAST(N'2025-07-30T08:48:03.7890000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1293, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-30T08:48:07.4070000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1294, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-30T08:48:07.4410000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1295, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-30T08:48:12.9090000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1296, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-30T08:48:12.9920000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1297, 1, N'/api/statements/10', CAST(N'2025-07-30T08:48:15.5820000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1298, 1, N'/api/statements/10', CAST(N'2025-07-30T08:48:15.6380000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1299, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-30T08:48:22.8980000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1300, 1, N'/api/statements?page=1&limit=10&search=&status=', CAST(N'2025-07-30T08:48:22.9370000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1301, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-30T08:48:35.6410000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1302, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-30T08:48:35.7610000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1303, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:48:47.0040000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1304, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T08:48:47.0710000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1305, 4, N'/api/products/1', CAST(N'2025-07-30T08:48:49.3390000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1306, 4, N'/api/products/1', CAST(N'2025-07-30T08:48:49.3950000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1307, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-30T10:44:27.7380000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1308, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-30T10:44:27.8380000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1309, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T11:43:11.7930000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1310, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T11:43:11.8600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1311, 1, N'/api/products/1', CAST(N'2025-07-30T11:43:14.9220000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1312, 1, N'/api/products/1', CAST(N'2025-07-30T11:43:14.9520000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1313, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T11:43:17.5420000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1314, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T11:43:17.5590000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1315, 1, N'/api/products/1', CAST(N'2025-07-30T11:44:29.7720000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1316, 1, N'/api/products/1', CAST(N'2025-07-30T11:44:29.8000000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1317, 1, N'/api/products/1', CAST(N'2025-07-30T11:44:51.0590000+00:00' AS DateTimeOffset), N'no-session', N'PUT')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1318, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T11:44:52.6850000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1319, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T11:44:52.7200000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1320, 1, N'/api/products/1', CAST(N'2025-07-30T11:44:54.0410000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1321, 1, N'/api/products/1', CAST(N'2025-07-30T11:44:54.0590000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1322, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T11:46:25.9450000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1323, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T11:46:25.9810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1324, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T11:46:45.9750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1325, 1, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T11:46:46.0030000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1326, 1, N'/api/products/1', CAST(N'2025-07-30T11:46:47.9840000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1327, 1, N'/api/products/1', CAST(N'2025-07-30T11:46:48.0100000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1328, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-30T11:47:31.4510000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1329, 1, N'/api/market-research?page=1&limit=10&search=&status=', CAST(N'2025-07-30T11:47:31.4910000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1330, 1, N'/api/market-research/1', CAST(N'2025-07-30T11:47:33.8600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1331, 1, N'/api/market-research/1', CAST(N'2025-07-30T11:47:33.8860000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1332, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-30T11:48:07.2060000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1333, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-07-30T11:48:07.2730000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1334, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T11:48:16.0500000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1335, 4, N'/api/products?page=1&limit=10', CAST(N'2025-07-30T11:48:16.0830000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1336, 4, N'/api/products/1', CAST(N'2025-07-30T11:48:19.9750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1337, 4, N'/api/products/1', CAST(N'2025-07-30T11:48:20.0110000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1338, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T01:47:34.6160000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1339, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T01:47:34.7360000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1340, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T01:55:52.6560000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1341, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T01:55:52.9510000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1342, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T01:55:54.8230000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1343, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T01:55:54.9510000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1344, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T01:55:55.1500000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1345, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T01:55:55.1980000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1346, 4, N'/api/products/1', CAST(N'2025-08-14T01:56:04.8910000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1347, 4, N'/api/products/1', CAST(N'2025-08-14T01:56:04.9270000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1348, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T01:56:11.0420000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1349, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T01:56:11.0810000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1350, 4, N'/api/products/1', CAST(N'2025-08-14T01:57:20.7630000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1351, 4, N'/api/products/1', CAST(N'2025-08-14T01:57:20.7990000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1352, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T01:57:37.9450000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1353, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T01:57:37.9830000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1354, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T01:57:39.4130000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1355, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T01:57:39.4600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1356, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T01:58:39.7850000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1357, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T01:58:39.8510000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1358, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:03:25.2660000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1359, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:03:25.3370000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1360, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:05:15.5650000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1361, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:05:15.6720000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1362, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:06:31.0600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1363, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:06:31.1000000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1364, 4, N'/api/products/2', CAST(N'2025-08-14T02:06:35.5930000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1365, 4, N'/api/products/2', CAST(N'2025-08-14T02:06:35.7430000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1366, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:06:37.9110000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1367, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:06:37.9280000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1368, 4, N'/api/products/1', CAST(N'2025-08-14T02:06:39.7600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1369, 4, N'/api/products/1', CAST(N'2025-08-14T02:06:39.7800000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1370, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:06:41.3460000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1371, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:06:41.3690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1372, 4, N'/api/products/6', CAST(N'2025-08-14T02:06:43.1440000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1373, 4, N'/api/products/6', CAST(N'2025-08-14T02:06:43.1660000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1374, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:06:44.8430000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1375, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:06:44.8620000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1376, 4, N'/api/products/6', CAST(N'2025-08-14T02:06:47.8340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1377, 4, N'/api/products/6', CAST(N'2025-08-14T02:06:47.8690000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1378, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:06:52.8640000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1379, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:06:52.8840000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1380, 4, N'/api/products/5', CAST(N'2025-08-14T02:06:54.0420000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1381, 4, N'/api/products/5', CAST(N'2025-08-14T02:06:54.0620000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1382, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:06:58.3950000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1383, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:06:58.4150000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1384, 4, N'/api/products/5', CAST(N'2025-08-14T02:07:00.2000000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1385, 4, N'/api/products/5', CAST(N'2025-08-14T02:07:00.2180000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1386, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:07:01.9780000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1387, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:07:02.0060000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1388, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:07:43.4420000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1389, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:07:43.5550000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1390, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:08:16.1240000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1391, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:08:16.1960000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1392, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:09:12.6010000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1393, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:09:12.6610000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1394, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:10:24.8910000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1395, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:10:25.0250000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1396, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:14:14.0280000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1397, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:14:14.0600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1398, 4, N'/api/products?page=1&limit=10&status=inactive', CAST(N'2025-08-14T02:14:17.8620000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1399, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:15:27.1930000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1400, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:15:27.2920000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1401, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:15:46.8490000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1402, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T02:15:46.8880000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1403, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:15:53.1530000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1404, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:15:53.2130000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1405, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:15:57.7950000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1406, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:15:57.8700000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1407, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:19:04.1950000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1408, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:19:04.3180000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1409, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:19:06.7960000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1410, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T02:19:06.8670000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1411, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T03:49:08.5340000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1412, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T03:49:08.5960000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1413, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T03:50:36.1320000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1414, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T03:50:36.1880000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1415, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T03:51:23.1060000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1416, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T03:51:23.1670000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1417, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T04:00:47.0730000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1418, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T04:00:47.1580000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1419, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T04:01:18.0790000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1420, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T04:01:18.1080000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1421, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T04:07:59.4210000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1422, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T04:07:59.4550000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1423, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T04:08:26.2600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1424, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T04:08:26.3020000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1425, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T04:57:58.4750000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1426, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-14T04:57:58.5510000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1427, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T04:57:59.9090000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1428, 4, N'/api/products?page=1&limit=10', CAST(N'2025-08-14T04:57:59.9520000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1429, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-19T07:09:22.2480000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
INSERT [dbo].[tbl_page_log] ([sl_no], [login_id], [page_name], [datetime], [session_id], [action]) VALUES (1430, 4, N'/api/products?limit=3&sort=sales_count&order=desc', CAST(N'2025-08-19T07:09:22.8600000+00:00' AS DateTimeOffset), N'no-session', N'GET')
GO
SET IDENTITY_INSERT [dbo].[tbl_page_log] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_products] ON 
GO
INSERT [dbo].[tbl_products] ([id], [product_number], [product_name], [product_long_description], [uom], [product_short_description], [product_image1], [product_image2], [product_group], [status], [priority], [created_date], [modified_date], [common_name], [botanical_name], [plant_part], [source_country], [harvest_region_new], [peak_season_enabled], [peak_season_months], [harvest_season_enabled], [harvest_season_months], [procurement_method], [main_components], [sensory_notes], [color_absolute], [extraction_process], [applications_uses], [production_availability]) VALUES (1, N'0989733832', N'Jasmine Grandiflorumd', N'Spanning cultures and continents, Jasminum grandiflorum weaves a fragrant legacy from Himalayan origins to its role in the Iberian Peninsula during the Islamic Golden Age. It holds deep cultural symbolism, adorning individuals and gracing global festivities, rituals, and ceremonies across time.', N'kg', N'A beautiful and delicate bloom known for its graceful appearance and soft fragrance.', N'products/images/1_1753875891091-122468599.png', N'products/images/2_1753875891108-307209994.png', N'Flowers', N'active', 1, CAST(N'2025-07-24T18:32:29.1100000+00:00' AS DateTimeOffset), CAST(N'2025-07-30T11:44:51.1330000+00:00' AS DateTimeOffset), N'', N'', N'Flower', N'IN', N'["Andhra Pradesh","Arunachal Pradesh","Tamil Nadu","Telangana","Karnataka"]', 1, N'["January","February","March","April"]', 1, N'["April","May","June"]', N'', N'', N'', N'', N'', N'', N'')
GO
INSERT [dbo].[tbl_products] ([id], [product_number], [product_name], [product_long_description], [uom], [product_short_description], [product_image1], [product_image2], [product_group], [status], [priority], [created_date], [modified_date], [common_name], [botanical_name], [plant_part], [source_country], [harvest_region_new], [peak_season_enabled], [peak_season_months], [harvest_season_enabled], [harvest_season_months], [procurement_method], [main_components], [sensory_notes], [color_absolute], [extraction_process], [applications_uses], [production_availability]) VALUES (2, N'0989733833', N'Tuberose', N'A highly fragrant flower cherished for its sweet, intoxicating scent and elegant white petals.', N'kg', N'Aromatic white flowers with intense fragrance.', N'/uploads/tuberose1.jpg', N'/uploads/tuberose2.jpg', N'Flowers', N'active', 2, CAST(N'2025-07-24T18:32:29.1100000+00:00' AS DateTimeOffset), CAST(N'2025-07-24T18:32:29.1100000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_products] ([id], [product_number], [product_name], [product_long_description], [uom], [product_short_description], [product_image1], [product_image2], [product_group], [status], [priority], [created_date], [modified_date], [common_name], [botanical_name], [plant_part], [source_country], [harvest_region_new], [peak_season_enabled], [peak_season_months], [harvest_season_enabled], [harvest_season_months], [procurement_method], [main_components], [sensory_notes], [color_absolute], [extraction_process], [applications_uses], [production_availability]) VALUES (3, N'0989733834', N'Davana', N'Aromatic herb known for its sweet, fruity fragrance and traditional use in perfumery and rituals.', N'kg', N'Traditional aromatic herb with sweet fragrance.', N'/uploads/davana1.jpg', N'/uploads/davana2.jpg', N'Herbs', N'active', 3, CAST(N'2025-07-24T18:32:29.1100000+00:00' AS DateTimeOffset), CAST(N'2025-07-24T18:32:29.1100000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_products] ([id], [product_number], [product_name], [product_long_description], [uom], [product_short_description], [product_image1], [product_image2], [product_group], [status], [priority], [created_date], [modified_date], [common_name], [botanical_name], [plant_part], [source_country], [harvest_region_new], [peak_season_enabled], [peak_season_months], [harvest_season_enabled], [harvest_season_months], [procurement_method], [main_components], [sensory_notes], [color_absolute], [extraction_process], [applications_uses], [production_availability]) VALUES (4, N'0989733835', N'Sambac', N'Aromatic herb known for its sweet, fruity fragrance and traditional use in perfumery and rituals.', N'kg', N'Premium quality sambac flowers.', N'/uploads/sambac1.jpg', N'/uploads/sambac2.jpg', N'Flowers', N'active', 4, CAST(N'2025-07-24T18:32:29.1100000+00:00' AS DateTimeOffset), CAST(N'2025-07-24T18:32:29.1100000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_products] ([id], [product_number], [product_name], [product_long_description], [uom], [product_short_description], [product_image1], [product_image2], [product_group], [status], [priority], [created_date], [modified_date], [common_name], [botanical_name], [plant_part], [source_country], [harvest_region_new], [peak_season_enabled], [peak_season_months], [harvest_season_enabled], [harvest_season_months], [procurement_method], [main_components], [sensory_notes], [color_absolute], [extraction_process], [applications_uses], [production_availability]) VALUES (5, N'0989733836', N'Lemongrass', N'Aromatic herb known for its sweet, fruity fragrance and traditional use in perfumery and rituals.', N'kg', N'Fresh lemongrass with citrus aroma.', N'/uploads/lemongrass1.jpg', N'/uploads/lemongrass2.jpg', N'Herbs', N'active', 5, CAST(N'2025-07-24T18:32:29.1100000+00:00' AS DateTimeOffset), CAST(N'2025-07-24T18:32:29.1100000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_products] ([id], [product_number], [product_name], [product_long_description], [uom], [product_short_description], [product_image1], [product_image2], [product_group], [status], [priority], [created_date], [modified_date], [common_name], [botanical_name], [plant_part], [source_country], [harvest_region_new], [peak_season_enabled], [peak_season_months], [harvest_season_enabled], [harvest_season_months], [procurement_method], [main_components], [sensory_notes], [color_absolute], [extraction_process], [applications_uses], [production_availability]) VALUES (6, N'sf', N'asdf', N'kmkmk', N'dsf', N'asdf', NULL, NULL, N'Auto Complete', N'active', 2, CAST(N'2025-07-24T20:26:03.6270000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T06:43:42.9030000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tbl_products] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_roles] ON 
GO
INSERT [dbo].[tbl_roles] ([id], [role_name], [description], [permissions], [status], [created_by], [created_date], [modified_date]) VALUES (5, N'Customer', N'', N'{"dashboard":{"view":true},"users":{"view":false},"roles":{"view":false},"products":{"view":true},"orders":{"view":true},"meetings":{"view":true},"market_reports":{"view":true},"payments":{"view":true}}', N'active', 1, CAST(N'2025-07-29T05:07:44.6970000' AS DateTime2), CAST(N'2025-07-29T05:07:44.6970000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[tbl_roles] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_sales] ON 
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (1, CAST(N'2024-10-25' AS Date), N'8302001770', N'', N'354485', N'3300009293', N'0025001171', N'JC04_DGL', N'0', N'ZELU', N'Export w/o IGST-JCPL', N'M/s. Firmenich Grasse SAS', N'000000001000000441', N'Manufactured Product', N'3301 29 90', N'Jasmine Grandiflorum Absolute', N'0000014819', CAST(50.00 AS Decimal(18, 2)), CAST(3550.00 AS Decimal(18, 2)), CAST(295360.00 AS Decimal(18, 2)), N'KG', CAST(177500.00 AS Decimal(18, 2)), CAST(14768000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(14768000.00 AS Decimal(18, 2)), N'', N'', N'02 nos carton boxes only', N'Firmenich Grasse, France. Box # 576 to 577', N'', NULL, N'', N'0000000855', N'USD', N'JA60', N'60 days from invoice date', CAST(N'2024-12-24' AS Date), CAST(83.200000 AS Decimal(18, 6)), N'', N'', N'FR', N'CIP', N'4501297857', CAST(N'2024-06-28' AS Date), CAST(N'2024-12-26' AS Date), N'36000401', N'Export', N'RBL BANK', N'409001060400', N'Air', NULL, NULL, NULL, NULL, CAST(N'2025-07-10T10:59:59.000' AS DateTime), N'yes')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (2, CAST(N'2025-01-10' AS Date), N'9202000379', N'', N'30002059', N'3200006462', N'0025001559', N'JC04_DGL', N'0', N'ZJDB', N'Invoice Dom-JASMINE', N'Maduras Herbals', N'000000001000011425', N'Manufactured Product', N'33030020', N'Rose Water', N'0000008306', CAST(10.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), N'KG', CAST(3000.00 AS Decimal(18, 2)), CAST(3000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(5, 2)), CAST(270.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(5, 2)), CAST(270.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(3540.00 AS Decimal(18, 2)), N'', N'', N'Two nos carton Box Only', N'', N'', NULL, N'', N'0000002738', N'INR', N'JA15', N'15 days from invoice date', CAST(N'2025-01-25' AS Date), CAST(1.000000 AS Decimal(18, 6)), N'', N'33DHLPK2815J1ZA', N'IN', N'EXW', N'Email', CAST(N'2025-01-09' AS Date), CAST(N'2025-01-10' AS Date), N'1041543', N'Local', N'CITI Bank', N'0714883224', N'', NULL, NULL, NULL, NULL, CAST(N'2025-07-10T12:02:00.000' AS DateTime), N'yes')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (3, CAST(N'2025-01-10' AS Date), N'9202000379', N'', N'30002059', N'3200006462', N'', N'JC02_CBE', N'0', N'ZJDB', N'Invoice Dom-JASMINE', N'Maduras Herbals', N'000000001000000989', N'Value Added Product', N'33019090', N'Pink Lotus Absolute Wax', N'', CAST(2.00 AS Decimal(18, 2)), CAST(2225.00 AS Decimal(18, 2)), CAST(2225.00 AS Decimal(18, 2)), N'KG', CAST(4450.00 AS Decimal(18, 2)), CAST(4450.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(5, 2)), CAST(400.50 AS Decimal(18, 2)), CAST(9.00 AS Decimal(5, 2)), CAST(400.50 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(5251.00 AS Decimal(18, 2)), N'', N'', N'Two nos carton Box Only', N'', N'', NULL, N'', N'0000002738', N'INR', N'JA15', N'15 days from invoice date', CAST(N'2025-01-25' AS Date), CAST(1.000000 AS Decimal(18, 6)), N'', N'33DHLPK2815J1ZA', N'IN', N'EXW', N'Email', CAST(N'2025-01-09' AS Date), CAST(N'2025-01-10' AS Date), N'1041543', N'Local', N'CITI Bank', N'0714883224', N'', NULL, NULL, NULL, NULL, CAST(N'2025-07-10T12:02:00.000' AS DateTime), N'yes')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (4, CAST(N'2024-12-26' AS Date), N'9302000993', N'', N'30002052', N'3300009476', N'0025001474', N'JC04_DGL', N'0', N'ZJDB', N'Invoice Dom-JASMINE', N'Ultra International Limited', N'000000001000007710', N'Manufactured Product', N'3301 29 90', N'Rose Centifolia Absolute', N'0000012427', CAST(10.00 AS Decimal(18, 2)), CAST(230000.00 AS Decimal(18, 2)), CAST(230000.00 AS Decimal(18, 2)), N'KG', CAST(2300000.00 AS Decimal(18, 2)), CAST(2300000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(5, 2)), CAST(414000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2714000.00 AS Decimal(18, 2)), N'', N'DTDC', N'02 nos carton boxes only', N'', N'', NULL, N'', N'0000001597', N'INR', N'JA30', N'30 days from invoice date', CAST(N'2025-01-25' AS Date), CAST(1.000000 AS Decimal(18, 6)), N'', N'09AAACU1089Q1ZO', N'IN', N'DAP', N'ULT/24-25/4997', CAST(N'2024-12-24' AS Date), CAST(N'2025-01-10' AS Date), N'8000812', N'Local', N'CITI Bank', N'0714883224', N'Air', NULL, NULL, NULL, NULL, NULL, N'no')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (5, CAST(N'2024-12-12' AS Date), N'9302000984', N'', N'30002037', N'3300009452', N'0025001424', N'JC03_CBA', N'0', N'ZJDB', N'Invoice Dom-JASMINE', N'SAGANLA', N'000000001000003297', N'Manufactured Product', N'24039960', N'Tobacco Flower Absolute', N'0000012509', CAST(0.10 AS Decimal(18, 2)), CAST(240000.00 AS Decimal(18, 2)), CAST(240000.00 AS Decimal(18, 2)), N'KG', CAST(24000.00 AS Decimal(18, 2)), CAST(24000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(5, 2)), CAST(2160.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(5, 2)), CAST(2160.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(28320.00 AS Decimal(18, 2)), N'', N'', N'One no carton box only', N'', N'', NULL, N'', N'0000002983', N'INR', N'JA15', N'15 days from invoice date', CAST(N'2024-12-27' AS Date), CAST(1.000000 AS Decimal(18, 6)), N'', N'33AABFS9737R1ZF', N'IN', N'EXW', N'PO-00085', CAST(N'2024-12-10' AS Date), CAST(N'2025-01-13' AS Date), N'8000813', N'Local', N'CITI Bank', N'0714883224', N'Air', NULL, NULL, NULL, NULL, NULL, N'no')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (6, CAST(N'2024-12-12' AS Date), N'9302000984', N'', N'30002037', N'3300009452', N'', N'JC04_DGL', N'0', N'ZJDB', N'Invoice Dom-JASMINE', N'SAGANLA', N'000000001000000443', N'Manufactured Product', N'3301 29 90', N'Frangipani Absolute', N'0000012951', CAST(0.10 AS Decimal(18, 2)), CAST(320000.00 AS Decimal(18, 2)), CAST(320000.00 AS Decimal(18, 2)), N'KG', CAST(32000.00 AS Decimal(18, 2)), CAST(32000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(5, 2)), CAST(2893.50 AS Decimal(18, 2)), CAST(9.00 AS Decimal(5, 2)), CAST(2893.50 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(37937.00 AS Decimal(18, 2)), N'', N'', N'One no carton box only', N'', N'', NULL, N'', N'0000002983', N'INR', N'JA15', N'15 days from invoice date', CAST(N'2024-12-27' AS Date), CAST(1.000000 AS Decimal(18, 6)), N'', N'33AABFS9737R1ZF', N'IN', N'EXW', N'PO-00085', CAST(N'2024-12-10' AS Date), CAST(N'2025-01-13' AS Date), N'8000813', N'Local', N'CITI Bank', N'0714883224', N'Air', NULL, NULL, NULL, NULL, NULL, N'no')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (7, CAST(N'2024-12-13' AS Date), N'9202000373', N'', N'30002038', N'3200006427', N'0025001425', N'JC03_CBA', N'0', N'ZJDB', N'Invoice Dom-JASMINE', N'SAGANLA', N'000000001000000438', N'Manufactured Product', N'3301 90 90', N'Vanilla Absolute', N'0000013066', CAST(0.10 AS Decimal(18, 2)), CAST(275000.00 AS Decimal(18, 2)), CAST(275000.00 AS Decimal(18, 2)), N'KG', CAST(27500.00 AS Decimal(18, 2)), CAST(27500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(5, 2)), CAST(2488.50 AS Decimal(18, 2)), CAST(9.00 AS Decimal(5, 2)), CAST(2488.50 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(32627.00 AS Decimal(18, 2)), N'', N'', N'One no carton box only', N'', N'', NULL, N'', N'0000002983', N'INR', N'JA15', N'15 days from invoice date', CAST(N'2024-12-28' AS Date), CAST(1.000000 AS Decimal(18, 6)), N'', N'33AABFS9737R1ZF', N'IN', N'EXW', N'PO-00085', CAST(N'2024-12-10' AS Date), CAST(N'2025-01-13' AS Date), N'8000813', N'Local', N'CITI Bank', N'0714883224', N'Air', NULL, NULL, NULL, NULL, NULL, N'no')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (8, CAST(N'2024-12-13' AS Date), N'7400000174', N'', N'500298', N'80002657', N'0025001426', N'JC01_CNI', N'0', N'ZJDB', N'Invoice Dom-JASMINE', N'SAGANLA', N'000000005000009495', N'Traded Product', N'33012944', N'Davana Oil', N'0000013183', CAST(0.25 AS Decimal(18, 2)), CAST(44000.00 AS Decimal(18, 2)), CAST(44000.00 AS Decimal(18, 2)), N'KG', CAST(11000.00 AS Decimal(18, 2)), CAST(11000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(5, 2)), CAST(1003.50 AS Decimal(18, 2)), CAST(9.00 AS Decimal(5, 2)), CAST(1003.50 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(13157.00 AS Decimal(18, 2)), N'', N'', N'One no carton box only', N'', N'', NULL, N'', N'0000002983', N'INR', N'JA15', N'15 days from invoice date', CAST(N'2024-12-28' AS Date), CAST(1.000000 AS Decimal(18, 6)), N'', N'33AABFS9737R1ZF', N'IN', N'EXW', N'PO-00085', CAST(N'2024-12-10' AS Date), CAST(N'2025-01-13' AS Date), N'8000813', N'Local', N'CITI Bank', N'0714883224', N'Air', NULL, NULL, NULL, NULL, CAST(N'2025-07-10T10:52:21.000' AS DateTime), N'yes')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (9, CAST(N'2024-11-22' AS Date), N'8302001795', N'', N'354511', N'3300009381', N'0025001308', N'JC04_DGL', N'0', N'ZELU', N'Export w/o IGST-JCPL', N'BTG PACTUAL COMMODITIES SERTRA', N'000000001000000442', N'Manufactured Product', N'3301 29 90', N'Jasmine Sambac Absolute', N'0000015104', CAST(25.00 AS Decimal(18, 2)), CAST(4275.00 AS Decimal(18, 2)), CAST(357390.00 AS Decimal(18, 2)), N'KG', CAST(106875.00 AS Decimal(18, 2)), CAST(8934750.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(8934750.00 AS Decimal(18, 2)), N'', N'', N'Two nos carton boxes only', N'BTG PACTUAL COMMODITIES, BRAZIL. BOX # 643 to 644', N'', NULL, N'Customer Code # 615103', N'0000003026', N'USD', N'JS60', N'60 days from invoice date', CAST(N'2025-01-21' AS Date), CAST(83.600000 AS Decimal(18, 6)), N'', N'', N'BR', N'EXW', N'4500989119', CAST(N'2024-11-04' AS Date), CAST(N'2025-01-22' AS Date), N'8000823', N'Export', N'HDFC Bank Ltd', N'50200028420224', N'Sea', NULL, NULL, NULL, NULL, CAST(N'2025-06-15T22:24:05.000' AS DateTime), N'yes')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (10, CAST(N'2024-08-30' AS Date), N'6400000476', N'', N'401117', N'80002547', N'0025000839', N'JC01_CNI', N'0', N'ZELU', N'Export w/o IGST-JCPL', N'Firmenich SA', N'000000005000009513', N'Traded Product', N'3301 29 27', N'GINGERGRASS OIL', N'0000010789', CAST(10.00 AS Decimal(18, 2)), CAST(71.00 AS Decimal(18, 2)), CAST(5900.10 AS Decimal(18, 2)), N'KG', CAST(710.00 AS Decimal(18, 2)), CAST(59001.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(59001.00 AS Decimal(18, 2)), N'', N'', N'One no carton box only', N'Firmenich SA, Switzerland, Box # 013', N'', NULL, N'', N'0000002400', N'USD', N'JA60', N'60 days from invoice date', CAST(N'2024-10-29' AS Date), CAST(83.100000 AS Decimal(18, 6)), N'', N'', N'CH', N'CIP', N'4501308321', CAST(N'2024-08-28' AS Date), CAST(N'2025-01-22' AS Date), N'36000439', N'Export', N'RBL BANK', N'409001060400', N'Air', NULL, NULL, NULL, NULL, CAST(N'2025-07-10T10:50:20.000' AS DateTime), N'yes')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (11, CAST(N'2025-01-22' AS Date), N'9205200083', N'', N'8500009', N'', N'0025001593', N'JC02_CBE', N'0', N'ZJW2', N'Dom Jobwrk SRV-JASMI', N'Expovan', N'000000000500002510', N'', N'998816', N'Processing Charge for extraction', N'', CAST(100.00 AS Decimal(18, 2)), CAST(3200.00 AS Decimal(18, 2)), CAST(3200.00 AS Decimal(18, 2)), N'KG', CAST(320000.00 AS Decimal(18, 2)), CAST(320000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(5, 2)), CAST(28800.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(5, 2)), CAST(28800.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(377600.00 AS Decimal(18, 2)), N'', N'', N'', N'', N'', NULL, N'', N'0000002018', N'INR', N'Z100', N'100% advance along with order', CAST(N'2025-01-23' AS Date), CAST(1.000000 AS Decimal(18, 6)), N'', N'33AAFFE1545F1ZW', N'IN', N'EXW', N'PO/026/24-25', CAST(N'2025-01-21' AS Date), CAST(N'2025-01-22' AS Date), N'8000826', N'Local', N'CITI Bank', N'0714883224', N'', NULL, NULL, NULL, NULL, NULL, N'no')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (12, CAST(N'2024-12-11' AS Date), N'9205200082', N'', N'8500007', N'', N'0025001415', N'JC02_CBE', N'0', N'ZJW2', N'Dom Jobwrk SRV-JASMI', N'Expovan', N'000000000500002510', N'', N'998816', N'Processing Charge for extraction', N'', CAST(100.00 AS Decimal(18, 2)), CAST(3200.00 AS Decimal(18, 2)), CAST(3200.00 AS Decimal(18, 2)), N'KG', CAST(320000.00 AS Decimal(18, 2)), CAST(320000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(5, 2)), CAST(28800.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(5, 2)), CAST(28800.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(377600.00 AS Decimal(18, 2)), N'', N'', N'', N'', N'', NULL, N'', N'0000002018', N'INR', N'Z100', N'100% advance along with order', CAST(N'2024-12-12' AS Date), CAST(1.000000 AS Decimal(18, 6)), N'', N'33AAFFE1545F1ZW', N'IN', N'EXW', N'PO/22/24-25', CAST(N'2024-12-10' AS Date), CAST(N'2025-01-24' AS Date), N'1042041', N'Local', N'CITI Bank', N'0714883224', N'', NULL, NULL, NULL, NULL, NULL, N'no')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (13, CAST(N'2025-01-21' AS Date), N'7400000181', N'', N'500305', N'80002691', N'0025001587', N'JC01_CNI', N'0', N'ZJDB', N'Invoice Dom-JASMINE', N'Prakash G', N'000000005000009590', N'Traded Product', N'33012990', N'Vetiver Oil', N'0000013721', CAST(0.10 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), N'KG', CAST(2500.00 AS Decimal(18, 2)), CAST(2500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(5, 2)), CAST(234.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(5, 2)), CAST(234.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(3068.00 AS Decimal(18, 2)), N'', N'', N'One no carton box only', N'', N'', NULL, N'', N'0000003047', N'INR', N'Z100', N'100% advance along with order', CAST(N'2025-01-22' AS Date), CAST(1.000000 AS Decimal(18, 6)), N'', N'', N'IN', N'EXW', N'email', CAST(N'2025-01-04' AS Date), CAST(N'2025-01-21' AS Date), N'8000827', N'Local', N'CITI Bank', N'0714883224', N'Air', NULL, NULL, NULL, NULL, CAST(N'2025-07-10T10:53:49.000' AS DateTime), N'yes')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (14, CAST(N'2025-01-03' AS Date), N'8302001825', N'', N'354549', N'3300009510', N'0025001538', N'JC04_DGL', N'0', N'ZELU', N'Export w/o IGST-JCPL', N'CPL AROMAS', N'000000001000000442', N'Manufactured Product', N'3301 29 90', N'Jasmine Sambac Absolute', N'0000013050', CAST(4.00 AS Decimal(18, 2)), CAST(4115.00 AS Decimal(18, 2)), CAST(349363.50 AS Decimal(18, 2)), N'KG', CAST(16460.00 AS Decimal(18, 2)), CAST(1397454.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1397454.00 AS Decimal(18, 2)), N'', N'', N'One No. Carton Box Only.', N'CPL, HONG KONG. Box # 707', N'', NULL, N'Customer code# 04038', N'0000003045', N'USD', N'JA30', N'30 days from invoice date', CAST(N'2025-02-02' AS Date), CAST(84.900000 AS Decimal(18, 6)), N'', N'', N'HK', N'CIP', N'HKM-PO045542-2', CAST(N'2025-01-03' AS Date), CAST(N'2025-02-05' AS Date), N'8000880', N'Export', N'HDFC Bank Ltd', N'50200028420224', N'Air', NULL, NULL, NULL, NULL, CAST(N'2025-07-10T10:43:13.000' AS DateTime), N'yes')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (15, CAST(N'2024-11-12' AS Date), N'6400000494', N'', N'401135', N'80002626', N'0025001248', N'JC01_CNI', N'0', N'ZELU', N'Export w/o IGST-JCPL', N'FIRMENICH S.A.', N'000000005000009497', N'Traded Product', N'33012942', N'Lemongrass Oil', N'0000014225', CAST(60.00 AS Decimal(18, 2)), CAST(38.00 AS Decimal(18, 2)), CAST(3171.10 AS Decimal(18, 2)), N'KG', CAST(2280.00 AS Decimal(18, 2)), CAST(190266.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(190266.00 AS Decimal(18, 2)), N'', N'', N'02 nos barrel only', N'Firmenich S.A,Colombia, Barrel # 164 to 165', N'', NULL, N'', N'0000002223', N'USD', N'JA60', N'60 days from invoice date', CAST(N'2025-01-11' AS Date), CAST(83.450000 AS Decimal(18, 6)), N'', N'', N'CO', N'CIP', N'4501325229', CAST(N'2024-10-23' AS Date), CAST(N'2025-02-04' AS Date), N'8000882', N'Export', N'RBL BANK', N'409001060400', N'Air', NULL, NULL, NULL, NULL, CAST(N'2025-07-10T10:50:20.000' AS DateTime), N'yes')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (16, CAST(N'2024-11-13' AS Date), N'6400000496', N'', N'401137', N'80002631', N'0025001260', N'JC01_CNI', N'0', N'ZELU', N'Export w/o IGST-JCPL', N'FIRMENICH S.A.', N'000000005000009497', N'Traded Product', N'33012942', N'Lemongrass Oil', N'0000014225', CAST(140.00 AS Decimal(18, 2)), CAST(38.00 AS Decimal(18, 2)), CAST(3171.10 AS Decimal(18, 2)), N'KG', CAST(5320.00 AS Decimal(18, 2)), CAST(443954.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(443954.00 AS Decimal(18, 2)), N'', N'', N'03 nos barrel packed in 03nos pallet only', N'Firmenich S.A,Colombia, Barrel # 167 to 169', N'', NULL, N'', N'0000002223', N'USD', N'JA60', N'60 days from invoice date', CAST(N'2025-01-12' AS Date), CAST(83.450000 AS Decimal(18, 6)), N'', N'', N'CO', N'CIP', N'4501326652', CAST(N'2024-10-30' AS Date), CAST(N'2025-02-04' AS Date), N'8000882', N'Export', N'RBL BANK', N'409001060400', N'Air', NULL, NULL, NULL, NULL, CAST(N'2025-07-10T10:52:21.000' AS DateTime), N'yes')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (17, CAST(N'2025-01-13' AS Date), N'8202000594', N'', N'354551', N'3200006466', N'0025001565', N'JC03_CBA', N'0', N'ZELU', N'Export w/o IGST-JCPL', N'CEDAROME Canada Inc', N'000000001000000447', N'Manufactured Product', N'3301 29 90', N'Red Champaca Absolute', N'0000015506', CAST(4.00 AS Decimal(18, 2)), CAST(7495.00 AS Decimal(18, 2)), CAST(636325.50 AS Decimal(18, 2)), N'KG', CAST(29980.00 AS Decimal(18, 2)), CAST(2545302.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(2545302.00 AS Decimal(18, 2)), N'', N'', N'One no carton box only', N'Cedarome, Canada. Box # 46', N'', NULL, N'Products Scheme (RODTEP)"', N'0000002310', N'USD', N'JA30', N'30 days from invoice date', CAST(N'2025-02-12' AS Date), CAST(84.900000 AS Decimal(18, 6)), N'', N'', N'CA', N'CIP', N'20119', CAST(N'2025-01-06' AS Date), CAST(N'2025-03-17' AS Date), N'36000507', N'Export', N'RBL BANK', N'409001060400', N'Air', NULL, NULL, NULL, NULL, CAST(N'2025-07-10T10:53:49.000' AS DateTime), N'yes')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (18, CAST(N'2025-01-13' AS Date), N'8202000595', N'', N'354552', N'3200006467', N'0025001566', N'JC03_CBA', N'0', N'ZELU', N'Export w/o IGST-JCPL', N'CEDAROME Canada Inc', N'000000001000000438', N'Manufactured Product', N'3301 90 90', N'Vanilla Absolute', N'0000013066', CAST(3.00 AS Decimal(18, 2)), CAST(3425.00 AS Decimal(18, 2)), CAST(290782.50 AS Decimal(18, 2)), N'KG', CAST(10275.00 AS Decimal(18, 2)), CAST(872347.50 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(872347.50 AS Decimal(18, 2)), N'', N'', N'One no carton box only', N'Cedarome, Canada. Box # 47', N'', NULL, N'Products Scheme (RODTEP)"', N'0000002310', N'USD', N'JA30', N'30 days from invoice date', CAST(N'2025-02-12' AS Date), CAST(84.900000 AS Decimal(18, 6)), N'', N'', N'CA', N'CIP', N'20126', CAST(N'2025-01-09' AS Date), CAST(N'2025-03-17' AS Date), N'36000509', N'Export', N'RBL BANK', N'409001060400', N'Air', NULL, NULL, NULL, NULL, CAST(N'2025-07-10T10:59:59.000' AS DateTime), N'yes')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (19, CAST(N'2025-01-16' AS Date), N'8302001828', N'', N'354554', N'3300009529', N'0025001576', N'JC04_DGL', N'0', N'ZELU', N'Export w/o IGST-JCPL', N'M/s. Firmenich Grasse SAS', N'000000001000000442', N'Manufactured Product', N'3301 29 90', N'Jasmine Sambac Absolute', N'0000014987', CAST(50.00 AS Decimal(18, 2)), CAST(4060.00 AS Decimal(18, 2)), CAST(354438.00 AS Decimal(18, 2)), N'KG', CAST(203000.00 AS Decimal(18, 2)), CAST(17721900.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(17721900.00 AS Decimal(18, 2)), N'', N'', N'02 no carton boxes only', N'Firmenich, France, Box#710 To 711', N'', NULL, N'Customer Product Code -952358', N'0000000855', N'EUR', N'JA60', N'60 days from invoice date', CAST(N'2025-03-17' AS Date), CAST(87.300000 AS Decimal(18, 6)), N'', N'', N'FR', N'CIP', N'4501321092', CAST(N'2024-10-08' AS Date), CAST(N'2025-03-19' AS Date), N'36000511', N'Export', N'RBL BANK', N'409001060394', N'Air', NULL, NULL, NULL, NULL, CAST(N'2025-07-10T10:43:13.000' AS DateTime), N'yes')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (20, CAST(N'2025-04-04' AS Date), N'8302001890', N'', N'354635', N'3300009758', N'0025000019', N'JC04_DGL', N'0', N'ZELU', N'Export w/o IGST-JCPL', N'Payan Bertrand S A', N'000000001000000457', N'Manufactured Product', N'3301 29 90', N'Jasmine Grandiflorum Absolute', N'0000015842', CAST(5.00 AS Decimal(18, 2)), CAST(2775.00 AS Decimal(18, 2)), CAST(235597.50 AS Decimal(18, 2)), N'KG', CAST(13875.00 AS Decimal(18, 2)), CAST(1177987.50 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1177987.50 AS Decimal(18, 2)), N'', N'', N'One no carton box only', N'Payan Bertrand, France. Box # 006', N'', NULL, N'2949)', N'0000001269', N'USD', N'JA30', N'30 days from invoice date', CAST(N'2025-05-04' AS Date), CAST(84.900000 AS Decimal(18, 6)), N'', N'', N'FR', N'CIP', N'25-IAS-002', CAST(N'2025-03-31' AS Date), NULL, N'', N'Export', N'HDFC Bank Ltd', N'50200028420224', N'Air', NULL, NULL, NULL, NULL, CAST(N'2025-07-10T10:59:59.000' AS DateTime), N'yes')
GO
INSERT [dbo].[tbl_sales] ([id], [bill_date], [billing_doc_no], [invoice_no], [sales_document], [delivery], [account_doc], [profit_center], [excise_invoice], [order_type], [billing_document_description], [customer_name], [material_no], [ext_group], [hsn_code], [description], [batch_no], [qty], [rate_unit_doc_curr], [rate_unit_inr], [uom], [basis_rate_doc_curr], [basis_rate_inr], [bcd_percent], [basic_custom_duty], [sws_percent], [social_welfare_schg], [sgst_percent], [sgst], [cgst_percent], [cgst], [igst_percent], [igst], [bed_16_percent], [cess_2_percent], [shcess_1_percent], [vat_4_percent], [cst], [surcharge], [net_amount], [packing_details], [transport], [no_kinds_of_package], [marks_container_nos], [insurance_policy_no], [lr_rr_date], [extra_header], [customer_code], [currency], [payterms], [payment_terms_description], [due_date], [exchange_rate], [mode_shipment], [gst_number], [country], [inco_terms], [customer_po_number], [customer_po_date], [date_of_realisation], [clearing_document_number], [sales_category], [our_bank_name], [our_bank_acct_no], [mode_of_transport], [status], [created_by], [created_at], [updated_by], [updated_at], [dispatch_status]) VALUES (21, CAST(N'2025-04-18' AS Date), N'8202000617', N'', N'354645', N'3200006612', N'0025000094', N'JC03_CBA', N'0', N'ZELU', N'Export w/o IGST-JCPL', N'Prima Fleur Botanicals, Inc.', N'000000001000007710', N'Manufactured Product', N'3301 29 90', N'Rose Centifolia Absolute', N'0000015603', CAST(1.00 AS Decimal(18, 2)), CAST(3550.00 AS Decimal(18, 2)), CAST(300685.00 AS Decimal(18, 2)), N'KG', CAST(3550.00 AS Decimal(18, 2)), CAST(300685.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(300685.00 AS Decimal(18, 2)), N'', N'', N'One No. Carton Box Only.', N'Prima Fleur, USA, Box# 004', N'', NULL, N'Products Scheme (RODTEP)"', N'0000001706', N'USD', N'JA30', N'30 days from invoice date', CAST(N'2025-05-18' AS Date), CAST(84.700000 AS Decimal(18, 6)), N'', N'', N'US', N'CIP', N'56757', CAST(N'2025-03-19' AS Date), NULL, N'', N'Export', N'HDFC Bank Ltd', N'50200028420224', N'Air', NULL, NULL, NULL, NULL, CAST(N'2025-06-15T22:24:05.000' AS DateTime), N'yes')
GO
SET IDENTITY_INSERT [dbo].[tbl_sales] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_statement] ON 
GO
INSERT [dbo].[tbl_statement] ([sl_no], [customer_code], [customer_name], [customer_group], [outstanding_value], [invoice_number], [invoice_date], [due_date], [total_paid_amount], [status], [created_date], [modified_date]) VALUES (1, N'CUST001', N'ABC Corporation Ltd.', N'Premium', CAST(75000.00 AS Decimal(15, 2)), N'INV-2025-101', CAST(N'2025-01-15T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-02-15T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(50000.00 AS Decimal(15, 2)), N'partial', CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[tbl_statement] ([sl_no], [customer_code], [customer_name], [customer_group], [outstanding_value], [invoice_number], [invoice_date], [due_date], [total_paid_amount], [status], [created_date], [modified_date]) VALUES (2, N'CUST002', N'XYZ Industries Pvt Ltd', N'Standard', CAST(0.00 AS Decimal(15, 2)), N'INV-2025-102', CAST(N'2025-01-15T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-02-15T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(85000.00 AS Decimal(15, 2)), N'paid', CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[tbl_statement] ([sl_no], [customer_code], [customer_name], [customer_group], [outstanding_value], [invoice_number], [invoice_date], [due_date], [total_paid_amount], [status], [created_date], [modified_date]) VALUES (3, N'CUST003', N'Global Trading Co.', N'Premium', CAST(300000.00 AS Decimal(15, 2)), N'INV-2025-103', CAST(N'2025-01-10T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-02-10T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(50000.00 AS Decimal(15, 2)), N'partial', CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[tbl_statement] ([sl_no], [customer_code], [customer_name], [customer_group], [outstanding_value], [invoice_number], [invoice_date], [due_date], [total_paid_amount], [status], [created_date], [modified_date]) VALUES (4, N'CUST004', N'Tech Solutions Ltd', N'Standard', CAST(50000.00 AS Decimal(15, 2)), N'INV-2025-104', CAST(N'2025-01-20T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-02-20T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(45000.00 AS Decimal(15, 2)), N'partial', CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[tbl_statement] ([sl_no], [customer_code], [customer_name], [customer_group], [outstanding_value], [invoice_number], [invoice_date], [due_date], [total_paid_amount], [status], [created_date], [modified_date]) VALUES (5, N'CUST005', N'Manufacturing Hub Inc', N'Premium', CAST(0.00 AS Decimal(15, 2)), N'INV-2025-105', CAST(N'2025-01-05T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-02-05T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(175000.00 AS Decimal(15, 2)), N'paid', CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[tbl_statement] ([sl_no], [customer_code], [customer_name], [customer_group], [outstanding_value], [invoice_number], [invoice_date], [due_date], [total_paid_amount], [status], [created_date], [modified_date]) VALUES (6, N'CUST006', N'Retail Chain Stores', N'Standard', CAST(200000.00 AS Decimal(15, 2)), N'INV-2025-106', CAST(N'2025-01-25T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-02-25T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(0.00 AS Decimal(15, 2)), N'pending', CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[tbl_statement] ([sl_no], [customer_code], [customer_name], [customer_group], [outstanding_value], [invoice_number], [invoice_date], [due_date], [total_paid_amount], [status], [created_date], [modified_date]) VALUES (7, N'CUST007', N'Express Logistics', N'Standard', CAST(20000.00 AS Decimal(15, 2)), N'INV-2025-107', CAST(N'2025-01-18T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-02-18T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(90000.00 AS Decimal(15, 2)), N'partial', CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[tbl_statement] ([sl_no], [customer_code], [customer_name], [customer_group], [outstanding_value], [invoice_number], [invoice_date], [due_date], [total_paid_amount], [status], [created_date], [modified_date]) VALUES (8, N'CUST008', N'Construction Materials Co', N'Premium', CAST(350000.00 AS Decimal(15, 2)), N'INV-2025-108', CAST(N'2025-01-12T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-02-12T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(100000.00 AS Decimal(15, 2)), N'partial', CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[tbl_statement] ([sl_no], [customer_code], [customer_name], [customer_group], [outstanding_value], [invoice_number], [invoice_date], [due_date], [total_paid_amount], [status], [created_date], [modified_date]) VALUES (9, N'CUST009', N'Food & Beverages Ltd', N'Standard', CAST(0.00 AS Decimal(15, 2)), N'INV-2025-109', CAST(N'2025-01-22T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-02-22T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(70000.00 AS Decimal(15, 2)), N'paid', CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset))
GO
INSERT [dbo].[tbl_statement] ([sl_no], [customer_code], [customer_name], [customer_group], [outstanding_value], [invoice_number], [invoice_date], [due_date], [total_paid_amount], [status], [created_date], [modified_date]) VALUES (10, N'CUST010', N'Electronics Wholesale', N'Premium', CAST(180000.00 AS Decimal(15, 2)), N'INV-2025-110', CAST(N'2025-01-28T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2025-02-28T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(100000.00 AS Decimal(15, 2)), N'partial', CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T10:13:52.0980000+00:00' AS DateTimeOffset))
GO
SET IDENTITY_INSERT [dbo].[tbl_statement] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_users] ON 
GO
INSERT [dbo].[tbl_users] ([id], [username], [password], [email_id], [role], [status], [last_login_datetime], [created_date], [modified_date], [first_name], [last_name], [phone], [role_id], [created_by], [customer_code]) VALUES (1, N'admin', N'$2a$12$jiLeH2queiohCgdXr/eIyet6ilbvwAjn4J6Nocwm4YWp2Z0PpibBm', N'admin@jasmine.com', N'admin', N'active', CAST(N'2025-07-30T11:45:40.1260000+00:00' AS DateTimeOffset), CAST(N'2025-07-24T18:32:29.0710000+00:00' AS DateTimeOffset), CAST(N'2025-07-30T11:45:40.1260000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_users] ([id], [username], [password], [email_id], [role], [status], [last_login_datetime], [created_date], [modified_date], [first_name], [last_name], [phone], [role_id], [created_by], [customer_code]) VALUES (2, N'customer1', N'$2a$12$ZTohipb0IEU6TzitOu/Aduuq5uKcl4yvIciSdfkQAzDOvatiHrFei', N'customer1@example.com', N'customer', N'active', NULL, CAST(N'2025-07-24T18:32:29.0710000+00:00' AS DateTimeOffset), CAST(N'2025-07-24T18:32:29.0710000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_users] ([id], [username], [password], [email_id], [role], [status], [last_login_datetime], [created_date], [modified_date], [first_name], [last_name], [phone], [role_id], [created_by], [customer_code]) VALUES (3, N'customer2', N'$2a$12$ZTohipb0IEU6TzitOu/Aduuq5uKcl4yvIciSdfkQAzDOvatiHrFei', N'customer2@example.com', N'customer', N'active', NULL, CAST(N'2025-07-24T18:32:29.0710000+00:00' AS DateTimeOffset), CAST(N'2025-07-24T18:32:29.0710000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_users] ([id], [username], [password], [email_id], [role], [status], [last_login_datetime], [created_date], [modified_date], [first_name], [last_name], [phone], [role_id], [created_by], [customer_code]) VALUES (4, N'demo_customer', N'$2a$10$sisDdMvfSMz8oUhD05w7s./2z/Y7QQ352UpSDNGAFSKFyH8ny.DOW', N'customer@demo.com', N'customer', N'active', CAST(N'2025-08-19T07:09:21.2310000+00:00' AS DateTimeOffset), CAST(N'2025-07-25T01:02:57.0166667+00:00' AS DateTimeOffset), CAST(N'2025-08-19T07:09:21.2500000+00:00' AS DateTimeOffset), N'Demo', N'Customer', N'+1234567891', 5, 1, N'CUST16425437')
GO
INSERT [dbo].[tbl_users] ([id], [username], [password], [email_id], [role], [status], [last_login_datetime], [created_date], [modified_date], [first_name], [last_name], [phone], [role_id], [created_by], [customer_code]) VALUES (7, N'john.doe', N'$2a$10$W2QTs.WkawBuNrYrDtlirOF6lLvMoC3r.AIWxdfWYF.vJjrn3sgmm', N'john.doe@company.com', NULL, N'active', CAST(N'2025-09-12T03:10:32.1166667+00:00' AS DateTimeOffset), CAST(N'2025-09-12T08:22:31.4633333+00:00' AS DateTimeOffset), CAST(N'2025-09-12T08:22:31.4633333+00:00' AS DateTimeOffset), N'John', N'Doe', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_users] ([id], [username], [password], [email_id], [role], [status], [last_login_datetime], [created_date], [modified_date], [first_name], [last_name], [phone], [role_id], [created_by], [customer_code]) VALUES (9, N'jane.smith', N'$2a$10$md1hiHXc0HexIWccLO2UUukVI6mEXJDnMca.dUkO.WenpasItrGQK', N'jane.smith@company.com', NULL, N'active', CAST(N'2025-09-12T03:22:18.0700000+00:00' AS DateTimeOffset), CAST(N'2025-09-12T08:22:31.5866667+00:00' AS DateTimeOffset), CAST(N'2025-09-12T08:22:31.5866667+00:00' AS DateTimeOffset), N'Jane', N'Smith', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tbl_users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__blog_cat__32DD1E4C692CD0CA]    Script Date: 12-09-2025 08:57:28 ******/
ALTER TABLE [dbo].[blog_categories] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__blog_pos__32DD1E4C6D546DEF]    Script Date: 12-09-2025 08:57:28 ******/
ALTER TABLE [dbo].[blog_posts] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__orders__8081A63A32CEF1FC]    Script Date: 12-09-2025 08:57:28 ******/
ALTER TABLE [dbo].[orders] ADD UNIQUE NONCLUSTERED 
(
	[invoice_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Sequeliz__72E12F1B4AD69271]    Script Date: 12-09-2025 08:57:28 ******/
ALTER TABLE [dbo].[SequelizeMeta] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_mark__B6456C2476863872]    Script Date: 12-09-2025 08:57:28 ******/
ALTER TABLE [dbo].[tbl_market_research] ADD UNIQUE NONCLUSTERED 
(
	[research_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_mom_number]    Script Date: 12-09-2025 08:57:28 ******/
ALTER TABLE [dbo].[tbl_meeting_minutes] ADD  CONSTRAINT [UC_mom_number] UNIQUE NONCLUSTERED 
(
	[mom_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_news__709D39C86FCA4DDE]    Script Date: 12-09-2025 08:57:28 ******/
ALTER TABLE [dbo].[tbl_news] ADD UNIQUE NONCLUSTERED 
(
	[news_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_prod__27546DE93331C2CB]    Script Date: 12-09-2025 08:57:28 ******/
ALTER TABLE [dbo].[tbl_products] ADD UNIQUE NONCLUSTERED 
(
	[product_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_role__783254B16D9E7E60]    Script Date: 12-09-2025 08:57:28 ******/
ALTER TABLE [dbo].[tbl_roles] ADD UNIQUE NONCLUSTERED 
(
	[role_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_user__3FEF876767D73162]    Script Date: 12-09-2025 08:57:28 ******/
ALTER TABLE [dbo].[tbl_users] ADD UNIQUE NONCLUSTERED 
(
	[email_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbl_user__F3DBC5723C672F53]    Script Date: 12-09-2025 08:57:28 ******/
ALTER TABLE [dbo].[tbl_users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[blog_categories] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[blog_comments] ADD  DEFAULT ('approved') FOR [status]
GO
ALTER TABLE [dbo].[blog_comments] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[blog_posts] ADD  DEFAULT ('draft') FOR [status]
GO
ALTER TABLE [dbo].[blog_posts] ADD  DEFAULT ((0)) FOR [view_count]
GO
ALTER TABLE [dbo].[blog_posts] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[blog_posts] ADD  DEFAULT (getdate()) FOR [modified_date]
GO
ALTER TABLE [dbo].[expert_settings] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[expert_settings] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[expert_settings] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ((1)) FOR [quantity]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (getdate()) FOR [invoice_date]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ('pending') FOR [status]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ('pending') FOR [payment_status]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[social_media_links] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[social_media_links] ADD  DEFAULT ((0)) FOR [sortOrder]
GO
ALTER TABLE [dbo].[social_media_links] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[social_media_links] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[tbl_invoice_to_delivery] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_invoice_to_delivery] ADD  DEFAULT (getdate()) FOR [modified_date]
GO
ALTER TABLE [dbo].[tbl_login_log] ADD  DEFAULT (getdate()) FOR [login_datetime]
GO
ALTER TABLE [dbo].[tbl_market_research] ADD  DEFAULT ((0)) FOR [priority]
GO
ALTER TABLE [dbo].[tbl_market_research] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_market_research] ADD  DEFAULT (getdate()) FOR [modified_date]
GO
ALTER TABLE [dbo].[tbl_meeting_minutes] ADD  DEFAULT ('[]') FOR [attendees]
GO
ALTER TABLE [dbo].[tbl_meeting_minutes] ADD  DEFAULT ('[]') FOR [action_items]
GO
ALTER TABLE [dbo].[tbl_meeting_minutes] ADD  DEFAULT ('draft') FOR [status]
GO
ALTER TABLE [dbo].[tbl_meeting_minutes] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_meeting_minutes] ADD  DEFAULT (getdate()) FOR [modified_date]
GO
ALTER TABLE [dbo].[tbl_meeting_minutes] ADD  DEFAULT ('[]') FOR [attachments]
GO
ALTER TABLE [dbo].[tbl_news] ADD  DEFAULT ((0)) FOR [priority]
GO
ALTER TABLE [dbo].[tbl_news] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_news] ADD  DEFAULT (getdate()) FOR [modified_date]
GO
ALTER TABLE [dbo].[tbl_page_log] ADD  DEFAULT (getdate()) FOR [datetime]
GO
ALTER TABLE [dbo].[tbl_products] ADD  DEFAULT ((0)) FOR [priority]
GO
ALTER TABLE [dbo].[tbl_products] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_products] ADD  DEFAULT (getdate()) FOR [modified_date]
GO
ALTER TABLE [dbo].[tbl_products] ADD  DEFAULT ((0)) FOR [peak_season_enabled]
GO
ALTER TABLE [dbo].[tbl_products] ADD  DEFAULT ((0)) FOR [harvest_season_enabled]
GO
ALTER TABLE [dbo].[tbl_roles] ADD  DEFAULT ('{"dashboard":false,"users":false,"roles":false,"products":false,"orders":false,"meetings":false,"market_reports":false,"payments":false}') FOR [permissions]
GO
ALTER TABLE [dbo].[tbl_roles] ADD  DEFAULT ('active') FOR [status]
GO
ALTER TABLE [dbo].[tbl_roles] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_roles] ADD  DEFAULT (getdate()) FOR [modified_date]
GO
ALTER TABLE [dbo].[tbl_sales] ADD  CONSTRAINT [df_dispatch_status]  DEFAULT ('no') FOR [dispatch_status]
GO
ALTER TABLE [dbo].[tbl_statement] ADD  DEFAULT ((0)) FOR [outstanding_value]
GO
ALTER TABLE [dbo].[tbl_statement] ADD  DEFAULT ((0)) FOR [total_paid_amount]
GO
ALTER TABLE [dbo].[tbl_statement] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_statement] ADD  DEFAULT (getdate()) FOR [modified_date]
GO
ALTER TABLE [dbo].[tbl_users] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_users] ADD  DEFAULT (getdate()) FOR [modified_date]
GO
ALTER TABLE [dbo].[blog_comments]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[blog_posts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[blog_comments]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[tbl_users] ([id])
GO
ALTER TABLE [dbo].[blog_post_categories]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[blog_categories] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[blog_post_categories]  WITH CHECK ADD FOREIGN KEY([post_id])
REFERENCES [dbo].[blog_posts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[blog_posts]  WITH CHECK ADD FOREIGN KEY([author_id])
REFERENCES [dbo].[tbl_users] ([id])
GO
ALTER TABLE [dbo].[tbl_login_log]  WITH CHECK ADD FOREIGN KEY([login_id])
REFERENCES [dbo].[tbl_users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_page_log]  WITH CHECK ADD FOREIGN KEY([login_id])
REFERENCES [dbo].[tbl_users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [CHK_order_status] CHECK  (([status]='cancelled' OR [status]='completed' OR [status]='delivered' OR [status]='shipped' OR [status]='processing' OR [status]='pending'))
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [CHK_order_status]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [CHK_payment_status] CHECK  (([payment_status]='refunded' OR [payment_status]='partial' OR [payment_status]='paid' OR [payment_status]='pending'))
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [CHK_payment_status]
GO
ALTER TABLE [dbo].[tbl_invoice_to_delivery]  WITH CHECK ADD CHECK  (([status]=N'delivered' OR [status]=N'dispatched' OR [status]=N'pending'))
GO
ALTER TABLE [dbo].[tbl_market_research]  WITH CHECK ADD CHECK  (([status]=N'inactive' OR [status]=N'active'))
GO
ALTER TABLE [dbo].[tbl_meeting_minutes]  WITH CHECK ADD CHECK  (([status]='archived' OR [status]='finalized' OR [status]='draft'))
GO
ALTER TABLE [dbo].[tbl_news]  WITH CHECK ADD CHECK  (([status]=N'inactive' OR [status]=N'active'))
GO
ALTER TABLE [dbo].[tbl_products]  WITH CHECK ADD CHECK  (([status]=N'inactive' OR [status]=N'active'))
GO
ALTER TABLE [dbo].[tbl_roles]  WITH CHECK ADD CHECK  (([status]='inactive' OR [status]='active'))
GO
ALTER TABLE [dbo].[tbl_sales]  WITH CHECK ADD  CONSTRAINT [chk_dispatch_status] CHECK  (([dispatch_status]='no' OR [dispatch_status]='yes'))
GO
ALTER TABLE [dbo].[tbl_sales] CHECK CONSTRAINT [chk_dispatch_status]
GO
ALTER TABLE [dbo].[tbl_statement]  WITH CHECK ADD CHECK  (([status]=N'paid' OR [status]=N'partial' OR [status]=N'pending'))
GO
ALTER TABLE [dbo].[tbl_users]  WITH CHECK ADD CHECK  (([role]=N'customer' OR [role]=N'admin'))
GO
ALTER TABLE [dbo].[tbl_users]  WITH CHECK ADD CHECK  (([status]=N'inactive' OR [status]=N'active'))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lorry Receipt Number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbl_invoice_to_delivery', @level2type=N'COLUMN',@level2name=N'lr_number'
GO
