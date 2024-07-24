-- Find average mark that a teacher gives a student

SELECT s.student_name, ROUND(AVG(m.mark_value), 0) AS average_mark, t.teacher_name
FROM students s
JOIN marks m ON s.id = m.student_id_fn
JOIN subjects sub ON m.subject_id_fn = sub.id
JOIN teachers t ON sub.teacher_id_fn = t.id
WHERE t.teacher_name = "Mary Singh"
AND s.student_name = "James Ross"
-- or with teacher id and student id
--WHERE t.id = 1
--AND s.id = 1
GROUP BY s.student_name, t.teacher_name