const Pool=require("pg").Pool;

const pool=new Pool({
    user:"postgres",
    password:"16106ORSIam",
    host:"localhost",
    port:5432,
    database:"Rakib"
})

module.exports=pool;