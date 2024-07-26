const express  = require('express') ;
const app = express() ;
const nunjucks = require("nunjucks") ;
const mainRouter = require("./routes/mainRouter") ;
app.use("/", mainRouter) ;
app.set("view engine", 'html') ;
nunjucks.configure("views",{
    express : app, 
    watch : true
}) ;

app.listen(3000) ;