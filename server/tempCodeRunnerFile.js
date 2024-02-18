app.get("/Hello_Doc/:ID", async(req,res) =>
{
    try{
        const { ID } = req.params;
        const q =  await pool.query(
            'SELECT * FROM "Hello_Doc"."Patient" WHERE "ID" = $1',[ID]
        );

        console.log(q.rows);
        res.json(q.rows);

    }catch(err)
    {
        console.error(err.message);
    }
})
