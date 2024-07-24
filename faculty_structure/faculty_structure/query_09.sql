-- Find subjects that a student attends

SELECT s.student_name, sub.subject_name
FROM students s
JOIN marks m ON s.id = m.student_id_fn
JOIN subjects sub ON m.subject_id_fn = sub.id
WHERE s.student_name = "Thomas Walker"
GROUP BY sub.subject_name