const express = require('express') ;
const router = express.Router() ;
const bp = require('body-parser') ;

router.use(bp.urlencoded({extended : true})) ;

// 메인으로 들어왔을때 처리
router.get("/", (req, res)=>{
    res.render('main') ;
}) ;

router.post('/login', (req, res)=>{
    if(req.body.id == "smhrd" && req.body.pw == "1234"){
        console.log("로그인 성공") ;
        res.render('succes', {id : req.body.id}) ;
    }else{
        console.log("로그인 실패") ;
        res.render('fail') ;
    }
})

module.exports = router ;