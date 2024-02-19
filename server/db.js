const Pool=require("pg").Pool;

const pool=new Pool({
    user:"postgres",
    password:"16106ORSIam",
    host:"localhost",
    port:5432,
    database:"Rakib"

})

module.exports=pool;

// Source Server         : practise
// Source Server Type    : PostgreSQL
// Source Server Version : 160001 (160001)
// Source Host           : localhost:5432
// Source Catalog        : Rakib
// Source Schema         : Hello_Doc

// Target Server Type    : PostgreSQL
// Target Server Version : 160001 (160001)
// File Encoding         : 65001
