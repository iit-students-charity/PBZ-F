DROP TABLE IF EXISTS producer_project_part_number;
DROP TABLE IF EXISTS producer;
DROP TABLE IF EXISTS part;
DROP TABLE IF EXISTS project;

CREATE TABLE producer (
    id     VARCHAR(64)  PRIMARY KEY,
    name   VARCHAR(64)  NOT NULL,
    status SMALLINT     NOT NULL,
    city   VARCHAR(128) NOT NULL
);

CREATE TABLE part (
    id    VARCHAR(64) PRIMARY KEY,
    name  VARCHAR(64) NOT NULL,
    color VARCHAR(64) NOT NULL,
    size  SMALLINT    NOT NULL,
    city  VARCHAR(64) NOT NULL
);

CREATE TABLE project (
    id   VARCHAR(64) PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    city VARCHAR(64) NOT NULL
);

CREATE TABLE producer_project_part_number (
    id         SERIAL      PRIMARY KEY,
    supplierId VARCHAR(64) NOT NULL,
    detailId   VARCHAR(64) NOT NULL,
    projectId  VARCHAR(64) NOT NULL,
    quantity   BIGINT      NOT NULL,
    CONSTRAINT FK_producer_project_part_number_supplierId FOREIGN KEY (supplierId) REFERENCES producer (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_producer_project_part_number_detailId   FOREIGN KEY (detailId)   REFERENCES part (id)     ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_producer_project_part_number_projectId  FOREIGN KEY (projectId)  REFERENCES project (id)  ON DELETE CASCADE ON UPDATE CASCADE
);