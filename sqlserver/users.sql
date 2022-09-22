-- bassel
-- baraa
-- mohamed
-- salma


-- bassel
-- [1]: create login
use master
GO
IF not EXISTS (SELECT * FROM sys.sql_logins WHERE name = N'BasselLoginUser')
BEGIN
    CREATE LOGIN [BasselLoginUser] WITH PASSWORD=N'3wHFYiYqRtAj63AGY2lPcCyGgTTuf9S6IzJFBcPajknAbA3dhTUa7QnqIQMc@22'
END
-- [2]: craete DB
CREATE DATABASE BasselDb;
GO
-- [3]: on DB create User
use BasselDb
GO
if (Not Exists(select * from sys.sysusers where name = 'BasselLoginUser'))
BEGIN;
    CREATE USER [BasselLoginUser] FOR LOGIN [BasselLoginUser] WITH DEFAULT_SCHEMA=[dbo]
END;
GO
-- [4]: insert role membership
IF ((select ISNULL(is_rolemember('db_owner', 'BasselLoginUser'),0)) <> 1)
BEGIN;
    --EXEC sp_addrolemember 'db_owner', 'BasselLoginUser'
    ALTER ROLE [db_owner] ADD MEMBER [BasselLoginUser];
END;
IF ((select ISNULL(is_rolemember('db_owner', 'BasselLoginUser'),0)) <> 1)
BEGIN;
    PRINT 'user not added to role try sp_addrolemember';
END;


-- baraa
-- [1]: create login
use master
GO
IF not EXISTS (SELECT * FROM sys.sql_logins WHERE name = N'BaraaLoginUser')
BEGIN
    CREATE LOGIN [BaraaLoginUser] WITH PASSWORD=N'pvTKDwXhBlEsGGrFRrbHDaxv6FtO7DhovbwfZCfolqi7J9IRyk5K2jLUjv1s@22'
END
-- [2]: craete DB
CREATE DATABASE BaraaDb;
GO
-- [3]: on DB create User
use BaraaDb
GO
if (Not Exists(select * from sys.sysusers where name = 'BaraaLoginUser'))
BEGIN;
    CREATE USER [BaraaLoginUser] FOR LOGIN [BaraaLoginUser] WITH DEFAULT_SCHEMA=[dbo]
END;
GO
-- [4]: insert role membership
IF ((select ISNULL(is_rolemember('db_owner', 'BaraaLoginUser'),0)) <> 1)
BEGIN;
    --EXEC sp_addrolemember 'db_owner', 'BaraaLoginUser'
    ALTER ROLE [db_owner] ADD MEMBER [BaraaLoginUser];
END;
IF ((select ISNULL(is_rolemember('db_owner', 'BaraaLoginUser'),0)) <> 1)
BEGIN;
    PRINT 'user not added to role try sp_addrolemember';
END;



-- mohamed
-- [1]: create login
use master
GO
IF not EXISTS (SELECT * FROM sys.sql_logins WHERE name = N'MohamedLoginUser')
BEGIN
    CREATE LOGIN [MohamedLoginUser] WITH PASSWORD=N'7qZ4MLUCXkeWQ0EaF8C2ov6n4oXm94If4XyXwTacDuVainaNukReqNCGKmi5@22'
END
-- [2]: craete DB
CREATE DATABASE MohamedDb;
GO
-- [3]: on DB create User
use MohamedDb
GO
if (Not Exists(select * from sys.sysusers where name = 'MohamedLoginUser'))
BEGIN;
    CREATE USER [MohamedLoginUser] FOR LOGIN [MohamedLoginUser] WITH DEFAULT_SCHEMA=[dbo]
END;
GO
-- [4]: insert role membership
IF ((select ISNULL(is_rolemember('db_owner', 'MohamedLoginUser'),0)) <> 1)
BEGIN;
    --EXEC sp_addrolemember 'db_owner', 'MohamedLoginUser'
    ALTER ROLE [db_owner] ADD MEMBER [MohamedLoginUser];
END;
IF ((select ISNULL(is_rolemember('db_owner', 'MohamedLoginUser'),0)) <> 1)
BEGIN;
    PRINT 'user not added to role try sp_addrolemember';
END;


-- salma
-- [1]: create login
use master
GO
IF not EXISTS (SELECT * FROM sys.sql_logins WHERE name = N'SalmaLoginUser')
BEGIN
    CREATE LOGIN [SalmaLoginUser] WITH PASSWORD=N'PIdxCT9KaIKnIH058y0zuTrTlSPMmofUSNmrwKddhu8YDokMwlqM7LC0VTOA@22'
END
-- [2]: craete DB
CREATE DATABASE SalmaDb;
GO
-- [3]: on DB create User
use SalmaDb
GO
if (Not Exists(select * from sys.sysusers where name = 'SalmaLoginUser'))
BEGIN;
    CREATE USER [SalmaLoginUser] FOR LOGIN [SalmaLoginUser] WITH DEFAULT_SCHEMA=[dbo]
END;
GO
-- [4]: insert role membership
IF ((select ISNULL(is_rolemember('db_owner', 'SalmaLoginUser'),0)) <> 1)
BEGIN;
    --EXEC sp_addrolemember 'db_owner', 'SalmaLoginUser'
    ALTER ROLE [db_owner] ADD MEMBER [SalmaLoginUser];
END;
IF ((select ISNULL(is_rolemember('db_owner', 'SalmaLoginUser'),0)) <> 1)
BEGIN;
    PRINT 'user not added to role try sp_addrolemember';
END;
