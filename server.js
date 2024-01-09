const express=require("express");
const app=express();
const cors=require("cors");
const pool=require("./db");

app.use(cors());
app.use(express.json());

//get all doctor info
app.get("/Hello_Doc", async(req,res) =>
{
    try{
        const q =  await pool.query(
            'SELECT * FROM "Hello_Doc"."Doctor";'
        );
        console.log(q.rows);
        res.json(q.rows);

    }catch(err)
    {
        console.error(err.message);
    }
})

//get info of a particular doctor with doc_id 
app.get("/Hello_Doc/:ID", async(req,res) =>
{
    try{
        const { ID } = req.params;
        const q =  await pool.query(
            'SELECT * FROM "Hello_Doc"."Doctor" WHERE "doc_id" = $1',[ID]
        );

        console.log(q.rows);
        res.json(q.rows);

    }catch(err)
    {
        console.error(err.message);
    }
})
// Search for a doctor by name
app.get("/Hello_Doc/search/doctor/:name", async(req, res) => {
    try {
      const { name } = req.params;
      const results = await pool.query(
        'SELECT * FROM "Hello_Doc"."Doctor" WHERE "doc_name" = $1', [name]
      );
      res.json(results.rows);
    } catch(err) {
      console.error(err.message);
    }
  });
  
  // Search for a doctor by speciality
  app.get("/Hello_Doc/search/speciality/:speciality", async(req, res) => {
    try {
      const { speciality } = req.params;
      const results = await pool.query(
        'SELECT * FROM "Hello_Doc"."Doctor" WHERE "speciality" = $1', [speciality]
      );
      res.json(results.rows);
    } catch(err) {
      console.error(err.message);
    }
  });
  
  // Search for a hospital by name
  app.get("/Hello_Doc/search/hospital/:name", async(req, res) => {
    try {
      const { name } = req.params;
      const results = await pool.query(
        'SELECT * FROM "Hello_Doc"."Hospital" WHERE "hos_name" = $1', [name]
      );
      res.json(results.rows);
    } catch(err) {
      console.error(err.message);
    }
  });

app.listen(5000,()=>
{
    console.log("Connected.");
});
