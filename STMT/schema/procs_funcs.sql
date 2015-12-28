USE FinDW
GO

IF OBJECT_ID('dbo.CID','FN') IS NOT NULL
BEGIN
	PRINT 'drop dbo.CID'
	DROP FUNCTION dbo.CID;
END 
GO

CREATE FUNCTION dbo.CID (
	@CID bigint
	,@PeriodEndDateID int
	,@StatementID tinyint
	,@AccountID int
	,@SubAccountID int
) 
RETURNS bigint 
AS
BEGIN
	RETURN CONCAT(@CID, @PeriodEndDateID, @StatementID, FORMAT(@AccountID,'00#'), FORMAT(@SubAccountID,'00#'));
END