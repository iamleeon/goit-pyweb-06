-- Find the average mark across all marks

SELECT ROUND(AVG(m.mark_value), 0) AS average_mark
FROM marks m