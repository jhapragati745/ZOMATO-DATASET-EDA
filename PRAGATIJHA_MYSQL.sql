create database Market_Star_Schema;
use Market_Star_Schema;
create table Manu
( 
Manu_Id int primary key,  
Manu_Name varchar (30), 
Manu_City varchar (30)
);
Alter table Manu
Alter column Manu_Name set default null,
Alter column Manu_City set default null;
create table orders_dimen
(
Order_Number int NOT NULL,
    Order_Date DATE DEFAULT NULL,
    Order_Priority varchar(25) DEFAULT NULL
    );
    create table prod_dimen
    (
    Prod_id varchar(25) PRIMARY KEY NOT NULL,
    Product_Category varchar(25) DEFAULT NULL,
    Product_Sub_Category varchar(45) DEFAULT NULL,
    Manu_Id int DEFAULT NULL
    );
    alter table prod_dimen
    modify Product_Sub_Category varchar(45);
    create table shipping_dimen
    (
    Ship_id varchar(12) PRIMARY KEY NOT NULL,
    Order_ID int NOT NULL,
    Ship_Mode varchar(25) DEFAULT NULL,
    Ship_Date DATE DEFAULT NULL
    );
    create table market_fact_full
    (
    Market_fact_id int not null,
    Ord_id varchar(12) default null,
    Prod_id varchar(25) default null,
    Ship_id varchar(12) default null,
    Cust_id varchar(12) default null,
    Sales decimal (12,2) default null,
    Order_Quantity int not null,
    Profit decimal(12,2) default null,
    Shipping_Cost decimal(12,2) default null,
    Product_Base_Margin decimal(12,2)default null
    );
    alter table Market_fact_full
    modify column Sales decimal(65,30) default null;
    
    insert into manu (Manu_Id, Manu_Name, Manu_City)
    value (1,'Navneet','Ahemdabad'),
    (2,'Wipro','Hyderabad'),
    (3,'Furlanco','Mumbai');
   
  insert into prod_dimen (Prod_id, Product_Category, Product_Sub_Category,Manu_Id)
  value ('Prod_1','OFFICE SUPPLIES','STORAGE & ORGANIZATION',NULL),
  ('Prod_10','FURNITURE','BOOKCASES',NULL),
  ('Prod_11','FURNITURE','TABLES',NULL),
  ('Prod_12','OFFICE SUPPLIES','LABELS',NULL),
  ('Prod_13','OFFICE SUPPLIES','PENS & ART SUPPLIES',NULL),
  ('Prod_14','TECHNOLOGY','COPIERS AND FAX',2),
  ('Prod_15','FURNITURE','CHAIRS & CHAIRMATS',NULL),
  ('Prod_16','OFFICE SUPPLIES','SCISSORS, RULERS AND TRIMMERS',NULL),
  ('Prod_17','TECHNOLOGY','OFFICE MACHINES',2),
  ('Prod_2','OFFICE SUPPLIES','APPLIANCES',NULL),
  ('Prod_3','OFFICE SUPPLIES','BINDERS AND BINDER ACCESSORIES',NULL),
  ('Prod_4','TECHNOLOGY','TELEPHONES AND COMMUNICATION',2),
  ('Prod_5','FURNITURE','OFFICE FURNISHINGS',NULL),
  ('Prod_6','OFFICE SUPPLIES','PAPER',NULL),
  ('Prod_7','OFFICE SUPPLIES','RUBBER BANDS',NULL),
  ('Prod_8','TECHNOLOGY','COMPUTER PERIPHERALS',2),
  ('Prod_9','OFFICE SUPPLIES','ENVELOPES',NULL);
  
 --   insert into market_fact_full (Ord_id,Prod_id,Ship_id,Cust_id,Sales,Order_Quantity,Profit,Shipping_Cost,Product_Base_Margin)
--    value ('Ord_5446','Prod_16','SHP_7609','Cust_1818',136.810000000000000000000000000000,0.01,23,-30.51,3.60,0.56),('Ord_5406','Prod_13','SHP_7549','Cust_1818',42.270000000000000000000000000000,0.01,13,4.56,0.93,0.54),('Ord_5446','Prod_4','SHP_7610','Cust_1818',4701.690000000000000000000000000000,0.00,26,1148.90,2.50,0.59),('Ord_5456','Prod_6','SHP_7625','Cust_1818',2337.890000000000000000000000000000,0.09,43,729.34,14.30,0.37),('Ord_5485','Prod_17','SHP_7664','Cust_1818',4233.150000000000000000000000000000,0.08,35,1219.87,26.30,0.38),('Ord_5446','Prod_6','SHP_7608','Cust_1818',164.020000000000000000000000000000,0.03,23,-47.64,6.15,0.37),('Ord_31','Prod_12','SHP_41','Cust_26',14.760000000000000000000000000000,0.01,5,1.32,0.50,0.36),('Ord_4725','Prod_4','SHP_6593','Cust_1641',3410.157500000000000000000000000000,0.10,48,1137.91,0.99,0.55),('Ord_4725','Prod_13','SHP_6593','Cust_1641',162.000000000000000000000000000000,0.01,33,45.84,0.71,0.52),('Ord_4725','Prod_6','SHP_6593','Cust_1641',57.220000000000000000000000000000,0.07,8,-27.72,6.60,0.37),('Ord_4743','Prod_2','SHP_6615','Cust_1641',4072.010000000000000000000000000000,0.01,43,1675.98,0.99,0.56),('Ord_1925','Prod_6','SHP_2637','Cust_708',465.900000000000000000000000000000,0.05,38,79.34,4.86,0.38),('Ord_2978','Prod_16','SHP_4112','Cust_1088',305.050000000000000000000000000000,0.04,27,23.12,3.37,0.57),('Ord_2207','Prod_11','SHP_3093','Cust_839',3364.248000000000000000000000000000,0.10,15,-693.23,61.76,0.78),('Ord_2207','Prod_10','SHP_3006','Cust_839',1410.930000000000000000000000000000,0.08,10,-317.48,36.09,0.77);

INSERT INTO market_fact_full 
(Market_fact_id,Ord_id,Prod_id,Ship_id,Cust_id,Sales,Order_Quantity,Profit,Shipping_Cost,Product_Base_Margin)
VALUES 
(1,'Ord_5446','Prod_16','SHP_7609','Cust_1818',136.81,0.01,23,-30.51,0.56),
(2,'Ord_5406','Prod_13','SHP_7549','Cust_1818',42.27,0.01,13,4.56,0.54),
(3,'Ord_5446','Prod_4','SHP_7610','Cust_1818',4701.69,0.00,26,1148.90,0.59),
(4,'Ord_5456','Prod_6','SHP_7625','Cust_1818',2337.89,0.09,43,729.34,0.37),
(5,'Ord_5485','Prod_17','SHP_7664','Cust_1818',4233.15,0.08,35,1219.87,0.38),
(6,'Ord_5446','Prod_6','SHP_7608','Cust_1818',164.02,0.03,23,-47.64,0.37),
(7,'Ord_31','Prod_12','SHP_41','Cust_26',14.76,0.01,5,1.32,0.36),
(8,'Ord_4725','Prod_4','SHP_6593','Cust_1641',3410.1575,0.10,48,1137.91,0.55),
(9,'Ord_4725','Prod_13','SHP_6593','Cust_1641',162,0.01,33,45.84,0.52),
(10,'Ord_4725','Prod_6','SHP_6593','Cust_1641',57.22,0.07,8,-27.72,0.37),
(11,'Ord_4743','Prod_2','SHP_6615','Cust_1641',4072.01,0.01,43,1675.98,0.56),
(12,'Ord_1925','Prod_6','SHP_2637','Cust_708',465.90,0.05,38,79.34,0.38),
(13,'Ord_2978','Prod_16','SHP_4112','Cust_1088',305.05,0.04,27,23.12,0.57),
(14,'Ord_2207','Prod_11','SHP_3093','Cust_839',3364.248,0.10,15,-693.23,0.78),
(15,'Ord_2207','Prod_10','SHP_3006','Cust_839',1410.93,0.08,10,-317.48,0.77);

-- I HAVE ALREADY INSERTED A FEW RECORDS IN THE SHIPPING_DIMEN TABLE BUT GOT CONFUSED SO I HAVE COPY PASTED A FEW RECORDS BELOW AGAIN AS THE PRIVIOUS ONES GOT ERASEDorders_dimenorders_dimenorders_dimen
select * from shipping_dimen;

insert into shipping_dimen(Ship_id,Order_ID,Ship_Mode,Ship_Date)
value ('SHP_1019',18179,'REGULAR AIR','2009-03-08'),
('SHP_102',12096,'REGULAR AIR','2012-09-21'),
('SHP_1020',19044,'REGULAR AIR','2012-04-13'),
('SHP_1021',19044,'REGULAR AIR','2012-04-18'),
('SHP_1022',19462,'REGULAR AIR','2011-09-21'),
('SHP_1023',19936,'REGULAR AIR','2012-11-14'),
('SHP_1024',19972,'REGULAR AIR','2012-06-18'),
('SHP_1025',20038,'REGULAR AIR','2010-02-28'),
('SHP_1026',20389,'DELIVERY TRUCK','2009-08-13'),
('SHP_1027',20389,'REGULAR AIR','2009-08-13'),
('SHP_1028',20389,'EXPRESS AIR','2009-08-13'),
('SHP_1029',20422,'REGULAR AIR','2009-01-28'),
('SHP_103',12289,'REGULAR AIR','2011-12-28'),
('SHP_1030',20676,'REGULAR AIR','2012-11-26'),
('SHP_1031',20807,'DELIVERY TRUCK','2012-07-23'),
('SHP_1032',20838,'REGULAR AIR','2009-11-04'),
('SHP_1033',20960,'REGULAR AIR','2011-11-23'),
('SHP_1034',20961,'REGULAR AIR','2010-01-16'),
('SHP_1035',21350,'REGULAR AIR','2011-02-25'),
('SHP_1036',21572,'REGULAR AIR','2009-02-15'),
('SHP_1037',21671,'REGULAR AIR','2010-06-18'),
('SHP_1038',22657,'EXPRESS AIR','2011-10-30'),
('SHP_1039',22657,'REGULAR AIR','2011-10-30'),
('SHP_104',12352,'REGULAR AIR','2012-03-24'),
('SHP_1040',23207,'REGULAR AIR','2010-10-23'),
('SHP_1041',23940,'REGULAR AIR','2011-09-04'),
('SHP_1042',23940,'DELIVERY TRUCK','2011-11-04'),
('SHP_1043',24450,'REGULAR AIR','2012-11-07'),
('SHP_1044',24450,'EXPRESS AIR','2012-12-07'),
('SHP_1045',24580,'REGULAR AIR','2012-06-24'),
('SHP_1046',24580,'REGULAR AIR','2012-06-25'),
('SHP_1047',24833,'DELIVERY TRUCK','2010-07-18'),
('SHP_1048',24933,'DELIVERY TRUCK','2009-07-28'),
('SHP_1049',24933,'REGULAR AIR','2009-07-28'),
('SHP_105',12419,'REGULAR AIR','2011-10-17'),
('SHP_1050',25031,'REGULAR AIR','2009-08-25'),
('SHP_1051',25031,'REGULAR AIR','2009-08-24'),
('SHP_1052',25633,'DELIVERY TRUCK','2011-06-08'),
('SHP_1053',25635,'EXPRESS AIR','2012-05-30'),
('SHP_1054',25635,'REGULAR AIR','2012-05-30'),
('SHP_1055',25830,'REGULAR AIR','2010-06-05'),
('SHP_1056',25830,'REGULAR AIR','2010-11-05'),
('SHP_1057',26342,'REGULAR AIR','2009-10-27'),
('SHP_1058',26342,'REGULAR AIR','2009-10-23');

-- ALTER TABLE orders_dimen
-- add ord_id VARCHAR(12) PRIMARY KEY NOT NULL;
ALTER TABLE orders_dimen DROP COLUMN ord_id;
ALTER TABLE orders_dimen
ADD COLUMN ord_id VARCHAR(12) PRIMARY KEY NOT NULL FIRST;

insert into orders_dimen(ord_id,Order_Number,Order_Date,Order_Priority)
value ('Ord_1',3,'2010-10-13','LOW'),('Ord_10',933,'2012-04-08','NOT SPECIFIED'),
('Ord_100',16039,'2012-05-16','HIGH'),
('Ord_1000',49283,'2009-11-12','HIGH'),
('Ord_1001',49441,'2009-09-27','MEDIUM'),
('Ord_1002',49601,'2011-01-26','LOW'),
('Ord_1003',49763,'2011-02-13','CRITICAL'),
('Ord_1004',49927,'2012-07-20','NOT SPECIFIED'),
('Ord_1005',50048,'2010-01-18','HIGH'),
('Ord_1006',50499,'2011-12-10','NOT SPECIFIED'),
('Ord_1007',51041,'2010-07-29','HIGH'),
('Ord_1008',51328,'2010-10-26','LOW'),
('Ord_1009',51333,'2012-04-10','NOT SPECIFIED'),
('Ord_101',16193,'2012-09-04','NOT SPECIFIED'),
('Ord_1010',51365,'2012-07-08','HIGH'),
('Ord_1011',51777,'2011-02-19','MEDIUM'),
('Ord_1012',51814,'2010-09-24','CRITICAL'),
('Ord_1013',51975,'2009-12-18','LOW'),
('Ord_1014',52225,'2012-12-04','CRITICAL'),
('Ord_1015',52487,'2009-01-06','CRITICAL'),
('Ord_1016',52868,'2011-02-16','LOW'),
('Ord_1017',53221,'2012-02-26','NOT SPECIFIED'),
('Ord_1018',53600,'2012-10-07','MEDIUM'),
('Ord_1019',53667,'2012-05-17','MEDIUM'),
('Ord_102',16423,'2012-05-08','MEDIUM'),
('Ord_1020',53891,'2009-01-22','HIGH'),
('Ord_1021',53955,'2011-04-03','CRITICAL'),
('Ord_1022',54150,'2011-06-22','CRITICAL'),
('Ord_1023',55429,'2009-06-29','HIGH'),
('Ord_1024',55462,'2012-03-27','MEDIUM'),
('Ord_1025',55749,'2012-03-05','CRITICAL'),
('Ord_1026',55873,'2011-11-19','LOW'),
('Ord_1027',56135,'2010-11-13','MEDIUM'),
('Ord_1028',56708,'2012-02-12','NOT SPECIFIED'),
('Ord_1029',57986,'2010-10-29','HIGH'),
('Ord_103',16451,'2009-07-22','NOT SPECIFIED'),
('Ord_1030',58310,'2009-02-23','CRITICAL'),
('Ord_1031',58725,'2010-05-20','NOT SPECIFIED'),
('Ord_1032',902,'2009-07-26','NOT SPECIFIED'),
('Ord_1033',2147,'2012-05-09','NOT SPECIFIED'),
('Ord_1034',2306,'2011-07-25','HIGH'),
('Ord_1035',2823,'2011-08-09','HIGH'),
('Ord_1036',3110,'2009-12-16','HIGH'),
('Ord_1037',3463,'2010-08-17','CRITICAL'),
('Ord_1038',4034,'2010-11-13','NOT SPECIFIED'),
('Ord_1039',4037,'2010-03-23','HIGH'),
('Ord_104',16545,'2010-09-05','NOT SPECIFIED'),
('Ord_1040',5538,'2010-12-24','CRITICAL'),
('Ord_1041',5863,'2010-11-21','MEDIUM'),
('Ord_1042',7175,'2010-07-02','CRITICAL'),
('Ord_1043',7364,'2009-08-05','HIGH'),
('Ord_1044',7878,'2011-01-05','CRITICAL'),
('Ord_1045',7878,'2011-01-05','LOW'),
('Ord_1046',8551,'2009-07-29','CRITICAL'),
('Ord_1047',8834,'2010-08-11','HIGH'),
('Ord_1048',9155,'2012-08-30','CRITICAL'),
('Ord_1049',9668,'2009-06-09','LOW'),
('Ord_105',16547,'2009-02-18','NOT SPECIFIED'),
('Ord_1050',10242,'2010-12-12','MEDIUM'),
('Ord_1051',12292,'2012-02-06','NOT SPECIFIED'),
('Ord_1052',14503,'2011-05-02','NOT SPECIFIED'),
('Ord_1053',15109,'2010-12-14','NOT SPECIFIED'),
('Ord_1054',15142,'2012-04-04','NOT SPECIFIED'),
('Ord_1055',15332,'2010-05-30','NOT SPECIFIED'),
('Ord_1056',15872,'2012-10-30','NOT SPECIFIED'),
('Ord_1057',16032,'2009-05-12','LOW'),
('Ord_1058',16165,'2010-07-22','NOT SPECIFIED'),
('Ord_1059',17632,'2010-02-21','MEDIUM'),
('Ord_106',16706,'2012-06-27','HIGH'),
('Ord_1060',19492,'2010-12-12','HIGH'),
('Ord_1061',20102,'2011-05-06','HIGH'),
('Ord_1062',21863,'2010-11-21','NOT SPECIFIED'),
('Ord_1063',21894,'2011-12-18','CRITICAL'),
('Ord_1064',22022,'2010-03-04','CRITICAL'),
('Ord_1065',22663,'2012-11-01','LOW'),
('Ord_1066',23713,'2012-11-28','NOT SPECIFIED'),
('Ord_1067',24358,'2009-05-16','CRITICAL'),
('Ord_1068',24386,'2012-06-26','HIGH'),
('Ord_1069',24899,'2011-08-20','NOT SPECIFIED'),
('Ord_107',16741,'2010-09-30','MEDIUM'),
('Ord_1070',25473,'2012-10-14','HIGH'),
('Ord_1071',25638,'2009-06-08','HIGH'),
('Ord_1072',26016,'2009-07-10','HIGH'),
('Ord_1073',26691,'2012-03-08','NOT SPECIFIED'),
('Ord_1074',27015,'2011-12-31','LOW'),
('Ord_1075',27840,'2009-03-07','HIGH'),
('Ord_1076',28130,'2009-07-30','LOW'),
('Ord_1077',28290,'2009-10-01','LOW'),
('Ord_1078',29927,'2012-07-11','HIGH'),
('Ord_1079',29953,'2011-07-02','CRITICAL'),
('Ord_108',16932,'2010-04-15','CRITICAL'),
('Ord_1080',31238,'2010-08-22','MEDIUM'),
('Ord_1081',32067,'2012-12-03','HIGH'),
('Ord_1082',32198,'2011-09-11','MEDIUM'),
('Ord_1083',32231,'2012-01-11','LOW'),
('Ord_1084',32452,'2011-07-18','MEDIUM'),
('Ord_1085',32998,'2010-09-29','NOT SPECIFIED'),
('Ord_1086',33091,'2011-01-25','HIGH');

-- Q:Check out how many records are there in all the tables using count (*)
SELECT COUNT(*) FROM market_fact_full;
SELECT COUNT(*) FROM orders_dimen;
SELECT COUNT(*) FROM shipping_dimen;
SELECT COUNT(*) FROM prod_dimen;
SELECT COUNT(*) FROM manu;

-- Q: Find out how many records are there in each city
SELECT MANU_CITY, COUNT(*) FROM MANU GROUP BY MANU_CITY;

-- Q: Find out all the names that start with "s"
SELECT * FROM MANU
WHERE MANU_NAME LIKE "S%";

-- Q: Find out all the cities that ends with "e"
SELECT * FROM MANU
WHERE MANU_CITY LIKE "%E";


-- Q: Find out the sum of total sales from market_fact_full based on customer_ids.
SELECT cust_id, SUM(sales) as total_sales FROM market_fact_full GROUP BY cust_id;



-- Q: Find out the dates of all the records in orders_dimen where the orderpriority is high
SELECT order_date
FROM orders_dimen
WHERE order_priority = 'High';

-- Q:Find out the date difference between order date and shipping date
-- SELECT ord_id, DATEDIFF(order_date) AS date_diff
-- FROM orders_dimen;







