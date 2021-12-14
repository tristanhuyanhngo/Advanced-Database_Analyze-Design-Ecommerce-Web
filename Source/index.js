const express = require("express")
const bodyParser = require("body-parser");
const app = express(); 
const cors = require("cors")
app.use(bodyParser.json())
app.use(cors())
app.get("", (req, res) => {
    res.send("GROUP 6");
  });

require("./app/routers/concungRouter")(app);

app.listen(3001,()=>{
    console.log("app chay tai http://localhost:3001")
})