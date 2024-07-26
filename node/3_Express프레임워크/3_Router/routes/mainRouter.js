// 서버에서 가장 기본이 되는 이정표! 
// router 변수에 express 안에 있는 router 기능만 넣어주기!
const express = require("express") ;
const router = express.Router() ;
// 경로 수정을 도와주는 모듈
const path = require("path") ;
const file_path = path.join(__dirname, "../public") ;

router.get("/", (req, res)=>{
    // main.html 파일을 보여주기!
    // __dirname -> 현재 작성중인 파일을 기준으로 절대경로를 생성
    res.sendFile(file_path+"/main.html")
}) ;

// 축구페이지 처리해주기!
router.get("/soccer", (req, res)=>{
    res.sendFile(file_path+"/soccer.html")
}) ;

// 야구페이지 처리해주기!
router.get("/baseball", (req, res)=>{
    res.sendFile(file_path+"/baseball.html")
}) ;


// 라우터를 제작하면 반드시 export해줄것!

module.exports = router ;