CREATE OR ALTER PROCEDURE [dbo].[sp_MonitorQueryStore]
(
	@CheckConfiguration BIT = 0,
	@Databases NVARCHAR(MAX) = 'ALL',
	@ConfigTable NVARCHAR(4000) = 'dbo.MonitorQueryStoreConfig'
	@LoggingTable NVARCHAR(4000) = 'dbo.MonitorQueryStoreLogging',
	@DefaultAlerting BIT = 1,
	@EnableReadWriteState BIT = 1,
	@UnforceFailedPlans BIT = 1,
	@UnforceFailedPlansThreshold INT = 5,
	@MonitorPlanRegression BIT = 0,
	@Debug BIT = 0
)
AS
BEGIN
/*
sp_MonitorQueryStore By DataPaws
Documentation: https://datapawsconsulting.com/sp_MonitorQueryStore
Version: 02/16/2026 13:43
GitHub: https://github.com/DataPaws/sp_MonitorQueryStore

Requirements:
	sp_ineachdb - From Brent Ozar's First Responder Kit - https://raw.githubusercontent.com/BrentOzarULTD/SQL-Server-First-Responder-Kit/main/sp_ineachdb.sql

Description:
	This procedure monitors various aspects of the SQL Server 2016+ feature Query Store and can generate alerts, 
	attempt to automatically resolve issues, and provide recommendations on Query Store related settings.
*/
