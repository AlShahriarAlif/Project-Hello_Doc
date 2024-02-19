const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");

app.use(cors());
app.use(express.json());

//get all doctor info
app.get("/Hello_Doc", async (req, res) => {
  try {
    console.log("req coming");
    const q = await pool.query(
      'SELECT * FROM "Hello_Doc"."Doctor";'
    );
    console.log(q.rows);
    return res.json(q.rows);

  } catch (err) {
    console.error(err.message);
  }
})
app.get("/Ambulance_Home", async (req, res) => {
  try {
    console.log("req coming");
    const q = await pool.query(
      'SELECT * FROM "Hello_Doc"."Ambulance";'
    );
    console.log(q.rows);
    return res.json(q.rows);

  } catch (err) {
    console.error(err.message);
  }
})
app.post("/login", async (req, res) => {
  try {
    console.log("req coming");
    const {firstName, contact,password} = req.body;
    const {"type":type} = req.headers;
    console.log(type)
    console.log(firstName,contact,password);
    const q = await pool.query(
      'SELECT * FROM "Hello_Doc"."User" where "Name" = $1;',[firstName]
    );
    console.log(q.rows);
    if(q.rows.length === 0)
      return res.sendStatus(401);
    return res.sendStatus(200);
    // return res.json(q.rows);

  } catch (err) {
    console.error(err.message);
  }
})

//get info of a particular doctor with doc_id 
app.get("/Hello_Doc/:ID", async (req, res) => {
  try {
    const { ID } = req.params;
    const q = await pool.query(
      'SELECT * FROM "Hello_Doc"."Doctor" WHERE "doc_id" = $1', [ID]
    );

    console.log(q.rows);
    res.json(q.rows);

  } catch (err) {
    console.error(err.message);
  }
})
// Search for a doctor by name
app.get("/Hello_Doc/search/doctor/:name", async (req, res) => {
  try {
    const { name } = req.params;
    const results = await pool.query(
      'SELECT * FROM "Hello_Doc"."Doctor" WHERE "doc_name" = $1', [name]
    );
    res.json(results.rows);
  } catch (err) {
    console.error(err.message);
  }
});

// Search for a doctor by speciality
app.get("/Hello_Doc/search/speciality/:speciality", async (req, res) => {
  try {
    const { speciality } = req.params;
    const results = await pool.query(
      'SELECT * FROM "Hello_Doc"."Doctor" WHERE "speciality" = $1', [speciality]
    );
    res.json(results.rows);
  } catch (err) {
    console.error(err.message);
  }
});

// Search for a hospital by name
app.get("/Hello_Doc/search/hospital/:name", async (req, res) => {
  try {
    const { name } = req.params;
    const results = await pool.query(
      'SELECT "Hello_Doc"."Doctor".doc_name,"Hello_Doc"."Doctor".email,"Hello_Doc"."Doctor".speciality,"Hello_Doc"."Doctor"."location" FROM "Hello_Doc"."Doctor" JOIN "Hello_Doc"."Doctor Visit" ON "Hello_Doc"."Doctor"."doc_id" = "Hello_Doc"."Doctor Visit"."Doc_id" JOIN "Hello_Doc"."Hospital" ON "Hello_Doc"."Doctor Visit"."hos_id" = "Hello_Doc"."Hospital"."hos_id" WHERE "Hello_Doc"."Hospital"."hos_name" = $1', [name]

    );
    res.json(results.rows);
  } catch (err) {
    console.error(err.message);
  }
});

//Search Ambulance under a hospital
app.get("/Hello_Doc/search/hospital_for_ambulance/:name", async (req, res) => {
  try {
    const { name } = req.params;
    const results = await pool.query(
      `SELECT "Hello_Doc"."Ambulance"."ID","Hello_Doc"."Ambulance"."Contact","Hello_Doc"."Ambulance"."AC", "Hello_Doc"."Ambulance"."Is_MICU", "Hello_Doc"."Ambulance"."Current Location", "Hello_Doc"."Ambulance"."Price_per_hour", "Hello_Doc"."Ambulance"."Availability"
        FROM "Hello_Doc"."Ambulance"
        JOIN "Hello_Doc"."Manage Ambulance" ON "Hello_Doc"."Ambulance"."ID" = "Hello_Doc"."Manage Ambulance"."ambulance_id"
        JOIN "Hello_Doc"."Hospital" ON "Hello_Doc"."Manage Ambulance"."hos_id" = "Hello_Doc"."Hospital"."hos_id"
        WHERE "Hello_Doc"."Hospital"."hos_name" = $1;`, [name]
    );
    res.json(results.rows);
  } catch (err) {
    console.error(err.message);
  }
});

//search Ambulance under a price range
app.get("/Hello_Doc/search/price/:price", async (req, res) => {
  try {
    const { price } = req.params;
    const results = await pool.query(
      `SELECT * FROM "Hello_Doc"."Ambulance"
      WHERE CAST("Price_per_hour" AS numeric) <= $1;`, [price]
    );
    res.json(results.rows);
  } catch (err) {
    console.error(err.message);
  }
});
//if ambulance has ac
app.get("/Hello_Doc/search/ac", async (req, res) => {
  try {
    const results = await pool.query(
      `SELECT * FROM "Hello_Doc"."Ambulance"
      WHERE "Hello_Doc"."Ambulance"."AC"=TRUE;`
    );
    res.json(results.rows);

  }
  catch (err) {
    console.error(err.message);

  }

});
//if ambulance has micu
app.get("/Hello_Doc/search/micu", async (req, res) => {
  try {
    const results = await pool.query(
      `SELECT * FROM "Hello_Doc"."Ambulance"
      WHERE "Hello_Doc"."Ambulance"."Is_MICU"=TRUE;`
    );
    res.json(results.rows);

  }
  catch (err) {
    console.error(err.message);

  }

});
//if ambulance is available
app.get("/Hello_Doc/search/avail", async (req, res) => {
  try {
    const results = await pool.query(
      `SELECT * FROM "Hello_Doc"."Ambulance"
      WHERE "Hello_Doc"."Ambulance"."Availability"=TRUE;`
    );
    res.json(results.rows);

  }
  catch (err) {
    console.error(err.message);

  }

});

app.listen(5000, () => {
  console.log("Connected.");
});