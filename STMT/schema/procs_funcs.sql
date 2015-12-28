USE FinDW
GO

IF OBJECT_ID('dbo.getFactID','FN') IS NOT NULL
BEGIN
	PRINT 'drop dbo.getFactID'
	DROP FUNCTION dbo.getFactID;
END 
GO

PRINT 'create dbo.getFactID'	
GO
CREATE FUNCTION dbo.getFactID (
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