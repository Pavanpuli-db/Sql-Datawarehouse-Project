/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================

Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None.

    This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;

===============================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
	DECLARE  @Start_Time  DATETIME , @end_time DATETIME ;
   BEGIN TRY
	print '=============================';
	print 'Loading Bronze Layer ';
	print '=============================';
	print '---------------------------';
	print 'Loading CRM table ';
	print '---------------------------';
	SET @Start_Time  = GETDATE() ;
	print '>> Truncating table :  bronze.crm_customer_info';
	TRUNCATE TABLE bronze.crm_customer_info
	print '>> Inserting  table :  bronze.crm_customer_info';
	BULK INSERT bronze.crm_customer_info
	FROM  'C:\Users\Pavan\OneDrive\Desktop\DE PROJECT\Data ware house Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\\cust_info.csv'
	WITH (
		firstrow = 2,
		FIELDTERMINATOR = ',',
		TABLOCK ) ;
	SET @end_time = GETDATE();
	print '>> Loading Duration : ' + CAST ( DATEDIFF( second ,  @start_time , @end_time ) AS NVARCHAR ) + ' seconds'
	print '---------------------------';

	SET @Start_Time  = GETDATE() ;
	print '>> Truncating table : bronze.crm_prd_info';
	TRUNCATE TABLE bronze.crm_prd_info
	print '>> Inserting  table : bronze.crm_prd_info';
	BULK INSERT bronze.crm_prd_info
	FROM  'C:\Users\Pavan\OneDrive\Desktop\DE PROJECT\Data ware house Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\\prd_info.csv'
	WITH (
		firstrow = 2,
		FIELDTERMINATOR = ',',
		TABLOCK ) ;
		SET @end_time = GETDATE();
		print '>> Loading Duration : ' + CAST ( DATEDIFF( second ,  @start_time , @end_time ) AS NVARCHAR ) + ' seconds'
	print '---------------------------';


	SET @Start_Time  = GETDATE() ;
	print '>> Truncating table : bronze.crm_sales_info';
	TRUNCATE TABLE bronze.crm_sales_info
	print '>> Inserting  table :  bronze.crm_sales_info';
	BULK INSERT bronze.crm_sales_info
	FROM  'C:\Users\Pavan\OneDrive\Desktop\DE PROJECT\Data ware house Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\\sales_details.csv'
	WITH (
		firstrow = 2,
		FIELDTERMINATOR = ',',
		TABLOCK ) ;
		SET @end_time = GETDATE();
		print '>> Loading Duration : ' + CAST ( DATEDIFF( second ,  @start_time , @end_time ) AS NVARCHAR ) + 'seconds'
		print '---------------------------';

	print '---------------------------';
	print 'Loading ERP table ';
	print '---------------------------';
	SET @Start_Time  = GETDATE() ;
	print '>> Truncating table :bronze.erp_cust_info';
	TRUNCATE TABLE  bronze.erp_cust_info
	print '>> Inserting  table : bronze.erp_cust_info';
	BULK INSERT  bronze.erp_cust_info
	FROM  'C:\Users\Pavan\OneDrive\Desktop\DE PROJECT\Data ware house Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\\CUST_AZ12.CSV'
	WITH (
		firstrow = 2,
		FIELDTERMINATOR = ',',
		TABLOCK ) ;
		SET @end_time = GETDATE();
		print '>> Loading Duration : ' + CAST ( DATEDIFF( second ,  @start_time , @end_time ) AS NVARCHAR ) + 'seconds'
	print '---------------------------';


	SET @Start_Time  = GETDATE() ;
	print '>> Truncating table : bronze.erp_loc_info';
	TRUNCATE TABLE  bronze.erp_loc_info
	print '>> Inserting  table :  bronze.erp_loc_info';
	BULK INSERT bronze.erp_loc_info
	FROM  'C:\Users\Pavan\OneDrive\Desktop\DE PROJECT\Data ware house Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\\LOC_A101.CSV'
	WITH (
		firstrow = 2,
		FIELDTERMINATOR = ',',
		TABLOCK ) ;
		SET @end_time = GETDATE();
		print '>> Loading Duration : ' + CAST ( DATEDIFF( second ,  @start_time , @end_time ) AS NVARCHAR ) + 'seconds'
	print '---------------------------';


	SET @Start_Time  = GETDATE();
	print '>> Truncating table : bronze.erp_cat_info';
	TRUNCATE TABLE  bronze.erp_cat_info
	print '>> Inserting  table :  bronze.erp_cat_info';
	BULK INSERT  bronze.erp_cat_info
	FROM  'C:\Users\Pavan\OneDrive\Desktop\DE PROJECT\Data ware house Project\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\\PX_CAT_G1V2.CSV'
	WITH (
		firstrow = 2,
		FIELDTERMINATOR = ',',
		TABLOCK ) ;
		SET @end_time = GETDATE();
		print '>> Loading Duration : ' + CAST ( DATEDIFF( second ,  @start_time , @end_time ) AS NVARCHAR ) + 'seconds'
	print '---------------------------';


	END TRY 
	BEGIN CATCH



    END CATCH 
END
 
