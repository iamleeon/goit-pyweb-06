-- Find an average mark a teacher gives for their subjects

SELECT t.teacher_name, sub.subject_name, ROUND(AVG(m.mark_value), 0) AS average_mark
FROM teachers t
JOIN subjects sub ON t.id = sub.teacher_id_fn
JOIN marks m ON sub.id = m.subject_id_fn
WHERE t.teacher_name = "Mary Singh" -- replace Mary Singh with a corresponding teacher name
--WHERE t.id = 4 -- or use a teacher_id
GROUP BY t.teacher_name, sub.subject_name