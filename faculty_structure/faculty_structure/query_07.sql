-- Find marks of a certain subject in a group

SELECT s.student_name, g.group_name, m.mark_value, sub.subject_name
FROM marks m
JOIN students s ON m.student_id_fn = s.id
JOIN groups g ON s.group_id_fn = g.id
JOIN subjects sub ON m.subject_id_fn = sub.id
WHERE sub.subject_name = 'Art' -- replace Art with the corresponding subject name
-- WHERE sub.id = 1 -- or replace 1 with the corresponding subject id
-- AND g.group_name = "Allisonhaven" -- replace Allisonhaven with the corresponding group name
AND g.id = 1 -- -- or replace 1 with the corresponding group id
ORDER BY s.student_name ASC