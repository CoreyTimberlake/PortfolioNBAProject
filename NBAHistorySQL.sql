Select * 
From Portfolio..HistoricalData

Select *
From Portfolio..HistoricalData
Where Year IS NOT NULL
AND Team IS NOT NULL
AND Record IS NOT NULL
AND Winning_Percentage IS NOT NULL;

-- Adding Constraints to avoid Nulls changing them to None Provided
ALTER TABLE dbo.HistoricalData ADD CONSTRAINT DF_Year DEFAULT ('NONE PROVIDED') FOR Year;
ALTER TABLE dbo.HistoricalData ADD CONSTRAINT DF_Team DEFAULT ('NONE PROVIDED') FOR Team;
ALTER TABLE dbo.HistoricalData ADD CONSTRAINT DF_Record DEFAULT ('NONE PROVIDED') FOR Record;
ALTER TABLE dbo.HistoricalData ADD CONSTRAINT DF_Winning_Percentage DEFAULT ('NONE PROVIDED') FOR Winning_Percentage;

-- Data that shows total winning percentage by team that is greater than the average
Select *
From Portfolio..HistoricalData
Where Winning_Percentage > (SELECT AVG(Winning_Percentage) From Portfolio..HistoricalData) 

-- Data that shows total winning percentage by team that is less than the average
Select *
From Portfolio..HistoricalData
Where Winning_Percentage < (SELECT AVG(Winning_Percentage) From Portfolio..HistoricalData) 

-- Data that shows the Maximum, Average, and Minimum winning percentage in NBA History
Select MAX(Winning_Percentage) as MaxWinPercentage
From Portfolio..HistoricalData

Select AVG(Winning_Percentage) as AverageWinPercentage
From Portfolio..HistoricalData

Select MIN(Winning_Percentage) as MinWinPercentage
From Portfolio..HistoricalData

-- Created Views for later Visualizations for the Maximum, Average, and Minimum winning percentage in NBA History 
Create View MaxWinPercentageHist as
Select MAX(Winning_Percentage) as MaxWinPercentage
From Portfolio..HistoricalData

Create View AverageWinPercentageHist as
Select AVG(Winning_Percentage) as AverageWinPercentage
From Portfolio..HistoricalData

Create View MinWinPercentageHist as
Select MIN(Winning_Percentage) as MinWinPercentage
From Portfolio..HistoricalData