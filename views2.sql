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
CREATE VIEW v2_31 AS
SELECT s2d2p.supplierId
FROM part
         INNER JOIN producer_project_part_number s2d2p on part.id = s2d2p.detailId
WHERE (SELECT count(DISTINCT s2d2p2.detailId)
       FROM part
                INNER JOIN producer_project_part_number s2d2p2 on part.id = s2d2p2.detailId
       WHERE s2d2p2.supplierId LIKE s2d2p.supplierId) = 1;



DROP VIEW IF EXISTS v2_2;
CREATE VIEW v2_2 AS
SELECT project.*,
       pppn.supplierid,
       pppn.detailid,
       pppn.quantity
FROM project
         INNER JOIN producer_project_part_number pppn ON project.id = pppn.projectid
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


DROP VIEW IF EXISTS v2_17;
CREATE VIEW v2_17 AS
SELECT detailid, projectid, sum(quantity)
FROM producer_project_part_number
GROUP BY projectid, detailid
ORDER BY projectid;


--2_36
SELECT p1.id AS producerId1,
       p2.id AS producerId2
FROM producer AS p1
         CROSS JOIN producer AS p2
WHERE ((SELECT count(*)
        FROM (SELECT DISTINCT pppn1.detailid
              FROM producer_project_part_number pppn1
              WHERE pppn1.supplierid LIKE p1.id
                  EXCEPT
              SELECT DISTINCT pppn2.detailid
              FROM producer_project_part_number pppn2
              WHERE pppn2.supplierid LIKE p2.id) as p1dp2d) = 0
    AND p1.id > p2.id);


--2.27
SELECT pppn1.supplierid
FROM producer_project_part_number AS pppn1
WHERE (pppn1.detailid LIKE 'Д1')
  AND ((SELECT avg(quantity)
        FROM producer_project_part_number AS pppn2
        WHERE (pppn1.detailid LIKE pppn2.detailid)
       ) < pppn1.quantity);


--2.18
SELECT detailid, projectid, quantity
FROM producer_project_part_number AS pppn1
WHERE (SELECT avg(quantity) FROM producer_project_part_number AS pppn2 WHERE pppn1.projectid = pppn2.projectid) > 320
ORDER BY projectid;