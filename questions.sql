SELECT * FROM teacher;

SELECT * FROM student_group WHERE (specialty = 'ЭВМ');

SELECT (personal_number, auditorium) FROM teacher_student_group WHERE (subject_number = '18П');

SELECT (subject.code, subject.name) FROM
  subject INNER JOIN teacher_student_group ON (subject.code = teacher_student_group.subject_number)
  WHERE (personal_number = (SELECT personal_number FROM teacher WHERE (surname = 'Костин')));

SELECT (student_group.code) FROM student_group INNER JOIN teacher_student_group ON
  (student_group.code = teacher_student_group.group_number) WHERE
  (personal_number = (SELECT personal_number FROM teacher WHERE (surname = 'Фролов')));

SELECT * FROM subject WHERE (specialty = 'АСОИ');

SELECT teacher.*,
       teacher_student_group.group_number,
       teacher_student_group.subject_number,
       teacher_student_group.auditorium
  FROM teacher
         INNER JOIN teacher_student_group
                    ON (teacher.personal_number = teacher_student_group.personal_number)
  WHERE specialty LIKE '%АСОИ%';

SELECT DISTINCT teacher.surname FROM teacher INNER JOIN teacher_student_group
  ON teacher.personal_number = teacher_student_group.personal_number
  WHERE auditorium = 210;

SELECT DISTINCT subject.name, group_schedule.name FROM subject INNER JOIN (SELECT
        student_group.name, teacher_student_group.subject_number FROM student_group INNER JOIN
        teacher_student_group ON (student_group.code = teacher_student_group.group_number)
        WHERE (auditorium >= 100) AND (auditorium <=200)) AS group_schedule ON (subject.code = group_schedule.subject_number);


SELECT DISTINCT f.name AS first_group, s.name AS second_group FROM student_group f INNER JOIN student_group s
    ON f.specialty = s.specialty WHERE f.code != s.code;

SELECT sum(size) FROM student_group WHERE specialty = 'ЭВМ';

SELECT DISTINCT teacher_student_group.personal_number FROM student_group INNER JOIN teacher_student_group ON
    (student_group.code = teacher_student_group.group_number) WHERE (student_group.specialty = 'ЭВМ');

SELECT subject_number FROM teacher_student_group WHERE (SELECT COUNT(*) FROM teacher_student_group WHERE (subject_number = (SELECT code FROM subject)) = 6);

SELECT DISTINCT surname FROM teacher INNER JOIN teacher_student_group tsg ON
    (teacher.personal_number = tsg.personal_number) WHERE tsg.subject_number IN (SELECT subject.code FROM subject INNER JOIN
    teacher_student_group tsg ON (subject.code = tsg.subject_number) WHERE tsg.personal_number IN (SELECT teacher.personal_number FROM
      teacher INNER JOIN teacher_student_group tsg ON (teacher.personal_number = tsg.personal_number) WHERE tsg.subject_number = '14П'));

SELECT * FROM subject INNER JOIN teacher_student_group tsg ON (subject.code = tsg.subject_number) WHERE
    subject.code != (SELECT subject.code FROM subject INNER JOIN
      teacher_student_group tsg ON (subject.code = tsg.subject_number) WHERE (tsg.personal_number = '221Л'));
