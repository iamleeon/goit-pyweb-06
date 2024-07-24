-- Find 5 students with the highest average mark from all the subjects

SELECT s.student_name, ROUND(AVG(m.mark_value), 0) AS average_mark
FROM students s
JOIN marks m ON s.id = m.student_id_fn
GROUP BY s.id, s.student_name
ORDER BY average_mark DESC
LIMIT 5