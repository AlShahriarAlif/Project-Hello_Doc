/*
 Navicat Premium Data Transfer

 Source Server         : practise
 Source Server Type    : PostgreSQL
 Source Server Version : 160001 (160001)
 Source Host           : localhost:5432
 Source Catalog        : Rakib
 Source Schema         : Hello_Doc

 Target Server Type    : PostgreSQL
 Target Server Version : 160001 (160001)
 File Encoding         : 65001

 Date: 18/02/2024 16:22:33
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
  "Password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
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
INSERT INTO "Hello_Doc"."Ambulance" VALUES (2, '12322432', 't', 't', 'Ibn Sina , Mohammadpur', '$400.00', 't', 'DHK-00221', 'IBH_A');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (1, '039843734', 'f', 'f', 'Sylhet ', '$50.00', 'f', 'DHK-00331', 'LAID_A');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (4, '123234344', 'f', 'f', 'New Rajdhani Medical,Puran Dhaka', '$350.00', 't', 'KHL-33221', 'ISIN_A');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (3, '345465656', 't', 'f', 'Chattogram', '$200.00', 't', 'CTG-11776', 'NRM_A');

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
  "User id" int4 NOT NULL,
  "Place" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "Time" time(6) NOT NULL,
  "ID" int4 NOT NULL
)
;

-- ----------------------------
-- Records of Order Ambulance
-- ----------------------------

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
-- Uniques structure for table Order Ambulance
-- ----------------------------
ALTER TABLE "Hello_Doc"."Order Ambulance" ADD CONSTRAINT "Order Id" UNIQUE ("ID");

-- ----------------------------
-- Primary Key structure for table Order Ambulance
-- ----------------------------
ALTER TABLE "Hello_Doc"."Order Ambulance" ADD CONSTRAINT "Order Ambulance_pkey" PRIMARY KEY ("Ambulance id", "User id", "ID");

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
ALTER TABLE "Hello_Doc"."Order Ambulance" ADD CONSTRAINT "User_FK" FOREIGN KEY ("User id") REFERENCES "Hello_Doc"."User" ("Reg. Number") ON DELETE NO ACTION ON UPDATE NO ACTION;

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
