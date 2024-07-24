-- Find a list of subjects that a teacher teaches a student

SELECT s.student_name, sub.subject_name, t.teacher_name
FROM subjects sub
JOIN teachers t ON sub.teacher_id_fn = t.id
JOIN marks m ON sub.id = m.subject_id_fn
JOIN students s ON m.student_id_fn = s.id
WHERE t.teacher_name = "Mary Singh" -- replace Mary Singh with a corresponding teacher name
AND s.student_name = "James Ross" -- replace James Ross with a corresponding student name
GROUP BY s.student_name, sub.subject_name, t.teacher_name