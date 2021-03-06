
/* Drop Tables */

IF ObJECt_ID('[SEC_USER]') IS NOT NULL DROP TABLE [SEC_USER];
IF ObJECt_ID('[SP_AGGREGATOR]') IS NOT NULL DROP TABLE [SP_AGGREGATOR];
IF ObJECt_ID('[ADDRESS]') IS NOT NULL DROP TABLE [ADDRESS];
IF ObJECt_ID('[USER_ROLE]') IS NOT NULL DROP TABLE [USER_ROLE];
IF ObJECt_ID('[USER_TYPE]') IS NOT NULL DROP TABLE [USER_TYPE];




/* Create Tables */

CREATE TABLE [ADDRESS]
(
	[ADDRESS_ID] int NOT NULL UNIQUE IDENTITY ,
	[LINE1] nvarchar(100) NOT NULL,
	[LINE2] nvarchar(100) NOT NULL,
	[CITY] nvarchar(100) NOT NULL,
	[STATE] nvarchar(50) NOT NULL,
	[ZIP] nvarchar(7) NOT NULL,
	PRIMARY KEY ([ADDRESS_ID])
);


CREATE TABLE [SEC_USER]
(
	[USER_ID] int NOT NULL UNIQUE IDENTITY ,
	[ENABLED] binary,
	[EXTERNAL_CODE] nvarchar(255),
	[FAILED_LOGIN_ATTEMPTS] int,
	[FAILED_PSSWD_RECOVERY_ATTEMPTS] int,
	[PASSWORD] nvarchar(255) NOT NULL,
	[SOFT_LOCK_EXPIRES] time,
	[TEMPORARY_PASSWORD] binary,
	[USERNAME] nvarchar(255) NOT NULL,
	[FIRST_NAME] nvarchar(255) NOT NULL,
	[LAST_NAME] nvarchar(255) NOT NULL,
	[EMAIL] nvarchar(255) NOT NULL,
	[ROLE_ID] int NOT NULL UNIQUE,
	[USER_TYPE_ID] int NOT NULL UNIQUE,
	[AGGREGATOR_ID] int,
	PRIMARY KEY ([USER_ID])
);


CREATE TABLE [SP_AGGREGATOR]
(
	[AGGREGATOR_ID] int NOT NULL UNIQUE IDENTITY ,
	[BUSINESS_PHONE_NUM] nvarchar(15),
	[BUSINESS_PHONE_NUM_EXT] nvarchar(10),
	[BUSINESS_EMAIL_ADDRESS] nvarchar(100),
	[PHONE_NUM] nvarchar(15),
	[PHONE_NUM_EXT] nvarchar(10),
	[WEB_SITE_ADDRESS] nvarchar(100),
	[LOGO] nvarchar(500),
	[ADDRESS_ID] int NOT NULL UNIQUE,
	PRIMARY KEY ([AGGREGATOR_ID])
);


CREATE TABLE [USER_ROLE]
(
	[ROLE_ID] int NOT NULL UNIQUE IDENTITY ,
	[INTERNAL_CODE] nvarchar(255) NOT NULL UNIQUE,
	PRIMARY KEY ([ROLE_ID])
);


CREATE TABLE [USER_TYPE]
(
	[USER_TYPE_ID] int NOT NULL UNIQUE IDENTITY ,
	[INTERNAL_CODE] nvarchar(255) NOT NULL UNIQUE,
	PRIMARY KEY ([USER_TYPE_ID])
);



/* Create Foreign Keys */

ALTER TABLE [SP_AGGREGATOR]
	ADD FOREIGN KEY ([ADDRESS_ID])
	REFERENCES [ADDRESS] ([ADDRESS_ID])
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE [SEC_USER]
	ADD FOREIGN KEY ([AGGREGATOR_ID])
	REFERENCES [SP_AGGREGATOR] ([AGGREGATOR_ID])
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE [SEC_USER]
	ADD FOREIGN KEY ([ROLE_ID])
	REFERENCES [USER_ROLE] ([ROLE_ID])
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE [SEC_USER]
	ADD FOREIGN KEY ([USER_TYPE_ID])
	REFERENCES [USER_TYPE] ([USER_TYPE_ID])
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



