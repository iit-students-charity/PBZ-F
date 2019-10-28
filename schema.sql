DROP TABLE IF EXISTS teacher_student_group;
DROP TABLE IF EXISTS teacher;
DROP TABLE IF EXISTS subject;
DROP TABLE IF EXISTS student_group;

CREATE TABLE teacher (
    personal_number   VARCHAR(64)  PRIMARY KEY,
    surname           VARCHAR(64)  NOT NULL,
    position          VARCHAR(64)  NOT NULL,
    department        VARCHAR(128) NOT NULL,
    specialty         VARCHAR(128) NOT NULL,
    phone_number      VARCHAR(64)  NOT NULL
);

CREATE TABLE subject (
    code       VARCHAR(64)  PRIMARY KEY,
    name       VARCHAR(64)  NOT NULL,
    hours      SMALLINT     NOT NULL,
    specialty  VARCHAR(128) NOT NULL,
    semester   SMALLINT     NOT NULL
);

CREATE TABLE student_group (
    code       VARCHAR(64)  PRIMARY KEY,
    name       VARCHAR(64)  NOT NULL,
    size       SMALLINT     NOT NULL,
    specialty  VARCHAR(128) NOT NULL,
    headman    VARCHAR(64)  NOT NULL
);

CREATE TABLE teacher_student_group (
    id               BIGINT              PRIMARY KEY,
    group_number     VARCHAR(64)         NOT NULL,
    subject_number   VARCHAR(64)         NOT NULL,
    personal_number  VARCHAR(64)         NOT NULL,
    auditorium       SMALLINT            NOT NULL,
    CONSTRAINT FK_teacher_student_group_ownNumber   FOREIGN KEY (personal_number) REFERENCES teacher (personal_number)  ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_teacher_student_group_subjectCode FOREIGN KEY (subject_number)  REFERENCES subject (code)       ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_teacher_student_group_groupCode   FOREIGN KEY (group_number)    REFERENCES student_group (code) ON DELETE CASCADE ON UPDATE CASCADE
);
