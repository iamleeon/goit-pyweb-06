-- Find a student with the highest average mark from a specific subject

SELECT s.student_name, ROUND(AVG(m.mark_value), 0) AS average_mark, sub.subject_name
FROM students s
JOIN marks m ON s.id = m.student_id_fn
JOIN subjects sub ON m.subject_id_fn = sub.id
WHERE m.subject_id_fn IS 1 -- Replace 1 with a subject id
GROUP BY s.id, s.student_name
ORDER BY average_mark DESC
LIMIT 1
