-- 29 14 22 11 (2) (4) 8 33 (13) (27)
-- 2 27 13
-- 2
SELECT * FROM project WHERE city = 'Лондон';
-- 4
SELECT * FROM producer_project_part_number WHERE quantity >= 300 AND quantity <=750;
-- 8
-- SELECT rest.supplierId
--        rest.detailId
--        projectId
-- -- 11
-- select distinct first.city, second.city from 
--     (select * from producer inner join producer_project_part_number on producer.id = producer_project_part_number.supplierID) as first inner join
--         (select * from project inner join producer_project_part_number on project.id = producer_project_part_number.projectId) as second on first.supplierId = second.supplierId;
-- 13
SELECT project.id FROM project INNER JOIN producer_project_part_number pppn ON project.id = pppn.projectId
    WHERE project.city NOT IN (SELECT city FROM producer INNER JOIN producer_project_part_number spppn ON
        producer.id = pppn.supplierId WHERE spppn.projectId = producer.id);
-- 27
SELECT supplierId FROM producer_project_part_number AS fpppn WHERE 
    (fpppn.detailId = 'Д1') AND ((SELECT avg(quantity) FROM producer_project_part_number AS spppn
        WHERE (fpppn.detailId = spppn.detailId)) < fpppn.quantity);
-- 33
SELECT DISTINCT city FROM project WHERE city IN 
    (SELECT city FROM part) AND city IN (SELECT city FROM producer);