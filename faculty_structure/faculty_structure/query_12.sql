-- Find the recent students marks (from the last lesson) in a group from a subject

SELECT s.student_name, g.group_name, m.mark_value, m.mark_date, sub.subject_name
FROM students s
JOIN groups g ON s.group_id_fn = g.id
JOIN marks m ON s.id = m.student_id_fn
JOIN subjects sub ON m.subject_id_fn = sub.id
WHERE g.group_name = "Group A" -- replace Group A with a group name
AND sub.subject_name = "English" -- replace English with a subject name
-- or use ids
--WHERE g.id = 1
--AND sub.id = 1
AND m.mark_date = (
	SELECT MAX(m2.mark_date)
	FROM marks m2
	JOIN students s2 ON m2.student_id_fn = s2.id
	JOIN subjects sub2 ON m2.subject_id_fn = sub2.id
	JOIN groups g2 ON s2.group_id_fn = g2.id
	WHERE g2.group_name = g.group_name
	AND sub2.subject_name = sub.subject_name
	)