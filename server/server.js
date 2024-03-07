const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");

app.use(cors());
app.use(express.json());

// app.post('/Confirm_Order',async(req,res)=>{
//   try{
//     const {amb_id,user_id}=req.body;
//     console.log(amb_id);
//     console.log(user_id);
//     const q = await pool.query(
//       'UPDATE "Hello_Doc"."Order Ambulance" SET "Status"=$1 WHERE "Ambulance id"=$2 AND "user_id"=$3',[`Confirmed`,amb_id,user_id]
//     )
//     const r=await pool.query(
//       'DELETE FROM "Hello_Doc"."Order Ambulance" WHERE "Status"=$1 AND "user_id"=$2',['Pending',user_id]
//     )
//     const userLocationQuery = await pool.query(
//       'SELECT "Location" FROM "Hello_Doc"."User" WHERE "Reg. Number" = $1',
//       [user_id]
//     );
//     if (userLocationQuery.rows.length > 0) {
//       const userLocation = userLocationQuery.rows[0].Location;
//       await pool.query(
//         'UPDATE "Hello_Doc"."Ambulance" SET "Availability" = $1, "Current Location" = $2 WHERE "ID" = $3',
//         [false, userLocation, amb_id]
//     );
//     }
//     return res.json({success:1});
//   }
//   catch(err)
//   {
//     console.error(err);
//     return res.json({success:2});
//   }

// });
app.get('/pendingdriverreq', async (req, res) => {
  const Owner_ID = req.query['Owner_ID']; 
  const q = await pool.query('SELECT h1."Hospital Id" FROM "Hello_Doc"."Manage Hospital" h1 WHERE h1."Admin Id"=$1;', [Owner_ID]);
let hospital_id = q.rows[0]["Hospital Id"];;
  try {
    
    await pool.query('CALL "Hello_Doc".get_ambulance_req($1)', [hospital_id]);

    
    const result = await pool.query('SELECT * FROM temp_driver_request');

    
    console.log(result.rows);
    res.json(result.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' }); 
  }
});


app.post('/applyformoney', async (req, res) => {
  const { driverID,problem,cost,ambulanceId } = req.body;
  console.log(driverID);
  console.log(ambulanceId);
 console.log(req.body);
 try {
   const result = await pool.query(
     'INSERT INTO "Hello_Doc"."Driver request for money" ("Dri_id", "Problem", "Amount", "Amb_ID","Status") VALUES ($1, $2, $3, $4,$5) RETURNING *',
     [driverID,problem,cost,ambulanceId,"Ungranted"]
   );
  return res.json({success:0});
 } catch (err) {
   console.error(err);
   return res.json({ success: 4 });
 }
});

app.post('/Serve_Order', async (req, res) => {
  const { user_id, amb_id } = req.body;
  const client = await pool.connect();

  try {
    await client.query('BEGIN'); // Begin transaction

    // Update Order Ambulance Status
    await client.query(
      'UPDATE "Hello_Doc"."Order Ambulance" SET "Status" = $1 WHERE "Ambulance id" = $2 AND user_id = $3',
      ['Served', amb_id, user_id]
    );

    // Update Ambulance Availability
    await client.query(
      'UPDATE "Hello_Doc"."Ambulance" SET "Availability" = TRUE WHERE "ID" = $1',
      [amb_id]
    );

    // Get Price Per Hour from the Ambulance table
    const priceResult = await client.query(
      'SELECT "Price_per_hour" FROM "Hello_Doc"."Ambulance" WHERE "ID" = $1',
      [amb_id]
    );
    const price = priceResult.rows[0].Price_per_hour;

    // Deduct Price Per Hour from User Account
    await client.query(
      'UPDATE "Hello_Doc"."User_Account" SET "Balance" = "Balance" - $1 WHERE "User_id" = $2',
      [price, user_id]
    );

    // Add Price Per Hour to Driver Account
    await client.query(
      'UPDATE "Hello_Doc"."Driver_Account" SET "Balance" = "Balance" + $1 WHERE "Driver_id" IN (SELECT driver_id FROM "Hello_Doc"."Driver Info" WHERE ambulance_id = $2)',
      [price, amb_id]
    );

    await client.query('COMMIT'); // Commit transaction
    res.json({ success: 1 });
  } catch (err) {
    await client.query('ROLLBACK'); // Rollback transaction
    console.error(err.message);
    res.json({ success: 0, error: err.message });
  } finally {
    client.release(); // Release client back to the pool
  }
});


  app.post('/bookappointment', async (req, res) => {
    try {
      const { user_id, doctor_id,appointmentDate,appointmentTime } = req.body;
      
  
    } catch (err) {
      console.error(err);
      if (err.message.includes('User with id')) {
        return res.json({ success: 1 });
      } else {
        return res.json({ success: 4 });
      }
    }
  });

app.post('/Confirm_Order', async (req, res) => {
  try {
    const { amb_id, user_id } = req.body;
    const result = await pool.query(
      'SELECT * FROM confirm_order($1, $2)',
      [amb_id, user_id]
    );
    res.json(result.rows[0]);
  } catch (err) {
    console.error(err.message);
    res.json({ success: 2 });
  }
});



app.post('/Cancel_Order', async (req, res) => {
  try {
    const { amb_id, user_id } = req.body;

    const updateOrderQuery = `
      UPDATE "Hello_Doc"."Order Ambulance"
      SET "Status" = 'Declined'
      WHERE "Ambulance id" = $1 AND "user_id" = $2 AND "Status" = 'Pending';
    `;
    
    await pool.query(updateOrderQuery, [amb_id, user_id]);

    res.json({ success: 1, message: 'Order canceled.' });
  } catch (err) {
    console.error(err.message);
    res.status(500).json({ success: 0, message: 'An error occurred while canceling the order.' });
  }
});

//Ordered Or Served Ambulance Order Under An Ambulance
app.get("/OrederedAmb/:ID", async (req, res) => {
  try {
    console.log("Pending data");
    const { ID } = req.params;
    const q = await pool.query(
      `SELECT oa."Ambulance id", u."Reg. Number", u."Name", oa."Status", u."Location", u."Email"
      FROM "Hello_Doc"."User" AS u,
      (SELECT * FROM "Hello_Doc"."Order Ambulance" WHERE "Status" ='Confirmed' OR "Status" ='Served') AS oa,
      (SELECT * FROM "Hello_Doc"."Driver Info" WHERE "driver_id" = $1) AS di
      WHERE oa."user_id" = u."Reg. Number"
      AND oa."Ambulance id" = di."ambulance_id";
      
      `, [ID]
    );
    //console.log("req coming");
    console.log(q.rows);
    return res.json(q.rows);
  } catch (err) {
    console.error(err.message);
  }
})


///get All Ambulance  from Hospital id(Sub query)
app.get("/AmbulanceUnderHos/:ID", async (req, res) => {
  try {
    const { ID } = req.params;
    const q = await pool.query(
      'SELECT * FROM "Hello_Doc"."Ambulance" ' +
      'WHERE "ID" IN (' +
      'SELECT ambulance_id FROM "Hello_Doc"."Manage Ambulance" ' +
      'WHERE hos_id = $1)',
      [ID]
    );

    console.log(q.rows);
    res.json(q.rows);

  } catch (err) {
    console.error(err.message);
    res.status(500).send("Internal Server Error");
  }
});

app.get("/Hello_Doc/search/Alldoctor", async (req, res) => {
  try {
    console.log("req coming");
    const q = await pool.query(
      'SELECT * FROM "Hello_Doc"."Doctor"'
    );
    console.log(q.rows);
    return res.json(q.rows);

  } catch (err) {
    console.error(err.message);
  }
});
///get All Doctor  from Hospital id()
app.get("/DoctorUnderHos/:ID", async (req, res) => {
  try {
    const { ID } = req.params;
    const q = await pool.query(
      'SELECT * FROM "Hello_Doc"."Doctor" ' +
      'INNER JOIN "Hello_Doc"."Doctor Visit" ON "Hello_Doc"."Doctor"."doc_id" = "Hello_Doc"."Doctor Visit"."Doc_id" ' +
      'WHERE "Hello_Doc"."Doctor Visit"."hos_id" = $1',
      [ID]
    );

    console.log(q.rows);
    res.json(q.rows);

  } catch (err) {
    console.error(err.message);
    res.status(500).send("Internal Server Error");
  }
});

///get hospital Name from id
app.get("/HosName/:ID", async (req, res) => {
  try {
    const { ID } = req.params;
    const q = await pool.query(
      'SELECT hos_name FROM "Hello_Doc"."Hospital" WHERE "hos_id" = $1', [ID]
    );

    console.log(q.rows);
    res.json(q.rows);

  } catch (err) {
    console.error(err.message);
  }
})

app.post('/checkorder', async (req, res) => {
  try {
    const { user_id } = req.body;
    const q = await pool.query(
      'SELECT * FROM "Hello_Doc"."Order Ambulance" WHERE "user_id" = $1', [user_id]
    );
    if (q.rows.length > 0) {
      res.json({ success: 1 }); // User has already booked an ambulance
    } else {
      res.json({ success: 0 }); // User has not booked any ambulance
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: -1, message: "Failed to check order." }); // Error occurred while checking order
  }
});



app.post('/bookambulance', async (req, res) => {
  try {
    const { user_id, ambulance_id,location,emergency } = req.body;

    const lastIDFromQuery = await pool.query(
      'SELECT "ID" FROM "Hello_Doc"."Order Ambulance" ORDER BY "ID" DESC LIMIT 1'
    );
    let lastID = 0;
    if (lastIDFromQuery.rows.length > 0) {
      lastID = lastIDFromQuery.rows[0]["ID"];
    }
    const newID = lastID + 1;
    await pool.query(
      'INSERT INTO "Hello_Doc"."Order Ambulance" (user_id, "Ambulance id", "ID", "Status","Location","Emergency") VALUES ($1, $2, $3, $4,$5,$6)',
      [user_id, ambulance_id, newID, "Pending",location,emergency]
    );
    return res.json({ success: 3 }); // Move this line inside the try block
  } catch (err) {
    console.error(err);
    if (err.message.includes('User with id')) {
      return res.json({ success: 1 });
    } else {
      return res.json({ success: 4 });
    }
  }
});
//All the Hospital
//get all doctor info
app.get("/AllHospital", async (req, res) => {
  try {
    console.log("req coming");
    const q = await pool.query(
      'SELECT H2."hos_id", H2."hos_name", H2."Location", H2."email", H1."Rating" ' +
      'FROM "Hello_Doc"."Hos_Rating" H1 ' +
      'JOIN "Hello_Doc"."Hospital" H2 ON (H1."Hos_ID" = H2."hos_id")'
    );
    console.log(q.rows);
    return res.json(q.rows);

  } catch (err) {
    console.error(err.message);
  }
});

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
    const q = await pool.query('SELECT * FROM get_available_ambulances()');

    if (q.rowCount === 0) {
      console.log("No rows returned from stored function.");
    }

    console.log(q.rows);
    return res.json(q.rows);

  } catch (err) {
    console.error(err.message);
    res.status(500).send("Internal Server Error");
  }
});

//for Creating new Account
app.post("/Registration", async (req, res) => {
  try {
    console.log("Registration req coming");
    const { firstName, email, password, location } = req.body;
    const { "type": type } = req.headers;
    console.log(type)
    console.log(firstName, email, password, location);

    //for updating reg number automatically
    const lastRegNumberQuery = await pool.query(
      'SELECT "Reg. Number" FROM "Hello_Doc"."User" ORDER BY "Reg. Number" DESC LIMIT 1'
    );
    let lastRegNumber = 0;
    if (lastRegNumberQuery.rows.length > 0) {
      lastRegNumber = lastRegNumberQuery.rows[0]["Reg. Number"];
    }
    const newRegNumber = lastRegNumber + 1;

    const q = await pool.query(
      'INSERT INTO "Hello_Doc"."User" ("Reg. Number", "Name", "Email", "Password","Location") VALUES ($1, $2, $3, $4,$5) RETURNING *',
      [newRegNumber, firstName, email, password, location]);
    console.log(q.rows);
    if (q.rows.length === 0)
      return res.sendStatus(401);
    return res.sendStatus(200);
    // return res.json(q.rows);

  } catch (err) {
    console.error(err.message);
  }
})

//For login 
app.post("/login", async (req, res) => {
  try {
    console.log("log in req coming");
    const { firstName, password } = req.body;
    const { "type": type } = req.headers;
    console.log(type)
    console.log(firstName, password);
    const q = await pool.query(
      'SELECT * FROM "Hello_Doc"."User" where "Name" = $1 AND "Password"=$2;', [firstName, password]
    );
    console.log(q.rows);
    if (q.rows.length === 0)
      return res.sendStatus(401);
    //return res.sendStatus(200);
    return res.json(q.rows);

  } catch (err) {
    console.error(err.message);
  }
})
//Pending Ambulance Order Under An Ambulance
app.get("/Pending_AmbOrder/:ID", async (req, res) => {
  try {
    console.log("Pending data");
    const { ID } = req.params;
    const q = await pool.query(
      `SELECT "Hello_Doc"."Order Ambulance"."Ambulance id", "Hello_Doc"."User"."Reg. Number","Hello_Doc"."User"."Name", "Hello_Doc"."Order Ambulance"."Status","Hello_Doc"."User"."Location","Hello_Doc"."User"."Email"
      FROM "Hello_Doc"."Order Ambulance"
      JOIN "Hello_Doc"."Driver Info" ON "Hello_Doc"."Order Ambulance"."Ambulance id" = "Hello_Doc"."Driver Info"."ambulance_id"
      JOIN "Hello_Doc"."User" ON "Hello_Doc"."Order Ambulance"."user_id" = "Hello_Doc"."User"."Reg. Number"
      WHERE "Hello_Doc"."Driver Info"."driver_id" = $1 AND "Hello_Doc"."Order Ambulance"."Status" = 'Pending';`, [ID]
    );
    //console.log("req coming");
    console.log(q.rows);
    return res.json(q.rows);
  } catch (err) {
    console.error(err.message);
  }
});

//Ambulace driver log in
app.post("/login/Driver", async (req, res) => {
  try {
    console.log("log in req coming for driver");
    const {firstName,password} = req.body;
    console.log(firstName,password);
    const q = await pool.query(
      'SELECT * FROM "Hello_Doc"."Ambulance Driver" WHERE "driver_name" = $1 AND "contact" = $2',[firstName,password]
    );
    if(q.rows.length === 0)
    {
      return res.sendStatus(401);
    }

    const get_amb_id= await pool.query(
      'SELECT "ambulance_id" FROM "Hello_Doc"."Driver Info"  WHERE "driver_id"=$1',[q.rows[0]["driver_id"]]
    );
    
    const response = {
      ...q.rows[0],
      ambulance_id: get_amb_id.rows[0]["ambulance_id"]
    };
    console.log(response);

    return res.json(response);
  } catch (err) {
    console.error(err.message);
  }
})
//Hospital owner log in
app.post("/login/Hospital", async (req, res) => {
  try {
    console.log("log in req coming for Hospital Owner");
    const { firstName, password } = req.body;
    // const {"type":type} = req.headers;
    // console.log(type)
    //console.log("dsds");
    console.log(firstName, password);
    const q = await pool.query(
      'SELECT * FROM "Hello_Doc"."Hospital Admin" WHERE "Name" = $1 AND "Password" = $2', [firstName, password]
    );
    console.log(q.rows);
    if (q.rows.length === 0)
      return res.sendStatus(401);
    //return res.sendStatus(200);
    return res.json(q.rows);

  } catch (err) {
    console.error(err.message);
  }
})

//Admin log in
app.post("/login/Admin", async (req, res) => {
  try {
    console.log("log in req coming for Admin");
    const { firstName, password } = req.body;
    // const {"type":type} = req.headers;
    // console.log(type)
    //console.log("dsds");
    console.log(firstName, password);
    const q = await pool.query(
      'SELECT * FROM "Hello_Doc"."Admin" WHERE "Name" = $1 AND "Password" = $2', [firstName, password]
    );
    console.log(q.rows);
    if (q.rows.length === 0)
      return res.sendStatus(401);
    //return res.sendStatus(200);
    return res.json(q.rows);

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
      'SELECT * FROM "Hello_Doc"."Doctor" WHERE "doc_name" ILIKE $1', ['%' + name + '%']
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
//for driver login
app.post("/login/Driver", async (req, res) => { // Change to match the frontend endpoint
  try {
    console.log("log in req coming");
    const { firstName, password } = req.body;
    const q = await pool.query(
      'SELECT * FROM "Hello_Doc"."Ambulance Driver" WHERE "driver_name" = $1 AND "contact" = $2',
      [firstName, password]
    );
    console.log(q.rows);
    if (q.rows.length === 0)
      return res.sendStatus(401);
    return res.json(q.rows);
  } catch (err) {
    console.error(err.message);
  }
});

// Search for a hospital by name
app.get("/Hello_Doc/search/hospital/:name", async (req, res) => {
  try {
    const { name } = req.params;
    const results = await pool.query(
      'SELECT "Hello_Doc"."Doctor".doc_name, "Hello_Doc"."Doctor".email, "Hello_Doc"."Doctor".speciality, "Hello_Doc"."Doctor"."location" FROM "Hello_Doc"."Doctor" JOIN "Hello_Doc"."Doctor Visit" ON "Hello_Doc"."Doctor"."doc_id" = "Hello_Doc"."Doctor Visit"."Doc_id" JOIN "Hello_Doc"."Hospital" ON "Hello_Doc"."Doctor Visit"."hos_id" = "Hello_Doc"."Hospital"."hos_id" WHERE LOWER("Hello_Doc"."Hospital"."hos_name") LIKE LOWER($1)', ['%' + name + '%']
    );
    
    res.json(results.rows);
  } catch (err) {
    console.error(err.message);
  }
});

//Search Ambulance under a hospital
app.get("/Hospital_Home", async (req, res) => {
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

// CREATE OR REPLACE FUNCTION confirm_order(amb_id_param INT, user_id_param INT)
// RETURNS TABLE(success INT, message TEXT) AS $$
// DECLARE
//     existing_order_count INT;
// BEGIN
//     SELECT COUNT(*) INTO existing_order_count
//     FROM "Hello_Doc"."Order Ambulance"
//     WHERE "Status" = 'Confirmed' AND "user_id" = user_id_param;

//     IF existing_order_count > 0 THEN
//         success := 0;
//         message := 'You have already confirmed an order.';
//         RETURN QUERY SELECT success, message;
//     ELSE
//         UPDATE "Hello_Doc"."Order Ambulance"
//         SET "Status" = 'Confirmed'
//         WHERE "Ambulance id" = amb_id_param AND "user_id" = user_id_param;

//         -- ... rest of your code ...

//         success := 1;
//         message := 'Order confirmed.';
//         RETURN QUERY SELECT success, message;
//     END IF;
// EXCEPTION
//     WHEN OTHERS THEN
//         success := 2;
//         message := SQLERRM;
//         RETURN QUERY SELECT success, message;
// END; $$ LANGUAGE plpgsql;