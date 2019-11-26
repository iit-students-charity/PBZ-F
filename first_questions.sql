-- 1
SELECT * FROM teacher;
-- 2
SELECT * FROM student_group WHERE (specialty = 'ЭВМ');
-- 3
SELECT DISTINCT personal_number, auditorium FROM teacher_student_group WHERE subject_number = '18П';
-- 4
SELECT DISTINCT subject_number, subject.name FROM subject INNER JOIN teacher_student_group ON 
    subject.code = teacher_student_group.subject_number WHERE
        personal_number = (SELECT personal_number FROM teacher WHERE surname = 'Костин');
-- 5
SELECT student_group.code FROM student_group INNER JOIN teacher_student_group ON 
    student_group.code = teacher_student_group.group_number WHERE
        personal_number = (SELECT personal_number FROM teacher WHERE surname = 'Фролов');
-- 6
SELECT * FROM subject WHERE specialty = 'АСОИ';
-- 7
SELECT * FROM teacher WHERE specialty LIKE '%АСОИ%';
-- 8
SELECT DISTINCT surname FROM teacher INNER JOIN teacher_student_group ON teacher.personal_number = teacher_student_group.personal_number
    WHERE auditorium = 210;
-- 9
SELECT s.name, st.name FROM teacher_student_group tsg LEFT JOIN 
    subject s ON s.code = tsg.subject_number LEFT JOIN student_group st ON tsg.group_number = st.code
        WHERE auditorium BETWEEN 100 AND 200;
-- 10
SELECT first_group.code, second_group.code FROM student_group first_group INNER JOIN student_group second_group ON
    first_group.specialty = second_group.specialty WHERE first_group.code < second_group.code;
-- 11
SELECT sum(size) FROM student_group WHERE specialty = 'ЭВМ';
-- 12
SELECT DISTINCT personal_number FROM teacher_student_group INNER JOIN student_group ON
    teacher_student_group.group_number = student_group.code WHERE specialty = 'ЭВМ';
-- 13
SELECT subject_schedule.code FROM (SELECT subject.code, count() as gr_count FROM subject INNER JOIN teacher_student_group ON
        subject.code = teacher_student_group.subject_number GROUP BY subject.code) as subject_schedule
                WHERE gr_count = (SELECT count(*) FROM student_group);
-- 14
CREATE VIEW v1 AS SELECT DISTINCT teacher.personal_number FROM teacher INNER JOIN 
                teacher_student_group ON teacher.personal_number = teacher_student_group.personal_number
                        WHERE subject_number = '14П';

SELECT DISTINCT personal_number FROM (SELECT DISTINCT subject_number FROM teacher_student_group WHERE 
        personal_number = (SELECT * FROM v1)) AS teachers INNER JOIN teacher_student_group ON 
                                teachers.subject_number = teacher_student_group.subject_number WHERE 
                                        teacher_student_group.personal_number NOT IN (SELECT * FROM v1);
-- 15
SELECT DISTINCT subject.* FROM subject INNER JOIN teacher_student_group tsg ON 
        subject.code = tsg.subject_number WHERE tsg.subject_number NOT IN (SELECT subject.code FROM subject
                INNER JOIN teacher_student_group ON subject.code = teacher_student_group.subject_number WHERE personal_number = '221Л');
-- 16
SELECT * FROM subject WHERE subject.code NOT IN (SELECT DISTINCT tsg.subject_number FROM student_group 
        INNER JOIN teacher_student_group tsg ON student_group.code = tsg.group_number
                WHERE group_number = (SELECT code FROM student_group WHERE name = 'М-6'));
-- 17
SELECT teacher.* FROM teacher
    INNER JOIN teacher_student_group l2s on teacher.personal_number = l2s.personal_number
        WHERE teacher.position LIKE 'Доцент' AND (l2s.group_number LIKE '3Г' OR l2s.group_number LIKE '8Г');
-- 18
SELECT tsg.subject_number,
       tsg.personal_number,
       tsg.group_number FROM teacher_student_group tsg INNER JOIN teacher 
            ON tsg.personal_number = teacher.personal_number WHERE department = 'ЭВМ' AND specialty LIKE '%АСОИ%';
-- 19
SELECT DISTINCT student_group.code FROM teacher INNER JOIN student_group ON teacher.specialty LIKE (SELECT concat('%', student_group.specialty, '%'));
-- 20
SELECT DISTINCT teacher.personal_number FROM teacher INNER JOIN teacher_student_group l2s 
    ON teacher.personal_number = l2s.personal_number WHERE l2s.subject_number IN (SELECT subject.code
        FROM subject INNER JOIN student_group ON student_group.specialty = subject.specialty) AND department = 'ЭВМ';
-- 21
SELECT DISTINCT specialty FROM student_group INNER JOIN teacher_student_group ON student_group.code =
        teacher_student_group.group_number WHERE personal_number = (SELECT personal_number FROM
                teacher WHERE department = 'АСУ');
-- 22
CREATE VIEW v2 AS SELECT subject.code FROM subject INNER JOIN teacher_student_group ON
        subject.code = teacher_student_group.subject_number WHERE
                group_number = (SELECT code FROM student_group WHERE name = 'АС-8');

SELECT * FROM v2;
-- 23
CREATE VIEW v3 AS SELECT DISTINCT group_number FROM teacher_student_group WHERE subject_number IN (SELECT * FROM v2);

SELECT * FROM v3;
-- 24
SELECT DISTINCT code FROM student_group WHERE code NOT IN (SELECT * FROM v3);
-- 25
SELECT student_group.code FROM student_group WHERE code NOT IN 
        (SELECT student_group.code FROM student_group INNER JOIN teacher_student_group tsg ON student_group.code = tsg.group_number
                WHERE tsg.subject_number IN (SELECT subject_number FROM teacher_student_group WHERE personal_number = '430Л'));
-- 26
SELECT teacher.personal_number FROM teacher INNER JOIN teacher_student_group tsg ON 
        teacher.personal_number = tsg.personal_number WHERE tsg.group_number LIKE (SELECT student_group.code
                FROM student_group WHERE student_group.name LIKE 'Э-15') AND tsg.personal_number NOT IN (SELECT teacher_student_group.personal_number
                        FROM teacher_student_group WHERE teacher_student_group.subject_number LIKE '12П');