const express = require("express") ;
const app = express() ;

app.use(express.static("public")) ;

app.get("/", (req, res)=>{
    console.log("서버 생성 완료!")
})
app.listen(3000)