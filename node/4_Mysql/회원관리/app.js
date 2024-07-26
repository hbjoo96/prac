const express = require('express') ;
const app = express() ;
const nunjucks = require('nunjucks') ;
const bp = require('body-parser') ;
const mainRouter = require("./routes/mainRouter") ;
const userRouter = require("./routes/userRouter") ;
// 세션을 쓰기 위한 모듈 호출
const session = require("express-session") ;
const fileStore = require("session-file-store")(session) ;

// post 데이터 등록
app.use(bp.urlencoded({extended : true})) ;

// 세션 관련 설정 정보 등록!
app.use(session({
    httpOnly : true, // http로 들어온 요청만 처리하겠다.
    resave : false, // 세션을 항상 재저장 하겠다!
    secret : "secret", // 암호화 할때 사용하는 키 값
    store : new fileStore(), // 세션을 등록할 저장소
    saveUninitialized : false // 세션에 저장할 내용이 없더라도 저장하겠냐?
}))

// 라우터 등록
app.use("/", mainRouter) ;
app.use("/user", userRouter) ;

// 넌적스 세팅
app.set('view engine', 'html') ;
nunjucks.configure('views', {
    express : app,
    watch : true
}) ;

app.listen(3000) ;

// 다음 시간 예제 !
// DB연결정보를 활용해서 로그인, 정보수정, 회원가입, 조회 등등..