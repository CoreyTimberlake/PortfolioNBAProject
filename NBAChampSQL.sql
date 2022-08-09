Select * 
From Portfolio..NBAChampions

-- Shows the number games won greatest to least
Select * 
From Portfolio..NBAChampions
Order by Number_of_Games_Won DESC;

--Inserted a permanent column for formula later
ALTER TABLE dbo.NBAChampions
ADD WinPercentage float;

-- Inserted Data to the new column created for the total win percentage for champions
Select * 
From Portfolio..NBAChampions
Update Portfolio..NBAChampions
SET WinPercentage = (Number_of_Games_Won/Number_of_Games_Played)*100

-- Shows data that is organized by win percentages from the nba champions greatest to least
Select * 
From Portfolio..NBAChampions
Order by WinPercentage DESC;

-- Data that shows the Maximum, Average, and Minimum winning percentage for NBA Champs
Select MAX(WinPercentage) as MaxWinPercentage
From Portfolio..NBAChampions

Select AVG(WinPercentage) as AverageWinPercentage
From Portfolio..NBAChampions

Select MIN(WinPercentage) as MinWinPercentage
From Portfolio..NBAChampions

-- Created Views for later Visualizations for the Maximum, Average, and Minimum winning percentage for NBA Champions
Create View MaxWinPercentageChamp as
Select MAX(WinPercentage) as MaxWinPercentage
From Portfolio..NBAChampions

Create View AverageWinPercentageChamp as
Select AVG(WinPercentage) as AverageWinPercentage
From Portfolio..NBAChampions

Create View MinWinPercentageChamp as
Select MIN(WinPercentage) as MinWinPercentage
From Portfolio..NBAChampions

-- Games needed to Win on average to have the best chance to win a NBA Championship formula (Atleast 58 games)
Select AVG(WinPercentage) * MAX(Number_of_games_Played)  as YouHaveToWin
From Portfolio..NBAChampions
