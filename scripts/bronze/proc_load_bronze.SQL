-- USE DataWarehouse

/*

Stored Procedure: load bronze layer from source.

SCRIPT PURPOSE:
  This stored procedure batch loads data into the bronze schema from external CSV files.
  It performs the following actions:
    1. Tranculates the bronze tables before loading data.
    2. Uses 'BULK INSERT' command to load data from CSV fils to bronze tables.

  PARAMETERS:
    None
    This stored procedure does not accept any parameters or return any values.

  USAGE EXAMPLE:
    EXEC bronze.load_bronze;

*/


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN

	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;

	BEGIN TRY

		SET @batch_start_time = GETDATE();

		PRINT'=========================='
		PRINT'lOADING BRONZE LAYER'
		PRINT'=========================='

		PRINT'--------------------------'
		PRINT'loading CRM Tables'
		PRINT'--------------------------'

		SET @start_time = GETDATE();

		PRINT '>> Truncating Table: bronze.crm_cust_info';

		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT '>> Inserting Data Into Table: bronze.crm_cust_info';

		BULK INSERT bronze.crm_cust_info
		FROM 'D:\DataWithBaraa\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);

		SET @end_time = GETDATE();
		PRINT '>> crm_cust_info Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT'--------------------------------------';

		-- SELECT * FROM bronze.crm_cust_info

		SET @start_time = GETDATE();

		PRINT '>> Truncating Table: bronze.crm_prd_info';

		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>> Inserting Data Into Table: bronze.crm_prd_info';

		BULK INSERT bronze.crm_prd_info
		FROM 'D:\DataWithBaraa\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);

		SET @end_time = GETDATE();
		PRINT '>> crm_prd_info Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT'--------------------------------------';

		 -- SELECT * FROM bronze.crm_prd_info

		SET @start_time = GETDATE();

		PRINT '>> Truncating Table: bronze.crm_sales_details';

		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>> Inserting Data Into Table: bronze.crm_sales_details';

		BULK INSERT bronze.crm_sales_details
		FROM 'D:\DataWithBaraa\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);

		SET @end_time = GETDATE();
		PRINT '>> crm_sales_details Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		 -- SELECT * FROM bronze.crm_sales_details

	 
		PRINT'--------------------------'
		PRINT'loading ERP Tables'
		PRINT'--------------------------'

		SET @start_time = GETDATE();

		PRINT '>> Truncating Table: bronze.erp_cust_az12';

		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT '>> Inserting Data Into Table: bronze.erp_cust_az12';

		BULK INSERT bronze.erp_cust_az12
		FROM 'D:\DataWithBaraa\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);

		SET @end_time = GETDATE();
		PRINT '>> erp_cust_az12 Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT'--------------------------------------';

		 -- SELECT * FROM bronze.erp_cust_az12

		SET @start_time = GETDATE();

		PRINT '>> Truncating Table: bronze.erp_loc_a101';

		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT '>> Inserting Data Into Table: bronze.erp_loc_a101';

		BULK INSERT bronze.erp_loc_a101
		FROM 'D:\DataWithBaraa\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);

		 -- SELECT * FROM bronze.erp_loc_a101

		SET @end_time = GETDATE();
		PRINT '>> erp_loc_a101 Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT'--------------------------------------'

		SET @start_time = GETDATE();

		PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';

		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		PRINT '>> Inserting Data Into Table: bronze.erp_px_cat_g1v2';

		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'D:\DataWithBaraa\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK 
		);

		SET @end_time = GETDATE();
		PRINT '>> erp_px_cat_g1v2 Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT'--------------------------------------';

		 -- SELECT * FROM bronze.erp_px_cat_g1v2

		SET @batch_end_time = GETDATE();

		PRINT '============================='
		PRINT 'Loading Bronza Layer Complete'
		PRINT '>> Full Batch Load Duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '============================='

	END TRY
	BEGIN CATCH
		PRINT'============================='
		PRINT'ERROR OCCURED DURING LOADING BRONZE DATA'
		PRINT'Error Message:' + ERROR_MESSAGE();
		PRINT'Error Number:' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT'Error Number:' + CAST (ERROR_STATE() AS NVARCHAR);

		PRINT'============================='


	END CATCH
END
