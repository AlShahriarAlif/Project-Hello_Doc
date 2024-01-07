/*
 Navicat Premium Data Transfer

 Source Server         : SS
 Source Server Type    : PostgreSQL
 Source Server Version : 160001 (160001)
 Source Host           : localhost:5432
 Source Catalog        : postgres
 Source Schema         : Hello_Doc

 Target Server Type    : PostgreSQL
 Target Server Version : 160001 (160001)
 File Encoding         : 65001

 Date: 07/01/2024 20:18:51
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
  "Availability" bool NOT NULL
)
;

-- ----------------------------
-- Records of Ambulance
-- ----------------------------
INSERT INTO "Hello_Doc"."Ambulance" VALUES (2, '12322432', 't', 't', 'Ibn Sina , Mohammadpur', '$400.00', 't');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (1, '039843734', 'f', 'f', 'Sylhet ', '$50.00', 'f');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (3, '345465656', 't', 'f', 'Chattogram', '$200.00', 'f');
INSERT INTO "Hello_Doc"."Ambulance" VALUES (4, '123234344', 't', 't', 'New Rajdhani Medical,Puran Dhaka', '$350.00', 't');

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
INSERT INTO "Hello_Doc"."Doctor" VALUES (1, 'Prof. Dr. Md. Siam Ahamed', 'drsiam@gmail.com', 'Cardiologist', 'IBH,Noya Paltan');
INSERT INTO "Hello_Doc"."Doctor" VALUES (2, 'Prof. Dr. Tahmid Hossain', 'drtahmid@gmail.com', 'Neurologist', 'Labaid,Dhanmondi');
INSERT INTO "Hello_Doc"."Doctor" VALUES (3, 'Dr. Imdadul Hasan Hamim', 'hamim123@gmail.com', 'Medicine', 'Ibn Sina,Mohammadpur');
INSERT INTO "Hello_Doc"."Doctor" VALUES (4, 'Dr. Hillol Chakma', 'hillol234@gmail.com', 'Nephrologist', 'New Rajdhani Medical,Puran Dhaka');

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
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "Hello_Doc"."Ambulance Driver_driver_id_seq"
OWNED BY "Hello_Doc"."Ambulance Driver"."driver_id";
SELECT setval('"Hello_Doc"."Ambulance Driver_driver_id_seq"', 3, true);

-- ----------------------------
-- Primary Key structure for table Ambulance
-- ----------------------------
ALTER TABLE "Hello_Doc"."Ambulance" ADD CONSTRAINT "Ambulance_pkey" PRIMARY KEY ("ID");

-- ----------------------------
-- Primary Key structure for table Ambulance Driver
-- ----------------------------
ALTER TABLE "Hello_Doc"."Ambulance Driver" ADD CONSTRAINT "Ambulance Driver_pkey1" PRIMARY KEY ("driver_id", "driver_name");

-- ----------------------------
-- Primary Key structure for table Doctor
-- ----------------------------
ALTER TABLE "Hello_Doc"."Doctor" ADD CONSTRAINT "Doctor_pkey" PRIMARY KEY ("doc_id");

-- ----------------------------
-- Primary Key structure for table Hospital
-- ----------------------------
ALTER TABLE "Hello_Doc"."Hospital" ADD CONSTRAINT "Hospital_pkey" PRIMARY KEY ("hos_id");

-- ----------------------------
-- Primary Key structure for table Patient
-- ----------------------------
ALTER TABLE "Hello_Doc"."Patient" ADD CONSTRAINT "Patient_pkey" PRIMARY KEY ("ID");
