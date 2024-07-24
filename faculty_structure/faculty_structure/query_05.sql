-- Find what subjects a certain teacher teaches

SELECT s.subject_name, t.teacher_name
FROM subjects s
JOIN teachers t ON s.teacher_id_fn = t.id
-- by teacher's name, replace Matthew Johnson with the corresponding name
WHERE t.teacher_name = "Matthew Johnson"
-- by teacher's id, replace 1 with the corresponding id
--WHERE t.id = 1
