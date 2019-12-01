DROP TABLE IF EXISTS supplier_project_part_number;
DROP TABLE IF EXISTS supplier;
DROP TABLE IF EXISTS part;
DROP TABLE IF EXISTS project;

CREATE TABLE supplier (
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

CREATE TABLE supplier_project_part_number (
    id         SERIAL      PRIMARY KEY,
    supplier_id VARCHAR(64) NOT NULL,
    detail_id   VARCHAR(64) NOT NULL,
    project_id  VARCHAR(64) NOT NULL,
    quantity   BIGINT      NOT NULL,
    CONSTRAINT FK_supplier_project_part_number_supplierId FOREIGN KEY (supplier_id) REFERENCES supplier (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_supplier_project_part_number_detailId   FOREIGN KEY (detail_id)   REFERENCES part (id)     ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_supplier_project_part_number_projectId  FOREIGN KEY (project_id)  REFERENCES project (id)  ON DELETE CASCADE ON UPDATE CASCADE
);