use FinDW
GO
SELECT * FROM SSISDB.catalog.object_parameters;
--CREATE table stmt_download_requests (
--	CID bigint,
--	period_cnt tinyint,
--	request_date date
--)
--CREATE VIEW vw_stmt_download_requests AS SELECT * FROM stmt_download_requests;
TRUNCATE TABLE stmt_download_requests;
INSERT INTO stmt_download_requests SELECT TOP 10 CID, FLOOR(RAND()*10), GETDATE() FROM dim.Stock WHERE CID IS NOT NULL ORDER BY NEWID();
SELECT * FROM vw_stmt_download_requests;