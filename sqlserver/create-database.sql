-- bassel - Bassel@sk22
-- baraa - Baraa@sk22
-- mohamed - Mohamed@sk22
-- salma - Salma@sk22


CREATE LOGIN bassel WITH PASSWORD = 'Bassel@sk22'
GO
CREATE DATABASE bassel;
GO
USE bassel;
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'bassel')
BEGIN
    CREATE USER [bassel] FOR LOGIN [bassel]
    EXEC sp_addrolemember N'db_owner', N'bassel'
    EXEC master..sp_addsrvrolemember @loginame = N'bassel', @rolename = N'sysadmin'
END;
GO