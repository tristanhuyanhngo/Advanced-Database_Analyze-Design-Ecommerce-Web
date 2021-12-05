const express = require("express")
const bodyParser = require("body-parser");
const app = express(); 
app.use(bodyParser.json())

app.get("", (req, res) => {
    res.send("GROUP 6");
  });

require("./app/routers/concungRouter")(app);

app.listen(3000,()=>{
    console.log("app chay tai http://localhost:3000")
})