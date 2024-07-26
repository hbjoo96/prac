const express = require("express") ;
const router = express.Router() ;

// 경로 수정을 도와주는 모듈
const path = require("path") ;
const file_path = path.join(__dirname, "../public") ;

router.get("/", (req, res)=>{
    res.sendFile(file_path+"/minormain.html") ;
})
router.get("/fishing", (req, res)=>{
    res.sendFile(file_path+"/fishing.html")
}) ;

module.exports = router ;