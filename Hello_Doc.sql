/*
 Navicat Premium Data Transfer

 Source Server         : postgres
 Source Server Type    : PostgreSQL
 Source Server Version : 160001 (160001)
 Source Host           : localhost:5432
 Source Catalog        : postgres
 Source Schema         : Hello_Doc

 Target Server Type    : PostgreSQL
 Target Server Version : 160001 (160001)
 File Encoding         : 65001

 Date: 27/02/2024 01:06:06
*/


-- ----------------------------
-- Sequence structure for Ambulance Driver_driver_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "Hello_Doc"."Ambulance Driver_driver_id_seq";
CREATE SEQUENCE "Hello_Doc"."Ambulance Driver_driver_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for Admin
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Admin";
CREATE TABLE "Hello_Doc"."Admin" (
  "Name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Id" int4
)
;

-- ----------------------------
-- Records of Admin
-- ----------------------------

-- ----------------------------
-- Table structure for Ambulance
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Ambulance";
CREATE TABLE "Hello_Doc"."Ambulance" (
  "ID" int4 NOT NULL,
  "Contact" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "AC" bool NOT NULL,
  "Is_MICU" bool NOT NULL,
  "Current Location" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Price_per_hour" money NOT NULL,
  "Availability" bool NOT NULL,
  "License" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of Ambulance
-- ----------------------------
INSERT INTO "Hello_Doc"."Ambulance" VALUES (3, '345465656', 't', 'f', 'Chattogram', '$200.00', 't', 'CTG-11776', 'NRM_A');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (4, '123234344', 'f', 'f', 'Dhaka', '$350.00', 't', 'KHL-33221', 'ISIN_A');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (1, '039843734', 'f', 'f', 'Dhaka', '$50.00', 'f', 'DHK-00331', 'LAID_A');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (2, '12322432', 't', 't', 'Aula', '$400.00', 'f', 'DHK-00221', 'IBH_A');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (5, '123456789', 't', 't', 'Barishal', '$800.00', 't', 'BAR-00123', 'BAER_A');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (6, '987654321', 'f', 't', 'Rajshahi', '$600.00', 't', 'RAJ-00987', 'IBHA');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (7, '567890123', 'f', 'f', 'Mymensingh', '$250.00', 't', 'MYM-00567', 'ISINA');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (8, '890123456', 't', 't', 'Sylhet', '$700.00', 't', 'SYL-00890', 'LADMA');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (9, '345678901', 't', 'f', 'Rangpur', '$900.00', 't', 'RAN-00345', 'NRMA');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (10, '012345678', 'f', 'f', 'Khulna', '$150.00', 't', 'KHU-00123', 'MIBHA');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (11, '456789012', 't', 't', 'Dhaka', '$980.00', 't', 'DHK-00456', 'ISINA');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (12, '789012345', 'f', 't', 'Chattogram', '$380.00', 't', 'CTG-00789', 'LAIBDA');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (13, '234567890', 't', 'f', 'Sylhet', '$480.00', 't', 'SYL-00234', 'NRM_A');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (14, '678901234', 'f', 'f', 'Dhaka', '$550.00', 't', 'DHK-00678', 'IBH_A');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (15, '901234567', 't', 't', 'Barishal', '$850.00', 't', 'BAR-00901', 'BAER_B');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (16, '123456789', 'f', 't', 'Rajshahi', '$650.00', 't', 'RAJ-00123', 'IBHB');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (17, '234567890', 'f', 'f', 'Mymensingh', '$300.00', 't', 'MYM-00234', 'ISINB');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (18, '345678901', 't', 't', 'Sylhet', '$750.00', 't', 'SYL-00345', 'LADMB');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (19, '456789012', 't', 'f', 'Rangpur', '$950.00', 't', 'RAN-00456', 'NRMB');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (20, '567890123', 'f', 'f', 'Khulna', '$200.00', 't', 'KHU-00567', 'MIBHB');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (21, '678901234', 't', 't', 'Dhaka', '$1,030.00', 't', 'DHK-00678', 'ISINB');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (22, '789012345', 'f', 't', 'Chattogram', '$430.00', 't', 'CTG-00789', 'LAIBDB');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (23, '890123456', 't', 'f', 'Sylhet', '$530.00', 't', 'SYL-00890', 'NRMB');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (24, '901234567', 'f', 'f', 'Dhaka', '$600.00', 't', 'DHK-00901', 'IBHB');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (25, '123456789', 't', 't', 'Barishal', '$800.00', 't', 'BAR-00124', 'BAER_C');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (26, '987654321', 'f', 't', 'Rajshahi', '$600.00', 't', 'RAJ-00988', 'IBHC');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (27, '567890123', 'f', 'f', 'Mymensingh', '$250.00', 't', 'MYM-00568', 'ISINC');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (28, '890123456', 't', 't', 'Sylhet', '$700.00', 't', 'SYL-00891', 'LADMC');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (29, '345678901', 't', 'f', 'Rangpur', '$900.00', 't', 'RAN-00346', 'NRMC');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (30, '012345678', 'f', 'f', 'Khulna', '$150.00', 't', 'KHU-00124', 'MIBHC');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (31, '456789012', 't', 't', 'Dhaka', '$980.00', 't', 'DHK-00457', 'ISINC');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (32, '789012345', 'f', 't', 'Chattogram', '$380.00', 't', 'CTG-00790', 'LAIBDC');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (33, '234567890', 't', 'f', 'Sylhet', '$480.00', 't', 'SYL-00235', 'NRMC');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (34, '678901234', 'f', 'f', 'Dhaka', '$550.00', 't', 'DHK-00679', 'IBHC');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (35, '901234567', 't', 't', 'Barishal', '$850.00', 't', 'BAR-00902', 'BAER_D');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (36, '123456789', 'f', 't', 'Rajshahi', '$650.00', 't', 'RAJ-00124', 'IBHD');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (37, '234567890', 'f', 'f', 'Mymensingh', '$300.00', 't', 'MYM-00235', 'ISIND');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (38, '345678901', 't', 't', 'Sylhet', '$750.00', 't', 'SYL-00346', 'LADMD');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (39, '456789012', 't', 'f', 'Rangpur', '$950.00', 't', 'RAN-00457', 'NRMD');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (40, '567890123', 'f', 'f', 'Khulna', '$200.00', 't', 'KHU-00568', 'MIBHD');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (41, '678901234', 't', 't', 'Dhaka', '$1,030.00', 't', 'DHK-00680', 'ISIND');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (42, '789012345', 'f', 't', 'Chattogram', '$430.00', 't', 'CTG-00791', 'LAIBDD');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (43, '890123456', 't', 'f', 'Sylhet', '$530.00', 't', 'SYL-00891', 'NRMD');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (44, '901234567', 'f', 'f', 'Dhaka', '$600.00', 't', 'DHK-00902', 'IBHD');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (45, '123456789', 't', 't', 'Barishal', '$800.00', 't', 'BAR-00125', 'BAER_E');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (46, '987654321', 'f', 't', 'Rajshahi', '$600.00', 't', 'RAJ-00989', 'IBHE');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (47, '567890123', 'f', 'f', 'Mymensingh', '$250.00', 't', 'MYM-00569', 'ISINE');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (48, '890123456', 't', 't', 'Sylhet', '$700.00', 't', 'SYL-00892', 'LADME');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (49, '345678901', 't', 'f', 'Rangpur', '$900.00', 't', 'RAN-00347', 'NRME');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (50, '012345678', 'f', 'f', 'Khulna', '$150.00', 't', 'KHU-00125', 'MIBHE');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (51, '456789012', 't', 't', 'Dhaka', '$980.00', 't', 'DHK-00458', 'ISINE');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (52, '789012345', 'f', 't', 'Chattogram', '$380.00', 't', 'CTG-00792', 'LAIBDE');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (53, '234567890', 't', 'f', 'Sylhet', '$480.00', 't', 'SYL-00236', 'NRME');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (54, '678901234', 'f', 'f', 'Dhaka', '$550.00', 't', 'DHK-00681', 'IBHE');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (55, '901234567', 't', 't', 'Barishal', '$850.00', 't', 'BAR-00903', 'BAER_F');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (56, '123456789', 'f', 't', 'Rajshahi', '$650.00', 't', 'RAJ-00125', 'IBHF');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (57, '234567890', 'f', 'f', 'Mymensingh', '$300.00', 't', 'MYM-00237', 'ISINF');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (58, '345678901', 't', 't', 'Sylhet', '$750.00', 't', 'SYL-00347', 'LADMF');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (59, '456789012', 't', 'f', 'Rangpur', '$950.00', 't', 'RAN-00458', 'NRMF');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (60, '567890123', 'f', 'f', 'Khulna', '$200.00', 't', 'KHU-00569', 'MIBHF');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (61, '678901234', 't', 't', 'Dhaka', '$1,030.00', 't', 'DHK-00682', 'ISINF');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (62, '789012345', 'f', 't', 'Chattogram', '$430.00', 't', 'CTG-00793', 'LAIBDF');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (63, '890123456', 't', 'f', 'Sylhet', '$530.00', 't', 'SYL-00892', 'NRMF');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (64, '123456789', 't', 't', 'Barishal', '$800.00', 't', 'BAR-0064', 'BAER_G');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (65, '987654321', 'f', 't', 'Rajshahi', '$600.00', 't', 'RAJ-0065', 'IBHG');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (66, '567890123', 'f', 'f', 'Mymensingh', '$250.00', 't', 'MYM-0066', 'ISING');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (67, '890123456', 't', 't', 'Sylhet', '$700.00', 't', 'SYL-0067', 'LADMG');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (68, '345678901', 't', 'f', 'Rangpur', '$900.00', 't', 'RAN-0068', 'NRMG');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (69, '012345678', 'f', 'f', 'Khulna', '$150.00', 't', 'KHU-0069', 'MIBHG');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (70, '456789012', 't', 't', 'Dhaka', '$980.00', 't', 'DHK-0070', 'ISING');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (71, '789012345', 'f', 't', 'Chattogram', '$380.00', 't', 'CTG-0071', 'LAIBDG');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (72, '234567890', 't', 'f', 'Sylhet', '$480.00', 't', 'SYL-0072', 'NRMG');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (73, '678901234', 'f', 'f', 'Dhaka', '$550.00', 't', 'DHK-0073', 'IBHG');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (74, '901234567', 't', 't', 'Barishal', '$850.00', 't', 'BAR-0074', 'BAER_H');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (75, '123456789', 'f', 't', 'Rajshahi', '$650.00', 't', 'RAJ-0075', 'IBHH');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (76, '234567890', 'f', 'f', 'Mymensingh', '$300.00', 't', 'MYM-0076', 'ISINH');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (77, '345678901', 't', 't', 'Sylhet', '$750.00', 't', 'SYL-0077', 'LADMH');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (78, '456789012', 't', 'f', 'Rangpur', '$950.00', 't', 'RAN-0078', 'NRMH');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (79, '567890123', 'f', 'f', 'Khulna', '$200.00', 't', 'KHU-0079', 'MIBHH');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (80, '678901234', 't', 't', 'Dhaka', '$1,030.00', 't', 'DHK-0080', 'ISINH');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (81, '789012345', 'f', 't', 'Chattogram', '$430.00', 't', 'CTG-0081', 'LAIBDH');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (82, '890123456', 't', 'f', 'Sylhet', '$530.00', 't', 'SYL-0082', 'NRMH');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (83, '901234567', 'f', 'f', 'Dhaka', '$600.00', 't', 'DHK-0083', 'IBHH');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (84, '123456789', 't', 't', 'Barishal', '$800.00', 't', 'BAR-0084', 'BAER_I');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (85, '987654321', 'f', 't', 'Rajshahi', '$600.00', 't', 'RAJ-0085', 'IBHI');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (86, '567890123', 'f', 'f', 'Mymensingh', '$250.00', 't', 'MYM-0086', 'ISINI');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (87, '890123456', 't', 't', 'Sylhet', '$700.00', 't', 'SYL-0087', 'LADMI');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (88, '345678901', 't', 'f', 'Rangpur', '$900.00', 't', 'RAN-0088', 'NRMI');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (89, '012345678', 'f', 'f', 'Khulna', '$150.00', 't', 'KHU-0089', 'MIBHI');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (90, '456789012', 't', 't', 'Dhaka', '$980.00', 't', 'DHK-0090', 'ISINI');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (91, '789012345', 'f', 't', 'Chattogram', '$380.00', 't', 'CTG-0091', 'LAIBDI');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (92, '234567890', 't', 'f', 'Sylhet', '$480.00', 't', 'SYL-0092', 'NRMI');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (93, '678901234', 'f', 'f', 'Dhaka', '$550.00', 't', 'DHK-0093', 'IBHI');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (94, '901234567', 't', 't', 'Barishal', '$850.00', 't', 'BAR-0094', 'BAER_J');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (95, '123456789', 'f', 't', 'Rajshahi', '$650.00', 't', 'RAJ-0095', 'IBHJ');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (96, '234567890', 'f', 'f', 'Mymensingh', '$300.00', 't', 'MYM-0096', 'ISINJ');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (97, '345678901', 't', 't', 'Sylhet', '$750.00', 't', 'SYL-0097', 'LADMJ');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (98, '456789012', 't', 'f', 'Rangpur', '$950.00', 't', 'RAN-0098', 'NRMJ');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (99, '567890123', 'f', 'f', 'Khulna', '$200.00', 't', 'KHU-0099', 'MIBHJ');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (100, '678901234', 't', 't', 'Dhaka', '$1,030.00', 't', 'DHK-0100', 'ISINJ');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (101, '789012345', 'f', 't', 'Chattogram', '$430.00', 't', 'CTG-0101', 'LAIBDJ');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (102, '890123456', 't', 'f', 'Sylhet', '$530.00', 't', 'SYL-0102', 'NRMJ');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (103, '901234567', 'f', 'f', 'Dhaka', '$600.00', 't', 'DHK-0103', 'IBHJ');

-- ----------------------------
-- Table structure for Ambulance Driver
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Ambulance Driver";
CREATE TABLE "Hello_Doc"."Ambulance Driver" (
  "driver_id" int4 NOT NULL DEFAULT nextval('"Hello_Doc"."Ambulance Driver_driver_id_seq"'::regclass),
  "driver_name" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "date_of_birth" date NOT NULL,
  "contact" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "salary" money NOT NULL,
  "start_time" time(6) NOT NULL,
  "end_time" time(6) NOT NULL
)
;

-- ----------------------------
-- Records of Ambulance Driver
-- ----------------------------
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (1, 'Abdul Kalam', '1979-07-05', '3242354843', '$3,000.00', '00:00:00', '08:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (2, 'Abdul Jabbar', '1980-02-05', '38743748293', '$3,200.00', '08:00:00', '16:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (3, 'Mohammad Rafiq', '1979-03-22', '824378234882', '$2,700.00', '16:00:00', '00:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (4, 'Abul mia', '1981-04-21', '898767687767', '$3,200.00', '12:00:00', '18:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (5, 'Jasim Uddin', '1996-02-12', '78990909870', '$2,700.00', '15:00:00', '21:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (6, 'Rahim Uddin', '1982-05-30', '1234567890', '$3,100.00', '09:00:00', '17:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (7, 'Karim Sheikh', '1983-06-15', '2345678901', '$3,300.00', '10:00:00', '18:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (8, 'Salam Khan', '1984-07-01', '3456789012', '$2,800.00', '11:00:00', '19:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (9, 'Bashar Ali', '1985-07-17', '4567890123', '$3,300.00', '12:00:00', '20:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (10, 'Kamal Hassan', '1986-08-02', '5678901234', '$2,800.00', '13:00:00', '21:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (11, 'Jamal Ahmed', '1987-08-18', '6789012345', '$3,400.00', '14:00:00', '22:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (12, 'Nasir Mahmud', '1988-09-03', '7890123456', '$2,900.00', '15:00:00', '23:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (13, 'Omar Faruk', '1989-09-19', '8901234567', '$3,400.00', '16:00:00', '00:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (14, 'Pintu Das', '1990-10-05', '9012345678', '$2,900.00', '17:00:00', '01:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (15, 'Qayyum Chowdhury', '1991-10-21', '0123456789', '$3,500.00', '18:00:00', '02:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (16, 'Rafiqul Islam', '1992-11-06', '1234567890', '$3,000.00', '19:00:00', '03:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (17, 'Sohel Rana', '1993-11-22', '2345678901', '$3,500.00', '20:00:00', '04:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (18, 'Tariqul Alam', '1994-12-08', '3456789012', '$3,100.00', '21:00:00', '05:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (19, 'Umar Farooq', '1995-12-24', '4567890123', '$3,600.00', '22:00:00', '06:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (20, 'Viqarun Nisa', '1997-01-09', '5678901234', '$3,200.00', '23:00:00', '07:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (21, 'Wahidul Haque', '1998-01-25', '6789012345', '$3,600.00', '00:00:00', '08:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (22, 'Xavier Rahman', '1999-02-10', '7890123456', '$3,300.00', '01:00:00', '09:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (23, 'Yasin Arafat', '2000-02-26', '8901234567', '$3,700.00', '02:00:00', '10:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (24, 'Zakir Hossain', '2001-03-14', '9012345678', '$3,400.00', '03:00:00', '11:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (25, 'Aminul Islam', '2002-03-30', '0123456789', '$3,700.00', '04:00:00', '12:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (26, 'Babul Akter', '2003-04-15', '1234567890', '$3,800.00', '05:00:00', '13:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (27, 'Chowdhury Hasan', '2004-05-01', '2345678901', '$3,900.00', '06:00:00', '14:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (28, 'Dilruba Yasmin', '2005-05-17', '3456789012', '$4,000.00', '07:00:00', '15:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (29, 'Ehsanul Haque', '2006-06-02', '4567890123', '$4,100.00', '08:00:00', '16:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (30, 'Farhana Akter', '2007-06-18', '5678901234', '$4,200.00', '09:00:00', '17:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (31, 'Golam Kibria', '2008-07-04', '6789012345', '$4,300.00', '10:00:00', '18:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (32, 'Habibur Rahman', '2009-07-20', '7890123456', '$4,400.00', '11:00:00', '19:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (33, 'Iqbal Hossain', '2010-08-05', '8901234567', '$4,500.00', '12:00:00', '20:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (34, 'Jahangir Alam', '2011-08-21', '9012345678', '$4,600.00', '13:00:00', '21:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (35, 'Kamrul Hasan', '2012-09-06', '0123456789', '$4,700.00', '14:00:00', '22:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (36, 'Liton Das', '2013-09-22', '1234567890', '$4,800.00', '15:00:00', '23:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (37, 'Mahfuzur Rahman', '2014-10-08', '2345678901', '$4,900.00', '16:00:00', '00:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (38, 'Nasima Akter', '2015-10-24', '3456789012', '$5,000.00', '17:00:00', '01:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (39, 'Omar Faruk', '2016-11-09', '4567890123', '$5,100.00', '18:00:00', '02:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (40, 'Parvez Sarker', '2017-11-25', '5678901234', '$5,200.00', '19:00:00', '03:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (41, 'Qamrul Islam', '2018-12-11', '6789012345', '$5,300.00', '20:00:00', '04:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (42, 'Rasheda Khatun', '2019-12-27', '7890123456', '$5,400.00', '21:00:00', '05:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (43, 'Sadek Ali', '2021-01-12', '8901234567', '$5,500.00', '22:00:00', '06:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (44, 'Tahmina Akter', '2022-01-28', '9012345678', '$5,600.00', '23:00:00', '07:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (45, 'Uttam Kumar', '2023-02-13', '0123456789', '$5,700.00', '00:00:00', '08:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (46, 'Viqarun Nisa', '2024-03-01', '1234567890', '$5,800.00', '01:00:00', '09:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (47, 'Wahidul Haque', '2025-03-17', '2345678901', '$5,900.00', '02:00:00', '10:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (48, 'Xavier Rahman', '2026-04-02', '3456789012', '$6,000.00', '03:00:00', '11:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (49, 'Yasin Arafat', '2027-04-18', '4567890123', '$6,100.00', '04:00:00', '12:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (50, 'Zakir Hossain', '2028-05-04', '5678901234', '$6,200.00', '05:00:00', '13:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (51, 'Abdul Kalam', '2029-05-20', '6789012345', '$6,300.00', '06:00:00', '14:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (52, 'Babul Akter', '2030-06-05', '7890123456', '$6,400.00', '07:00:00', '15:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (53, 'Chowdhury Hasan', '2031-06-21', '8901234567', '$6,500.00', '08:00:00', '16:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (54, 'Dilruba Yasmin', '2032-07-07', '9012345678', '$6,600.00', '09:00:00', '17:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (55, 'Ehsanul Haque', '2033-07-23', '0123456789', '$6,700.00', '10:00:00', '18:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (56, 'Farhana Akter', '2034-08-08', '1234567890', '$6,800.00', '11:00:00', '19:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (57, 'Golam Kibria', '2035-08-24', '2345678901', '$6,900.00', '12:00:00', '20:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (58, 'Habibur Rahman', '2036-09-09', '3456789012', '$7,000.00', '13:00:00', '21:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (59, 'Iqbal Hossain', '2037-09-25', '4567890123', '$7,100.00', '14:00:00', '22:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (60, 'Jahangir Alam', '2038-10-11', '5678901234', '$7,200.00', '15:00:00', '23:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (61, 'Kamrul Hasan', '2039-10-27', '6789012345', '$7,300.00', '16:00:00', '00:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (62, 'Liton Das', '2040-11-12', '7890123456', '$7,400.00', '17:00:00', '01:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (63, 'Mahfuzur Rahman', '2041-11-28', '8901234567', '$7,500.00', '18:00:00', '02:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (64, 'Nasima Akter', '2042-12-14', '9012345678', '$7,600.00', '19:00:00', '03:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (65, 'Omar Faruk', '2044-01-01', '0123456789', '$7,700.00', '20:00:00', '04:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (66, 'Parvez Sarker', '2045-01-17', '1234567890', '$7,800.00', '21:00:00', '05:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (67, 'Qamrul Islam', '2046-02-02', '2345678901', '$7,900.00', '22:00:00', '06:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (68, 'Rasheda Khatun', '2047-02-18', '3456789012', '$8,000.00', '23:00:00', '07:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (69, 'Sadek Ali', '2048-03-05', '4567890123', '$8,100.00', '00:00:00', '08:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (70, 'Tahmina Akter', '2049-03-21', '5678901234', '$8,200.00', '01:00:00', '09:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (71, 'Uttam Kumar', '2050-04-06', '6789012345', '$8,300.00', '02:00:00', '10:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (72, 'Viqarun Nisa', '2051-04-22', '7890123456', '$8,400.00', '03:00:00', '11:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (73, 'Wahidul Haque', '2052-05-08', '8901234567', '$8,500.00', '04:00:00', '12:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (74, 'Xavier Rahman', '2053-05-24', '9012345678', '$8,600.00', '05:00:00', '13:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (75, 'Yasin Arafat', '2054-06-09', '0123456789', '$8,700.00', '06:00:00', '14:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (76, 'Zakir Hossain', '2055-06-25', '1234567890', '$8,800.00', '07:00:00', '15:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (77, 'Abdul Kalam', '2056-07-11', '2345678901', '$8,900.00', '08:00:00', '16:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (78, 'Babul Akter', '2057-07-27', '3456789012', '$9,000.00', '09:00:00', '17:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (79, 'Chowdhury Hasan', '2058-08-12', '4567890123', '$9,100.00', '10:00:00', '18:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (80, 'Dilruba Yasmin', '2059-08-28', '5678901234', '$9,200.00', '11:00:00', '19:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (81, 'Ehsanul Haque', '2060-09-13', '6789012345', '$9,300.00', '12:00:00', '20:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (82, 'Farhana Akter', '2061-09-29', '7890123456', '$9,400.00', '13:00:00', '21:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (83, 'Golam Kibria', '2062-10-15', '8901234567', '$9,500.00', '14:00:00', '22:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (84, 'Habibur Rahman', '2063-10-31', '9012345678', '$9,600.00', '15:00:00', '23:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (85, 'Iqbal Hossain', '2064-11-16', '0123456789', '$9,700.00', '16:00:00', '00:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (86, 'Jahangir Alam', '2065-12-02', '1234567890', '$9,800.00', '17:00:00', '01:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (87, 'Kamrul Hasan', '2066-12-18', '2345678901', '$9,900.00', '18:00:00', '02:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (88, 'Liton Das', '2068-01-03', '3456789012', '$10,000.00', '19:00:00', '03:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (89, 'Mahfuzur Rahman', '2069-01-19', '4567890123', '$10,100.00', '20:00:00', '04:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (90, 'Nasima Akter', '2070-02-04', '5678901234', '$10,200.00', '21:00:00', '05:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (91, 'Omar Faruk', '2071-02-20', '6789012345', '$10,300.00', '22:00:00', '06:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (92, 'Parvez Sarker', '2072-03-07', '7890123456', '$10,400.00', '23:00:00', '07:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (93, 'Qamrul Islam', '2073-03-23', '8901234567', '$10,500.00', '00:00:00', '08:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (94, 'Rasheda Khatun', '2074-04-08', '9012345678', '$10,600.00', '01:00:00', '09:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (95, 'Sadek Ali', '2075-04-24', '0123456789', '$10,700.00', '02:00:00', '10:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (96, 'Tahmina Akter', '2076-05-10', '1234567890', '$10,800.00', '03:00:00', '11:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (97, 'Uttam Kumar', '2077-05-26', '2345678901', '$10,900.00', '04:00:00', '12:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (98, 'Viqarun Nisa', '2078-06-11', '3456789012', '$11,000.00', '05:00:00', '13:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (99, 'Wahidul Haque', '2079-06-27', '4567890123', '$11,100.00', '06:00:00', '14:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (100, 'Xavier Rahman', '2080-07-13', '5678901234', '$11,200.00', '07:00:00', '15:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (101, 'Yasin Arafat', '2081-07-29', '6789012345', '$11,300.00', '08:00:00', '16:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (102, 'Zakir Hossain', '2082-08-14', '7890123456', '$11,400.00', '09:00:00', '17:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (103, 'Abdul Kalam', '2083-08-30', '8901234567', '$11,500.00', '10:00:00', '18:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (104, 'Babul Akter', '2084-09-15', '9012345678', '$11,600.00', '11:00:00', '19:00:00');
INSERT INTO "Hello_Doc"."Ambulance Driver" VALUES (105, 'Chowdhury Hasan', '2085-10-01', '0123456789', '$11,700.00', '12:00:00', '20:00:00');

-- ----------------------------
-- Table structure for Crew info
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Crew info";
CREATE TABLE "Hello_Doc"."Crew info" (
  "Crew_id" int4 NOT NULL,
  "Name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Contact No." varchar(255) COLLATE "pg_catalog"."default",
  "Shift" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Date of birth" date
)
;

-- ----------------------------
-- Records of Crew info
-- ----------------------------

-- ----------------------------
-- Table structure for Doctor
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Doctor";
CREATE TABLE "Hello_Doc"."Doctor" (
  "doc_id" int4 NOT NULL,
  "doc_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "speciality" varchar(255) COLLATE "pg_catalog"."default",
  "location" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of Doctor
-- ----------------------------
INSERT INTO "Hello_Doc"."Doctor" VALUES (101, 'Prof. Dr. Md. Siam Ahamed', 'drsiam@gmail.com', 'Cardiologist', 'IBH,Noya Paltan');
INSERT INTO "Hello_Doc"."Doctor" VALUES (103, 'Dr. Imdadul Hasan Hamim', 'hamim123@gmail.com', 'Medicine', 'Ibn Sina,Mohammadpur');
INSERT INTO "Hello_Doc"."Doctor" VALUES (105, 'Prof. Mushfiqur Rahman', 'mi15@yahoo.com', 'Medicine', 'Square,Dhanmondi');
INSERT INTO "Hello_Doc"."Doctor" VALUES (102, 'Prof. Dr. Tahmid Hossain', 'drtahmid@gmail.com', 'Neurologist', 'Islami Bank Hospital,Noya Paltan');
INSERT INTO "Hello_Doc"."Doctor" VALUES (104, 'Dr. Hillol Chakma', 'hillol234@gmail.com', 'Nephrologist', 'Labaid,Dhanmondi');
INSERT INTO "Hello_Doc"."Doctor" VALUES (106, 'Prof. Dr. Aminul Islam', 'aminul@gmail.com', 'Cardiologist', 'Apollo Hospital,Bashundhara');
INSERT INTO "Hello_Doc"."Doctor" VALUES (107, 'Dr. Karim Sheikh', 'karim@gmail.com', 'Medicine', 'United Hospital,Gulshan');
INSERT INTO "Hello_Doc"."Doctor" VALUES (108, 'Prof. Salam Khan', 'salam@gmail.com', 'Medicine', 'Dhaka Medical College Hospital,Shahbag');
INSERT INTO "Hello_Doc"."Doctor" VALUES (109, 'Prof. Dr. Bashar Ali', 'bashar@gmail.com', 'Neurologist', 'Birdem Hospital,Shahbag');
INSERT INTO "Hello_Doc"."Doctor" VALUES (110, 'Dr. Kamal Hassan', 'kamal@gmail.com', 'Nephrologist', 'New Rajdhani Medical,Puran Dhaka');
INSERT INTO "Hello_Doc"."Doctor" VALUES (111, 'Prof. Dr. Jamal Ahmed', 'jamal@gmail.com', 'Cardiologist', 'Kurmitola General Hospital,Cantonment');
INSERT INTO "Hello_Doc"."Doctor" VALUES (112, 'Dr. Nasir Mahmud', 'nasir@gmail.com', 'Medicine', 'Shishu Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (113, 'Prof. Omar Faruk', 'omar@gmail.com', 'Medicine', 'National Heart Foundation Hospital,Mirpur');
INSERT INTO "Hello_Doc"."Doctor" VALUES (114, 'Prof. Dr. Pintu Das', 'pintu@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (115, 'Dr. Qayyum Chowdhury', 'qayyum@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (116, 'Prof. Dr. Rafiqul Islam', 'rafiqul@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (117, 'Dr. Sohel Rana', 'sohel@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (118, 'Prof. Tariqul Alam', 'tariqul@gmail.com', 'Medicine', 'National Institute of Ophthalmology & Hospital,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (119, 'Prof. Dr. Umar Farooq', 'umar@gmail.com', 'Neurologist', 'National Institute of ENT,Tejgaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (120, 'Dr. Viqarun Nisa', 'viqarun@gmail.com', 'Nephrologist', 'National Institute of Cancer Research & Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (121, 'Prof. Dr. Wahidul Haque', 'wahidul@gmail.com', 'Cardiologist', 'National Institute of Traumatology & Orthopaedic Rehabilitation,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (122, 'Dr. Xavier Rahman', 'xavier@gmail.com', 'Medicine', 'Bangabandhu Sheikh Mujib Medical University,Shahbag');
INSERT INTO "Hello_Doc"."Doctor" VALUES (123, 'Prof. Yasin Arafat', 'yasin@gmail.com', 'Medicine', 'Shaheed Suhrawardy Medical College Hospital,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (124, 'Prof. Dr. Zakir Hossain', 'zakir@gmail.com', 'Neurologist', 'Mugda Medical College Hospital,Mugda');
INSERT INTO "Hello_Doc"."Doctor" VALUES (125, 'Dr. Aminul Islam', 'aminul2@gmail.com', 'Nephrologist', 'Sir Salimullah Medical College Hospital,Mitford');
INSERT INTO "Hello_Doc"."Doctor" VALUES (126, 'Prof. Dr. Babul Akter', 'babul2@gmail.com', 'Cardiologist', 'Dhaka Medical College Hospital,Shahbag');
INSERT INTO "Hello_Doc"."Doctor" VALUES (127, 'Dr. Chowdhury Hasan', 'hasan2@gmail.com', 'Medicine', 'Bangabandhu Sheikh Mujib Medical University,Shahbag');
INSERT INTO "Hello_Doc"."Doctor" VALUES (128, 'Prof. Dilruba Yasmin', 'dilruba2@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (129, 'Prof. Dr. Ehsanul Haque', 'ehsanul2@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (130, 'Dr. Farhana Akter', 'farhana2@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (131, 'Prof. Golam Kibria', 'golam2@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (132, 'Prof. Dr. Habibur Rahman', 'habibur2@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (133, 'Dr. Iqbal Hossain', 'iqbal2@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (134, 'Prof. Jahangir Alam', 'jahangir2@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (135, 'Prof. Dr. Kamrul Hasan', 'kamrul2@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (136, 'Dr. Liton Das', 'liton2@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (137, 'Prof. Mahfuzur Rahman', 'mahfuzur2@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (138, 'Prof. Dr. Nasima Akter', 'nasima2@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (139, 'Dr. Omar Faruk', 'omar2@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (140, 'Prof. Parvez Sarker', 'parvez2@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (141, 'Prof. Dr. Qamrul Islam', 'qamrul2@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (142, 'Dr. Rasheda Khatun', 'rasheda2@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (143, 'Prof. Sadek Ali', 'sadek2@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (144, 'Prof. Dr. Tahmina Akter', 'tahmina2@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (145, 'Dr. Uttam Kumar', 'uttam2@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (146, 'Prof. Viqarun Nisa', 'viqarun2@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (147, 'Prof. Dr. Wahidul Haque', 'wahidul2@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (148, 'Dr. Xavier Rahman', 'xavier2@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (149, 'Prof. Yasin Arafat', 'yasin2@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (150, 'Prof. Dr. Zakir Hossain', 'zakir2@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (151, 'Dr. Abdul Kalam', 'abdul3@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (152, 'Prof. Babul Akter', 'babul3@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (153, 'Prof. Dr. Chowdhury Hasan', 'hasan3@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (154, 'Dr. Dilruba Yasmin', 'dilruba3@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (155, 'Prof. Ehsanul Haque', 'ehsanul3@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (156, 'Prof. Dr. Farhana Akter', 'farhana3@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (157, 'Dr. Golam Kibria', 'golam3@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (158, 'Prof. Habibur Rahman', 'habibur3@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (159, 'Prof. Dr. Iqbal Hossain', 'iqbal3@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (160, 'Dr. Jahangir Alam', 'jahangir3@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (161, 'Prof. Kamrul Hasan', 'kamrul3@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (162, 'Prof. Dr. Liton Das', 'liton3@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (163, 'Dr. Mahfuzur Rahman', 'mahfuzur3@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (164, 'Prof. Nasima Akter', 'nasima3@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (165, 'Prof. Dr. Omar Faruk', 'omar3@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (166, 'Dr. Parvez Sarker', 'parvez3@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (167, 'Prof. Qamrul Islam', 'qamrul3@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (168, 'Prof. Dr. Rasheda Khatun', 'rasheda3@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (169, 'Dr. Sadek Ali', 'sadek3@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (170, 'Prof. Tahmina Akter', 'tahmina3@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (171, 'Prof. Dr. Uttam Kumar', 'uttam3@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (172, 'Dr. Viqarun Nisa', 'viqarun3@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (173, 'Prof. Wahidul Haque', 'wahidul3@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (174, 'Prof. Dr. Xavier Rahman', 'xavier3@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (175, 'Dr. Yasin Arafat', 'yasin3@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (176, 'Prof. Zakir Hossain', 'zakir3@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (177, 'Prof. Dr. Abdul Kalam', 'abdul4@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (178, 'Dr. Babul Akter', 'babul4@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (179, 'Prof. Chowdhury Hasan', 'hasan4@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (180, 'Prof. Dr. Dilruba Yasmin', 'dilruba4@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (181, 'Dr. Ehsanul Haque', 'ehsanul4@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (182, 'Prof. Farhana Akter', 'farhana4@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (183, 'Prof. Dr. Golam Kibria', 'golam4@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (184, 'Dr. Habibur Rahman', 'habibur4@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (185, 'Prof. Iqbal Hossain', 'iqbal4@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (186, 'Prof. Dr. Jahangir Alam', 'jahangir4@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (187, 'Dr. Kamrul Hasan', 'kamrul4@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (188, 'Prof. Liton Das', 'liton4@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (189, 'Prof. Dr. Mahfuzur Rahman', 'mahfuzur4@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (190, 'Dr. Nasima Akter', 'nasima4@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (191, 'Prof. Omar Faruk', 'omar4@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (192, 'Prof. Dr. Parvez Sarker', 'parvez4@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (193, 'Dr. Qamrul Islam', 'qamrul4@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (194, 'Prof. Rasheda Khatun', 'rasheda4@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (195, 'Prof. Dr. Sadek Ali', 'sadek4@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (196, 'Dr. Tahmina Akter', 'tahmina4@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (197, 'Prof. Uttam Kumar', 'uttam4@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (198, 'Prof. Dr. Viqarun Nisa', 'viqarun4@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (199, 'Dr. Wahidul Haque', 'wahidul4@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');
INSERT INTO "Hello_Doc"."Doctor" VALUES (200, 'Prof. Xavier Rahman', 'xavier4@gmail.com', 'Neurologist', 'National Institute of Neurosciences & Hospital,Agargaon');
INSERT INTO "Hello_Doc"."Doctor" VALUES (201, 'Prof. Dr. Yasin Arafat', 'yasin4@gmail.com', 'Nephrologist', 'National Institute of Kidney Diseases & Urology,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (202, 'Dr. Zakir Hossain', 'zakir4@gmail.com', 'Cardiologist', 'National Institute of Cardiovascular Diseases,Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Doctor" VALUES (203, 'Prof. Abdul Kalam', 'abdul5@gmail.com', 'Medicine', 'National Institute of Diseases of the Chest and Hospital,Mohakhali');

-- ----------------------------
-- Table structure for Doctor Visit
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Doctor Visit";
CREATE TABLE "Hello_Doc"."Doctor Visit" (
  "Room Number" int4 NOT NULL,
  "Doc_id" int4 NOT NULL,
  "hos_id" int4 NOT NULL,
  "Tele No." varchar(255) COLLATE "pg_catalog"."default",
  "Start Time" time(6) NOT NULL,
  "End Time" time(6) NOT NULL
)
;

-- ----------------------------
-- Records of Doctor Visit
-- ----------------------------
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (321, 102, 3, '132456', '19:00:00', '21:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (322, 101, 3, '433434', '21:00:00', '22:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (202, 105, 3, '121323', '16:00:00', '18:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (117, 105, 4, '767679', '10:00:00', '12:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (201, 102, 1, '989809', '14:00:00', '18:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (321, 103, 5, '878890', '17:00:00', '19:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (278, 104, 2, '978676', '21:00:00', '22:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (266, 104, 5, '145667', '16:00:00', '18:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (325, 101, 1, '123456', '07:00:00', '09:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (326, 102, 2, '234567', '09:00:00', '11:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (327, 103, 3, '345678', '11:00:00', '13:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (328, 104, 4, '456789', '13:00:00', '15:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (329, 105, 5, '567890', '15:00:00', '17:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (330, 106, 6, '678901', '17:00:00', '19:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (331, 107, 7, '789012', '19:00:00', '21:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (332, 108, 8, '890123', '21:00:00', '23:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (333, 109, 9, '901234', '23:00:00', '01:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (334, 110, 10, '012345', '01:00:00', '03:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (335, 111, 11, '123456', '03:00:00', '05:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (336, 112, 12, '234567', '05:00:00', '07:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (337, 113, 13, '345678', '07:00:00', '09:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (338, 114, 14, '456789', '09:00:00', '11:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (339, 115, 15, '567890', '11:00:00', '13:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (340, 116, 16, '678901', '13:00:00', '15:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (341, 117, 17, '789012', '15:00:00', '17:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (342, 118, 18, '890123', '17:00:00', '19:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (343, 119, 19, '901234', '19:00:00', '21:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (344, 120, 20, '012345', '21:00:00', '23:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (345, 101, 21, '123456', '23:00:00', '01:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (346, 102, 22, '234567', '01:00:00', '03:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (347, 103, 1, '345678', '03:00:00', '05:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (348, 121, 2, '456789', '05:00:00', '07:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (349, 122, 3, '567890', '07:00:00', '09:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (350, 123, 4, '678901', '09:00:00', '11:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (351, 124, 5, '789012', '11:00:00', '13:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (352, 125, 6, '890123', '13:00:00', '15:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (353, 126, 7, '901234', '15:00:00', '17:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (354, 127, 8, '012345', '17:00:00', '19:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (355, 128, 9, '123456', '19:00:00', '21:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (356, 129, 10, '234567', '21:00:00', '23:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (357, 130, 11, '345678', '23:00:00', '01:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (358, 131, 12, '456789', '01:00:00', '03:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (359, 132, 13, '567890', '03:00:00', '05:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (360, 133, 14, '678901', '05:00:00', '07:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (361, 134, 15, '789012', '07:00:00', '09:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (362, 135, 16, '890123', '09:00:00', '11:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (363, 136, 17, '901234', '11:00:00', '13:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (364, 137, 18, '012345', '13:00:00', '15:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (365, 138, 19, '123456', '15:00:00', '17:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (366, 139, 20, '234567', '17:00:00', '19:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (367, 140, 21, '345678', '19:00:00', '21:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (368, 141, 22, '456789', '21:00:00', '23:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (369, 142, 23, '567890', '23:00:00', '01:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (370, 143, 24, '678901', '01:00:00', '03:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (371, 144, 1, '789012', '03:00:00', '05:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (372, 145, 2, '890123', '05:00:00', '07:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (373, 146, 3, '901234', '07:00:00', '09:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (374, 147, 4, '012345', '09:00:00', '11:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (375, 148, 5, '123456', '11:00:00', '13:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (376, 149, 6, '234567', '13:00:00', '15:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (377, 150, 7, '345678', '15:00:00', '17:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (378, 151, 8, '456789', '17:00:00', '19:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (379, 152, 9, '567890', '19:00:00', '21:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (380, 153, 10, '678901', '21:00:00', '23:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (381, 154, 11, '789012', '23:00:00', '01:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (382, 155, 12, '890123', '01:00:00', '03:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (383, 156, 13, '901234', '03:00:00', '05:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (384, 157, 14, '012345', '05:00:00', '07:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (385, 158, 15, '123456', '07:00:00', '09:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (386, 159, 16, '234567', '09:00:00', '11:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (387, 160, 17, '345678', '11:00:00', '13:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (388, 161, 18, '456789', '13:00:00', '15:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (389, 162, 19, '567890', '15:00:00', '17:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (390, 163, 20, '678901', '17:00:00', '19:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (391, 164, 21, '789012', '19:00:00', '21:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (392, 165, 22, '890123', '21:00:00', '23:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (393, 166, 23, '901234', '23:00:00', '01:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (394, 167, 24, '012345', '01:00:00', '03:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (395, 168, 1, '123456', '03:00:00', '05:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (396, 169, 2, '234567', '05:00:00', '07:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (397, 170, 3, '345678', '07:00:00', '09:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (398, 171, 4, '456789', '09:00:00', '11:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (399, 172, 5, '567890', '11:00:00', '13:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (400, 173, 6, '678901', '13:00:00', '15:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (400, 174, 6, '789012', '19:00:00', '21:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (401, 175, 7, '890123', '21:00:00', '23:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (402, 176, 8, '901234', '23:00:00', '01:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (403, 177, 9, '012345', '01:00:00', '03:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (404, 178, 10, '123456', '03:00:00', '05:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (405, 179, 11, '234567', '05:00:00', '07:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (406, 180, 12, '345678', '07:00:00', '09:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (407, 181, 13, '456789', '09:00:00', '11:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (408, 182, 14, '567890', '11:00:00', '13:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (409, 183, 15, '678901', '13:00:00', '15:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (410, 184, 16, '789012', '15:00:00', '17:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (411, 185, 17, '890123', '17:00:00', '19:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (412, 186, 18, '901234', '19:00:00', '21:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (413, 187, 19, '012345', '21:00:00', '23:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (414, 188, 20, '123456', '23:00:00', '01:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (415, 189, 21, '234567', '01:00:00', '03:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (416, 190, 22, '345678', '03:00:00', '05:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (417, 191, 23, '456789', '05:00:00', '07:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (418, 192, 24, '567890', '07:00:00', '09:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (419, 193, 1, '678901', '09:00:00', '11:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (420, 194, 2, '789012', '11:00:00', '13:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (421, 195, 3, '890123', '13:00:00', '15:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (422, 196, 4, '901234', '15:00:00', '17:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (423, 197, 5, '012345', '17:00:00', '19:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (424, 198, 6, '123456', '19:00:00', '21:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (425, 199, 7, '234567', '21:00:00', '23:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (426, 200, 8, '345678', '23:00:00', '01:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (427, 201, 9, '456789', '01:00:00', '03:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (428, 202, 10, '567890', '03:00:00', '05:00:00');
INSERT INTO "Hello_Doc"."Doctor Visit" VALUES (429, 203, 11, '678901', '05:00:00', '07:00:00');

-- ----------------------------
-- Table structure for Driver Info
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Driver Info";
CREATE TABLE "Hello_Doc"."Driver Info" (
  "ambulance_id" int4 NOT NULL,
  "driver_id" int4 NOT NULL,
  "Starting Date" date
)
;

-- ----------------------------
-- Records of Driver Info
-- ----------------------------
INSERT INTO "Hello_Doc"."Driver Info" VALUES (1, 5, '2021-08-13');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (2, 3, '2021-09-11');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (1, 4, '2019-11-12');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (3, 1, '2019-12-12');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (4, 2, '2021-02-18');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (5, 6, '2020-01-01');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (6, 7, '2020-02-02');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (7, 8, '2020-03-03');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (8, 9, '2020-04-04');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (9, 10, '2020-05-05');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (10, 11, '2020-06-06');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (11, 12, '2020-07-07');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (12, 13, '2020-08-08');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (13, 14, '2020-09-09');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (14, 15, '2020-10-10');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (15, 16, '2020-11-11');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (16, 17, '2020-12-12');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (17, 18, '2021-01-13');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (18, 19, '2021-02-14');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (19, 20, '2021-03-15');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (20, 21, '2021-04-16');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (21, 22, '2021-05-17');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (22, 23, '2021-06-18');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (23, 24, '2021-07-19');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (24, 25, '2021-08-20');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (25, 26, '2021-09-21');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (26, 27, '2021-10-22');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (27, 28, '2021-11-23');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (28, 29, '2021-12-24');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (29, 30, '2022-01-25');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (30, 31, '2022-02-26');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (31, 32, '2022-03-27');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (32, 33, '2022-04-28');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (33, 34, '2022-05-29');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (34, 35, '2022-06-30');
INSERT INTO "Hello_Doc"."Driver Info" VALUES (35, 36, '2022-07-31');

-- ----------------------------
-- Table structure for Driver Log in
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Driver Log in";
CREATE TABLE "Hello_Doc"."Driver Log in" (
  "Name" varchar(255) COLLATE "pg_catalog"."default",
  "Password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Driver Id" int4 NOT NULL
)
;

-- ----------------------------
-- Records of Driver Log in
-- ----------------------------

-- ----------------------------
-- Table structure for Fueling History
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Fueling History";
CREATE TABLE "Hello_Doc"."Fueling History" (
  "Ambulance Id" int4 NOT NULL,
  "Cost" money NOT NULL,
  "Consumption Rate" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of Fueling History
-- ----------------------------

-- ----------------------------
-- Table structure for Hos_Rating
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Hos_Rating";
CREATE TABLE "Hello_Doc"."Hos_Rating" (
  "Hos_ID" int4 NOT NULL,
  "Rating" int4
)
;

-- ----------------------------
-- Records of Hos_Rating
-- ----------------------------
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (1, 4);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (2, 4);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (3, 3);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (4, 5);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (5, 3);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (6, 4);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (7, 3);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (8, 5);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (9, 2);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (10, 4);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (11, 3);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (12, 5);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (13, 2);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (14, 4);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (15, 3);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (16, 5);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (17, 2);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (18, 4);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (19, 3);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (20, 5);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (21, 2);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (22, 4);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (23, 3);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (24, 5);
INSERT INTO "Hello_Doc"."Hos_Rating" VALUES (25, 2);

-- ----------------------------
-- Table structure for Hospital
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Hospital";
CREATE TABLE "Hello_Doc"."Hospital" (
  "hos_id" int4 NOT NULL,
  "hos_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "phone" int8 NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Location" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of Hospital
-- ----------------------------
INSERT INTO "Hello_Doc"."Hospital" VALUES (1, 'Islami Bank Hospital', 12345678, 'ibhdhk@gmail.com', 'Noya Paltan');
INSERT INTO "Hello_Doc"."Hospital" VALUES (2, 'Labaid', 13245678, 'labaiddhk@gmail.com', 'Dhanmondi');
INSERT INTO "Hello_Doc"."Hospital" VALUES (3, 'Ibn Sina', 13425678, 'ibnsina@gmail.com', 'Mohammadpur');
INSERT INTO "Hello_Doc"."Hospital" VALUES (4, 'New Rajdhani Medical', 13578922, 'newrajmed@gmail.com', 'Puran Dhaka');
INSERT INTO "Hello_Doc"."Hospital" VALUES (5, 'Square', 12379887, 'squarebd@gmail.com', 'Dhanmondi');
INSERT INTO "Hello_Doc"."Hospital" VALUES (6, 'Apollo Hospital', 12345679, 'apollo@gmail.com', 'Bashundhara');
INSERT INTO "Hello_Doc"."Hospital" VALUES (7, 'United Hospital', 13245679, 'united@gmail.com', 'Gulshan');
INSERT INTO "Hello_Doc"."Hospital" VALUES (8, 'Dhaka Medical College Hospital', 13425679, 'dmch@gmail.com', 'Shahbag');
INSERT INTO "Hello_Doc"."Hospital" VALUES (9, 'Birdem Hospital', 13578923, 'birdem@gmail.com', 'Shahbag');
INSERT INTO "Hello_Doc"."Hospital" VALUES (10, 'Holy Family Hospital', 12379888, 'holyfamily@gmail.com', 'Tejgaon');
INSERT INTO "Hello_Doc"."Hospital" VALUES (11, 'Kurmitola General Hospital', 12345680, 'kurmitola@gmail.com', 'Cantonment');
INSERT INTO "Hello_Doc"."Hospital" VALUES (12, 'Shishu Hospital', 13245680, 'shishu@gmail.com', 'Agargaon');
INSERT INTO "Hello_Doc"."Hospital" VALUES (13, 'National Heart Foundation Hospital', 13425680, 'nhfh@gmail.com', 'Mirpur');
INSERT INTO "Hello_Doc"."Hospital" VALUES (14, 'National Institute of Neurosciences & Hospital', 13578924, 'ninsh@gmail.com', 'Agargaon');
INSERT INTO "Hello_Doc"."Hospital" VALUES (15, 'National Institute of Kidney Diseases & Urology', 12379889, 'nikdu@gmail.com', 'Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Hospital" VALUES (16, 'National Institute of Cardiovascular Diseases', 12345681, 'nicvd@gmail.com', 'Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Hospital" VALUES (17, 'National Institute of Diseases of the Chest and Hospital', 13245681, 'nidch@gmail.com', 'Mohakhali');
INSERT INTO "Hello_Doc"."Hospital" VALUES (18, 'National Institute of Ophthalmology & Hospital', 13425681, 'nioh@gmail.com', 'Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Hospital" VALUES (19, 'National Institute of ENT', 13578925, 'nient@gmail.com', 'Tejgaon');
INSERT INTO "Hello_Doc"."Hospital" VALUES (20, 'National Institute of Cancer Research & Hospital', 12379890, 'nicrh@gmail.com', 'Mohakhali');
INSERT INTO "Hello_Doc"."Hospital" VALUES (21, 'National Institute of Traumatology & Orthopaedic Rehabilitation', 12345682, 'nitor@gmail.com', 'Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Hospital" VALUES (22, 'Bangabandhu Sheikh Mujib Medical University', 13245682, 'bsmmu@gmail.com', 'Shahbag');
INSERT INTO "Hello_Doc"."Hospital" VALUES (23, 'Shaheed Suhrawardy Medical College Hospital', 13425682, 'ssmch@gmail.com', 'Sher-e-Bangla Nagar');
INSERT INTO "Hello_Doc"."Hospital" VALUES (24, 'Mugda Medical College Hospital', 13578926, 'mmch@gmail.com', 'Mugda');
INSERT INTO "Hello_Doc"."Hospital" VALUES (25, 'Sir Salimullah Medical College Hospital', 12379891, 'ssmch@gmail.com', 'Mitford');

-- ----------------------------
-- Table structure for Hospital Admin
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Hospital Admin";
CREATE TABLE "Hello_Doc"."Hospital Admin" (
  "Name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Date of Birth" date NOT NULL,
  "ID" int4 NOT NULL,
  "Password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of Hospital Admin
-- ----------------------------
INSERT INTO "Hello_Doc"."Hospital Admin" VALUES ('Adib', '1976-02-06', 1, '12345');

-- ----------------------------
-- Table structure for Manage Ambulance
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Manage Ambulance";
CREATE TABLE "Hello_Doc"."Manage Ambulance" (
  "hos_id" int4 NOT NULL,
  "ambulance_id" int4 NOT NULL,
  "Joining date" date
)
;

-- ----------------------------
-- Records of Manage Ambulance
-- ----------------------------
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (1, 2, '2016-02-01');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (2, 1, '2018-03-09');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (3, 4, '2019-04-09');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (4, 3, '2019-08-08');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (5, 6, '2020-01-01');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (6, 7, '2020-02-02');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (7, 8, '2020-03-03');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (8, 9, '2020-04-04');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (9, 10, '2020-05-05');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (10, 11, '2020-06-06');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (11, 12, '2020-07-07');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (12, 13, '2020-08-08');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (13, 14, '2020-09-09');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (14, 15, '2020-10-10');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (15, 16, '2020-11-11');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (16, 17, '2020-12-12');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (17, 18, '2021-01-13');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (18, 19, '2021-02-14');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (19, 20, '2021-03-15');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (20, 21, '2021-04-16');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (21, 22, '2021-05-17');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (22, 23, '2021-06-18');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (23, 24, '2021-07-19');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (1, 25, '2021-08-20');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (2, 26, '2021-09-21');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (3, 27, '2021-10-22');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (4, 28, '2021-11-23');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (5, 29, '2021-12-24');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (6, 30, '2022-01-25');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (7, 31, '2022-02-26');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (8, 32, '2022-03-27');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (11, 58, '2020-05-30');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (10, 57, '2017-04-29');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (9, 56, '2014-03-28');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (8, 55, '2019-02-27');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (7, 54, '2018-01-26');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (6, 53, '2019-12-25');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (5, 52, '2013-11-24');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (4, 51, '2013-10-23');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (3, 50, '2016-09-22');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (2, 49, '2015-08-21');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (1, 48, '2018-07-20');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (12, 36, '2020-07-31');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (11, 35, '2021-06-30');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (10, 34, '2022-05-29');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (9, 33, '2012-04-28');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (1, 37, '2021-12-31');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (2, 38, '2021-11-30');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (3, 39, '2021-10-29');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (4, 40, '2021-09-28');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (5, 41, '2021-08-27');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (6, 42, '2021-07-26');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (7, 43, '2021-06-25');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (8, 44, '2021-05-24');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (9, 45, '2021-04-23');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (10, 46, '2021-03-22');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (11, 47, '2021-02-21');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (12, 60, '2021-01-20');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (13, 61, '2020-12-19');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (14, 62, '2020-11-18');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (15, 63, '2020-10-17');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (16, 64, '2020-09-16');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (17, 65, '2020-08-15');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (18, 66, '2020-07-14');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (19, 67, '2020-06-13');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (20, 68, '2020-05-12');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (21, 69, '2020-04-11');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (22, 70, '2020-03-10');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (23, 71, '2020-02-09');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (1, 72, '2020-01-08');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (2, 73, '2019-12-07');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (3, 74, '2019-11-06');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (4, 75, '2019-10-05');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (5, 76, '2019-09-04');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (6, 77, '2019-08-03');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (7, 78, '2019-07-02');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (8, 79, '2019-06-01');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (9, 80, '2019-05-31');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (10, 81, '2019-04-30');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (11, 82, '2019-03-29');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (12, 83, '2019-02-28');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (13, 84, '2019-01-27');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (14, 85, '2018-12-26');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (15, 86, '2018-11-25');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (16, 87, '2018-10-24');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (17, 88, '2018-09-23');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (18, 89, '2018-08-22');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (19, 90, '2018-07-21');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (20, 91, '2018-06-20');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (21, 92, '2018-05-19');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (22, 93, '2018-04-18');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (23, 94, '2018-03-17');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (1, 95, '2018-02-16');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (2, 96, '2018-01-15');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (3, 97, '2017-12-14');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (4, 98, '2017-11-13');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (5, 99, '2017-10-12');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (6, 100, '2017-09-11');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (7, 101, '2017-08-10');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (8, 102, '2017-07-09');
INSERT INTO "Hello_Doc"."Manage Ambulance" VALUES (9, 103, '2017-06-08');

-- ----------------------------
-- Table structure for Manage Crew
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Manage Crew";
CREATE TABLE "Hello_Doc"."Manage Crew" (
  "Crew id" int4 NOT NULL,
  "Ambulance id" int4 NOT NULL,
  "Joining Date" date,
  "Salary" money
)
;

-- ----------------------------
-- Records of Manage Crew
-- ----------------------------

-- ----------------------------
-- Table structure for Manage Hospital
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Manage Hospital";
CREATE TABLE "Hello_Doc"."Manage Hospital" (
  "Admin Id" int4 NOT NULL,
  "Hospital Id" int4 NOT NULL
)
;

-- ----------------------------
-- Records of Manage Hospital
-- ----------------------------

-- ----------------------------
-- Table structure for Order Ambulance
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Order Ambulance";
CREATE TABLE "Hello_Doc"."Order Ambulance" (
  "Ambulance id" int4 NOT NULL,
  "user_id" int4 NOT NULL,
  "ID" int4,
  "Status" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of Order Ambulance
-- ----------------------------
INSERT INTO "Hello_Doc"."Order Ambulance" VALUES (1, 1, 1, 'Confirmed');
INSERT INTO "Hello_Doc"."Order Ambulance" VALUES (2, 8, 3, 'Confirmed');
INSERT INTO "Hello_Doc"."Order Ambulance" VALUES (3, 8, 2, 'Declined');

-- ----------------------------
-- Table structure for Parking Details
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Parking Details";
CREATE TABLE "Hello_Doc"."Parking Details" (
  "Ambulance Id" int4 NOT NULL,
  "Location" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Fee" money NOT NULL,
  "Parking Time" time(6) NOT NULL,
  "Parking Id" int4 NOT NULL
)
;

-- ----------------------------
-- Records of Parking Details
-- ----------------------------

-- ----------------------------
-- Table structure for Patient
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Patient";
CREATE TABLE "Hello_Doc"."Patient" (
  "ID" int4 NOT NULL,
  "Name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Phone" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Date_Of_Birth" date NOT NULL,
  "Address" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Gender" varchar(128) COLLATE "pg_catalog"."default" NOT NULL,
  "Blood_Group" varchar(128) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of Patient
-- ----------------------------
INSERT INTO "Hello_Doc"."Patient" VALUES (1, 'Mohtassim Masud', '01234566789', 'masud@gmail.com', '2002-12-17', 'Kolabagan', 'Male', 'B(+)ve');
INSERT INTO "Hello_Doc"."Patient" VALUES (2, 'Shoaib Hossain', '01345672443', 'shoaib@gmail.com', '2002-10-31', 'Dhakeswari', 'Male', 'A(+)ve');
INSERT INTO "Hello_Doc"."Patient" VALUES (3, 'Tanim Ahmed', '0145627732', 'tanim@gmail.com', '2002-09-20', 'Bakshibazar', 'Male', 'A(+)ve');
INSERT INTO "Hello_Doc"."Patient" VALUES (4, 'Omlan Ahmed', '01563728283', 'omlan@gmail.com', '2002-08-15', 'Bakshibazar', 'Male', 'B(+)ve');

-- ----------------------------
-- Table structure for Payment
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Payment";
CREATE TABLE "Hello_Doc"."Payment" (
  "Payment Id" int4 NOT NULL,
  "Hospital Id" int4 NOT NULL,
  "Ambulance Id" int4 NOT NULL,
  "User Id" int4 NOT NULL,
  "Payment Type" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Status" bool NOT NULL,
  "Order_Id" int4 NOT NULL
)
;

-- ----------------------------
-- Records of Payment
-- ----------------------------

-- ----------------------------
-- Table structure for Repairing History
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."Repairing History";
CREATE TABLE "Hello_Doc"."Repairing History" (
  "Problem" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Cost" numeric(10,2) NOT NULL,
  "Date" date NOT NULL,
  "Ambulance Id" int4 NOT NULL,
  "Repairing Num." int4 NOT NULL
)
;

-- ----------------------------
-- Records of Repairing History
-- ----------------------------

-- ----------------------------
-- Table structure for User
-- ----------------------------
DROP TABLE IF EXISTS "Hello_Doc"."User";
CREATE TABLE "Hello_Doc"."User" (
  "Name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Reg. Number" int4 NOT NULL,
  "Email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Location" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of User
-- ----------------------------
INSERT INTO "Hello_Doc"."User" VALUES ('Siam', 1, 'siam@gmail.com', '12345', 'Dhaka');
INSERT INTO "Hello_Doc"."User" VALUES ('dsfjbjfb', 2, 'jhvdshjvd@shjbdfh', 'dvsbhdsh', NULL);
INSERT INTO "Hello_Doc"."User" VALUES ('hsadhjvsdghvsag', 3, 'jhvdshjvd@hsdvfhgsv', 'dvsbhdsh', 'fhdjhsavfdh');
INSERT INTO "Hello_Doc"."User" VALUES ('sdfvsvdf', 4, 'jhvdshjvd@hdsfbvdh', 'dvsbhdsh', 'sbefnjbeg');
INSERT INTO "Hello_Doc"."User" VALUES ('jhefdhjwef', 5, 'dscbhmsdb@sdjbsjdb', 'dvsbhdshdsmbhds', 'sjdfbhjbewhf');
INSERT INTO "Hello_Doc"."User" VALUES ('dshjfvsj', 6, 'jhvdshjvsdkfjbjksdb@dshfbdsb', 'dvsbhdsam', 'dshjfbhjdsb');
INSERT INTO "Hello_Doc"."User" VALUES ('ALIF AL SHAHRIAR', 7, 'alifbangbig@gmail.com', 'alif12345', 'Dhaka');
INSERT INTO "Hello_Doc"."User" VALUES ('Siadul Anam Siam', 8, 'siam@gmail.com', 'siam1234', 'Aula');
INSERT INTO "Hello_Doc"."User" VALUES ('Md Hossain', 9, 'alifbangbig@gmail.com', 'alif12345', '');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "Hello_Doc"."Ambulance Driver_driver_id_seq"
OWNED BY "Hello_Doc"."Ambulance Driver"."driver_id";
SELECT setval('"Hello_Doc"."Ambulance Driver_driver_id_seq"', 3, true);

-- ----------------------------
-- Primary Key structure for table Admin
-- ----------------------------
ALTER TABLE "Hello_Doc"."Admin" ADD CONSTRAINT "Admin_pkey" PRIMARY KEY ("Name");

-- ----------------------------
-- Uniques structure for table Ambulance
-- ----------------------------
ALTER TABLE "Hello_Doc"."Ambulance" ADD CONSTRAINT "Ambulance_Unique" UNIQUE ("ID");

-- ----------------------------
-- Primary Key structure for table Ambulance
-- ----------------------------
ALTER TABLE "Hello_Doc"."Ambulance" ADD CONSTRAINT "Ambulance_pkey" PRIMARY KEY ("ID");

-- ----------------------------
-- Uniques structure for table Ambulance Driver
-- ----------------------------
ALTER TABLE "Hello_Doc"."Ambulance Driver" ADD CONSTRAINT "Driver_Unique" UNIQUE ("driver_id");

-- ----------------------------
-- Primary Key structure for table Ambulance Driver
-- ----------------------------
ALTER TABLE "Hello_Doc"."Ambulance Driver" ADD CONSTRAINT "Ambulance Driver_pkey1" PRIMARY KEY ("driver_id");

-- ----------------------------
-- Primary Key structure for table Crew info
-- ----------------------------
ALTER TABLE "Hello_Doc"."Crew info" ADD CONSTRAINT "Crew info_pkey" PRIMARY KEY ("Crew_id");

-- ----------------------------
-- Primary Key structure for table Doctor
-- ----------------------------
ALTER TABLE "Hello_Doc"."Doctor" ADD CONSTRAINT "Doctor_pkey" PRIMARY KEY ("doc_id");

-- ----------------------------
-- Primary Key structure for table Doctor Visit
-- ----------------------------
ALTER TABLE "Hello_Doc"."Doctor Visit" ADD CONSTRAINT "Doctor Visit_pkey" PRIMARY KEY ("Doc_id", "hos_id");

-- ----------------------------
-- Primary Key structure for table Driver Info
-- ----------------------------
ALTER TABLE "Hello_Doc"."Driver Info" ADD CONSTRAINT "Driver Info_pkey" PRIMARY KEY ("ambulance_id", "driver_id");

-- ----------------------------
-- Primary Key structure for table Driver Log in
-- ----------------------------
ALTER TABLE "Hello_Doc"."Driver Log in" ADD CONSTRAINT "Driver Log in_pkey" PRIMARY KEY ("Password", "Driver Id");

-- ----------------------------
-- Primary Key structure for table Fueling History
-- ----------------------------
ALTER TABLE "Hello_Doc"."Fueling History" ADD CONSTRAINT "Fueling History_pkey" PRIMARY KEY ("Ambulance Id");

-- ----------------------------
-- Primary Key structure for table Hos_Rating
-- ----------------------------
ALTER TABLE "Hello_Doc"."Hos_Rating" ADD CONSTRAINT "Hos_Rating_pkey" PRIMARY KEY ("Hos_ID");

-- ----------------------------
-- Uniques structure for table Hospital
-- ----------------------------
ALTER TABLE "Hello_Doc"."Hospital" ADD CONSTRAINT "Hospital Id" UNIQUE ("hos_id");

-- ----------------------------
-- Primary Key structure for table Hospital
-- ----------------------------
ALTER TABLE "Hello_Doc"."Hospital" ADD CONSTRAINT "Hospital_pkey" PRIMARY KEY ("hos_id");

-- ----------------------------
-- Uniques structure for table Hospital Admin
-- ----------------------------
ALTER TABLE "Hello_Doc"."Hospital Admin" ADD CONSTRAINT "Admin Id" UNIQUE ("ID");

-- ----------------------------
-- Primary Key structure for table Hospital Admin
-- ----------------------------
ALTER TABLE "Hello_Doc"."Hospital Admin" ADD CONSTRAINT "Hospital Admin_pkey" PRIMARY KEY ("ID", "Password");

-- ----------------------------
-- Primary Key structure for table Manage Ambulance
-- ----------------------------
ALTER TABLE "Hello_Doc"."Manage Ambulance" ADD CONSTRAINT "Manage Ambulance_pkey" PRIMARY KEY ("hos_id", "ambulance_id");

-- ----------------------------
-- Primary Key structure for table Manage Crew
-- ----------------------------
ALTER TABLE "Hello_Doc"."Manage Crew" ADD CONSTRAINT "Manage Crew_pkey" PRIMARY KEY ("Crew id", "Ambulance id");

-- ----------------------------
-- Primary Key structure for table Manage Hospital
-- ----------------------------
ALTER TABLE "Hello_Doc"."Manage Hospital" ADD CONSTRAINT "Manage Hospital_pkey" PRIMARY KEY ("Admin Id", "Hospital Id");

-- ----------------------------
-- Triggers structure for table Order Ambulance
-- ----------------------------
CREATE TRIGGER "check_status_before_insert" BEFORE INSERT ON "Hello_Doc"."Order Ambulance"
FOR EACH ROW
EXECUTE PROCEDURE "public"."check_user_status_before_insert"();

-- ----------------------------
-- Uniques structure for table Order Ambulance
-- ----------------------------
ALTER TABLE "Hello_Doc"."Order Ambulance" ADD CONSTRAINT "Order Id" UNIQUE ("ID");

-- ----------------------------
-- Primary Key structure for table Order Ambulance
-- ----------------------------
ALTER TABLE "Hello_Doc"."Order Ambulance" ADD CONSTRAINT "Order Ambulance_pkey" PRIMARY KEY ("Ambulance id", "user_id");

-- ----------------------------
-- Primary Key structure for table Parking Details
-- ----------------------------
ALTER TABLE "Hello_Doc"."Parking Details" ADD CONSTRAINT "Parking Details_pkey" PRIMARY KEY ("Ambulance Id", "Parking Id");

-- ----------------------------
-- Primary Key structure for table Patient
-- ----------------------------
ALTER TABLE "Hello_Doc"."Patient" ADD CONSTRAINT "Patient_pkey" PRIMARY KEY ("ID");

-- ----------------------------
-- Primary Key structure for table Payment
-- ----------------------------
ALTER TABLE "Hello_Doc"."Payment" ADD CONSTRAINT "Payment_pkey" PRIMARY KEY ("Payment Id", "Hospital Id", "Ambulance Id", "User Id", "Order_Id");

-- ----------------------------
-- Primary Key structure for table Repairing History
-- ----------------------------
ALTER TABLE "Hello_Doc"."Repairing History" ADD CONSTRAINT "Repairing History_pkey" PRIMARY KEY ("Ambulance Id", "Repairing Num.");

-- ----------------------------
-- Primary Key structure for table User
-- ----------------------------
ALTER TABLE "Hello_Doc"."User" ADD CONSTRAINT "User_pkey" PRIMARY KEY ("Reg. Number");

-- ----------------------------
-- Foreign Keys structure for table Doctor Visit
-- ----------------------------
ALTER TABLE "Hello_Doc"."Doctor Visit" ADD CONSTRAINT "Doc_Fk" FOREIGN KEY ("Doc_id") REFERENCES "Hello_Doc"."Doctor" ("doc_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "Hello_Doc"."Doctor Visit" ADD CONSTRAINT "Hos_Fk" FOREIGN KEY ("hos_id") REFERENCES "Hello_Doc"."Hospital" ("hos_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Driver Info
-- ----------------------------
ALTER TABLE "Hello_Doc"."Driver Info" ADD CONSTRAINT "Ambulance_FK" FOREIGN KEY ("ambulance_id") REFERENCES "Hello_Doc"."Ambulance" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "Hello_Doc"."Driver Info" ADD CONSTRAINT "Driver_FK" FOREIGN KEY ("driver_id") REFERENCES "Hello_Doc"."Ambulance Driver" ("driver_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Driver Log in
-- ----------------------------
ALTER TABLE "Hello_Doc"."Driver Log in" ADD CONSTRAINT "Amb_Id" FOREIGN KEY ("Driver Id") REFERENCES "Hello_Doc"."Ambulance Driver" ("driver_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Fueling History
-- ----------------------------
ALTER TABLE "Hello_Doc"."Fueling History" ADD CONSTRAINT "Ambulance Id" FOREIGN KEY ("Ambulance Id") REFERENCES "Hello_Doc"."Ambulance" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Hos_Rating
-- ----------------------------
ALTER TABLE "Hello_Doc"."Hos_Rating" ADD CONSTRAINT "hos_id" FOREIGN KEY ("Hos_ID") REFERENCES "Hello_Doc"."Hospital" ("hos_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Manage Ambulance
-- ----------------------------
ALTER TABLE "Hello_Doc"."Manage Ambulance" ADD CONSTRAINT "Ambulance_FK" FOREIGN KEY ("ambulance_id") REFERENCES "Hello_Doc"."Ambulance" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "Hello_Doc"."Manage Ambulance" ADD CONSTRAINT "Hospital_FK" FOREIGN KEY ("hos_id") REFERENCES "Hello_Doc"."Hospital" ("hos_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Manage Crew
-- ----------------------------
ALTER TABLE "Hello_Doc"."Manage Crew" ADD CONSTRAINT "Am_id" FOREIGN KEY ("Ambulance id") REFERENCES "Hello_Doc"."Ambulance" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "Hello_Doc"."Manage Crew" ADD CONSTRAINT "Crew id" FOREIGN KEY ("Crew id") REFERENCES "Hello_Doc"."Crew info" ("Crew_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Manage Hospital
-- ----------------------------
ALTER TABLE "Hello_Doc"."Manage Hospital" ADD CONSTRAINT "Admin_Fk" FOREIGN KEY ("Admin Id") REFERENCES "Hello_Doc"."Hospital Admin" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "Hello_Doc"."Manage Hospital" ADD CONSTRAINT "Hos_FK" FOREIGN KEY ("Hospital Id") REFERENCES "Hello_Doc"."Hospital" ("hos_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Order Ambulance
-- ----------------------------
ALTER TABLE "Hello_Doc"."Order Ambulance" ADD CONSTRAINT "Ambulance_FK" FOREIGN KEY ("Ambulance id") REFERENCES "Hello_Doc"."Ambulance" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "Hello_Doc"."Order Ambulance" ADD CONSTRAINT "User_FK" FOREIGN KEY ("user_id") REFERENCES "Hello_Doc"."User" ("Reg. Number") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Parking Details
-- ----------------------------
ALTER TABLE "Hello_Doc"."Parking Details" ADD CONSTRAINT "Ambulance Id" FOREIGN KEY ("Ambulance Id") REFERENCES "Hello_Doc"."Ambulance" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Payment
-- ----------------------------
ALTER TABLE "Hello_Doc"."Payment" ADD CONSTRAINT "Ambulance_FK" FOREIGN KEY ("Ambulance Id") REFERENCES "Hello_Doc"."Ambulance" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "Hello_Doc"."Payment" ADD CONSTRAINT "Hos_FK" FOREIGN KEY ("Hospital Id") REFERENCES "Hello_Doc"."Hospital" ("hos_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "Hello_Doc"."Payment" ADD CONSTRAINT "Order_FK" FOREIGN KEY ("Order_Id") REFERENCES "Hello_Doc"."Order Ambulance" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "Hello_Doc"."Payment" ADD CONSTRAINT "User_FK" FOREIGN KEY ("User Id") REFERENCES "Hello_Doc"."User" ("Reg. Number") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table Repairing History
-- ----------------------------
ALTER TABLE "Hello_Doc"."Repairing History" ADD CONSTRAINT "Amb_Id" FOREIGN KEY ("Ambulance Id") REFERENCES "Hello_Doc"."Ambulance" ("ID") ON DELETE NO ACTION ON UPDATE NO ACTION;
