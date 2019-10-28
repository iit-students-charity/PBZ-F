DROP VIEW IF EXISTS v2_20;
CREATE VIEW v2_20 AS
SELECT part.color
FROM part
         INNER JOIN producer_project_part_number s2d2p on part.id = s2d2p.detailId
WHERE s2d2p.supplierId LIKE 'П1';


DROP VIEW IF EXISTS v2_23;
CREATE VIEW v2_23 AS
SELECT s2d2p.supplierId
FROM part
         INNER JOIN producer_project_part_number s2d2p on part.id = s2d2p.detailId
WHERE part.color LIKE 'Красный';


DROP VIEW IF EXISTS v2_31;
CREATE VIEW v2_23 AS
SELECT s2d2p.supplierId
FROM part
         INNER JOIN producer_project_part_number s2d2p on part.id = s2d2p.detailId
WHERE (SELECT count(DISTINCT s2d2p2.detailId)
       FROM part
                INNER JOIN producer_project_part_number s2d2p2 on part.id = s2d2p2.detailId
       WHERE s2d2p2.supplierId LIKE s2d2p.supplierId) = 1;


#FOR TASK 2
SELECT project.city AS cityOfProject,
       project.name AS nameOfProject,
       s2d2p.*
FROM project
         INNER JOIN (SELECT s2d2p2.*,
                            producer.city AS cityOfproducer,
                            producer.name AS nameOfproducer,
                            producer.status AS statusOfproducer
                     FROM producer
                              INNER JOIN (SELECT part.city AS cityOfpart,
                                                 part.color AS colorOfpart,
                                                 part.name AS nameOfpart,
                                                 part.size AS sizeOfpart,
                                                 part.id AS idOfpart,
                                                 s2d2p3.supplierId,
                                                 s2d2p3.projectId
                                          FROM part
                                                   INNER JOIN producer_project_part_number s2d2p3 ON part.id = s2d2p3.detailId) s2d2p2
                                         ON producer.id = s2d2p2.supplierId) s2d2p ON project.id = s2d2p.projectId
WHERE project.city LIKE 'Москва';


DROP VIEW IF EXISTS v2_9;
CREATE VIEW v2_9 AS
SELECT part.id
FROM part
         INNER JOIN producer_project_part_number s2d2p on part.id = s2d2p.detailId
WHERE s2d2p.supplierId IN (SELECT producer.id FROM producer WHERE producer.city LIKE 'Москва');


DROP VIEW IF EXISTS v2_13;
CREATE VIEW v2_13 AS
SELECT project.id
FROM project
         INNER JOIN producer_project_part_number s2d2p ON project.id = s2d2p.projectId
WHERE project.city NOT IN (SELECT producer.city
                            FROM producer
                                     INNER JOIN producer_project_part_number s ON producer.id = s.supplierId
                            WHERE s.projectId LIKE project.id);