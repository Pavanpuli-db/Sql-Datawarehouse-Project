/*  
====================================
CREATE DATA BASE AND SCHEMAS 
====================================

Script Purpose : This Scripts creates new Database names ' Datawarehouse' After checkinf if it already exists 
If the data base exists , it was fropped and recreated , Additionally thus script was up to three Schemas with in the Database : 'Bronze , Silver and , Gold;

WARNING : 
	Running this scripts will drop the entire  database 'Datawarehouse; if exists .
	All the data will be perminantly Deleted , Procced with caution and ensure you have  back up for running this scripts .

*/
 USE master;
 GO

 -- DROP and RECREATE Datawarehouse 
 IF exists ( select  1 from sys.databases where name ='Datawarehouse')
	Begin 
	ALTER DATABASE  Datawarehouse  SET single_user WITH ROLLBACK IMMEDIATE;
	DROP  DATABASE  Datawarehouse
	END ;

	GO 

	----CREATE THE DATABASE 'Datawarehouse'
	CREATE DATABASE Datawarehouse;
	GO 
	USE Datawarehouse
	---CREATE SCHEMAS 
	CREATE  SCHEMA Bronze;
	GO
	CREATE   SCHEMA Silver ;
	GO
	CREATE  SCHEMA Gold ;
	GO
