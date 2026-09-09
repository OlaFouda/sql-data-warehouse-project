/*
Script purpose:
	this script creates a new database named 'DataWarhouse' after a safety check if it already exists.
	If exists, it's dropped and recreated.
	Also, the scipt sets up three schemas: 'bronze', 'silver', 'gold'

*/



USE master;
GO

-- recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.database WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE Datawarehouse;
END;
GO



-- Create th 'DataWarehouse' database 
CREATE DATABASE DataWarehouse;
USE DataWarehouse;

--Create Schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
