-- Find the list of students from a group

SELECT s.student_name, g.group_name
FROM students s
JOIN groups g ON s.group_id_fn = g.id
-- by group_name, replace Carltown with a corresponding group name
--WHERE group_name = 'Carltown'
-- by group_id, replace 1 with a corresponding group id
WHERE g.id = 1
ORDER BY s.student_name ASC