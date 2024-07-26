const express = require('express') ;
const app = express() ;
const nunjucks = require('nunjucks') ;
const mainRouter = require('./routes/mainRouter') ;

// app 세팅
app.set('view engine', 'html') ;
// 메인라우터 사용
app.use('/', mainRouter) ;

nunjucks.configure('views', {
    express : app,
    watch : true
}) ;

app.listen(3000) ;