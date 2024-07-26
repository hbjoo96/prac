const express = require('express') ;
const app = express() ;
const nunjucks = require('nunjucks')
const mainRouter = require('./routes/mainRouter') ;
const cookieRouter = require('./routes/cookie') ;
const sessionRouter = require('./routes/session') ;

// 패지말고 -> 메인 라우터를 맨위로 올려주자!
app.use('/', mainRouter) ;

// 쿠키 세팅
const cookieParser = require('cookie-parser') ;
app.use(cookieParser()) ;

// 세션 세팅
const session = require('express-session') ;
const fileStore = require('session-file-store')(session) ;
app.use(session({
    httpOnly : true, // http로 들어온 요청만 처리하겠다.
    resave : false, // 세션을 항상 재저장하겠냐!
    secret : "secret", // 암호화할때 사용하는 키값
    store : new fileStore(), // 세션을 저장하기 위한 저장소 세팅
    saveUninitialized : false // 세션에 저장할 내용이 없더라도 저장 여부!
}))

app.use('/cookie', cookieRouter) ;
app.use('/session', sessionRouter)

// 넌적스 세팅    
app.set('view engine', 'html') ;
nunjucks.configure('views', {
    express : app,
    watch : true
}) ;

app.listen(3000) ;