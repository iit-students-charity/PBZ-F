SET NAMES cp1251;
INSERT INTO teacher (personal_number, surname, position, department, specialty, phone_number) VALUES ('221Л', 'Фролов', 'Доцент', 'ЭВМ', 'АСОИ, ЭВМ', '487');
INSERT INTO teacher (personal_number, surname, position, department, specialty, phone_number) VALUES ('222Л', 'Костин', 'Доцент', 'ЭВМ', 'ЭВМ', '543');
INSERT INTO teacher (personal_number, surname, position, department, specialty, phone_number) VALUES ('225Л', 'Бойко', 'Профессор', 'АСУ', 'АСОИ, ЭВМ', '112');

INSERT INTO teacher (personal_number, surname, position, department, specialty, phone_number) VALUES ('430Л', 'Глазов', 'Ассистент', 'ТФ', 'СД', '421');
INSERT INTO teacher (personal_number, surname, position, department, specialty, phone_number) VALUES ('110Л', 'Петров', 'Ассистент', 'Экономики', 'Международная экономика', '324');



INSERT INTO subject (code, name, hours, specialty, semester) VALUES ('12П', 'Мини ЭВМ', 36, 'ЭВМ', 1);
INSERT INTO subject (code, name, hours, specialty, semester) VALUES ('14П', 'ПЭВМ', 72, 'ЭВМ', 2);
INSERT INTO subject (code, name, hours, specialty, semester) VALUES ('17П', 'СУБД ПК', 48, 'АСОИ', 4);

INSERT INTO subject (code, name, hours, specialty, semester) VALUES ('18П', 'ВКСС', 52, 'АСОИ', 6);
INSERT INTO subject (code, name, hours, specialty, semester) VALUES ('34П', 'Физика', 30, 'СД', 6);
INSERT INTO subject (code, name, hours, specialty, semester) VALUES ('22П', 'Аудит', 24, 'Бухучета', 3);



INSERT INTO student_group (code, name, size, specialty, headman) VALUES ('8Г', 'Э-12', 18, 'ЭВМ', 'Иванова');
INSERT INTO student_group (code, name, size, specialty, headman) VALUES ('7Г', 'Э-15', 22, 'ЭВМ', 'Сеткин');
INSERT INTO student_group (code, name, size, specialty, headman) VALUES ('4Г', 'АС-9', 24, 'АСОИ', 'Балабанов');
INSERT INTO student_group (code, name, size, specialty, headman) VALUES ('3Г', 'АС-8', 20, 'АСОИ', 'Чижов');

INSERT INTO student_group (code, name, size, specialty, headman) VALUES ('17Г', 'С-14', 29, 'СД', 'Амросов');
INSERT INTO student_group (code, name, size, specialty, headman) VALUES ('12Г', 'М-6', 16, 'Международная экономика', 'Трубин');
INSERT INTO student_group (code, name, size, specialty, headman) VALUES ('10Г', 'Б-4', 21, 'Бухучет', 'Зязюткин');



INSERT INTO teacher_student_group (id, group_number, subject_number, personal_number, auditorium) VALUES (1, '8Г', '12П', '222Л', '112');
INSERT INTO teacher_student_group (id, group_number, subject_number, personal_number, auditorium) VALUES (2, '8Г', '14П', '221Л', '220');
INSERT INTO teacher_student_group (id, group_number, subject_number, personal_number, auditorium) VALUES (3, '8Г', '17П', '222Л', '112');
INSERT INTO teacher_student_group (id, group_number, subject_number, personal_number, auditorium) VALUES (4, '7Г', '14П', '221Л', '220');

INSERT INTO teacher_student_group (id, group_number, subject_number, personal_number, auditorium) VALUES (5, '7Г', '17П', '222Л', '241');
INSERT INTO teacher_student_group (id, group_number, subject_number, personal_number, auditorium) VALUES (6, '7Г', '18П', '225Л', '210');
INSERT INTO teacher_student_group (id, group_number, subject_number, personal_number, auditorium) VALUES (7, '4Г', '12П', '222Л', '112');
INSERT INTO teacher_student_group (id, group_number, subject_number, personal_number, auditorium) VALUES (8, '4Г', '18П', '225Л', '210');

INSERT INTO teacher_student_group (id, group_number, subject_number, personal_number, auditorium) VALUES (9, '3Г', '12П', '222Л', '112');
INSERT INTO teacher_student_group (id, group_number, subject_number, personal_number, auditorium) VALUES (10, '3Г', '17П', '221Л', '241');
INSERT INTO teacher_student_group (id, group_number, subject_number, personal_number, auditorium) VALUES (11, '3Г', '18П', '225Л', '210');
INSERT INTO teacher_student_group (id, group_number, subject_number, personal_number, auditorium) VALUES (12, '17Г', '12П', '222Л', '112');

INSERT INTO teacher_student_group (id, group_number, subject_number, personal_number, auditorium) VALUES (13, '17Г', '22П', '110Л', '220');
INSERT INTO teacher_student_group (id, group_number, subject_number, personal_number, auditorium) VALUES (14, '17Г', '34П', '430Л', '118');
INSERT INTO teacher_student_group (id, group_number, subject_number, personal_number, auditorium) VALUES (15, '12Г', '12П', '222Л', '112');
INSERT INTO teacher_student_group (id, group_number, subject_number, personal_number, auditorium) VALUES (16, '12Г', '22П', '110Л', '210');

INSERT INTO teacher_student_group (id, group_number, subject_number, personal_number, auditorium) VALUES (17, '10Г', '12П', '222Л', '210');
INSERT INTO teacher_student_group (id, group_number, subject_number, personal_number, auditorium) VALUES (18, '10Г', '22П', '110Л', '210');
