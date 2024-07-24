-- Find group average mark from a specific subject

SELECT g.group_name, sub.subject_name, ROUND(AVG(m.mark_value), 0) AS average_mark
FROM groups g
JOIN students s ON g.id = s.group_id_fn
JOIN marks m ON s.id = m.student_id_fn
JOIN subjects sub ON m.subject_id_fn = sub.id
WHERE sub.id = 1 -- Replace 1 with a subject id
GROUP BY g.group_name
