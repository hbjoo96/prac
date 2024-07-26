/*

    넌적스(템플릿 엔진)쓰는 이유?
    - HTML페이지는 정적인 페이지 (변화가 없는 페이지)
    - 사용자마다 각각 페이지를 만들어 주는건, 불가능!
    - 그러면 서버가 템플릿(페이지 1개)을 가지고, 페이지를 제작해라!
    - 템플릿 엔진 (nunjucks, ejs, pug 등등)
    - 넌적스 장점 : HTML코드에 JS코드를 더해서 사용한다!

    넌적스를 쓰기 위해서는?
    1) 설치 : npm i nunjucks, npm i nunjucks chokidar
    2) views폴더 생성 -> 동적인 HTML파일 생성
    
*/
const express = require("express") ;
const app = express() ;
const mainRouter = require("./routes/mainRouter") ;
const nunjucks = require("nunjucks") ;

// 라우터 등록
app.use("/", mainRouter) ;

// 1. 넌적스 세팅
// - 뷰엔진 설정, 넌적스 설정 코드는 반드시 필요하다! ★
app.set("view engine", "html") ;
// 2. 넌적스를 쓸 때 조회할 정보들0
nunjucks.configure("views", {
    express : app,
    warch : true
})


app.listen(3000) ;