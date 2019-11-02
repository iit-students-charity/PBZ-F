-- 29 14 22 11 2 4 8 33 13 27
-- 2 27 13
-- 2
SELECT * FROM project WHERE city = 'Лондон';
-- 4
SELECT * FROM producer_project_part_number WHERE quantity >= 300 AND quantity <=750;
-- 8
-- SELECT rest.supplierId
--        rest.detailId
--        projectId
-- 11
select distinct first.city, second.city from 
    (select * from producer inner join producer_project_part_number on producer.id = producer_project_part_number.supplierID) as first inner join
        (select * from project inner join producer_project_part_number on project.id = producer_project_part_number.projectId) as second on first.supplierId = second.supplierId;